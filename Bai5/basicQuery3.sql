USE classicmodels;

SELECT SUBSTRING(productDescription, 1, 50) AS 'Title of products' FROM products;

SELECT CONCAT(firstName, ' ', lastName, ', ', jobTitle) Description FROM employees;

ALTER TABLE products DROP FOREIGN KEY products_ibfk_1;

ALTER TABLE products ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (productLine) REFERENCES productlines(productLine) ON UPDATE CASCADE;

UPDATE productlines SET productLine = REPLACE(productLine, 'Cars', 'Automobiles');

SELECT orderNumber FROM orders ORDER BY DATEDIFF(requiredDate, shippedDate) DESC LIMIT 5;

SELECT orderNumber FROM orders WHERE EXTRACT(YEAR FROM orderDate) = 2005 AND EXTRACT(MONTH FROM orderDate) = 5 AND shippedDate is NULL;