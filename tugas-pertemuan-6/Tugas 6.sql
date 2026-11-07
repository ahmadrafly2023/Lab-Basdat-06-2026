SET search_path TO classicmodels;

-- 1
SELECT 
	productCode, 
	productName,
	MSRP,
	quantityinStock AS jumlah_Stok,
	CASE
		WHEN MSRP < 50 AND quantityinStock > 500 THEN 'Ekonomis-Stok Tinggi'
		WHEN MSRP < 50 AND quantityinStock <= 50 THEN 'Ekonomis-Stok Rendah'
		WHEN MSRP BETWEEN 50 AND 100  THEN 'Harga Menengah'
		WHEN MSRP > 100 THEN 'Harga Premium'
	END AS Kategori_Produk
FROM products
ORDER BY MSRP DESC;


-- 2
SELECT 
	productCode,
	total_unit_terjual,
	jumlah_pesanan_berbeda
FROM (
	SELECT
		productCode,
		SUM(quantityOrdered) AS total_unit_terjual,
		COUNT(DISTINCT orderNumber) AS jumlah_pesanan_berbeda
	FROM orderdetails
	GROUP BY productCode
)AS sumber
WHERE total_unit_terjual > (
	SELECT AVG(quantityOrdered)
	FROM orderdetails
) AND jumlah_pesanan_berbeda > 10
ORDER BY total_unit_terjual DESC;




-- 3
SELECT
	productCode, 
	productName,
	quantityinstock AS jumlah_stok, 
	MSRP
FROM products
WHERE quantityInstock > (
	SELECT AVG(quantityInstock)
	FROM products
) AND MSRP > (
	SELECT AVG(MSRP)
	FROM products
)
ORDER BY quantityInstock DESC; 



-- 4
BEGIN;

UPDATE orders
SET status = 'Pengiriman'
WHERE orderNumber = 10100;

SAVEPOINT status_pengiriman;

UPDATE orders
SET status = 'Batal'
WHERE orderNumber = 10100;

SAVEPOINT status_pengriman;

ROLLBACK TO SAVEPOINT status_pengiriman; 

SELECT 
	orderNumber,
	status
FROM orders
WHERE orderNumber = 10100;

COMMIT;





-- 5
CREATE TABLE anggota(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_anggota VARCHAR(50) NOT NULL,
	kota_domisili VARCHAR(20) NOT NULL
);

CREATE TABLE buku(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	judul_buku VARCHAR(100) NOT NULL,
	genre VARCHAR(20) NOT NULL,
	stok INT DEFAULT 1
);


CREATE TABLE peminjaman(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	id_anggota INT,
	id_buku INT ,
	tanggal_pinjam DATE NOT NULL,
	tanggal_kembali DATE,
	denda INT DEFAULT 0,

	CONSTRAINT fk_peminjaman_anggota
		FOREIGN KEY (id_anggota)
		REFERENCES anggota(id),

	CONSTRAINT fk_peminjaman_buku 
		FOREIGN KEY(id_buku)
		REFERENCES buku(id)
);


CREATE INDEX idx_buku_genre
ON buku USING btree (genre);

CREATE INDEX idx_anggota_kota_domisili
ON anggota USING btree(kota_domisili);



