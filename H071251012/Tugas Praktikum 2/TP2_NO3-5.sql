SET search_path TO "classicmodels", public;

SELECT customernumber AS "nomor pelanggan",customername AS "Nama Pelanggan", phone AS "Telepon", country AS "negara" FROM customers;
SELECT productcode, productname, buyprice FROM products
where buyprice > 50
order by buyprice DESC
LIMIT 7;

select DISTINCT  country AS "Negara Pelanggan" FROM customers
order by country ASC
LIMIT 5 OFFSET 5;