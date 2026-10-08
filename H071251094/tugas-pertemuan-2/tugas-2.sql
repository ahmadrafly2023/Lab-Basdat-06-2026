-- SOAL NOMOR 1

INSERT INTO prodi (nama_prodi)
VALUES
('Sistem Informasi'),
('Ilmu Komunikasi'),
('Manajemen');

INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES
('070507', 'Brahim Diaz', 'brahimd@gmail.com', 1),
('231006', 'Valverde', NULL, 1),
('060607', 'Vini', 'vini@gmail.com', 2)
RETURNING *;

-- SOAL NOMOR 2
INSERT INTO mahasiswa (nim, nama, ipk, email, id_prodi)
VALUES
('H071251017', 'Raikhan', 3.50, 'Raikhan@gmail.com', 1),
('H071251074', 'Arda', 3.50, 'Arda@gmail.com', 2),
('H071251090', 'Bellingham', 3.50, 'Bellingham@gmail.com', 1);

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50
RETURNING *;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING *;

DELETE FROM mahasiswa
where ipk is null
returning *;


SELECT * FROM mahasiswa;