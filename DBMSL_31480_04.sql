-- Drop existing tables if they exist
DROP TABLE IF EXISTS Fine;
DROP TABLE IF EXISTS Borrower;

-- Create Borrower table
CREATE TABLE Borrower (
    roll_no INT PRIMARY KEY,
    name VARCHAR(255),
    doi DATE,
    book_name VARCHAR(255),
    status CHAR(1)
);

-- Create Fine table
CREATE TABLE Fine (
    roll_no INT,
    book_name VARCHAR(255),
    amount INT
);

-- Insert data into Borrower
INSERT INTO Borrower (roll_no, name, doi, book_name, status) VALUES
    (1, 'Kurtis', '2024-01-20', 'B1', 'I'),
    (2, 'Dennis', '2024-07-14', 'B2', 'I'),
    (3, 'Nikolas', '2024-09-05', 'B3', 'I'),
    (4, 'Luke', '2024-08-27', 'B4', 'I'),
    (5, 'Timothy', '2024-03-10', 'B5', 'I');

-- Drop the procedure if it exists
DROP PROCEDURE IF EXISTS calc_fine;

-- Create the calc_fine procedure
CREATE PROCEDURE calc_fine(IN user_no INT, IN user_book VARCHAR(255))
BEGIN
    DECLARE days INT;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
    BEGIN
        SELECT 'Not found';
    END;

    -- Calculate the number of days since the date of issue
    SELECT DATEDIFF(CURDATE(), doi) INTO days
    FROM Borrower
    WHERE roll_no = user_no AND book_name = user_book;

    -- Check the number of days and insert fine amounts accordingly
    IF days > 30 THEN
        INSERT INTO Fine (roll_no, book_name, amount) VALUES (user_no, user_book, days * 50);
    ELSEIF days > 15 AND days <= 30 THEN
        INSERT INTO Fine (roll_no, book_name, amount) VALUES (user_no, user_book, days * 5);
    END IF;

    -- Update the status of the borrower
    UPDATE Borrower
    SET status = 'S'
    WHERE roll_no = user_no AND book_name = user_book;

END;

-- Call the calc_fine procedure for each borrower
CALL calc_fine(1, 'B1');
CALL calc_fine(2, 'B2');
CALL calc_fine(3, 'B3');
CALL calc_fine(4, 'B4');
CALL calc_fine(5, 'B5');

-- Select all records from Fine
SELECT * FROM Fine;