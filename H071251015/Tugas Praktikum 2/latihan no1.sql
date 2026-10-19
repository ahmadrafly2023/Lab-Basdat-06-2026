SET search_path TO cabang_bengkel,public;

SELECT *FROM mekanik;
INSERT INTO cabang_bengkel (nama_cabang, alamat)
VALUES
	('cabang Pusat', 'JL.Ahmad Yani No.10' ),
	('cabang Utara', 'Jl Perintis Kemerdekaan No.45')
RETURNING *;

INSERT INTO mekanik (nama_mekanik,no_sertifikasi,id_cabang )
VALUES 
	   ('kevin','SERT-2024-001', 1),
	   ('nita', NULL ,1),
	   ('abdul','SERT-2024-003',2)
RETURNING *;

UPDATE mekanik
SET pengalaman_tahun = 1
WHERE pengalaman_tahun = 0;
RETURNING *;

DELETE FROM mekanik
WHERE no_sertifikasi IS NULL;

--SOAL2
SELECT DISTINCT status_pesanan AS "status pesanan" FROM orders;
WHERE 

OFFSET = 1;