function setupClickIncrement(): void {
    const button = document.getElementById('okBookButton');

    if (!button) {
        console.error("Button with id 'okBookButton' not found.");
        return;
    }

    // Add click event listener to the button
    button.addEventListener('click', function () {
        const bookId = this.getAttribute('book_id');

        if (bookId) {
            fetch(`/increment-click/${bookId}`, { method: 'POST' })
                .then((response) => {
                    if (response.ok) {
                        console.log('Click count incremented successfully.');
                    } else {
                        console.error('Failed to increment click count.');
                    }
                })
                .catch((error) => console.error('Error:', error));
        } else {
            console.error("No 'book_id' attribute found on button.");
        }
    });
}

// Execute the function after the DOM is fully loaded
window.addEventListener('DOMContentLoaded', setupClickIncrement);