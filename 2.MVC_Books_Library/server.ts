import express from 'express';
import mySQLConnection from './mysql/db/mySQLConnection';
import { setupDatabase } from './mysql/db/db';
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

server.get('/books', (req, res) => {
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
            if(book) {
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



