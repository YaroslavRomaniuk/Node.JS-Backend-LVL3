import mysql from 'mysql2/promise';
import dotenv from 'dotenv';
import fs from 'fs/promises';
import { RowDataPacket, FieldPacket } from 'mysql2/promise';

// Load environment variables from .env file
dotenv.config();

// Variable to hold the connection pool
let dbPool: mysql.Pool | undefined;

// Function to create a connection pool to the MySQL database
export const createMySQLPool = async (): Promise<void> => {
  try {
    if (!process.env.MYSQL_HOST || !process.env.MYSQL_USER || !process.env.MYSQL_PASSWORD || !process.env.MYSQL_DATABASE) {
      throw new Error('Please set all necessary environment variables');
    }

    dbPool = mysql.createPool({
      host: process.env.MYSQL_HOST,
      user: process.env.MYSQL_USER,
      password: process.env.MYSQL_PASSWORD,
      database: process.env.MYSQL_DATABASE,
      multipleStatements: true, // Enable support for multiple statements
      waitForConnections: true,
      connectionLimit: 10,
      queueLimit: 0,
    });

    console.log("!!! MySQL Pool Created !!!");
  } catch (err) {
    console.error('Error creating MySQL pool:', err);
    throw err;
  }
};

// Function to get a connection from the pool
export const getPoolConnection = async (): Promise<mysql.PoolConnection> => {
  if (!dbPool) {
    await createMySQLPool();
  }
  return dbPool!.getConnection(); // The '!' operator tells TypeScript that dbPool will not be undefined here
};

// Function to set up the database
export const setupDatabase = async (): Promise<void> => {
  let connection: mysql.PoolConnection | undefined;
  try {
    connection = await getPoolConnection();

    const data = await fs.readFile('./src/services/mysql/sql/init.sql', 'utf8');
    await connection.query(data);

    const [rows]: [RowDataPacket[], FieldPacket[]] = await connection.execute<RowDataPacket[]>('SELECT initialized FROM DB_Initialization LIMIT 1');
    
    // Check if the row exists and the initialized column is TRUE
    if (rows.length > 0 && rows[0].initialized === 1) {
      console.log("Database is already initialized.");
    } else {
      console.log("Database is not initialized.");

      const dataBooks = await fs.readFile('./src/services/mysql/sql/books.sql', 'utf8');
      await connection.query(dataBooks);
      
      console.log('Tables have been created successfully.');
    }

    await connection.execute('UPDATE db_initialization SET initialized = TRUE WHERE id = 1');
  } catch (err) {
    console.error('An error occurred during database setup:', err);
    throw err;
  } finally {
    if (connection) {
      connection.release(); // Release the connection back to the pool
    }
  }
};

// Function to perform the initial database setup
export const initialDBSetup = async (): Promise<void> => {
  let connection;
  try {
    connection = await mysql.createConnection({
      host: process.env.MYSQL_HOST,
      user: process.env.MYSQL_USER,
      password: process.env.MYSQL_PASSWORD
    });
    await connection.query(`CREATE DATABASE IF NOT EXISTS ${process.env.MYSQL_DATABASE}`);
    console.log('Database is created.');
  } catch (err) {
    console.error('An error occurred during initial DB setup:', err);
    throw err;
  } finally {
    if (connection) {
      await connection.end(); // Close the connection
    }
  }
};
