SET search_path TO classicmodels;


-- 1
SELECT orderNumber,
	UPPER(productCode) AS "Kode Produk",
	quantityOrdered,
	priceEach
FROM orderdetails
	WHERE (quantityOrdered BETWEEN  20 AND 50 OR  priceEach < 30) 
	AND  LEFT(productCode, 3) =  'S18'
ORDER BY quantityOrdered DESC;


-- 2
SELECT 
	customerNumber, 
	customerName, 
	country, 
	creditLimit, 
	CONCAT(contactFirstName, ' ', contactLastName) AS "Nama Kontak",
	(creditLimit - 10000) AS "Selsih Kredit"
FROM customers
WHERE country IN ('USA', 'Canada', 'France') AND creditLimit > 30000
ORDER BY creditLimit DESC;


-- 3
SELECT 
	productCode, 
	productName, 
	buyPrice, 
	MSRP,
	GREATEST(buyPrice, MSRP) AS "Harga Tertinggi",
	LEAST(buyPrice, MSRP) AS "Harga Terendah"
FROM products
WHERE productName ILIKE '%car%';



--4
SELECT 
	orderNumber,
	orderDate,
	shippedDate,
	EXTRACT (YEAR FROM orderDate)  AS tahun,
	EXTRACT(MONTH FROM orderDate) AS bulan,
	(shippedDate - orderDate) AS "Lama Pengiriman",
	AGE(shippedDate, orderDate) AS "Interval Pengiriman",
	CURRENT_DATE AS "Tanggal Laporan",
	CURRENT_TIME AS "Waktu Laporan"
FROM orders;



-- 5
SELECT
	orderNumber,
	orderDate,
	shippedDate,
	orderDate + INTERVAL '10 days' AS "Estimasi Kirim", 
	COALESCE(shippedDate, (orderDate + INTERVAL '10 days')),
	AGE(shippedDate, orderDate) AS "Selisih Waktu"
FROM orders
WHERE 
	comments ILIKE '%customer%'
	AND EXTRACT(MONTH FROM orderDate) BETWEEN 10 AND 12
	AND orderNumber % 2	<> 0
ORDER BY orderDate DESC;



