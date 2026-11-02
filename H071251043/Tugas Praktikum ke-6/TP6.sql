SET search_path TO classicmodels, public;


-- NOMOR 1
SELECT productCode AS "Kode Produk", 
	   productName AS "Nama Produk", 
	   msrp AS "MSRP", 
	   quantityInStock AS "Jumlah Stok",
	   CASE
	   		WHEN msrp < 50 AND quantityInStock > 500 THEN 'Ekonomis - Stok Tinggi'
	   	   	WHEN msrp < 50 AND quantityInStock <= 500 THEN 'Ekonomis - Stok Rendah'
	   		WHEN msrp BETWEEN 50 AND 100 THEN 'Harga Menengah'
	   		WHEN msrp > 100 THEN 'Harga Premium'
	   END AS kategori
FROM products
ORDER BY msrp DESC;


-- NOMOR 2
SELECT productCode, 
	   SUM(quantityOrdered) AS total_unit_terjual,
	   COUNT (DISTINCT orderNumber) AS jumlah_pesanan
FROM orderDetails
GROUP BY productCode
HAVING SUM(quantityOrdered) > (
	SELECT AVG(quantityOrdered) FROM orderdetails)
AND COUNT (DISTINCT orderNumber) > 10
ORDER BY total_unit_terjual DESC;


-- NOMOR 3
SELECT productCode AS "Kode Produk", 
	   productName AS "Nama Produk", 
	   quantityInStock AS "Stok Produk", 
	   msrp AS MSRP
FROM products
WHERE quantityInStock > (
	SELECT AVG(quantityInStock) FROM products)
AND msrp > (
	SELECT AVG(msrp) FROM products)
ORDER BY quantityInStock DESC;


-- NOMOR 4
SELECT status FROM orders 
WHERE orderNumber = 10100;

BEGIN;

UPDATE orders
SET status = 'Pengiriman'
WHERE orderNumber = 10100;

SAVEPOINT status_pengiriman;

UPDATE orders
SET status = 'Batal'
WHERE orderNumber = 10100;

ROLLBACK TO SAVEPOINT status_pengiriman;

COMMIT;

