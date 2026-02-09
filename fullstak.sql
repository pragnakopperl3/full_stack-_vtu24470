==================session 1=======================
CREATE TABLE sales ( sale_id INT PRIMARY KEY, product_name VARCHAR(50), sale_date DATE, sale_amount INT);
INSERT INTO sales (sale_id, product_name, sale_date, sale_amount) VALUES (1, 'Widget A', '2024-08-01', 100), (2, 'Widget B', '2024-08-05', 150), (3, 'Widget C', '2024-08-07', 200), (4, 'Widget A', '2024-08-10', 120), (5, 'Widget B', '2024-08-15', 180),(6, 'Widget C', '2024-08-20', 250);
SELECT sale_id, product_name,(sale_date) AS sale_date_only FROM sales;
SELECT sale_id, product_name, YEAR(sale_date) AS sale_year
FROM sales;
SELECT sale_id, product_name,
       DATEADD(DAY, 7, sale_date) AS sale_date_plus_7_days
FROM sales;
SELECT
    ABS(-25) AS abs_value,            
    ROUND(12.678, 2) AS rounded_value,
    POWER(2, 5) AS power_value,       
    17 % 5 AS modulus_value;         
    SELECT 
    UPPER('database') AS upper_text,
    LOWER('SQL') AS lower_text,
    len ('Computer') AS text_length,
    SUBSTRING('FullStack', 1, 4) AS sub_text,
    CONCAT('My', 'SQL') AS combined_text;

============session 2==============
/*Install SQL tool, MySQL and VS Code. 
1. Create a database.
2. Create at least two tables:
   * Student (VTU Number, Name, Email, Phone, Department) 
   * Course (Course Code, Course Name, Faculty Id, Student ID, Faculty Email) 
   3. Insert minimum 5 records into each table.
4. Select records using different CLAUSE.
*/
create database fullstack
use fullstack
CREATE TABLE Students (
    VTU_Number VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Department VARCHAR(50)
);

CREATE TABLE Course (
    Course_Code VARCHAR(10) PRIMARY KEY,
    Course_Name VARCHAR(100),
    Faculty_Id INT,
    Student_ID VARCHAR(20),
    Faculty_Email VARCHAR(100),
    FOREIGN KEY (Student_ID) REFERENCES Students(VTU_Number)
);
INSERT INTO Students VALUES 
('1MS23CS001', 'Arjun Kumar', 'arjun@mail.com', '9845011223', 'CSE'),
('1MS23CS002', 'Sneha Rao', 'sneha@mail.com', '9845022334', 'IT'),
('1MS23CS003', 'Rahul Nair', 'rahul@mail.com', '9845033445', 'CSE'),
('1MS23CS004', 'Priya Das', 'priya@mail.com', '9845044556', 'ECE'),
('1MS23CS005', 'Amit Singh', 'amit@mail.com', '9845055667', 'IT');


INSERT INTO Course VALUES 
('CS101', 'Database Management', 101, '1MS23CS001', 'prof_smith@vtu.edu'),
('IS202', 'Data Structures', 102, '1MS23CS002', 'prof_jones@vtu.edu'),
('CS103', 'Operating Systems', 101, '1MS23CS003', 'prof_smith@vtu.edu'),
('EC301', 'Digital Electronics', 103, '1MS23CS004', 'prof_kumar@vtu.edu'),
('IS204', 'Web Programming', 104, '1MS23CS005', 'prof_leila@vtu.edu');
============= session 3====================
/*1. Write SELECT queries to display all records. 
2.  Write queries using aggregate functions.
3. Sort data and display based in ascending/descending order of the VTU number.
4. Display student records belonging to a particular department.
5. Map VTU no. with course name and faculty using joins.
*/ 
 select*from course 
 ------WHERE clause--------
SELECT * FROM Students WHERE Department = 'CSE';
----ORDER BY Clause (Sorting):-----
SELECT * FROM Course ORDER BY Course_Name ASC;
----LIKE Clause (Pattern Matching):----
SELECT Name, Email FROM Students WHERE Email LIKE '%@mail.com';
-----top Clause (Restricting Results):----\
SELECT TOP 3 *FROM Students;
-----GROUP BY & HAVING Clause (Aggregating):
SELECT Department, COUNT(*) as Total_Students FROM Students GROUP BY Department HAVING COUNt(*) > 1;
----Write SELECT queries to display all records----
===============session 4================
/*1. Write SELECT queries to display all records. 
2.  Write queries using aggregate functions.
3. Sort data and display based in ascending/descending order of the VTU number.
4. Display student records belonging to a particular department.
5. Map VTU no. with course name and faculty using joins.
*/
-- Display all students
SELECT * FROM Students;
-- Display all courses
SELECT * FROM Course;
-- Count total number of students
SELECT COUNT(*) AS Total_Students FROM Students;
-- Count unique departments
SELECT COUNT(DISTINCT Department) AS Department_Count FROM Students;
-- Find the highest Faculty ID assigned
SELECT MAX(Faculty_Id) AS Highest_Faculty_ID FROM Course;
-- Sort - Ascending order (Default)
SELECT * FROM Students ORDER BY VTU_Number ASC;
-- Sort - in Descending order
SELECT * FROM Students ORDER BY VTU_Number DESC;
-----Display student records belonging to a particular department.
SELECT * FROM Students WHERE Department = 'CSE';
----Inner Join:-----
SELECT  
    s.VTU_Number,  
    s.Name AS Student_Name,  
    c.Course_Name,  
    c.Faculty_Id,  
    c.Faculty_Email  
FROM Students s
INNER JOIN Course c ON s.VTU_Number = c.Student_ID;

----Left Join:
SELECT  
    s.VTU_Number,  
    s.Name,  
    c.Course_Name  
FROM Students s
LEFT JOIN Course c ON s.VTU_Number = c.Student_ID;
----right join----

SELECT  
    s.Name,  
    c.Course_Code,  
    c.Course_Name  
FROM Students s
RIGHT JOIN Course c ON s.VTU_Number = c.Student_ID;

----full join-----
SELECT  
    s.Name,  
    c.Course_Name  
FROM Students s
FULL OUTER JOIN Course c 
    ON s.VTU_Number = c.Student_ID;

------Cross Join(Cartesian Product):-----

SELECT s.Name, c.Course_Name
FROM Students AS s
CROSS JOIN Course AS c;
