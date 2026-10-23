SET search_path TO "classicmodels", public;

--NOMOR 1
SELECT 
    customernumber AS nomor_pelanggan,
    SUM(amount) AS total_setoran,
    COUNT(checknumber) AS frekuensi_transaksi,
    MAX(amount) AS setoran_terbesar
FROM payments
GROUP BY customernumber
HAVING COUNT(checknumber) > 4 
   AND AVG(amount) > 20000;

--NOMOR 2
SELECT
	customerNumber,
	SUM(amount) AS total_setoran
FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 80000
ORDER BY total_setoran DESC;

--NOMOR 3
SELECT
    productline AS "Kategori Barang",
    COUNT(productline) AS "Jumlah Ragam Produk",
    ROUND(AVG(msrp), 2) AS "Rata-Rata MSRP",
    STRING_AGG(productname, ', ' ORDER BY productname DESC) AS "Daftar Produk"
FROM products
GROUP BY productline
HAVING COUNT(productline) > 10;

--NOMOR 4
SELECT DISTINCT reportsto AS "Nomor Karyawan"
FROM employees
WHERE reportsto IS NOT NULL
EXCEPT
SELECT employeenumber
FROM employees
WHERE jobtitle LIKE '%VP%' OR jobtitle LIKE '%President%';

--NOMOR 5
SELECT
	productCode,
	SUM(quantityordered) AS total_unit_terjual,
	ROUND(AVG(priceEach), 2) AS rata_rata_harga_jual
FROM orderdetails
WHERE priceEach > 100
GROUP BY productCode
HAVING SUM(quantityOrdered) > 50
ORDER BY total_unit_terjual DESC;

--NOMOR 6
SELECT 
    productCode,
    SUM(quantityOrdered) AS "Total Unit Dipesan",
    SUM(quantityOrdered * priceEach) AS "Pendapatan Kotor",
    ROUND(AVG(priceEach), 2) AS "Rata-rata Harga Satuan",
    (MAX(priceEach) - MIN(priceEach)) AS "Volatilitas Harga"
FROM orderdetails
WHERE quantityOrdered > 20
GROUP BY productCode
HAVING SUM(quantityOrdered * priceEach) > 50000
ORDER BY "Pendapatan Kotor" DESC;

--NOMOR 7
SELECT customerNumber
FROM customers
WHERE creditLimit > 80000

INTERSECT

SELECT DISTINCT customerNumber
FROM orders
WHERE status IN ('Cancelled', 'On Hold')
EXCEPT

SELECT customerNumber
FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 100000;


