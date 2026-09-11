-- Use Database
USE analytics_db;



-- Step 2: Basic SELECT queries -> Write SELECT queries to display all records and specific columns such as product and sales_amount.
SELECT *
FROM products;

SELECT *
FROM sales;

SELECT product_name, sales_amount
FROM sales;



-- Step 3: Filtering with WHERE clause -> Filter records by region and by product name.
SELECT *
FROM sales
WHERE region = "West";

SELECT *
FROM sales
WHERE product_name = "Laptop";

SELECT *
FROM sales
WHERE region = "North" AND product_name = "Laptop";



-- Step 4: Sorting with ORDER BY -> Sort sales_amount from highest to lowest. Sort data by customer_name alphabetically.
SELECT *
FROM sales
ORDER BY sales_amount DESC;

SELECT *
FROM sales
ORDER BY customer_name ASC;



-- Step 5: Aggregating data -> Use SUM to calculate total sales. Use COUNT to calculate number of orders.
SELECT SUM(sales_amount) as total_sales
FROM sales;

SELECT COUNT(order_id) as number_of_orders
FROM sales;



-- Step 6: Grouping data -> Group sales by region and calculate total sales per region. Group sales by product.
SELECT region, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY region;

SELECT product_name
FROM sales
GROUP BY product_name;

SELECT product_name, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY product_name;



-- Step 7: Creating second table for joins -> Create a table named products with columns: product_id, product_name, category. Insert sample product data.
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50)
);

INSERT INTO products VALUES
(101,'Laptop','Electronics'),
(102,'Mouse','Electronics'),
(103,'Keyboard','Electronics'),
(104,'Monitor','Electronics'),
(105,'Printer','Office Equipment'),
(106,'Desk Chair','Furniture'),
(107,'Notebook','Stationery'),
(108,'Pen','Stationery'),
(109,'USB Drive','Accessories'),
(110,'Webcam','Accessories');



-- Step 8: Using SQL joins -> Join sales and products tables to show product category with sales.
SELECT s.order_id,
       s.customer_name,
       s.region,
       s.product_name,
       p.category,
       s.sales_amount
FROM sales s
JOIN products p ON s.product_id = p.product_id;



-- Step 9: Simple dashboard-style queries -> Create queries that show: Total sales per category, Top selling product.
SELECT p.category, SUM(s.sales_amount) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

SELECT product_name as top_selling_product, COUNT(*) AS units_sold
FROM sales
GROUP BY product_name
ORDER BY units_sold DESC
LIMIT 1;