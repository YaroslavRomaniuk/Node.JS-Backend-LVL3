function setupClickIncrement() {
    var button = document.getElementById('okBookButton');
    if (!button) {
        console.error("Button with id 'okBookButton' not found.");
        return;
    }
    // Add click event listener to the button
    button.addEventListener('click', function () {
        var bookId = this.getAttribute('book_id');
        if (bookId) {
            fetch("/increment-click/".concat(bookId), { method: 'POST' })
                .then(function (response) {
                if (response.ok) {
                    console.log('Click count incremented successfully.');
                }
                else {
                    console.error('Failed to increment click count.');
                }
            })
                .catch(function (error) { return console.error('Error:', error); });
        }
        else {
            console.error("No 'book_id' attribute found on button.");
        }
    });
}
// Execute the function after the DOM is fully loaded
window.addEventListener('DOMContentLoaded', setupClickIncrement);
