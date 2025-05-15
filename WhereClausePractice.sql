show databases;
use bookstore;
show tables;
select * from books;

-- Find all books published	in 2023 that cost less than the average books price.
select * from books where year(publication_date) = 2023 and price <(select avg(price) from books);

-- List all technology books with 'data' int the title that have more than 50 copies in stock;
select * from books where title like '%data%' and int_stock < 50;


CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender CHAR(1),
    city VARCHAR(50),
    marks INT
);


INSERT INTO students (id, name, age, gender, city, marks) VALUES
(1, 'Anjali Mehra', 19, 'F', 'Delhi', 85),
(2, 'Rohan Singh', 21, 'M', 'Mumbai', 78),
(3, 'Sanya Sharma', 18, 'F', 'Chennai', 62),
(4, 'Karan Patel', 22, 'M', 'Ahmedabad', 47),
(5, 'Mehul Joshi', 20, 'M', 'Pune', NULL),
(6, 'Priya Das', 23, 'F', 'Kolkata', 91),
(7, 'Vikas Verma', 17, 'M', 'Delhi', 55),
(8, 'Neha Reddy', 21, 'F', 'Hyderabad', 67),
(9, 'Aditya Kumar', 19, 'M', 'Lucknow', 38),
(10, 'Isha Jain', 20, 'F', 'Bangalore', 74),
(11, 'Rahul Gupta', 22, 'M', 'Delhi', 88),
(12, 'Sneha Roy', 18, 'F', 'Kolkata', 59),
(13, 'Amit Sharma', 25, 'M', 'Jaipur', 92),
(14, 'Simran Kaur', 24, 'F', 'Chandigarh', NULL),
(15, 'Yash Malhotra', 20, 'M', 'Mumbai', 44);

select * from students;

-- Get all students whose age is greater than 18.
select * from students where age > 18;

-- Get all female students from the students table.
select * from students where gender ='F';

-- Get all students who scored less than 50 marks.
select * from students where marks <50;

-- Get the details of students who live in 'Delhi'.
select * from students where city = 'delhi';

-- Get students whose age is between 18 and 25.
select * from students where age between 18 and 25;

-- Get students who live in 'Mumbai' and have marks greater than 80.
select * from students where city='Mumbai'and marks >80;

-- Get students who are either from 'Chennai' or 'Bangalore'.
select * from students where city='chennai' or 'bangalore';

-- Get students who are male and younger than 20 years.
select * from students where gender='male' and age >20;

-- Get students who are either female or scored less than 60.
select * from students where gender ='female' or marks < 60;

-- Get students whose name starts with 'A'.
select * from students where name like 'A%';

-- Get students whose name ends with 'n'.
select * from students where name like '%n';

-- Get students whose name contains 'an' anywhere.
select * from students where name like '%an%';

-- Get students from cities 'Delhi', 'Mumbai', or 'Kolkata' using IN.
select * from students where city in('delhi','mumbai','kolkata');

-- Get students not from 'Delhi', 'Chennai', and 'Bangalore'.
select * from students where city not in('delhi','mumbai','kolkata');
