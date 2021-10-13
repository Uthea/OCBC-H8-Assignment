DROP DATABASE IF EXISTS ASSIGNMENT2;
CREATE DATABASE ASSIGNMENT2;
USE ASSIGNMENT2;


---- TABLE CREATION --------- 
CREATE TABLE productlines (
	productLine INT PRIMARY KEY,
	textDescription VARCHAR(255),
	htmlDescription VARCHAR(255),
	image VARCHAR(255)
);

CREATE TABLE products (
	productCode INT PRIMARY KEY,
	productName VARCHAR(255),
	productLine INT,
	productScale INT,
	productVendor VARCHAR(255),
	productDescription VARCHAR(255),
	quantityInStock INT,
	buyPrice INT,
	MSRP INT,
	
	CONSTRAINT FK_products_productlines FOREIGN KEY (productLine)
	REFERENCES productlines (productLine)
);

CREATE TABLE offices (
	officeCode INT PRIMARY KEY,
	city VARCHAR(255),
	phone VARCHAR(255),
	addressLine1 VARCHAR(255),
	addressLine2 VARCHAR(255),
	state VARCHAR(255),
	country VARCHAR(255),
	postalCode VARCHAR(255),
	territory VARCHAR(255)
);

CREATE TABLE employess (
	employeeNumber INT PRIMARY KEY,
	lastName VARCHAR(255),
	firstName VARCHAR(255),
	extension VARCHAR(255),
	email VARCHAR(255),
	officeCode INT,-- FK
	reportsTo INT, -- self FK
	jobTitle VARCHAR(255),

	CONSTRAINT FK_employess_employess
	FOREIGN KEY (reportsTo)
	REFERENCES employess (employeeNumber),

	CONSTRAINT FK_employess_offices
	FOREIGN KEY (officeCode)
	REFERENCES offices (officeCode)
);

CREATE TABLE customers (
	customerNumber INT PRIMARY KEY,
	customerName VARCHAR(255),
	contactLastName VARCHAR(255),
	contactFirstName VARCHAR(255),
	phone VARCHAR(255),
	addressLine1 VARCHAR(255),
	addressLine2 VARCHAR(255),
	city VARCHAR(255),
	state VARCHAR(255),
	postalCode VARCHAR(255),
	country VARCHAR(255),
	salesRepEmployeeNumber INT, -- fk employess
	creditLimit INT,

	CONSTRAINT FK_customers_employess
	FOREIGN KEY (salesRepEmployeeNumber)
	REFERENCES employess (employeeNumber)
);

CREATE TABLE payments (
	customerNumber INT,
	checkNumber INT,
	paymentDate DATE,
	amount INT,

	PRIMARY KEY (customerNumber, checkNumber),
	CONSTRAINT FK_payments_customers 
	FOREIGN KEY (customerNumber)
	REFERENCES customers (customerNumber)
);

CREATE TABLE orders (
	orderNumber INT PRIMARY KEY,
	orderDate DATE,
	requiredDate DATE,
	shippedDate DATE,
	status VARCHAR(255),
	comments VARCHAR(255),
	customerNumber INT, -- fk customers

	CONSTRAINT FK_orders_customers 
	FOREIGN KEY (customerNumber)
	REFERENCES customers (customerNumber)
);

CREATE TABLE orderdetails (
	orderNumber INT,
	productCode INT,
	quantityOrdered INT,
	priceEach INT,
	orderLineNumber INT,

	PRIMARY KEY(orderNumber, productCode),

	CONSTRAINT FK_orderdetails_orders 
	FOREIGN KEY (orderNumber)
	REFERENCES orders (orderNumber),

	CONSTRAINT FK_orderdetails_products 
	FOREIGN KEY (productCode)
	REFERENCES products (productCode)

);

---- INSERTION --------- 


-- 1. Customers => stores data customer
-- run insert from employee table first
INSERT INTO customers
VALUES
(1, 'Alan Brugh', 'Brugh', 'Alan', '440-307-7335', '266 Golden Ridge Road', NULL, 'Schenectady', 'New York', '12305', 'Schenectady', 4, 5000),
(2, 'Meiya Guren', 'Guren', 'Meiya', '360-625-0187', '1540 Goodwin Avenue', NULL,'Kennewick', 'Washington', '99336', 'Benton', 4, 6000),
(3, 'Shin Nouzen', 'Nouzen', 'Shin', '731-695-0549', '1558 Larry Street', NULL, 'San Francisco', 'California', '94143', 'San Francisco', 4, 7000),
(4, 'Shiden Lida', 'Lida', 'Shiden', '716-803-2840', '2026 Briarwood Drive', NULL, 'Merchantville', 'New Jersey', '08109', 'Camden', 5, 2000),
(5, 'Vladi Lena', 'Lena', 'Vladi', '402-435-1962', '4784 Maxwell Farm Road', NULL, 'Chico', 'California', '95928', '	Butte', 5, 2000);

SELECT * FROM customers;

