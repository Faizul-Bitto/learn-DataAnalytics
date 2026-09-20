-- Step 1: Database setup
CREATE DATABASE company_db;

USE company_db;

CREATE TABLE product (
    product_id    INT PRIMARY KEY,
    product_name  VARCHAR(100) NOT NULL,
    category      VARCHAR(50)  NOT NULL
);

CREATE TABLE customers (
    customer_id    INT PRIMARY KEY,
    customer_name  VARCHAR(100) NOT NULL
);

CREATE TABLE sales (
    order_id      INT PRIMARY KEY,
    customer_id   INT NOT NULL,
    region        VARCHAR(30) NOT NULL,
    product_id    INT NOT NULL,
    quantity      INT NOT NULL,
    sales_amount  DECIMAL(10,2) NOT NULL,
    order_date    DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)  REFERENCES product(product_id)
);

INSERT INTO product (product_id, product_name, category) VALUES
(1,  'Laptop',              'Electronics'),
(2,  'Smartphone',          'Electronics'),
(3,  'Wireless Headphones', 'Electronics'),
(4,  'Smart Watch',         'Electronics'),
(5,  'Office Chair',        'Furniture'),
(6,  'Standing Desk',       'Furniture'),
(7,  'Bookshelf',           'Furniture'),
(8,  'Notebook Pack',       'Stationery'),
(9,  'Ballpoint Pen Box',   'Stationery'),
(10, 'Desk Organizer',      'Stationery'),
(11, 'Running Shoes',       'Apparel'),
(12, 'Cotton T-Shirt',      'Apparel'),
(13, 'Denim Jacket',        'Apparel'),
(14, 'Blender',             'Home Appliances'),
(15, 'Microwave Oven',      'Home Appliances');

INSERT INTO customers (customer_id, customer_name) VALUES
(1,  'Alice Johnson'),
(2,  'Rahim Uddin'),
(3,  'Maria Garcia'),
(4,  'David Chen'),
(5,  'Fatima Khan'),
(6,  'John Smith'),
(7,  'Aisha Rahman'),
(8,  'Carlos Mendes'),
(9,  'Emily Davis'),
(10, 'Karim Hossain'),
(11, 'Sophia Lee'),
(12, 'Nadia Islam');

INSERT INTO sales (order_id, customer_id, region, product_id, quantity, sales_amount, order_date) VALUES
(1001, 1,  'North', 1,  2,  1800.00, '2026-01-05'),
(1002, 2,  'South', 2,  1,   600.00, '2026-01-12'),
(1003, 3,  'East',  3,  3,   360.00, '2026-01-20'),
(1004, 4,  'West',  5,  2,   300.00, '2026-02-02'),
(1005, 5,  'North', 8,  10,  150.00, '2026-02-14'),
(1006, 6,  'South', 11, 2,   160.00, '2026-02-25'),
(1007, 7,  'East',  14, 1,    45.00, '2026-03-03'),
(1008, 8,  'West',  4,  1,   200.00, '2026-03-15'),
(1009, 9,  'North', 6,  1,   350.00, '2026-03-28'),
(1010, 10, 'South', 12, 5,   100.00, '2026-04-06'),
(1011, 1,  'East',  15, 2,   260.00, '2026-04-18'),
(1012, 3,  'West',  2,  2,  1200.00, '2026-05-01'),
(1013, 11, 'North', 13, 3,   210.00, '2026-05-09'),
(1014, 12, 'South', 7,  2,   220.00, '2026-05-21'),
(1015, 2,  'East',  9,  20,  160.00, '2026-06-02'),
(1016, 4,  'North', 1,  1,   900.00, '2026-06-15');


-- Step 2: Using multiple joins
SELECT 
	sales.order_id, 
	sales.customer_id,
	customers.customer_name,
	sales.region,
	sales.product_id,
	product.product_name,
	product.category,
	sales.quantity,
	sales.sales_amount,
	sales.order_date
FROM company_db.sales
JOIN company_db.customers 
	ON sales.customer_id = customers.customer_id
JOIN company_db.product 
	ON sales.product_id = product.product_id;
    
    
-- Step 3: Creating subqueries for filtering
SELECT 
	product.product_name,
	sales.sales_amount
FROM company_db.sales
JOIN company_db.product 
	ON sales.product_id = product.product_id
WHERE sales.sales_amount > (SELECT avg(sales_amount) from sales)
ORDER BY sales.sales_amount DESC;


-- Step 4: Nested aggregation queries
SELECT
    region,
    total_sales
FROM (
    SELECT region, SUM(sales_amount) AS total_sales
    FROM company_db.sales
    GROUP BY region
) AS region_totals
ORDER BY total_sales DESC
LIMIT 2;


-- Step 5: Advanced grouping
SELECT 
	sales.region,
	product.category,
	COUNT(*)            AS total_orders,
	SUM(sales.quantity)     AS total_quantity,
	SUM(sales.sales_amount) AS total_sales
FROM company_db.sales
JOIN company_db.product 
	ON sales.product_id = product.product_id
GROUP BY sales.region, product.category
ORDER BY sales.region, total_sales DESC;


-- Step 6: Using HAVING clause
SELECT
    region,
    SUM(sales_amount) AS total_sales
FROM company_db.sales
GROUP BY region
HAVING SUM(sales_amount) > 1500
ORDER BY total_sales DESC;


-- Step 7: Subqueries in SELECT
SELECT
    (SELECT SUM(sales_amount) FROM company_db.sales)          AS total_sales,
    (SELECT ROUND(AVG(sales_amount), 2) FROM company_db.sales) AS avg_sales;