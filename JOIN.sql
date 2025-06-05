show databases;
use db_inner_join;
show tables;
select * from authors;
select * from books;

select * from books inner join authors on books.author_id = authors.author_id;select * from books inner join authors on books.author_id = authors.author_id;
select * 
from books 
inner join authors 
on books.author_id = authors.author_id;


select books.title ,authors.first_name, authors.last_name from books 
inner join authors 
on books.author_id = authors.author_id 
where publication_year>'1940' order by birth_year;

-- how many books each author has written

select a.first_name, a.last_name,count(*) as total_book_written from authors as a inner join books as b on a.author_id = b.author_id
group by a.author_id having total_book_written>1
;


create table categories(
category_id int primary key,
category_name varchar(50)
);

insert into categories(
category_id,
category_name)
values(1, 'Fiction'),
    (2, 'Classic'),
    (3, 'Romance'),
    (4, 'Political'),
    (5, 'Mystery'),
    (6, 'Adventure');

select * from categories;

create table book_categories(
book_id int,
category_id int,
primary key(book_id,category_id)
);

INSERT INTO book_categories (book_id, category_id)
VALUES 
    (101, 1), (101, 2), (101, 3), -- Pride and Prejudice: Fiction, Classic, Romance
    (102, 1), (102, 2), (102, 4), -- 1984: Fiction, Classic, Political
    (103, 1), (103, 2), (103, 4), -- Animal Farm: Fiction, Classic, Political
    (104, 1), (104, 2), (104, 6), -- The Old Man and the Sea: Fiction, Classic, Adventure
    (105, 1), (105, 5), -- Murder on the Orient Express: Fiction, Mystery
    (106, 1), (106, 5), -- Death on the Nile: Fiction, Mystery
    (107, 1), (107, 2), (107, 3), -- Emma: Fiction, Classic, Romance
    (108, 1), (108, 2), (108, 6); -- For Whom the Bell Tolls: Fiction, Classic, Adventure

select * from book_categories;

-- get books with there authors and categories;

select title,first_name,last_name,
group_concat(category_name)
from books 
inner join 
authors as a  on books.author_id = a.author_id 
inner join
book_categories as bc on books.book_id = bc.book_id
inner join 
categories as c on bc.category_id = c.category_id
group by books.book_id
 ;

-- return books published before 1950 by authors born before 1900

select title,publication_year, first_name, last_name ,birth_year
from books as b 
inner join 
authors a on b.author_id=a.author_id
and publication_year < 1950 and birth_year <1900;

-- find author who written book more than 1;
select a.first_name, a.last_name, group_concat(b.title separator ' | ') ,count(*) as total_book_written 
from authors as a 
inner join 
books as b on a.author_id = b.author_id
group by a.author_id having total_book_written>1
;












