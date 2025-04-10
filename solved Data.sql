-- List all customers from the USA, ordered by name:

SELECT 
    name, email, country
FROM
    customers
WHERE
    country = 'USA'
ORDER BY name ASC;

-- Total quantity sold per product:

SELECT 
    p.product_name, SUM(oi.quantity) AS total_sold
FROM
    order_items oi
        JOIN
    products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- INNER JOIN: Show all orders with customer name and order date:

SELECT 
    o.order_id, c.name AS customer_name, o.order_date
FROM
    orders o
        INNER JOIN
    customers c ON o.customer_id = c.customer_id;
    
    -- LEFT JOIN: Show all customers and their orders

SELECT 
    c.name, o.order_id, o.order_date
FROM
    customers c
        LEFT JOIN
    orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN: Show all orders and customer info

SELECT 
    o.order_id, c.name AS customer_name
FROM
    orders o
        RIGHT JOIN
    customers c ON o.customer_id = c.customer_id;
    
-- Find customers who placed more than 1 order:

SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);

-- Total revenue per category:

SELECT 
    p.category, SUM(p.price * oi.quantity) AS total_revenue
FROM
    order_items oi
        JOIN
    products p ON oi.product_id = p.product_id
GROUP BY p.category;

-- Create a view for top-selling products:

CREATE VIEW TopSellingProducts AS
    SELECT 
        p.product_name, SUM(oi.quantity) AS total_sold
    FROM
        order_items oi
            JOIN
        products p ON oi.product_id = p.product_id
    GROUP BY p.product_name
    ORDER BY total_sold DESC;

-- Add index on customer_id and order_date for faster search:

CREATE INDEX idx_customer_order ON orders (customer_id, order_date);







