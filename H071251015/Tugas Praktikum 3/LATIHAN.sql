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

--latihan2
SELECT 
    customernumber,
    UPPER(customername) AS "Nama Perusahaan",
    country,
    CONCAT(contactfirstname, ' ', contactlastname) AS "Nama Kontak",
    creditlimit,
    (creditlimit - 10000) AS "Sisa Kredit",
    GREATEST(creditlimit, 30000) AS "Nilai Terbesar",
    LEAST(creditlimit, 30000) AS "Nilai Terkecil"
    FROM customers
    WHERE contactlastname IS NOT NULL AND customername ILIKE '%co%'
ORDER BY creditlimit DESC;

--latihan3
SELECT ordernumber,
	   orderdate,
	   shippeddate,
       EXTRACT(YEAR FROM orderdate) AS "Tahun",
	   DATE_PART('month',orderdate) AS "Bulan",
	   shippeddate - orderdate AS "Lama Pengiriman",
	   AGE(shippeddate,orderdate + INTERVAL '10 days') AS "Estimasi Pengiriman",
    	COALESCE(
		shippeddate,
		orderdate + INTERVAL '10 days') AS "Tanggal Pengiriman",
		CURRENT_DATE AS "Tanggal Laporan",
		CURRENT_TIME AS "Waktu",
		NOW() AS "Waktu Sekarang"	
FROM orders
WHERE comments ILIKE '%customer%'
  AND EXTRACT(MONTH FROM orderdate) BETWEEN 10 AND 12
  AND ordernumber % 2 = 1
ORDER BY orderDate DESC;

       
	   
		



