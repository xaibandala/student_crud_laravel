-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2025 at 03:39 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ZrCFXPe9iNtS9BR1Lnulyty60YjsRcZfs2qQNKoK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmZERGxsUkRyUnBrZWZoOEtiR0pZQXI4YnFkMFNjV25KRXF0Tk1XOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50cyI7czo1OiJyb3V0ZSI7czoxNDoic3R1ZGVudHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762310347);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `course` varchar(255) NOT NULL,
  `year_level` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `name`, `course`, `year_level`, `created_at`, `updated_at`) VALUES
(1, 'S0001', 'Juan Dela Cruz', 'BSIT', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(2, 'S0002', 'Maria Santos', 'BSCS', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(3, 'S0003', 'Mark Angelo Reyes', 'BSHM', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(4, 'S0004', 'Ana Louise Garcia', 'BSBA', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(5, 'S0005', 'Joshua Ramirez', 'BSA', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(6, 'S0006', 'Kimberly Tolentino', 'BSIT', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(7, 'S0007', 'Christian Mendoza', 'BSCS', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(8, 'S0008', 'Princess Joy dela Peña', 'BSHM', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(9, 'S0009', 'John Paul Cruz', 'BSBA', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(10, 'S0010', 'Angel Mae Bautista', 'BSA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(11, 'S0011', 'Allen Jake Navarro', 'BSIT', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(12, 'S0012', 'Christine Pearl Aquino', 'BSCS', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(13, 'S0013', 'Jerome Castillo', 'BSHM', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(14, 'S0014', 'Nicole Anne Torres', 'BSBA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(15, 'S0015', 'Jasper Robles', 'BSA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(16, 'S0016', 'Elaine Rivera', 'BSIT', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(17, 'S0017', 'Patrick Salvador', 'BSCS', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(18, 'S0018', 'Carla Jean Dominguez', 'BSHM', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(19, 'S0019', 'Leo Francis Ramos', 'BSBA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(20, 'S0020', 'Hannah Joy Gonzales', 'BSA', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(21, 'S0021', 'Adrian Lopez', 'BSIT', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(22, 'S0022', 'Sophia Dizon', 'BSCS', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(23, 'S0023', 'Renz Michael Fabella', 'BSHM', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(24, 'S0024', 'Shaira Mae Vergara', 'BSBA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(25, 'S0025', 'Noel Christian Abad', 'BSA', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(26, 'S0026', 'Lyka Marie Fajardo', 'BSIT', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(27, 'S0027', 'Kenneth Soriano', 'BSCS', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(28, 'S0028', 'Trisha Mae Villanueva', 'BSHM', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(29, 'S0029', 'Bryan Carreon', 'BSBA', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(30, 'S0030', 'Janelle Ocampo', 'BSA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(31, 'S0031', 'Cedric Bautista', 'BSIT', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(32, 'S0032', 'Alexa Nicole Rivas', 'BSCS', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(33, 'S0033', 'Karl Matthew Domingo', 'BSHM', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(34, 'S0034', 'Aira Mae Del Rosario', 'BSBA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(35, 'S0035', 'Nathaniel Tan', 'BSA', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(36, 'S0036', 'Lovely Grace Cruz', 'BSIT', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(37, 'S0037', 'Justin Gabriel Bautista', 'BSCS', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(38, 'S0038', 'Irish Joy Abarquez', 'BSHM', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(39, 'S0039', 'Jake Alvarez', 'BSBA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(40, 'S0040', 'Reina Samantha Uy', 'BSA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(41, 'S0041', 'Dominic Flores', 'BSIT', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(42, 'S0042', 'Patricia Mae Gatchalian', 'BSCS', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(43, 'S0043', 'Alvin Carl Fernando', 'BSHM', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(44, 'S0044', 'Jasmine Faith Jocson', 'BSBA', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(45, 'S0045', 'Rico John Pascual', 'BSA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(46, 'S0046', 'Mae Anne Francisco', 'BSIT', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(47, 'S0047', 'Angelo Pineda', 'BSCS', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(48, 'S0048', 'Charlene Dacumos', 'BSHM', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(49, 'S0049', 'Josh Andrei Manalo', 'BSBA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(50, 'S0050', 'Fiona Heart Llamas', 'BSA', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(51, 'S0051', 'Darren Kyle Santos', 'BSIT', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(52, 'S0052', 'Stephanie Grace Cruz', 'BSCS', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(53, 'S0053', 'Allen Troy Villareal', 'BSHM', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(54, 'S0054', 'Rhea Camille Abella', 'BSBA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(55, 'S0055', 'Jomar Enriquez', 'BSA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(56, 'S0056', 'Kathleen Joy Sarmiento', 'BSIT', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(57, 'S0057', 'Leonard James Amador', 'BSCS', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(58, 'S0058', 'Cherry Mae Alcantara', 'BSHM', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(59, 'S0059', 'Michael Torres', 'BSBA', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(60, 'S0060', 'April Jane Medina', 'BSA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(61, 'S0061', 'Raymond Cruz', 'BSIT', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(62, 'S0062', 'Zyra Nicole Salazar', 'BSCS', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(63, 'S0063', 'Cedrick Mendez', 'BSHM', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(64, 'S0064', 'Mae Elizabeth Arce', 'BSBA', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(65, 'S0065', 'Harold James Fuerte', 'BSA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(66, 'S0066', 'Ella Rose Talampas', 'BSIT', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(67, 'S0067', 'Ronald Adrian Ybañez', 'BSCS', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(68, 'S0068', 'Kristine Joy Monteverde', 'BSHM', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(69, 'S0069', 'Gabriel Diaz', 'BSBA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(70, 'S0070', 'Bianca Camille Roxas', 'BSA', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(71, 'S0071', 'Francis Adrian Chua', 'BSIT', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(72, 'S0072', 'Nika Marie Zamora', 'BSCS', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(73, 'S0073', 'Ron Jay Feliciano', 'BSHM', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(74, 'S0074', 'Elaiza Monique Bonifacio', 'BSBA', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(75, 'S0075', 'Gian Carlo Ramos', 'BSA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(76, 'S0076', 'Hazel Anne Polinar', 'BSIT', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(77, 'S0077', 'Ralph Vincent Sy', 'BSCS', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(78, 'S0078', 'Althea Gwyneth Santos', 'BSHM', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(79, 'S0079', 'Charles Emman Ventura', 'BSBA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(80, 'S0080', 'Daniella Rose Bautista', 'BSA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(81, 'S0081', 'Ivan Jerome Ponce', 'BSIT', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(82, 'S0082', 'Mariel Faith Samson', 'BSCS', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(83, 'S0083', 'Kristoff John Balatero', 'BSHM', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(84, 'S0084', 'Shane Andrea Vergara', 'BSBA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(85, 'S0085', 'Romeo Dizon', 'BSA', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(86, 'S0086', 'Caryl Mae Gutierrez', 'BSIT', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(87, 'S0087', 'Daniel Joseph Aquino', 'BSCS', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(88, 'S0088', 'Mary Grace Almonte', 'BSHM', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(89, 'S0089', 'Lance Gabriel Co', 'BSBA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(90, 'S0090', 'Ysabella Faye Ramos', 'BSA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(91, 'S0091', 'Jude Ezekiel Tan', 'BSIT', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(92, 'S0092', 'Queenie Joy Manalang', 'BSCS', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(93, 'S0093', 'Paolo Miguel Dela Vega', 'BSHM', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(94, 'S0094', 'Janella Rose Lim', 'BSBA', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(95, 'S0095', 'Carl Vincent Cheng', 'BSA', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(96, 'S0096', 'Rowena Galang', 'BSIT', 4, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(97, 'S0097', 'Aldrin Paul Magtoto', 'BSCS', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(98, 'S0098', 'Noreen Ashley Salvador', 'BSHM', 1, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(99, 'S0099', 'Jethro Tyler Go', 'BSBA', 3, '2025-11-05 02:39:03', '2025-11-05 02:39:03'),
(100, 'S0100', 'Hera Ysabel Mercado', 'BSA', 2, '2025-11-05 02:39:03', '2025-11-05 02:39:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_student_id_unique` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
