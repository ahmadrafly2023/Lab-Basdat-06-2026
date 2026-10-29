SET search_path TO classicmodels, PUBLIC;

-- nomor 1
SELECT productcode, productname, msrp, quantityinstock, 
	CASE
		WHEN msrp < 50 AND quantityinstock > 500 THEN 'Ekonomis - Stok Tinggi'
		WHEN msrp < 50 AND quantityinstock <= 500 THEN 'Ekonomis - Stock Rendah'
		WHEN msrp BETWEEN 50 AND 100 THEN 'Harga Menengah'
		ELSE 'Harga Premium'
	END AS kategori_produk
FROM products
ORDER BY msrp DESC;

-- nomor 2
SELECT
	productcode,
	SUM(quantityordered) AS total_unit_terjual,
	COUNT(DISTINCT(ordernumber)) AS jumlah_pesanan
FROM orderdetails
GROUP BY productcode
HAVING SUM (quantityordered) > (
	SELECT 
	AVG(quantityordered)
	FROM orderdetails
) AND 
COUNT(DISTINCT(ordernumber)) > 10
ORDER BY total_unit_terjual DESC;

-- nomor 3
SELECT productcode, productname, quantityinstock, msrp
FROM products
WHERE quantityinstock > (SELECT AVG(quantityinstock) FROM products) 
AND msrp > (SELECT AVG(msrp) FROM products)
ORDER BY msrp DESC;

-- nomor 4
BEGIN;

UPDATE orders
SET status = 'Pengiriman'
WHERE ordernumber = 10100;

SELECT ordernumber, status
FROM orders
WHERE ordernumber = 10100;

SAVEPOINT status_pengiriman;

UPDATE orders
SET status = 'Batal'
WHERE ordernumber = 10100;

SELECT ordernumber, status
FROM orders
WHERE ordernumber = 10100;

ROLLBACK TO SAVEPOINT status_pengiriman;


COMMIT;






		