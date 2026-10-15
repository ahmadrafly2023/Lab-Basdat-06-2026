SET search_path TO "classicmodels", public;

--SOAL NOMOR 1
SELECT ordernumber,
	UPPER (productcode) AS "Kode Produk",
	quantityordered,
	priceeach
FROM orderdetails
WHERE (quantityordered BETWEEN 20 AND 50 OR priceeach < 30)
	AND LEFT (productcode, 3) = 'S18'
ORDER BY quantityordered DESC;
