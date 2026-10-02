SET search_path TO classicmodels;


SELECT 
customerNumber AS "Nomor Pelanggan", 
customerName AS "Nama Pelanggan", 
phone AS "Telepon", 
country AS "Negara"
FROM customers;



SELECT productCode, productName, buyPrice FROM products
WHERE buyprice > 50
ORDER BY buyPrice DESC
LIMIT 7;



SELECT DISTINCT country AS "Negara Pelanggan" FROM customers
ORDER BY country ASC
LIMIT 5 OFFSET 5;





