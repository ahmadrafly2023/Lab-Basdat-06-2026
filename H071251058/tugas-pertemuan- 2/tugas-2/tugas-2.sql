-- Nomor 1 --
SELECT * FROM public.prodi;
SELECT * FROM public.mahasiswa;

DELETE FROM public.mahasiswa;

INSERT INTO public.mahasiswa (nim, nama, email, id_prodi)
VALUES ('H071251058', 'M. Fayyadh Muwaffaq', NULL , 1), 
		('H011251025', 'M. Imran Rahman', 'imran@gmail.com', 2), 
		('H081251060', 'Arief Hidayatullah', 'arif@gmail.com', 3)
RETURNING*;

-- Nomor 2 --

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 0.00;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING*;

-- Nomor 3 --

SELECT 
	customernumber AS "Nomor Pelanggan",
	customername AS "Nama pelanggan", 
	phone AS "Telepon", 
	country AS "Negara" 
FROM classicmodels.customers;

-- Nomor 4 --

SELECT productcode, productname, buyprice 
FROM classicmodels.products
WHERE buyprice > 50
ORDER BY buyprice DESC
LIMIT 7;

-- Nomor 5 --

SELECT DISTINCT country AS "Negara Pelanggan"
FROM classicmodels.customers
ORDER BY country ASC
LIMIT 5 OFFSET 5;