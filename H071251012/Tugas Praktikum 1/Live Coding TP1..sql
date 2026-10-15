CREATE TABLE cabang_bengkel (
    id_cabang INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nama_cabang VARCHAR(50) NOT NULL UNIQUE,
    alamat VARCHAR(100) NOT NULL
);

CREATE TABLE pelanggan (
    id_pelanggan INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    no_ktp VARCHAR(16) NOT NULL UNIQUE,
    nama_pelanggan VARCHAR(150) NOT NULL,
    jenis_kelamin VARCHAR(1) CHECK (jenis_kelamin IN ('L', 'P'))
);

CREATE TABLE mekanik (
    id_mekanik INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nama_mekanik VARCHAR(150) NOT NULL,
    no_sertifikasi VARCHAR(30) UNIQUE,
    pengalaman_tahun INT DEFAULT 0 CHECK (pengalaman_tahun >= 0),
    id_cabang INT,
	CONSTRAINT fk_mk_cb
    FOREIGN KEY (id_cabang) REFERENCES cabang_bengkel(id_cabang)
);

CREATE TABLE servis (
    id_servis INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    keluhan TEXT NOT NULL,
    biaya_servis DECIMAL DEFAULT 100000,
    id_pelanggan INT,
    id_mekanik INT,
	CONSTRAINT fk_sp_pg
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
	CONSTRAINT fk_sp_mk
    FOREIGN KEY (id_mekanik) REFERENCES mekanik(id_mekanik)
);

CREATE TABLE sparepart_terpakai (
    id_sparepart INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nama_sparepart VARCHAR(100) NOT NULL,
    jumlah INT CHECK (jumlah > 0),
    id_servis INT,
	CONSTRAINT fk_st_sp
    FOREIGN KEY (id_servis) REFERENCES servis(id_servis)
);


ALTER TABLE pelanggan
ADD COLUMN no_hp VARCHAR(15);

ALTER TABLE sparepart_terpakai
ALTER COLUMN nama_sparepart TYPE TEXT;

ALTER TABLE cabang_bengkel
DROP COLUMN alamat;

DROP TABLE sparepart_terpakai;

DROP TABLE servis;
