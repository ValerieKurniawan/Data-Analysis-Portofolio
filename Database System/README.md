Proyek SQL untuk membangun database akademik sederhana dan menghasilkan ringkasan informasi mahasiswa, mata kuliah, dosen, serta SKS. Proyek ini disusun dari tugas Database Systems dan Midterm Lab.
Problem
- Informasi mahasiswa, mata kuliah, dosen, departemen, dan fakultas berada pada tabel berbeda sehingga perlu dihubungkan untuk menjawab pertanyaan.
- Relasi antartabel perlu didefinisikan agar data terkait dapat dihubungkan secara konsisten.
- Informasi mentah belum langsung menjawab kebutuhan seperti daftar mata kuliah per mahasiswa, jumlah mahasiswa per kelas, total SKS, dan jumlah dosen per departemen.
Tools
- MySQL — membuat struktur database, mengelola data, dan menjalankan query.
- XAMPP / phpMyAdmin — lingkungan lokal untuk menjalankan MySQL dan menguji query.
What I Did
- Membuat database dan tabel untuk fakultas, departemen, dosen, mata kuliah, mahasiswa, jadwal, dan rencana mata kuliah.
- Menentukan primary key dan foreign key untuk menghubungkan tabel serta menjaga integritas referensial.
- Memasukkan data contoh menggunakan INSERT.
- Menggabungkan tabel menggunakan JOIN untuk menyatukan informasi mahasiswa, mata kuliah, dosen, dan departemen.
- Menggabungkan beberapa nama mata kuliah atau mahasiswa dalam satu kolom menggunakan GROUP_CONCAT agar hasil lebih ringkas.
- Menghitung jumlah mahasiswa, jumlah dosen, dan total SKS dengan fungsi agregasi.
- Mengurutkan dan mengambil hasil tertentu, seperti mahasiswa dengan SKS tertinggi atau kelas dengan mahasiswa paling sedikit.
- Menyertakan contoh pembaruan alamat dengan UPDATE, REPLACE, dan LIKE, serta contoh pengaturan akses menggunakan GRANT, REVOKE, dan CREATE ROLE.
- Catatan ruang lingkup: dokumen tugas tidak menunjukkan proses penanganan missing value, deduplikasi, normalisasi data melalui proses pembersihan, atau penggunaan Excel/VLOOKUP; hal tersebut tidak diklaim sebagai pekerjaan dalam proyek ini.
SQL Skills
- Database & schema: CREATE DATABASE, CREATE TABLE
- Relasi dan integritas: PRIMARY KEY, FOREIGN KEY
- Manipulasi data: INSERT, UPDATE, REPLACE
- Penggabungan tabel: JOIN (INNER JOIN, LEFT JOIN)
- Agregasi: COUNT(), SUM(), GROUP_CONCAT()
- Pengolahan teks: CONCAT(), LIKE
- Pengelompokan dan penyaringan hasil: GROUP BY, ORDER BY, LIMIT, DISTINCT
- Keamanan database (contoh): CREATE ROLE, GRANT, REVOKE
Insights & Benefits
Query dalam proyek ini dapat digunakan untuk:
- Melihat mata kuliah yang diambil setiap mahasiswa.
- Mengetahui jumlah mahasiswa pada setiap mata kuliah.
- Menghitung total SKS tiap mahasiswa dan mengidentifikasi mahasiswa dengan SKS tertinggi.
- Mengetahui jumlah dosen per departemen.
- Menampilkan dosen pengampu dan departemennya untuk tiap mata kuliah.
- Menyediakan ringkasan yang lebih mudah dibaca sebagai dasar pemantauan aktivitas akademik dan perencanaan kelas.
