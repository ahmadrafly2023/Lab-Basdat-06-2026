
INSERT INTO cabang_bengkel (nama_cabang, alamat)
VALUES
	('cabang Pusat', 'JL.Ahmad Yani No.10' ),
	('cabang Utara', 'Jl Perintis Kemerdekaan No.45')
RETURNING *;

INSERT INTO mekanik (nama_mekanik,no_sertifikasi, id_cabang)
VALUES 
	('kevin', 'SERT-2024-001', 1 ),
	('nafisah', NULL , 1 ),
	('abdul', 'SERT-2024-002', 2 )
RETURNING *;

UPDATE mekanik
set pengalaman_tahun = 1
WHERE pengalaman_tahun = 0;

DELETE FROM mekanik
WHERE no_sertifikasi IS NULL;

SELECT * FROM mekanik;


SELECT DISTINCT status_pesanan AS "status Pesanan" FROM orders
WHERE status


