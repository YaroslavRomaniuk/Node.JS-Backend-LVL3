import { Router } from 'express';
import { userController } from '../../../controllers/userController';

const userRouterV1 = Router();

userRouterV1.get('/',userController.showBooksPage);
userRouterV1.get('/book/:id',userController.showBookPageByID);
userRouterV1.get('/search/', userController.showSearchResult);
userRouterV1.post('/increment-click/:id',userController.incrementClickCount);

export default userRouterV1;