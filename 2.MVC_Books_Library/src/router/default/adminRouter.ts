import { Router } from 'express';
import { AdminController } from '../../controllers/adminController';
import { upload } from './../../services/multer/multer';
import adminRouterV1 from '../api/v1/adminRouterV1';

const adminRouter = Router();

adminRouter.get('/',AdminController.showAdminBooksPage);
adminRouter.get('/delete_book/:id',AdminController.deleteBookAndReferences);
adminRouter.post('/add_book', upload.single('image'), AdminController.addBook);
adminRouter.get('/logout/',AdminController.logout);

adminRouter.use('/api/v1', adminRouterV1);

export default adminRouter;