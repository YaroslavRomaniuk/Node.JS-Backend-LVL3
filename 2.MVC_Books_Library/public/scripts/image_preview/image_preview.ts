function previewImage(): void {
    const fileInput = document.getElementById('bookImage') as HTMLInputElement;
    const preview = document.getElementById('image_preview') as HTMLImageElement;

    if (!fileInput || !fileInput.files || fileInput.files.length === 0) {
        console.error("No files selected.");
        if (preview) {
            preview.src = "#";
            preview.style.display = 'none'; // Hide the image if no image is selected
        }
        return;
    }

    const file = fileInput.files[0];
    const reader = new FileReader();

    reader.onloadend = () => {
        if (preview) {
            preview.src = reader.result as string; // reader.result is a DataURL (base64 encoded string)
            preview.style.display = 'block'; // Make the image visible
        }
    };

    if (file) {
        reader.readAsDataURL(file);
    } else {
        if (preview) {
            preview.src = "#";
            preview.style.display = 'none'; // Hide the image if no image is selected
        }
    }
}

export { previewImage };

