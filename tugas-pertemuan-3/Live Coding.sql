SET search_path TO classicmodels;



-- Live Coding
-- 1
SELECT
	orderNumber,
	UPPER(productCode) AS "Kode Produk",
	LEFT(productCode, 3) AS "Awal Kode",
	RIGHT(productCode, 3) AS "Akhir Kode",
	quantityOrdered,
	priceEach,
	quantityOrdered * priceEach AS "Total Penjualan"
FROM orderdetails
	WHERE(quantityOrdered BETWEEN 20 AND 50 OR priceEach < 30)
	AND LEFT(productCode, 3) = 'S18'
	AND orderNumber % 2 = 1
	ORDER BY "Total Penjualan" DESC;


-- 2
SELECT
	customernumber, 
	UPPER(customerName) AS "Nama Perusahaan", 
	country,
	CONCAT(contactfirstName, ' ', contactlastName) AS "Nama Kontak",
	creditLimit,
	(creditLimit - 10000) AS "Sisa Kredit",
	GREATEST(creditLimit, 30000) AS "Nilai Terbesar",
	LEAST(creditLimit, 30000) AS "Nilai Terkecil"
FROM customers
	WHERE customername ILIKE '%co%'
	ORDER BY creditLimit DESC;



-- 3
SELECT 
	orderNumber,
	orderDate,
	shippedDate,
	EXTRACT(YEAR FROM orderDate)  AS tahun,
	DATE_PART( 'month',orderDate) AS bulan,
	shippedDate - orderDate AS "Lama Pengiriman",
	AGE(shippedDate, orderDate) AS "Interval Pengiriman",
	orderDate + INTERVAL '10 days' AS "Estimasi Pengiriman",
	COALESCE(shippedDate, orderDate + INTERVAL '10 days') AS "Tanggal Pengiriman",
	CURRENT_DATE AS "Tanggal Laporan",
	CURRENT_TIME AS "Waktu Laporan",
	NOW() AS "Waktu Sekarang"
FROM orders
WHERE comments ILIKE '%customer%' 
	AND EXTRACT(MONTH FROM orderDate) BETWEEN 10 AND 12
	AND orderNumber % 2 = 1
	ORDER BY orderDate DESC;
	
	
	
		
	
	
	
	






	



	




