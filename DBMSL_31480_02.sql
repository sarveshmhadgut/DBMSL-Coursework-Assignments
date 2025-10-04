CREATE TABLE Student(
StudentID int AUTO_INCREMENT PRIMARY KEY,
DriveID int,
TrainingID int,
Name varchar(255),
CGPA float,
Branch varchar(5),
DOB date);

CREATE TABLE PlacementDrive
(
DriveID int PRIMARY KEY,
Company_Name varchar(255),
Package float,
Location varchar(255)
);

CREATE TABLE Training
(
TrainingID int PRIMARY KEY,
Company_Name varchar(255),
Fee float,
Year year
);

ALTER TABLE Student
ADD FOREIGN KEY (DriveID)
REFERENCES PlacementDrive(DriveID)
ON DELETE CASCADE;

ALTER TABLE Student
ADD FOREIGN KEY (TrainingID)
REFERENCES Training(TrainingID)
ON DELETE CASCADE;

--Insert at least 10 records in the Student table and insert other tables accordingly.
INSERT INTO Student (Name, CGPA, Branch, DOB) VALUES
('Amoor'  , 9.07, 'CS' , '2002-02-14'),
('Arnold' , 9.84, 'CS' , '2001-01-22'),
('Brenon' , 8.36, 'CS' , '2000-09-08'),
('Darrell', 9.87, 'CS' , '2002-06-27'),
('Dennis' , 8.08, 'ETC', '2001-11-03'),
('Harold' , 8.73, 'CS' , '2003-10-30'),
('Jordan' , 8.65, 'IT' , '2003-05-05'),
('Kurt'   , 8.85, 'CS' , '2003-08-19'),
('Tyson'  , 8.06, 'ETC', '2002-12-10'),
('Wyatt'  , 8.18, 'IT' , '2000-04-15');

INSERT INTO PlacementDrive VALUES
(69189, 'Lucid'    , 16, 'Pune'),
(44527, 'Arc Net'  , 30, 'Bangalore'),
(81544, 'Twitch'   , 20, 'Pune'),
(61189, 'iBuyPower', 50, 'Mumbai'),
(23334, 'Nvdia'    , 20, 'Mumbai'),
(22661, 'Humane'   , 10, 'Mumbai'),
(55846, 'Arc Net'  , 19, 'Bangalore');

UPDATE Student SET DriveID=69189 WHERE Name='Kurt';
UPDATE Student SET DriveID=44527 WHERE Name='Arnold';
UPDATE Student SET DriveID=81544 WHERE Name='Amoor';
UPDATE Student SET DriveID=61189 WHERE Name='Darrell';
UPDATE Student SET DriveID=23334 WHERE Name='Jordan';
UPDATE Student SET DriveID=22661 WHERE Name='Tyson';

INSERT INTO Training VALUES
(919173, 'Humane' , 3 , 2021),
(832124, 'Arc Net', 11, 2019),
(912144, 'Humane' , 3 , 2022),
(888951, 'Twitch' , 6 , 2019),
(633538, 'Lucid'  , 8 , 2018),
(753566, 'Humane' , 10, 2020),
(475503, 'Rivian' , 4 , 2020);

UPDATE Student SET TrainingID=919173 WHERE Name='Dennis';
UPDATE Student SET TrainingID=832124 WHERE Name='Arnold';
UPDATE Student SET TrainingID=912144 WHERE Name='Jordan';
UPDATE Student SET TrainingID=888951 WHERE Name='Wyatt';
UPDATE Student SET TrainingID=633538 WHERE Name='Harold';
UPDATE Student SET TrainingID=753566 WHERE Name='Tyson';
UPDATE Student SET TrainingID=475503 WHERE Name='Darrell';

