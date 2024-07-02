USE mvc_library;



CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT,
    book_title VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    book_year INT,
    pages_quantity INT,
    isbn VARCHAR(20),
    book_description TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    image VARCHAR(255),
    view_count INT DEFAULT 0,
    click_count INT DEFAULT 0,
    deleted_at DATETIME DEFAULT NULL,
    PRIMARY KEY (book_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT,
    author_name VARCHAR(255) UNIQUE,
    PRIMARY KEY (author_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS Book_Author (
    book_id INT,
    author_id INT,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    PRIMARY KEY (book_id, author_id)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS DB_Initialization (
    id INT AUTO_INCREMENT PRIMARY KEY,
    initialized BOOLEAN NOT NULL DEFAULT FALSE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO DB_Initialization (initialized)
SELECT FALSE FROM dual
WHERE NOT EXISTS (
    SELECT 1 FROM DB_Initialization WHERE initialized = TRUE
);