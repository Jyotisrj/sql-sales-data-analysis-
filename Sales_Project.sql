-- SQL Retail Sales Analysis Project

-- 1. Create Customers Table
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- 2. Create Sales Table
CREATE TABLE sales (
    order_id INT,
    customer_id INT,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

-- 3. Insert Data into Customers (including duplicates)
INSERT INTO customers VALUES
(101,'Amit','Delhi'),
(102,'Riya','Mumbai'),
(103,'Neha','Delhi'),
(104,'Rahul',NULL),
(104,'Rahul',NULL);

-- 4. Insert Data into Sales (including NULL values)
INSERT INTO sales VALUES
(1,101,'Laptop',1,55000,'2025-01-01'),
(2,102,'Mouse',2,500,'2025-01-02'),
(3,101,'Keyboard',1,1500,'2025-01-05'),
(4,103,'Laptop',1,52000,'2025-01-10'),
(5,104,'Monitor',2,12000,'2025-01-11'),
(6,102,'Mouse',NULL,500,'2025-01-12');

-- 5. Query1: Remove duplicate records
SELECT DISTINCT * FROM customers;

-- 6.  Query2: Handle NULL values using COALESCE
SELECT 
    order_id,
    customer_id,
    product,
    COALESCE(quantity,1) AS quantity,
    price
FROM sales;

-- 7.  Query3:Data extraction using WHERE
SELECT * 
FROM sales
WHERE price > 1000;

-- 8.  Query4:JOIN Customers and Sales tables
SELECT 
    s.order_id,
    c.customer_name,
    c.city,
    s.product,
    s.quantity,
    s.price
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id;

-- 9.  Query5:Aggregation using GROUP BY (Customer-wise spending)
SELECT 
    c.customer_name,
    SUM(s.quantity * s.price) AS total_spent
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.customer_name;

-- 10.  Query6:City-wise sales analysis
SELECT 
    c.city,
    SUM(s.quantity * s.price) AS city_sales
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.city;

