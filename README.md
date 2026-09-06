# LAB-BASDAT-06-2026

Repository pengumpulan tugas Praktikum Basis Data.

Repository ini digunakan untuk mengumpulkan hasil live coding dan tugas praktikum selama kegiatan Praktikum Basis Data. Setiap praktikan wajib mengikuti struktur repository dan prosedur pengumpulan yang telah ditentukan.

## Informasi Praktikum

| Informasi | Keterangan |
|---|---|
| Mata Kuliah | Basis Data |
| Kegiatan | Praktikum Basis Data |
| Tahun | 2026 |
| Repository | LAB-BASDAT-06-2026 |
| Asisten | Ahmad Rafly |
| Praktikan | Basdat-06 |

---

## Aturan Pengumpulan

Setiap praktikan wajib melakukan pengumpulan tugas melalui repository hasil fork masing-masing dan membuat Pull Request ke repository utama.

Urutan pengumpulan:

1. Fork repository.
2. Clone repository hasil fork ke komputer.
3. Masuk ke folder repository hasil clone.
4. Membuat branch menggunakan NIM.
5. Membuat folder tugas sesuai nomor pertemuan.
6. Menambahkan hasil live coding atau tugas ke dalam folder tersebut.
7. Melakukan `git add`.
8. Melakukan `git commit`.
9. Melakukan `git push`.
10. Membuat Pull Request ke repository utama.

---

## 1. Fork Repository

Lakukan fork terhadap repository utama ini menggunakan akun GitHub masing-masing.

Setelah melakukan fork, setiap praktikan akan memiliki repository sendiri.

Contoh:

Repository utama:

```text
https://github.com/[USERNAME-ASISTEN]/Lab-Basdat-06-2026
```

Repository hasil fork:

```text
https://github.com/[USERNAME-KALIAN]/Lab-Basdat-06-2026
```

Pastikan repository yang digunakan untuk mengerjakan tugas adalah repository hasil fork milik masing-masing.

---

## 2. Clone Repository

Setelah melakukan fork, buka repository hasil fork.

Pilih:

```text
Code → HTTPS → Copy URL
```

Kemudian buka Terminal, Git Bash, atau Command Prompt dan jalankan:

```bash
git clone https://github.com/[USERNAME-KALIAN]/Lab-Basdat-06-2026.git
```

Setelah proses clone selesai, masuk ke folder repository:

```bash
cd Lab-Basdat-06-2026
```

---

## 3. Membuat Branch

Setiap praktikan wajib menggunakan branch dengan nama NIM masing-masing.

Contoh NIM:

```text
H071231072
```

Buat branch dengan perintah:

```bash
git checkout -b H071231072
```

Untuk memastikan branch yang sedang digunakan, jalankan:

```bash
git branch
```

Contoh:

```text
* H071231072
  main
```

Tanda `*` menunjukkan branch yang sedang aktif.

### Ketentuan Branch

Nama branch wajib menggunakan NIM masing-masing.

Contoh:

```text
H071231072
H071231073
H071231074
```

Jangan menggunakan nama branch seperti:

```text
tugas
praktikum
testing
branch-baru
tugas1
```

Seluruh tugas praktikan harus dikerjakan dan disimpan pada branch NIM masing-masing.

Jangan mengerjakan tugas pada branch `main`.

---

## 4. Struktur Folder Tugas

Setiap tugas harus dikelompokkan berdasarkan nomor pertemuan.

Gunakan format:

```text
tugas-pertemuan-[nomor]
```

Contoh:

```text
tugas-pertemuan-1
tugas-pertemuan-2
tugas-pertemuan-3
```

Contoh struktur repository:

```text
Lab-Basdat-06-2026/
│
├── tugas-pertemuan-1/
│   ├── live-coding-1/
│   ├── live-coding-2/
│   └── tugas-1/
│
├── tugas-pertemuan-2/
│   ├── live-coding-1/
│   └── tugas-1/
│
└── tugas-pertemuan-3/
    └── tugas-1/
```

Nama dan struktur folder di dalam `tugas-pertemuan-[nomor]` dapat disesuaikan dengan instruksi yang diberikan oleh asisten pada masing-masing pertemuan.

---

## 5. Menambahkan Hasil Tugas

Masukkan seluruh hasil live coding atau tugas yang diminta ke dalam folder pertemuan yang sesuai.

Contoh:

```text
tugas-pertemuan-1/
│
├── live-coding-1/
│   └── tugas.sql
│
├── live-coding-2/
│   └── tugas.sql
│
└── tugas-1/
    └── tugas.sql
```

Pastikan file yang dikumpulkan merupakan file hasil pengerjaan sendiri dan sesuai dengan instruksi tugas.

---

## 6. Memeriksa Perubahan

Setelah selesai mengerjakan tugas, periksa perubahan menggunakan:

```bash
git status
```

Perintah tersebut digunakan untuk melihat file yang mengalami perubahan atau file baru yang belum ditambahkan ke Git.

