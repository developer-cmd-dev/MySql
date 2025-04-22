
create database bookstore;
use bookstore;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    price DECIMAL(10,2),
    publication_date DATE,
    category VARCHAR(30),
    in_stock INT
);

INSERT INTO books VALUES
(1, 'The MySQL Guide', 'John Smith', 29.99, '2023-01-15', 'Technology', 50),
(2, 'Data Science Basics', 'Sarah Johnson', 34.99, '2023-03-20', 'Technology', 30),
(3, 'Mystery at Midnight', 'Michael Brown', 19.99, '2023-02-10', 'Mystery', 100),
(4, 'Cooking Essentials', 'Lisa Anderson', 24.99, '2023-04-05', 'Cooking', 75);

select * from books where category="Technology";
select title,author,price from books where price < 30.00;

select title, publication_date from books where publication_date >='2023-03-01';

-- logical operator
select * from books where category="Technology" and price<30.00; -- and operatorl.
select * from books where category="Technology" or price<30.00; -- or operator.
select * from books where (category="Technology" or "Mystery") and price < 25; -- combine orperator.
select * from books where category!="Technology"; -- not operator.

-- finding null values.
INSERT INTO books VALUES
(5, 'Think and grow rich', null, 29.99, '2023-01-15', 'Self Improvement', 50);

select* from books where author is null;
select* from books where author is not null;

alter table books
modify book_id int auto_increment ;


-- Pattern Matching.
select * from books where title like '%sql%'; -- case insensitive.
select * from books where title like 'The%'; -- case insensitive.
select * from books where title like binary '%SQL%'; -- case sensitive.

select * from books where price between 24 and 30;

select * from books where category in ('Technology','Cooking','Self Improvement');

select * from books where price between 30 and 20 and publication_date >='2023-03-01';