-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2025 at 04:37 AM
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
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_04_023431_create_students_table', 1),
(5, '2025_11_05_053857_add_id_icon_path_to_students_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
('iG7c4607fr4sQcXyuUpl8LcneTup3hs5etwHpcHi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkZDWEs0Um43QlVjdWNITXh4SU81M2UyQkxyQllqeUtVdXMyRjI3NyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1762745240),
('t8WTYdAm2DILlBhY0I23rNjANwIAfHsktIzsLQuk', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUFE3cWF5VkxUWVZzSHRsU1N6a3ZUUDBwaFpxbUVhb1dvTjhpY3czZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdHVkZW50cyI7czo1OiJyb3V0ZSI7czoxNDoic3R1ZGVudHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1762745756);

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
(1, 'S1019', 'Luis Mateo', 'BSIT', 1, '2025-11-09 19:33:09', '2025-11-09 19:33:09'),
(2, 'STU001', 'Adrian Dela Cruz', 'BS Information Technology', 1, NULL, NULL),
(3, 'STU002', 'Bea Santos', 'BS Accountancy', 2, NULL, NULL),
(4, 'STU003', 'Carlo Reyes', 'BS Computer Science', 3, NULL, NULL),
(5, 'STU004', 'Diane Mendoza', 'BS Psychology', 1, NULL, NULL),
(6, 'STU005', 'Elvin Garcia', 'BS Civil Engineering', 4, NULL, NULL),
(7, 'S0001', 'Juan Dela Cruz', 'BSIT', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(8, 'S0002', 'Maria Santos', 'BSCS', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(9, 'S0003', 'Mark Angelo Reyes', 'BSHM', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(10, 'S0004', 'Ana Louise Garcia', 'BSBA', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(11, 'S0005', 'Joshua Ramirez', 'BSA', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(12, 'S0006', 'Kimberly Tolentino', 'BSIT', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(13, 'S0007', 'Christian Mendoza', 'BSCS', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(14, 'S0008', 'Princess Joy dela Peña', 'BSHM', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(15, 'S0009', 'John Paul Cruz', 'BSBA', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(16, 'S0010', 'Angel Mae Bautista', 'BSA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(17, 'S0011', 'Allen Jake Navarro', 'BSIT', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(18, 'S0012', 'Christine Pearl Aquino', 'BSCS', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(19, 'S0013', 'Jerome Castillo', 'BSHM', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(20, 'S0014', 'Nicole Anne Torres', 'BSBA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(21, 'S0015', 'Jasper Robles', 'BSA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(22, 'S0016', 'Elaine Rivera', 'BSIT', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(23, 'S0017', 'Patrick Salvador', 'BSCS', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(24, 'S0018', 'Carla Jean Dominguez', 'BSHM', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(25, 'S0019', 'Leo Francis Ramos', 'BSBA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(26, 'S0020', 'Hannah Joy Gonzales', 'BSA', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(27, 'S0021', 'Adrian Lopez', 'BSIT', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(28, 'S0022', 'Sophia Dizon', 'BSCS', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(29, 'S0023', 'Renz Michael Fabella', 'BSHM', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(30, 'S0024', 'Shaira Mae Vergara', 'BSBA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(31, 'S0025', 'Noel Christian Abad', 'BSA', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(32, 'S0026', 'Lyka Marie Fajardo', 'BSIT', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(33, 'S0027', 'Kenneth Soriano', 'BSCS', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(34, 'S0028', 'Trisha Mae Villanueva', 'BSHM', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(35, 'S0029', 'Bryan Carreon', 'BSBA', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(36, 'S0030', 'Janelle Ocampo', 'BSA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(37, 'S0031', 'Cedric Bautista', 'BSIT', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(38, 'S0032', 'Alexa Nicole Rivas', 'BSCS', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(39, 'S0033', 'Karl Matthew Domingo', 'BSHM', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(40, 'S0034', 'Aira Mae Del Rosario', 'BSBA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(41, 'S0035', 'Nathaniel Tan', 'BSA', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(42, 'S0036', 'Lovely Grace Cruz', 'BSIT', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(43, 'S0037', 'Justin Gabriel Bautista', 'BSCS', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(44, 'S0038', 'Irish Joy Abarquez', 'BSHM', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(45, 'S0039', 'Jake Alvarez', 'BSBA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(46, 'S0040', 'Reina Samantha Uy', 'BSA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(47, 'S0041', 'Dominic Flores', 'BSIT', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(48, 'S0042', 'Patricia Mae Gatchalian', 'BSCS', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(49, 'S0043', 'Alvin Carl Fernando', 'BSHM', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(50, 'S0044', 'Jasmine Faith Jocson', 'BSBA', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(51, 'S0045', 'Rico John Pascual', 'BSA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(52, 'S0046', 'Mae Anne Francisco', 'BSIT', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(53, 'S0047', 'Angelo Pineda', 'BSCS', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(54, 'S0048', 'Charlene Dacumos', 'BSHM', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(55, 'S0049', 'Josh Andrei Manalo', 'BSBA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(56, 'S0050', 'Fiona Heart Llamas', 'BSA', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(57, 'S0051', 'Darren Kyle Santos', 'BSIT', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(58, 'S0052', 'Stephanie Grace Cruz', 'BSCS', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(59, 'S0053', 'Allen Troy Villareal', 'BSHM', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(60, 'S0054', 'Rhea Camille Abella', 'BSBA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(61, 'S0055', 'Jomar Enriquez', 'BSA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(62, 'S0056', 'Kathleen Joy Sarmiento', 'BSIT', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(63, 'S0057', 'Leonard James Amador', 'BSCS', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(64, 'S0058', 'Cherry Mae Alcantara', 'BSHM', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(65, 'S0059', 'Michael Torres', 'BSBA', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(66, 'S0060', 'April Jane Medina', 'BSA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(67, 'S0061', 'Raymond Cruz', 'BSIT', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(68, 'S0062', 'Zyra Nicole Salazar', 'BSCS', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(69, 'S0063', 'Cedrick Mendez', 'BSHM', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(70, 'S0064', 'Mae Elizabeth Arce', 'BSBA', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(71, 'S0065', 'Harold James Fuerte', 'BSA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(72, 'S0066', 'Ella Rose Talampas', 'BSIT', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(73, 'S0067', 'Ronald Adrian Ybañez', 'BSCS', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(74, 'S0068', 'Kristine Joy Monteverde', 'BSHM', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(75, 'S0069', 'Gabriel Diaz', 'BSBA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(76, 'S0070', 'Bianca Camille Roxas', 'BSA', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(77, 'S0071', 'Francis Adrian Chua', 'BSIT', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(78, 'S0072', 'Nika Marie Zamora', 'BSCS', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(79, 'S0073', 'Ron Jay Feliciano', 'BSHM', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(80, 'S0074', 'Elaiza Monique Bonifacio', 'BSBA', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(81, 'S0075', 'Gian Carlo Ramos', 'BSA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(82, 'S0076', 'Hazel Anne Polinar', 'BSIT', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(83, 'S0077', 'Ralph Vincent Sy', 'BSCS', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(84, 'S0078', 'Althea Gwyneth Santos', 'BSHM', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(85, 'S0079', 'Charles Emman Ventura', 'BSBA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(86, 'S0080', 'Daniella Rose Bautista', 'BSA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(87, 'S0081', 'Ivan Jerome Ponce', 'BSIT', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(88, 'S0082', 'Mariel Faith Samson', 'BSCS', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(89, 'S0083', 'Kristoff John Balatero', 'BSHM', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(90, 'S0084', 'Shane Andrea Vergara', 'BSBA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(91, 'S0085', 'Romeo Dizon', 'BSA', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(92, 'S0086', 'Caryl Mae Gutierrez', 'BSIT', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(93, 'S0087', 'Daniel Joseph Aquino', 'BSCS', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(94, 'S0088', 'Mary Grace Almonte', 'BSHM', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(95, 'S0089', 'Lance Gabriel Co', 'BSBA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(96, 'S0090', 'Ysabella Faye Ramos', 'BSA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(97, 'S0091', 'Jude Ezekiel Tan', 'BSIT', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(98, 'S0092', 'Queenie Joy Manalang', 'BSCS', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(99, 'S0093', 'Paolo Miguel Dela Vega', 'BSHM', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(100, 'S0094', 'Janella Rose Lim', 'BSBA', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(101, 'S0095', 'Carl Vincent Cheng', 'BSA', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(102, 'S0096', 'Rowena Galang', 'BSIT', 4, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(103, 'S0097', 'Aldrin Paul Magtoto', 'BSCS', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(104, 'S0098', 'Noreen Ashley Salvador', 'BSHM', 1, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(105, 'S0099', 'Jethro Tyler Go', 'BSBA', 3, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(106, 'S0100', 'Hera Ysabel Mercado', 'BSA', 2, '2025-11-10 03:35:15', '2025-11-10 03:35:15'),
(107, 'S0151', 'Benjamen Di Makalimutan', 'BSIT', 2, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(108, 'S0152', 'Walang Kapantay Santos', 'BSCS', 1, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(109, 'S0153', 'Jun Jun Malakas', 'BSHM', 3, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(110, 'S0154', 'Maria Kapalaran Cruz', 'BSBA', 4, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(111, 'S0155', 'Pogi Boy Mendoza', 'BSA', 2, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(112, 'S0156', 'Kape Lang Sapat Na', 'BSIT', 1, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(113, 'S0157', 'Juan Tamad Jr.', 'BSCS', 3, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(114, 'S0158', 'Ligaya Palagi', 'BSHM', 4, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(115, 'S0159', 'Mahirap Gumising Reyes', 'BSBA', 2, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(116, 'S0160', 'Tulog Muna Dela Rosa', 'BSA', 1, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(117, 'S0161', 'Gigil Ako Fernandez', 'BSIT', 3, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(118, 'S0162', 'Harana Sa Tanghali', 'BSCS', 4, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(119, 'S0163', 'Mabait Kunwari Pascual', 'BSHM', 2, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(120, 'S0164', 'Sana All Dizon', 'BSBA', 1, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(121, 'S0165', 'Lodi Ko Tol', 'BSA', 3, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(122, 'S0166', 'Hopia Manalo', 'BSIT', 2, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(123, 'S0167', 'Trending Topic Vargas', 'BSCS', 1, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(124, 'S0168', 'Shesh Ang Lamig', 'BSHM', 4, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(125, 'S0169', 'Medyo Malakas Ocampo', 'BSBA', 3, '2025-11-10 03:35:38', '2025-11-10 03:35:38'),
(126, 'S0170', 'Basta Driver Sweet Lover', 'BSA', 1, '2025-11-10 03:35:38', '2025-11-10 03:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@example.com', '2025-11-10 03:25:33', '$2y$12$dtOHVPLa6oJSWIPeG8EKJeBsob8aCIQc08kwbC7OfEso7WB16Jb7O', NULL, '2025-11-10 03:25:33', '2025-11-10 03:25:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
