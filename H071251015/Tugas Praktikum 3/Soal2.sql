SET search_path TO "classicmodels", public;

--SOAL NOMOR 2
SELECT customernumber,
	customername,
	country,
	creditlimit,
	contactfirstname || ' ' || contactlastname AS "Nama Kontak",
	(creditlimit - 10000) AS "Selisih Kredit"
FROM customers
WHERE country IN ('USA', 'Canada', 'France')
	AND creditlimit > 30000
ORDER BY creditlimit DESC