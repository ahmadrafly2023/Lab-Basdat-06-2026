-- live coding nomor 1

SET search_path TO "classicmodels", public;

SELECT orderNumber, 
	   UPPER (productCode) AS "Kode Produk", 
	   LEFT(productCode, 3) AS "Awal Kode",
	   RIGHT(productCode, 3) AS "Akhir Kode",
	   quantityOrdered, 
	   priceEach, 
	   quantityOrdered * priceEach AS "Total Penjualan"
FROM orderdetails

WHERE (quantityOrdered BETWEEN 20 AND 50 OR priceEach < 30) 
AND (orderNumber % 2 <> 0) 
AND LEFT(productCode, 3) = 'S18'

ORDER BY quantityOrdered * priceEach DESC;