import express from 'express';
import { createMySQLPool, setupDatabase, initialDBSetup } from './src/services/mysql/db/db';
import dotenv from 'dotenv';
import path from 'path';
import userRouter from './src/router/default/userRouter';
import adminRouter from './src/router/default/adminRouter';
import basicAuth from 'express-basic-auth';
import './src/services/cron/cron';

dotenv.config();

const server = express();

// Set up view engine
server.set('view engine', 'ejs');
server.set('views', path.join(__dirname, 'views'));

// Serve static files
server.use(express.static(path.join(__dirname, 'public')));

// Middleware to parse incoming requests
server.use(express.json());
server.use(express.urlencoded({ extended: true }));

// Initialize the application
async function initApp() {
    try {
        await initialDBSetup();
        await createMySQLPool();
        await setupDatabase();
    } catch (error) {
        console.error('Error during app initialization:', error);
        process.exit(1); // Exit the process with failure
    }
}

// Start the initialization
initApp().catch(console.error);

const port = process.env.PORT

// Start the server
server.listen(port, () => {
    console.log(`Server is running at http://localhost:${port}`);
});

// Pass environment variables to the templates
server.use((req, res, next) => {
    res.locals.env = process.env;
    next();
});


// Routes
server.use('/', userRouter);

const auth = basicAuth({
    users: { 'admin': 'admin' },
    challenge: true
});

server.use('/admin/', auth, adminRouter);


