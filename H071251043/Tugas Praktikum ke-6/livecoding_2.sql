-- NOMOR 6
CREATE TABLE kurir (
    id_kurir SERIAL PRIMARY KEY,
    nama_kurir VARCHAR(50) NOT NULL,
    no_telepon VARCHAR(20) NOT NULL UNIQUE,
    status_aktif BOOLEAN DEFAULT TRUE
);

CREATE TABLE pengiriman (
    id_pengiriman SERIAL PRIMARY KEY,
    nomor_resi VARCHAR(30) NOT NULL UNIQUE,
    id_kurir INTEGER,
    tanggal_kirim TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ongkos_kirim NUMERIC(12,2) NOT NULL,
    status_pengiriman VARCHAR(20) DEFAULT 'Dalam Perjalanan',

    CONSTRAINT fk_pengiriman_kurir
        FOREIGN KEY (id_kurir)
        REFERENCES kurir(id_kurir),

    CONSTRAINT chk_ongkos_kirim
        CHECK (ongkos_kirim > 0)
);

CREATE INDEX idx_pengiriman_kurir
ON pengiriman (id_kurir);

CREATE INDEX idx_pengiriman_status
ON pengiriman (status_pengiriman);

DROP INDEX idx_pengiriman_status;