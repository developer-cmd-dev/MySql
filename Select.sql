use test;
show tables;
select * from employees;
select first_name as 'First-Name', last_name, email, phone_number from employees;
select * from employees where employment_status = 'active' order by Salary desc; 
select * from employees limit 2;	
select * from employees limit 2;	

alter table employees
add column department varchar(100);

select distinct department from employees;
select first_name,last_name,salary*1.1 from employees;
select concat(first_name,' ',last_name) as 'Full Name',year(hire_date),round(salary,0) from employees where salary > 600000;

select salary from employees where salary >(select avg(salary) from employees);
