import express from 'express';
import mySQLConnection from './mysql/db/mySQLConnection';
import { setupDatabase, getDBMySQL } from './mysql/db/db';
import dotenv from 'dotenv';
import fs from 'fs';
import path from 'path';


dotenv.config();

const server = express();
server.set('view engine', 'ejs');
server.set('views', path.join(__dirname, 'views'));
server.use(express.static(path.join(__dirname, "static")));
server.use(express.json());


server.get('/qqq', (req, res) => {
    console.log("buuuubaaa")
    const booksFilePath = './views/books.json';
    fs.readFile(booksFilePath, 'utf8', (err, data) => {
        if (err) {
            console.error("Error reading file: ", err);
            res.status(500).send("Error reading file");
        } else {
            const books = JSON.parse(data);
            res.render('books', { books: books });
        }
    });
});




interface Book {

    id: number;

    title: string;

    author: string;

    year: string;

    image: string;

    pages: string;

    isbn: string;

    about: string;

}

server.get('/', (req, res) => {
    const booksFilePath = './views/books-page.json';
    fs.readFile(booksFilePath, 'utf8', (err, data) => {
        if (err) {
            console.error("Error reading file: ", err);
            res.status(500).send("Error reading file");
        } else {
            const books = JSON.parse(data);
            res.render('books-page', { books: books });
        }
    });
});


server.get('/book/:id', (req, res) => {
    const booksFilePath = './views/books-page.json';
    fs.readFile(booksFilePath, 'utf8', (err, data) => {
        if (err) {
            console.error("Error reading file: ", err);
            res.status(500).send("Error reading file");
        } else {
            const books = JSON.parse(data);
            let book: Book | undefined = books.find((book: Book) => book.id === Number(req.params.id));
            if (book) {
                res.render('book-page', { book: book });
            } else {
                res.status(404).send("Book not found");
            }
        }
    });
});


server.get('/admin', (req, res) => {
    const booksFilePath = './views/books-page.json';
    fs.readFile(booksFilePath, 'utf8', (err, data) => {
        if (err) {
            console.error("Error reading file: ", err);
            res.status(500).send("Error reading file");
        } else {
            const books = JSON.parse(data);
            res.render('admin', { books: books });
        }
    });
});

mySQLConnection(server);
setupDatabase();



/** 
// DB books load

async function main() {
    // Connect to the database.
    const connection = getDBMySQL();

    // Read the JSON file.
    const data: string = fs.readFileSync('books.json', 'utf8');

    // Parse the JSON data.
    const books: any[] = JSON.parse(data);

    // For each book...
    for (const book of books) {
        // Check if the book already exists in the database.
        const [rows] = await connection.execute(
            'SELECT * FROM Books WHERE book_id = ?',
            [book.id]
        );

        // If the book doesn't exist...
        if (rows.length === 0) {
            // Insert the book into the database.
            await connection.execute(
                'INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
                [book.id, book.title, book.year, book.pages, book.isbn, book.description, book.image, book.is_deleted]
            );

            // Assuming the "author" field contains a single author name.
            // If the "author" field can contain multiple author names, you'll need to split it and insert each author separately.
            const [authorRow] = await connection.execute(
                'SELECT * FROM Authors WHERE author_name = ?',
                [book.author]
            );

            let authorId: number;

            if (authorRow.length === 0) {
                const [result] = await connection.execute(
                    'INSERT INTO Authors (author_name) VALUES (?)',
                    [book.author]
                );

                authorId = result.insertId;
            } else {
                authorId = authorRow[0].author_id;
            }

            // Insert the relationship into the Book_Author table.
            await connection.execute(
                'INSERT INTO Book_Author (book_id, author_id) VALUES (?, ?)',
                [book.id, authorId]
            );
        }
    }

    // Close the connection.
    await connection.end();
}

main();
*/



// Read the JSON file.
const data = fs.readFileSync('books.json', 'utf8');

// Parse the JSON data.
const books = JSON.parse(data);

// Start the SQL script with a command to use the correct database.
let sql = 'USE mvc_library;\n';

// For each book...
for (const book of books) {
    // Create an INSERT statement for the Books table.
    sql += `INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)\n`;
    sql += `VALUES (${book.id}, '${book.title}', ${book.year}, ${book.pages}, '${book.isbn}', '${book.description.replace(/'/g, "''")}', '${book.image}', ${book.is_deleted});\n`

    // Create an INSERT statement for the Authors table. 
    // This assumes the author does not already exist in the table.
    // If the author might exist already, you would need to handle this differently.
    sql += `INSERT INTO Authors (author_name)\n`;
    sql += `VALUES ('${book.author.replace(/'/g, "''")}');\n`

    // Get the last inserted author_id.
    sql += `SET @last_author_id = LAST_INSERT_ID();\n`;

    // Create an INSERT statement for the Book_Author table.
    sql += `INSERT INTO Book_Author (book_id, author_id)\n`;
    sql += `VALUES (${book.id}, @last_author_id);\n\n`
}

// Write the SQL script to a file.
fs.writeFileSync('books.sql', sql);

