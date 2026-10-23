
SET search_path TO classicmodels;
-- soal no 1
SELECT 
    orderNumber,
    UPPER(productCode) AS "Kode Produk",
    quantityOrdered,
    priceEach
FROM orderdetails
WHERE (quantityOrdered BETWEEN 20 AND 50
       OR priceEach < 30)
  AND LEFT(productCode, 3) = 'S18'
ORDER BY quantityOrdered DESC;

-- soal no 2
SELECT 
    customerNumber,
    customerName,
    country,
    creditLimit,
   contactFirstName||' '||contactLastName AS "Nama Kontak",
    creditLimit - 10000 AS "Selisih Kredit"
FROM customers
WHERE country IN ('USA', 'Canada', 'France')
  AND creditLimit > 30000
ORDER BY creditLimit DESC;


-- soal no 3
SELECT
    productCode,
    productName,
    buyPrice,
    MSRP,
    GREATEST(buyPrice, MSRP) AS "Harga Tertinggi",
    LEAST(buyPrice, MSRP) AS "Harga Terendah"
FROM products
WHERE productName ILIKE '%car%';

-- soal no 4
SELECT 
    orderNumber,
    orderDate,
    shippedDate,
    EXTRACT(YEAR FROM orderDate) AS "Tahun",
    EXTRACT(MONTH FROM orderDate) AS "Bulan",
    shippedDate - orderDate AS "Lama Pengiriman",
    AGE(shippedDate) AS "Interval Pengiriman",
    CURRENT_DATE AS "Tanggal Laporan",
    CURRENT_TIME AS "Waktu Laporan",
	NOW() AS "waktu sekarang"
FROM orders
WHERE shippedDate IS NOT NULL;

-- soal no 5
SELECT
    ordernumber,
    orderdate,
    shippeddate,
    orderdate + INTERVAL '10 DAYS' AS "Estimasi Kirim",
    COALESCE(
        shippeddate,
        orderdate + INTERVAL '10 DAYS'
    ) AS "Tanggal Aktual",
    AGE(shippeddate, orderdate) AS "Selisih Waktu",
	EXTRACT(MONTH FROM orderdate) BETWEEN 10 AND 12 AS "CNTH"
FROM orders
WHERE comments ILIKE '%customer%'
  AND ordernumber % 2 = 1 
ORDER BY orderdate DESC;



 
