-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Jul 2025 pada 02.30
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendacemanagement`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `attendance`
--

CREATE TABLE `attendance` (
  `id_attendance` int(11) NOT NULL,
  `id_class` int(11) NOT NULL,
  `id_student` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('present','permission','absent') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `attendance`
--

INSERT INTO `attendance` (`id_attendance`, `id_class`, `id_student`, `date`, `status`) VALUES
(1, 7, 106, '2025-04-21', 'present'),
(2, 7, 107, '2025-04-21', 'present'),
(3, 7, 108, '2025-04-21', 'present'),
(4, 7, 109, '2025-04-21', 'present'),
(5, 7, 110, '2025-04-21', 'permission'),
(6, 7, 111, '2025-04-21', 'permission'),
(7, 7, 112, '2025-04-21', 'present'),
(8, 7, 113, '2025-04-21', 'absent'),
(9, 7, 114, '2025-04-21', 'present'),
(10, 7, 115, '2025-04-21', 'permission'),
(11, 7, 116, '2025-04-21', 'permission'),
(12, 7, 117, '2025-04-21', 'present'),
(13, 7, 118, '2025-04-21', 'present'),
(14, 7, 119, '2025-04-21', 'present'),
(15, 7, 120, '2025-04-21', 'present'),
(16, 7, 106, '2025-07-22', 'permission'),
(17, 7, 107, '2025-07-22', 'present'),
(18, 7, 108, '2025-07-22', 'present'),
(19, 7, 109, '2025-07-22', 'present'),
(20, 7, 110, '2025-07-22', 'absent'),
(21, 7, 111, '2025-07-22', 'absent'),
(22, 7, 112, '2025-07-22', 'permission'),
(23, 7, 113, '2025-07-22', 'present'),
(24, 7, 114, '2025-07-22', 'present'),
(25, 7, 115, '2025-07-22', 'present'),
(26, 7, 116, '2025-07-22', 'permission'),
(27, 7, 117, '2025-07-22', 'absent'),
(28, 7, 118, '2025-07-22', 'permission'),
(29, 7, 119, '2025-07-22', 'present'),
(30, 7, 120, '2025-07-22', 'present'),
(31, 7, 106, '2025-07-23', 'present'),
(32, 7, 107, '2025-07-23', 'present'),
(33, 7, 108, '2025-07-23', 'present'),
(34, 7, 109, '2025-07-23', 'present'),
(35, 7, 110, '2025-07-23', 'present'),
(36, 7, 111, '2025-07-23', 'present'),
(37, 7, 112, '2025-07-23', 'present'),
(38, 7, 113, '2025-07-23', 'present'),
(39, 7, 114, '2025-07-23', 'present'),
(40, 7, 115, '2025-07-23', 'present'),
(41, 7, 116, '2025-07-23', 'present'),
(42, 7, 117, '2025-07-23', 'present'),
(43, 7, 118, '2025-07-23', 'present'),
(44, 7, 119, '2025-07-23', 'present'),
(45, 7, 120, '2025-07-23', 'present');

-- --------------------------------------------------------

--
-- Struktur dari tabel `class`
--

CREATE TABLE `class` (
  `id_class` int(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `id_lecturer` int(255) NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `time_start` time NOT NULL,
  `time_end` time NOT NULL,
  `room` varchar(255) NOT NULL,
  `semester` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `class`
--

INSERT INTO `class` (`id_class`, `class_name`, `id_lecturer`, `day`, `time_start`, `time_end`, `room`, `semester`) VALUES
(5, 'Pemodelan Perangkat Lunak', 7, 'Monday', '18:30:00', '20:00:00', '101', 2),
(6, 'Rekayasa Kebutuhan Perangkat Lunak', 8, 'Monday', '20:20:00', '22:00:00', '102', 2),
(7, 'Konsep Berpikir Kritis', 2, 'Monday', '18:30:00', '20:00:00', '103', 2),
(8, 'Dasar Robotika', 10, 'Monday', '18:30:00', '20:00:00', '104', 2),
(9, 'Rekayasa Perangkat Lunak', 8, 'Monday', '18:30:00', '20:00:00', '105', 4),
(10, 'Kewarganegaraan', 2, 'Monday', '18:30:00', '20:00:00', '201', 6),
(11, 'Kebudayaan dan Peradaban 4', 9, 'Monday', '20:20:00', '22:00:00', '202', 4),
(12, 'Metode Numerik', 9, 'Tuesday', '18:30:00', '20:20:00', '101', 2),
(13, 'Pengantar Akuntansi', 10, 'Tuesday', '18:30:00', '20:00:00', '102', 2),
(14, 'Teori Bahasa dan Otomata', 7, 'Tuesday', '18:30:00', '20:00:00', '104', 2),
(15, 'Software Profiling', 8, 'Tuesday', '18:30:00', '22:00:00', '201', 4),
(16, 'Kecerdasan Bisnis', 10, 'Tuesday', '18:30:00', '20:00:00', '107', 4),
(17, 'Pengolahan Citra', 7, 'Tuesday', '20:20:00', '22:00:00', '108', 4),
(18, 'Pemograman IOS', 2, 'Tuesday', '18:30:00', '20:00:00', '109', 6),
(19, 'Kebudayaan dan Peradaban 2', 7, 'Wednesday', '18:30:00', '20:00:00', '203', 2),
(20, 'Kewirausahaan Sosial', 2, 'Wednesday', '18:30:00', '22:00:00', '205', 4),
(21, 'Keamanan Sistem Informasi', 10, 'Wednesday', '18:30:00', '20:00:00', '103', 6),
(22, 'Bahasa Indonesia', 10, 'Thursday', '18:30:00', '20:00:00', '111', 2),
(23, 'Kepemimpinan Organisasi', 8, 'Thursday', '20:20:00', '22:00:00', '104', 2),
(24, 'Statistika', 8, 'Thursday', '18:30:00', '20:00:00', '204', 4),
(25, 'Managemen Resiko', 9, 'Thursday', '20:20:00', '22:00:00', '202', 4),
(26, 'Agama', 2, 'Thursday', '20:20:00', '22:00:00', '303', 6),
(27, 'Pemrograman Berorientasi Objek', 7, 'Friday', '18:30:00', '22:00:00', '405', 2),
(28, 'Pemograman Android', 2, 'Friday', '18:30:00', '20:00:00', '505', 4),
(29, 'Sensor dan Transduser', 9, 'Friday', '18:30:00', '20:00:00', '601', 4),
(30, 'Bahasa Inggris 2', 10, 'Friday', '20:20:00', '22:00:00', '102', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `class_department`
--

CREATE TABLE `class_department` (
  `id_class` int(11) DEFAULT NULL,
  `id_department` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `class_department`
--

INSERT INTO `class_department` (`id_class`, `id_department`) VALUES
(26, 3),
(26, 2),
(26, 1),
(22, 3),
(22, 2),
(22, 2),
(22, 1),
(30, 3),
(30, 2),
(30, 1),
(8, 2),
(21, 3),
(19, 3),
(19, 2),
(19, 1),
(11, 3),
(11, 2),
(11, 1),
(16, 3),
(23, 3),
(10, 3),
(10, 2),
(10, 1),
(20, 3),
(20, 2),
(20, 1),
(7, 3),
(25, 3),
(12, 1),
(5, 1),
(28, 1),
(18, 1),
(27, 3),
(27, 2),
(27, 1),
(13, 3),
(17, 2),
(6, 1),
(9, 3),
(29, 2),
(15, 1),
(24, 1),
(14, 2),
(25, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `department`
--

CREATE TABLE `department` (
  `id_department` int(11) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `department`
--

INSERT INTO `department` (`id_department`, `department_name`) VALUES
(1, 'Teknik Perangkat Lunak'),
(2, 'Teknik Informatika'),
(3, 'Sistem Informasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lecturer`
--

