ALTER TABLE cabang_bengkel
ALTER COLUMN alamat TYPE VARCHAR(120);

INSERT INTO cabang_bengkel (nama_cabang, alamat)
VALUES 
	('Cabang Pusat', 'Jl Ahmad Yani No. 10'),
	('Cabang Utara', 'Jl Perintis Kemerdekaan');

INSERT INTO mekanik (nama_mekanik, no_sertifikasi, id_cabang)
VALUES 
	('kevin', 'SERT-2024-001', 1),
	('rafly', NULL, 1),
	('abdul', 'SERT-2024-002', 2)
RETURNING *;

UPDATE mekanik
SET pengalaman_tahun = 1
WHERE pengalaman_tahun = 0;

DELETE FROM mekanik 
WHERE no_sertifikasi is NULL
RETURNING *;
