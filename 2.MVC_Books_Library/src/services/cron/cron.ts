import cron from 'node-cron';
import queries from '../../model/queriesSQL';
import { exec } from 'child_process';
import { getPoolConnection } from '../../services/mysql/db/db';
import { RowDataPacket } from 'mysql2/promise';

/**
 * Schedule a cron job to perform a database backup every 2 hours.
 */
cron.schedule('0 0 * * *', () => {
  // Destructure necessary environment variables
  const { MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE } = process.env;

  // Check if required environment variables are set
  if (!MYSQL_USER || !MYSQL_PASSWORD || !MYSQL_DATABASE) {
    console.error('Missing necessary environment variables for database backup.');
    return;
  }

  // Construct the mysqldump command
  const dumpCommand = `mysqldump -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} > src/services/mysql/backup/backup.sql`;

  // Execute the mysqldump command
  exec(dumpCommand, (error, stdout, stderr) => {
    if (error) {
      console.error(`Backup Error: ${error.message}`);
      return;
    }

    if (stderr) {
      console.error(`Backup STDERR: ${stderr}`);
      return;
    }

    console.log('Backup successful');
  });
});

  


/**
 * Schedule a cron job to delete old books every hour.
 */
cron.schedule('0 0 * * *', async () => {
  const connectionPool = await getPoolConnection();
  
  try {
      // Start a transaction
      await connectionPool.query(queries.service.startTransaction);

      // Fetch the books to be deleted
      const [result] = await connectionPool.query<RowDataPacket[]>(queries.books.findDeletedBooks);
      const deletedBooks = result as RowDataPacket[];
      
      if (deletedBooks.length === 0) {
          console.log('No books to delete.');
          return;
      }

      const bookIds = deletedBooks.map(book => book.book_id);
      const placeholders = bookIds.map(() => '?').join(', ');

      const queryDeleteBookReferences = queries.books.deleteBookReferences.replace('?', placeholders);
      const queryDeleteBooks = queries.books.deleteBooks.replace('?', placeholders);

      // Delete book references and books
      await connectionPool.query(queryDeleteBookReferences, bookIds);
      await connectionPool.query(queryDeleteBooks, bookIds);

      // Commit the transaction
      await connectionPool.query(queries.service.commit);

      console.log(`Deleted books with IDs: ${bookIds.join(', ')}`);
  } catch (error) {
      // Rollback the transaction in case of an error
      await connectionPool.query(queries.service.rollback);
      console.error('Error during scheduled task:', error);
  } finally {
      // Ensure the connection is released back to the pool
      connectionPool.release();
  }
});