create database StringFunctionDB;
use StringFunctionDB;

-- Create employees table for string function demonstrations
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50)
);

-- Insert sample employee data
INSERT INTO employees (first_name, last_name, email, department) VALUES
('John', 'Doe', 'john.doe@example.com', 'Marketing'),
('Jane', 'Smith', 'jane.smith@example.com', 'Sales'),
('Michael', 'Johnson', 'michael.johnson@example.com', 'IT'),
('Emily', 'Davis', 'emily.davis@example.com', 'HR'),
('Chris', 'Brown', 'chris.brown@example.com', 'Finance');

select concat(first_name ," ",last_name) as full_name from employees;

select first_name, length(first_name) from employees;
select first_name, upper(first_name) from employees;
select first_name, lower(first_name) from employees;
select trim(upper("      ok.       "));
select first_name, substring(first_name,1,3) as substring from employees;
select first_name , locate('a',first_name) as position_of_a from employees;
select first_name , locate('ch',first_name) as position_of_ch from employees;
select first_name, replace(email,"@example.com","@amazon.com") as replaced_email from employees;
select first_name, reverse(first_name) as reversed_name from employees;
select first_name, left(first_name,2) as first_two , right(first_name,2) as last_two from employees;
select ascii("a");

show databases;
use db12;
show tables;
select * from products;

select * from products
order by field(category,'Electronics','Appliances','Furniture') desc;
 
show databases;

use stringfunctiondb;

select * from employees where soundex("jane")=soundex(first_name);


-- basic mathematical functions
-- rounding functions.
-- Trigonometrics function.
-- Logarithmic and Exponential functions.
-- bitwise functions.


CREATE DATABASE NumericFunctionsDB;
USE NumericFunctionsDB;

CREATE TABLE numbers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    num_value DECIMAL(10,5)
);

INSERT INTO numbers (num_value) VALUES
(25.6789),
(-17.5432),
(100.999),
(-0.4567),
(9.5),
(1234.56789),
(0);

select num_value, abs(num_value) as absolute_value from numbers;
select num_value, ceil(num_value) as Round_up , floor(num_value) as round_down from numbers;
SELECT num_value, ROUND(num_value, 2) AS rounded_2_decimals FROM numbers;
SELECT num_value, TRUNCATE(num_value, 2) AS truncated_2_decimals FROM numbers;


-- Mathematical operations
SELECT num_value, POWER(num_value, 2) AS squared FROM numbers;
SELECT num_value, MOD(num_value, 3) AS remainder FROM numbers;
SELECT num_value, SQRT(ABS(num_value)) AS sqrt_value FROM numbers;


-- Exponential functions with handling for out-of-range values
SELECT 
    num_value, 
    CASE 
        WHEN num_value > 709 THEN 'Value too large for EXP()' 
        ELSE EXP(num_value) 
    END AS exp_value 
FROM numbers;


-- Logarithmic functions
SELECT num_value, 
       LOG(2, ABS(num_value) + 1) AS log_base2, 
       LOG10(ABS(num_value) + 1) AS log_base10 
FROM numbers;

-- Trigonometric functions
SELECT num_value, 
       SIN(num_value) AS sin_value, 
       COS(num_value) AS cos_value, 
       TAN(num_value) AS tan_value 
FROM numbers;

-- Pi constant and angle conversions
SELECT PI() AS pi_value;
SELECT num_value, 
       RADIANS(num_value) AS radians_value, 
       DEGREES(num_value) AS degrees_value 
FROM numbers;


-- Bitwise operations
SELECT BIT_AND(num_value) FROM numbers;
SELECT BIT_OR(num_value) FROM numbers;
SELECT BIT_XOR(num_value) FROM numbers;

-- =================
-- DATE FUNCTIONS
-- =================

-- Date and time data types:
-- DATE	        YYYY-MM-DD           Stores only date without time
-- DATETIME     YYYY-MM-DD HH:MI:SS  Stores date and time
-- TIMESTAMP    YYYY-MM-DD HH:MI:SS  Stores date/time with automatic UTC conversion
-- TIME         HH:MI:SS             Stores only time
-- YEAR         YYYY                 Stores only a four-digit year


