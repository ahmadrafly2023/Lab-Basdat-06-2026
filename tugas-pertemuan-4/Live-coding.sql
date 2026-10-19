SET search_path TO classicmodels;


-- Live Coding
-- 1
SELECT 
	productCode,
	SUM(quantityordered * priceEach) AS Omzet_Kotor,
	ROUND(AVG(priceEach)) AS rata_rata_harga_jauh,
	ROUND(MAX(priceEach)-MIN(priceEach)/AVG(priceEach) * 100, 2) AS Persentase_disparitas
FROM orderdetails
WHERE quantityOrdered BETWEEN 20 AND 50
GROUP BY productCode
HAVING SUM(quantityordered * priceEach) > 40000 AND MAX(priceEach) - MIN(priceEach) > 5
ORDER BY Persentase_disparitas DESC;



-- 2
SELECT customerNumber AS nomor_pelanggan, 'VIP Credit' AS kategori_aktivitas
FROM customers
WHERE creditLimit > 120000

UNION ALL

SELECT DISTINCT customerNumber AS nomor_pelanggan, 'Order Bermasalah' AS kategori_aktivitas
FROM orders
WHERE status IN ('Cancelled', 'Disputed')

UNION ALL

SELECT customerNumber AS nomor_pelanggan, 'Top Payor' AS kategori_aktivitas
FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 150000

ORDER BY nomor_pelanggan ASC;


-- 3
SELECT 
    customerNumber AS nomor_pelanggan, 
    COUNT(*) AS frekuensi_pembayaran, 
    SUM(amount) AS total_pembayaran
FROM 
    payments
GROUP BY 
    customerNumber
HAVING 
    COUNT(*) > 5
ORDER BY 
    total_pembayaran DESC;


-- 4
SELECT customerNumber 
FROM customers 
WHERE creditLimit > 60000

INTERSECT

SELECT customerNumber 
FROM payments 
WHERE amount > 30000

INTERSECT

SELECT customerNumber 
FROM orders 
WHERE status != 'Cancelled'

EXCEPT

SELECT customerNumber 
FROM payments 
GROUP BY customerNumber 
HAVING AVG(amount) <= 15000;