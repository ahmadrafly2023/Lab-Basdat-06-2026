SELECT
    productCode,
    SUM(quantityOrdered * priceEach) AS total_omzet,
    ROUND(AVG(priceEach), 2) AS rata_rata_harga,
    ROUND((MAX(priceEach) - MIN(priceEach)) / AVG(priceEach) * 100, 2) AS persentase_disparitas
FROM orderdetails
WHERE quantityOrdered BETWEEN 20 AND 50
GROUP BY productCode
HAVING SUM(quantityOrdered * priceEach) > 40000
   AND MAX(priceEach) - MIN(priceEach) > 5
ORDER BY persentase_disparitas DESC;

--2
SELECT customerNumber, 'VIP Credit' AS kategori_aktivitas
FROM customers
WHERE creditLimit > 120000

UNION ALL

SELECT customerNumber, 'Order Bermasalah'
FROM orders
WHERE status =  'Cancelled' OR status = 'Disputed'

UNION ALL

SELECT customerNumber, 'Top Payor'
FROM payments
GROUP BY customerNumber
HAVING SUM(amount) > 150000
ORDER BY customerNumber ASC;




--3 SUDAH

SELECT
    customerNumber,
    COUNT(payments) AS jumlah_transaksi,
    SUM(amount) AS total_pembayaran
FROM payments
GROUP BY customerNumber
HAVING COUNT(payments) > 5
ORDER BY total_pembayaran DESC;



--4 BISMILLAH
SELECT 
	customerNumber
FROM customers
WHERE creditlimit >60000

INTERSECT

select 
	customernumber
FROM payments
WHERE (amount) > 30000

INTERSECT

SELECT
	customerNumber
FROM orders
WHERE Status != 'Cancelled'

EXCEPT
SELECT customerNumber
FROM payments
GROUP BY customerNumber
HAVING AVG(amount) <= 15000


	