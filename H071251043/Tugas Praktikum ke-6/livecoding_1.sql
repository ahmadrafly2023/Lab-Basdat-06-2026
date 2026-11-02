SET search_path TO classicmodels, public;

-- NOMOR 1
SELECT c.customerNumber,
	   c.customerName,
	   c.city,
	   (SELECT COUNT(DISTINCT o.orderNumber)
	   FROM orders o
	   WHERE o.customerNumber = c.customerNumber)
	   AS total_pesanan,
	   CASE
	   		WHEN 
			   (SELECT COUNT(DISTINCT o.orderNumber)
	   			FROM orders o
	   			WHERE o.customerNumber = c.customerNumber) 
			> 5 THEN 'Pelanggan Loyal'
			
			WHEN 
			   (SELECT COUNT(DISTINCT o.orderNumber)
	   			FROM orders o
	   			WHERE o.customerNumber = c.customerNumber) 
			>= 2
			AND
				(SELECT COUNT(DISTINCT o.orderNumber)
	   			FROM orders o
	   			WHERE o.customerNumber = c.customerNumber) 
			< 5 THEN 'Pelanggan Aktif'
			
	   		WHEN 
			   (SELECT COUNT(DISTINCT o.orderNumber)
	   			FROM orders o
	   			WHERE o.customerNumber = c.customerNumber) 
			= 1 THEN 'Pelanggan Baru'

	   		WHEN 
			   (SELECT COUNT(DISTINCT o.orderNumber)
	   			FROM orders o
	   			WHERE o.customerNumber = c.customerNumber) 
			= 0 THEN 'Pelanggan Pasif'

	   END AS status_loyalitas
FROM customers c
ORDER BY total_pesanan DESC, customerName DESC;


-- NOMOR 2
SELECT 
    e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS nama_lengkap,
    e.email,
    e.officeCode
FROM employees e
WHERE e.jobTitle = 'Sales Rep'
AND NOT EXISTS (
    SELECT 1
    FROM customers c
    JOIN orders o
        ON c.customerNumber = o.customerNumber
    WHERE c.salesRepEmployeeNumber = e.employeeNumber
    AND o.status = 'Shipped'
)
ORDER BY e.employeeNumber ASC;


-- NOMOR 3
SELECT p.productCode,
	   p.productName,
	   p.productLine,
	   p.buyPrice
FROM products p
WHERE p.productLine = 'Classic Cars'
AND buyPrice >  ALL (SELECT p2.buyPrice
				  FROM products p2
				  WHERE p2.productLine = 'Vintage Cars')
ORDER BY P.buyPrice DESC


-- NOMOR 4
SELECT 
    c.customerNumber,
    c.customerName,
    ROUND(dt.total_belanja, 2) AS total_belanja
FROM customers c
JOIN (
    SELECT 
        o.customerNumber,
        SUM(od.quantityOrdered * od.priceEach) AS total_belanja
    FROM orders o
    JOIN orderdetails od
        ON o.orderNumber = od.orderNumber
    GROUP BY o.customerNumber
) AS dt
    ON c.customerNumber = dt.customerNumber
WHERE dt.total_belanja > (
    SELECT AVG(total_per_pelanggan)
    FROM (
        SELECT 
            o.customerNumber,
            SUM(od.quantityOrdered * od.priceEach) AS total_per_pelanggan
        FROM orders o
        JOIN orderdetails od
            ON o.orderNumber = od.orderNumber
        GROUP BY o.customerNumber
    ) AS rata_rata
)
ORDER BY dt.total_belanja DESC;


-- NOMOR 5

BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

UPDATE customers
SET creditLimit = creditLimit + 10000
WHERE customerNumber = 103;

SAVEPOINT sp_update_kredit;

UPDATE customers
SET city = 'Surabaya'
WHERE customerNumber = 103;

ROLLBACK TO SAVEPOINT sp_update_kredit;

COMMIT;