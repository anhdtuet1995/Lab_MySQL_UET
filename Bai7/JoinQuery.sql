USE classicmodels;

/*
Ten nhan vien + ten cong ty
*/
SELECT 	
	CONCAT(e.firstName, ' ', e.lastName) as fullName,
	o.territory
		FROM employees e
			INNER JOIN offices o ON e.officeCode = o.officeCode;


/*
In ra ten khach hang va cac san pham
*/	

SELECT 
	c.customerName,
	distinct(p.productLine)
		FROM customers c
			INNER JOIN orders o ON c.customerNumber = o.customerNumber
			INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
			INNER JOIN products p ON p.productCode = od.productCode;