Pastikan seluruh file yang ingin dikumpulkan sudah berada di dalam repository.

---

## 7. Menambahkan File ke Git

Untuk menambahkan seluruh perubahan, jalankan:

```bash
git add .
```

Kemudian periksa kembali:

```bash
git status
```

Pastikan file yang akan dikumpulkan sudah muncul sebagai perubahan yang siap di-commit.

---

## 8. Commit

Setelah file ditambahkan, lakukan commit.

Gunakan pesan commit yang menjelaskan perubahan yang dilakukan.

Contoh:

```bash
git commit -m "menambahkan tugas praktikum pertemuan 1"
```

Contoh lainnya:

```bash
git commit -m "menambahkan hasil live coding pertemuan 1"
```


Gunakan commit message yang informatif dan sesuai dengan perubahan yang dilakukan.

Hindari commit message seperti:

```text
tugas
fix
update
coba
test
```

---

## 9. Push ke GitHub

Setelah melakukan commit, push branch NIM ke repository hasil fork.

Gunakan:

```bash
git push origin [NIM]
```

Contoh:

```bash
git push origin H071231072
```

Setelah berhasil melakukan push, buka repository hasil fork di GitHub dan pastikan file tugas serta branch NIM sudah tersedia.

---

## 10. Pull Request

Setelah tugas berhasil di-push ke GitHub, buat Pull Request ke repository utama.

Pastikan konfigurasi Pull Request adalah:

```text
Base repository : [USERNAME-ASISTEN]/Lab-Basdat-06-2026
Base branch     : main

Head repository : [USERNAME-KALIAN]/Lab-Basdat-06-2026
Compare branch  : [NIM]
```

Contoh:

```text
Base:
[USERNAME-ASISTEN]/Lab-Basdat-06-2026
main

Compare:
[USERNAME-KALIAN]/Lab-Basdat-06-2026
H071231072
```

Pastikan Pull Request ditujukan ke repository utama praktikum, bukan ke repository praktikan lain.

---

## 11. Format Judul Pull Request

Gunakan format:

```text
[NIM] Pengumpulan Tugas Pertemuan [Nomor]
```

Contoh:

```text
[H071231072] Pengumpulan Tugas Pertemuan 1
```

Jika terdapat beberapa tugas dalam satu pertemuan, seluruh tugas tersebut dapat dikumpulkan dalam satu Pull Request sesuai dengan instruksi asisten.

---

## 12. Format Deskripsi Pull Request

Gunakan format berikut:

```markdown
## Informasi Praktikan

Nama       : [Nama Lengkap]
NIM        : [NIM]
Kelas      : [Kelas]
Pertemuan  : [Nomor Pertemuan]

## Tugas yang Dikumpulkan

- [x] Live Coding 1
- [x] Live Coding 2
- [x] Tugas 1
- [x] Tugas 2

## Catatan

[Tuliskan catatan jika terdapat kendala atau informasi tambahan]
```

Contoh:

```markdown
## Informasi Praktikan

Nama       : Ahmad Rafly Putra Hasrun
NIM        : H071231072
Kelas      : A
Pertemuan  : 1

## Tugas yang Dikumpulkan

- [x] Live Coding 1
- [x] Live Coding 2
- [x] Tugas 1

## Catatan

Tidak ada.
```

---

## 13. Pemeriksaan Tugas

Setelah Pull Request dibuat, asisten akan melakukan pemeriksaan terhadap tugas yang dikumpulkan.

Pemeriksaan dapat mencakup:

- Kelengkapan tugas.
- Kesesuaian struktur folder.
- Kesesuaian hasil pengerjaan dengan instruksi.
- Kebenaran kode atau query.
- Riwayat commit.
- Waktu pengumpulan.
- Ketentuan lain yang diberikan pada masing-masing pertemuan.

Jika terdapat kesalahan atau tugas perlu diperbaiki, asisten dapat memberikan komentar pada Pull Request.

Praktikan wajib memperhatikan komentar atau instruksi perbaikan yang diberikan oleh asisten.

---

## 14. Ketentuan Commit

Praktikan diperbolehkan melakukan beberapa commit selama proses pengerjaan tugas.

Contoh:

```bash
git add .
git commit -m "menambahkan live coding 1"
git push origin H071231072
```

Kemudian setelah tugas berikutnya selesai:

```bash
git add .
git commit -m "menambahkan live coding 2"
git push origin H071231072
```

Riwayat commit harus menggambarkan proses pengerjaan secara wajar dan dapat ditelusuri.

Jangan melakukan commit hanya untuk membuat jumlah commit terlihat banyak.

---

## 15. Ketentuan Pengumpulan Live Coding

Hasil live coding yang diberikan selama praktikum wajib dikumpulkan sesuai dengan instruksi pada pertemuan tersebut.

Pastikan:

