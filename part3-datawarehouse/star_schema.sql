DROP database if EXISTS dbase_retail;

CREATE database dbase_retail;
USE dbase_retail;

DROP TABLE dim_customer;
DROP TABLE dim_date;
DROP TABLE dim_store;
DROP TABLE dim_product;

CREATE TABLE dim_date (
 	date_id INT PRIMARY KEY AUTO_INCREMENT,
 	date DATE,
 	year INT,
 	quarter INT,
 	month INT,
 	day INT,
 	weekday VARCHAR(10)
 );

CREATE TABLE dim_store (
 	store_id INT PRIMARY KEY AUTO_INCREMENT,
 	store_name VARCHAR(50),
 	store_city VARCHAR(30),
 	state VARCHAR(30)
 );

CREATE TABLE dim_product (
 	product_id INT PRIMARY KEY AUTO_INCREMENT,
 	product_name VARCHAR(50),
 	category VARCHAR(30)
 );
 
 
 
 CREATE TABLE fact_sales (
 	sales_id INT PRIMARY KEY AUTO_INCREMENT,
 	date_id INT,
 	store_id INT,
 	product_id INT,
 	units_sold INT,
    unit_price DECIMAL(10,2),
 	FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
 	FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
 	FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
 );


INSERT INTO dim_date (date, year, quarter, month, day)
VALUES
('2023-01-15', 2023, 1, 1, 1),
('2023-11-18', 2023, 4, 11, 7),
('2023-02-08', 2023, 1, 2, 4),
('2023-10-31', 2023, 4, 10, 3),
('2023-03-08', 2023, 1, 3, 4),
('2023-04-23', 2023, 2, 4, 1),
('2023-05-01', 2023, 2, 5, 2),
('2023-03-05', 2023, 1, 3, 1),
('2023-08-14', 2023, 3, 8, 2),
('2023-11-24', 2023, 4, 11, 6),
('2023-09-23', 2023, 3, 9, 7);
SELECT * from dim_date;

INSERT INTO dim_store(store_name,store_city,state)
VALUES('Bangalore MG','Bangalore','KARNATAKA'),('Chennai Anna','Chennai','TAMIL NADU'),
('Delhi South','Delhi','Delhi'),('Mumbai Central','Mumbai','MAHARASHTRA'),
('Pune FC Road','Pune','MAHARASHTRA');
Select * from dim_store;

INSERT INTO dim_product(product_name,category)
VALUES('Smartwatch','electronics'),('Atta 10kg','Grocery'),
('Jacket','Clothing'),('Headphones','electronics'),
('Pulses 1kg','Grocery'),('Saree','Clothing');
Select * from dim_product;


INSERT INTO fact_sales (date_id, store_id, product_id, units_sold, unit_price)
VALUES
(1, 2, 1, 10, 58851.01),
(3, 1, 4, 15, 39854.96),
(5, 2, 4, 12, 39854.96),
(8, 5, 4, 17, 39854.96),
(6, 5, 6, 2, 35451.81),
(7, 1, 2, 5, 52464),
(7, 4, 1, 2, 58851.01),
(9, 1, 1, 3, 58851.01),
(2, 3, 3, 5, 30187.24),
(4, 2, 2, 17, 52464),
(1, 1, 2, 8, 52464),
(2, 4, 6, 6, 35451.81),
(3, 5, 5, 10, 31604.47),
(4, 3, 3, 7, 30187.24),
(5, 2, 1, 4, 58851.01),
(6, 1, 6, 9, 35451.81),
(7, 5, 2, 11, 52464),
(8, 4, 4, 5, 39854.96),
(9, 3, 1, 3, 58851.01),
(10, 2, 5, 14, 31604.47);
Select * from fact_sales;