"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.previewImage = void 0;
function previewImage() {
    var fileInput = document.getElementById('bookImage');
    var preview = document.getElementById('image_preview');
    if (!fileInput || !fileInput.files || fileInput.files.length === 0) {
        console.error("No files selected.");
        if (preview) {
            preview.src = "#";
            preview.style.display = 'none'; // Hide the image if no image is selected
        }
        return;
    }
    var file = fileInput.files[0];
    var reader = new FileReader();
    reader.onloadend = function () {
        if (preview) {
            preview.src = reader.result; // reader.result is a DataURL (base64 encoded string)
            preview.style.display = 'block'; // Make the image visible
        }
    };
    if (file) {
        reader.readAsDataURL(file);
    }
    else {
        if (preview) {
            preview.src = "#";
            preview.style.display = 'none'; // Hide the image if no image is selected
        }
    }
}
exports.previewImage = previewImage;
