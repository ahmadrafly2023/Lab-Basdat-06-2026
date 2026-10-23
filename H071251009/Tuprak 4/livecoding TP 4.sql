SET search_path TO classicmodels, PUBLIC;
-- nomor 1
SELECT productcode AS kode_produk,
SUM (quantityordered * priceeach) AS omzet_kotor,
ROUND(AVG(priceeach), 2) AS rata_harga,
ROUND(((MAX(priceeach) - MIN(priceeach)) / ROUND(AVG(priceeach), 2)) * 100, 2) AS presentase_disparitas 
FROM orderdetails
WHERE quantityordered BETWEEN 20 AND 50
GROUP BY productcode
HAVING SUM(quantityordered * priceeach) > 40000 AND (MAX(priceeach)- MIN (priceeach)) > 5
ORDER BY presentase_disparitas DESC;

-- nomor 2
SELECT customernumber AS nomor_pelanggan, 
'VIP credit' AS kategori_aktivitas
FROM customers
WHERE creditlimit > 120000
UNION ALL
SELECT customernumber AS nomor_pelanggan,
'Order Bermasalah' AS kategori_aktivitas
FROM orders
WHERE status IN ('Cancelled', 'Disputed')
UNION ALL
SELECT customernumber AS nomor_pelanggan,
'Top Payor' AS kategori_aktivitas
FROM payments
GROUP BY customernumber
HAVING SUM(amount) > 150000
ORDER BY nomor_pelanggan ASC;

-- nomor 3
SELECT customernumber AS nomor_pelanggan,
COUNT(*) AS frekuensi_pembayaran,
SUM(amount) AS total_pembayaran
FROM payments
GROUP BY customernumber
HAVING COUNT(*) > 5
ORDER BY total_pembayaran DESC;

-- nomor 4
SELECT customernumber
FROM customers
WHERE creditlimit > 60000
INTERSECT
SELECT customernumber
FROM payments
WHERE amount > 30000
INTERSECT
SELECT customernumber
FROM orders
WHERE status != 'Cancelled'
EXCEPT
SELECT customernumber
FROM payments
GROUP BY customernumber
HAVING SUM(amount) <= 15000;



