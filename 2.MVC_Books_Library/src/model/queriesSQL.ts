const DELETE_INTERVAL = process.env.DELETE_INTERVAL || '1 DAY'; // Default to '1 DAY' if not set


// Іnterface for categorizing and typing SQL queries
interface QueryCategories {
    books: {
      insert: string;
      getAllLimit: string;
      getAllSortedLimit: string;
      getAllLimitOffset: string;
      getAllSearch:string;
      getById: string;
      updateById: string;
      viewCountPlus:string;
      clickCountPlus:string;
      updateDeleteTime: string;
      findDeletedBooks: string;
      deleteBookReferences: string;
      deleteBooks: string;
      getBooksQuantity:string;
    };
    authors: {
      insert: string;
      findAll: string;
      findById: string;
      findByName: string;
    };
    bookAuthors: {
      insert: string;
      getByBookId: string;
    };

    service: {
      startTransaction: string;
      commit: string;
      rollback: string;
    }
  }
  
  // SQL queries organized by category and purpose
  const queries: QueryCategories = {
    books: {
      insert: `INSERT INTO Books (book_title, book_year, pages_quantity, isbn, book_description, image) VALUES (?, ?, ?, ?, ?, ?)`,
      getAllLimit: `SELECT * FROM Books WHERE deleted_at is NULL LIMIT ?`,
      getAllSortedLimit: `SELECT * FROM Books WHERE deleted_at is NULL ORDER BY ?? ?? LIMIT ?`,
      getAllLimitOffset: `SELECT * FROM Books WHERE deleted_at is NULL LIMIT ? OFFSET ?`,
      getAllSearch:`SELECT * FROM books WHERE book_title LIKE ?`,
      getById: `SELECT * FROM Books WHERE book_id = ? AND deleted_at is NULL`,
      updateById: `UPDATE Books SET book_title = ?, book_year = ?, pages_quantity = ?, isbn = ?, book_description = ?, image = ?, is_deleted = ? WHERE book_id = ?`,
      viewCountPlus: `UPDATE Books SET view_count = view_count + 1 WHERE book_id = ?`,
      clickCountPlus: `UPDATE Books SET click_count = click_count + 1 WHERE book_id = ?`,
      updateDeleteTime: `UPDATE Books SET deleted_at = NOW() WHERE book_id = ?`,
      findDeletedBooks: `SELECT book_id FROM Books WHERE deleted_at < NOW() - INTERVAL ${DELETE_INTERVAL}`,
      deleteBookReferences: `DELETE FROM Book_Author WHERE book_id IN (?)`,
      deleteBooks: `DELETE FROM Books WHERE book_id IN (?)`,
      getBooksQuantity: `SELECT COUNT(*) AS totalBooks FROM books WHERE deleted_at is NULL`
    },
    authors: {
      insert: `INSERT INTO Authors (author_name) VALUES (?)`,
      findAll: `SELECT * FROM Authors`,
      findById: `SELECT * FROM Authors WHERE author_id = ?`,
      findByName: `SELECT * FROM Authors WHERE author_name = ?`,
    },
    bookAuthors: {
      insert: `INSERT INTO Book_Author (book_id, author_id) VALUES (?, ?)`,
      getByBookId: `SELECT author_name FROM Authors INNER JOIN Book_Author ON Authors.author_id = Book_Author.author_id WHERE Book_Author.book_id = ?`,
    },
    service: {
      startTransaction: 'START TRANSACTION',
      commit: 'COMMIT',
      rollback: 'ROLLBACK'
    }
  };
  
  export default queries;
  