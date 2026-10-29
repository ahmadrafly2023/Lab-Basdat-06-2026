BEGIN;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

UPDATE classicmodels.customers
SET creditlimit = 10000
WHERE customernumber = 103;

SAVEPOINT sp_update_kredit;

UPDATE classicmodels.customers
SET city = 'Surabaya'
WHERE customernumber = 103;

ROLLBACK TO SAVEPOINT sp_update_kredit;

COMMIT;