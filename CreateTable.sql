show databases;
create database test;
use test;

create table employee(
employee_id int primary key auto_increment,
fist_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(50) unique,
hire_date date default (current_date()),
salary decimal(10,2) check (salary>0.0),
phone_number varchar(20) unique,
employee_status enum("active","on leave","terminated") default "active",
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp

);

insert into employee(
fist_name,
last_name,
email,
salary,
phone_number
)
values(
"Dev",
"Kumar",
"devkmandal0@gmail.com",
100000,
"+918051501320"
),
(
"Naman",
"Kumar",
"naman@gmail.com",
120000,
"+918051501321"
),
(
"Vaidehi",
"Kumari",
"vaidehi@gmail.com",
500000,
"+918051501322"
);


select * from employee;
select * from department;


create table department(
department_id int primary key auto_increment,
department_name varchar(50) not null,
location varchar(200),
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp
);

alter table employee
add column description text;

alter table employee
add column emergency_contact varchar(20) not null check(emergency_contact regexp "^(?:\+91[\-\s]?|0)?[6-9]\d{9}$
");

alter table employee
modify column department_id int not null ;

insert into department(
department_name, location
)
values("IT","Building A"),("HR","Building B"),("MARKETING","Building E");

alter table employee  drop  department_id;

alter table employee add foreign key (department_id) references department(department_id);

