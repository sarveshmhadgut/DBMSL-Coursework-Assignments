--Find the Student details and Placement details using NATURAL JOIN.
SELECT * FROM Student
NATURAL JOIN PlacementDrive;
--output:

+---------+-----------+------------+---------+------+--------+------------+--------------+---------+-----------+
| DriveID | StudentID | TrainingID | Name    | CGPA | Branch | DOB        | Company_Name | Package | Location  |
+---------+-----------+------------+---------+------+--------+------------+--------------+---------+-----------+
|   22661 |         9 |     753566 | Tyson   | 8.06 | ETC    | 2002-12-10 | Humane       |      10 | Mumbai    |
|   23334 |         7 |     912144 | Jordan  | 8.65 | IT     | 2003-05-05 | Nvdia        |      20 | Mumbai    |
|   44527 |         2 |     832124 | Arnold  | 9.84 | CS     | 2001-01-22 | Arc Net      |      30 | Bangalore |
|   61189 |         4 |     475503 | Darrell | 9.87 | CS     | 2002-06-27 | iBuyPower    |      50 | Mumbai    |
|   69189 |         8 |       NULL | Kurt    | 8.85 | CS     | 2003-08-19 | Lucid        |      16 | Pune      |
|   81544 |         1 |       NULL | Amoor   | 9.07 | CS     | 2002-02-14 | Twitch       |      20 | Pune      |
+---------+-----------+------------+---------+------+--------+------------+--------------+---------+-----------+

--Find all the student details with company_name who have conducted in same drive
SELECT Company_Name, StudentID, DriveID, Package, Location FROM Student
NATURAL JOIN PlacementDrive
GROUP BY Company_Name
ORDER BY Company_Name;
--output:

+--------------+-----------+---------+---------+-----------+
| Company_Name | StudentID | DriveID | Package | Location  |
+--------------+-----------+---------+---------+-----------+
| Arc Net      |         2 |   44527 |      30 | Bangalore |
| Humane       |         9 |   22661 |      10 | Mumbai    |
| iBuyPower    |         4 |   61189 |      50 | Mumbai    |
| Lucid        |         8 |   69189 |      16 | Pune      |
| Nvdia        |         7 |   23334 |      20 | Mumbai    |
| Twitch       |         1 |   81544 |      20 | Pune      |
+--------------+-----------+---------+---------+-----------+

--List all the Student name and Student branch of Student having package 30 LPA
SELECT Name, Branch, Package FROM Student
NATURAL JOIN PlacementDrive
WHERE Package < 30 ORDER BY Package;
--output:

+--------+--------+---------+
| Name   | Branch | Package |
+--------+--------+---------+
| Tyson  | ETC    |      10 |
| Kurt   | CS     |      16 |
| Jordan | IT     |      20 |
| Amoor  | CS     |      20 |
+--------+--------+---------+

--List all the student names ,company_name having T_fee more than 5 Lakhs.
SELECT Name, Company_Name, Fee FROM Student
NATURAL JOIN Training
WHERE Fee > 5 ORDER BY Fee;
--output:

+--------+--------------+-------+
| Name   | Company_Name | Fee   |
+--------+--------------+-------+
| Wyatt  | Twitch       |   6.9 |
| Harold | Lucid        |     8 |
| Tyson  | Humane       |    10 |
| Arnold | Arc Net      | 12.65 |
+--------+--------------+-------+

--Display all training details attended by Wyatt in year 2019
SELECT * FROM Student
NATURAL JOIN Training
WHERE Year = 2019 AND Name='Wyatt';
--output:

+------------+-----------+---------+-------+------+--------+------------+--------------+------+------+
| TrainingID | StudentID | DriveID | Name  | CGPA | Branch | DOB        | Company_Name | Fee  | Year |
+------------+-----------+---------+-------+------+--------+------------+--------------+------+------+
|     888951 |        10 |    NULL | Wyatt | 8.18 | IT     | 2000-04-15 | Twitch       |  6.9 | 2019 |
+------------+-----------+---------+-------+------+--------+------------+--------------+------+------+

--list the total number of companies who conduct training before 2021
SELECT DISTINCT Company_Name AS Companies_Before_2021
FROM Training
WHERE Year < 2021;
--output:

+-----------------------+
| Companies_Before_2021 |
+-----------------------+
| Rivian                |
| Lucid                 |
| Humane                |
| Arc Net               |
| Twitch                |
+-----------------------+

--List the students name with company iBuyPower and location Mumbai.
SELECT Name, Company_Name, Location FROM Student
NATURAL JOIN PlacementDrive
WHERE Location='Mumbai' AND Company_Name='iBuyPower';
--output:

+---------+--------------+----------+
| Name    | Company_Name | Location |
+---------+--------------+----------+
| Darrell | iBuyPower    | Mumbai   |
+---------+--------------+----------+

--Find the names of all Students who have joined ‘Microsoft ‘ training in 2015 .
SELECT Name, Company_Name, Year FROM Student
NATURAL JOIN Training
WHERE Year='2020' AND Company_Name='Humane';
--output:

+--------+--------------+------+
| Name   | Company_Name | Year |
+--------+--------------+------+
| Tyson  | Humane       | 2020 |
| Jordan | Humane       | 2020 |
+--------+--------------+------+

