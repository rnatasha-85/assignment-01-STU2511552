/*Schema Design*/

DROP DATABASE IF EXISTS db_retail;

/*Creating Database*/
CREATE DATABASE  IF NOT EXISTS db_retail;
USE db_retail;

/*Creating Tables*/
CREATE TABLE customers 
(
customer_id varchar(10),
customer_name varchar(50) NOT NULL,
customer_email varchar(100) NOT NULL,
customer_city varchar(50) NOT NULL,
PRIMARY KEY (customer_id)
);

CREATE TABLE products
(
product_id varchar(10),
product_name varchar(50) NOT NULL,
category varchar(50) NOT NULL,
unit_price decimal(10,2) NOT NULL,
PRIMARY KEY (product_id)
);

CREATE TABLE sales_reps
(
sales_rep_id varchar(10),
sales_rep_name varchar(50) NOT NULL,
sales_rep_email varchar(100) NOT NULL,
office_address varchar(100) NOT NULL,
PRIMARY KEY (sales_rep_id)
);

CREATE TABLE orders
(
order_id varchar(10),
order_date date NOT NULL,
customer_id varchar(10) NOT NULL,
product_id varchar(10) NOT NULL,
quantity int NOT NULL,
sales_rep_id varchar(10) NOT NULL,
PRIMARY KEY (order_id),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
FOREIGN KEY (product_id) REFERENCES products (product_id),
FOREIGN KEY (sales_rep_id) REFERENCES sales_reps (sales_rep_id)
);


/*Inserting Data*/

INSERT INTO customers(customer_id,customer_name,customer_email,customer_city)
VALUES('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Bangalore'),('C004','Sneha Iyer','sneha@gmail.com','Chennai'),
('C005','Vikram Singh','vikram@gmail.com','Mumbai'),('C006','Neha Gupta','neha@gmail.com','Delhi'),
('C007','Arjun Nair','arjun@gmail.com','Bangalore'),('C008','Kavya Rao','kavya@gmail.com','Hyderabad');

select * from customers;




INSERT INTO products(product_id,product_name,category,unit_price)
VALUES('P001','Laptop','Electronics','55000'),('P002','Mouse','Electronics','800'),
('P003','Desk Chair','Furniture','8500'),('P004','Notebook','Stationery','120'),
('P005','Headphones','Electronics','3200'),('P006','Standing Desk','Furniture','22000'),
('P007','Pen Set','Stationery','250'),('P008','Webcam','Electronics','2100');

select * from products;




INSERT INTO sales_reps(sales_rep_id,sales_rep_name,sales_rep_email,office_address)
VALUES('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02','Anita Desai','anita@corp.com','Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03','Ravi Kumar','ravi@corp.com','South Zone, MG Road, Bangalore - 560001');

select * from sales_reps;


INSERT INTO orders(order_id, order_date, customer_id, product_id, quantity, sales_rep_id)
VALUES
('ORD1027', '2023-11-02', 'C002', 'P004', 4, 'SR02'),
('ORD1114', '2023-08-06', 'C001', 'P007', 2, 'SR01'),
('ORD1153', '2023-02-14', 'C006', 'P007', 3, 'SR01'),
('ORD1002', '2023-01-17', 'C002', 'P005', 1, 'SR02'),
('ORD1118', '2023-11-10', 'C006', 'P007', 5, 'SR02'),
('ORD1132', '2023-03-07', 'C003', 'P007', 5, 'SR02'),
('ORD1037', '2023-03-06', 'C002', 'P007', 2, 'SR03'),
('ORD1075', '2023-04-18', 'C005', 'P003', 3, 'SR03'),
('ORD1083', '2023-07-03', 'C006', 'P007', 2, 'SR01'),
('ORD1091', '2023-07-24', 'C001', 'P006', 3, 'SR01'),
('ORD1162', '2023-09-29', 'C006', 'P004', 3, 'SR03'),
('ORD1185', '2023-06-15', 'C003', 'P008', 1, 'SR03'),
('ORD1076', '2023-05-16', 'C004', 'P006', 5, 'SR03'),
('ORD1133', '2023-10-16', 'C001', 'P004', 1, 'SR03'),
('ORD1061', '2023-10-27', 'C006', 'P001', 4, 'SR01'),
('ORD1098', '2023-10-03', 'C007', 'P001', 2, 'SR03'),
('ORD1131', '2023-06-22', 'C008', 'P001', 4, 'SR02'),
('ORD1137', '2023-05-10', 'C005', 'P007', 1, 'SR02'),
('ORD1022', '2023-10-15', 'C005', 'P002', 5, 'SR01'),
('ORD1054', '2023-10-04', 'C002', 'P001', 1, 'SR03'),
('ORD1095', '2023-08-11', 'C001', 'P001', 3, 'SR03'),
('ORD1125', '2023-07-28', 'C004', 'P001', 3, 'SR02'),
('ORD1166', '2023-09-05', 'C003', 'P002', 3, 'SR01'),
('ORD1033', '2023-03-24', 'C004', 'P002', 5, 'SR02'),
('ORD1025', '2023-02-26', 'C008', 'P001', 2, 'SR01'),
('ORD1093', '2023-06-19', 'C007', 'P006', 1, 'SR03'),
('ORD1144', '2023-01-14', 'C005', 'P001', 3, 'SR03'),
('ORD1143', '2023-02-28', 'C003', 'P005', 2, 'SR03'),
('ORD1163', '2023-06-19', 'C007', 'P006', 3, 'SR03'),
('ORD1092', '2023-05-23', 'C005', 'P007', 3, 'SR01'),
('ORD1148', '2023-02-05', 'C007', 'P006', 5, 'SR02'),
('ORD1043', '2023-01-04', 'C004', 'P005', 1, 'SR01'),
('ORD1169', '2023-01-28', 'C003', 'P003', 5, 'SR01'),
('ORD1021', '2023-08-23', 'C008', 'P004', 2, 'SR03'),
('ORD1048', '2023-08-09', 'C002', 'P001', 3, 'SR03'),
('ORD1049', '2023-01-28', 'C007', 'P004', 1, 'SR02'),
('ORD1101', '2023-06-17', 'C005', 'P006', 4, 'SR02'),
('ORD1180', '2023-06-02', 'C008', 'P004', 3, 'SR01'),
('ORD1094', '2023-10-25', 'C002', 'P003', 3, 'SR01'),
('ORD1161', '2023-05-05', 'C004', 'P004', 3, 'SR03'),
('ORD1012', '2023-05-29', 'C001', 'P006', 1, 'SR01'),
('ORD1086', '2023-07-31', 'C003', 'P007', 1, 'SR01'),
('ORD1124', '2023-12-22', 'C003', 'P002', 2, 'SR02'),
('ORD1035', '2023-05-03', 'C002', 'P003', 1, 'SR02'),
('ORD1089', '2023-04-24', 'C001', 'P007', 2, 'SR02'),
('ORD1127', '2023-12-23', 'C007', 'P007', 1, 'SR03'),
('ORD1047', '2023-07-28', 'C008', 'P002', 2, 'SR02'),
('ORD1090', '2023-04-27', 'C008', 'P003', 2, 'SR02'),
('ORD1155', '2023-09-11', 'C007', 'P003', 3, 'SR01'),
('ORD1017', '2023-11-24', 'C008', 'P004', 5, 'SR02');

select * from orders;