import express from 'express';
//import mySQLConnection from './mysql/db/mySQLConnection';
//import {setupDatabase} from './mysql/db/db';
import dotenv from 'dotenv';
import fs from 'fs';
import path from 'path';


dotenv.config();

const server = express();
server.set('view engine', 'ejs');
server.set('views', path.join(__dirname, 'src/views'));

console.log(path.join(__dirname, 'src/views'))
//server.use(express.static('./static/books/books-page', { index: 'books-page.html' })); 
server.use('/books-page_files', express.static(path.join(__dirname, 'src/views/books-page_files')));
server.use('/book-page_files', express.static(path.join(__dirname, 'src/views/book-page_files')));
console.log(path.join(__dirname, 'src/views/books-page_files'));
console.log(__dirname)
server.use(express.json());


server.get('/qqq', (req, res) => {
    console.log("buuuubaaa")
    const booksFilePath = './src/views/books.json';
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


server.get('/books', (req, res) => {
    //console.log("buuuubaaa")
    const booksFilePath = './src/views/books-page.json';
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

server.get('/book', (req, res) => {
    //console.log("buuuubaaa")
    const booksFilePath = './src/views/book-page.json';
    fs.readFile(booksFilePath, 'utf8', (err, data) => {
        if (err) {
            console.error("Error reading file: ", err);
            res.status(500).send("Error reading file");
        } else {
            const books = JSON.parse(data);
            res.render('book-page', { books: books });
        }
    });
});

//mySQLConnection(server);
//setupDatabase();



