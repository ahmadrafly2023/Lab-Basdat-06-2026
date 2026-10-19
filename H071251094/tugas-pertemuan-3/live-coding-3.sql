set search_path to classicmodels;
-- soal no 1
SELECT
ordernumber,
UPPER(productCode) AS "kode produk",
LEFT(productCode, 3) as "awal kode",
RIGHT(productCode, 3) as "akhir kode",
quantityOrdered,
priceEach,
quantityOrdered * priceEach AS "total penjualan"
FROM orderdetails
WHERE ( quantityOrdered between 20 and 50 or priceEach <30)
AND LEFT (productCode, 3) = 'S18'
AND ordernumber %2 = 1
ORDER BY "total penjualan" DESC;

-- soal no 2
SELECT
customerNumber,
UPPER (customerName) AS "nama perusahaan",
country,
CONCAT(contactFirstName, ' ', contactLastName) AS "Nama Kontak",
creditlimit,
creditLimit - 10000 AS "sisa kredit",
GREATEST(creditlimit, 30000)"nilai terbesar",
LEAST(creditlimit, 30000)"nilai terkecil"
FROM customers
WHERE customerName ILIKE '%co%' 
ORDER BY creditlimit DESC;

-- soal no 3
SELECT
ordernumber,
orderDate,
shippedDate,
EXTRACT(YEAR FROM orderDate) AS "tahun",
DATE_PART('month', orderdate) AS "bulan",
shippedDate - orderDate AS "lama pengiriman",
AGE(shippedDate, orderDate) AS "interval pengiriman",
orderDate + interval '10 days' AS "estimasi pengiriman",
COALESCE(shippedDate, orderDate + INTERVAL'10 days') AS "lama pengiriman",
CURRENT_DATE AS "tanggal laporan",
CURRENT_TIME AS "waktu laporan",
NOW() AS "waktu sekarang"
FROM orders
WHERE comments ILIKE '%customer%'
AND EXTRACT(MONTH FROM orderDate) BETWEEN 10 AND 12
AND orderNumber % 2 = 1
ORDER BY orderDate DESC;




	
	