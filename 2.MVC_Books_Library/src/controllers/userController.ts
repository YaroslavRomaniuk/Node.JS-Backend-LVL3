import BookModel from '../model/bookModel';
import { Request, Response } from 'express';

export class userController {

    // Method to show the books page with pagination and sorting
    static async showBooksPage(req: Request, res: Response) {
        try {
            // Set initial offset and limit for pagination
            let offset = Number(req.query.offset) || 20;
            let currentOffset = Number(req.query.offset) || 20;
            let limit = 10;
            offset = Math.max(offset, 20);

            // Get the total number of books
            const totalBooks: number = await BookModel.getBooksQuantity();

            // Determine sorting parameters
            let sortBy = (req.query.sortBy as string) || 'book_id';
            const allowedSortBy = ['click_count', 'book_year'];
            if (!allowedSortBy.includes(sortBy)) {
                sortBy = 'book_id';
            }

            // Set default sort order and adjust for click count
            let sortOrder = 'ASC';
            if (sortBy === 'click_count') {
                sortOrder = 'DESC';
            }

            // Fetch books with sorting and pagination
            const booksInfo = await BookModel.fetchAndProcessBooks(connectionPool => 
                BookModel.getAllBooksSortedLimit(offset, connectionPool, sortBy, sortOrder)
            );

            // Render the books page if books are found, otherwise send 404
            if (booksInfo.length > 0) {
                res.render('books-page', {
                    books: booksInfo,
                    nextOffset: offset + limit,
                    prevOffset: Math.max(0, offset - limit),
                    offset: currentOffset,
                    totalBooks: totalBooks,
                    sortBy: sortBy
                });
            } else {
                res.status(404).send('No books found');
            }
        } catch (error) {
            console.error('Error showing books page:', error);
            res.status(500).send('Internal Server Error');
        }
    }
    
    // Method to show a single book's details by ID
    static async showBookPageByID(req: Request, res: Response) {
        try {
            // Fetch the book details and increment the view count
            const bookInfo = await BookModel.fetchAndProcessOneBook(req.params.id);
            await BookModel.viewCountPlus(req.params.id);

            // Render the book page if the book is found, otherwise send 404
            if (bookInfo) {
                res.render('book-page', { book: bookInfo });
            } else {
                res.status(404).send('Book not found');
            }
        } catch (error) {
            console.error(`Error fetching book with ID ${req.params.id}:`, error);
            res.status(500).send('Internal Server Error');
        }
    }

    // Method to show search results for books
    static async showSearchResult(req: Request, res: Response) {
        try {
            // Get the search term from the query and format it for SQL LIKE
            const searchTerm = `%${req.query.term}%`;

            // Fetch books that match the search term
            const booksInfo = await BookModel.fetchAndProcessBooks(connectionPool => 
                BookModel.getAllBooksSearch(searchTerm, connectionPool)
            );

            // Render the books page if books are found, otherwise send 404
            if (booksInfo.length > 0) {
                res.render('books-page', {
                    books: booksInfo,
                    offset: false
                });
            } else {
                res.status(404).send('No books found');
            }
        } catch (error) {
            console.error(`Error searching for term ${req.query.term}:`, error);
            res.status(500).send('Internal Server Error');
        }
    }

    // Method to increment the click count for a book
    static async incrementClickCount(req: Request, res: Response) {
        try {
            // Increment the click count for the specified book ID
            await BookModel.clickCountPlus(req.params.id);
            res.status(200).send('Click count incremented.');
        } catch (error) {
            console.error(`Error incrementing click count for book ID ${req.params.id}:`, error);
            res.status(500).send('Internal Server Error');
        }
    }
}

export default userController;
