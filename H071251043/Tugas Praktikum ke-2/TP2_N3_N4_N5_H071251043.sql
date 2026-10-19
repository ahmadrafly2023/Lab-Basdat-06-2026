SET search_path TO "classicmodels", public;

-- ========== NOMOR 3
SELECT customerNumber AS "Nomor Pelanggan", 
	   customerName AS "Nama Pelanggan", 
	   phone AS "Telepon", 
	   country AS "Negara"
FROM customers;

-- ========== NOMOR 4
SELECT productCode, productName, buyPrice
FROM products
WHERE buyPrice > 50
ORDER BY buyPrice DESC
LIMIT 7;
-- tampilkan dengan buyPrice > 50
-- urutkan dari tinggi ke rendah
-- hanya 7 produk pertama

-- ========== NOMOR 5
SELECT DISTINCT country AS "Negara Pelanggan" FROM customers
ORDER BY country ASC
LIMIT 5
OFFSET 5;