1. File yang dikumpulkan sesuai dengan tugas.
2. File berada pada folder pertemuan yang benar.
3. Branch yang digunakan adalah branch NIM.
4. Perubahan sudah di-commit.
5. Perubahan sudah di-push ke GitHub.
6. Pull Request sudah dibuat jika diwajibkan.
7. Pengumpulan dilakukan sesuai batas waktu yang ditentukan.

Ketentuan khusus mengenai batas waktu, format file, dan jenis tugas akan disampaikan oleh asisten pada masing-masing pertemuan.

---

## 16. File yang Tidak Perlu Dikumpulkan

Jangan memasukkan file yang tidak diperlukan ke dalam repository.

Hindari mengunggah:

```text
.env
password
API key
credentials
file sementara
file hasil konfigurasi pribadi
```

Selain itu, jangan mengunggah folder atau file berukuran besar yang tidak diperlukan untuk tugas.

Jika menggunakan tools atau framework tertentu, gunakan `.gitignore` yang sesuai.

---

## 17. Kesalahan yang Sering Terjadi

### Branch tidak sesuai

Periksa branch menggunakan:

```bash
git branch
```

Pastikan branch yang aktif adalah NIM kalian.

Contoh:

```text
* H071231072
```

### Lupa melakukan git add

Jalankan:

```bash
git add .
```

### Lupa melakukan commit

Jalankan:

```bash
git commit -m "menambahkan tugas praktikum"
```

### Lupa melakukan push

Jalankan:

```bash
git push origin H071231072
```

### File belum muncul di GitHub

Pastikan:

1. File sudah berada di dalam repository.
2. Sudah menjalankan `git add`.
3. Sudah melakukan `git commit`.
4. Sudah melakukan `git push`.
5. Branch yang dibuka di GitHub adalah branch NIM.

### Pull Request mengarah ke repository yang salah

Pastikan Pull Request diarahkan ke:

```text
[USERNAME-ASISTEN]/Lab-Basdat-06-2026
```

dengan base branch:

```text
main
```

---

## 18. Ringkasan Perintah Git

Berikut adalah rangkaian perintah utama yang digunakan dalam pengumpulan tugas:

```bash
# Clone repository
git clone https://github.com/[USERNAME-KALIAN]/Lab-Basdat-06-2026.git

# Masuk ke folder repository
cd Lab-Basdat-06-2026

# Membuat branch berdasarkan NIM
git checkout -b [NIM]

# Memeriksa perubahan
git status

# Menambahkan perubahan
git add .

# Melakukan commit
git commit -m "menambahkan tugas praktikum"

# Push ke GitHub
git push origin [NIM]
```

Contoh:

```bash
git clone https://github.com/username/Lab-Basdat-06-2026.git

cd Lab-Basdat-06-2026

git checkout -b H071231072

git status

git add .

git commit -m "menambahkan tugas praktikum pertemuan 1"

git push origin H071231072
```

Setelah itu, buka GitHub dan buat Pull Request ke repository utama.

---

## 19. Checklist Sebelum Mengumpulkan

Sebelum membuat Pull Request, pastikan seluruh poin berikut sudah terpenuhi:

- [ ] Sudah melakukan Fork repository.
- [ ] Sudah melakukan Clone repository.
- [ ] Sudah membuat branch menggunakan NIM.
- [ ] Sudah mengerjakan tugas.
- [ ] Struktur folder sudah sesuai.
- [ ] File tugas sudah berada pada folder pertemuan yang benar.
- [ ] Sudah menjalankan `git add`.
- [ ] Sudah melakukan `git commit`.
- [ ] Sudah melakukan `git push`.
- [ ] File tugas sudah terlihat pada GitHub.
- [ ] Pull Request sudah diarahkan ke repository utama.
- [ ] Judul Pull Request sudah sesuai format.
- [ ] Nama, NIM, kelas, dan pertemuan sudah dicantumkan.
- [ ] Seluruh tugas yang diminta sudah dikumpulkan.

---

## 20. Struktur Repository yang Diharapkan

Contoh apabila NIM praktikan adalah `H071231072`:

```text
Branch:
H071231072

Repository:
Lab-Basdat-06-2026/
│
├── tugas-pertemuan-1/
│   ├── live-coding-1/
│   │   └── tugas.sql
│   │
│   ├── live-coding-2/
│   │   └── tugas.sql
│   │
│   └── tugas-1/
│       └── tugas.sql
│
└── tugas-pertemuan-2/
    └── ...
```

Pull Request:

```text
[H071231072] Pengumpulan Tugas Pertemuan 1
```

---

## Catatan Penting

Repository ini merupakan repository utama praktikum. Jangan melakukan perubahan langsung pada branch `main`.

Setiap praktikan wajib menggunakan branch dengan NIM masing-masing dan melakukan pengumpulan melalui prosedur yang telah ditentukan.

Jika mengalami kendala dalam penggunaan Git atau GitHub, segera hubungi asisten praktikum.

---

## Penutup
Selamat mengerjakan Praktikum Basis Data.