CREATE TABLE `lecturer` (
  `id_lecturer` int(255) NOT NULL,
  `lecturer_name` varchar(255) NOT NULL,
  `lecturer_email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `lecturer`
--

INSERT INTO `lecturer` (`id_lecturer`, `lecturer_name`, `lecturer_email`, `username`, `password`) VALUES
(2, 'Williams', 'williams@gmail.com', 'Williams', '$2y$10$q05e9wXd7NAxEjW9lgj6aOF6dxbchibyqhw/mR6l4M4X2.aTHH4ya'),
(7, 'Jenny', 'jenny@gmail.com', 'Jenny', '$2y$10$HI5nQwIfpLNepFex/muls.saGUGjcdOmnjsTY0AsaRSX7aLxSBkB.'),
(8, 'Anna', 'anna@gmail.com', 'Anna', '$2y$10$00pNeTbal3Wgekwyz8FpYeEx5IG1prg1tZeA.Weqa3HJtRIucE6o6'),
(9, 'Jacky', 'jacky@gmail.com', 'Jacky', '$2y$10$HFAUvUZSa0VXmkMQUDZ7ke2fxxYf.Erw/K3IU3OoQKRWUuCN0bODi'),
(10, 'Budi', 'budi@gmail.com', 'Budi', '$2y$10$WHcZ1X4CxSnofZRnBLZhP.INJcsm.RECTLZrIxlaISo7ZTcyV9FVK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student`
--

CREATE TABLE `student` (
  `id_student` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `id_department` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `student`
--

INSERT INTO `student` (`id_student`, `student_name`, `id_department`, `semester`) VALUES
(1, 'Nathaniel Arya', 1, 2),
(2, 'Zayn Hakim', 1, 2),
(3, 'Kai Mahendra', 1, 2),
(4, 'Leo Darrel', 1, 2),
(5, 'Keanu Elvano', 1, 2),
(6, 'Aiden Rayhan', 1, 2),
(7, 'Davin Alvaro', 1, 2),
(8, 'Axel Satya', 1, 2),
(9, 'Elric Nara', 1, 2),
(10, 'Skylar Revan', 1, 2),
(11, 'Kairo Faiz', 1, 2),
(12, 'Eren Salva', 1, 2),
(13, 'Yuna Aldric', 1, 2),
(14, 'Sora Ilham', 1, 2),
(15, 'Kenzo Arjuna', 1, 2),
(16, 'Aurora Zeline', 1, 4),
(17, 'Sasha Amara', 1, 4),
(18, 'Leona Kirana', 1, 4),
(19, 'Nayla Celeste', 1, 4),
(20, 'Yasmin Adara', 1, 4),
(21, 'Aluna Rivera', 1, 4),
(22, 'Mika Alesha', 1, 4),
(23, 'Zia Callista', 1, 4),
(24, 'Elina Marella', 1, 4),
(25, 'Keira Valencia', 1, 4),
(26, 'Livia Seraphine', 1, 4),
(27, 'Elyra Nadhifa', 1, 4),
(28, 'Arwen Syakira', 1, 4),
(29, 'Rania Aurelle', 1, 4),
(30, 'Xena Azzahra', 1, 4),
(31, 'Rey Maverick', 1, 6),
(32, 'Elroy Naufal', 1, 6),
(33, 'Denzel Farrel', 1, 6),
(34, 'Zeke Abimanyu', 1, 6),
(35, 'Bryce Raka', 1, 6),
(36, 'Ezra Fathir', 1, 6),
(37, 'Seth Damar', 1, 6),
(38, 'Nolan Bagas', 1, 6),
(39, 'Storm Iqbal', 1, 6),
(40, 'Kayden Rizal', 1, 6),
(41, 'Lennox Rian', 1, 6),
(42, 'Rowan Arif', 1, 6),
(43, 'Elliot Maesa', 1, 6),
(44, 'Lucian Ilham', 1, 6),
(45, 'Drake Hanan', 1, 6),
(54, 'Storm Iqbal', 1, 6),
(61, 'Zavier Malik', 2, 2),
(62, 'Caleb Reza', 2, 2),
(63, 'Milan Arga', 2, 2),
(64, 'Jace Ilhami', 2, 2),
(65, 'Noah Rendra', 2, 2),
(66, 'Atlas Dirga', 2, 2),
(67, 'Jude Wira', 2, 2),
(68, 'Enzo Rafasya', 2, 2),
(69, 'Ryder Hakim', 2, 2),
(70, 'Logan Alfath', 2, 2),
(71, 'Zion Heru', 2, 2),
(72, 'Xavier Nizam', 2, 2),
(73, 'Levi Akbar', 2, 2),
(74, 'Rowen Salman', 2, 2),
(75, 'Blaise Arvin', 2, 2),
(76, 'Celeste Adinda', 2, 4),
(77, 'Lyra Shanum', 2, 4),
(78, 'Maeva Nabila', 2, 4),
(79, 'Kaela Azzura', 2, 4),
(80, 'Naylee Faiha', 2, 4),
(81, 'Adel Cerenity', 2, 4),
(82, 'Isla Zahira', 2, 4),
(83, 'Talia Meisya', 2, 4),
(84, 'Mira Elrica', 2, 4),
(85, 'Azura Nayra', 2, 4),
(86, 'Zahara Kayla', 2, 4),
(87, 'Avila Huma', 2, 4),
(88, 'Sierra Amany', 2, 4),
(89, 'Vanya Qanita', 2, 4),
(90, 'Leia Danisha', 2, 4),
(91, 'Grayson Raditya', 2, 6),
(92, 'Jett Pradipta', 2, 6),
(93, 'Eagan Putra', 2, 6),
(94, 'Alec Ghani', 2, 6),
(95, 'River Ananta', 2, 6),
(96, 'Stellan Aryo', 2, 6),
(97, 'Ace Farel', 2, 6),
(98, 'Zayden Ilmi', 2, 6),
(99, 'Theo Haris', 2, 6),
(100, 'Cairo Fauzan', 2, 6),
(101, 'Soren Ridwan', 2, 6),
(102, 'Keenan Dhafa', 2, 6),
(103, 'Lucius Arka', 2, 6),
(104, 'Orion Yafi', 2, 6),
(105, 'Finn Mahesa', 2, 6),
(106, 'Ezio Khayru', 3, 2),
(107, 'Zeke Ramdan', 3, 2),
(108, 'Juno Ilham', 3, 2),
(109, 'Rafael Azzam', 3, 2),
(110, 'Kairos Najmi', 3, 2),
(111, 'Luca Abdan', 3, 2),
(112, 'Silas Firdaus', 3, 2),
(113, 'Kyrie Fauzan', 3, 2),
(114, 'Huxley Salman', 3, 2),
(115, 'Asher Maulana', 3, 2),
(116, 'Zeno Rafli', 3, 2),
(117, 'Draven Lutfi', 3, 2),
(118, 'Cassian Ray', 3, 2),
(119, 'Rayan Syah', 3, 2),
(120, 'Elio Jamal', 3, 2),
(121, 'Elora Malika', 3, 4),
(122, 'Kalia Zahwa', 3, 4),
(123, 'Misha Azkayra', 3, 4),
(124, 'Yara Qaireen', 3, 4),
(125, 'Nova Adreena', 3, 4),
(126, 'Ariella Nayla', 3, 4),
(127, 'Cleo Nabilla', 3, 4),
(128, 'Naomi Faiza', 3, 4),
(129, 'Riona Ghina', 3, 4),
(130, 'Indira Yumna', 3, 4),
(131, 'Azalea Kenanga', 3, 4),
(132, 'Jasmin Aliya', 3, 4),
(133, 'Selena Qanita', 3, 4),
(134, 'Violette Meira', 3, 4),
(135, 'Freya Haliza', 3, 4),
(136, 'Zander Alfie', 3, 6),
(137, 'Micah Darien', 3, 6),
(138, 'Troy Akmal', 3, 6),
(139, 'Revan Idris', 3, 6),
(140, 'Hunter Khalid', 3, 6),
(141, 'Knox Farhan', 3, 6),
(142, 'Zev Aryandra', 3, 6),
(143, 'Callum Naufal', 3, 6),
(144, 'Maverick Yusuf', 3, 6),
(145, 'Rico Arsyad', 3, 6),
(146, 'Jasper Anwar', 3, 6),
(147, 'Lennon Jibril', 3, 6),
(148, 'Neo Rasyid', 3, 6),
(149, 'Zain Malik', 3, 6),
(150, 'Phoenix Dani', 3, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_class`
--

CREATE TABLE `student_class` (
  `id_student_class` int(11) NOT NULL,
  `id_student` int(11) DEFAULT NULL,
  `id_class` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `student_class`
--

INSERT INTO `student_class` (`id_student_class`, `id_student`, `id_class`) VALUES
(1, 1, 5),
(2, 2, 5),
(3, 3, 5),
(4, 4, 5),
(5, 5, 5),
(6, 6, 5),
(7, 7, 5),
(8, 8, 5),
(9, 9, 5),
(10, 10, 5),
(11, 11, 5),
(12, 12, 5),
(13, 13, 5),
(14, 14, 5),
(15, 15, 5),
(16, 1, 6),
(17, 2, 6),
(18, 3, 6),
(19, 4, 6),
(20, 5, 6),
(21, 6, 6),
(22, 7, 6),
(23, 8, 6),
(24, 9, 6),
(25, 10, 6),
(26, 11, 6),
(27, 12, 6),
(28, 13, 6),
(29, 14, 6),
(30, 15, 6),
(31, 106, 7),
(32, 107, 7),
(33, 108, 7),
(34, 109, 7),
(35, 110, 7),
(36, 111, 7),
(37, 112, 7),
(38, 113, 7),
(39, 114, 7),
(40, 115, 7),
(41, 116, 7),
(42, 117, 7),
(43, 118, 7),
(44, 119, 7),
(45, 120, 7),
(46, 61, 8),
(47, 62, 8),
(48, 63, 8),
(49, 64, 8),
(50, 65, 8),
(51, 66, 8),
(52, 67, 8),
(53, 68, 8),
(54, 69, 8),
(55, 70, 8),
(56, 71, 8),
(57, 72, 8),
(58, 73, 8),
(59, 74, 8),
(60, 75, 8),
(61, 121, 9),
(62, 122, 9),
(63, 123, 9),
(64, 124, 9),
(65, 125, 9),
(66, 126, 9),
(67, 127, 9),
(68, 128, 9),
(69, 129, 9),
(70, 130, 9),
(71, 131, 9),
(72, 132, 9),
(73, 133, 9),
(74, 134, 9),
(75, 135, 9),
(76, 136, 10),
(77, 137, 10),
(78, 138, 10),
(79, 139, 10),
(80, 140, 10),
(81, 141, 10),
(82, 142, 10),
(83, 143, 10),
(84, 144, 10),
(85, 145, 10),
(86, 146, 10),
(87, 147, 10),
(88, 148, 10),
(89, 149, 10),
(90, 150, 10),
(91, 91, 10),
(92, 92, 10),
(93, 93, 10),
(94, 94, 10),
(95, 95, 10),
(96, 96, 10),
(97, 97, 10),
(98, 98, 10),
(99, 99, 10),
(100, 100, 10),
(101, 101, 10),
(102, 102, 10),
(103, 103, 10),
(104, 104, 10),
(105, 105, 10),
(106, 31, 10),
(107, 32, 10),
(108, 33, 10),
(109, 34, 10),
(110, 35, 10),
(111, 36, 10),
(112, 37, 10),
(113, 38, 10),
(114, 39, 10),
(115, 40, 10),
(116, 41, 10),
(117, 42, 10),
(118, 43, 10),
(119, 44, 10),
(120, 45, 10),
(121, 54, 10),
(122, 121, 11),
(123, 122, 11),
(124, 123, 11),
(125, 124, 11),
(126, 125, 11),
(127, 126, 11),
(128, 127, 11),
(129, 128, 11),
(130, 129, 11),
(131, 130, 11),
(132, 131, 11),
(133, 132, 11),
(134, 133, 11),
(135, 134, 11),
(136, 135, 11),
(137, 76, 11),
(138, 77, 11),
(139, 78, 11),
(140, 79, 11),
(141, 80, 11),
(142, 81, 11),
(143, 82, 11),
(144, 83, 11),
(145, 84, 11),
(146, 85, 11),
(147, 86, 11),
(148, 87, 11),
(149, 88, 11),
(150, 89, 11),
(151, 90, 11),
(152, 16, 11),
(153, 17, 11),
(154, 18, 11),
(155, 19, 11),
(156, 20, 11),
(157, 21, 11),
(158, 22, 11),
(159, 23, 11),
(160, 24, 11),
(161, 25, 11),
(162, 26, 11),
(163, 27, 11),
(164, 28, 11),
(165, 29, 11),
(166, 30, 11),
(167, 1, 12),
(168, 2, 12),
(169, 3, 12),
(170, 4, 12),
(171, 5, 12),
(172, 6, 12),
(173, 7, 12),
(174, 8, 12),
(175, 9, 12),
(176, 10, 12),
(177, 11, 12),
(178, 12, 12),
(179, 13, 12),
(180, 14, 12),
(181, 15, 12),
(182, 106, 13),
(183, 107, 13),
(184, 108, 13),
(185, 109, 13),
(186, 110, 13),
(187, 111, 13),
(188, 112, 13),
(189, 113, 13),
(190, 114, 13),
(191, 115, 13),
(192, 116, 13),
(193, 117, 13),
(194, 118, 13),
(195, 119, 13),
(196, 120, 13),
(197, 61, 14),
(198, 62, 14),
(199, 63, 14),
(200, 64, 14),
(201, 65, 14),
(202, 66, 14),
(203, 67, 14),
(204, 68, 14),
(205, 69, 14),
(206, 70, 14),
(207, 71, 14),
(208, 72, 14),
(209, 73, 14),
(210, 74, 14),
(211, 75, 14),
(212, 16, 15),
(213, 17, 15),
(214, 18, 15),
(215, 19, 15),
(216, 20, 15),
(217, 21, 15),
(218, 22, 15),
(219, 23, 15),
(220, 24, 15),
(221, 25, 15),
(222, 26, 15),
(223, 27, 15),
(224, 28, 15),
(225, 29, 15),
(226, 30, 15),
(227, 121, 16),
(228, 122, 16),
(229, 123, 16),
(230, 124, 16),
(231, 125, 16),
(232, 126, 16),
(233, 127, 16),
(234, 128, 16),
(235, 129, 16),
(236, 130, 16),
(237, 131, 16),
(238, 132, 16),
(239, 133, 16),
(240, 134, 16),
(241, 135, 16),
(242, 76, 17),
(243, 77, 17),
(244, 78, 17),
(245, 79, 17),
(246, 80, 17),
(247, 81, 17),
(248, 82, 17),
(249, 83, 17),
(250, 84, 17),
(251, 85, 17),
(252, 86, 17),
(253, 87, 17),
(254, 88, 17),
(255, 89, 17),
(256, 90, 17),
(257, 31, 18),
(258, 32, 18),
(259, 33, 18),
(260, 34, 18),
(261, 35, 18),
(262, 36, 18),
(263, 37, 18),
(264, 38, 18),
(265, 39, 18),
(266, 40, 18),
(267, 41, 18),
(268, 42, 18),
(269, 43, 18),
(270, 44, 18),
(271, 45, 18),
(272, 54, 18),
(273, 106, 19),
(274, 107, 19),
(275, 108, 19),
(276, 109, 19),
(277, 110, 19),
(278, 111, 19),
(279, 112, 19),
(280, 113, 19),
(281, 114, 19),
(282, 115, 19),
(283, 116, 19),
(284, 117, 19),
(285, 118, 19),
(286, 119, 19),
(287, 120, 19),
(288, 61, 19),
(289, 62, 19),
(290, 63, 19),
(291, 64, 19),
(292, 65, 19),
(293, 66, 19),
(294, 67, 19),
(295, 68, 19),
(296, 69, 19),
(297, 70, 19),
(298, 71, 19),
(299, 72, 19),
(300, 73, 19),
(301, 74, 19),
(302, 75, 19),
(303, 1, 19),
(304, 2, 19),
(305, 3, 19),
(306, 4, 19),
(307, 5, 19),
(308, 6, 19),
(309, 7, 19),
(310, 8, 19),
(311, 9, 19),
(312, 10, 19),
(313, 11, 19),
(314, 12, 19),
(315, 13, 19),
(316, 14, 19),
(317, 15, 19),
(318, 121, 20),
(319, 122, 20),
(320, 123, 20),
(321, 124, 20),
(322, 125, 20),
(323, 126, 20),
(324, 127, 20),
(325, 128, 20),
(326, 129, 20),
(327, 130, 20),
(328, 131, 20),
(329, 132, 20),
(330, 133, 20),
(331, 134, 20),
(332, 135, 20),
(333, 76, 20),
(334, 77, 20),
(335, 78, 20),
(336, 79, 20),
(337, 80, 20),
(338, 81, 20),
(339, 82, 20),
(340, 83, 20),
(341, 84, 20),
(342, 85, 20),
(343, 86, 20),
(344, 87, 20),
(345, 88, 20),
(346, 89, 20),
(347, 90, 20),
(348, 16, 20),
(349, 17, 20),
(350, 18, 20),
(351, 19, 20),
(352, 20, 20),
(353, 21, 20),
(354, 22, 20),
(355, 23, 20),
(356, 24, 20),
(357, 25, 20),
(358, 26, 20),
(359, 27, 20),
(360, 28, 20),
(361, 29, 20),
(362, 30, 20),
(363, 136, 21),
(364, 137, 21),
(365, 138, 21),
(366, 139, 21),
(367, 140, 21),
(368, 141, 21),
(369, 142, 21),
(370, 143, 21),
(371, 144, 21),
(372, 145, 21),
(373, 146, 21),
(374, 147, 21),
(375, 148, 21),
(376, 149, 21),
(377, 150, 21),
(378, 106, 22),
(379, 107, 22),
(380, 108, 22),
(381, 109, 22),
(382, 110, 22),
(383, 111, 22),
(384, 112, 22),
(385, 113, 22),
(386, 114, 22),
(387, 115, 22),
(388, 116, 22),
(389, 117, 22),
(390, 118, 22),
(391, 119, 22),
(392, 120, 22),
(393, 61, 22),
(394, 62, 22),
(395, 63, 22),
(396, 64, 22),
(397, 65, 22),
(398, 66, 22),
(399, 67, 22),
(400, 68, 22),
(401, 69, 22),
(402, 70, 22),
(403, 71, 22),
(404, 72, 22),
(405, 73, 22),
(406, 74, 22),
(407, 75, 22),
(408, 61, 22),
(409, 62, 22),
(410, 63, 22),
(411, 64, 22),
(412, 65, 22),
(413, 66, 22),
(414, 67, 22),
(415, 68, 22),
(416, 69, 22),
(417, 70, 22),
(418, 71, 22),
(419, 72, 22),
(420, 73, 22),
(421, 74, 22),
(422, 75, 22),
(423, 1, 22),
(424, 2, 22),
(425, 3, 22),
(426, 4, 22),
(427, 5, 22),
(428, 6, 22),
(429, 7, 22),
(430, 8, 22),
(431, 9, 22),
(432, 10, 22),
(433, 11, 22),
(434, 12, 22),
(435, 13, 22),
(436, 14, 22),
(437, 15, 22),
(438, 106, 23),
(439, 107, 23),
(440, 108, 23),
(441, 109, 23),
(442, 110, 23),
(443, 111, 23),
(444, 112, 23),
(445, 113, 23),
(446, 114, 23),
(447, 115, 23),
(448, 116, 23),
(449, 117, 23),
(450, 118, 23),
(451, 119, 23),
(452, 120, 23),
(453, 16, 24),
(454, 17, 24),
(455, 18, 24),
(456, 19, 24),
(457, 20, 24),
(458, 21, 24),
(459, 22, 24),
(460, 23, 24),
(461, 24, 24),
(462, 25, 24),
(463, 26, 24),
(464, 27, 24),
(465, 28, 24),
(466, 29, 24),
(467, 30, 24),
(468, 121, 25),
(469, 122, 25),
(470, 123, 25),
(471, 124, 25),
(472, 125, 25),
(473, 126, 25),
(474, 127, 25),
(475, 128, 25),
(476, 129, 25),
(477, 130, 25),
(478, 131, 25),
(479, 132, 25),
(480, 133, 25),
(481, 134, 25),
(482, 135, 25),
(483, 136, 26),
(484, 137, 26),
(485, 138, 26),
(486, 139, 26),
(487, 140, 26),
(488, 141, 26),
(489, 142, 26),
(490, 143, 26),
(491, 144, 26),
(492, 145, 26),
(493, 146, 26),
(494, 147, 26),
(495, 148, 26),
(496, 149, 26),
(497, 150, 26),
(498, 91, 26),
(499, 92, 26),
(500, 93, 26),
(501, 94, 26),
(502, 95, 26),
(503, 96, 26),
(504, 97, 26),
(505, 98, 26),
(506, 99, 26),
(507, 100, 26),
(508, 101, 26),
(509, 102, 26),
(510, 103, 26),
(511, 104, 26),
(512, 105, 26),
(513, 31, 26),
(514, 32, 26),
(515, 33, 26),
(516, 34, 26),
(517, 35, 26),
(518, 36, 26),
(519, 37, 26),
(520, 38, 26),
(521, 39, 26),
(522, 40, 26),
(523, 41, 26),
(524, 42, 26),
(525, 43, 26),
(526, 44, 26),
(527, 45, 26),
(528, 54, 26),
(529, 106, 27),
(530, 107, 27),
(531, 108, 27),
(532, 109, 27),
(533, 110, 27),
(534, 111, 27),
(535, 112, 27),
(536, 113, 27),
(537, 114, 27),
(538, 115, 27),
(539, 116, 27),
(540, 117, 27),
(541, 118, 27),
(542, 119, 27),
(543, 120, 27),
(544, 61, 27),
(545, 62, 27),
(546, 63, 27),
(547, 64, 27),
(548, 65, 27),
(549, 66, 27),
(550, 67, 27),
(551, 68, 27),
(552, 69, 27),
(553, 70, 27),
(554, 71, 27),
(555, 72, 27),
(556, 73, 27),
(557, 74, 27),
(558, 75, 27),
(559, 1, 27),
(560, 2, 27),
(561, 3, 27),
(562, 4, 27),
(563, 5, 27),
(564, 6, 27),
(565, 7, 27),
(566, 8, 27),
(567, 9, 27),
(568, 10, 27),
(569, 11, 27),
(570, 12, 27),
(571, 13, 27),
(572, 14, 27),
(573, 15, 27),
(574, 16, 28),
(575, 17, 28),
(576, 18, 28),
(577, 19, 28),
(578, 20, 28),
(579, 21, 28),
(580, 22, 28),
(581, 23, 28),
(582, 24, 28),
(583, 25, 28),
(584, 26, 28),
(585, 27, 28),
(586, 28, 28),
(587, 29, 28),
(588, 30, 28),
(589, 76, 29),
(590, 77, 29),
(591, 78, 29),
(592, 79, 29),
(593, 80, 29),
(594, 81, 29),
(595, 82, 29),
(596, 83, 29),
(597, 84, 29),
(598, 85, 29),
(599, 86, 29),
(600, 87, 29),
(601, 88, 29),
(602, 89, 29),
(603, 90, 29),
(604, 121, 30),
(605, 122, 30),
(606, 123, 30),
(607, 124, 30),
(608, 125, 30),
(609, 126, 30),
(610, 127, 30),
(611, 128, 30),
(612, 129, 30),
(613, 130, 30),
(614, 131, 30),
(615, 132, 30),
(616, 133, 30),
(617, 134, 30),
(618, 135, 30),
(619, 76, 30),
(620, 77, 30),
(621, 78, 30),
(622, 79, 30),
(623, 80, 30),
(624, 81, 30),
(625, 82, 30),
(626, 83, 30),
(627, 84, 30),
(628, 85, 30),
(629, 86, 30),
(630, 87, 30),
(631, 88, 30),
(632, 89, 30),
(633, 90, 30),
(634, 16, 30),
(635, 17, 30),
(636, 18, 30),
(637, 19, 30),
(638, 20, 30),
(639, 21, 30),
(640, 22, 30),
(641, 23, 30),
(642, 24, 30),
(643, 25, 30),
(644, 26, 30),
(645, 27, 30),
(646, 28, 30),
(647, 29, 30),
(648, 30, 30);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id_attendance`),
  ADD KEY `id_class` (`id_class`),
  ADD KEY `id_student` (`id_student`);

--
-- Indeks untuk tabel `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id_class`),
  ADD KEY `foreign key` (`id_lecturer`);

--
-- Indeks untuk tabel `class_department`
--
ALTER TABLE `class_department`
  ADD KEY `id_class` (`id_class`),
  ADD KEY `id_department` (`id_department`);

--
-- Indeks untuk tabel `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id_department`);

