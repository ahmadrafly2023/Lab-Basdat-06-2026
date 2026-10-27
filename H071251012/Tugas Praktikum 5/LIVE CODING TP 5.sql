SET search_path TO "classicmodels", public;

SELECT c.customername,
       c.country,
       CONCAT(e.firstname, ' ', e.lastname) AS nama_employee,
       COUNT(p.checknumber) AS total_payment,
       SUM(p.amount) AS total_pembayaran
FROM customers c
JOIN employees e
	ON c.salesrepemployeenumber = e.employeenumber
JOIN payments p
	ON c.customernumber = p.customernumber
	
WHERE  c.country != 'USA'
		AND LOWER(c.contactfirstname) ILIKE '%a%'
GROUP BY
	c.customername, c.country, e.firstname, e.lastname
HAVING COUNT(p.checknumber) >= 2
   AND SUM(p.amount) > 50000
ORDER BY total_pembayaran DESC;


SELECT p.productline,
       COUNT(DISTINCT od.ordernumber),
       SUM(od.quantityordered),
       ROUND(AVG(od.priceeach), 2) AS rata_rata_harga,
       SUM(od.quantityordered * od.priceeach) AS total_omzet
FROM products p
JOIN orderdetails od
    ON p.productcode = od.productcode
JOIN orders o
    ON od.ordernumber = o.ordernumber
WHERE p.buyprice > 30
  AND o.status = 'Shipped'
  
GROUP BY p.productline
HAVING SUM(od.quantityordered) > 2000
   AND AVG(od.priceeach) > 85
ORDER BY total_omzet DESC
LIMIT 3;

	
