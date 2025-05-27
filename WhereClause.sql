create database bookstore;
use bookstore;

create table books(
book_id int primary key auto_increment,
title varchar(500),
author varchar(100),
price decimal(10,2),
publication_date date,
category varchar(100),
int_stock int,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp

);

INSERT INTO books(
title,
author,
price,
publication_date,
category,
int_stock
)


 VALUES
( 'The MySQL Guide', 'John Smith', 29.99, '2023-01-15', 'Technology', 50),
( 'Data Science Basics', 'Sarah Johnson', 34.99, '2023-03-20', 'Technology', 30),
( 'Mystery at Midnight', 'Michael Brown', 19.99, '2023-02-10', 'Mystery', 100),
( 'Cooking Essentials', 'Lisa Anderson', 24.99, '2023-04-05', 'Cooking', 75);


select * from books;
select * from books where category='Technology';
select title, price from books where price <30.00;
select * from books where publication_date>'2023-01-01';

select * from books where category='Technology' and price >20.00;
select * from books where category='Technology' or price >20.00;


