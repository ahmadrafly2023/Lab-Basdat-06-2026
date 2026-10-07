CREATE DATABASE db_jaya_motor;

CREATE TABLE cabang_bengkel(
	id_cabang INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nama_cabang VARCHAR(50) NOT NULL UNIQUE,
	alamat VARCHAR(100) NOT NULL
);


CREATE TABLE pelanggan(
	id_pelanggan INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	no_ktp VARCHAR(16) NOT NULL UNIQUE,
	nama_pelanggan VARCHAR(150) NOT NULL,
	jenis_kelamin CHAR(1) CHECK (jenis_kelamin  IN ('L', 'P'))
);

CREATE TABLE mekanik(
	id_mekanik INT GENERATED ALWAYS AS IDENTITY  PRIMARY KEY,
	nama_mekanik VARCHAR(150) NOT NULL,
	no_sertifikasi VARCHAR(30) UNIQUE,
	pengalaman_tahun INT CHECK (pengalaman_tahun >= 0) default 0,
	id_cabang INT,

	CONSTRAINT rs_mekanik_bengkel
	FOREIGN KEY (id_cabang)
		REFERENCES cabang_bengkel(id_cabang) 
		
);

CREATE TABLE servis(
	id_servis INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	keluhan TEXT NOT NULL,
	biaya_servis NUMERIC(12,2) DEFAULT 100000,
	id_pelanggan INT,
	id_mekanik INT,
	
	CONSTRAINT rs_servis_pelanggan
	FOREIGN KEY (id_pelanggan)
		REFERENCES pelanggan(id_pelanggan),
		
	CONSTRAINT rs_servis_mekanik
	FOREIGN KEY (id_mekanik)
		REFERENCES mekanik(id_mekanik) 
	
);

