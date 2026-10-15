SET search_path TO "classicmodels", public;

--SOAL NOMOR 3
SELECT productCode,
       productName,
       buyPrice,
       MSRP,
       GREATEST(buyPrice, MSRP) AS "Harga Tertinggi",
       LEAST(buyPrice, MSRP) AS "Harga Terendah"
FROM products
WHERE productName ILIKE '%car%';