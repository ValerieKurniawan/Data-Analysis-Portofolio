-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2025 at 12:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_00000108382`
--

-- --------------------------------------------------------

--
-- Table structure for table `courseplanning`
--

CREATE TABLE `courseplanning` (
  `courseId` varchar(10) NOT NULL,
  `studentId` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courseplanning`
--

INSERT INTO `courseplanning` (`courseId`, `studentId`) VALUES
('CS001', '00000054321'),
('CS002', '00000045632'),
('CS003', '00000045632'),
('CS004', '00000012453'),
('CS005', '00000012453'),
('CS006', '00000054321'),
('CS001', '00000088772'),
('CS002', '00000021653'),
('CS003', '00000021653'),
('CS004', '00000077881'),
('CS005', '00000077881'),
('CS006', '00000088772'),
('CS006', '00000077881'),
('CS002', '00000078781'),
('CS003', '00000078781'),
('CS004', '00000087872'),
('CS005', '00000087872'),
('CS002', '00000087872'),
('CS003', '00000087872'),
('CS004', '00000021788'),
('CS005', '00000021788');

-- --------------------------------------------------------

--
-- Table structure for table `mscourse`
--

CREATE TABLE `mscourse` (
  `courseId` varchar(10) NOT NULL,
  `courseName` text NOT NULL,
  `courseCredits` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mscourse`
--

INSERT INTO `mscourse` (`courseId`, `courseName`, `courseCredits`) VALUES
('CS001', 'User Experience', 3),
('CS002', 'Database Systems', 2),
('CS003', 'Datawarehouse', 2),
('CS004', 'Data Analysis', 3),
('CS005', 'Data Modelling', 2),
('CS006', 'Applied ERP', 3);

-- --------------------------------------------------------

--
-- Table structure for table `msdepartment`
--

CREATE TABLE `msdepartment` (
  `departmentId` varchar(10) NOT NULL,
  `departmentName` text NOT NULL,
  `facultyId` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `msdepartment`
--

INSERT INTO `msdepartment` (`departmentId`, `departmentName`, `facultyId`) VALUES
('DPT011', 'Information Systems', 'FC088'),
('DPT012', 'Computer Engineering', 'FC088'),
('DPT013', 'Informatics', 'FC088');

-- --------------------------------------------------------

--
-- Table structure for table `msfaculty`
--

CREATE TABLE `msfaculty` (
  `facultyId` varchar(10) NOT NULL,
  `facultyName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `msfaculty`
--

INSERT INTO `msfaculty` (`facultyId`, `facultyName`) VALUES
('FC066', 'Art and Design'),
('FC077', 'Communication'),
('FC088', 'Engineering and Informatics'),
('FC099', 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `mslecturer`
--

CREATE TABLE `mslecturer` (
  `lecturerId` varchar(15) NOT NULL,
  `lecturerFirstName` text NOT NULL,
  `lecturerLastName` text NOT NULL,
  `departmentId` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mslecturer`
--

INSERT INTO `mslecturer` (`lecturerId`, `lecturerFirstName`, `lecturerLastName`, `departmentId`) VALUES
('051321', 'Melissa', 'Vianty', 'DPT013'),
('074888', 'Rudy', 'Cutomo', 'DPT011'),
('075881', 'Samuel', 'Adys', 'DPT011'),
('085123', 'Monica', 'Evelyn', 'DPT012');

-- --------------------------------------------------------

--
-- Table structure for table `msstudent`
--

CREATE TABLE `msstudent` (
  `studentId` varchar(15) NOT NULL,
  `studentFirstName` text NOT NULL,
  `studentLastName` text NOT NULL,
  `studentGender` text NOT NULL,
  `studentAddress` varchar(35) NOT NULL,
  `studentPhone` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `msstudent`
--

INSERT INTO `msstudent` (`studentId`, `studentFirstName`, `studentLastName`, `studentGender`, `studentAddress`, `studentPhone`) VALUES
('00000012453', 'Lionel', 'Messi', 'Male', '21 Mawar Tangerang', 856789988),
('00000021653', 'Muhammad', 'Rizky', 'Male', '19 Lily Tangerang', 812789988),
('00000021788', 'Lyndsey', 'Brielle', 'Female', '14 Anyelir Bekasi', 835985655),
('00000045632', 'Melati', 'Mawar', 'Female', '22 Cendana Surabaya', 856778899),
('00000054321', 'Michael', 'Elsevier', 'Male', '08 Cempaka Bandung', 812778899),
('00000077881', 'Gabriel', 'Marcell', 'Male', '34 Melati Bandung', 813779099),
('00000078781', 'Eifel', 'Misael', 'Male', '09 Anggrek Bandung', 857700878),
('00000078899', 'Darrel', 'Axel', 'Male', '98 Padma Surabaya', 831670899),
('00000087872', 'Raymond', 'Sunardi', 'Male', '10 Lavender Bogor', 897887795),
('00000088772', 'Merry', 'Christmas', 'Female', '06 Tulip Bandung', 813990077);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `courseId` varchar(10) NOT NULL,
  `lecturerId` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`courseId`, `lecturerId`) VALUES
('CS001', '074888'),
('CS002', '075881'),
('CS003', '075881'),
('CS004', '085123'),
('CS005', '051321'),
('CS006', '074888');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courseplanning`
--
ALTER TABLE `courseplanning`
  ADD KEY `courseId` (`courseId`),
  ADD KEY `studentId` (`studentId`);

--
-- Indexes for table `mscourse`
--
ALTER TABLE `mscourse`
  ADD PRIMARY KEY (`courseId`);

--
-- Indexes for table `msdepartment`
--
ALTER TABLE `msdepartment`
  ADD PRIMARY KEY (`departmentId`),
  ADD KEY `facultyId` (`facultyId`);

--
-- Indexes for table `msfaculty`
--
ALTER TABLE `msfaculty`
  ADD PRIMARY KEY (`facultyId`);

--
-- Indexes for table `mslecturer`
--
ALTER TABLE `mslecturer`
  ADD PRIMARY KEY (`lecturerId`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `msstudent`
--
ALTER TABLE `msstudent`
  ADD PRIMARY KEY (`studentId`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD KEY `courseId` (`courseId`),
  ADD KEY `lecturerId` (`lecturerId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courseplanning`
--
ALTER TABLE `courseplanning`
  ADD CONSTRAINT `courseplanning_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `mscourse` (`courseId`),
  ADD CONSTRAINT `courseplanning_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `msstudent` (`studentId`);

--
-- Constraints for table `msdepartment`
--
ALTER TABLE `msdepartment`
  ADD CONSTRAINT `msdepartment_ibfk_1` FOREIGN KEY (`facultyId`) REFERENCES `msfaculty` (`facultyId`);

--
-- Constraints for table `mslecturer`
--
ALTER TABLE `mslecturer`
  ADD CONSTRAINT `mslecturer_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `msdepartment` (`departmentId`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`courseId`) REFERENCES `mscourse` (`courseId`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`lecturerId`) REFERENCES `mslecturer` (`lecturerId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--2. Sub-CLO43-4
-- Data Manipulation Language (DML)
-- b.	Query: Show the student's name and the courses they take. (Field to show: studentId, studentFirstName, courseName)
SELECT 
stu.studentId,
stu.studentFirstName,
c.courseName
FROM msstudent stu
JOIN courseplanning cp ON stu.studentId = cp.studentId
JOIN mscourse c ON cp.courseId = c.courseId;

-- atau
SELECT
stu.studentId,
stu.studentFirstName,
GROUP_CONCAT(c.courseName SEPARATOR ', ') AS courseName
FROM msstudent stu
JOIN courseplanning cp ON stu.studentId = cp.studentId
JOIN mscourse c ON cp.courseId = c.courseId
GROUP BY stu.studentId;


-- c.	Query: Show all students that attend Mr. Samuel Adys class (Field to show LectureName, StudentName)
SELECT 
CONCAT(lec.lecturerFirstName, ' ', lec.lecturerLastName) AS LecturerName,
GROUP_CONCAT(CONCAT(stu.studentFirstName, ' ', stu.studentLastName) SEPARATOR ', ') AS studentName
FROM schedule sch
JOIN mslecturer lec ON sch.lecturerId = lec.lecturerId
JOIN courseplanning cp ON sch.courseId = cp.courseId
JOIN msstudent stu ON cp.studentId = stu.studentId
WHERE lec.lecturerId = 075881
GROUP BY lec.lecturerId;


-- 3.	Sub-CLO43-6
-- a. Query: How many students for each course? (lecturerFirstName, courseName, totalStudents) 
SELECT 
l.lecturerFirstName, 
c.courseName,
COUNT(cp.studentId) AS TotalStudent
FROM courseplanning cp
JOIN schedule sch ON cp.courseId = sch.courseId
JOIN mslecturer l ON sch.lecturerId = l.lecturerId
JOIN mscourse c ON cp.courseId = c.courseId
GROUP BY cp.courseId;
-- SELECT (mengambil) beberapa kolom untuk ditampilkan mulai dari 
-- - table msLecturer, kolom lecturerFirstName
-- - table msCourse, kolom courseName
-- - table coursePlanning, kolom studenId untuk menghitung (COUNT) seberapa banyak murid yang ada
-- FROM coursePlanning (diambil dari table tersebut karena pusatnya dari situ)
-- JOIN (ikut karena ingin mengambil kolom dari table lain) jadi JOIN (kelas) (variable) ON (varibable table A) disamakan dengan (variable table B) yang bertujuan untuk menyelaraskan
-- GROUP BY / berdasarkan, jadi perhitungan jumlah murid pada tiap kelas
-- Contoh: Kaprodi ingin mengetahui persebaran mahasiswa UMN di setiap kelas serta dosen yang berwenang dalam pengajaran


-- b.	Query: How many credits are taken for each student? (studentName, totalCredits) 
SELECT 
CONCAT(stu.studentFirstName, ' ', stu.studentLastName) AS studentName, 
SUM(c.courseCredits) AS TotalCredits
FROM courseplanning cp
JOIN msstudent stu ON cp.studentId = stu.studentId
JOIN mscourse c ON cp.courseId = c.courseId
GROUP BY stu.studentId;
-- SELECT (mengambil) beberapa kolom untuk ditampilkan mulai dari 
-- - table msStudent, kolom studentFirstName dan studentLastName dengan menggunakan function CONCAT untuk penggabungan antar kolom dengan spasi ' '
-- - table msCourse, kolom courseCredits untuk menjumlahkan (SUM) sks
-- FROM coursePlanning (diambil dari table tersebut karena pusatnya dari situ)
-- JOIN (ikut karena ingin mengambil kolom dari table lain) jadi JOIN (kelas) (variable) ON (varibable table A) disamakan dengan (variable table B) yang bertujuan untuk menyelaraskan
-- GROUP BY / berdasarkan, jadi penjumlahan sks pada setiap mahasiswa id
-- Contoh: pihak UMN ingin mengecek para mahasiswa UMN telah mengambil seberapa banyak sks selama masa perkuliahannya sebagai syarat kelulusan


-- c.	Query: How many lecturers per department? (departmentName, totalLecturer) 
SELECT 
depart.departmentName, 
COUNT(lec.lecturerId) AS totalLecturer 
FROM mslecturer lec 
JOIN msdepartment depart ON lec.departmentId = depart.departmentId 
GROUP BY depart.departmentName;
-- SELECT (mengambil) beberapa kolom untuk ditampilkan mulai dari 
-- - table msDepartment, kolom departmentName
-- - table msLecturer, kolom lecturerId untuk menghitung (COUNT) seberapa banyak dosen yang ada
-- FROM msLecturer (diambil dari table tersebut karena pusatnya dari situ)
-- JOIN (ikut karena ingin mengambil kolom dari table lain) jadi JOIN (kelas) (variable) ON (varibable table A) disamakan dengan (variable table B) yang bertujuan untuk menyelaraskan
-- GROUP BY / berdasarkan, jadi perhitungan jumlah dosen pada tiap department
-- Contoh: Kaprodi ingin mengetahui jumlah dosen yang mengajar di setiap deparmentnya

-- d.	Query: Which student has the most credits? (studentName, totalCredits) 
SELECT 
CONCAT(stu.studentFirstName, ' ', stu.studentLastName) AS studentName, 
SUM(c.courseCredits) AS TotalCredits
FROM courseplanning cp
JOIN msstudent stu ON cp.studentId = stu.studentId
JOIN mscourse c ON cp.courseId = c.courseId
GROUP BY stu.studentId
ORDER BY TotalCredits DESC LIMIT 1;
-- sama seperi nomor 3b, namun kali ini sedikit berbeda pada bagian
-- ORDER BY (disusunkan) berdasarkan totalCredit DESC (menurun) jadi dari terbanyak menuju terdikit dengan LIMIT (dibatasi) 1 
-- Contoh: pihak UMN ingin mengetahui mahasiswa yang PALING banyak ambil sks

-- e.	Query: Which lecturer has the fewer students attending their class? (lecturerFirstName, totalStudents)
SELECT
l.lecturerFirstName, 
COUNT(cp.studentId) AS TotalStudent
FROM courseplanning cp
JOIN schedule sch ON cp.courseId = sch.courseId
JOIN mslecturer l ON sch.lecturerId = l.lecturerId
JOIN mscourse c ON cp.courseId = c.courseId
GROUP BY l.lecturerId
ORDER BY TotalStudent ASC; 
-- sama seperi nomor 3d, namun kali ini sedikit berbeda pada bagian
-- ORDER BY (disusunkan) berdasarkan totalStudent ASC (naik) jadi dari terdikit menuju terbanyak 
-- Contoh: kaprodi ingin mengetahui mahasiswa UMN yang PALING sedikit di setiap kelasnya beserta dosen pengajarnya
