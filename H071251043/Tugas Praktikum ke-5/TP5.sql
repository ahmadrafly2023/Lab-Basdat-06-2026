SET search_path TO classicmodels, public;


-- SOAL 1
SELECT 
	   c.contactFirstName,
	   c.customerName,
	   offc.city,
	   CONCAT(e.firstName, ' ', e.lastName) AS sales_rep_name
FROM offices offc
JOIN employees e
ON offc.officeCode = e.officeCode
JOIN customers c
ON e.employeeNumber = c.salesRepEmployeeNumber
WHERE c.contactFirstName ILIKE 'A%' AND offc.city <> 'NYC'
ORDER BY c.customerName ASC;


-- SOAL 2
SELECT c.customerName,
	   SUM(p.amount) AS total_payment,
	   MAX(p.amount) AS max_single_payment
FROM customers c
JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber, c.customerName
HAVING SUM(p.amount) > 50000
ORDER BY total_payment DESC;


-- SOAL 3
SELECT c.customerName,
	   COUNT(o.orderNumber) AS total_order,
	   ROUND(AVG(od.quantityOrdered), 2) AS avg_quantity_per_order
FROM customers c
JOIN orders o
ON c.customerNumber = o.customerNumber
JOIN orderDetails od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber, c.customerName
HAVING COUNT (DISTINCT od.orderNumber) > 3 AND AVG(od.quantityOrdered) > 35
ORDER BY total_order DESC, avg_quantity_per_order DESC;


-- SOAL 4
SELECT p.productLine, 
	   SUM(od.quantityOrdered) AS total_terjual,
	   ROUND(AVG(od.priceEach), 2) AS rata_rata_harga,
	   ROUND(AVG(((od.priceEach - p.MSRP) / p.MSRP) * 100), 2) AS avg_discount_percentage
FROM products p
JOIN orderDetails od
ON p.productCode = od.productCode
GROUP BY p.productLine
HAVING SUM(od.quantityOrdered) > 3000 AND AVG(od.priceEach) > 80
ORDER BY total_terjual DESC;


-- SOAL 5
SELECT
    c.customerName,
    SUM(od.quantityOrdered * od.priceEach) AS total_transaksi,    ROUND(SUM(od.quantityOrdered * od.priceEach) / COUNT(DISTINCT o.orderNumber), 2) AS avgTransactionperOrder,
	COUNT(DISTINCT o.orderNumber) AS total_shipped_orders,

	ROUND(SUM(od.quantityOrdered * od.priceEach)/COUNT(DISTINCT o.orderNumber), 2) AS avg_transaction_per_order
	
FROM customers c

JOIN orders o 
ON c.customerNumber = o.customerNumber
JOIN orderDetails od 
ON o.orderNumber = od.orderNumber

WHERE o.status = 'Shipped'
GROUP BY c.customerNumber, c.customerName
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderDate)) > 1
ORDER BY total_transaksi DESC
LIMIT 5;


-- SOAL 6
SELECT
    c.customerName,
    c.city AS customer_city,
    offc.city AS office_city,
    SUM(od.quantityOrdered) AS total_unit_terjual,
	ROUND(SUM(od.quantityOrdered * od.priceEach)/COUNT(DISTINCT o.orderNumber), 2) AS avg_nilai_per_order
FROM customers c
JOIN employees e
    ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN offices offc
    ON e.officeCode = offc.officeCode
JOIN orders o
    ON c.customerNumber = o.customerNumber
JOIN orderDetails od
    ON o.orderNumber = od.orderNumber

WHERE offc.territory = 'EMEA'
GROUP BY
    c.customerNumber,
    c.customerName,
    c.city,
    offc.city
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderDate)) > 2
   AND SUM(od.quantityOrdered) > 1000
   AND SUM(od.quantityOrdered * od.priceEach)/COUNT(DISTINCT o.orderNumber) > 10000
ORDER BY avg_nilai_per_order DESC;