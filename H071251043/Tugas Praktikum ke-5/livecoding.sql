-- =====NOMOR 1
SET search_path TO classicmodels, public;

SELECT c.customerName AS "Nama Perusahaan",
       c.country AS "Negara Asal",
       CONCAT(e.firstName, ' ', e.lastName) AS "Nama Karyawan",
       COUNT(DISTINCT p.checkNumber) AS "Frekuensi Pembayaran",
       SUM(p.amount) AS "Total Pembayaran"
FROM customers c
JOIN employees e
     ON c.salesRepEmployeeNumber = e.employeeNumber
JOIN payments p
     ON c.customerNumber = p.customerNumber
WHERE c.country <> 'USA'
AND c.contactFirstName ILIKE '%A%'
GROUP BY c.customerNumber,
         c.customerName,
         c.country,
         e.firstName,
         e.lastName
HAVING COUNT(DISTINCT p.checkNumber) >= 2
AND SUM(p.amount) > 50000
ORDER BY SUM(p.amount) DESC;