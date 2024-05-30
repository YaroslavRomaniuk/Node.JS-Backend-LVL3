import { getPoolConnection } from '../services/mysql/db/db';
import queries from './queriesSQL';
import { RowDataPacket, PoolConnection } from 'mysql2/promise';

export interface Author {
    author_name: string;
}

export interface BookDetails {
    book_title: string;
    book_year: number;
    pages_quantity: number;
    isbn: string;
    book_description: string;
    image: string;
}

class BookModel {

    /**
     * Retrieves books with a limit and offset.
     * @param offset - The offset for pagination.
     * @param connectionPool - The database connection pool.
     * @returns A promise that resolves to an array of book rows.
     */
    static async getAllBooksLimit(offset: number, connectionPool: PoolConnection): Promise<RowDataPacket[]> {
        try {
            // Execute the query to get books with a limit and offset
            const [bookRows] = await connectionPool.query<RowDataPacket[]>(queries.books.getAllLimit, [offset]);
            // Return the retrieved book rows
            return bookRows;
        } catch (error) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error fetching books with limit:', error);
            throw error;
        }
    }

    /**
     * Retrieves books with a limit, offset, and sorting options.
     * @param offset - The offset for pagination.
     * @param connectionPool - The database connection pool.
     * @param sortBy - The column to sort by.
     * @param sortOrder - The order to sort by (ASC or DESC).
     * @returns A promise that resolves to an array of book rows.
     */
    static async getAllBooksSortedLimit(
        offset: number,
        connectionPool: PoolConnection,
        sortBy: string,
        sortOrder: string
    ): Promise<RowDataPacket[]> {
        try {
            // Construct the query by replacing the placeholders with the sort parameters
            let booksQuery = queries.books.getAllSortedLimit.replace('?? ??', `${sortBy} ${sortOrder}`);

            // Execute the query to get books with sorting and pagination
            const [bookRows] = await connectionPool.query<RowDataPacket[]>(booksQuery, [offset]);
            // Return the retrieved book rows
            return bookRows;
        } catch (error) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error fetching sorted books with limit:', error);
            throw error;
        }
    }


    /**
     * Retrieves books with a limit and offset for pagination.
     * @param limit - The number of books to retrieve.
     * @param offset - The offset for pagination.
     * @param connectionPool - The database connection pool.
     * @returns A promise that resolves to an array of book rows.
     */
    static async getAllBooksLimitOffset(
        limit: number,
        offset: number,
        connectionPool: PoolConnection
    ): Promise<RowDataPacket[]> {
        try {
            // Execute the query to get books with a limit and offset
            const [bookRows] = await connectionPool.query<RowDataPacket[]>(queries.books.getAllLimitOffset, [limit, offset]);
            // Return the retrieved book rows
            return bookRows;
        } catch (error) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error fetching books with limit and offset:', error);
            throw error;
        }
    }



    /**
     * Searches for books based on a search term.
     * @param search - The search term to use for finding books.
     * @param connectionPool - The database connection pool.
     * @returns A promise that resolves to an array of book rows.
     */
    static async getAllBooksSearch(
        search: string,
        connectionPool: PoolConnection
    ): Promise<RowDataPacket[]> {
        try {
            // Execute the query to search for books
            const [bookRows] = await connectionPool.query<RowDataPacket[]>(queries.books.getAllSearch, [search]);
            // Return the retrieved book rows
            return bookRows;
        } catch (error) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error searching for books:', error);
            throw error;
        }
    }

    /**
     * Retrieves the total quantity of books that are not marked as deleted.
     * @returns A promise that resolves to the total number of books.
     */
    static async getBooksQuantity(): Promise<number> {
        let connectionPool: PoolConnection | undefined;
        try {
            // Get a connection from the pool
            connectionPool = await getPoolConnection();
            // Execute the query to get the total number of books
            const [rows] = await connectionPool.query<RowDataPacket[]>(
                queries.books.getBooksQuantity
            );
            // Extract the total number of books from the result
            const totalBooks: number = rows[0].totalBooks;
            return totalBooks;
        } catch (error) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error fetching total book quantity:', error);
            throw error;
        } finally {
            // Ensure the connection is released back to the pool
            if (connectionPool) {
                connectionPool.release();
            }
        }
    }

    /**
     * Increments the click count for a given book by its ID.
     * @param book_id - The ID of the book whose click count is to be incremented.
     * @returns A promise that resolves when the click count has been successfully incremented.
     */
    static async clickCountPlus(book_id: string): Promise<void> {
        let connectionPool: PoolConnection | undefined;
        try {
            // Get a connection from the pool
            connectionPool = await getPoolConnection();
            // Execute the query to increment the click count for the given book ID
            await connectionPool.execute(queries.books.clickCountPlus, [book_id]);
        } catch (err) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error updating click count:', err);
            throw err;
        } finally {
            // Ensure the connection is released back to the pool
            if (connectionPool) {
                connectionPool.release();
            }
        }
    }

    /**
     * Increments the view count for a given book by its ID.
     * @param book_id - The ID of the book whose view count is to be incremented.
     * @returns A promise that resolves when the view count has been successfully incremented.
     */
    static async viewCountPlus(book_id: string): Promise<void> {
        let connectionPool;
        try {
            // Get a connection from the pool
            connectionPool = await getPoolConnection();
            // Execute the query to increment the view count for the given book ID
            await connectionPool.execute(queries.books.viewCountPlus, [book_id]);
        } catch (err) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error updating view count:', err);
            throw err;
        } finally {
            // Ensure the connection is released back to the pool
            if (connectionPool) {
                connectionPool.release();
            }
        }
    }


    /**
     * Retrieves a book by its ID.
     * @param book_id - The ID of the book to be retrieved.
     * @param connectionPool - The database connection pool.
     * @returns A promise that resolves to an array of book rows.
     */
    static async getBookByID(book_id: string, connectionPool: PoolConnection): Promise<RowDataPacket[][]> {
        try {
            // Execute the query to get the book by its ID
            const [bookRows] = await connectionPool.query<RowDataPacket[][]>(queries.books.getById, [book_id]);
            // Return the retrieved book rows
            return bookRows;
        } catch (error) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error fetching book by ID:', error);
            throw error;
        }
    }

    /**
     * Retrieves the author(s) of a book by the book's ID.
     * @param book_id - The ID of the book whose author(s) are to be retrieved.
     * @param connectionPool - The database connection pool.
     * @returns A promise that resolves to an array of author rows.
     */
    static async getAuthorName(book_id: string, connectionPool: PoolConnection): Promise<RowDataPacket[]> {
        try {
            // Execute the query to get the author(s) by the book's ID
            const [authorRows] = await connectionPool.query<RowDataPacket[]>(queries.bookAuthors.getByBookId, [book_id]);
            // Return the retrieved author rows
            return authorRows;
        } catch (error) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error fetching author name by book ID:', error);
            throw error;
        }
    }


    /**
     * Joins the names of authors into a single string, separated by commas.
     * @param authors - An array of authors.
     * @returns A string of author names separated by commas.
     */
    static joinAuthorNames(authors: Author[]): string {
        // Map the array of authors to their names and join them with a comma
        return authors.map(author => author.author_name).join(', ');
    }


    /**
     * Fetches and processes books using a provided function.
     * @param fetchBooksFunc - A function to fetch books from the database.
     * @returns A promise that resolves to an array of processed book information.
     */
    static async fetchAndProcessBooks(fetchBooksFunc: (connectionPool: PoolConnection) => Promise<RowDataPacket[]>): Promise<any[]> {
        const connectionPool = await getPoolConnection();
        try {
            // Fetch the book rows using the provided function
            const bookRows = await fetchBooksFunc(connectionPool);

            let booksInfo = [];
            // Process each book row
            for (let book of bookRows) {
                let jsonBook = JSON.parse(JSON.stringify(book));
                // Fetch author names for the current book
                const authorRows = await BookModel.getAuthorName(jsonBook.book_id, connectionPool);
                // Join author names into a single string
                let author_name = BookModel.joinAuthorNames(authorRows as RowDataPacket[] as Author[]);
                // Combine book information with author names
                let bookInfo = { ...book, author_name };
                booksInfo.push(bookInfo);
            }
            // Return the processed book information
            return booksInfo;
        } catch (error) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error fetching and processing books:', error);
            throw error;
        } finally {
            // Ensure the connection is released back to the pool
            connectionPool.release();
        }
    }



    /**
     * Fetches and processes a single book by its ID.
     * @param book_id - The ID of the book to be fetched.
     * @returns A promise that resolves to the processed book information.
     */
    static async fetchAndProcessOneBook(book_id: string): Promise<any> {
        let connectionPool;
        try {
            // Get a connection from the pool
            connectionPool = await getPoolConnection();

            // Fetch the book rows by book ID
            const bookRows = await BookModel.getBookByID(book_id, connectionPool);

            // Fetch the author names for the book
            const authorRows = await BookModel.getAuthorName(book_id, connectionPool);

            // Process the book and author information
            let book = bookRows[0];
            let author_name = BookModel.joinAuthorNames(authorRows as RowDataPacket[] as Author[]);

            // Combine book information with author names
            let bookInfo = { ...book, author_name };

            // Return the processed book information
            return bookInfo;
        } catch (error) {
            // Log the error and re-throw it for the calling function to handle
            console.error('Error fetching and processing book:', error);
            throw error;
        } finally {
            // Ensure the connection is released back to the pool
            if (connectionPool) {
                connectionPool.release();
            }
        }
    }


}

export default BookModel;
