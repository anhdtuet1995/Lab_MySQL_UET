USE classicmodels;

/*Cau 1*/

/*Thiet lap them Delete cascade cho khoa ngoai*/

ALTER TABLE orderdetails DROP FOREIGN KEY `orderdetails_ibfk_1`;

ALTER TABLE orderdetails ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`) ON DELETE CASCADE;

ALTER TABLE orderdetails DROP FOREIGN KEY `orderdetails_ibfk_2`;

ALTER TABLE orderdetails ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`productCode`) REFERENCES `products` (`productCode`) ON DELETE CASCADE;

ALTER TABLE products DROP FOREIGN KEY `products_ibfk_1`;

ALTER TABLE products ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`productLine`) REFERENCES `productlines` (`productLine`) ON DELETE CASCADE;

/* Bang orders */

INSERT INTO 
	orders(
		orderNumber, 
		orderDate, 
		requiredDate, 
		shippedDate, 
		status, 
		comments, 
		customerNumber) 
	VALUES (
		10450, 
		"2005-6-1", 
		"2005-6-30", 
		"2005-6-20", 
		"In Process", 
		NULL, 
		103
	);

UPDATE orders
	SET shippedDate = "2005-06-19"
	WHERE orderNumber = 10450;

DELETE 
	FROM orders
	WHERE orderNumber = 10450;

/*Bang orderdetails*/

INSERT INTO 
	orderdetails(
		orderNumber,
		productCode,
		quantityOrdered,
		priceEach,
		orderLineNumber
	)
	VALUES(
		10424,
		"S10_1678",
		200,
		30,
		3
	);

UPDATE orderdetails
	SET quantityOrdered = 133
	WHERE orderNumber = 10424;

DELETE
	FROM orderdetails
	WHERE orderNumber = 10424;

/*Bang products*/

INSERT INTO
	products(
		productCode,
		productName,
		productLine,
		productScale,
		productVendor,
		productDescription,
		quantityInStock,
		buyPrice,
		MSRP
	)
	VALUES(
		"S700_5000",
		"The Beast",
		"Planes",
		"1:800",
		"Official logos and insignias",
		"",
		2000,
		100.45,
		150.34
	);

UPDATE products
	SET productDescription = "Official logos"
	WHERE productCode = "S700_5000";

DELETE 
	FROM products
	WHERE productCode = "S700_5000";

/* Bang produclines */

INSERT INTO 
	productlines(
		productLine,
		textDescription,
		htmlDescription,
		image
	)
	VALUES(
		"Bus",
		"This is a public traffic",
		NULL,
		NULL
	);

UPDATE productlines
	SET htmlDescription = "aaaa"
	WHERE productLine = "Bus";

DELETE 
	FROM productlines
	WHERE productLine = "Bus";

/* Bai 2 */

CREATE TABLE temp_orderdetails(
	`orderNumber` int(11) NOT NULL,
 	`productCode` varchar(15) NOT NULL,
  	`quantityOrdered` int(11) NOT NULL,
 	`priceEach` double NOT NULL,
  	`orderLineNumber` smallint(6) NOT NULL
);

INSERT INTO temp_orderdetails
	SELECT od.* FROM orderdetails od 
		LEFT JOIN orders o 
		ON od.orderNumber = o.orderNumber
		WHERE orderDate = (SELECT MAX(orderDate) FROM orders);

/* Cau 3 */

UPDATE employees 
	SET jobTitle = "Sales Representative"
	WHERE jobTitle = "Sales Rep";