import { getPoolConnection } from '../services/mysql/db/db';
import queries from './queriesSQL';
import { ResultSetHeader } from 'mysql2/promise';
import { BookDetails } from '../model/bookModel';
import { RowDataPacket } from 'mysql2/promise';

class AdminModel {

    /**
     * Adds a new book to the database.
     * @param bookDetails - The details of the book to be added.
     * @returns The ID of the newly inserted book.
     */
    static async addBook(bookDetails: BookDetails) {
        const { book_title, book_year, pages_quantity, isbn, book_description, image } = bookDetails;

        let connectionPool;
        try {
            // Get a connection from the pool
            connectionPool = await getPoolConnection();
            // Execute the insert query
            const [result] = await connectionPool.execute<ResultSetHeader>(
                queries.books.insert,
                [book_title, book_year, pages_quantity, isbn, book_description, image]
            );
            // Return the ID of the newly inserted book
            return result.insertId;
        } catch (err) {
            console.error('Error adding book:', err);
            throw err; // Re-throw the error to be handled by the calling function
        } finally {
            // Ensure the connection is released back to the pool
            if (connectionPool) {
                connectionPool.release();
            }
        }
    }

    /**
     * Adds a new author to the database.
     * @param author_name - The name of the author to be added.
     * @returns The ID of the newly inserted author as a string.
     */
    static async addAuthor(author_name: string) {
        let connectionPool;
        try {
            // Get a connection from the pool
            connectionPool = await getPoolConnection();
            // Execute the insert query
            const [result] = await connectionPool.execute<ResultSetHeader>(
                queries.authors.insert,
                [author_name]
            );
            // Return the ID of the newly inserted author as a string
            return result.insertId.toString();
        } catch (err) {
            console.error('Error adding author:', err);
            throw err; // Re-throw the error to be handled by the calling function
        } finally {
            // Ensure the connection is released back to the pool
            if (connectionPool) {
                connectionPool.release();
            }
        }
    }

    /**
     * Adds a connection between a book and an author in the database.
     * @param author_id - The ID of the author.
     * @param book_id - The ID of the book.
     */
    static async addAuthorConnection(author_id: string, book_id: number) {
        let connectionPool;
        try {
            // Get a connection from the pool
            connectionPool = await getPoolConnection();
            // Execute the insert query for the author-book connection
            await connectionPool.execute(queries.bookAuthors.insert, [book_id, author_id]);
        } catch (err) {
            console.error('Error adding author connection:', err);
            throw err; // Re-throw the error to be handled by the calling function
        } finally {
            // Ensure the connection is released back to the pool
            if (connectionPool) {
                connectionPool.release();
            }
        }
    }

    /**
     * Marks a book as deleted by updating its delete time in the database.
     * @param book_id - The ID of the book to be deleted.
     */
    static async deleteBookByID(book_id: string) {
        let connectionPool;
        try {
            // Get a connection from the pool
            connectionPool = await getPoolConnection();
            // Execute the query to update the delete time for the book
            await connectionPool.query<RowDataPacket[]>(queries.books.updateDeleteTime, [book_id]);
        } catch (error) {
            console.error('Error during book deletion:', error);
            throw error; // Re-throw the error to be handled by the calling function
        } finally {
            // Ensure the connection is released back to the pool
            if (connectionPool) {
                connectionPool.release();
            }
        }
    }

    /**
     * Finds an author by name in the database.
     * @param author_name - The name of the author to be found.
     * @returns The rows containing the author details.
     */
    static async findAuthorByName(author_name: string) {
        let connectionPool;
        try {
            // Get a connection from the pool
            connectionPool = await getPoolConnection();
            // Execute the query to find the author by name
            const [rows] = await connectionPool.execute<RowDataPacket[]>(queries.authors.findByName, [author_name]);
            // Return the retrieved rows
            return rows;
        } catch (err) {
            console.error('Error finding author by name:', err);
            throw err; // Re-throw the error to be handled by the calling function
        } finally {
            // Ensure the connection is released back to the pool
            if (connectionPool) {
                connectionPool.release();
            }
        }
    }

}

export default AdminModel;
