-- SQL INNER JOIN Lecture
-- An INNER JOIN returns only the rows where there is a match in both tables based on the specified join condition.
-- If there's no match, the rows from both tables are excluded from the result set.

-- Create database
CREATE DATABASE db_inner_join;
USE db_inner_join;

-- Create authors table
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_year INT
);

-- Create books table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publication_year INT,
    price DECIMAL(6,2)
);

-- Insert data into authors table
INSERT INTO authors (author_id, first_name, last_name, birth_year)
VALUES 
    (1, 'Jane', 'Austen', 1775),
    (2, 'George', 'Orwell', 1903),
    (3, 'Ernest', 'Hemingway', 1899),
    (4, 'Agatha', 'Christie', 1890),
    (5, 'J.K.', 'Rowling', 1965);

-- Insert data into books table
INSERT INTO books (book_id, title, author_id, publication_year, price)
VALUES 
    (101, 'Pride and Prejudice', 1, 1813, 12.99),
    (102, '1984', 2, 1949, 14.50),
    (103, 'Animal Farm', 2, 1945, 11.75),
    (104, 'The Old Man and the Sea', 3, 1952, 10.99),
    (105, 'Murder on the Orient Express', 4, 1934, 13.25),
    (106, 'Death on the Nile', 4, 1937, 12.50),
    (107, 'Emma', 1, 1815, 11.99),
    (108, 'For Whom the Bell Tolls', 3, 1940, 15.75);

-- Display table contents
SELECT * FROM authors;
SELECT * FROM books;

-- Retrieve books with their author's information

select * from authors
join books on authors.author_id = books.author_id;

-- how many books each author written
select authors.first_name, authors.last_name, count(*) as book_count from authors join books on authors.author_id = books.author_id group by authors.author_id ;




























