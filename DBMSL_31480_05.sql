-- Drop existing tables if they exist
DROP TABLE IF EXISTS result;
DROP TABLE IF EXISTS student_data;

-- Create student_data table
CREATE TABLE student_data
(
    roll_no INT PRIMARY KEY,
    name VARCHAR(255),
    marks INT
);

-- Create result table
CREATE TABLE result
(
    roll_no INT PRIMARY KEY,
    name VARCHAR(255),
    class VARCHAR(255)
);

-- Insert data into student_data
INSERT INTO student_data VALUES
(1, 'Kurtis', 1000),
(2, 'Dennis', 850),
(3, 'Nikolas', 1400),
(4, 'Luke', 600),
(5, 'Timothy', 800);

-- Drop the calc_class procedure if it exists
DROP PROCEDURE IF EXISTS calc_class;

-- Create the calc_class procedure
CREATE PROCEDURE calc_class(IN marks INT, OUT class VARCHAR(255))
BEGIN
    IF marks < 1500 AND marks > 990 THEN
        SET class = 'Distinction';
    ELSEIF marks < 990 AND marks > 900 THEN
        SET class = 'First Class';
    ELSEIF marks < 900 AND marks > 825 THEN
        SET class = 'Higher Second Class';
    ELSEIF marks < 825 AND marks > 700 THEN
        SET class = 'Second Class';
    ELSEIF marks < 700 AND marks > 500 THEN
        SET class = 'Pass';
    ELSE
        SET class = 'Fail';
    END IF;
END;

-- Drop the result_calc function if it exists
DROP FUNCTION IF EXISTS result_calc;

-- Create the result_calc function
CREATE FUNCTION result_calc(user_no INT) RETURNS INT
DETERMINISTIC READS SQL NO SQL
BEGIN
    DECLARE func_name VARCHAR(255);
    DECLARE func_marks INT;
    DECLARE grade VARCHAR(255);

    DECLARE CONTINUE HANDLER FOR NOT FOUND RETURN 0;

    -- Select the name and marks based on roll_no
    SELECT S.name, S.marks INTO func_name, func_marks
    FROM student_data AS S
    WHERE S.roll_no = user_no;

    -- Call the procedure to determine the grade
    CALL calc_class(func_marks, grade);

    -- Insert the result into the result table
    INSERT INTO result (roll_no, name, class)
    VALUES (user_no, func_name, grade);

    RETURN user_no;
END;

-- Call the function for each student and display results
SELECT result_calc(1);
SELECT result_calc(2);
SELECT result_calc(3);
SELECT result_calc(4);
SELECT result_calc(5);

-- Display all results
SELECT * FROM result;