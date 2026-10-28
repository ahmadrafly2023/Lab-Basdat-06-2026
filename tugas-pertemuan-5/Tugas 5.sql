SET search_path TO classicmodels;

-- 1
SELECT 
	c.contactfirstname, 
	c.customername,
	o.city,
	CONCAT(e.firstname, ' ', e.lastname) AS sales_rep_name
FROM customers c
JOIN employees e
	ON e.employeenumber = c.salesrepemployeenumber
JOIN offices o
	ON o.officecode = e.officecode
WHERE c.contactfirstname ILIKE 'A%' AND o.city <> 'NYC'
ORDER BY c.customername ASC;



-- 2
SELECT  
	c.customerName,
	SUM(p.amount) AS total_payment,
	MAX(p.amount) AS max_single_payment
FROM customers c
JOIN payments p 
	ON p.customerNumber = c.customerNumber
GROUP BY c.customernumber, c.customername
HAVING SUM(p.amount) > 50000
ORDER BY total_payment DESC;


-- 3
SELECT 
	c.customerName,
	COUNT(DISTINCT o.orderNumber) AS total_order,
	ROUND(AVG(od.quantityordered), 2) AS avg_quantity_per_order
FROM customers c
JOIN orders o
	ON o.customerNumber = c.customerNumber
JOIN orderdetails od
	ON od.orderNumber = o.orderNumber
GROUP BY 
	c.customerName, 
	c.customerNumber
HAVING 
	COUNT(DISTINCT o.orderNumber) > 3 
	AND AVG(od.quantityordered) > 35
ORDER BY total_order DESC, avg_quantity_per_order DESC;


-- 4 
SELECT 
	pl.productLine,
	SUM(od.quantityOrdered) AS total_terjual,
	ROUND(AVG(od.priceEach), 2) AS rata_rata_harga,
	ROUND(AVG(
            ((p.MSRP - od.priceEach) / p.MSRP) * 100
        ),2) AS avg_discount_percentage
FROM productlines pl
JOIN products p
	ON p.productLine = pl.productLine
JOIN orderdetails od
	ON od.productCode = p.productCode
GROUP BY pl.productLine
HAVING 
	SUM(od.quantityOrdered) > 3000
	AND AVG(od.priceEach) > 80
ORDER BY total_terjual DESC;



-- 5
SELECT 
	c.customerName,
	SUM(od.quantityOrdered * od.priceEach) AS total_transaksi,
	COUNT(DISTINCT o.orderNumber) AS total_shipped_orders,
	ROUND(SUM(od.quantityOrdered * od.priceEach)/ COUNT(DISTINCT o.orderNumber), 2)AS avg_transaction_per_order
FROM customers c
JOIN orders o
	ON c.customerNumber = c.customerNumber
JOIN orderdetails od 
	ON od.orderNumber = o.orderNumber
WHERE o.status = 'Shipped'
GROUP BY 
	c.customerNumber,
	c.customerName
HAVING 
	COUNT(DISTINCT EXTRACT(YEAR FROM o.orderDate)) > 1
ORDER BY total_transaksi DESC
LIMIT 5;



-- 6
SELECT 
	c.customerName,
	c.city AS customer_city,
	o.city AS office_city,
	SUM(od.quantityOrdered) AS total_unit_terjual,
	ROUND(SUM(od.quantityOrdered * od.priceEach)/ COUNT(DISTINCT ord.orderNumber), 2)AS avg_transaction_per_order
FROM customers c
JOIN employees e 
	ON c.salesrepemployeenumber = e.employeenumber
JOIN offices o 
	ON o.officeCode = e.officeCode
JOIN orders ord
	ON ord.customerNumber = c.customerNumber
JOIN orderdetails od
	ON od.orderNumber = ord.orderNumber
WHERE o.territory = 'EMEA'
GROUP BY 
	c.customerName,
	c.customerNumber,
	c.city,
	o.city
HAVING 
	COUNT(DISTINCT EXTRACT(YEAR FROM ord.orderDate)) > 2
	AND SUM(od.quantityOrdered) > 1000
	AND SUM(od.quantityOrdered * od.priceEach)/ COUNT(DISTINCT ord.orderNumber) > 10000
ORDER BY avg_transaction_per_order DESC;


