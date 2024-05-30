function setupSearchRedirect() {
    var searchInput = document.getElementById('search');
    // Make sure the search input is found before adding an event listener
    if (!searchInput) {
        console.error("Search input element not found.");
        return;
    }
    // Add the keypress event listener to the search input
    searchInput.addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault(); // Prevent the form from submitting if necessary
            // Retrieve the search term
            var searchTerm = searchInput.value;
            // Redirect to the search page with the search term as a query parameter
            window.location.href = "/search?term=".concat(encodeURIComponent(searchTerm));
        }
    });
}
window.addEventListener('DOMContentLoaded', setupSearchRedirect);
