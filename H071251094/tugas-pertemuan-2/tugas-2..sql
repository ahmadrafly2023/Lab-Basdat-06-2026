-- soal no 3
set search_path to classicmodels;
SELECT
    customerNumber AS "Nomor Pelanggan",
    customerName AS "Nama Pelanggan",
    phone AS "Telepon",
    country AS "Negara"
FROM classicmodels.Customers; 
-- soal no 4
SELECT
    productCode,
    productName,
    buyPrice
FROM ClassicModels.Products 
WHERE buyPrice > 50
ORDER BY buyPrice DESC
LIMIT 7;
-- soal no 5
SELECT DISTINC
    country AS "Negara Pelanggan"
FROM ClassicModels.Customers
ORDER BY country ASC
LIMIT 5 OFFSET 5;