--Create a view showing the Student and Training details.
CREATE VIEW Training_Students AS
SELECT StudentID, Name, DOB, TrainingID, Company_Name, Fee, Year FROM Student
NATURAL JOIN Training;

SELECT * FROM Training_Students ORDER BY StudentID;
--output:

+-----------+---------+------------+------------+--------------+-------+------+
| StudentID | Name    | DOB        | TrainingID | Company_Name | Fee   | Year |
+-----------+---------+------------+------------+--------------+-------+------+
|         2 | Arnold  | 2001-01-22 |     832124 | Arc Net      | 12.65 | 2019 |
|         4 | Darrell | 2002-06-27 |     475503 | Rivian       |     4 | 2020 |
|         5 | Dennis  | 2001-11-03 |     919173 | Humane       |     3 | 2021 |
|         6 | Harold  | 2003-10-30 |     633538 | Lucid        |     8 | 2018 |
|         7 | Jordan  | 2003-05-05 |     912144 | Humane       |     3 | 2020 |
|         9 | Tyson   | 2002-12-10 |     753566 | Humane       |    10 | 2020 |
|        10 | Wyatt   | 2000-04-15 |     888951 | Twitch       |   6.9 | 2019 |
+-----------+---------+------------+------------+--------------+-------+------+

--Perform Manipulation on simple view-Insert, update, delete, drop view.
--create a simple view:
CREATE VIEW Basic_Details AS 
SELECT Student_ID, Name, DOB, Branch, CGPA 
FROM Student;

--insert operation:
INSERT INTO Basic_Details VALUES 
(11, 'Adrian', '2001-08-13', 'ETC', 8.91),
(12, 'Ethan', '2002-03-05', 'IT', 8.72);

SELECT * FROM Basic_Details;
--output:

+------------+---------+------------+--------+------+
| Student_ID | Name    | DOB        | Branch | CGPA |
+------------+---------+------------+--------+------+
|          1 | Amoor   | 2002-02-14 | CS     | 9.07 |
|          2 | Arnold  | 2001-01-22 | CS     | 9.84 |
|          3 | Brenon  | 2000-09-08 | CS     | 8.36 |
|          4 | Darrell | 2002-06-27 | CS     | 9.87 |
|          5 | Dennis  | 2001-11-03 | ETC    | 8.08 |
|          6 | Harold  | 2003-10-30 | CS     | 8.73 |
|          7 | Jordan  | 2003-05-05 | IT     | 8.65 |
|          8 | Kurt    | 2003-08-19 | CS     | 8.85 |
|          9 | Tyson   | 2002-12-10 | ETC    | 8.06 |
|         10 | Wyatt   | 2000-04-15 | IT     | 8.18 |
|         11 | Adrian  | 2001-08-13 | ETC    | 8.91 |
|         12 | Ethan   | 2002-03-05 | IT     | 8.72 |
+------------+---------+------------+--------+------+

--update operation:
UPDATE Basic_Details 
SET CGPA = 8.71 
WHERE Name = 'Ethan';

SELECT * FROM Basic_Details;
--output:

+------------+---------+------------+--------+------+
| Student_ID | Name    | DOB        | Branch | CGPA |
+------------+---------+------------+--------+------+
|          1 | Amoor   | 2002-02-14 | CS     | 9.07 |
|          2 | Arnold  | 2001-01-22 | CS     | 9.84 |
|          3 | Brenon  | 2000-09-08 | CS     | 8.36 |
|          4 | Darrell | 2002-06-27 | CS     | 9.87 |
|          5 | Dennis  | 2001-11-03 | ETC    | 8.08 |
|          6 | Harold  | 2003-10-30 | CS     | 8.73 |
|          7 | Jordan  | 2003-05-05 | IT     | 8.65 |
|          8 | Kurt    | 2003-08-19 | CS     | 8.85 |
|          9 | Tyson   | 2002-12-10 | ETC    | 8.06 |
|         10 | Wyatt   | 2000-04-15 | IT     | 8.18 |
|         11 | Adrian  | 2001-08-13 | ETC    | 8.91 |
|         12 | Ethan   | 2002-03-05 | IT     | 8.71 |
+------------+---------+------------+--------+------+

--delete operation:
DELETE FROM Basic_Details 
WHERE Name = 'Adrian';

SELECT * FROM Basic_Details;
--output:

+------------+---------+------------+--------+------+
| Student_ID | Name    | DOB        | Branch | CGPA |
+------------+---------+------------+--------+------+
|          1 | Amoor   | 2002-02-14 | CS     | 9.07 |
|          2 | Arnold  | 2001-01-22 | CS     | 9.84 |
|          3 | Brenon  | 2000-09-08 | CS     | 8.36 |
|          4 | Darrell | 2002-06-27 | CS     | 9.87 |
|          5 | Dennis  | 2001-11-03 | ETC    | 8.08 |
|          6 | Harold  | 2003-10-30 | CS     | 8.73 |
|          7 | Jordan  | 2003-05-05 | IT     | 8.65 |
|          8 | Kurt    | 2003-08-19 | CS     | 8.85 |
|          9 | Tyson   | 2002-12-10 | ETC    | 8.06 |
|         10 | Wyatt   | 2000-04-15 | IT     | 8.18 |
|         12 | Ethan   | 2002-03-05 | IT     | 8.71 |
+------------+---------+------------+--------+------+


--drop operation:
DROP VIEW Basic_Details;
SELECT * FROM Basic_Details;

--output: