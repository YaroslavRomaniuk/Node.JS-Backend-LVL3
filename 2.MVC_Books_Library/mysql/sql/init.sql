CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT,
    book_name VARCHAR(255),
    book_year INT,
    PRIMARY KEY (book_id)
);

CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT,
    author_name VARCHAR(255),
    PRIMARY KEY (author_id)
);

CREATE TABLE IF NOT EXISTS Book_Author (
    book_id INT,
    author_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    PRIMARY KEY (book_id, author_id)
);