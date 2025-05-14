create database test;
use test;
create table employees(
employee_id int primary key auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) unique,
phone_number varchar(10) unique,
hire_date date default (current_date()),
salary decimal(10,2) check (salary>0.0),
employment_status enum('active','on leave','terminated') default 'active',
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp

);


insert into employees(
first_name,
last_name,
email,
phone_number,
salary,
employment_status
)
values(
"Vaidehi",
"Mandal",
"vaidehi@gmail.com",
"1231323128",
800000.00,
"Active"
),(
"Naman",
"Kumar",
"naman@gmail.com",
"1231323167",
400000.00,
"Active");


select * from employees;

alter table employees
modify column emergency_contact varchar(50) not null ;

alter table employees
drop column emergency_contact;

create table departments(
department_id int primary key auto_increment,
department_name varchar(100),
location varchar (500),
created_at timestamp default (current_timestamp()),
updated_at timestamp default (current_timestamp()) on update current_timestamp
);

insert into departments(department_name,location)
values('IT','Banglore'),('HR','Chennai'),('SALES','London');

select * from departments;

alter table employees
add column department_id int;


alter table employees
modify column department_id int not null;

alter table employees
add foreign key (department_id) references departments(deparment_id);

alter table employees
 add foreign key (department_id) references departments(department_id);
