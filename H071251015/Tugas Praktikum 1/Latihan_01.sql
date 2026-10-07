CREATE DATABASE db_jaya_motor;

CREATE TABLE cabang_bengkel(
	id_cabang INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_cabang VARCHAR(50) NOT NULL UNIQUE,
	alamat VARCHAR(100)NOT NULL
);

CREATE TABLE pelanggan(
	id_pelanggan INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	no_ktp VARCHAR(16)NOT NULL UNIQUE,
	nama_pelanggan VARCHAR(150) NOT NULL,
	jenis_kelamin CHAR(1) CHECK(jenis_kelamin IN ('L' , 'P'))
);

CREATE TABLE mekanik(
	id_mekanik INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_mekanik VARCHAR(150) NOT NULL,
	no_sertifikasi VARCHAR(30) UNIQUE,
	pengalaman_tahun INT DEFAULT 0 CHECK(pengalaman_tahun >=0),
	id_cabang INT,
	CONSTRAINT fk_id_cabang_cabang_bengkel
		FOREIGN KEY (id_cabang)
		REFERENCES cabang_bengkel(id_cabang)
);

CREATE TABLE service(
	id_service INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	keluhan TEXT NOT NULL,
	biaya_service NUMERIC(12,2) DEFAULT 100000,
	id_pelanggan INT,
	CONSTRAINT fk_id_pelanggan_pelanggan
		FOREIGN KEY (id_pelanggan)
		REFERENCES pelanggan(id_pelanggan)
);

CREATE TABLE sparepart_terpakai(
	id_sparepart INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_sparepart VARCHAR(100) NOT NULL,
	jumlah INT CHECK(jumlah > 0),
	id_service INT, 
	CONSTRAINT fk_id_service_service
		FOREIGN KEY (id_service)
		REFERENCES service(id_service)
);

--soal2
ALTER TABLE pelanggan
ADD COLUMN no_hp VARCHAR(15);

ALTER TABLE sparepart_terpakai
ALTER COLUMN nama_sparepart TYPE TEXT;

ALTER TABLE cabang_bengkel
DROP COLUMN alamat;



