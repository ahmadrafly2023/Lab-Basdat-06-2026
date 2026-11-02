SET search_path TO "classicmodels", public;

--No1
SELECT 
    productCode AS "Code Product", 
    productName AS "Nama Product", 
    MSRP, 
    quantityInStock AS "Jumlah Stock",
    CASE 
        WHEN MSRP < 50 AND quantityInStock > 500 THEN 'Ekonomis - Stok Tinggi'
        WHEN MSRP < 50 AND quantityInStock <= 500 THEN 'Ekonomis - Stok Rendah'
        WHEN MSRP BETWEEN 50 AND 100 THEN 'Harga Menengah'
        WHEN MSRP > 100 THEN 'Harga Premium'
    END AS kategori_produk
FROM 
    products
ORDER BY 
    MSRP DESC;

--No2
SELECT 
    productCode, 
    SUM(quantityOrdered) AS total_unit_terjual, 
    COUNT(DISTINCT orderNumber) AS jumlah_pesanan
FROM 
    orderdetails
GROUP BY 
    productCode
HAVING 
    SUM(quantityOrdered) > (SELECT AVG(quantityOrdered) FROM orderdetails)
    AND COUNT(DISTINCT orderNumber) > 10
ORDER BY 
    total_unit_terjual DESC;

--No3
SELECT 
    productCode, 
    productName, 
    quantityInStock, 
    MSRP
FROM 
    products
WHERE 
    quantityInStock > (SELECT AVG(quantityInStock) FROM products)
    AND MSRP > (SELECT AVG(MSRP) FROM products)
ORDER BY 
    quantityInStock DESC;
	
--No4
SELECT ordernumber, status
FROM orders
WHERE ordernumber = 10100;

BEGIN;

-- 1. Mengubah status menjadi 'Pengiriman'
UPDATE orders 
SET status = 'Pengiriman' 
WHERE orderNumber = 10100;

-- 2. Membuat savepoint sebagai penanda
SAVEPOINT status_pengiriman;

-- 3. Mengubah status menjadi 'Batal'
UPDATE orders 
SET status = 'Batal' 
WHERE orderNumber = 10100;

-- 4. Membatalkan perubahan kedua ke titik savepoint
ROLLBACK TO SAVEPOINT status_pengiriman;

-- 5. Mengakhiri transaksi dan menyimpan perubahan pertama
COMMIT;
