--soal1
SET search_path TO "Pertemuan_01", public;

SELECT * FROM mahasiswa;
SELECT * FROM prodi;


INSERT INTO mahasiswa(nim, nama, email, id_prodi)
VALUES
	('H071251015','Ryul','ryullngshot@gmail.com',1),
	('H071251088','Asa','Asabaemon@gmail.com',2),
	('H071251055','Carlos', NULL, 3)
RETURNING *;

INSERT INTO mahasiswa (nim, nama, ipk, email, id_prodi)
VALUES
	('H071251037','Sehun',3.50,'ohsehun@gmail.com',1),
	('H071251054','Suho',3.80,'kimsuho@gmail.com',2),
	('H071251089','Wu Yifan',3.40,'wuyifan@gamil.com',3),
	('H071251016','Chanyeol',3.50,'chanyeol@gamil.com',1)
RETURNING *;

UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50;

DELETE FROM mahasiswa
WHERE email IS NULL
RETURNING *;


