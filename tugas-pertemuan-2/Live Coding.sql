SET search_path TO classicmodels;


SELECT DISTINCT status  AS "Status Pesanan" FROM orders
ORDER BY status DESC
LIMIT 3 OFFSET 1;