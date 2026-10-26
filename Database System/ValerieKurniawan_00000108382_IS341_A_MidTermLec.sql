-- 1. Sub-CLO41-1
-- 1) Data Definition Language (DDL) 
-- CREATE - membuat struktur objek baru
CREATE TABLE student (
    Id VARCHAR (10),
    Nama TEXT,
    Umur INT (2)
);

-- ALTER - mengubah struktur yang sudah ada (mengubah tipe data)
ALTER TABLE student
MODIFY COLUMN Id INT;

-- DROP - menghapus objek seluruhnya
DROP TABLE student;

-- DROP - menghapus kolom tertentu saja
ALTER TABLE student
DROP COLUMN Umur;

-- 2)	Data Manipulation Language (DML) 
-- SELECT - mengambil data dari berbagai table
SELECT
stu.studentId,
stu.studentFirstName,
  	GROUP_CONCAT(c.courseName SEPARATOR ', ') AS courseName
FROM msstudent stu
JOIN courseplanning cp ON stu.studentId = cp.studentId
JOIN mscourse c ON cp.courseId = c.courseId
GROUP BY stu.studentId;

-- INSERT - memasukkan data ke dalam struktur
INSERT INTO msFaculty (facultyId, facultyName) VALUES
('FC099', 'Business'),
('FC088', 'Engineering and Informatics'),
('FC077', 'Communication'),
('FC066', 'Art and Design');

-- UPDATE - mengubah atau memperbaharui data yang telah ada
UPDATE msFaculty 
SET facultyName = 'Business and Management' 
WHERE facultyId = 'FC099';

-- DELETE - menghapus data
DELETE FROM msFaculty 
WHERE facultyId = 'FC077';

-- 3)	Controlled Access 
-- GRANT - memberikan hak akses pada pihak tertentu
GRANT SELECT ON student TO PUBLIC;

-- REVOKE - mencabut hak akses dari pihak tertentu
REVOKE SELECT ON student FROM PUBLIC;

-- 2. Sub-CLO43-4
-- b. List all students that take courses from the Information Systems (IS) Department Lecturer.
SELECT
    depart.departmentName,
    stu.studentFirstName
FROM msdepartment depart
JOIN mslecturer lec1 ON depart.departmentId = lec1.departmentId
JOIN schedule sch ON sch.lecturerId = lec1.lecturerId
JOIN mslecturer lec2 ON sch.lecturerId = lec2.lecturerId
JOIN courseplanning cp1 ON sch.courseId = cp1.courseId
JOIN msstudent stu ON stu.studentId = cp1.studentId
WHERE depart.departmentName = 'Information Systems'
GROUP BY stu.studentFirstName;
-- SELECT (mengambil) kolom departmentName dan studentFirstName untuk ditampilkan
-- FROM msdepartment (diambil dari table tersebut karena sebagai pusat untuk memfilter nama departemen)
-- JOIN mslecturer lec1 (ikut karena ingin menghubungkan departemen dengan dosen pengajar) ON depart.departmentId = lec1.departmentId
-- JOIN schedule (ikut karena ingin mengambil data jadwal kelas yang diajar oleh dosen) ON sch.lecturerId = lec1.lecturerId
-- JOIN mslecturer lec2 (ikut karena ingin menyelaraskan data dosen dengan schedule) ON sch.lecturerId = lec2.lecturerId
-- JOIN courseplanning cp1 (ikut karena ingin menghubungkan jadwal kelas dengan perencanaan course mahasiswa) ON sch.courseId = cp1.courseId
-- JOIN msstudent (ikut karena ingin mengambil data nama mahasiswa) ON stu.studentId = cp1.studentId
-- WHERE depart.departmentName = 'Information Systems' (memfilter hanya untuk departemen Information Systems)
-- GROUP BY stu.studentFirstName (berdasarkan nama mahasiswa agar tidak ada data yang duplikat)
-- Contoh: Bagian akademik ingin mengetahui daftar mahasiswa yang mengambil kelas dari dosen jurusan Sistem Informasi.


-- 2. Sub-CLO43-4
-- c. Update studentAddress, which contains JAKARTA into TANGERANG.
UPDATE msstudent
SET studentAddress = REPLACE(studentAddress, 'Jakarta', 'Tangerang')
WHERE studentAddress LIKE '%Jakarta%';
-- UPDATE msstudent (melakukan pembaruan data pada tabel msstudent)
-- SET studentAddress = REPLACE(...) (mengubah nilai pada kolom studentAddress)
-- REPLACE(studentAddress, 'Jakarta', 'Tangerang') (fungsi untuk menggantikan kata 'Jakarta' menjadi 'Tangerang' di dalam teks alamat)
-- WHERE studentAddress LIKE '%Jakarta%' (memfilter hanya baris data yang kolom studentAddress-nya mengandung kata 'Jakarta')
-- Contoh: Admin kampus ingin memperbarui data alamat mahasiswa yang sebelumnya berdomisili di Jakarta menjadi Tangerang.


