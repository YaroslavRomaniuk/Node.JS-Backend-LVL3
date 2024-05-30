import { Router } from 'express';
import { AdminController } from '../../../controllers/adminController';
import { upload } from '../../../services/multer/multer';

const adminRouterV1 = Router();

adminRouterV1.get('/',AdminController.showAdminBooksPage);
adminRouterV1.get('/delete_book/:id',AdminController.deleteBookAndReferences);
adminRouterV1.post('/add_book', upload.single('image'), AdminController.addBook);
adminRouterV1.get('/logout/',AdminController.logout);

export default adminRouterV1;