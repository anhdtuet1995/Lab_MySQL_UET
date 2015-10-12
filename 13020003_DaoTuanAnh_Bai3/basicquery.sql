USE classicmodels;

/*
* In ra danh sach nhan vien co truong reportsTo chua xac dinh
*/

SELECT * FROM employees WHERE reportsTo is NULL;

/*
* In ra cac CustomerNumber co thuc hien giao dich
*/

SELECT customerNumber FROM customers WHERE salesRepEmployeeNumber is NOT NULL;

/*
* Dua ra danh sach cac don hang co ngay yeu cau van chuyen la 18/1/2003
*/

SELECT orderNumber FROM orders WHERE requiredDate = "2003/1/18";

/**
* Dua ra cac don hang co ngay dat trong thang 4/2005 va cos trang thai la shipped
*/

SELECT orderNumber FROM orders WHERE YEAR(orderDate) = 2003 AND MONTH(orderDate) = 4 AND status = "Shipped";

/**
 * Dua ra cac san pham thuoc nhom Classic Cars
 */

SELECT productName FROM products WHERE productLine = "Classic Cars";
