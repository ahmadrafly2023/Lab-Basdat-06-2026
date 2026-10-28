SET search_path TO classicmodels;

-- Live Coding 
-- 1
SELECT 
    c.customerName AS nama_perusahaan,
    c.country AS negara_asal,
    e.firstName || ' ' || e.lastName AS nama_karyawan,
    COUNT(p.checkNumber) AS jumlah_pembayaran,
    SUM(p.amount) AS total_pembayaran
FROM customers c
JOIN employees e 
	ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments p 
	ON c.customerNumber = p.customerNumber
WHERE c.country <> 'USA' AND LOWER(c.contactFirstName) LIKE '%a%'
GROUP BY c.customerNumber, c.customerName, c.country, e.employeeNumber, e.firstName, e.lastName
HAVING 
    COUNT(p.checkNumber) >= 2
    AND SUM(p.amount) > 50000
ORDER BY total_pembayaran DESC;


-- 2
SELECT 
    p.productLine AS nama_lini_produk,
    COUNT(DISTINCT o.orderNumber) AS jumlah_nota_unik,
    SUM(od.quantityOrdered) AS total_unit_terjual,
    ROUND(AVG(od.priceEach), 2) AS avg_harga_jual,
    SUM(od.quantityOrdered * od.priceEach) AS total_omzet
FROM products p
JOIN orderdetails od 
	ON p.productCode = od.productCode
JOIN orders o 
	ON od.orderNumber = o.orderNumber
WHERE o.status = 'Shipped' AND p.buyPrice > 30
GROUP BY p.productLine
HAVING 
    SUM(od.quantityOrdered) > 2000
    AND AVG(od.priceEach) > 85
ORDER BY total_omzet DESC
LIMIT 3;




