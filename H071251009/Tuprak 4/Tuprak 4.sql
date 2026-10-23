SET search_path TO classicmodels, PUBLIC;
-- nomor 1
SELECT customernumber AS nomor_pelanggan, 
SUM (amount) AS total_dana_rill,
COUNT (*) AS frekuensi_penjualan,
MAX(amount) AS setoran_terbesar
FROM payments
GROUP BY customernumber
HAVING COUNT (*) > 4 AND AVG(amount) > 20000;

-- nomor 2
SELECT customernumber AS nomor_identifikasi_pelanggan,
SUM (amount) AS total_dana
FROM payments
GROUP BY customernumber 
HAVING SUM (amount) > 80000
ORDER BY total_dana DESC;

-- nomor 3
SELECT productline AS kategori_barang, 
COUNT (*) AS jumlah_kategori,
ROUND(AVG(buyprice), 2) AS rata_harga_jual,
STRING_AGG(productname, ', ' ORDER BY productname) AS nama_produk
FROM products
GROUP BY productline
HAVING COUNT(productline) > 10;

-- nomor 4
SELECT DISTINCT reportsto AS nomor_identifikasi
FROM employees
WHERE reportsto IS NOT NULL
EXCEPT
SELECT DISTINCT employeenumber
FROM employees
WHERE jobtitle LIKE 'VP%' OR jobtitle LIKE 'President%';

-- nomor 5
SELECT productcode AS kode_produk,
SUM(quantityordered) AS total_unit_terjual,
ROUND(AVG(priceeach), 2) AS rata_harga_riil
FROM orderdetails
WHERE priceeach > 100
GROUP BY productcode
HAVING SUM(quantityordered) > 50
ORDER BY total_unit_terjual DESC;

-- nomor 6
SELECT productcode AS kode_produk,
SUM(quantityordered) AS unit_terjual,
SUM(quantityordered * priceeach) AS estimasi_pendapatan_kotor,
ROUND(AVG(priceeach), 2) AS rata_harga_riil,
MAX(priceeach) - MIN(priceeach) AS volatilitas_harga_jual
FROM orderdetails
WHERE quantityordered > 20
GROUP BY productcode
HAVING SUM (quantityordered * priceeach) > 50000
ORDER BY estimasi_pendapatan_kotor DESC;

-- nomor 7
SELECT customernumber 
FROM customers
WHERE creditlimit > 80000
INTERSECT 
SELECT customernumber
FROM orders
WHERE status IN('Cancelled', 'On Hold')
EXCEPT 
SELECT customernumber
FROM payments
GROUP BY customernumber
HAVING SUM(amount) > 100000;