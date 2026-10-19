-- ========== NOMOR 1
CREATE TABLE prodi (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_prodi VARCHAR(100) NOT NULL
);

INSERT INTO prodi (nama_prodi)
VALUES 
	('Sistem Informasi'),
	('Aktuaria'),
	('Matematika');

CREATE TABLE mahasiswa (
	nim VARCHAR(10) PRIMARY KEY,
	nama VARCHAR(100) NOT NULL,
	ipk NUMERIC(3,2) DEFAULT 0.00,
	email VARCHAR(150) UNIQUE,
	id_prodi INT,
	CONSTRAINT fk_mahasiswa_prodi
		FOREIGN KEY (id_prodi)
		REFERENCES prodi (id)
);

INSERT INTO mahasiswa (nim, nama, email, id_prodi)
VALUES 
	('H071251043', 'Viola Velisitas', 'violavd15@gmail.com', 1),
	('H071251037', 'Mufiidah Febrianty', NULL, 2),
	('H071251001', 'Vivien Elvaretta', 'vivien06@gmail.com', 3);
SELECT * FROM mahasiswa;


-- ========== NOMOR 2
UPDATE mahasiswa
SET ipk = 3.75
WHERE ipk = 3.50;

DELETE FROM mahasiswa
WHERE email is NULL;

SELECT * FROM mahasiswa;















































