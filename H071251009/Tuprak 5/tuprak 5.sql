SET search_path TO classicmodels, PUBLIC;

-- nomor 1
SELECT c.contactfirstname, 
c.customername, 
o.city, 
CONCAT(e.firstname, ' ', e.lastname) AS sales_rep_name
FROM customers AS c
JOIN employees AS e
ON c.salesrepemployeenumber = e.employeenumber
JOIN offices AS o
ON e.officecode = o.officecode
WHERE c.contactfirstname ILIKE 'A%' AND o.city != 'NYC'
ORDER BY sales_rep_name ASC;
-- nomor 2
SELECT c.customername, 
SUM(p.amount) AS total_payment, 
MAX(p.amount) AS max_single_payment
FROM customers AS c
JOIN payments AS p
ON c.customernumber = p.customernumber
GROUP BY c.customername
HAVING SUM(p.amount) > 50000 
ORDER BY total_payment DESC;
-- nomor 3
SELECT 
	c.customername, 
	COUNT(DISTINCT p) AS total_order,
	ROUND(AVG(od.quantityordered), 2) AS avg_quantity_per_order
FROM customers AS c
JOIN payments AS p
ON c.customernumber = p.customernumber
JOIN orders AS o
ON c.customernumber = o.customernumber
JOIN orderdetails AS od
ON o.ordernumber = od.ordernumber
GROUP BY c.customername
HAVING COUNT(DISTINCT p) > 3 AND AVG(od.quantityordered) > 35
ORDER BY total_order DESC, avg_quantity_per_order DESC;
-- nomor 4
SELECT p.productline,
SUM(od.quantityordered) AS total_terjual,
ROUND(AVG(od.priceeach), 2) AS rata_rata_harga,
ROUND(AVG((p.msrp - od.priceeach) / p.msrp * 100), 2) AS avg_discount_percentage 
FROM products AS p
JOIN orderdetails AS od
ON p.productcode = od.productcode
GROUP BY p.productline
HAVING SUM(od.quantityordered) > 3000 AND AVG(od.priceeach) > 80
ORDER BY total_terjual DESC;
-- nomor 5
SELECT c.customername,
SUM(od.quantityordered * od.priceeach) AS total_transaksi,
COUNT(DISTINCT o.ordernumber) AS total_shipped_orders,
ROUND(SUM(od.quantityordered * od.priceeach)/ COUNT(DISTINCT o.ordernumber), 2) AS avg_transaction_per_order
FROM customers AS c
JOIN orders AS o
ON c.customernumber = o.customernumber
JOIN orderdetails AS od
ON o.ordernumber = od.ordernumber
WHERE o.status ='Shipped'
GROUP BY c.customername 
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderdate)) > 1
LIMIT 5;
-- nomor 6
SELECT c.customername, 
c.city AS customer_city,
of.city AS office_city,
SUM (od.quantityordered) AS total_unit_terjual,
ROUND(SUM(od.quantityordered * priceeach)/ COUNT(DISTINCT o.ordernumber), 2) AS avg_transaction_per_order
FROM customers AS c
JOIN employees AS e
ON c.salesrepemployeenumber = e.employeenumber
JOIN offices AS of
ON e.officecode = of.officecode
JOIN orders AS o
ON c.customernumber = o.customernumber
JOIN orderdetails AS od
ON o.ordernumber = od.ordernumber
WHERE of.territory = 'EMEA'
GROUP BY c.customername,c.city,of.city
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderdate)) > 2 AND 
SUM(od.quantityordered) > 1000 AND
SUM(od.quantityordered * priceeach)/ COUNT(DISTINCT o.ordernumber) > 10000
ORDER BY avg_transaction_per_order DESC;