SET search_path TO "classicmodels", public;

--nomor 1
SELECT
	c.contactfirstname AS nama_depan,
	c.customername AS nama_lengkap_pelanggan,
	of.city AS kota_kantor_cabang,
	CONCAT (e.firstname, ' ' ,e.lastname) AS sales_rep_name
FROM customers AS c
JOIN employees AS e
	ON c.salesrepemployeenumber = e.employeenumber
JOIN offices AS OF
	ON of.officecode = e.officecode
WHERE c.contactfirstname ILIKE 'A%'
	AND of.city != 'NYC'
ORDER BY c.customername;

--nomor 2
SELECT
	c.customername,
	SUM(p.amount) AS total_payment,
	MAX(p.amount) AS max_single_payment
FROM customers AS c
JOIN payments AS p
	ON c.customernumber = p.customernumber
GROUP BY c.customernumber
HAVING SUM(p.amount) > 50000
ORDER BY total_payment DESC;


--nomor 3
SELECT
	c.customername,
	COUNT(DISTINCT o.ordernumber) AS total_order,
	round(AVG(od.quantityordered),2) AS avg_quantity_per_order
FROM customers AS c
JOIN orders AS o
	ON c.customernumber = o.customernumber
JOIN orderdetails AS od
	ON o.ordernumber = od.ordernumber
GROUP BY c.customername
HAVING COUNT(DISTINCT o.ordernumber) > 3
AND AVG(od.quantityordered) > 35
ORDER BY total_order DESC, avg_quantity_per_order DESC;

--nomor 4
SELECT
	p.productline,
	SUM(od.quantityordered) AS total_terjual,
	round(AVG(od.priceeach),2) AS rata_rata_harga,
	round(AVG((p.MSRP - od.priceeach)/p.MSRP*100),2) AS AVG_discount_persentage
FROM orderdetails AS od
JOIN products AS p
	ON od.productcode = p.productcode
GROUP BY p.productline
HAVING SUM(od.quantityordered) > 3000
AND AVG(od.priceeach) > 80
ORDER BY total_terjual DESC;

--nomor 5
SELECT
    c.customername,
    SUM(od.quantityordered * od.priceeach) AS total_transaksi,
    COUNT(DISTINCT (o.ordernumber, o.status = 'Shipped')) AS total_shipped_orders,
    ROUND(SUM(od.quantityordered * od.priceeach)/ COUNT(DISTINCT o.ordernumber), 2) AS avg_transaction_per_order
FROM customers AS c
JOIN orders AS o
    ON c.customernumber = o.customernumber
JOIN orderdetails AS od
    ON o.ordernumber = od.ordernumber
GROUP BY c.customername
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM o.orderdate)) > 1
ORDER BY total_transaksi DESC
LIMIT 5;

--nomor 6
SELECT
	c.customername,
	c.city AS customer_city,
	of.city AS office_city,
	SUM(od.quantityordered) AS total_unit_terjual,
	round(SUM(od.priceeach*od.quantityordered)/COUNT(DISTINCT o.ordernumber),2) AS AVG_nilai_per_order
FROM customers AS c
JOIN employees AS e
	ON c.salesrepemployeenumber = e.employeenumber
JOIN offices AS OF
	ON e.officecode = of.officecode
JOIN orders AS o
	ON c.customernumber = o.customernumber
JOIN orderdetails AS od
	ON o.ordernumber = od.ordernumber
WHERE of.territory = 'EMEA'
GROUP BY c.customername,c.city,of.city
HAVING
	COUNT(DISTINCT EXTRACT(YEAR FROM o.orderdate)) > 2
	AND SUM(od.quantityordered) > 1000
	AND SUM(od.priceeach*od.quantityordered)/COUNT(DISTINCT o.ordernumber) > 10000
ORDER BY AVG_nilai_per_order DESC;