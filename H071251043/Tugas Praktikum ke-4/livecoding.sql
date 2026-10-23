SET search_path TO classicmodels, public;

SELECT customerNumber,
	   COUNT(DISTINCT checkNumber) AS "frekuensi pembayaran",
	   SUM(amount) AS "total pembayaran"
FROM payments
GROUP BY customerNumber
HAVING COUNT(DISTINCT checkNumber) > 5 
ORDER BY SUM(amount) DESC;