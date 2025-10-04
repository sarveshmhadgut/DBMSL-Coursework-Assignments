-- Drop existing tables if they exist
DROP TABLE IF EXISTS library_backup;
DROP TABLE IF EXISTS library;

-- Create library table
CREATE TABLE library
(
    book_id INT PRIMARY KEY,
    book_name VARCHAR(255),
    book_author VARCHAR(255)
);

-- Create library_backup table
CREATE TABLE library_backup
(
    operation VARCHAR(255),
    book_id INT,
    book_name VARCHAR(255),
    book_author VARCHAR(255)
);

-- Insert data into library
INSERT INTO library VALUES
(1, 'B1', 'Kurtis'),
(2, 'B2', 'Dennis'),
(3, 'B3', 'Timothy'),
(4, 'B4', 'Nikolas'),
(5, 'B5', 'Barry');

-- Create trigger for backing up data before update
CREATE TRIGGER backup_on_update
BEFORE UPDATE ON library
FOR EACH ROW
BEGIN
    -- Insert the old data into library_backup before updating
    INSERT INTO library_backup (operation, book_id, book_name, book_author)
    VALUES ('UPDATE', OLD.book_id, OLD.book_name, OLD.book_author);
END;

-- Create trigger for backing up data after update

CREATE TRIGGER backup_after_update
AFTER UPDATE ON library
FOR EACH ROW
BEGIN
    -- Insert the old data into library_backup after updating
    INSERT INTO library_backup (operation, book_id, book_name, book_author)
    VALUES ('AFTER UPDATE', OLD.book_id, OLD.book_name, OLD.book_author);
END;

-- Create trigger for backing up data before delete
CREATE TRIGGER backup_on_delete
BEFORE DELETE ON library
FOR EACH ROW
BEGIN
    -- Insert the old data into library_backup before deleting
    INSERT INTO library_backup (operation, book_id, book_name, book_author)
    VALUES ('DELETE', OLD.book_id, OLD.book_name, OLD.book_author);
END;