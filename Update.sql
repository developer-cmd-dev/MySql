create database store_inventory;
use store_inventory;

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(20),
    price DECIMAL(10, 2),
    stock_quantity INT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert initial data
INSERT INTO products (product_id, product_name, category, price, stock_quantity)
VALUES 
    (1, 'Laptop', 'Electronics', 899.99, 25),
    (2, 'Desk Chair', 'Furniture', 149.50, 40),
    (3, 'Coffee Maker', 'Appliances', 79.99, 15),
    (4, 'Headphones', 'Electronics', 129.99, 30),
    (5, 'Desk Lamp', 'Furniture', 24.99, 50);
    
    
    
-- View all products
SELECT * FROM products;

update products set price = price * 0.9 where product_id  >0;

update products set price = price+1 where product_id =1;

update products set price = price * 0.1 where product_id  >0 limit 2;






alter table products
modify last_updated timestamp default current_timestamp on update current_timestamp;

update products set price = 99.99 where product_id=1; 










