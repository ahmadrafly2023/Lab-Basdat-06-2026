-- SOAL 1
CREATE TABLE cabang_bengkel(
id_cabang INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
nama_cabang VARCHAR(50) NOT NULL UNIQUE,
alamat VARCHAR(100) NOT NULL
);

CREATE TABLE pelanggan(
id_pelanggan INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
no_ktp VARCHAR(16) NOT NULL UNIQUE, 
nama_pelanggan VARCHAR(150) NOT NULL
);

CREATE TABLE mekanik(
id_mekanik INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
nama_mekanik VARCHAR(150) NOT NULL,
no_sertifikasi VARCHAR(30) UNIQUE,
pengalaman_tahun INT CHECK(pengalaman_tahun >= 0) DEFAULT 0,
id_cabang INT,
	CONSTRAINT fk_mekanik_cabang_bengkel
	FOREIGN KEY (id_cabang)
	REFERENCES cabang_bengkel (id_cabang)	
);

CREATE TABLE servis(
id_servis INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
keluhan TEXT NOT NULL,
biaya_servis NUMERIC DEFAULT 100000,
id_pelanggan INT,
	CONSTRAINT fk_servis_pelanggan
	FOREIGN KEY (id_pelanggan)
	REFERENCES pelanggan(id_pelanggan),

id_mekanik INT,
	CONSTRAINT fk_servis_mekanik
	FOREIGN KEY (id_mekanik)
	REFERENCES mekanik(id_mekanik)
	
);

CREATE TABLE sparepart_terpakai(
id_sparepart INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
nama_sparepart VARCHAR(100) NOT NULL,
jumlah INT CHECK(jumlah >0),
id_servis INT,
 	CONSTRAINT fk_sparepart_terpakai_servis
	FOREIGN KEY (id_servis)
	REFERENCES servis(id_servis)
	
); 

ALTER TABLE pelanggan
ADD COLUMN no_hp VARCHAR(15)

ALTER TABLE sparepart_terpakai
ALTER COLUMN nama_sparepart type TEXT

ALTER TABLE cabang_bengkel
DROP COLUMN alamat



DROP TABLE








SELECT table_name0
WHERE table_schema = 'public'
ORDER BY table_name;
