import multer from 'multer';
import path from 'path';

// Configure storage options for multer
const storage = multer.diskStorage({
    // Set the destination for uploaded files
    destination: function (req, file, cb) {
        cb(null, './public/images_and_styles/images'); // Ensure this folder exists
    },
    // Set the filename for uploaded files
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

// Create the multer upload instance with the storage options
export const upload = multer({ storage: storage });
