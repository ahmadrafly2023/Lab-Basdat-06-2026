SET search_path TO classicmodels, public;

-- NOMOR 1
SELECT customerNumber, 
	   SUM(amount) AS "Total Pembayaran",
	   COUNT(DISTINCT checkNumber) AS "Frekuensi Transaksi",
	   MAX(amount) AS "Pembayaran Terbesar"
FROM payments

GROUP BY customerNumber
HAVING COUNT(DISTINCT customerNumber) > 4 AND AVG(amount) > 20000;

-- NOMOR 2
SELECT customerNumber,
	   SUM(amount) AS "Total Keseluruhan Dana"
FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 80000
ORDER BY SUM(amount) DESC;

-- NOMOR 3
SELECT productLine, 
	   COUNT(productCode) AS "Jumlah Produk",
	   ROUND(AVG(MSRP), 2) AS "Rata-rata Harga Jual",
	   STRING_AGG(productName, ', ') AS "Daftar Produk"
FROM products
GROUP BY productLine
HAVING COUNT(productCode) > 10;

-- NOMOR 4
SELECT employeeNumber
FROM employees
WHERE employeeNumber IN (
	SELECT DISTINCT reportsTo
	FROM employees
	WHERE reportsTo IS NOT NULL
)
EXCEPT
SELECT employeeNumber
FROM employees
WHERE jobTitle ILIKE '%VP%' OR jobTitle ILIKE '%President%';

-- NOMOR 5
SELECT productCode,
	   SUM(quantityOrdered) AS "Total Unit Terjual",
	   ROUND(AVG(priceEach), 2) AS "Rata-rata Harga Jual"
FROM orderDetails
WHERE priceEach > 100
GROUP BY productCode
HAVING SUM(quantityOrdered) > 50
ORDER BY "Total Unit Terjual" DESC;

-- NOMOR 6
SELECT productCode,
	   SUM(quantityOrdered) AS "Total Unit Terjual",
	   SUM(quantityOrdered * priceEach) AS "Pendapatan Kotor",
	   ROUND(AVG(priceEach), 2) AS "Rata-rata Harga",
	   MAX(priceEach) - MIN(priceEach) AS "Selisih Harga"
FROM orderDetails
WHERE quantityOrdered > 20
GROUP BY productCode
HAVING SUM(priceEach * quantityOrdered) > 50000
ORDER BY SUM(priceEach * quantityOrdered) DESC

-- NOMOR 7
SELECT customerNumber
FROM customers
WHERE creditLimit > 80000

INTERSECT

SELECT customerNumber
FROM orders
WHERE status IN ('Cancelled', 'On Hold')

EXCEPT

SELECT customerNumber
FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 100000;