SELECT * FROM Student;
+------------+---------+------------+---------+------+--------+------------+
| Student_ID | DriveID | TrainingID | Name    | CGPA | Branch | DOB        |
+------------+---------+------------+---------+------+--------+------------+
|          1 |   81544 |       NULL | Amoor   | 9.07 | CS     | 2002-02-14 |
|          2 |   44527 |     832124 | Arnold  | 9.84 | CS     | 2001-01-22 |
|          3 |    NULL |       NULL | Brenon  | 8.36 | CS     | 2000-09-08 |
|          4 |   61189 |     475503 | Darrell | 9.87 | CS     | 2002-06-27 |
|          5 |    NULL |     919173 | Dennis  | 8.08 | ETC    | 2001-11-03 |
|          6 |    NULL |     633538 | Harold  | 8.73 | CS     | 2003-10-30 |
|          7 |   23334 |     912144 | Jordan  | 8.65 | IT     | 2003-05-05 |
|          8 |   69189 |       NULL | Kurt    | 8.85 | CS     | 2003-08-19 |
|          9 |   22661 |     753566 | Tyson   | 8.06 | ETC    | 2002-12-10 |
|         10 |    NULL |     888951 | Wyatt   | 8.18 | IT     | 2000-04-15 |
+------------+---------+------------+---------+------+--------+------------+

SELECT * FROM PlacementDrive;
+---------+--------------+---------+-----------+
| DriveID | Company_Name | Package | Location  |
+---------+--------------+---------+-----------+
|   22661 | Humane       |      10 | Mumbai    |
|   23334 | Nvdia        |      20 | Mumbai    |
|   44527 | Arc Net      |      30 | Bangalore |
|   55846 | Arc Net      |      19 | Bangalore |
|   61189 | iBuyPower    |      50 | Mumbai    |
|   69189 | Lucid        |      16 | Pune      |
|   81544 | Twitch       |      20 | Pune      |
+---------+--------------+---------+-----------+

SELECT * FROM Training;
+------------+--------------+------+------+
| TrainingID | Company_Name | Fee  | Year |
+------------+--------------+------+------+
|     475503 | Rivian       |    4 | 2020 |
|     633538 | Lucid        |    8 | 2018 |
|     753566 | Humane       |   10 | 2020 |
|     832124 | Arc Net      |   11 | 2019 |
|     888951 | Twitch       |    6 | 2019 |
|     912144 | Humane       |    3 | 2021 |
|     919173 | Humane       |    3 | 2021 |
+------------+--------------+------+------+

-- list the number of different companies.(use of distinct)
SELECT DISTINCT (Company_Name) FROM PlacementDrive
UNION
SELECT DISTINCT (Company_Name) FROM Training;

--Output:
+--------------+
| Company_Name |
+--------------+
| Humane       |
| Nvdia        |
| Arc Net      |
| iBuyPower    |
| Lucid        |
| Twitch       |
| Rivian       |
+--------------+

--Display all students details with branch ‘Computer ‘and ‘It’ and student name
--starting with 'a' or 'd'.
SELECT * FROM Student WHERE (Name LIKE 'A%' OR Name LIKE 'D%') AND (Branch = 'CS' OR Branch = 'IT')

--Output:
+------------+---------+------------+---------+------+--------+------------+
| Student_ID | DriveID | TrainingID | Name    | CGPA | Branch | DOB        |
+------------+---------+------------+---------+------+--------+------------+
|          1 |   81544 |       NULL | Amoor   | 9.07 | CS     | 2002-02-14 |
|          2 |   44527 |     832124 | Arnold  | 9.84 | CS     | 2001-01-22 |
|          4 |   61189 |     475503 | Darrell | 9.87 | CS     | 2002-06-27 |
+------------+---------+------------+---------+------+--------+------------+

SELECT * FROM Training WHERE Year='2019';
--Output:

+------------+--------------+-------+------+
| TrainingID | Company_Name | Fee   | Year |
+------------+--------------+-------+------+
|     832124 | Arc Net      |    11 | 2019 |
|     888951 | Twitch       |     6 | 2019 |
+------------+--------------+-------+------+

-- Give 15% increase in fee of the Training whose joining year is 2019.
UPDATE Training
SET Fee = Fee * 1.15
WHERE Year = '2019';
SELECT * FROM Training WHERE Year='2019';
--Output:

