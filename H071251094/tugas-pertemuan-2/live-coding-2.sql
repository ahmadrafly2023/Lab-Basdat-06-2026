INSERT INTO cabang_bengkel (nama_cabang, alamat)
VALUES
('cabang pusat', 'JL.Ahmad Yani No. 10'),
('cabang utara', 'JL. Perintis Kemerdekaan No.45')
RETURNING *;

INSERT INTO mekanik (nama_mekanik, no_sertifikasi, id_cabang)
VALUES
('kevin', 'SERT-2024-001', 1),
('ASEP', NULL, 1),
('abdul','SERT-20	24-002', 2)
RETURNING *;

UPDATE mekanik 
set pengalaman_tahun = 1
where pengalaman_tahun = 0
RETURNING *;

DELETE FROM mekanik
WHERE no_sertifikasi IS NULL
RETURNING*

delete from cabang_bengkel;
delete from mekanik;


SELECT * FROM mekanik;