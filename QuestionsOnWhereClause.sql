
use bookstore;

show databases;
select * from books;

-- Find all books publisehd in 2023 that cost less than the average book price.
select * from books where year(publication_date) = '2023' and price < (select avg(price) from books);

-- List all technology books with "Data" in the title that have more than 50 copies in stock.
select * from books where title like '%data%' and category = 'technology' and in_stock > 50;

-- Find books that are either in the technology category with price > $30 or in the mystry category with price < $20
select * from books where (price > 30 and category = 'technology') or (price < 20 and category = 'mystery');

-- List all books where the author name contains either 'son' or 'th' and were published after march 2023;
select * from books where title like '%son%' or '%or%' and month(publication_date)> '03';

