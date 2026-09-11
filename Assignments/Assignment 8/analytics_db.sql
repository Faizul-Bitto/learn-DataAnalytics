-- Create Database
CREATE DATABASE IF NOT EXISTS analytics_db;
USE analytics_db;

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;

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

CREATE TABLE sales (
 order_id INT PRIMARY KEY,
 customer_name VARCHAR(50),
 region VARCHAR(30),
 product_id INT,
 product_name VARCHAR(50),
 sales_amount DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1001,'Alice','North',101,'Laptop',850.00),
(1002,'Bob','South',102,'Mouse',25.50),
(1003,'Charlie','East',103,'Keyboard',45.00),
(1004,'David','West',104,'Monitor',220.00),
(1005,'Emma','North',105,'Printer',180.00),
(1006,'Farhan','South',106,'Desk Chair',140.00),
(1007,'Grace','East',107,'Notebook',12.50),
(1008,'Hasan','West',108,'Pen',5.00),
(1009,'Ivy','North',109,'USB Drive',18.00),
(1010,'Jack','South',110,'Webcam',65.00),
(1011,'Karen','East',101,'Laptop',900.00),
(1012,'Liam','West',102,'Mouse',28.00),
(1013,'Mia','North',103,'Keyboard',48.00),
(1014,'Noah','South',104,'Monitor',230.00),
(1015,'Olivia','East',105,'Printer',175.00),
(1016,'Peter','West',106,'Desk Chair',150.00),
(1017,'Queen','North',107,'Notebook',15.00),
(1018,'Ryan','South',108,'Pen',6.00),
(1019,'Sophia','East',109,'USB Drive',20.00),
(1020,'Thomas','West',110,'Webcam',70.00),
(1021,'Uma','North',101,'Laptop',870.00),
(1022,'Victor','South',102,'Mouse',26.00),
(1023,'William','East',103,'Keyboard',50.00),
(1024,'Xavier','West',104,'Monitor',240.00),
(1025,'Yasmin','North',105,'Printer',190.00),
(1026,'Zara','South',106,'Desk Chair',155.00),
(1027,'Arif','East',107,'Notebook',14.00),
(1028,'Bushra','West',108,'Pen',7.50),
(1029,'Catherine','North',109,'USB Drive',22.00),
(1030,'Danish','South',110,'Webcam',72.00);
