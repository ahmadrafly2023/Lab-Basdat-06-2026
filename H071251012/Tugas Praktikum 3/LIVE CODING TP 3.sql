SET search_path TO "classicmodels", public;

SELECT orderNumber,
	UPPER (productCode) AS "Kode Produk", 
	LEFT(productCode, 3) AS "Awal Kode", 
	RIGHT(productCode, 3) AS "Akhir Kode",
 quantityOrdered, priceEach, quantityordered * priceEach AS "Total Penjualan" FROM orderdetails
	WHERE (quantityOrdered BETWEEN 20 AND 50
	OR priceEach < 30) AND (orderNumber % 2 = 1) AND LEFT(productCode, 3) = 'S18'
	ORDER BY quantityOrdered * priceEach DESC;

SELECT customerNumber, customerName, country, CONCAT (c)

SET search_path TO "classicmodels", public;

--latihan1
SELECT orderNumber, 
	   UPPER (productCode) AS "Kode Produk", 
	   LEFT(productCode, 3) AS "Awal Kode",
	   RIGHT(productCode, 3) AS "Akhir Kode",
	   quantityOrdered, 
	   priceEach, 
	   quantityOrdered * priceEach AS "Total Penjualan"
       FROM orderdetails

WHERE (quantityOrdered BETWEEN 20 AND 50 OR priceEach < 30) 
AND (orderNumber % 2 <> 0) 
AND LEFT(productCode, 3) = 'S18'

ORDER BY quantityOrdered * priceEach DESC

--2 bismllah
SELECT 
    customernumber,
    UPPER(customername) AS "Nama Perusahaan", country, CONCAT (contactfirstname, ' ', contactlastname) AS "Nama Kontak",
	creditlimit, creditlimit - 10000 AS "Sisa Kredit" ,
	GREATEST (creditlimit, 30000) AS "Nilai Terbesar" , LEAST (creditlimit, 30000) AS "Nilai Terkecil"
	FROM customers
	WHERE customername ILIKE '%co%' 
	ORDER BY creditlimit DESC;


--ALLAHHANYASATU
SELECT orderNumber, orderDate, shippeddate,
EXTRACT(YEAR fROM  orderDate) AS "Tahun",
DATE_PART ('month', orderdate) AS "Bulan",
shippeddate - orderdate AS "Lama Pengiriman",
AGE (shippedDate, orderdate) AS "interval Pengiriman",
COALESCE(shippeddate, orderDate + INTERVAL  '10 days' ) AS "Estimasi Pengiriman",
orderdate + INTERVAL '10 days' AS "Tanggal Pengiriman",
CURRENT_DATE AS "tanggal laporan",
CURRENT_TIME AS "waktu laporan",
NOW() AS "waktu sekarang"
FROM orders
WHERE comments ILIKE '%customer%' 
AND EXTRACT(MONTH FROM orderDate) BETWEEN 10 AND 12 
AND orderNumber %2 = 1 
ORDER BY orderDate DESC ; 


