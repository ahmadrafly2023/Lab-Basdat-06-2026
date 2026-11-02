SET search_path TO "classicmodels", public;

--soal 1
SELECT
    c.customerNumber,
    c.customerName,
    c.city,
    (SELECT COUNT(*)
     FROM orders o
     WHERE o.customerNumber = c.customerNumber) AS total_pesanan,
    CASE
        WHEN (SELECT COUNT(*) FROM orders o
              WHERE o.customerNumber = c.customerNumber) > 5
            THEN 'Pelanggan Loyal'
        WHEN (SELECT COUNT(*) FROM orders o
              WHERE o.customerNumber = c.customerNumber) BETWEEN 2 AND 5
            THEN 'Pelanggan Aktif'
        WHEN (SELECT COUNT(*) FROM orders o
              WHERE o.customerNumber = c.customerNumber) = 1
            THEN 'Pelanggan Baru'
        ELSE 'Pelanggan Pasif'
    END AS status_loyalitas
FROM customers c
ORDER BY total_pesanan DESC, c.customerName ASC;

--soal 2
SELECT
    e.employeeNumber,
    e.firstName || ' ' || e.lastName AS nama_lengkap,
    e.email,
    e.officeCode
FROM employees e
WHERE e.jobTitle = 'Sales Rep'
  AND NOT EXISTS (
        SELECT 1
        FROM customers c
        JOIN orders o ON o.customerNumber = c.customerNumber
        WHERE c.salesRepEmployeeNumber = e.employeeNumber
          AND o.status = 'Shipped'
  )
ORDER BY e.employeeNumber ASC;

--soal 3
SELECT
    productCode,
    productName,
    productLine,
    buyPrice
FROM products
WHERE productLine = 'Classic Cars'
  AND buyPrice > ALL (
        SELECT buyPrice
        FROM products
        WHERE productLine = 'Vintage Cars'
  )
ORDER BY buyPrice DESC;

--soal 4
SELECT
    t.customerNumber,
    t.customerName,
    ROUND(t.total_belanja, 2) AS total_belanja
FROM (
    SELECT
        c.customerNumber,
        c.customerName,
        SUM(od.quantityOrdered * od.priceEach) AS total_belanja
    FROM customers c
    JOIN orders o       ON o.customerNumber = c.customerNumber
    JOIN orderdetails od ON od.orderNumber  = o.orderNumber
    GROUP BY c.customerNumber, c.customerName
) AS t
WHERE t.total_belanja > (
    SELECT AVG(x.total_belanja)
    FROM (
        SELECT SUM(od.quantityOrdered * od.priceEach) AS total_belanja
        FROM orders o
        JOIN orderdetails od ON od.orderNumber = o.orderNumber
        GROUP BY o.customerNumber
    ) AS x
)
ORDER BY t.total_belanja DESC;

--soal 5
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

UPDATE customers
SET creditLimit = 10000
WHERE customerNumber = 103;

SAVEPOINT sp_update_kredit;

UPDATE customers
SET city = 'Surabaya'
WHERE customerNumber = 103;

ROLLBACK TO SAVEPOINT sp_update_kredit;

COMMIT;