import express from 'express';
import mySQLConnection from '../mysql/db/mySQLConnection';
import {setupDatabase} from '../mysql/db/db';
import dotenv from 'dotenv';


dotenv.config();

const server = express();
server.use(express.static('./static/books/books-page', { index: 'books-page.html' })); 
server.use(express.json());


server.get('/', (req, res) => {
    res.send('Hello, welcome to my website!');
});

mySQLConnection(server);
setupDatabase();



