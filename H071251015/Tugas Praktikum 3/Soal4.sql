SET search_path TO "classicmodels", public;

--SOAL NOMOR 4
SELECT ordernumber,
	orderdate,
	shippeddate,
	EXTRACT (YEAR FROM orderdate) AS "Tahun",
	EXTRACT (MONTH FROM orderdate) AS "Bulan",
	shippeddate - orderdate AS "Lama Pengiriman",
	AGE (shippeddate, orderdate) AS "Interval Pengiriman",
	CURRENT_DATE AS "Tanggal Laporan",
	CURRENT_TIME AS "Waktu Laporan"
FROM orders
WHERE shippeddate IS NOT NULL;