-- Current date and time functions
SELECT NOW() AS current_datetime;
SELECT CURDATE() AS current_date;
SELECT CURTIME() AS current_time;

-- Date part extraction
SELECT YEAR(NOW()) AS current_year;
SELECT MONTH(NOW()) AS current_month;
SELECT DAY(NOW()) AS current_day;
SELECT HOUR(NOW()) AS current_hour;
SELECT MINUTE(NOW()) AS current_minute;
SELECT SECOND(NOW()) AS current_second;

-- Date formatting
SELECT DATE_FORMAT('2025-03-13', '%W, %M %e, %Y') AS formatted_date_long; -- "Thursday, March 13, 2025"
SELECT DATE_FORMAT('2025-03-13', '%e/%m/%Y') AS formatted_date_short; -- "13/03/2025"


-- Date arithmetic
SELECT DATE_ADD('2025-03-13', INTERVAL 7 MONTH) AS date_plus_7_months;
SELECT DATE_SUB('2025-03-13', INTERVAL 7 MONTH) AS date_minus_7_months;

-- Date difference
SELECT DATEDIFF('2025-03-10', '2024-03-03') AS days_between;

-- Unix timestamp functions (seconds since January 1, 1970, at 00:00:00 UTC)
SELECT UNIX_TIMESTAMP('2025-03-03') AS unix_time;
SELECT FROM_UNIXTIME(1741392000) AS readable_date;

-- Date function examples with a database
CREATE DATABASE DateExamplesDB;
USE DateExamplesDB;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATETIME
);

INSERT INTO orders (customer_name, order_date) VALUES
('Alice', '2025-03-01 10:15:00'),
('Bob', '2025-03-02 14:45:30'),
('Charlie', '2025-03-03 09:30:15'),
('Akshay', '2024-03-01 10:15:00');

-- Querying orders in the last 7 days
SELECT * FROM orders WHERE order_date >= DATE_SUB(NOW(), INTERVAL 7 DAY);


-- =================
-- AGGREGATE FUNCTIONS
-- =================
-- Used to perform calculations on multiple rows of data and return a single summarized value
-- COUNT() – Returns the number of rows
-- SUM() – Returns the sum of a numeric column
-- AVG() – Returns the average value of a numeric column
-- MIN() – Returns the minimum value
-- MAX() – Returns the maximum value

CREATE DATABASE CompanyDB2;
USE CompanyDB2;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice', 'HR', 50000, '2018-06-23'),
('Bob', 'IT', 70000, '2019-08-01'),
('Charlie', 'Finance', 80000, '2017-04-15'),
('David', 'HR', 55000, '2020-11-30'),
('Eve', 'IT', 75000, '2021-01-25'),
('Frank', 'Finance', 72000, '2019-07-10'),
('Grace', 'IT', 68000, '2018-09-22'),
('Hank', 'Finance', 90000, '2016-12-05'),
('Ivy', 'HR', 53000, '2022-03-19'),
('Jack', 'IT', 72000, '2017-05-12');

-- Count employees in HR department
SELECT COUNT(*) AS hr_employee_count FROM employees WHERE department='HR';

-- Sum of salaries in HR department
SELECT SUM(salary) AS total_hr_salary FROM employees WHERE department='HR';

-- Average salary in HR department
SELECT AVG(salary) AS avg_hr_salary FROM employees WHERE department='HR';

-- Minimum salary in HR department
SELECT MIN(salary) AS min_hr_salary FROM employees WHERE department='HR';

-- Maximum salary in HR department
SELECT MAX(salary) AS max_hr_salary FROM employees WHERE department='HR';

-- Comprehensive statistics for all employees
SELECT 
    COUNT(*) AS num_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary
FROM employees;

-- Group by department to get statistics per department
SELECT 
    department,
    COUNT(*) AS employee_count,
    SUM(salary) AS department_total_salary,
    ROUND(AVG(salary), 2) AS department_avg_salary,
    MIN(salary) AS department_min_salary,
    MAX(salary) AS department_max_salary
FROM employees
GROUP BY department
ORDER BY department_avg_salary DESC;

