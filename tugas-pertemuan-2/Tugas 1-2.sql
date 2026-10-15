CREATE DATABASE praktikum_db;
CREATE TABLE prodi(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_prodi VARCHAR(100) NOT NULL
);

INSERT INTO prodi (nama_prodi)
VALUES 
('Sistem Informasi'),
('Ilmu Komputer'),
('Matematika');


SELECT * FROM prodi;


CREATE TABLE mahasiswa(
	nim VARCHAR(20) PRIMARY KEY,
	nama VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE,
	ipk NUMERIC(3,2) DEFAULT 0.00
		CHECK (ipk >= 0.00 AND ipk <=4.00),
	id_prodi INT,
	CONSTRAINT fk_mahasiswa_prodi
		FOREIGN KEY (id_prodi)
		REFERENCES prodi(id)
);

INSERT INTO mahasiswa(nim, nama, email, ipk, id_prodi)
VALUES
('MHS001', 'Andi Pratama', 'andi@gmail.com', 3.50, 1),
('MHS002', 'Budi Santoso', 'budi@gmail.c', 3.25, 2),
('MHS003', 'Citra Lestari', 'citra@gmail.com', 3.50, 1);

INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES
    ('MHS004', 'Rizky Ramadhan', 'rizky@gmail.com', 1),
    ('MHS005', 'Fajar Maulana', NULL, 2),
    ('MHS006', 'Aulia Putri', 'aulia@gmail.com', 3)
RETURNING *;



UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50;
RETURNING *;


DELETE FROM mahasiswa
WHERE email IS NULL;
RETURNING *;




