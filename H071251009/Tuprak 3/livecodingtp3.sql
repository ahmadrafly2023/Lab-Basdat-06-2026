-- nomor 1
SET search_path TO classicmodels, PUBLIC;
SELECT ordernumber, 
UPPER (productcode) AS "Kode Produk", 
LEFT (productcode, 3) AS "Awal Kode",
RIGHT (productcode, 3) AS "Akhir Kode",
quantityordered,
priceeach,
quantityordered * priceeach AS "Total Penjualan"
FROM orderdetails
WHERE (quantityordered BETWEEN 20 AND 50 OR priceeach < 30) 
AND ordernumber %2= 1 
AND LEFT(productcode, 3) = 'S18' 
ORDER BY quantityordered * priceeach DESC;

-- nomor 2
SELECT customernumber,
	UPPER (customername) AS "Nama Perusahaan",
	country,
	CONCAT (contactfirstname, ' ' ,contactlastname) AS "Nama Kontak",
	creditlimit,
	creditlimit - 10000 AS "Selilih Kredit",
	GREATEST (creditlimit, 30000),
	LEAST (creditlimit, 30000)
	FROM customers
WHERE customername ILIKE '%co%'
ORDER BY creditlimit DESC;

-- nomor 3
SELECT ordernumber, 
	orderdate,
	shippeddate,
	EXTRACT (YEAR FROM orderdate) AS "Tahun",
	EXTRACT (YEAR FROM orderdate) AS "Bulan",
	AGE (shippeddate, orderdate) AS "Lama Pengiriman",
	AGE (shippeddate, orderdate) AS "Interval Pengiriman",
	orderdate + INTERVAL '10 days' AS "Estimasi Pengiriman",
	shippeddate AS "Tanggal Pengiriman",
	CURRENT_DATE AS "Tanggal Laporan", 
	CURRENT_TIME AS "Waktu Laporan",
	NOW() AS "Waktu sekarang"
FROM orders
WHERE comments ILIKE '%customer%' 
AND (EXTRACT (MONTH FROM orderdate)BETWEEN 10 AND 12)
AND ordernumber %2=1
ORDER BY orderdate DESC;
	
	
