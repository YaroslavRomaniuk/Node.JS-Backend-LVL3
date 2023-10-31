import express from 'express';
import mySQLConnection from './../mysql/db/mySQLConnection';
import dotenv from 'dotenv';


dotenv.config();

const app = express();
app.use(express.static('./static/books/books-page', { index: 'books-page.html' })); 
app.use(express.json());


app.get('/', (req, res) => {
    res.send('Hello, welcome to my website!');
});

mySQLConnection(app);

