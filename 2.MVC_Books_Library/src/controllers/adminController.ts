import BookModel from '../model/bookModel';
import UserModel from '../model/bookModel';
import AdminModel from './../model/adminModel';
import { Request, Response } from 'express';

export class AdminController {

    // Function to show the admin books page with pagination
    static async showAdminBooksPage(req: Request, res: Response) {
        try {
            let currentPage: number = Number(req.query.page) || 1;
            const totalBooks: number = await UserModel.getBooksQuantity();
            const limit: number = 10;
            const pages: number = Math.ceil(totalBooks / limit);
            let offset: number = (currentPage - 1) * limit;

            // Fetch books with pagination
            const booksInfo = await BookModel.fetchAndProcessBooks(connectionPool => BookModel.getAllBooksLimitOffset(limit, offset, connectionPool));

            if (booksInfo.length > 0) {
                res.render('admin', {
                    books: booksInfo,
                    totalPages: pages,
                    currentPage: currentPage
                });
            } else {
                res.status(404).send('No books found');
            }
        } catch (error) {
            console.error('Error fetching books:', error);
            res.status(500).send('Internal Server Error');
        }
    }

    // Function to add a new book along with its authors
    static async addBook(req: Request, res: Response) {
        try {
            let imagePath = '/images_and_styles/images/default_image.jpg';
            if (req.file) {
                console.log('Uploaded file details:', req.file); // Debugging: log uploaded file details

                // Accessing file name and path
                const imageName = req.file.filename;
                console.log('Image name:', imageName);
                imagePath = (req.file.destination + "/" + req.file.filename).replace('public', '.');
                console.log('Image path:', imagePath);
            }

            // Default values for book information
            const defaultValues = {
                book_title: 'Unknown Title',
                book_year: 2000,
                pages_quantity: 100,
                isbn: '000-0-00-000000-0',
                book_description: 'No description available.',
                image: imagePath,
            };

            // Merge provided values with default values
            const bookDetails = {
                book_title: req.body.book_title || defaultValues.book_title,
                book_year: req.body.book_year || defaultValues.book_year,
                pages_quantity: req.body.pages_quantity || defaultValues.pages_quantity,
                isbn: req.body.isbn || defaultValues.isbn,
                book_description: req.body.book_description || defaultValues.book_description,
                image: imagePath || defaultValues.image,
            };

            // Add the book to the database
            const book_id = await AdminModel.addBook(bookDetails);

            // Handle authors
            const authorNames = req.body.author_name.filter((name: string) => name.trim() !== '');
            for (const authorName of authorNames) {
                let author_id;

                // Check if the author already exists
                const existingAuthors = await AdminModel.findAuthorByName(authorName);
                if (existingAuthors.length > 0) {
                    author_id = existingAuthors[0].author_id;
                } else {
                    // Add the new author
                    author_id = await AdminModel.addAuthor(authorName);
                }

                // Add the author-book connection
                await AdminModel.addAuthorConnection(author_id, book_id);
            }

            res.send("ok");
        } catch (error) {
            console.error('Error adding book:', error);
            res.status(500).json({ error: 'Failed to add book' });
        }
    }

    // Function to delete a book and its references
    static async deleteBookAndReferences(req: Request, res: Response) {
        try {
            await AdminModel.deleteBookByID(req.params.id);
            res.send(`Book ${req.params.id} is deleted`);
        } catch (error) {
            console.error(`Error deleting book ${req.params.id}:`, error);
            res.status(500).send(`Failed to delete book ${req.params.id}`);
        }
    }

    // Function to handle logout
    static async logout(req: Request, res: Response) {
        res.status(401).render('logout');
    }

}

export default AdminController;
