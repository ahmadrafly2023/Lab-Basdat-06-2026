SET search_path TO classicmodels, PUBLIC;
-- soal 1
SELECT  c.customername, 
c.country,
CONCAT(e.firstname, ' ', e.lastname) AS nama_lengkap_karyawan,
COUNT(p.checknumber) AS frekuensi_pembayaran,
SUM(p.amount) AS total_pembayaran
FROM customers As c
JOIN employees AS e
ON c.salesrepemployeenumber = e.employeenumber
JOIN payments AS p 
ON c.customernumber = p.customernumber
WHERE c.country != 'USA' AND c.contactfirstname ILIKE '%a%'
GROUP BY c.customernumber,c.customername, c.country,e.firstname,e.lastname
HAVING COUNT(p.checknumber) >= 2 AND SUM(p.amount) > 50000
ORDER BY total_pembayaran DESC;

-- soal 2
SELECT p.productline, 
COUNT(DISTINCT o.ordernumber) AS nota_pesanan,
SUM(od.quantityordered) AS total_terjual,
ROUND(AVG(od.priceeach), 2) AS rata_harga,
SUM(od.quantityordered * od.priceeach) AS total_penjualan
FROM products AS p
JOIN orderdetails AS od
ON p.productcode = od.productcode
JOIN orders AS o
ON od.ordernumber = o.ordernumber
WHERE o.status ='Shipped' AND p.buyprice > 30
GROUP BY p.productline
HAVING SUM(od.quantityordered) > 2000 AND 
AVG(od.priceeach) > 85
ORDER BY total_penjualan DESC
LIMIT 3;