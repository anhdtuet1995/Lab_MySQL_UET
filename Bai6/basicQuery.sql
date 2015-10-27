USE classicmodels;

/*So khach hang tung thanh pho*/
SELECT city, count(*) AS countEachCity FROM customers GROUP BY city;

/*So don hang dat vao 3/2005*/
SELECT count(*) AS Result FROM orders WHERE YEAR(orderDate) = 2005 AND MONTH(orderDate) = 3;

/*Dua ra 10 don hang co gia tri lon nhat*/
SELECT 	orderNumber, 
		SUM(quantityOrdered) AS itemCount, 
		SUM(priceEach * quantityOrdered) AS total 
		FROM orderdetails 
			GROUP BY orderNumber 
				ORDER BY total DESC 
				LIMIT 10;

/*Dua ra ma nhom hang va tong so luong hang hoa trong kho*/
SELECT 	productLine, 
		sum(quantityInStock) AS totalInStock
		FROM products
		GROUP BY productLine;
