-- Create database
CREATE DATABASE sales_analysis;
USE sales_analysis;

-- Create sales table
CREATE TABLE sales (
    order_id INT,
    customer_id INT,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

-- Insert sample data
INSERT INTO sales VALUES
(1,101,'Laptop',1,55000,'2025-01-01'),
(2,102,'Mouse',2,500,'2025-01-02'),
(3,101,'Keyboard',1,1500,'2025-01-05'),
(4,103,'Laptop',1,52000,'2025-01-10'),
(5,104,'Monitor',2,12000,'2025-01-11'),
(6,102,'Mouse',1,500,'2025-01-12');

-- Total sales
SELECT SUM(quantity * price) AS total_sales
FROM sales;

-- Product-wise sales
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product;

-- Customer spending
SELECT customer_id, SUM(quantity*price) AS spending
FROM sales
GROUP BY customer_id
ORDER BY spending DESC;
