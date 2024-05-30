import { Router } from 'express';
import { userController } from '../../controllers/userController';
import userRouterV1 from '../api/v1/userRouterV1';

const userRouter = Router();

userRouter.get('/',userController.showBooksPage);
userRouter.get('/book/:id',userController.showBookPageByID);
userRouter.get('/search/', userController.showSearchResult);
userRouter.post('/increment-click/:id',userController.incrementClickCount);

userRouter.use('/api/v1', userRouterV1);

export default userRouter;