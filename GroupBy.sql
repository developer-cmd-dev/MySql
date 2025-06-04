show databases;
create database db_for_group_by;
use db_for_group_by;

create table employees(
	id int auto_increment primary key,
    name varchar(200),
    department varchar(50),
    salary decimal(10,2),
    joining_date date
);


INSERT INTO employees (name, department, salary, joining_date)
value
('Alice', 'HR', 50000, '2020-06-15'),
('Bob', 'HR', 55000, '2019-08-20'),
('Charlie', 'IT', 70000, '2018-03-25'),
('David', 'IT', 72000, '2017-07-10'),
('Eve', 'IT', 73000, '2021-02-15'),
('Frank', 'Finance', 60000, '2020-11-05'),
('Grace', 'Finance', 65000, '2019-05-30'),
('Hannah', 'Finance', 62000, '2021-01-12');

INSERT INTO employees (name, department, salary, joining_date) VALUES
('Tim', 'HR', 65000, '2019-05-30'),
('Tom', 'IT', 62000, '2021-01-12');

select * from employees;

select department,count(*) from employees group by department;

select department, avg(salary) from employees group by department;

select department, max(salary) as highest_salary, min(salary) as min_salary from employees group by department;

select department, count(*) ,year(joining_date) from employees group by department, year(joining_date);

select department,avg(salary) as avg_salary from employees group by department order by avg_salary desc;


select department, count(*),
 case
   when salary < 60000 then 'Low Salary'
   when salary between 60000 and 70000 then 'medium salary'
   when salary > 70000 then 'highest salary'
 end as salary_range 
from employees group by salary_range ,department order by count(*) ;

select  department,count(*) 
as total_employees 
from employees 
group by department
order by total_employees desc limit 1 ;

select  department,count(*) 
as total_employees 
from employees 
group by department
having total_employees>3;
















