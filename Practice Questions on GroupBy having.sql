show databases;
use  db_for_group_by;
show tables;
select * from employees;

-- Count how many employees joined on the same date.

select day(joining_date) as same_date,count(*) from employees group by same_date order by same_date  ;


-- Find departments where the total salary of all employees is more than ₹50,000.
select department, count(*) from employees group by(department) having sum(salary) >50000 ;


-- Get departments having more than 3 employees.
select department, count(*) 
as total_employees
from employees
group by (department) 
having total_employees > 3;

-- List departments and their average salary, but only for departments where the average salary is less than ₹30,000.
select department, avg(salary)
as average_salary,
count(*)
from employees
group by (department) 
having average_salary > 30000;









