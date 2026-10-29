SET search_path TO classicmodels, PUBLIC;
BEGIN;

UPDATE customers
SET creditlimit = creditlimit + 1000
WHERE customernumber = 103;

SELECT customernumber, creditlimit
FROM customers
WHERE customernumber = 103;

SAVEPOINT sp_update_kredit;

UPDATE customers
SET city = 'Surabaya'
WHERE customernumber = 103;

SELECT customernumber, city
FROM customers 
WHERE customernumber = 103;

ROLLBACK;

COMMIT;