--
-- Indeks untuk tabel `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`id_lecturer`);

--
-- Indeks untuk tabel `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_student`),
  ADD KEY `id_department_student_department` (`id_department`);

--
-- Indeks untuk tabel `student_class`
--
ALTER TABLE `student_class`
  ADD PRIMARY KEY (`id_student_class`),
  ADD KEY `id_student` (`id_student`),
  ADD KEY `id_class` (`id_class`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id_attendance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `class`
--
ALTER TABLE `class`
  MODIFY `id_class` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `department`
--
ALTER TABLE `department`
  MODIFY `id_department` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `lecturer`
--
ALTER TABLE `lecturer`
  MODIFY `id_lecturer` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `student`
--
ALTER TABLE `student`
  MODIFY `id_student` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT untuk tabel `student_class`
--
ALTER TABLE `student_class`
  MODIFY `id_student_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`);

--
-- Ketidakleluasaan untuk tabel `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `foreign key` FOREIGN KEY (`id_lecturer`) REFERENCES `lecturer` (`id_lecturer`);

--
-- Ketidakleluasaan untuk tabel `class_department`
--
ALTER TABLE `class_department`
  ADD CONSTRAINT `class_department_ibfk_1` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`),
  ADD CONSTRAINT `class_department_ibfk_2` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`);

--
-- Ketidakleluasaan untuk tabel `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `id_department_student_department` FOREIGN KEY (`id_department`) REFERENCES `department` (`id_department`);

--
-- Ketidakleluasaan untuk tabel `student_class`
--
ALTER TABLE `student_class`
  ADD CONSTRAINT `student_class_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`),
  ADD CONSTRAINT `student_class_ibfk_2` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
