SET search_path TO classicmodels;

-- 1
SELECT 
	customerNumber,
	SUM(amount) AS "total setoran",
	COUNT(checkNumber) AS "frekuensi transaksi",
	MAX(amount) AS "setoran terbesar"
FROM payments
GROUP BY customerNumber
HAVING COUNT(checkNumber) > 4 AND AVG(amount) > 20000;






-- 2
SELECT 
	customerNumber,
	SUM(amount) AS total
FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 80000
ORDER BY total DESC;



-- 3
SELECT 
	productLine,
	COUNT(productCode) AS jumlah_ragam_produk,
	ROUND(AVG(MSRP), 2) AS rata_rata_harga,
	STRING_AGG(productName, ', ') AS nama_nama_Produk
FROM products
GROUP BY productLine
HAVING COUNT(productCode) > 10; 



-- 4
SELECT employeeNumber
FROM employees
WHERE employeeNumber IN(SELECT reportsto FROM employees)
EXCEPT
SELECT employeeNumber
FROM employees
WHERE jobTitle ILIKE '%VP%' OR jobTitle ILIKE '%President';



-- 5
SELECT 
	productCode,
	SUM(quantityOrdered) AS total_unit_terjual,
	ROUND(AVG(priceEach), 2) AS rata_rata_harga
FROM orderdetails
WHERE priceEach > 100
GROUP BY productCode
HAVING SUM(quantityOrdered) > 50
ORDER BY total_unit_terjual DESC;


-- 6 
SELECT
	productCode,
	SUM(quantityOrdered) AS total_unit_dipesan,
	SUM(quantityOrdered * priceEach) AS Pendapatan_kotor,
	ROUND(AVG(priceEach), 2) AS rata_rata_harga_rill,
	MAX(priceEach) - MIN(priceEach) AS rentang_volatilitas
FROM orderdetails
WHERE quantityOrdered > 20
GROUP BY productCode
HAVING SUM(quantityOrdered * priceEach) > 50000
ORDER BY Pendapatan_kotor DESC;



-- 7
(
	SELECT customerNumber FROM customers
	WHERE creditLimit > 80000
	INTERSECT
	SELECT customerNumber FROM orders
	WHERE status IN('Cancelled',  'On Hold')
)
EXCEPT
(
	SELECT customerNumber FROM payments
	GROUP BY customerNumber
	HAVING SUM(amount) > 100000
);




