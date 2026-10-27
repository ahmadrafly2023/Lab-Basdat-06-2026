SET search_path TO "classicmodels", public;

--nomor 1
SELECT 
    c.customername,
    c.country,
    CONCAT(e.firstname, ' ', e.lastname) AS nama_karyawan,
    COUNT(p.checknumber) AS jumlah_pembayaran,
    SUM(p.amount) AS total_pembayaran
FROM customers AS c
JOIN employees AS e 
    ON c.salesrepemployeenumber = e.employeenumber
JOIN payments AS p 
    ON c.customernumber = p.customernumber
WHERE c.country != 'USA'
  AND LOWER(c.contactfirstname) ILIKE '%a%'
GROUP BY 
    c.customername, c.country, e.firstname, e.lastname
HAVING COUNT(p.checknumber) >= 2
   AND SUM(p.amount) > 50000
ORDER BY total_pembayaran DESC;


-- Nomor 2
SELECT p.productline,
       COUNT(DISTINCT od.ordernumber),
       SUM(od.quantityordered),
       ROUND(AVG(od.priceeach), 2) AS rata_rata_harga,
       SUM(od.quantityordered * od.priceeach) AS total_omzet
FROM products AS p
JOIN orderdetails AS od
    ON p.productcode = od.productcode
JOIN orders AS o
    ON od.ordernumber = o.ordernumber
WHERE p.buyprice > 30 AND o.status = 'Shipped' 
GROUP BY p.productline
HAVING SUM(od.quantityordered) > 2000
   AND AVG(od.priceeach) > 85
ORDER BY total_omzet DESC
LIMIT 3;


