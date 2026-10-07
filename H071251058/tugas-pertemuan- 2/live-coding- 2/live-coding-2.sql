SELECT DISTINCT status AS "Status Pesanan"
FROM classicmodels.orders
WHERE status <> 'Cancelled'
ORDER BY status DESC
LIMIT 3 OFFSET 1;