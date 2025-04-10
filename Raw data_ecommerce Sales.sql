
-- 📦 Simple E-Commerce Sample Database
-- Created on 2025-04-10

-- Drop database if exists and create a new one
DROP DATABASE IF EXISTS simple_ecommerce;
CREATE DATABASE simple_ecommerce;
USE simple_ecommerce;

-- Create Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50)
);

-- Create Products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create Order_Items table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample customers
INSERT INTO customers (name, email, country) VALUES
('Alice', 'alice@example.com', 'USA'),
('Bob', 'bob@example.com', 'Canada'),
('Charlie', 'charlie@example.com', 'UK');

-- Insert sample products
INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 900.00),
('Headphones', 'Electronics', 150.00),
('Coffee Mug', 'Home', 15.00),
('Notebook', 'Stationery', 5.00),
('Pen', 'Stationery', 2.00);

-- Insert sample orders
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-04-01'),
(2, '2025-04-02'),
(1, '2025-04-05');

-- Insert sample order items
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),  -- Alice bought 1 Laptop
(1, 2, 2),  -- Alice bought 2 Headphones
(2, 3, 3),  -- Bob bought 3 Coffee Mugs
(3, 4, 5),  -- Alice bought 5 Notebooks
(3, 5, 10); -- Alice bought 10 Pens
