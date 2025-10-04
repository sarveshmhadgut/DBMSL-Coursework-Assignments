-- Drop existing tables if they exist
DROP TABLE IF EXISTS new_data;
DROP TABLE IF EXISTS old_data;

-- Create old_data table
CREATE TABLE old_data
(
    e_id INT PRIMARY KEY,
    fname VARCHAR(255),
    salary INT
);

-- Create new_data table
CREATE TABLE new_data
(
    e_id INT PRIMARY KEY,
    fname VARCHAR(255),
    salary INT
);

-- Insert data into old_data\
INSERT INTO old_data VALUES
(1, 'Kurtis', 20),
(2, 'Dennis', 28),
(3, 'Nikolas', 30),
(4, 'Luke', 13),
(5, 'Timothy', 55);

-- Insert data into new_data
INSERT INTO new_data VALUES
(5, 'Barry', 31),
(2, 'Dennis', 28);

-- Drop the copy_data procedure if it exists
DROP PROCEDURE IF EXISTS copy_data;

-- Create the copy_data procedure
CREATE PROCEDURE copy_data()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE proc_id INT;
    DECLARE proc_fname VARCHAR(255);
    DECLARE proc_salary INT;

    -- Declare a cursor for selecting data from old_data
    DECLARE cur CURSOR FOR SELECT e_id, fname, salary FROM old_data;

    -- Declare a continue handler for when there are no more rows to fetch
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN cur;

    -- Loop to fetch data
    read_loop: LOOP
        FETCH cur INTO proc_id, proc_fname, proc_salary;

        -- Exit the loop if done
        IF done THEN
            LEAVE read_loop;
        END IF;
L
        -- Check if the record already exists in new_data
        IF NOT EXISTS (SELECT 1 FROM new_data WHERE e_id = proc_id) THEN
            -- Insert the record into new_data
            INSERT INTO new_data (e_id, fname, salary) VALUES (proc_id, proc_fname, proc_salary);
        END IF;

    END LOOP;

    -- Close the cursor
    CLOSE cur;
END;

-- Call the copy_data procedure to execute the copying
CALL copy_data();

-- Display the contents of new_data to verify the result
SELECT * FROM new_data;