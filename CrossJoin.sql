create database cross_join_tutorial;
use cross_join_tutorial;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL
);

CREATE TABLE colors (
    color_id INT PRIMARY KEY,
    color_name VARCHAR(30) NOT NULL
);

INSERT INTO products (product_id, product_name) VALUES
(1, 'T-shirt'),
(2, 'Jeans'),
(3, 'Sweater'),
(4, 'Jacket');
INSERT INTO colors (color_id, color_name) VALUES
(1, 'Red'),
(2, 'Blue'),
(3, 'Green'),
(4, 'Black'),
(5, 'White');

select * from products cross join colors;





























