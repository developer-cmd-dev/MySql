show databases;

create database instagram;

use instagram;

create table user(
user_id int primary key auto_increment,
first_name varchar(100) not null,
last_namer varchar(100) not null,
username varchar(50) not null,
email varchar(50) not null unique check(email regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
password varchar(50) not null,
account_status enum("enable","disable") default "enable",
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);

select * from users;

alter table user rename to users;

insert into users( first_name, last_namer, username, email, password, account_status)
values("Dev","Kumar","devk","devkmandal0@gmail.com","12345","disable");

alter table users 
rename column last_namer to last_name;