SET search_path TO praktikum_db, public;

--soal1
INSERT INTO mahasiswa(nim, nama, email, id_prodi)
VALUES
('H071251012', 'kwon ohyul', 'ohyul@gmail.com', 1),
('H071251013', 'tumbal', NULL , 1),
('H071251014', 'jay', 'jay@gmail.com', 1)
RETURNING *;

select * from mahasiswa;

--soal2
INSERT INTO mahasiswa (nim, nama, ipk, email, id_prodi)
VALUES
('H071251015', 'eunha', 3.50, 'eunha@gmail.com', 1 ),
('H071251016', 'bhap', 3.40, 'eunha@gmail.com', 1 ),
('H071251017', 'jake', 3.50, 'eunha@gmail.com', 1 )
RETURNING *;

UPDATE mahasiswa
set ipk = 3.75
where ipk = 3.50;


delete from mahasiswa
where email is null;