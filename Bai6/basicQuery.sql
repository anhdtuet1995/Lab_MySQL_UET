USE classicmodels;

SELECT city, count(*) AS countEachCity FROM customers GROUP BY city;



