INSERT INTO prodi (nama_prodi)
VALUES ('Sistem Informasi'),
('Matematika'),('Aktuaria')
RETURNING*;
-- nomor 1
INSERT INTO mahasiswa (nim,nama,email,id_prodi)
VALUES ('H071251009','Muh Naufal Alim', NULL, 1),
('H011251049', 'Muh Yusril Adityawan', 'lazarus12@gmail.com',2),
('H081251037', 'Abdillah Sabil', 'abdi145@gmail.com',3)
RETURNING*;


-- nomor 2
UPDATE mahasiswa
SET ipk= 3.75
WHERE ipk=0.00
RETURNING*;

SELECT * FROM mahasiswa
WHERE email IS NULL;
DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING*;

DELETE FROM mahasiswa
WHERE ipk=0.00;

TRUNCATE TABLE prodi  RESTART IDENTITY CASCADE;