-- 2. Products => stores daftar/list model product ( dalam hal ini bisa mobil/motor dll )
-- run insert operation on productlines table first
INSERT INTO products
VALUES
(1, 'Router AC Dual Band', 1, 2, 'TP-LINK', 'Fast router with dual band', 10, 200, 180),
(2, 'Logitech Mouse G100', 2, 4, 'Logitech', 'Mouse for pro gamers', 30, 300, 250),
(3, 'Anker USB Hub 4 slot', 3, 10, 'Anker', 'Usb 2.0 hub', 5, 20, 10),
(4, 'Ducky White', 4, 3, 'Ducky', 'Keyboard for gamers', 20, 400, 377),
(5, 'Samsung LGKXY-123D', 5, 6, 'Samsung', '24 inch monitor with free sync', 44, 323, 255),
(6, 'Ducky Red', 4, 3, 'Ducky', 'Keyboard for gamers', 20, 160, 140);


-- nampilin productname sesuai dengan textDescriptionnya
SELECT ps.productName, pl.textDescription FROM products AS ps
JOIN productlines AS pl
ON ps.productLine = pl.productLine;



-- 3. Productlines => stores daftar/list kategori product

INSERT INTO productlines
VALUES
(1,'Router','<!DOCTYPE html> <html> <body><p>Router</p> </body> </html>', '/picture/router.png'),
(2,'Mouse','<!DOCTYPE html> <html> <body><p>Mouse</p> </body> </html>',  '/picture/mouse.png'),
(3,'USB HUB','<!DOCTYPE html> <html> <body><p>USB HUB</p> </body> </html>',  '/picture/usb-hub.png'),
(4,'Keyboard','<!DOCTYPE html> <html> <body><p>Keyboard</p> </body> </html>',  '/picture/keyboard.png'),
(5,'Monitor', '<!DOCTYPE html> <html> <body><p>Monitor</p> </body> </html>',  '/picture/monitor.png')

SELECT * FROM productlines;


-- 4. Orders => store Order Sales oleh customer
INSERT INTO orders
VALUES
(1, '2021-01-25', '2021-01-26', '2021-01-27', 'shipping', NULL, 1),
(2, '2021-01-25', '2021-01-25', '2021-01-27', 'packaging', NULL, 1),
(3, '2021-01-20', '2021-01-21', '2021-01-22', 'shipping', NULL, 3),
(4, '2021-01-10', '2021-01-11', '2021-01-13', 'completed', 'customer recieved the item', 4),
(5, '2021-01-22', '2021-01-21', '2021-01-26', 'shipping', NULL, 5)

SELECT * FROM orders;

-- 5. OrderDetails => store Item Order sales dalam setiap order sales
INSERT INTO orderdetails
VALUES
(1,1, 10, 180, 10),
(1,2, 2, 220, 11),
(2,5, 5, 244, 21),
(2,6, 8, 140, 33),
(3,6, 4, 140, 80);

SELECT * FROM orderdetails;


--  6. Payments => store Pembayaran oleh customer sesuai dengan akun pembayaran
INSERT INTO payments
VALUES
(1, 101, '2021-01-26', 1500),
(1, 102, '2021-01-27', 2700),
(3, 103, '2021-01-23', 4600),
(4, 104, '2021-01-12', 5632),
(5, 105, '2021-01-24', 2400);

SELECT * FROM payments;


--- 7. Employee => store informasi karyawan dalam sebuah organisasi struktur
--- run insert operation on offices first
INSERT INTO employess
VALUES
(1, 'Alan', 'Medina', 'Mr', 'alanmedina@gmail.com', 1, NULL, 'Senior Manager'),
(2, 'Edna', 'Stumbaugh', 'Ms', 'ednastumbaugh@gmail.com', 1, 1, 'Manager'),
(3, 'Scott', 'Hoover', 'Mr', 'scotthoover@yahoo.com', 2, 2, 'General Supervisor'),
(4, 'White', 'Marilyn', 'Ms', 'marilynwhite@yahoo.com', 3, 3, 'Sales'),
(5, 'Smith', 'Kelvin', 'Mr', 'kevlin.smith@yahoo.com', 3, 3, 'Sales')

-- tampilkan nama depan karyawan , kota lokasi kantor dan nama karyawan yang di laporkan kepada
SELECT e.firstName, o.city as "office location", r.firstName as "report to" FROM employess as e
JOIN offices as o
ON e.officeCode = o.officeCode
JOIN employess as r
ON e.reportsTo = r.employeeNumber;


--- 8. Offices => store data sales office
INSERT INTO offices
VALUES
(1, 'Bandung', '703-273-0538', 'Bermuda Street', 'No.5 Block 123', 'Indonesia', 'Indonesia', '18765', 'Big'),
(2, 'Fairfax', '276-252-7498', '1339 Lawman Avenue', NULL, 'Indonesia', 'Indonesia', '4490 ', 'Big'),
(3, 'Annandale', '763-575-5617', '4592 Hillcrest Circle', NULL, 'Minnesota', 'Wright', '55302 ', 'Small'),
(4, 'SCRANTON', '614-433-8181', '4374 James Martin Circle', NULL, 'Kansas', 'Osage', '66537 ', 'Small'),
(5, 'Needles', '909-309-4991', '3077 Parkway Street', NULL, 'California', 'San Bernardino', '92363 ', 'Small')

SELECT * FROM offices;










	













