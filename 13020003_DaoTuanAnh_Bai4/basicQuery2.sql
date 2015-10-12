USE classicmodels;

/**
 *
 * In ra danh sach khach hang o Nantes hoac Lyon
 *
 */

SELECT * FROM customers WHERE city IN ("Nantes", "Lyon");

/**
 *
 * In ra don hang co thoi gian chuyen tu 10/1/2003 den 10/3/2003
 *
 */

SELECT * FROM orders WHERE shippedDate BETWEEN "2003/1/10" AND "2003/3/10";

/**
 *
 * danh sach san pham thoai loai san pham co chua chu "CARS"
 *
 */

SELECT productName FROM products WHERE productLine LIKE "%CARS%";

/**
 *
 * in ra 10 san pham co so luong hang ton nhieu nhat
 *
 */

SELECT productName, quantityInStock FROM products ORDER BY quantityInStock DESC LIMIT 10;

/**
 *
 * in ra danh sach san pham va them 1 cot la tong gia tri hang ton
 *
 */

SELECT productName, (quantityInStock * buyPrice) AS priceQuantityInStock FROM products;
  	