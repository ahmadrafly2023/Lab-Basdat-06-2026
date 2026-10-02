SET search_path TO "classicmodels", public;

SELECT DISTINCT status AS "status pesanan" FROM orders
WHERE status != 'Cancelled'
ORDER BY status DESC
LIMIT 3 OFFSET 1;