+------------+--------------+-------+------+
| TrainingID | Company_Name | Fee   | Year |
+------------+--------------+-------+------+
|     832124 | Arc Net      | 12.65 | 2019 |
|     888951 | Twitch       |   6.9 | 2019 |
+------------+--------------+-------+------+

--Delete Student details having CGPA score less than 7.

DELETE FROM Student
WHERE CGPA < 7;

SELECT * FROM Student;
--Output:

+------------+---------+------------+---------+------+--------+------------+
| Student_ID | DriveID | TrainingID | Name    | CGPA | Branch | DOB        |
+------------+---------+------------+---------+------+--------+------------+
|          1 |   81544 |       NULL | Amoor   | 9.07 | CS     | 2002-02-14 |
|          2 |    NULL |     832124 | Arnold  | 9.84 | CS     | 2001-01-22 |
|          3 |    NULL |       NULL | Brenon  | 8.36 | CS     | 2000-09-08 |
|          4 |   61189 |     475503 | Darrell | 9.87 | CS     | 2002-06-27 |
|          5 |    NULL |     919173 | Dennis  | 8.08 | ETC    | 2001-11-03 |
|          6 |    NULL |     633538 | Harold  | 8.73 | CS     | 2003-10-30 |
|          7 |   23334 |     912144 | Jordan  | 8.65 | IT     | 2003-05-05 |
|          8 |   69189 |       NULL | Kurt    | 8.85 | CS     | 2003-08-19 |
|          9 |   22661 |     753566 | Tyson   | 8.06 | ETC    | 2002-12-10 |
|         10 |    NULL |     888951 | Wyatt   | 8.18 | IT     | 2000-04-15 |
+------------+---------+------------+---------+------+--------+------------+

--Find the names of companies belonging to Pune or Mumbai.

SELECT DISTINCT Company_Name, Location FROM PlacementDrive
INNER JOIN Student
WHERE Location='Pune' OR Location='Mumbai';
--Output:

+--------------+----------+
| Company_Name | Location |
+--------------+----------+
| Humane       | Mumbai   |
| Nvdia        | Mumbai   |
| iBuyPower    | Mumbai   |
| Lucid        | Pune     |
| Twitch       | Pune     |
+--------------+----------+

--Find the student name who joined training 2019 as well as in 2021.

SELECT Name, Year FROM Student
INNER JOIN Training
ON Student.TrainingID = Training.TrainingID
WHERE Year='2019' OR Year='2021';
--Output:

+--------+------+
| Name   | Year |
+--------+------+
| Arnold | 2019 |
| Dennis | 2021 |
| Wyatt  | 2019 |
+--------+------+

--Find the student name having maximum CGPA score and names of students having CGPA score between 7 to 9 .
SELECT Name, CGPA FROM Student
WHERE CGPA = (SELECT MAX(CGPA) FROM Student);
--Output:

+-------+-----------+
| Name  | MAX(CGPA) |
+-------+-----------+
| Amoor |      9.87 |
+-------+-----------+

SELECT Name, CGPA FROM Student
WHERE CGPA BETWEEN 7 AND 9;
--Output:

+--------+------+
| Name   | CGPA |
+--------+------+
| Brenon | 8.36 |
| Dennis | 8.08 |
| Harold | 8.73 |
| Jordan | 8.65 |
| Kurt   | 8.85 |
| Tyson  | 8.06 |
| Wyatt  | 8.18 |
+--------+------+

--Display all Student's name with TrainingID with decreasing order of Fees.

SELECT Name, Fee FROM Student
INNER JOIN Training
ON Student.TrainingID = Training.TrainingID
ORDER BY Fee DESC;
--Output:

+---------+-------+
| Name    | Fee   |
+---------+-------+
| Arnold  | 12.65 |
| Tyson   |    10 |
| Harold  |     8 |
| Wyatt   |   6.9 |
| Darrell |     4 |
| Dennis  |     3 |
| Jordan  |     3 |
+---------+-------+