-- 3. Sub-CLO41-5
-- Example of Object Privilege and System Privilege / Roles
GRANT UPDATE (grades) ON student TO Lecturer;
-- GRANT UPDATE (grades) ON student TO Lecturer (memberikan hak akses / Object Privilege khusus untuk mengupdate kolom 'grades' pada tabel 'student' kepada role 'Lecturer')

CREATE ROLE Lecturer;
GRANT INSERT, UPDATE, DELETE ON student TO Lecturer;
-- CREATE ROLE Lecturer (membuat role baru bernama 'Lecturer' sebagai bentuk System Privilege)
-- GRANT INSERT, UPDATE, DELETE ON student TO Lecturer (memberikan hak akses / Object Privilege untuk menambah, mengubah, dan menghapus data pada tabel 'student' kepada role 'Lecturer')
-- Contoh: DBA (Database Administrator) ingin mengatur hak akses dosen agar bisa mengelola nilai dan data mahasiswa tanpa memberikan akses penuh sebagai admin.


-- 4. Sub-CLO43-6
-- a. Produce a list that shows studentID, studentFirstName, and totalCredits for each student.
SELECT 
	stu.studentId,
	stu.studentFirstName, 
	SUM(c.courseCredits) AS TotalCredits
FROM courseplanning cp
JOIN msstudent stu ON cp.studentId = stu.studentId
JOIN mscourse c ON cp.courseId = c.courseId
GROUP BY stu.studentId;
-- SELECT (mengambil) kolom studentId, studentFirstName, dan menghitung total SKS
-- SUM(c.courseCredits) AS TotalCredits (menjumlahkan seluruh credit course yang diambil mahasiswa dan memberinya alias TotalCredits)
-- FROM courseplanning cp (diambil dari table tersebut karena sebagai pusat penghubung antara mahasiswa dan course)
-- JOIN msstudent stu (ikut karena ingin mengambil data ID dan nama mahasiswa) ON cp.studentId = stu.studentId
-- JOIN mscourse c (ikut karena ingin mengambil data jumlah credit course) ON cp.courseId = c.courseId
-- GROUP BY stu.studentId (berdasarkan ID mahasiswa agar perhitungan total SKS dilakukan per masing-masing mahasiswa)
-- Contoh: Kaprodi ingin mengetahui rekapitulasi total SKS yang telah diambil oleh setiap mahasiswa.


-- 4. Sub-CLO43-6
-- b. Produce a list that shows every class that is taught by the lecturer and the department of the lecturer (courseID, courseName, lecturerName, departmentName) 
SELECT
c.courseId,
c.courseName,
CONCAT(lec.lecturerFirstName, ' ', lec.lecturerLastName) AS lecturerName, 
	depart.departmentName
FROM mscourse c
JOIN schedule sch ON c.courseId = sch.courseId
JOIN mslecturer lec ON sch.lecturerId = lec.lecturerId
JOIN msdepartment depart ON lec.departmentId = depart.departmentId
GROUP BY c.courseId;
-- SELECT (mengambil) kolom courseId, courseName, nama lengkap dosen, dan nama departemen
-- CONCAT(lec.lecturerFirstName, ' ', lec.lecturerLastName) AS lecturerName (menggabungkan firstName dan lastName dosen menjadi satu kolom lecturerName)
-- FROM mscourse c (diambil dari table tersebut karena sebagai pusat data course/kelas)
-- JOIN schedule sch (ikut karena ingin menghubungkan course dengan jadwal pengajaran) ON c.courseId = sch.courseId
-- JOIN mslecturer lec (ikut karena ingin mengambil data dosen pengajar) ON sch.lecturerId = lec.lecturerId
-- JOIN msdepartment depart (ikut karena ingin mengambil data departemen asal dosen) ON lec.departmentId = depart.departmentId
-- GROUP BY c.courseId (berdasarkan ID course agar tidak ada data kelas yang duplikat)
-- Contoh: Dekanat ingin melihat daftar seluruh kelas yang dibuka, beserta dosen pengampu dan departemen asal dosen tersebut.


-- 4. Sub-CLO43-6
-- c. Produce a list showing the number of lecturers (in every department) that have classes. 
SELECT 
depart.departmentName AS departmentName, 
COUNT(lec.lecturerId) AS totalLecturer 
FROM mslecturer lec 
JOIN msdepartment depart ON lec.departmentId = depart.departmentId 
GROUP BY depart.departmentName;
-- SELECT (mengambil) nama departemen dan menghitung jumlah dosen
-- COUNT(lec.lecturerId) AS totalLecturer (menghitung jumlah ID dosen dan memberinya alias totalLecturer)
-- FROM mslecturer lec (diambil dari table tersebut karena sebagai pusat data dosen)
-- JOIN msdepartment depart (ikut karena ingin mengambil nama departemen asal dosen) ON lec.departmentId = depart.departmentId
-- GROUP BY depart.departmentName (berdasarkan nama departemen agar perhitungan jumlah dosen dikelompokkan per departemen)
-- Contoh: HRD atau Manajemen universitas ingin mengetahui berapa banyak dosen yang mengajar di masing-masing departemen/jurusan.
