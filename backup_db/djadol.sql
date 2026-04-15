-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 15, 2026 at 03:45 PM
-- Server version: 10.11.10-MariaDB-log
-- PHP Version: 8.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `djadol`
--

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_agen`
--

DROP TABLE IF EXISTS `jurnal_agen`;
CREATE TABLE IF NOT EXISTS `jurnal_agen` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `retail_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `latlong` varchar(100) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_agen`
--

INSERT INTO `jurnal_agen` (`id`, `company_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `retail_id`, `photo`, `agen_id`, `latlong`, `is_new`, `total_price`) VALUES
(6, 1, '2025-12-18 22:31:51', 31, NULL, NULL, 7, NULL, NULL, 'null,null', 0, 72000),
(7, 1, '2025-12-18 22:32:15', 31, NULL, NULL, 7, NULL, NULL, 'null,null', 0, 39500),
(8, 1, '2025-12-18 22:40:14', 31, NULL, NULL, 6, NULL, NULL, 'null,null', 0, 87500),
(9, 1, '2026-01-05 07:59:26', 38, NULL, NULL, 9, NULL, NULL, 'null,null', 0, 90000),
(10, 1, '2026-01-05 09:04:58', 38, NULL, NULL, 12, NULL, NULL, 'null,null', 0, 95000),
(11, 1, '2026-01-05 09:51:00', 38, NULL, NULL, 14, NULL, NULL, 'null,null', 0, 142500),
(12, 1, '2026-01-05 10:23:17', 38, NULL, NULL, 17, NULL, NULL, 'null,null', 0, 95000),
(13, 1, '2026-01-06 08:32:00', 38, NULL, NULL, 20, NULL, NULL, 'null,null', 0, 27000),
(14, 1, '2026-01-06 08:59:21', 38, NULL, NULL, 23, NULL, NULL, 'null,null', 0, 95000),
(15, 1, '2026-01-06 09:42:29', 38, NULL, NULL, 25, NULL, NULL, 'null,null', 0, 47500),
(16, 1, '2026-01-06 10:06:39', 38, NULL, NULL, 26, NULL, NULL, 'null,null', 0, 95000),
(17, 1, '2026-01-06 10:30:19', 38, NULL, NULL, 28, NULL, NULL, 'null,null', 0, 34000),
(18, 1, '2026-01-06 10:38:12', 38, NULL, NULL, 29, NULL, NULL, 'null,null', 0, 51000),
(19, 1, '2026-01-06 11:06:14', 38, NULL, NULL, 30, NULL, NULL, 'null,null', 0, 190000),
(20, 1, '2026-01-07 08:38:08', 38, NULL, NULL, 33, NULL, NULL, 'null,null', 0, 370000),
(21, 1, '2026-01-07 09:19:38', 38, NULL, NULL, 35, NULL, NULL, 'null,null', 0, 56500),
(22, 1, '2026-01-07 10:01:47', 38, NULL, NULL, 40, NULL, NULL, 'null,null', 0, 34000),
(23, 1, '2026-01-07 10:19:32', 38, NULL, NULL, 44, NULL, NULL, 'null,null', 0, 51000),
(24, 1, '2026-01-07 13:39:16', 38, NULL, NULL, 47, NULL, NULL, 'null,null', 0, 115000),
(25, 1, '2026-01-07 16:47:42', 38, NULL, NULL, 48, NULL, NULL, 'null,null', 0, 170000),
(26, 1, '2026-01-08 09:53:46', 38, NULL, NULL, 56, NULL, NULL, 'null,null', 0, 61000),
(27, 1, '2026-01-08 10:11:11', 38, NULL, NULL, 58, NULL, NULL, 'null,null', 0, 92500),
(28, 1, '2026-01-08 10:29:47', 38, NULL, NULL, 60, NULL, NULL, 'null,null', 0, 26500),
(29, 1, '2026-01-09 07:46:12', 38, NULL, NULL, 63, NULL, NULL, 'null,null', 0, 15500),
(30, 1, '2026-01-09 08:48:49', 38, NULL, NULL, 8, NULL, NULL, 'null,null', 0, 24000),
(31, 1, '2026-01-09 08:50:37', 38, NULL, NULL, 8, NULL, NULL, 'null,null', 0, 34000),
(32, 1, '2026-01-09 09:27:45', 38, NULL, NULL, 65, NULL, NULL, 'null,null', 0, 104500),
(33, 1, '2026-01-10 08:48:17', 38, NULL, NULL, 66, NULL, NULL, 'null,null', 0, 28500),
(34, 1, '2026-01-10 08:52:39', 38, NULL, NULL, 67, NULL, NULL, 'null,null', 0, 18000),
(35, 1, '2026-01-10 09:30:07', 38, NULL, NULL, 72, NULL, NULL, 'null,null', 0, 38000),
(36, 1, '2026-01-10 09:57:05', 38, NULL, NULL, 75, NULL, NULL, 'null,null', 0, 30500),
(37, 1, '2026-01-12 08:46:12', 38, NULL, NULL, 84, NULL, NULL, 'null,null', 0, 155000),
(38, 1, '2026-01-12 09:15:27', 38, NULL, NULL, 85, NULL, NULL, 'null,null', 0, 23400),
(39, 1, '2026-01-12 09:22:11', 38, NULL, NULL, 12, NULL, NULL, 'null,null', 0, 95000),
(40, 1, '2026-01-12 09:34:19', 38, NULL, NULL, 88, NULL, NULL, 'null,null', 0, 23000),
(41, 1, '2026-01-12 09:55:38', 38, NULL, NULL, 88, NULL, NULL, 'null,null', 0, 134000),
(42, 1, '2026-01-12 10:18:42', 38, NULL, NULL, 90, NULL, NULL, 'null,null', 0, 190000),
(43, 1, '2026-01-12 10:57:44', 38, NULL, NULL, 98, NULL, NULL, 'null,null', 0, 7800),
(44, 1, '2026-01-12 11:38:37', 38, NULL, NULL, 101, NULL, NULL, 'null,null', 0, 18500),
(45, 1, '2026-01-12 14:02:13', 38, NULL, NULL, 103, NULL, NULL, 'null,null', 0, 115000),
(46, 1, '2026-01-12 19:09:41', 38, NULL, NULL, 9, NULL, NULL, 'null,null', 0, 156500),
(47, 1, '2026-01-14 07:50:42', 38, NULL, NULL, 23, NULL, NULL, 'null,null', 0, 95000),
(48, 1, '2026-01-14 07:53:01', 38, NULL, NULL, 23, NULL, NULL, 'null,null', 0, 19000),
(49, 1, '2026-01-14 08:03:26', 38, NULL, NULL, 104, NULL, NULL, 'null,null', 0, 64500),
(50, 1, '2026-01-14 08:53:59', 38, NULL, NULL, 32, NULL, NULL, 'null,null', 0, 39500),
(51, 1, '2026-01-14 09:04:19', 38, NULL, NULL, 33, NULL, NULL, 'null,null', 0, 185000),
(52, 1, '2026-01-14 10:12:24', 38, NULL, NULL, 26, NULL, NULL, 'null,null', 0, 86500),
(53, 1, '2026-01-14 11:11:18', 38, NULL, NULL, 25, NULL, NULL, 'null,null', 0, 47500),
(54, 1, '2026-01-15 07:49:31', 38, NULL, NULL, 107, NULL, NULL, 'null,null', 0, 51000),
(55, 1, '2026-01-15 09:07:56', 38, NULL, NULL, 109, NULL, NULL, 'null,null', 0, 41500),
(56, 1, '2026-01-15 09:53:57', 38, NULL, NULL, 110, NULL, NULL, 'null,null', 0, 17000),
(57, 1, '2026-01-15 11:01:40', 38, NULL, NULL, 111, NULL, NULL, 'null,null', 0, 85000),
(58, 1, '2026-01-15 11:09:56', 38, NULL, NULL, 42, NULL, NULL, 'null,null', 0, 38000),
(59, 1, '2026-01-15 11:36:50', 38, NULL, NULL, 30, NULL, NULL, 'null,null', 0, 95000),
(60, 1, '2026-01-16 09:41:29', 38, NULL, NULL, 8, NULL, NULL, 'null,null', 0, 94500),
(61, 1, '2026-01-16 13:56:38', 38, NULL, NULL, 102, NULL, NULL, 'null,null', 0, 95000),
(62, 1, '2026-01-19 08:37:36', 38, NULL, NULL, 84, NULL, NULL, 'null,null', 0, 69500),
(63, 1, '2026-01-19 08:55:02', 38, NULL, NULL, 66, NULL, NULL, 'null,null', 0, 28500),
(64, 1, '2026-01-19 09:15:15', 38, NULL, NULL, 12, NULL, NULL, 'null,null', 0, 95000),
(65, 1, '2026-01-19 09:21:36', 38, NULL, NULL, 88, NULL, NULL, 'null,null', 0, 15600),
(66, 1, '2026-01-19 09:50:16', 38, NULL, NULL, 89, NULL, NULL, 'null,null', 0, 134000),
(67, 1, '2026-01-19 10:25:16', 38, NULL, NULL, 90, NULL, NULL, 'null,null', 0, 190000),
(68, 1, '2026-01-19 11:20:46', 38, NULL, NULL, 120, NULL, NULL, 'null,null', 0, 15600),
(69, 1, '2026-01-19 14:38:43', 38, NULL, NULL, 121, NULL, NULL, 'null,null', 0, 34000),
(70, 1, '2026-01-20 09:11:21', 38, NULL, NULL, 23, NULL, NULL, 'null,null', 0, 95000),
(71, 1, '2026-01-20 09:24:19', 38, NULL, NULL, 104, NULL, NULL, 'null,null', 0, 47500),
(72, 1, '2026-01-20 09:57:29', 38, NULL, NULL, 26, NULL, NULL, 'null,null', 0, 86500),
(73, 1, '2026-01-20 10:25:40', 38, NULL, NULL, 28, NULL, NULL, 'null,null', 0, 38000),
(74, 1, '2026-01-20 20:11:49', 38, NULL, NULL, 9, NULL, NULL, 'null,null', 0, 190000),
(75, 1, '2026-01-21 09:19:03', 38, NULL, NULL, 32, NULL, NULL, 'null,null', 0, 28500),
(76, 1, '2026-01-21 09:31:50', 38, NULL, NULL, 33, NULL, NULL, 'null,null', 0, 129500),
(77, 1, '2026-01-21 10:21:52', 38, NULL, NULL, 44, NULL, NULL, 'null,null', 0, 85000),
(78, 1, '2026-01-21 11:07:58', 38, NULL, NULL, 19, NULL, NULL, 'null,null', 0, 34000),
(79, 1, '2026-01-22 10:27:42', 38, NULL, NULL, 30, NULL, NULL, 'null,null', 0, 285000),
(80, 1, '2026-01-22 13:17:55', 38, NULL, NULL, 121, NULL, NULL, 'null,null', 0, 34000),
(81, 1, '2026-01-23 08:43:46', 38, NULL, NULL, 8, NULL, NULL, 'null,null', 0, 136000),
(82, 1, '2026-01-23 09:23:24', 38, NULL, NULL, 107, NULL, NULL, 'null,null', 0, 25500),
(83, 1, '2026-01-23 10:17:50', 38, NULL, NULL, 64, NULL, NULL, 'null,null', 0, 135400),
(84, 1, '2026-01-23 10:39:34', 38, NULL, NULL, 65, NULL, NULL, 'null,null', 0, 116000),
(85, 1, '2026-01-26 08:44:35', 38, NULL, NULL, 9, NULL, NULL, 'null,null', 0, 90000),
(86, 1, '2026-01-26 09:08:50', 38, NULL, NULL, 12, NULL, NULL, 'null,null', 0, 95000),
(87, 1, '2026-01-26 09:37:20', 38, NULL, NULL, 89, NULL, NULL, 'null,null', 0, 105000),
(88, 1, '2026-01-26 10:08:28', 38, NULL, NULL, 90, NULL, NULL, 'null,null', 0, 209000),
(89, 1, '2026-01-26 11:13:40', 38, NULL, NULL, 13, NULL, NULL, 'null,null', 0, 51000),
(90, 1, '2026-03-20 00:45:55', 31, NULL, NULL, 7, NULL, NULL, 'null,null', 0, 94500);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_agen_sales`
--

DROP TABLE IF EXISTS `jurnal_agen_sales`;
CREATE TABLE IF NOT EXISTS `jurnal_agen_sales` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agen_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `retail_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `jurnal_id` int(10) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jurnal_agen_sales_relation_1` (`jurnal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_agen_sales`
--

INSERT INTO `jurnal_agen_sales` (`id`, `agen_id`, `product_id`, `retail_id`, `count`, `price`, `subtotal`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`, `company_id`, `jurnal_id`, `product_name`) VALUES
(6, NULL, 18, NULL, 3, 24000, -72000, 'out', NULL, '2025-12-18 14:31:51', NULL, NULL, NULL, 1, 6, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(7, NULL, 13, NULL, 1, 15500, -15500, 'out', NULL, '2025-12-18 14:32:15', NULL, NULL, NULL, 1, 7, 'DJAVA FILTER-(12)'),
(8, NULL, 18, NULL, 1, 24000, -24000, 'out', NULL, '2025-12-18 14:32:15', NULL, NULL, NULL, 1, 7, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(9, NULL, 13, NULL, 1, 15500, -15500, 'out', NULL, '2025-12-18 14:40:14', NULL, NULL, NULL, 1, 8, 'DJAVA FILTER-(12)'),
(10, NULL, 18, NULL, 3, 24000, -72000, 'out', NULL, '2025-12-18 14:40:14', NULL, NULL, NULL, 1, 8, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(11, NULL, 10, NULL, 10, 9000, -90000, 'out', NULL, '2026-01-05 00:59:26', NULL, NULL, NULL, 1, 9, 'OCHA GUAVA-(12)'),
(12, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-05 02:04:58', NULL, NULL, NULL, 1, 10, 'DJAVA HIJAU-(16)'),
(13, NULL, 2, NULL, 15, 9500, -142500, 'out', NULL, '2026-01-05 02:51:00', NULL, NULL, NULL, 1, 11, 'DJAVA HIJAU-(16)'),
(14, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-05 03:23:17', NULL, NULL, NULL, 1, 12, 'DJAVA HIJAU-(16)'),
(15, NULL, 10, NULL, 3, 9000, -27000, 'out', NULL, '2026-01-06 01:32:00', NULL, NULL, NULL, 1, 13, 'OCHA GUAVA-(12)'),
(16, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-06 01:59:21', NULL, NULL, NULL, 1, 14, 'DJAVA HIJAU-(16)'),
(17, NULL, 2, NULL, 5, 9500, -47500, 'out', NULL, '2026-01-06 02:42:29', NULL, NULL, NULL, 1, 15, 'DJAVA HIJAU-(16)'),
(18, NULL, 3, NULL, 5, 9500, -47500, 'out', NULL, '2026-01-06 03:06:39', NULL, NULL, NULL, 1, 16, 'LENTERA-(16)'),
(19, NULL, 2, NULL, 5, 9500, -47500, 'out', NULL, '2026-01-06 03:06:39', NULL, NULL, NULL, 1, 16, 'DJAVA HIJAU-(16)'),
(20, NULL, 17, NULL, 2, 17000, -34000, 'out', NULL, '2026-01-06 03:30:19', NULL, NULL, NULL, 1, 17, 'DJAVA MILD BLUE-(16)'),
(21, NULL, 17, NULL, 3, 17000, -51000, 'out', NULL, '2026-01-06 03:38:12', NULL, NULL, NULL, 1, 18, 'DJAVA MILD BLUE-(16)'),
(22, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-06 04:06:14', NULL, NULL, NULL, 1, 19, 'DJAVA HIJAU-(16)'),
(23, NULL, 3, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-06 04:06:14', NULL, NULL, NULL, 1, 19, 'LENTERA-(16)'),
(24, NULL, 16, NULL, 20, 18500, -370000, 'out', NULL, '2026-01-07 01:38:08', NULL, NULL, NULL, 1, 20, 'LAKSAMANA-(20)'),
(25, NULL, 18, NULL, 1, 24000, -24000, 'out', NULL, '2026-01-07 02:19:38', NULL, NULL, NULL, 1, 21, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(26, NULL, 17, NULL, 1, 17000, -17000, 'out', NULL, '2026-01-07 02:19:38', NULL, NULL, NULL, 1, 21, 'DJAVA MILD BLUE-(16)'),
(27, NULL, 13, NULL, 1, 15500, -15500, 'out', NULL, '2026-01-07 02:19:38', NULL, NULL, NULL, 1, 21, 'DJAVA FILTER-(12)'),
(28, NULL, 17, NULL, 2, 17000, -34000, 'out', NULL, '2026-01-07 03:01:47', NULL, NULL, NULL, 1, 22, 'DJAVA MILD BLUE-(16)'),
(29, NULL, 17, NULL, 3, 17000, -51000, 'out', NULL, '2026-01-07 03:19:32', NULL, NULL, NULL, 1, 23, 'DJAVA MILD BLUE-(16)'),
(30, NULL, 5, NULL, 10, 11500, -115000, 'out', NULL, '2026-01-07 06:39:16', NULL, NULL, NULL, 1, 24, 'DJAVA PREMIUM GOLD-(12)'),
(31, NULL, 17, NULL, 10, 17000, -170000, 'out', NULL, '2026-01-07 09:47:42', NULL, NULL, NULL, 1, 25, 'DJAVA MILD BLUE-(16)'),
(32, NULL, 5, NULL, 2, 11500, -23000, 'out', NULL, '2026-01-08 02:53:46', NULL, NULL, NULL, 1, 26, 'DJAVA PREMIUM GOLD-(12)'),
(33, NULL, 3, NULL, 2, 9500, -19000, 'out', NULL, '2026-01-08 02:53:46', NULL, NULL, NULL, 1, 26, 'LENTERA-(16)'),
(34, NULL, 2, NULL, 2, 9500, -19000, 'out', NULL, '2026-01-08 02:53:46', NULL, NULL, NULL, 1, 26, 'DJAVA HIJAU-(16)'),
(35, NULL, 10, NULL, 5, 9000, -45000, 'out', NULL, '2026-01-08 03:11:11', NULL, NULL, NULL, 1, 27, 'OCHA GUAVA-(12)'),
(36, NULL, 3, NULL, 5, 9500, -47500, 'out', NULL, '2026-01-08 03:11:11', NULL, NULL, NULL, 1, 27, 'LENTERA-(16)'),
(37, NULL, 17, NULL, 1, 17000, -17000, 'out', NULL, '2026-01-08 03:29:47', NULL, NULL, NULL, 1, 28, 'DJAVA MILD BLUE-(16)'),
(38, NULL, 2, NULL, 1, 9500, -9500, 'out', NULL, '2026-01-08 03:29:47', NULL, NULL, NULL, 1, 28, 'DJAVA HIJAU-(16)'),
(39, NULL, 15, NULL, 1, 15500, -15500, 'out', NULL, '2026-01-09 00:46:12', NULL, NULL, NULL, 1, 29, 'LAKSAMANA-(12)'),
(40, NULL, 18, NULL, 1, 24000, -24000, 'out', NULL, '2026-01-09 01:48:49', NULL, NULL, NULL, 1, 30, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(41, NULL, 17, NULL, 2, 17000, -34000, 'out', NULL, '2026-01-09 01:50:37', NULL, NULL, NULL, 1, 31, 'DJAVA MILD BLUE-(16)'),
(42, NULL, 18, NULL, 2, 24000, -48000, 'out', NULL, '2026-01-09 02:27:45', NULL, NULL, NULL, 1, 32, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(43, NULL, 20, NULL, 1, 25500, -25500, 'out', NULL, '2026-01-09 02:27:45', NULL, NULL, NULL, 1, 32, 'KING DJAVA CLASSIC-(20)'),
(44, NULL, 13, NULL, 2, 15500, -31000, 'out', NULL, '2026-01-09 02:27:45', NULL, NULL, NULL, 1, 32, 'DJAVA FILTER-(12)'),
(45, NULL, 2, NULL, 3, 9500, -28500, 'out', NULL, '2026-01-10 01:48:17', NULL, NULL, NULL, 1, 33, 'DJAVA HIJAU-(16)'),
(46, NULL, 9, NULL, 1, 9000, -9000, 'out', NULL, '2026-01-10 01:52:39', NULL, NULL, NULL, 1, 34, 'OCHA MANGO-(12)'),
(47, NULL, 10, NULL, 1, 9000, -9000, 'out', NULL, '2026-01-10 01:52:39', NULL, NULL, NULL, 1, 34, 'OCHA GUAVA-(12)'),
(48, NULL, 3, NULL, 2, 9500, -19000, 'out', NULL, '2026-01-10 02:30:07', NULL, NULL, NULL, 1, 35, 'LENTERA-(16)'),
(49, NULL, 2, NULL, 2, 9500, -19000, 'out', NULL, '2026-01-10 02:30:07', NULL, NULL, NULL, 1, 35, 'DJAVA HIJAU-(16)'),
(50, NULL, 5, NULL, 1, 11500, -11500, 'out', NULL, '2026-01-10 02:57:05', NULL, NULL, NULL, 1, 36, 'DJAVA PREMIUM GOLD-(12)'),
(51, NULL, 3, NULL, 1, 9500, -9500, 'out', NULL, '2026-01-10 02:57:05', NULL, NULL, NULL, 1, 36, 'LENTERA-(16)'),
(52, NULL, 2, NULL, 1, 9500, -9500, 'out', NULL, '2026-01-10 02:57:05', NULL, NULL, NULL, 1, 36, 'DJAVA HIJAU-(16)'),
(53, NULL, 13, NULL, 10, 15500, -155000, 'out', NULL, '2026-01-12 01:46:12', NULL, NULL, NULL, 1, 37, 'DJAVA FILTER-(12)'),
(54, NULL, 1, NULL, 3, 7800, -23400, 'out', NULL, '2026-01-12 02:15:27', NULL, NULL, NULL, 1, 38, 'DJAVA HIJAU-(12)'),
(55, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-12 02:22:11', NULL, NULL, NULL, 1, 39, 'DJAVA HIJAU-(16)'),
(56, NULL, 5, NULL, 2, 11500, -23000, 'out', NULL, '2026-01-12 02:34:19', NULL, NULL, NULL, 1, 40, 'DJAVA PREMIUM GOLD-(12)'),
(57, NULL, 22, NULL, 2, 9500, -19000, 'out', NULL, '2026-01-12 02:55:38', NULL, NULL, NULL, 1, 41, 'OCHA APPLE ICE SKT (12)'),
(58, NULL, 5, NULL, 10, 11500, -115000, 'out', NULL, '2026-01-12 02:55:38', NULL, NULL, NULL, 1, 41, 'DJAVA PREMIUM GOLD-(12)'),
(59, NULL, 2, NULL, 20, 9500, -190000, 'out', NULL, '2026-01-12 03:18:42', NULL, NULL, NULL, 1, 42, 'DJAVA HIJAU-(16)'),
(60, NULL, 1, NULL, 1, 7800, -7800, 'out', NULL, '2026-01-12 03:57:44', NULL, NULL, NULL, 1, 43, 'DJAVA HIJAU-(12)'),
(61, NULL, 22, NULL, 1, 9500, -9500, 'out', NULL, '2026-01-12 04:38:37', NULL, NULL, NULL, 1, 44, 'OCHA APPLE ICE SKT (12)'),
(62, NULL, 10, NULL, 1, 9000, -9000, 'out', NULL, '2026-01-12 04:38:37', NULL, NULL, NULL, 1, 44, 'OCHA GUAVA-(12)'),
(63, NULL, 5, NULL, 10, 11500, -115000, 'out', NULL, '2026-01-12 07:02:13', NULL, NULL, NULL, 1, 45, 'DJAVA PREMIUM GOLD-(12)'),
(64, NULL, 22, NULL, 7, 9500, -66500, 'out', NULL, '2026-01-12 12:09:41', NULL, NULL, NULL, 1, 46, 'OCHA APPLE ICE SKT (12)'),
(65, NULL, 10, NULL, 10, 9000, -90000, 'out', NULL, '2026-01-12 12:09:41', NULL, NULL, NULL, 1, 46, 'OCHA GUAVA-(12)'),
(66, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-14 00:50:42', NULL, NULL, NULL, 1, 47, 'DJAVA HIJAU-(16)'),
(67, NULL, 22, NULL, 2, 9500, -19000, 'out', NULL, '2026-01-14 00:53:01', NULL, NULL, NULL, 1, 48, 'OCHA APPLE ICE SKT (12)'),
(68, NULL, 22, NULL, 3, 9500, -28500, 'out', NULL, '2026-01-14 01:03:26', NULL, NULL, NULL, 1, 49, 'OCHA APPLE ICE SKT (12)'),
(69, NULL, 9, NULL, 2, 9000, -18000, 'out', NULL, '2026-01-14 01:03:26', NULL, NULL, NULL, 1, 49, 'OCHA MANGO-(12)'),
(70, NULL, 10, NULL, 2, 9000, -18000, 'out', NULL, '2026-01-14 01:03:26', NULL, NULL, NULL, 1, 49, 'OCHA GUAVA-(12)'),
(71, NULL, 22, NULL, 2, 9500, -19000, 'out', NULL, '2026-01-14 01:53:59', NULL, NULL, NULL, 1, 50, 'OCHA APPLE ICE SKT (12)'),
(72, NULL, 5, NULL, 1, 11500, -11500, 'out', NULL, '2026-01-14 01:53:59', NULL, NULL, NULL, 1, 50, 'DJAVA PREMIUM GOLD-(12)'),
(73, NULL, 10, NULL, 1, 9000, -9000, 'out', NULL, '2026-01-14 01:53:59', NULL, NULL, NULL, 1, 50, 'OCHA GUAVA-(12)'),
(74, NULL, 16, NULL, 10, 18500, -185000, 'out', NULL, '2026-01-14 02:04:19', NULL, NULL, NULL, 1, 51, 'LAKSAMANA-(20)'),
(75, NULL, 2, NULL, 5, 9500, -47500, 'out', NULL, '2026-01-14 03:12:24', NULL, NULL, NULL, 1, 52, 'DJAVA HIJAU-(16)'),
(76, NULL, 1, NULL, 5, 7800, -39000, 'out', NULL, '2026-01-14 03:12:24', NULL, NULL, NULL, 1, 52, 'DJAVA HIJAU-(12)'),
(77, NULL, 2, NULL, 5, 9500, -47500, 'out', NULL, '2026-01-14 04:11:18', NULL, NULL, NULL, 1, 53, 'DJAVA HIJAU-(16)'),
(78, NULL, 17, NULL, 3, 17000, -51000, 'out', NULL, '2026-01-15 00:49:31', NULL, NULL, NULL, 1, 54, 'DJAVA MILD BLUE-(16)'),
(79, NULL, 5, NULL, 2, 11500, -23000, 'out', NULL, '2026-01-15 02:07:56', NULL, NULL, NULL, 1, 55, 'DJAVA PREMIUM GOLD-(12)'),
(80, NULL, 22, NULL, 1, 9500, -9500, 'out', NULL, '2026-01-15 02:07:56', NULL, NULL, NULL, 1, 55, 'OCHA APPLE ICE SKT (12)'),
(81, NULL, 10, NULL, 1, 9000, -9000, 'out', NULL, '2026-01-15 02:07:56', NULL, NULL, NULL, 1, 55, 'OCHA GUAVA-(12)'),
(82, NULL, 17, NULL, 1, 17000, -17000, 'out', NULL, '2026-01-15 02:53:57', NULL, NULL, NULL, 1, 56, 'DJAVA MILD BLUE-(16)'),
(83, NULL, 17, NULL, 5, 17000, -85000, 'out', NULL, '2026-01-15 04:01:40', NULL, NULL, NULL, 1, 57, 'DJAVA MILD BLUE-(16)'),
(84, NULL, 2, NULL, 4, 9500, -38000, 'out', NULL, '2026-01-15 04:09:56', NULL, NULL, NULL, 1, 58, 'DJAVA HIJAU-(16)'),
(85, NULL, 3, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-15 04:36:50', NULL, NULL, NULL, 1, 59, 'LENTERA-(16)'),
(86, NULL, 17, NULL, 5, 17000, -85000, 'out', NULL, '2026-01-16 02:41:29', NULL, NULL, NULL, 1, 60, 'DJAVA MILD BLUE-(16)'),
(87, NULL, 2, NULL, 1, 9500, -9500, 'out', NULL, '2026-01-16 02:41:29', NULL, NULL, NULL, 1, 60, 'DJAVA HIJAU-(16)'),
(88, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-16 06:56:38', NULL, NULL, NULL, 1, 61, 'DJAVA HIJAU-(16)'),
(89, NULL, 16, NULL, 2, 18500, -37000, 'out', NULL, '2026-01-19 01:37:36', NULL, NULL, NULL, 1, 62, 'LAKSAMANA-(20)'),
(90, NULL, 15, NULL, 1, 15500, -15500, 'out', NULL, '2026-01-19 01:37:36', NULL, NULL, NULL, 1, 62, 'LAKSAMANA-(12)'),
(91, NULL, 17, NULL, 1, 17000, -17000, 'out', NULL, '2026-01-19 01:37:36', NULL, NULL, NULL, 1, 62, 'DJAVA MILD BLUE-(16)'),
(92, NULL, 2, NULL, 3, 9500, -28500, 'out', NULL, '2026-01-19 01:55:02', NULL, NULL, NULL, 1, 63, 'DJAVA HIJAU-(16)'),
(93, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-19 02:15:15', NULL, NULL, NULL, 1, 64, 'DJAVA HIJAU-(16)'),
(94, NULL, 1, NULL, 2, 7800, -15600, 'out', NULL, '2026-01-19 02:21:36', NULL, NULL, NULL, 1, 65, 'DJAVA HIJAU-(12)'),
(95, NULL, 5, NULL, 10, 11500, -115000, 'out', NULL, '2026-01-19 02:50:16', NULL, NULL, NULL, 1, 66, 'DJAVA PREMIUM GOLD-(12)'),
(96, NULL, 22, NULL, 2, 9500, -19000, 'out', NULL, '2026-01-19 02:50:16', NULL, NULL, NULL, 1, 66, 'OCHA APPLE ICE SKT (12)'),
(97, NULL, 2, NULL, 20, 9500, -190000, 'out', NULL, '2026-01-19 03:25:16', NULL, NULL, NULL, 1, 67, 'DJAVA HIJAU-(16)'),
(98, NULL, 1, NULL, 2, 7800, -15600, 'out', NULL, '2026-01-19 04:20:46', NULL, NULL, NULL, 1, 68, 'DJAVA HIJAU-(12)'),
(99, NULL, 17, NULL, 2, 17000, -34000, 'out', NULL, '2026-01-19 07:38:43', NULL, NULL, NULL, 1, 69, 'DJAVA MILD BLUE-(16)'),
(100, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-20 02:11:21', NULL, NULL, NULL, 1, 70, 'DJAVA HIJAU-(16)'),
(101, NULL, 22, NULL, 4, 9500, -38000, 'out', NULL, '2026-01-20 02:24:19', NULL, NULL, NULL, 1, 71, 'OCHA APPLE ICE SKT (12)'),
(102, NULL, 2, NULL, 1, 9500, -9500, 'out', NULL, '2026-01-20 02:24:19', NULL, NULL, NULL, 1, 71, 'DJAVA HIJAU-(16)'),
(103, NULL, 2, NULL, 5, 9500, -47500, 'out', NULL, '2026-01-20 02:57:29', NULL, NULL, NULL, 1, 72, 'DJAVA HIJAU-(16)'),
(104, NULL, 1, NULL, 5, 7800, -39000, 'out', NULL, '2026-01-20 02:57:29', NULL, NULL, NULL, 1, 72, 'DJAVA HIJAU-(12)'),
(105, NULL, 22, NULL, 4, 9500, -38000, 'out', NULL, '2026-01-20 03:25:40', NULL, NULL, NULL, 1, 73, 'OCHA APPLE ICE SKT (12)'),
(106, NULL, 22, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-20 13:11:49', NULL, NULL, NULL, 1, 74, 'OCHA APPLE ICE SKT (12)'),
(107, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-20 13:11:49', NULL, NULL, NULL, 1, 74, 'DJAVA HIJAU-(16)'),
(108, NULL, 22, NULL, 3, 9500, -28500, 'out', NULL, '2026-01-21 02:19:03', NULL, NULL, NULL, 1, 75, 'OCHA APPLE ICE SKT (12)'),
(109, NULL, 16, NULL, 7, 18500, -129500, 'out', NULL, '2026-01-21 02:31:50', NULL, NULL, NULL, 1, 76, 'LAKSAMANA-(20)'),
(110, NULL, 17, NULL, 5, 17000, -85000, 'out', NULL, '2026-01-21 03:21:52', NULL, NULL, NULL, 1, 77, 'DJAVA MILD BLUE-(16)'),
(111, NULL, 17, NULL, 2, 17000, -34000, 'out', NULL, '2026-01-21 04:07:58', NULL, NULL, NULL, 1, 78, 'DJAVA MILD BLUE-(16)'),
(112, NULL, 3, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-22 03:27:42', NULL, NULL, NULL, 1, 79, 'LENTERA-(16)'),
(113, NULL, 2, NULL, 20, 9500, -190000, 'out', NULL, '2026-01-22 03:27:42', NULL, NULL, NULL, 1, 79, 'DJAVA HIJAU-(16)'),
(114, NULL, 17, NULL, 2, 17000, -34000, 'out', NULL, '2026-01-22 06:17:55', NULL, NULL, NULL, 1, 80, 'DJAVA MILD BLUE-(16)'),
(115, NULL, 17, NULL, 8, 17000, -136000, 'out', NULL, '2026-01-23 01:43:46', NULL, NULL, NULL, 1, 81, 'DJAVA MILD BLUE-(16)'),
(116, NULL, 20, NULL, 1, 25500, -25500, 'out', NULL, '2026-01-23 02:23:24', NULL, NULL, NULL, 1, 82, 'KING DJAVA CLASSIC-(20)'),
(117, NULL, 22, NULL, 4, 9500, -38000, 'out', NULL, '2026-01-23 03:17:50', NULL, NULL, NULL, 1, 83, 'OCHA APPLE ICE SKT (12)'),
(118, NULL, 10, NULL, 4, 9000, -36000, 'out', NULL, '2026-01-23 03:17:50', NULL, NULL, NULL, 1, 83, 'OCHA GUAVA-(12)'),
(119, NULL, 2, NULL, 4, 9500, -38000, 'out', NULL, '2026-01-23 03:17:50', NULL, NULL, NULL, 1, 83, 'DJAVA HIJAU-(16)'),
(120, NULL, 1, NULL, 3, 7800, -23400, 'out', NULL, '2026-01-23 03:17:50', NULL, NULL, NULL, 1, 83, 'DJAVA HIJAU-(12)'),
(121, NULL, 17, NULL, 5, 17000, -85000, 'out', NULL, '2026-01-23 03:39:34', NULL, NULL, NULL, 1, 84, 'DJAVA MILD BLUE-(16)'),
(122, NULL, 13, NULL, 2, 15500, -31000, 'out', NULL, '2026-01-23 03:39:34', NULL, NULL, NULL, 1, 84, 'DJAVA FILTER-(12)'),
(123, NULL, 10, NULL, 10, 9000, -90000, 'out', NULL, '2026-01-26 01:44:35', NULL, NULL, NULL, 1, 85, 'OCHA GUAVA-(12)'),
(124, NULL, 2, NULL, 10, 9500, -95000, 'out', NULL, '2026-01-26 02:08:50', NULL, NULL, NULL, 1, 86, 'DJAVA HIJAU-(16)'),
(125, NULL, 22, NULL, 5, 9500, -47500, 'out', NULL, '2026-01-26 02:37:20', NULL, NULL, NULL, 1, 87, 'OCHA APPLE ICE SKT (12)'),
(126, NULL, 5, NULL, 5, 11500, -57500, 'out', NULL, '2026-01-26 02:37:20', NULL, NULL, NULL, 1, 87, 'DJAVA PREMIUM GOLD-(12)'),
(127, NULL, 3, NULL, 2, 9500, -19000, 'out', NULL, '2026-01-26 03:08:28', NULL, NULL, NULL, 1, 88, 'LENTERA-(16)'),
(128, NULL, 2, NULL, 20, 9500, -190000, 'out', NULL, '2026-01-26 03:08:28', NULL, NULL, NULL, 1, 88, 'DJAVA HIJAU-(16)'),
(129, NULL, 17, NULL, 3, 17000, -51000, 'out', NULL, '2026-01-26 04:13:40', NULL, NULL, NULL, 1, 89, 'DJAVA MILD BLUE-(16)'),
(130, NULL, 18, NULL, 2, 24000, -48000, 'out', NULL, '2026-03-19 17:45:55', NULL, NULL, NULL, 1, 90, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(131, NULL, 13, NULL, 3, 15500, -46500, 'out', NULL, '2026-03-19 17:45:55', NULL, NULL, NULL, 1, 90, 'DJAVA FILTER-(12)');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_inquiry_agen`
--

DROP TABLE IF EXISTS `jurnal_inquiry_agen`;
CREATE TABLE IF NOT EXISTS `jurnal_inquiry_agen` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'draft',
  `total_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_inquiry_agen`
--

INSERT INTO `jurnal_inquiry_agen` (`id`, `company_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `description`, `agen_id`, `status`, `total_price`) VALUES
(1, 1, '2025-12-18 14:10:57', 30, NULL, NULL, NULL, 31, 'draft', NULL),
(2, 1, '2025-12-19 05:20:31', 30, NULL, NULL, '', 31, 'diterima', NULL),
(3, 1, '2026-01-02 10:30:07', 30, NULL, NULL, '', 38, 'diterima', NULL),
(4, 1, '2026-01-06 08:31:05', 30, NULL, NULL, '', 38, 'diterima', NULL),
(5, 1, '2026-01-07 06:59:21', 30, NULL, NULL, '', 38, 'diterima', NULL),
(6, 1, '2026-01-07 14:39:59', 30, NULL, NULL, '', 38, 'diterima', NULL),
(7, 1, '2026-01-08 08:40:29', 30, NULL, NULL, '', 38, 'diterima', NULL),
(8, 1, '2026-01-12 08:41:26', 30, NULL, NULL, '', 38, 'diterima', NULL),
(9, 1, '2026-01-14 08:12:16', 30, NULL, NULL, '', 38, 'diterima', NULL),
(10, 1, '2026-01-16 08:38:38', 30, NULL, NULL, '', 38, 'diterima', NULL),
(11, 1, '2026-01-19 07:38:03', 30, NULL, NULL, '', 38, 'diterima', NULL),
(12, 1, '2026-01-20 08:14:42', 30, NULL, NULL, '', 38, 'diterima', NULL),
(13, 1, '2026-01-20 20:10:55', 30, NULL, NULL, '', 38, 'diterima', NULL),
(14, 1, '2026-01-21 08:35:50', 30, NULL, NULL, '', 38, 'diterima', NULL),
(15, 1, '2026-01-26 08:46:22', 30, NULL, NULL, '', 38, 'diterima', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_inquiry_detail`
--

DROP TABLE IF EXISTS `jurnal_inquiry_detail`;
CREATE TABLE IF NOT EXISTS `jurnal_inquiry_detail` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `agen_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `jurnal_id` int(10) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentindex_2_inquiry` (`jurnal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_inquiry_detail`
--

INSERT INTO `jurnal_inquiry_detail` (`id`, `agen_id`, `product_id`, `count`, `price`, `subtotal`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`, `company_id`, `jurnal_id`, `product_name`) VALUES
(1, NULL, 18, 20, NULL, NULL, NULL, 30, '2025-12-18 14:10:57', NULL, NULL, NULL, 1, 1, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(2, NULL, 13, 10, NULL, NULL, NULL, 30, '2025-12-18 14:14:50', NULL, NULL, NULL, 1, 2, 'DJAVA FILTER-(12)'),
(3, NULL, 18, 20, NULL, NULL, NULL, 30, '2025-12-18 14:14:50', NULL, NULL, NULL, 1, 2, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(4, NULL, 2, 51, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'DJAVA HIJAU-(16)'),
(5, NULL, 3, 18, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'LENTERA-(16)'),
(6, NULL, 1, 21, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'DJAVA HIJAU-(12)'),
(7, NULL, 10, 10, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'OCHA GUAVA-(12)'),
(8, NULL, 9, 14, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'OCHA MANGO-(12)'),
(9, NULL, 13, 16, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'DJAVA FILTER-(12)'),
(10, NULL, 15, 19, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'LAKSAMANA-(12)'),
(11, NULL, 20, 5, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'KING DJAVA CLASSIC-(20)'),
(12, NULL, 17, 13, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'DJAVA MILD BLUE-(16)'),
(13, NULL, 18, 15, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(14, NULL, 5, 17, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'DJAVA PREMIUM GOLD-(12)'),
(15, NULL, 16, 11, NULL, NULL, NULL, 30, '2026-01-02 03:29:03', NULL, NULL, NULL, 1, 3, 'LAKSAMANA-(20)'),
(16, NULL, 2, 16, NULL, NULL, NULL, 30, '2026-01-06 01:27:01', NULL, NULL, NULL, 1, 4, 'DJAVA HIJAU-(16)'),
(17, NULL, 10, 19, NULL, NULL, NULL, 30, '2026-01-06 01:27:01', NULL, NULL, NULL, 1, 4, 'OCHA GUAVA-(12)'),
(18, NULL, 2, 30, NULL, NULL, NULL, 30, '2026-01-06 23:18:51', NULL, NULL, NULL, 1, 5, 'DJAVA HIJAU-(16)'),
(19, NULL, 16, 20, NULL, NULL, NULL, 30, '2026-01-06 23:18:51', NULL, NULL, NULL, 1, 5, 'LAKSAMANA-(20)'),
(20, NULL, 3, 20, NULL, NULL, NULL, 30, '2026-01-06 23:18:51', NULL, NULL, NULL, 1, 5, 'LENTERA-(16)'),
(21, NULL, 17, 10, NULL, NULL, NULL, 30, '2026-01-07 07:38:59', NULL, NULL, NULL, 1, 6, 'DJAVA MILD BLUE-(16)'),
(22, NULL, 5, 10, NULL, NULL, NULL, 30, '2026-01-07 07:38:59', NULL, NULL, NULL, 1, 6, 'DJAVA PREMIUM GOLD-(12)'),
(23, NULL, 17, 10, NULL, NULL, NULL, 30, '2026-01-08 01:04:53', NULL, NULL, NULL, 1, 7, 'DJAVA MILD BLUE-(16)'),
(24, NULL, 2, 20, NULL, NULL, NULL, 30, '2026-01-12 01:15:42', NULL, NULL, NULL, 1, 8, 'DJAVA HIJAU-(16)'),
(25, NULL, 3, 10, NULL, NULL, NULL, 30, '2026-01-12 01:15:42', NULL, NULL, NULL, 1, 8, 'LENTERA-(16)'),
(26, NULL, 10, 20, NULL, NULL, NULL, 30, '2026-01-12 01:15:42', NULL, NULL, NULL, 1, 8, 'OCHA GUAVA-(12)'),
(27, NULL, 22, 20, NULL, NULL, NULL, 30, '2026-01-12 01:15:42', NULL, NULL, NULL, 1, 8, 'OCHA APPLE ICE SKT (12)'),
(28, NULL, 5, 10, NULL, NULL, NULL, 30, '2026-01-12 01:15:42', NULL, NULL, NULL, 1, 8, 'DJAVA PREMIUM GOLD-(12)'),
(29, NULL, 13, 10, NULL, NULL, NULL, 30, '2026-01-12 01:15:42', NULL, NULL, NULL, 1, 8, 'DJAVA FILTER-(12)'),
(30, NULL, 17, 10, NULL, NULL, NULL, 30, '2026-01-12 01:15:42', NULL, NULL, NULL, 1, 8, 'DJAVA MILD BLUE-(16)'),
(31, NULL, 5, 10, NULL, NULL, NULL, 30, '2026-01-14 01:10:16', NULL, NULL, NULL, 1, 9, 'DJAVA PREMIUM GOLD-(12)'),
(32, NULL, 2, 20, NULL, NULL, NULL, 30, '2026-01-14 01:10:16', NULL, NULL, NULL, 1, 9, 'DJAVA HIJAU-(16)'),
(33, NULL, 16, 20, NULL, NULL, NULL, 30, '2026-01-14 01:10:16', NULL, NULL, NULL, 1, 9, 'LAKSAMANA-(20)'),
(34, NULL, 22, 10, NULL, NULL, NULL, 30, '2026-01-14 01:10:16', NULL, NULL, NULL, 1, 9, 'OCHA APPLE ICE SKT (12)'),
(35, NULL, 17, 20, NULL, NULL, NULL, 30, '2026-01-16 01:31:14', NULL, NULL, NULL, 1, 10, 'DJAVA MILD BLUE-(16)'),
(36, NULL, 2, 25, NULL, NULL, NULL, 30, '2026-01-16 01:31:14', NULL, NULL, NULL, 1, 10, 'DJAVA HIJAU-(16)'),
(37, NULL, 5, 20, NULL, NULL, NULL, 30, '2026-01-18 22:05:58', NULL, NULL, NULL, 1, 11, 'DJAVA PREMIUM GOLD-(12)'),
(38, NULL, 2, 20, NULL, NULL, NULL, 30, '2026-01-18 22:05:58', NULL, NULL, NULL, 1, 11, 'DJAVA HIJAU-(16)'),
(39, NULL, 3, 10, NULL, NULL, NULL, 30, '2026-01-18 22:05:58', NULL, NULL, NULL, 1, 11, 'LENTERA-(16)'),
(40, NULL, 10, 10, NULL, NULL, NULL, 30, '2026-01-18 22:05:58', NULL, NULL, NULL, 1, 11, 'OCHA GUAVA-(12)'),
(41, NULL, 2, 40, NULL, NULL, NULL, 30, '2026-01-20 01:13:29', NULL, NULL, NULL, 1, 12, 'DJAVA HIJAU-(16)'),
(42, NULL, 22, 10, NULL, NULL, NULL, 30, '2026-01-20 13:06:09', NULL, NULL, NULL, 1, 13, 'OCHA APPLE ICE SKT (12)'),
(43, NULL, 22, 20, NULL, NULL, NULL, 30, '2026-01-21 01:05:56', NULL, NULL, NULL, 1, 14, 'OCHA APPLE ICE SKT (12)'),
(44, NULL, 20, 10, NULL, NULL, NULL, 30, '2026-01-21 01:05:56', NULL, NULL, NULL, 1, 14, 'KING DJAVA CLASSIC-(20)'),
(45, NULL, 5, 10, NULL, NULL, NULL, 30, '2026-01-26 00:56:57', NULL, NULL, NULL, 1, 15, 'DJAVA PREMIUM GOLD-(12)'),
(46, NULL, 17, 30, NULL, NULL, NULL, 30, '2026-01-26 00:56:57', NULL, NULL, NULL, 1, 15, 'DJAVA MILD BLUE-(16)'),
(47, NULL, 2, 30, NULL, NULL, NULL, 30, '2026-01-26 00:56:57', NULL, NULL, NULL, 1, 15, 'DJAVA HIJAU-(16)'),
(48, NULL, 3, 10, NULL, NULL, NULL, 30, '2026-01-26 00:56:57', NULL, NULL, NULL, 1, 15, 'LENTERA-(16)'),
(49, NULL, 22, 10, NULL, NULL, NULL, 30, '2026-01-26 00:56:57', NULL, NULL, NULL, 1, 15, 'OCHA APPLE ICE SKT (12)');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_return_agen`
--

DROP TABLE IF EXISTS `jurnal_return_agen`;
CREATE TABLE IF NOT EXISTS `jurnal_return_agen` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_stock_warehouse`
--

DROP TABLE IF EXISTS `jurnal_stock_warehouse`;
CREATE TABLE IF NOT EXISTS `jurnal_stock_warehouse` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_stock_warehouse`
--

INSERT INTO `jurnal_stock_warehouse` (`id`, `description`, `warehouse_id`, `company_id`, `total`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`) VALUES
(3, NULL, 2, 1, 32838350, 'diterima', 30, '2026-01-02 03:22:25', 30, '2026-01-02 03:24:46', NULL),
(4, NULL, 2, 1, 2410000, 'diterima', 30, '2026-01-12 01:12:08', 30, '2026-01-12 01:13:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_stock_warehouse_detail`
--

DROP TABLE IF EXISTS `jurnal_stock_warehouse_detail`;
CREATE TABLE IF NOT EXISTS `jurnal_stock_warehouse_detail` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `jurnal_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_stock_warehouse_detail`
--

INSERT INTO `jurnal_stock_warehouse_detail` (`id`, `jurnal_id`, `company_id`, `product_id`, `product_name`, `count`, `price`, `subtotal`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`) VALUES
(4, 3, 1, 2, 'DJAVA HIJAU-(16)', 451, 8300, 3743300, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(5, 3, 1, 1, 'DJAVA HIJAU-(12)', 131, 6650, 871150, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(6, 3, 1, 3, 'LENTERA-(16)', 258, 8300, 2141400, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(7, 3, 1, 10, 'OCHA GUAVA-(12)', 40, 8000, 320000, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(8, 3, 1, 9, 'OCHA MANGO-(12)', 134, 8000, 1072000, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(9, 3, 1, 5, 'DJAVA PREMIUM GOLD-(12)', 167, 10500, 1753500, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(10, 3, 1, 18, 'DJAVA FLAVOUR BLUEBERRY-(16)', 94, 23000, 2162000, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(11, 3, 1, 17, 'DJAVA MILD BLUE-(16)', 243, 22000, 5346000, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(12, 3, 1, 13, 'DJAVA FILTER-(12)', 186, 14500, 2697000, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(13, 3, 1, 15, 'LAKSAMANA-(12)', 69, 14500, 1000500, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(14, 3, 1, 16, 'LAKSAMANA-(20)', 351, 24000, 8424000, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(15, 3, 1, 20, 'KING DJAVA CLASSIC-(20)', 135, 24500, 3307500, 30, '2026-01-02 03:22:25', NULL, NULL, NULL),
(16, 4, 1, 10, 'OCHA GUAVA-(12)', 200, 8000, 1600000, 30, '2026-01-12 01:12:08', NULL, NULL, NULL),
(17, 4, 1, 22, 'OCHA APPLE ICE SKT (12)', 100, 8100, 810000, 30, '2026-01-12 01:12:08', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_visitasi`
--

DROP TABLE IF EXISTS `jurnal_visitasi`;
CREATE TABLE IF NOT EXISTS `jurnal_visitasi` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `retail_id` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `latlong` varchar(100) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_visitasi`
--

INSERT INTO `jurnal_visitasi` (`id`, `company_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `retail_id`, `photo`, `agen_id`, `latlong`, `is_new`, `total_price`) VALUES
(1, 1, '2025-12-01 10:16:51', 31, NULL, NULL, 3, 'scaled_5e076f8f-c3c2-4305-8e11-00fb4e581b411959800660780219409.jpg', NULL, '-7.161057,113.4908476', 1, NULL),
(2, 1, '2025-12-01 13:03:31', 31, NULL, NULL, 4, 'scaled_1fada150-55a1-40bc-bc14-a2f0956e81495264215552587035524.jpg', NULL, '-7.1349043,113.5653067', 1, NULL),
(3, 1, '2025-12-01 13:03:57', 31, NULL, NULL, 4, 'scaled_30e9c638-a78b-4bb1-869e-b7dec8137a288593772466588012969.jpg', NULL, '-7.1349056,113.5653586', 0, NULL),
(4, 1, '2025-12-19 05:48:56', 31, NULL, NULL, 7, 'scaled_1ebf81f2-5513-4168-b944-f171b78a1d6f1848101198673012766.jpg', NULL, '-7.0072943,113.8548123', 1, NULL),
(5, 1, '2025-12-19 06:02:53', 31, NULL, NULL, 5, 'scaled_5819cd28-5e11-4051-97db-68649133be7f8486120691672414297.jpg', NULL, '-7.1345788,112.7171648', 1, NULL),
(6, 1, NULL, 31, NULL, NULL, 5, 'scaled_187a73dd-636c-40c2-9eb6-6682acf973472653292236380733721.jpg', NULL, '-7.1345748,112.717165', 0, NULL),
(7, 1, '2025-12-18 23:05:49', 31, NULL, NULL, 5, 'scaled_c3332fb7-98eb-48e5-bf73-efc06b64f0353769804519923396848.jpg', NULL, '-7.1345769,112.7171681', 0, NULL),
(8, 1, '2025-12-18 23:13:27', 31, NULL, NULL, 5, 'scaled_8b91aada-40b9-4ee3-a608-cb4f0e8271b56378354978232955990.jpg', NULL, '-7.1345749,112.7171705', 0, NULL),
(9, 1, '2025-12-18 22:14:13', 31, NULL, NULL, 5, 'scaled_b5472c43-94b6-4afb-9212-13697f0dca2d5280996218668865171.jpg', NULL, '-7.1345768,112.7171662', 0, NULL),
(10, 1, '2026-01-05 08:04:09', 38, NULL, NULL, 10, 'scaled_7b74c2aa-7b3b-402e-930f-76d02851ac16660863497363578254.jpg', NULL, '-7.0002147,112.5751122', 1, NULL),
(11, 1, '2026-01-05 08:23:01', 38, NULL, NULL, 11, 'scaled_9139b16a-c44e-4e16-b0ce-7b6d686d8b916462269915981822076.jpg', NULL, '-7.0356157,112.5766483', 1, NULL),
(12, 1, '2026-01-05 08:30:27', 38, NULL, NULL, 12, 'scaled_6463d055-e13b-4e5f-ba2e-8996c9bb21e47238025469714428361.jpg', NULL, '-7.0384774,112.5833616', 1, NULL),
(13, 1, '2026-01-05 09:46:31', 38, NULL, NULL, 13, 'scaled_6aae0eb2-b85d-4977-9c33-ecdd46f3d9355301831249071511982.jpg', NULL, '-6.9905493,112.508489', 1, NULL),
(14, 1, '2026-01-05 10:13:51', 38, NULL, NULL, 16, 'scaled_739517ff-e104-4ed2-95a6-4bf8e21661431985817250593725023.jpg', NULL, '-7.0023457,112.508678', 1, NULL),
(15, 1, '2026-01-05 10:38:04', 38, NULL, NULL, 17, 'scaled_2d070af9-93b0-49e1-bb32-607fd62076ac6440957590634140353.jpg', NULL, '-6.9859628,112.5177123', 1, NULL),
(16, 1, '2026-01-05 10:39:46', 38, NULL, NULL, 18, 'scaled_6fd5e47a-167a-4a71-b227-44c53491ba2f736911439667763709.jpg', NULL, '-6.9808961,112.5257593', 1, NULL),
(17, 1, '2026-01-05 11:00:33', 38, NULL, NULL, 19, 'scaled_71d35da7-487b-4bed-ad88-94c0fa014b694037219104443458135.jpg', NULL, '-6.9880919,112.5574309', 1, NULL),
(18, 1, '2026-01-06 08:07:15', 38, NULL, NULL, 20, 'scaled_bbb5aa4b-205b-405d-a299-1728cd83e1763881630249052453658.jpg', NULL, '-6.9717752,112.5273857', 1, NULL),
(19, 1, '2026-01-06 08:40:54', 38, NULL, NULL, 21, 'scaled_8a443a8a-5f0d-424d-8c85-b69567a9ebf14477437762664108640.jpg', NULL, '-6.9521349,112.5049356', 1, NULL),
(20, 1, '2026-01-06 08:50:01', 38, NULL, NULL, 22, 'scaled_0c90e50e-65c5-4b60-9fae-2d636b01f0197443812811258265567.jpg', NULL, '-6.97209,112.4961284', 1, NULL),
(21, 1, '2026-01-06 08:58:39', 38, NULL, NULL, 23, 'scaled_18b3ff55-aef0-4ad7-a57e-f53c15c7071d4280404682020658517.jpg', NULL, '-6.9602043,112.4859552', 1, NULL),
(22, 1, '2026-01-06 09:21:51', 38, NULL, NULL, 24, 'scaled_d840d932-fb6f-4e18-87ae-18d44186f31d6508088711090547435.jpg', NULL, '-6.9674806,112.4821251', 1, NULL),
(23, 1, '2026-01-06 09:42:59', 38, NULL, NULL, 25, 'scaled_b4906dba-d32e-4402-afc4-8b5a2db37bd29221830837120361492.jpg', NULL, '-6.9692329,112.4810548', 1, NULL),
(24, 1, '2026-01-06 10:04:04', 38, NULL, NULL, 26, 'scaled_67ccaaca-e83b-4ee2-857e-467f7c3ea43010088419134308417.jpg', NULL, '-6.9379444,112.455912', 1, NULL),
(25, 1, '2026-01-06 10:18:27', 38, NULL, NULL, 27, 'scaled_a394d1c5-692f-44dd-8a04-7e0a3069bb102782958310714493982.jpg', NULL, '-6.9195593,112.476356', 1, NULL),
(26, 1, '2026-01-06 10:22:40', 38, NULL, NULL, 28, 'scaled_582ffbd4-894b-4b71-afa9-72b89eb43dfa5153135385795346529.jpg', NULL, '-6.9123316,112.4797298', 1, NULL),
(27, 1, '2026-01-06 10:37:11', 38, NULL, NULL, 29, 'scaled_2456f77d-684d-4186-828f-ed8e08b0a15e7517752901229248419.jpg', NULL, '-6.910553,112.4797883', 1, NULL),
(28, 1, '2026-01-06 11:03:55', 38, NULL, NULL, 30, 'scaled_e923b737-dfe3-4118-adbc-7c5a6ffe99c51157054905586770857.jpg', NULL, '-6.9118446,112.5675675', 1, NULL),
(29, 1, '2026-01-07 08:22:27', 38, NULL, NULL, 31, 'scaled_0c8a5e11-8a21-4d40-96b6-cc283a0e64543709328435316301073.jpg', NULL, '-6.9684989,112.4390781', 1, NULL),
(30, 1, '2026-01-07 08:28:51', 38, NULL, NULL, 32, 'scaled_7c69a9ec-0a85-425a-9567-e4883d260a466422248029770805340.jpg', NULL, '-6.9690923,112.4218747', 1, NULL),
(31, 1, '2026-01-07 08:32:45', 38, NULL, NULL, 33, 'scaled_7e72b42e-65d7-4528-8667-ab2a7ee33dfc8473456058538250920.jpg', NULL, '-6.9740843,112.4206448', 1, NULL),
(32, 1, '2026-01-07 09:02:39', 38, NULL, NULL, 34, 'scaled_eab16431-764d-4e98-85e0-4ffd0081ec5d1576720675101077352.jpg', NULL, '-6.9496585,112.4286069', 1, NULL),
(33, 1, '2026-01-07 09:05:52', 38, NULL, NULL, 35, 'scaled_5fa4ae8a-37a9-4111-9f1d-a880351b2fd48676862053205454528.jpg', NULL, '-6.948354,112.4290279', 1, NULL),
(34, 1, '2026-01-07 09:47:53', 38, NULL, NULL, 37, 'scaled_531c961e-8372-4e36-a8f9-240f2f96a7e44911962899195953727.jpg', NULL, '-6.919217,112.4523988', 1, NULL),
(35, 1, '2026-01-07 09:52:42', 38, NULL, NULL, 38, 'scaled_6db0cb48-e888-4996-bff9-c3cc4e8330e234524193025504920.jpg', NULL, '-6.9177306,112.4547064', 1, NULL),
(36, 1, '2026-01-07 09:59:21', 38, NULL, NULL, 40, 'scaled_3bcabca8-9c30-4f4c-b0ed-d93358c2374e5998768359460386485.jpg', NULL, '-6.9086881,112.4593644', 1, NULL),
(37, 1, '2026-01-07 10:10:16', 38, NULL, NULL, 41, 'scaled_89c48299-149b-42ab-8ac0-a993e89bf4457919048647054338107.jpg', NULL, '-6.8932006,112.4660224', 1, NULL),
(38, 1, '2026-01-07 10:13:05', 38, NULL, NULL, 42, 'scaled_55db7e17-4607-461a-a4c7-8c97f8241bd15058823166531578350.jpg', NULL, '-6.8928879,112.4658395', 1, NULL),
(39, 1, '2026-01-07 10:15:36', 38, NULL, NULL, 43, 'scaled_1b2cf49b-6f89-4fe4-9758-f5512920b6473087040825565550769.jpg', NULL, '-6.8918196,112.4649998', 1, NULL),
(40, 1, '2026-01-07 10:18:55', 38, NULL, NULL, 44, 'scaled_c4be2e2e-1909-40c2-93cb-9c031c4edd601528050154684011440.jpg', NULL, '-6.8924278,112.4655904', 1, NULL),
(41, 1, '2026-01-07 10:26:44', 38, NULL, NULL, 45, 'scaled_4aae44df-dcd6-49bd-9a49-9ffca00876871785372339400542936.jpg', NULL, '-6.8838359,112.455242', 1, NULL),
(42, 1, '2026-01-07 10:29:24', 38, NULL, NULL, 46, 'scaled_b0c5c186-ed2f-467d-be01-de0f396c33521806498263247205545.jpg', NULL, '-6.8853499,112.4535465', 1, NULL),
(43, 1, '2026-01-07 13:38:44', 38, NULL, NULL, 47, 'scaled_0b8e051f-0ce3-4561-92ce-53e22cb51ac55050579497226828277.jpg', NULL, '-6.9882354,112.5573909', 1, NULL),
(44, 1, '2026-01-07 16:47:13', 38, NULL, NULL, 48, 'scaled_51449651-c11a-4964-9a1c-12df0bf3c8169123143913532318325.jpg', NULL, '-6.9899071,112.5644716', 1, NULL),
(45, 1, '2026-01-08 09:04:04', 38, NULL, NULL, 49, 'scaled_ee4fc27b-cc85-478a-9349-1d406067fcb36897675529422307190.jpg', NULL, '-6.9652059,112.4219833', 1, NULL),
(46, 1, '2026-01-08 09:11:34', 38, NULL, NULL, 50, 'scaled_d7bad671-5ec0-4729-91f4-b8168520f987283297997538202766.jpg', NULL, '-6.9658716,112.3988019', 1, NULL),
(47, 1, '2026-01-08 09:17:14', 38, NULL, NULL, 51, 'scaled_9fce9590-60cf-4ad2-8166-8417483641634150262071570695400.jpg', NULL, '-6.9585188,112.390977', 1, NULL),
(48, 1, '2026-01-08 09:24:56', 38, NULL, NULL, 52, 'scaled_7d2bbc49-ece0-4d45-bc2d-0a51d15daeac2414950881763099781.jpg', NULL, '-6.9411274,112.4085335', 1, NULL),
(49, 1, '2026-01-08 09:27:35', 38, NULL, NULL, 53, 'scaled_8b9fe2ca-b0ad-4a7a-ad25-38e739ee44af1087594626724330258.jpg', NULL, '-6.9385274,112.4099243', 1, NULL),
(50, 1, '2026-01-08 09:36:00', 38, NULL, NULL, 54, 'scaled_b12ea19d-5543-4333-91f3-a230ecf4d3ad1437774751577730889.jpg', NULL, '-6.9157858,112.4204777', 1, NULL),
(51, 1, '2026-01-08 09:38:51', 38, NULL, NULL, 55, 'scaled_359de296-a11e-4e87-a6a2-19f4984e919e2546963428533187967.jpg', NULL, '-6.9135227,112.4211173', 1, NULL),
(52, 1, '2026-01-08 09:52:39', 38, NULL, NULL, 56, 'scaled_f7e9c548-f512-4935-9c89-c32fa9bca2b28019186924996399958.jpg', NULL, '-6.894655,112.4328796', 1, NULL),
(53, 1, '2026-01-08 09:58:23', 38, NULL, NULL, 57, 'scaled_0512b637-3f83-4be5-be2a-f8e2ed6804b47766545824218707313.jpg', NULL, '-6.8935867,112.4337592', 1, NULL),
(54, 1, '2026-01-08 10:06:51', 38, NULL, NULL, 58, 'scaled_6abcb9cf-aed8-4b40-9fe9-e1ad01b308af4876529522227604357.jpg', NULL, '-6.8941824,112.4505735', 1, NULL),
(55, 1, '2026-01-08 10:16:45', 38, NULL, NULL, 59, 'scaled_cd8a4416-e8ed-4c58-bea2-caff2579e82d7944405739174921736.jpg', NULL, '-6.8905527,112.4528422', 1, NULL),
(56, 1, '2026-01-08 10:25:36', 38, NULL, NULL, 60, 'scaled_8967d14a-68c3-41bb-b6ab-80a1008f2d261627880961418240440.jpg', NULL, '-6.9121505,112.457888', 1, NULL),
(57, 1, '2026-01-08 10:47:44', 38, NULL, NULL, 61, 'scaled_02e753ba-f028-4178-9c20-ffe15d8fd9d91851103091800388297.jpg', NULL, '-6.9565251,112.5047298', 1, NULL),
(58, 1, '2026-01-08 13:27:03', 38, NULL, NULL, 62, 'scaled_64186c88-f8b5-47df-a54a-41cae930ce654664064165205324014.jpg', NULL, '-6.9915224,112.5584712', 1, NULL),
(59, 1, '2026-01-09 07:45:47', 38, NULL, NULL, 63, 'scaled_218601f8-e5ae-4230-a20e-83f5f5ad2c593523582078754861595.jpg', NULL, '-6.9911695,112.5630403', 1, NULL),
(60, 1, '2026-01-09 08:16:12', 38, NULL, NULL, 8, 'scaled_810317ff-2e99-41c4-8a6a-41241eb213905724184910539846258.jpg', NULL, '-6.9904168,112.5641516', 1, NULL),
(61, 1, '2026-01-09 09:09:06', 38, NULL, NULL, 64, 'scaled_f0d971b0-a337-4743-b9f3-00225dff65a12025331191207284345.jpg', NULL, '-6.9916182,112.5683311', 1, NULL),
(62, 1, '2026-01-09 09:17:32', 38, NULL, NULL, 65, 'scaled_7e03a7fc-88d8-4e1e-b10c-209dc718875b6629269699750848685.jpg', NULL, '-6.9887622,112.5598295', 1, NULL),
(63, 1, '2026-01-10 08:47:48', 38, NULL, NULL, 66, 'scaled_17a8e322-0a57-41ae-9e01-559db3cf5ac83546783010640426226.jpg', NULL, '-7.03161,112.5608569', 1, NULL),
(64, 1, '2026-01-10 08:50:30', 38, NULL, NULL, 67, 'scaled_5cb8a32e-7c8d-41dc-97f5-ad1fa4011c8e3250906530249076556.jpg', NULL, '-7.0316241,112.5607451', 1, NULL),
(65, 1, '2026-01-10 08:58:18', 38, NULL, NULL, 68, 'scaled_a2578aa4-6a1e-4dda-a1ff-74625adda9342730306124380755811.jpg', NULL, '-7.0316826,112.5604287', 1, NULL),
(66, 1, '2026-01-10 09:10:51', 38, NULL, NULL, 69, 'scaled_be11d5e2-a23e-4011-bdc9-b0f5b644b6ea5180219182787763250.jpg', NULL, '-7.0452189,112.554495', 1, NULL),
(67, 1, '2026-01-10 09:16:31', 38, NULL, NULL, 70, 'scaled_9b63b7ac-f4e5-4f22-ad18-7b611a7699c27312132627575980887.jpg', NULL, '-7.0452189,112.554495', 1, NULL),
(68, 1, '2026-01-10 09:19:59', 38, NULL, NULL, 71, 'scaled_9d038b32-3f17-47a1-aafa-f29cbe6b3a375324244085777968692.jpg', NULL, '-7.0449615,112.5533775', 1, NULL),
(69, 1, '2026-01-10 09:28:02', 38, NULL, NULL, 72, 'scaled_1c83949f-0c39-438c-a224-5e0471962ef4827949252357672027.jpg', NULL, '-7.0452189,112.554495', 1, NULL),
(70, 1, '2026-01-10 09:38:26', 38, NULL, NULL, 73, 'scaled_5428bd78-9920-408f-87f9-0ef079a0cc6b4796363375043995111.jpg', NULL, '-7.0491185,112.5630897', 1, NULL),
(71, 1, '2026-01-10 09:49:12', 38, NULL, NULL, 74, 'scaled_8ad233a9-1579-432e-87d6-b8e6b57b19107135905907868490625.jpg', NULL, '-7.0554081,112.5828759', 1, NULL),
(72, 1, '2026-01-10 09:56:27', 38, NULL, NULL, 75, 'scaled_20ad54dc-8856-4223-945e-0d77abc3f4e85856589976418107367.jpg', NULL, '-7.0553076,112.5834505', 1, NULL),
(73, 1, '2026-01-10 10:28:37', 38, NULL, NULL, 76, 'scaled_1bae5009-7770-49d2-aca1-6cb66ae461406556063850665883305.jpg', NULL, '-7.0550459,112.5873381', 1, NULL),
(74, 1, '2026-01-10 10:32:50', 38, NULL, NULL, 77, 'scaled_626fc42e-6546-4d6a-9831-33d68711342a202072698944840115.jpg', NULL, '-7.0531601,112.5879796', 1, NULL),
(75, 1, '2026-01-10 10:38:07', 38, NULL, NULL, 78, 'scaled_58a31ed7-146f-472c-b9d1-31941f93f6981801952068939306139.jpg', NULL, '-7.0484863,112.5891359', 1, NULL),
(76, 1, '2026-01-10 10:41:32', 38, NULL, NULL, 79, 'scaled_bb689e12-36fc-4cbf-a2c8-06534a6b385d4052368148823717695.jpg', NULL, '-7.0449029,112.5917432', 1, NULL),
(77, 1, '2026-01-10 10:43:45', 38, NULL, NULL, 80, 'scaled_a658086b-bfd6-434e-8cf2-4a0267cfd4024261053874803324296.jpg', NULL, '-7.0449218,112.5913708', 1, NULL),
(78, 1, '2026-01-10 10:47:44', 38, NULL, NULL, 81, 'scaled_cd06e0db-c2cc-48b5-adeb-95d28b4ed6145095161640364061942.jpg', NULL, '-7.0434851,112.5887634', 1, NULL),
(79, 1, '2026-01-10 10:56:06', 38, NULL, NULL, 82, 'scaled_b4834bc2-1bcb-430c-a0a3-e0b20d69ceda9135048553955719881.jpg', NULL, '-7.0378432,112.5835954', 1, NULL),
(80, 1, '2026-01-10 11:11:10', 38, NULL, NULL, 83, 'scaled_7dded1f7-5d47-4727-adaf-ef0a7c9e8ba55434582771297636947.jpg', NULL, '-6.992369,112.561074', 1, NULL),
(81, 1, '2026-01-12 08:45:03', 38, NULL, NULL, 84, 'scaled_5085e1f3-2b3d-4ec0-ae6e-2566e39183505785960618124715561.jpg', NULL, '-7.0081007,112.5671873', 1, NULL),
(82, 1, '2026-01-12 09:08:38', 38, NULL, NULL, 11, 'scaled_b0faad8e-dab2-4109-806d-ab10284e506f4078284951729441014.jpg', NULL, '-7.0358603,112.5767355', 0, NULL),
(83, 1, '2026-01-12 09:12:32', 38, NULL, NULL, 85, 'scaled_8b1339d0-f9a0-4e1a-8872-867cb4f6e3fa5468323998125597480.jpg', NULL, '-7.035507,112.5762012', 1, NULL),
(84, 1, '2026-01-12 09:23:16', 38, NULL, NULL, 12, 'scaled_e55ed434-1827-43da-be03-e6bd866fc0b9327050967723634015.jpg', NULL, '-7.0384816,112.5832443', 0, NULL),
(85, 1, '2026-01-12 09:25:33', 38, NULL, NULL, 86, 'scaled_2c1edef6-acac-4b7c-bfc4-7824ae158c73952704029842495598.jpg', NULL, '-7.0398566,112.5828996', 1, NULL),
(86, 1, '2026-01-12 09:28:03', 38, NULL, NULL, 87, 'scaled_7a448016-91d1-4818-ae2c-3da6c99833155452604801664760425.jpg', NULL, '-7.0400158,112.5833475', 1, NULL),
(87, 1, '2026-01-12 09:33:55', 38, NULL, NULL, 88, 'scaled_bb28ecde-442c-420a-a085-229a0a2ba3bd8334644905530238802.jpg', NULL, '-7.0431301,112.586382', 1, NULL),
(88, 1, '2026-01-12 09:45:04', 38, NULL, NULL, 89, 'scaled_ce6ad796-2066-4c22-868a-1e890fa5eabb7140510725612669810.jpg', NULL, '-7.0556473,112.5786698', 1, NULL),
(89, 1, '2026-01-12 10:18:16', 38, NULL, NULL, 90, 'scaled_e8a2a9c9-8a58-4ff5-9788-f925e746230b1495374264277924925.jpg', NULL, '-7.030573,112.5215545', 1, NULL),
(90, 1, '2026-01-12 10:25:03', 38, NULL, NULL, 91, 'scaled_c35b5aed-5644-4047-a2bd-8cff544658ae917003229083146613.jpg', NULL, '-7.0312447,112.5230547', 1, NULL),
(91, 1, '2026-01-12 10:27:31', 38, NULL, NULL, 92, 'scaled_f1e9a199-110a-48be-9821-0a395d35075c8628764967042451643.jpg', NULL, '-7.0315359,112.5233319', 1, NULL),
(92, 1, '2026-01-12 10:37:28', 38, NULL, NULL, 94, 'scaled_4e545f3a-cdc7-474c-963d-1b2d3e3f5c806173137288031569744.jpg', NULL, '-7.0335753,112.5258941', 1, NULL),
(93, 1, '2026-01-12 10:40:24', 38, NULL, NULL, 95, 'scaled_b801c403-a245-4d8f-8a33-ecc4cf87d653895985749290958495.jpg', NULL, '-7.0334533,112.525806', 1, NULL),
(94, 1, '2026-01-12 10:42:14', 38, NULL, NULL, 96, 'scaled_0e906604-282e-4fa8-add7-af5cea1c9b8c8635866504926953068.jpg', NULL, '-7.0335538,112.5258967', 1, NULL),
(95, 1, '2026-01-12 10:48:36', 38, NULL, NULL, 97, 'scaled_58d47681-7d12-43bb-b99e-be89201964073462716932970160017.jpg', NULL, '-7.0345426,112.5283169', 1, NULL),
(96, 1, '2026-01-12 10:55:16', 38, NULL, NULL, 98, 'scaled_eebf1304-d09d-44dc-8e3e-140e041316c08233442153654527366.jpg', NULL, '-7.0352534,112.5302372', 1, NULL),
(97, 1, '2026-01-12 11:02:00', 38, NULL, NULL, 99, 'scaled_3080179e-2244-4206-934b-dcb48260364f4850134467795760601.jpg', NULL, '-7.0358832,112.5306981', 1, NULL),
(98, 1, '2026-01-12 11:04:40', 38, NULL, NULL, 100, 'scaled_47a6dd5e-0135-4d20-bd59-749c00b4c4911358720727567599932.jpg', NULL, '-7.0382504,112.5344898', 1, NULL),
(99, 1, '2026-01-12 11:35:57', 38, NULL, NULL, 101, 'scaled_3a1efe39-83e5-442f-b62c-fcfc5a653bc18606641892195551387.jpg', NULL, '-7.0003207,112.5750276', 1, NULL),
(100, 1, '2026-01-12 14:01:41', 38, NULL, NULL, 103, 'scaled_85a03fb6-b13e-4c9b-b5d2-8d11df768f063441273096190600149.jpg', NULL, '-6.992672,112.5601193', 1, NULL),
(101, 1, '2026-01-12 19:05:17', 38, NULL, NULL, 9, 'scaled_2b3a714d-d3f9-4803-8cbb-36e6843d4c391115918371890625776.jpg', NULL, '-6.9990655,112.5730812', 1, NULL),
(102, 1, '2026-01-14 07:33:09', 38, NULL, NULL, 20, 'scaled_5d924d04-dada-4f1a-85a3-b38d2a498b081589373558355923115.jpg', NULL, '-6.9720705,112.5274071', 0, NULL),
(103, 1, '2026-01-14 07:49:20', 38, NULL, NULL, 23, 'scaled_2c1ed845-267c-454f-aaae-1c63ffcb54fb7262651517272990019.jpg', NULL, '-6.9589765,112.4867227', 0, NULL),
(104, 1, '2026-01-14 08:02:42', 38, NULL, NULL, 104, 'scaled_5e622206-6103-4c45-86c6-190c1c4fbce34173278740270930431.jpg', NULL, '-6.9712117,112.476888', 1, NULL),
(105, 1, '2026-01-14 08:44:50', 38, NULL, NULL, 31, 'scaled_da1b90da-49f7-4880-b20c-9adbf64ace648791503167552303283.jpg', NULL, '-6.9689203,112.4387687', 0, NULL),
(106, 1, '2026-01-14 08:50:18', 38, NULL, NULL, 32, 'scaled_5445d269-39f0-4280-8574-2639682b53cf4385482702542902721.jpg', NULL, '-6.969228,112.4216667', 0, NULL),
(107, 1, '2026-01-14 08:58:06', 38, NULL, NULL, 33, 'scaled_660c6eb5-ccb2-4b46-83e9-c18ea6b0f9f31167252916943892566.jpg', NULL, '-6.974093,112.420732', 0, NULL),
(108, 1, '2026-01-14 09:48:56', 38, NULL, NULL, 34, 'scaled_1f727376-f75c-4119-b380-5c8c253178d52357220710923046761.jpg', NULL, '-6.949635,112.4285871', 0, NULL),
(109, 1, '2026-01-14 09:52:57', 38, NULL, NULL, 35, 'scaled_20978519-5bba-48fb-b2af-0a16ec753a54863197747469138648.jpg', NULL, '-6.9480575,112.4287806', 0, NULL),
(110, 1, '2026-01-14 10:06:17', 38, NULL, NULL, 26, 'scaled_4fd593bd-0c75-49d5-b382-4508636944ce8320307664717135392.jpg', NULL, '-6.9377829,112.4560002', 0, NULL),
(111, 1, '2026-01-14 10:17:17', 38, NULL, NULL, 105, 'scaled_8a96a88a-fd8c-4316-a622-2dcc6a4b32d35467402145296777522.jpg', NULL, '-6.9294738,112.4688804', 1, NULL),
(112, 1, '2026-01-14 10:24:02', 38, NULL, NULL, 27, 'scaled_56bfc744-f02a-480c-93e1-4b26b49fd3d09205786461844526557.jpg', NULL, '-6.9196081,112.4763769', 0, NULL),
(113, 1, '2026-01-14 10:28:18', 38, NULL, NULL, 106, 'scaled_fbd7388f-b0fa-44c2-923c-e8992d75ae437631661832299187090.jpg', NULL, '-6.9122553,112.4796225', 1, NULL),
(114, 1, '2026-01-14 10:31:20', 38, NULL, NULL, 28, 'scaled_bb01a796-eeb9-4433-8278-811764d82e152423731880739216132.jpg', NULL, '-6.9122645,112.4797646', 0, NULL),
(115, 1, '2026-01-14 10:43:04', 38, NULL, NULL, 29, 'scaled_e7268be5-9af4-4b3f-ab10-61fa062eb1066535735452890184618.jpg', NULL, '-6.9104447,112.4797038', 0, NULL),
(116, 1, '2026-01-14 11:04:46', 38, NULL, NULL, 25, 'scaled_8646ddaf-911f-40aa-8ca9-ebc67f18d19b660157330489908874.jpg', NULL, '-6.9688617,112.4805421', 0, NULL),
(117, 1, '2026-01-14 11:20:27', 38, NULL, NULL, 22, 'scaled_2dcdf345-4652-4c58-9431-9e6bd563d5bc3893140153799308486.jpg', NULL, '-6.9723801,112.4959037', 0, NULL),
(118, 1, '2026-01-14 11:28:28', 38, NULL, NULL, 21, 'scaled_21b72b14-59e6-4bd4-8158-dc7ba4e243f08212352623491476701.jpg', NULL, '-6.9520938,112.5044403', 0, NULL),
(119, 1, '2026-01-15 07:48:23', 38, NULL, NULL, 107, 'scaled_8b458891-06cc-4639-ad76-732de7d041e0711822481162986462.jpg', NULL, '-6.9909486,112.5608273', 1, NULL),
(120, 1, '2026-01-15 08:56:39', 38, NULL, NULL, 108, 'scaled_05571d09-d0f3-4f94-8e49-d2650a84d8405233604819223349970.jpg', NULL, '-6.9722301,112.4527172', 1, NULL),
(121, 1, '2026-01-15 09:05:02', 38, NULL, NULL, 109, 'scaled_90773a01-b175-40ca-81ea-cc48d390d2552068913530548694332.jpg', NULL, '-6.9720729,112.4524126', 1, NULL),
(122, 1, '2026-01-15 09:25:05', 38, NULL, NULL, 50, 'scaled_7787844d-21ef-4cdb-9956-9b34e00d9329915544174990607158.jpg', NULL, '-6.9649366,112.3997324', 0, NULL),
(123, 1, '2026-01-15 09:29:52', 38, NULL, NULL, 51, 'scaled_529dc333-612c-4e72-8f0f-7ce9ce72ee5f8825598251612086476.jpg', NULL, '-6.9583632,112.390731', 0, NULL),
(124, 1, '2026-01-15 09:37:21', 38, NULL, NULL, 52, 'scaled_162351fd-3a2a-4e40-a47e-bf2d4ec923b32092302887602559375.jpg', NULL, '-6.9409255,112.4084308', 0, NULL),
(125, 1, '2026-01-15 09:39:21', 38, NULL, NULL, 53, 'scaled_17b9bca2-77fc-47e3-a094-d7f6a2595183959869623932945506.jpg', NULL, '-6.9384165,112.4098707', 0, NULL),
(126, 1, '2026-01-15 09:53:32', 38, NULL, NULL, 110, 'scaled_853bc356-af40-4f22-ac49-9dcc249a693d6521133712482160417.jpg', NULL, '-6.9214058,112.4174744', 1, NULL),
(127, 1, '2026-01-15 10:26:22', 38, NULL, NULL, 54, 'scaled_c567522b-ad36-464a-9427-2fe0c37f07f54505331034848208819.jpg', NULL, '-6.9156953,112.4205557', 0, NULL),
(128, 1, '2026-01-15 10:28:56', 38, NULL, NULL, 55, 'scaled_4d99ea0b-b9ab-4aa8-8dfe-d653293bc49b1176196060099847645.jpg', NULL, '-6.9134589,112.4209716', 0, NULL),
(129, 1, '2026-01-15 10:35:10', 38, NULL, NULL, 56, 'scaled_85db8367-7757-4b8a-bc08-c36fc544bdc58358073212845935567.jpg', NULL, '-6.894708,112.4326902', 0, NULL),
(130, 1, '2026-01-15 10:47:56', 38, NULL, NULL, 59, 'scaled_e2653fe4-3acf-44ec-ba4b-105965b465b87210369259710245709.jpg', NULL, '-6.8913375,112.4528015', 0, NULL),
(131, 1, '2026-01-15 11:01:09', 38, NULL, NULL, 111, 'scaled_254a7bee-0127-402f-b875-99e2ac28c0068832390172711098612.jpg', NULL, '-6.8902686,112.4619026', 1, NULL),
(132, 1, '2026-01-15 11:05:16', 38, NULL, NULL, 42, 'scaled_3a1fc88d-64a8-43d1-b8d2-2e4ec93b0abd1459281326942547475.jpg', NULL, '-6.8922476,112.4655951', 0, NULL),
(133, 1, '2026-01-15 11:33:51', 38, NULL, NULL, 30, 'scaled_4b926cbe-ec9c-4cf6-b7bd-8111d0608b2d5691994588269388359.jpg', NULL, '-6.911771,112.5675735', 0, NULL),
(134, 1, '2026-01-16 08:19:55', 38, NULL, NULL, 112, 'scaled_e5a0f961-295b-486d-a505-d2d2dcca68a61897400786082628631.jpg', NULL, '-6.9941097,112.5638922', 1, NULL),
(135, 1, '2026-01-16 08:45:20', 38, NULL, NULL, 19, 'scaled_88d27e96-7f28-42f1-a1aa-c0770aea19285151496954048109403.jpg', NULL, '-6.9882431,112.5577303', 0, NULL),
(136, 1, '2026-01-16 08:48:25', 38, NULL, NULL, 65, 'scaled_92a6c031-d831-488b-acf1-2a8faeec9d847477596785135732561.jpg', NULL, '-6.9885512,112.5599486', 0, NULL),
(137, 1, '2026-01-16 09:16:21', 38, NULL, NULL, 64, 'scaled_85183655-5202-4cd2-a17e-25235098f8df3466048873733689191.jpg', NULL, '-6.9915854,112.5682526', 0, NULL),
(138, 1, '2026-01-16 09:35:42', 38, NULL, NULL, 113, 'scaled_5126c273-df80-49ca-bdab-757c779755227700697600969545282.jpg', NULL, '-6.9869996,112.5645521', 1, NULL),
(139, 1, '2026-01-16 09:40:20', 38, NULL, NULL, 8, 'scaled_f6eb98b3-56b1-488a-806c-c3e201fe6da22953567105037260637.jpg', NULL, '-6.9900683,112.5643946', 0, NULL),
(140, 1, '2026-01-19 08:39:18', 38, NULL, NULL, 84, 'scaled_07850661-0d30-4ae0-8ef8-52dbcbd273484371345518359436972.jpg', NULL, '-7.0081315,112.5672256', 0, NULL),
(141, 1, '2026-01-19 08:54:35', 38, NULL, NULL, 66, 'scaled_e8467eb6-88f0-4132-9427-bf7a7c278c947209466552036447311.jpg', NULL, '-7.0315982,112.561019', 0, NULL),
(142, 1, '2026-01-19 08:57:34', 38, NULL, NULL, 67, 'scaled_e1db347e-c606-4a77-9cf2-060b10ad080b4867987008675421557.jpg', NULL, '-7.0315935,112.5605593', 0, NULL),
(143, 1, '2026-01-19 09:05:27', 38, NULL, NULL, 11, 'scaled_7a512ee0-5189-4fb1-b36e-736144c932711955700329331608815.jpg', NULL, '-7.0358701,112.5767271', 0, NULL),
(144, 1, '2026-01-19 09:10:51', 38, NULL, NULL, 12, 'scaled_c1ed2f8e-ef74-41a0-ad4f-59c1755987f21329019155277897175.jpg', NULL, '-7.0385948,112.5832687', 0, NULL),
(145, 1, '2026-01-19 09:17:23', 38, NULL, NULL, 114, 'scaled_ad2fcabd-6d81-46c1-a214-66d916c402bb3340613881617303717.jpg', NULL, '-7.0398136,112.5831421', 1, NULL),
(146, 1, '2026-01-19 09:20:23', 38, NULL, NULL, 88, 'scaled_5eeb62db-3b5b-40b0-8bc5-eb44788104f96369972067778371916.jpg', NULL, '-7.0425029,112.5875819', 0, NULL),
(147, 1, '2026-01-19 09:28:28', 38, NULL, NULL, 79, 'scaled_b9699af0-92e1-47f7-bcbb-8ca64235f6ed5979390770175178086.jpg', NULL, '-7.0449218,112.5913708', 0, NULL),
(148, 1, '2026-01-19 09:36:03', 38, NULL, NULL, 115, 'scaled_92403deb-f12c-4258-914d-f8408d9569ae8929361344238721373.jpg', NULL, '-7.0550818,112.5873294', 1, NULL),
(149, 1, '2026-01-19 09:39:56', 38, NULL, NULL, 75, 'scaled_3deaa19f-0d48-427f-93b1-79d7960f8de43205401411157007644.jpg', NULL, '-7.0551018,112.5824313', 0, NULL),
(150, 1, '2026-01-19 09:43:04', 38, NULL, NULL, 89, 'scaled_d8f20d5a-8938-4fd2-af85-113bd7a987df1564398846629574934.jpg', NULL, '-7.0553358,112.5785472', 0, NULL),
(151, 1, '2026-01-19 10:05:00', 38, NULL, NULL, 72, 'scaled_b1c06d9b-4a31-472c-8d01-b041fd24ab8f3852218880648531625.jpg', NULL, '-7.0454972,112.5545424', 0, NULL),
(152, 1, '2026-01-19 10:18:59', 38, NULL, NULL, 117, 'scaled_f65715e3-ba4f-496b-b8d0-5b9e9d0a73b88664469740473478119.jpg', NULL, '-7.0355298,112.5303673', 1, NULL),
(153, 1, '2026-01-19 10:24:39', 38, NULL, NULL, 90, 'scaled_b58adc05-2cd8-4a1a-8e21-29d59416e4342448247276631315248.jpg', NULL, '-7.0304294,112.5215476', 0, NULL),
(154, 1, '2026-01-19 10:32:40', 38, NULL, NULL, 118, 'scaled_b1ebda41-91ab-4025-8c79-48021fa125ce7578081522067914499.jpg', NULL, '-7.0125503,112.5150994', 1, NULL),
(155, 1, '2026-01-19 10:35:09', 38, NULL, NULL, 119, 'scaled_b2f658f9-fc04-4fb0-8f1a-c764adaa54943267682257115809265.jpg', NULL, '-7.0103337,112.5120305', 1, NULL),
(156, 1, '2026-01-19 11:08:29', 38, NULL, NULL, 13, 'scaled_09eb0109-39eb-4e0a-bd4f-f0b6eebd46623733679568271059619.jpg', NULL, '-6.9904774,112.5089511', 0, NULL),
(157, 1, '2026-01-19 11:15:42', 38, NULL, NULL, 120, 'scaled_4ba39937-f3f5-47ab-a5e5-8c721fda8107161254761147999440.jpg', NULL, '-6.9876406,112.5067484', 1, NULL),
(158, 1, '2026-01-19 14:38:04', 38, NULL, NULL, 121, 'scaled_1424b643-71b3-4f1b-9dcd-7ae28123008f5242757575713159277.jpg', NULL, '-6.9882513,112.5574994', 1, NULL),
(159, 1, '2026-01-20 08:42:19', 38, NULL, NULL, 20, 'scaled_b045622f-9acc-4125-874d-2e61dc88bcaf9209318649696570088.jpg', NULL, '-6.9720732,112.5276523', 0, NULL),
(160, 1, '2026-01-20 08:52:27', 38, NULL, NULL, 21, 'scaled_8874f9b5-932f-4889-9f02-6e46d921d2eb8347563406145513435.jpg', NULL, '-6.9521438,112.5048904', 0, NULL),
(161, 1, '2026-01-20 09:02:48', 38, NULL, NULL, 22, 'scaled_820bb5f4-8006-4faa-84a8-dc59babdc01d5152633124856216697.jpg', NULL, '-6.9720802,112.4964', 0, NULL),
(162, 1, '2026-01-20 09:10:57', 38, NULL, NULL, 23, 'scaled_5e5ef8e4-31c1-4973-a320-8ba98952f69a2583630557402185590.jpg', NULL, '-6.9605178,112.4859552', 0, NULL),
(163, 1, '2026-01-20 09:15:46', 38, NULL, NULL, 24, 'scaled_67298ef6-f9cd-4af2-9d51-dc890eac17575314356097160165254.jpg', NULL, '-6.9674198,112.4824437', 0, NULL),
(164, 1, '2026-01-20 09:20:06', 38, NULL, NULL, 104, 'scaled_6d91dfdd-7344-4cb2-a0e1-0ef3dad8fdfa2295113973229383652.jpg', NULL, '-6.9712066,112.4767047', 0, NULL),
(165, 1, '2026-01-20 09:48:08', 38, NULL, NULL, 122, 'scaled_b8c83ed9-43c6-4947-8fde-1c33345f30ea1117645802532031198.jpg', NULL, '-6.950622,112.4453511', 1, NULL),
(166, 1, '2026-01-20 09:54:32', 38, NULL, NULL, 26, 'scaled_1debde5f-7e6f-47d3-976f-fedba44f418d2215988100875942748.jpg', NULL, '-6.9377505,112.4559779', 0, NULL),
(167, 1, '2026-01-20 10:06:54', 38, NULL, NULL, 105, 'scaled_c6e492e4-ae78-4c33-aaf2-6196a8609ae9176931005665166622.jpg', NULL, '-6.9296084,112.469124', 0, NULL),
(168, 1, '2026-01-20 10:14:52', 38, NULL, NULL, 123, 'scaled_ee777ff7-62e2-4975-b81f-0b170d3a3a998756328092839905032.jpg', NULL, '-6.9195764,112.4762426', 1, NULL),
(169, 1, '2026-01-20 10:24:41', 38, NULL, NULL, 28, 'scaled_2b0990af-5d26-45d3-9b90-5785e837f6c08117724644030167673.jpg', NULL, '-6.9122374,112.479648', 0, NULL),
(170, 1, '2026-01-20 10:32:35', 38, NULL, NULL, 29, 'scaled_e3ed2f0f-5e4a-4a50-8c5a-d80c6297404d3016045304948307791.jpg', NULL, '-6.9104981,112.479676', 0, NULL),
(171, 1, '2026-01-20 11:05:47', 38, NULL, NULL, 124, 'scaled_dc074cfd-7ce0-4cc9-9f10-9c7b3e499aa64461222524196498185.jpg', NULL, '-6.9859168,112.5176071', 1, NULL),
(172, 1, '2026-01-20 20:10:32', 38, NULL, NULL, 9, 'scaled_52207db2-5d8b-41b9-813c-c56f64a202cd3614044337473041998.jpg', NULL, '-6.9990307,112.5730586', 0, NULL),
(173, 1, '2026-01-21 08:36:35', 38, NULL, NULL, 108, 'scaled_115c910b-485b-472b-9c07-bac03dc8642a5215881156145248226.jpg', NULL, '-6.9723236,112.452558', 0, NULL),
(174, 1, '2026-01-21 08:39:00', 38, NULL, NULL, 125, 'scaled_c2a8f959-1cf8-4f4a-a0df-a0cdd98a21ce3048219582132976113.jpg', NULL, '-6.9720911,112.4521987', 1, NULL),
(175, 1, '2026-01-21 09:11:37', 38, NULL, NULL, 31, 'scaled_a86a9d11-db61-496d-8db9-aa03b5c6419f7928660298073178327.jpg', NULL, '-6.9686758,112.4388386', 0, NULL),
(176, 1, '2026-01-21 09:17:08', 38, NULL, NULL, 32, 'scaled_63abacab-1717-41cf-862f-394ca3b2c1df8143329474528394372.jpg', NULL, '-6.9690992,112.4216537', 0, NULL),
(177, 1, '2026-01-21 09:22:45', 38, NULL, NULL, 33, 'scaled_d367421d-a576-4fc6-96ec-03f3df6653271858597256167746931.jpg', NULL, '-6.9741852,112.4205137', 0, NULL),
(178, 1, '2026-01-21 09:43:29', 38, NULL, NULL, 34, 'scaled_a4eaef9b-e8c1-442b-8dee-b17886506c4c4894020421080707466.jpg', NULL, '-6.9495791,112.4286279', 0, NULL),
(179, 1, '2026-01-21 09:48:19', 38, NULL, NULL, 35, 'scaled_59df2ddb-5d0e-4198-8c61-25376190fe4d5405744476615347373.jpg', NULL, '-6.948094,112.4289399', 0, NULL),
(180, 1, '2026-01-21 09:51:58', 38, NULL, NULL, 126, 'scaled_4bcd52f6-f8aa-4061-84a3-a8667a5a7a745234077104710183662.jpg', NULL, '-6.9466278,112.430355', 1, NULL),
(181, 1, '2026-01-21 09:54:48', 38, NULL, NULL, 127, 'scaled_06a5761c-b489-4c6a-9065-fa03702036622663670108088324369.jpg', NULL, '-6.943762,112.4319403', 1, NULL),
(182, 1, '2026-01-21 10:07:57', 38, NULL, NULL, 128, 'scaled_65758cf7-3642-45b1-825c-169abb04e5c0464942488478191209.jpg', NULL, '-6.9193197,112.4523856', 1, NULL),
(183, 1, '2026-01-21 10:17:05', 38, NULL, NULL, 41, 'scaled_56a8a4f1-43f3-474c-a470-3902742d530a1471251790036242250.jpg', NULL, '-6.8926982,112.4664747', 0, NULL),
(184, 1, '2026-01-21 10:20:08', 38, NULL, NULL, 44, 'scaled_4c0b7828-d362-4d81-abc8-96485c64dd483809980747120562563.jpg', NULL, '-6.8927829,112.4663003', 0, NULL),
(185, 1, '2026-01-21 11:07:05', 38, NULL, NULL, 19, 'scaled_7180a9a5-ae66-4288-af04-b627239f53ad7795661845173822797.jpg', NULL, '-6.9870971,112.5563574', 0, NULL),
(186, 1, '2026-01-22 09:12:44', 38, NULL, NULL, 51, 'scaled_c0e677f0-b6d0-4e81-ae12-bef16e83906d4147221003651492764.jpg', NULL, '-6.9585224,112.3904219', 0, NULL),
(187, 1, '2026-01-22 09:18:58', 38, NULL, NULL, 52, 'scaled_98d2dc8a-3b7e-4102-86d3-407a5bd4bb081356507271512047462.jpg', NULL, '-6.9411651,112.4084136', 0, NULL),
(188, 1, '2026-01-22 09:20:48', 38, NULL, NULL, 53, 'scaled_a6955fdb-5466-4dd7-bc9b-bd58557e66027726951557170587812.jpg', NULL, '-6.9386881,112.4096604', 0, NULL),
(189, 1, '2026-01-22 09:25:29', 38, NULL, NULL, 129, 'scaled_166486ff-20f7-4b3f-b7e8-8f947ff235484298106492454814745.jpg', NULL, '-6.9252276,112.4160375', 1, NULL),
(190, 1, '2026-01-22 09:30:08', 38, NULL, NULL, 54, 'scaled_0e085baf-66a7-4ef3-b7f3-a8effcfa37612493673291665041543.jpg', NULL, '-6.9157186,112.4204505', 0, NULL),
(191, 1, '2026-01-22 09:33:15', 38, NULL, NULL, 55, 'scaled_2a95b4a3-6f05-4bb9-8ff5-19558836a6058304183585394135370.jpg', NULL, '-6.9135568,112.4208784', 0, NULL),
(192, 1, '2026-01-22 09:39:49', 38, NULL, NULL, 56, 'scaled_77ccbba5-2745-4f2a-9d6f-90260eefd14c7122322058040218111.jpg', NULL, '-6.8946569,112.4329776', 0, NULL),
(193, 1, '2026-01-22 09:42:02', 38, NULL, NULL, 57, 'scaled_61c191c7-c23e-4a80-a815-4d1345c11dad2290835743860390588.jpg', NULL, '-6.8936903,112.4336498', 0, NULL),
(194, 1, '2026-01-22 09:46:00', 38, NULL, NULL, 130, 'scaled_7b937abe-9acf-47c4-bab9-760133e63a217084440854205419765.jpg', NULL, '-6.8943322,112.4332267', 1, NULL),
(195, 1, '2026-01-22 09:52:33', 38, NULL, NULL, 58, 'scaled_cb508c97-3c94-44bb-b13a-acf4ed6abf9e6871312242777591348.jpg', NULL, '-6.8942128,112.4505398', 0, NULL),
(196, 1, '2026-01-22 09:57:00', 38, NULL, NULL, 59, 'scaled_16937bca-7528-45b5-bb8c-e48a1d5a0a29350012539706046743.jpg', NULL, '-6.890444,112.4529599', 0, NULL),
(197, 1, '2026-01-22 10:02:09', 38, NULL, NULL, 42, 'scaled_a5cbdb17-52d1-4153-a745-5955bf49488b4514339725027412453.jpg', NULL, '-6.8922943,112.465402', 0, NULL),
(198, 1, '2026-01-22 10:25:12', 38, NULL, NULL, 30, 'scaled_5d9922ee-7a2b-4842-9e52-c80ca4da96217359803284944195334.jpg', NULL, '-6.9117719,112.5677321', 0, NULL),
(199, 1, '2026-01-22 12:06:58', 38, NULL, NULL, 62, 'scaled_70444ddb-4405-4ef5-a3e6-0ab475dd6c047125766400201809570.jpg', NULL, '-6.9914745,112.558446', 0, NULL),
(200, 1, '2026-01-22 13:17:26', 38, NULL, NULL, 121, 'scaled_f0c84eba-6aff-45f1-8666-ece5f90533f11257811744162594064.jpg', NULL, '-6.9882905,112.5574262', 0, NULL),
(201, 1, '2026-01-23 08:42:58', 38, NULL, NULL, 8, 'scaled_9400d1db-1f22-4d3b-98a8-cc861f586faf8372794013842296813.jpg', NULL, '-6.9899958,112.564453', 0, NULL),
(202, 1, '2026-01-23 09:22:49', 38, NULL, NULL, 107, 'scaled_34a86de4-3529-4217-a291-fe84a6563db21747022471273698239.jpg', NULL, '-6.9913952,112.5614595', 0, NULL),
(203, 1, '2026-01-23 09:55:08', 38, NULL, NULL, 64, 'scaled_f9342d36-3b46-4294-a677-e681158f1ef54714213190377344063.jpg', NULL, '-6.9915966,112.5683289', 0, NULL),
(204, 1, '2026-01-23 10:28:42', 38, NULL, NULL, 65, 'scaled_c76bbbe7-76f6-4d4d-8c43-58fa8a3e30623816737784613009587.jpg', NULL, '-6.9886375,112.5601439', 0, NULL),
(205, 1, '2026-01-23 10:49:27', 38, NULL, NULL, 19, 'scaled_6369d675-fdc2-4051-b249-4893fef388417092084346552095105.jpg', NULL, '-6.9882868,112.557359', 0, NULL),
(206, 1, '2026-01-24 09:42:31', 38, NULL, NULL, 131, 'scaled_69602ed4-c6f0-46bb-a35a-ce8c9c87f2551034906551360665587.jpg', NULL, '-7.0402875,112.5896201', 1, NULL),
(207, 1, '2026-01-24 09:44:56', 38, NULL, NULL, 132, 'scaled_ac554e7c-09d9-48a6-96f1-73194dee6671723855135179386227.jpg', NULL, '-7.0404581,112.5901454', 1, NULL),
(208, 1, '2026-01-24 09:49:41', 38, NULL, NULL, 133, 'scaled_00e7686d-4fc9-41dc-817a-a4dfad34ae5e6409587897800678970.jpg', NULL, '-7.041036,112.591019', 1, NULL),
(209, 1, '2026-01-24 09:54:33', 38, NULL, NULL, 134, 'scaled_eb69a961-d1f9-4f8a-969e-105e210a32033021710839748453195.jpg', NULL, '-7.0418488,112.5934392', 1, NULL),
(210, 1, '2026-01-24 10:00:43', 38, NULL, NULL, 136, 'scaled_15a84e25-08e5-49a7-abfc-2db2d762a3d12161817937953428758.jpg', NULL, '-7.0418159,112.5936836', 1, NULL),
(211, 1, '2026-01-24 10:07:30', 38, NULL, NULL, 137, 'scaled_1364f34c-b824-4321-b2e4-9f650478a0736972297489756992636.jpg', NULL, '-7.0407061,112.5845696', 1, NULL),
(212, 1, '2026-01-24 10:21:30', 38, NULL, NULL, 139, 'scaled_2bfdda7e-d51e-430a-b256-f0809286eb926697027918601625741.jpg', NULL, '-7.0062865,112.564937', 1, NULL),
(213, 1, '2026-01-24 11:52:27', 38, NULL, NULL, 83, 'scaled_74748b82-ab92-427d-bc26-f5c6570895962956214289575081955.jpg', NULL, '-6.9925668,112.5612974', 0, NULL),
(214, 1, '2026-01-26 08:42:49', 38, NULL, NULL, 9, 'scaled_4444befc-5ab7-45a7-a93e-5ed4ccea20541537047743725303329.jpg', NULL, '-6.9987663,112.5731219', 0, NULL),
(215, 1, '2026-01-26 09:04:47', 38, NULL, NULL, 12, 'scaled_b630039e-3ff1-4268-800e-8d746c9928327424168960472250634.jpg', NULL, '-7.0385189,112.5832361', 0, NULL),
(216, 1, '2026-01-26 09:13:34', 38, NULL, NULL, 88, 'scaled_3f4d6a2e-98de-46fa-b184-54cb4e5687273047080532466617996.jpg', NULL, '-7.042591,112.5868802', 0, NULL),
(217, 1, '2026-01-26 09:19:57', 38, NULL, NULL, 140, 'scaled_52e57d06-6e00-44bb-8842-c94af9b567331443951906836703715.jpg', NULL, '-7.0446657,112.5911574', 1, NULL),
(218, 1, '2026-01-26 09:21:48', 38, NULL, NULL, 79, 'scaled_1576f894-089e-4068-927b-a82d9f890e1c1878300049003400346.jpg', NULL, '-7.0449218,112.5913708', 0, NULL),
(219, 1, '2026-01-26 09:25:02', 38, NULL, NULL, 78, 'scaled_9db798da-b555-482c-af49-5b96faed01ab2761596062471086690.jpg', NULL, '-7.0485535,112.5897347', 0, NULL),
(220, 1, '2026-01-26 09:31:51', 38, NULL, NULL, 75, 'scaled_3838491e-9267-44da-9b71-91420321f30f4682714933966573988.jpg', NULL, '-7.0554966,112.5833911', 0, NULL),
(221, 1, '2026-01-26 09:34:35', 38, NULL, NULL, 89, 'scaled_885f8d85-8fac-4f26-9979-91d48b37b0082546857673318163722.jpg', NULL, '-7.0558293,112.5786056', 0, NULL),
(222, 1, '2026-01-26 09:48:08', 38, NULL, NULL, 72, 'scaled_56f6a430-1b0c-4a1c-bc86-24e7cf3a25c0422072906764526149.jpg', NULL, '-7.0455241,112.5546715', 0, NULL),
(223, 1, '2026-01-26 09:56:35', 38, NULL, NULL, 116, 'scaled_839679a8-fa79-4f18-8140-a8b74c84e2c9102351023016022495.jpg', NULL, '-7.0354945,112.5301909', 1, NULL),
(224, 1, '2026-01-26 10:04:04', 38, NULL, NULL, 90, 'scaled_2a0123b4-8efb-4698-8352-8c5d8ef80b496178721131909147775.jpg', NULL, '-7.0304135,112.521533', 0, NULL),
(225, 1, '2026-01-26 10:49:37', 38, NULL, NULL, 120, 'scaled_23ae7289-5fa6-44e8-a0e6-f0fd5c3334e58955480303012916750.jpg', NULL, '-6.9875659,112.506874', 0, NULL),
(226, 1, '2026-01-26 11:11:18', 38, NULL, NULL, 13, 'scaled_e171d46f-476f-4eac-bd99-b3b586cc1bdf2728782406125741726.jpg', NULL, '-6.9903114,112.5086485', 0, NULL),
(227, 1, '2026-01-26 11:31:56', 38, NULL, NULL, 142, 'scaled_32e6ceda-898e-4848-bccf-a3623b0e0a535034290436608888376.jpg', NULL, '-6.9872495,112.5209055', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_company`
--

DROP TABLE IF EXISTS `m_company`;
CREATE TABLE IF NOT EXISTS `m_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED ZEROFILL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `m_company`
--

INSERT INTO `m_company` (`id`, `name`, `address`, `phone`, `logo`, `latitude`, `longitude`, `created_at`, `created_by`, `updated_by`, `updated_at`, `deleted_at`) VALUES
(1, 'CV. Gresik', 'Gresik', '085123787539', 'Screenshot_2025-04-11_at_09.15.51.png', NULL, NULL, NULL, NULL, NULL, '2026-01-12 04:06:00', NULL),
(2, 'CV. Surabaya', 'Surabaya', '085123787539', NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-12 04:06:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_config`
--

DROP TABLE IF EXISTS `m_config`;
CREATE TABLE IF NOT EXISTS `m_config` (
  `config_id` int(11) NOT NULL,
  `config_name` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `m_config`
--

INSERT INTO `m_config` (`config_id`, `config_name`, `config_value`) VALUES
(1, 'app_name', 'Hippam'),
(2, 'admin_price', '2000'),
(3, 'company_address', 'Bojonegoro');

-- --------------------------------------------------------

--
-- Table structure for table `m_flow`
--

DROP TABLE IF EXISTS `m_flow`;
CREATE TABLE IF NOT EXISTS `m_flow` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `usergroup_view_all` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `usergroup_menu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `m_lokasi`
--

DROP TABLE IF EXISTS `m_lokasi`;
CREATE TABLE IF NOT EXISTS `m_lokasi` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `long` varchar(50) DEFAULT NULL,
  `status_lock` varchar(10) DEFAULT NULL,
  `radius` decimal(11,3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `m_lokasi`
--

INSERT INTO `m_lokasi` (`id`, `name`, `lat`, `long`, `status_lock`, `radius`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `company_id`) VALUES
(2, 'Masjid Kanjeng Sepuh Sedayu Gresik', '-6.989864', '112.5614821', 'y', 0.500, '2025-11-25 05:16:45', 30, '2026-01-02 10:40:03', 30, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_productcategory`
--

DROP TABLE IF EXISTS `m_productcategory`;
CREATE TABLE IF NOT EXISTS `m_productcategory` (
  `productcategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `productcategory_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `productcategory_price` decimal(10,2) DEFAULT NULL,
  `productcategory_created_date` datetime DEFAULT current_timestamp(),
  `productcategory_created_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `productcategory_parent_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`productcategory_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `m_productcategory`
--

INSERT INTO `m_productcategory` (`productcategory_id`, `productcategory_name`, `productcategory_price`, `productcategory_created_date`, `productcategory_created_by`, `productcategory_parent_id`) VALUES
(1, 'Abonemen', 1000.00, NULL, NULL, '0'),
(2, 'SOSIAL', NULL, NULL, NULL, '0'),
(3, 'RUMAH TANGGA', 4000.00, NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `m_retail`
--

DROP TABLE IF EXISTS `m_retail`;
CREATE TABLE IF NOT EXISTS `m_retail` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `location_lat` varchar(100) DEFAULT NULL,
  `location_long` varchar(100) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `m_retail`
--

INSERT INTO `m_retail` (`id`, `name`, `address`, `phone`, `location_lat`, `location_long`, `picture`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `company_id`) VALUES
(5, 'andromeda', 'bangkalan', '087373662223', '-7.1345775', '112.7171608', 'scaled_5bb51597-d81b-4530-b7fb-2489e0508b367084145567603224975.jpg', '2025-12-19 05:25:25', NULL, NULL, 31, NULL, 1),
(6, 'toko upinipin', 'hallo', '9984736363737', '-7.1345776', '112.7171607', NULL, '2025-12-19 05:27:02', NULL, NULL, 31, NULL, 1),
(7, 'toko rame2', 'sumenep', '09876543321', '-7.0072955', '113.8548122', 'scaled_1763951299996.jpg', '2025-12-19 05:31:31', NULL, NULL, 31, NULL, 1),
(8, 'K2 store', 'Mriunan sidayu', '081335109299', '-6.989634', '112.563975', 'scaled_TimePhoto_20251219_082527.jpg', '2026-01-02 10:44:05', NULL, NULL, 38, NULL, 1),
(9, 'Ara cell', 'Bonduwor ngawen sidayu', '', '-6.999025', '112.5730847', NULL, '2026-01-05 07:58:28', NULL, NULL, 38, NULL, 1),
(10, 'Angga anugrah', 'Bonduwor ngawen sidayu', '', '-7.0002205', '112.5751122', NULL, '2026-01-05 08:03:43', NULL, NULL, 38, NULL, 1),
(11, 'Bu yanti', '', 'Kisik mbungah', '-7.0356489', '112.5766595', NULL, '2026-01-05 08:22:38', NULL, NULL, 38, NULL, 1),
(12, 'Sumber Agung', 'Kisikmbungah', '', '-7.0384036', '112.5832702', 'scaled_e5aa4580-5dc2-478f-a1e2-168ec128af684445363749508305768.jpg', '2026-01-05 08:30:12', NULL, NULL, 38, NULL, 1),
(13, 'TRY Cell', 'Lasem sidayu', '', '-6.9904216', '112.5087756', NULL, '2026-01-05 09:46:08', NULL, NULL, 38, NULL, 1),
(14, 'Sumber Rejeki', 'Mbungah', '', '-6.9903472', '112.5087012', 'scaled_TimePhoto_20260105_090916.jpg', '2026-01-05 09:49:48', NULL, NULL, 38, NULL, 1),
(15, 'Suadah', 'Danten mbungah', '', '-6.9904491', '112.5086761', 'scaled_TimePhoto_20260105_084505.jpg', '2026-01-05 09:53:49', NULL, NULL, 38, NULL, 1),
(16, 'Tengah sawa', 'Pilang Sidayu', '', '-7.0023457', '112.508678', 'scaled_d841afc9-67f8-4bcc-9023-77141e08d6196898650920704946077.jpg', '2026-01-05 10:13:35', NULL, NULL, 38, NULL, 1),
(17, 'Mekar abadi', 'Kertosono Sidayu', '', '-6.9850411', '112.5190695', NULL, '2026-01-05 10:20:15', NULL, NULL, 38, NULL, 1),
(18, 'Lestari', 'Kertosono sidayu', '', '-6.9810486', '112.5259759', 'scaled_TimePhoto_20260105_103740.jpg', '2026-01-05 10:39:32', NULL, NULL, 38, NULL, 1),
(19, 'Wr Marto', 'Purwodadi sidayu', '', '-6.9882152', '112.5574408', 'scaled_86f285ec-ecb5-4ef8-8055-e574d83722fa4935717377204446397.jpg', '2026-01-05 11:00:15', NULL, NULL, 38, NULL, 1),
(20, 'La sentosa', 'Sambipondok sidayu', '', '-6.9720046', '112.5274663', 'scaled_9d14c2c0-2946-42d2-8890-52859982de562847002425746202796.jpg', '2026-01-06 08:06:45', NULL, NULL, 38, NULL, 1),
(21, 'Grimys cell', 'Sekapok Ujpangka', '', '-6.9522247', '112.5050892', 'scaled_6dcebc5f-b0ee-4efb-8c51-3cd5843a18bf7515770430050815104.jpg', '2026-01-06 08:40:41', NULL, NULL, 38, NULL, 1),
(22, 'Wr siti rohma', 'Gedangan sidayu', '', '-6.9721884', '112.4959934', 'scaled_d58d5933-29e8-47a6-9489-61e7e74767954811392439866733617.jpg', '2026-01-06 08:49:44', NULL, NULL, 38, NULL, 1),
(23, 'Fiza cell', 'Wotan panceng', '', '-6.9602043', '112.4859552', 'scaled_a7283ec0-e445-4ddf-8e05-e250a150fd9f6840470386911970970.jpg', '2026-01-06 08:58:24', NULL, NULL, 38, NULL, 1),
(24, 'Wr ali', 'Petung panceng', '', '-6.9675049', '112.4821695', 'scaled_25203376-8658-4e77-962a-2438ba3beb887934670307065253230.jpg', '2026-01-06 09:21:33', NULL, NULL, 38, NULL, 1),
(25, 'Nur alifa', 'Petung panceng', '', '-6.9694186', '112.4811423', 'scaled_389ad776-35b7-4126-860f-5001cbd61fb8794935576932307569.jpg', '2026-01-06 09:41:12', NULL, NULL, 38, NULL, 1),
(26, 'UD Liya', 'Surowiti panceng', '', '-6.9379513', '112.45596', NULL, '2026-01-06 10:03:49', NULL, NULL, 38, NULL, 1),
(27, 'Wr Sukana', 'Larangan panceng', '', '-6.9195778', '112.4762969', 'scaled_52cfca66-8454-478b-a801-58e2fb560e026284694487385560909.jpg', '2026-01-06 10:18:18', NULL, NULL, 38, NULL, 1),
(28, 'Fajar PAS', 'Larangan panceng', '', '-6.9123316', '112.4797298', NULL, '2026-01-06 10:22:28', NULL, NULL, 38, NULL, 1),
(29, 'UD Lumayan', 'Larangan panceng', '', '-6.9105895', '112.4796442', 'scaled_33fc14c4-733a-42be-b9e9-4d7afe525b561735510319124752404.jpg', '2026-01-06 10:37:02', NULL, NULL, 38, NULL, 1),
(30, 'Al aibar', 'Ujung pangkah', '', '-6.9118827', '112.5675561', 'scaled_590eb78d-f3a6-49ef-af1f-872eb8dc634c451284788828954052.jpg', '2026-01-06 11:03:40', NULL, NULL, 38, NULL, 1),
(31, 'Putra jaya abadi', 'Mentaras dukun', '', '-6.9685678', '112.4389575', 'scaled_3f93be58-38d2-40fe-b880-375d68212b352556406377848278771.jpg', '2026-01-07 08:22:18', NULL, NULL, 38, NULL, 1),
(32, 'Bersaudara', 'Lowayu ndukun', '', '-6.9690923', '112.4218747', 'scaled_ee584e80-bb56-4e38-a160-8e8169fe39d97026707260631278193.jpg', '2026-01-07 08:28:28', NULL, NULL, 38, NULL, 1),
(33, 'Kusuma cell', 'Lowayu dukon', '', '-6.9740399', '112.4206274', 'scaled_74a97252-d436-42a9-a2d5-18cc8d106c931789530386322531222.jpg', '2026-01-07 08:32:38', NULL, NULL, 38, NULL, 1),
(34, 'Giga cell', 'Sumorber panceng', '', '-6.94961', '112.4286329', 'scaled_971edefb-af89-4d04-9a19-acc4169cfafa8136983316919395830.jpg', '2026-01-07 09:02:28', NULL, NULL, 38, NULL, 1),
(35, 'Imel cell', 'Sumorber panceng', '', '-6.9479795', '112.4290292', 'scaled_41d9c212-d57a-44fa-bc9f-964eddeaa3de8628296899077003839.jpg', '2026-01-07 09:05:44', NULL, NULL, 38, NULL, 1),
(36, 'Rejo mulyo', 'Ndengok panceng', '', '-6.919719', '112.4617419', 'scaled_65a63884-fde7-4169-bb31-ad88821ad2081777372545801785332.jpg', '2026-01-07 09:45:50', NULL, NULL, 38, NULL, 1),
(37, 'Rejomulyo', 'Propoh panceng', '', '-6.9191698', '112.4523359', NULL, '2026-01-07 09:47:39', NULL, NULL, 38, NULL, 1),
(38, 'Al ashar', 'Propoh panceng', '', '-6.9175074', '112.4544708', 'scaled_1e3dbb09-b5bc-4350-9bb2-3c4af0eeef01739779255278864709.jpg', '2026-01-07 09:50:54', NULL, NULL, 38, NULL, 1),
(39, 'Toko mini', 'Panceng gresik', '', '-6.908709', '112.4593841', 'scaled_43a33981-f1b5-4efa-9ea7-8126fdffcbb87913475695962877311.jpg', '2026-01-07 09:57:55', NULL, NULL, 38, NULL, 1),
(40, 'Tk mini', 'Panceng gresik', '', '-6.9086773', '112.4592761', 'scaled_2c8aff60-13d2-47bb-ad9e-7450bf7898ce8997352853848237847.jpg', '2026-01-07 09:59:14', NULL, NULL, 38, NULL, 1),
(41, 'Alfi collecition', 'Delgan panceng', '', '-6.8928879', '112.4658395', 'scaled_944e09f8-e9cd-4be0-b565-754ce616dc149085685274852983682.jpg', '2026-01-07 10:10:07', NULL, NULL, 38, NULL, 1),
(42, 'Bintang fajar', 'Delgan panceng', '', '-6.8928879', '112.4658395', 'scaled_62b07f98-7ccc-4b21-b583-f17ebaedcf963256680534849601467.jpg', '2026-01-07 10:12:54', NULL, NULL, 38, NULL, 1),
(43, 'Star phone', 'Delgan panceng', '', '-6.8918196', '112.4649998', 'scaled_99aad3c5-645b-4e59-ace4-c39e576eec343381211605533084829.jpg', '2026-01-07 10:15:24', NULL, NULL, 38, NULL, 1),
(44, 'Tk UNIK', 'Campurjo gresik', '', '-6.8924278', '112.4655904', 'scaled_280dc153-354d-42d6-a0d2-63db9b1d1cab8552592766472399595.jpg', '2026-01-07 10:18:44', NULL, NULL, 38, NULL, 1),
(45, 'Wa2n P', 'Campurejo', '', '-6.8838927', '112.4552704', 'scaled_2f59f906-02f0-4e80-933c-5409c2ffa6755038492660556320003.jpg', '2026-01-07 10:26:38', NULL, NULL, 38, NULL, 1),
(46, 'Tk Naira', 'Camporrejo', '', '-6.8853499', '112.4535465', NULL, '2026-01-07 10:29:11', NULL, NULL, 38, NULL, 1),
(47, 'Smoker UD GRESSE', 'Cangaan skapok', '', '-6.9881186', '112.557498', NULL, '2026-01-07 13:38:02', NULL, NULL, 38, NULL, 1),
(48, 'SmokerTeh kota', 'Mriunan sidayu', '', '-6.9899071', '112.5644716', 'scaled_04deeae3-b0ec-4438-8e01-a7ba72918ce94999065158272802539.jpg', '2026-01-07 16:46:50', NULL, NULL, 38, NULL, 1),
(49, 'Bu siti', 'Lowahu dukon', '', '-6.9652173', '112.4220124', 'scaled_108cc911-96a7-4fda-ba33-ee6656f1adce9128826061258886123.jpg', '2026-01-08 09:03:51', NULL, NULL, 38, NULL, 1),
(50, 'PK anto', 'Wonokerto ndukon', '', '-6.965841', '112.3988559', 'scaled_4aed232d-a3d7-4a5a-91ea-f6350bc4a89a2795281048345159438.jpg', '2026-01-08 09:11:27', NULL, NULL, 38, NULL, 1),
(51, 'M&M mart', 'SAWO NDUKON', '', '-6.9585605', '112.3908732', 'scaled_3b37d702-15f6-4e0b-9125-e660211829c36511283326229279248.jpg', '2026-01-08 09:17:02', NULL, NULL, 38, NULL, 1),
(52, 'Tk berkah', 'Solokuro', '', '-6.9411357', '112.4084628', 'scaled_679dc13d-2492-4322-af60-720b19dbf0ee6564923485152096191.jpg', '2026-01-08 09:24:49', NULL, NULL, 38, NULL, 1),
(53, 'Kios natas', 'Solokuro', '', '-6.9384987', '112.409936', 'scaled_83a366a4-40e5-4a43-8ecb-fadffa27e5172825307006285772374.jpg', '2026-01-08 09:27:20', NULL, NULL, 38, NULL, 1),
(54, 'Wr Masduki', 'Beluri', '', '-6.9158026', '112.4204898', 'scaled_02976ba6-5523-44b9-b54d-f1a34be302692936838389422946318.jpg', '2026-01-08 09:35:50', NULL, NULL, 38, NULL, 1),
(55, 'Bu Khomima', 'Beluri', '', '-6.9135004', '112.4211241', 'scaled_c2ba4c3a-1afa-433b-8b6d-a23575cd1c351714136044657664587.jpg', '2026-01-08 09:38:42', NULL, NULL, 38, NULL, 1),
(56, 'Permata', 'Tlogosadang', '', '-6.8946846', '112.4328531', 'scaled_a2e067af-b7a9-4e91-aa08-c6c7f7a94fcf7192192007703718305.jpg', '2026-01-08 09:52:31', NULL, NULL, 38, NULL, 1),
(57, 'Wr Mbah Men', 'Tlogosadang', '', '-6.8936043', '112.4337562', 'scaled_0e653675-0892-4f0d-b2ed-92280e9e468a7819480212462832851.jpg', '2026-01-08 09:58:12', NULL, NULL, 38, NULL, 1),
(58, 'TK Amari', 'Banyutengah', '', '-6.8941845', '112.4505739', 'scaled_4c99fc87-f181-4048-8620-fdb724cca5083878463841193771240.jpg', '2026-01-08 10:06:44', NULL, NULL, 38, NULL, 1),
(59, 'TK suswati', 'Mbanyutengah', '', '-6.89046', '112.4528353', 'scaled_43d7e263-a3e2-4f34-9ee8-4d8663f47b4a4956722297827248549.jpg', '2026-01-08 10:16:36', NULL, NULL, 38, NULL, 1),
(60, 'Tk Dewi F', 'Prupoh panceng', '', '-6.9121833', '112.4578942', 'scaled_e4349d46-cbaf-4153-8973-03a1c93f0fd38851836833198963105.jpg', '2026-01-08 10:25:23', NULL, NULL, 38, NULL, 1),
(61, 'TK Nanda BSP', 'Sekapok', '', '-6.9564614', '112.5045647', 'scaled_97e612ba-9251-4aee-bbfa-72f5c251fda25188873708896089188.jpg', '2026-01-08 10:47:37', NULL, NULL, 38, NULL, 1),
(62, 'Wr Ji\'in', 'Telaga rambet', '', '-6.9915364', '112.5585472', 'scaled_e4ddfb68-fdb9-4a40-8528-14c347d86a175660780362419719112.jpg', '2026-01-08 13:26:55', NULL, NULL, 38, NULL, 1),
(63, 'Wr kawan lama', 'Sidomulyo sidayu', '', '-6.9911551', '112.5630472', 'scaled_f4ebbae9-6d8c-4a55-b939-1d213237acc9643069746849291774.jpg', '2026-01-09 07:45:35', NULL, NULL, 38, NULL, 1),
(64, 'Wr cak budi', 'Mriunan sdyu', '', '-6.9916182', '112.5683311', NULL, '2026-01-09 09:08:56', NULL, NULL, 38, NULL, 1),
(65, 'Wr basid', 'Bunderan sidayu', '', '-6.9885757', '112.5599674', 'scaled_1f9a04f4-f381-4704-930e-aef934e07e875666083328367025809.jpg', '2026-01-09 09:15:48', NULL, NULL, 38, NULL, 1),
(66, 'Wr Kholik', 'Ndondong mbungah', '', '-7.0316089', '112.5608646', 'scaled_77a406e9-3f2b-4f49-bcc0-db1124546d7f7079576970754591463.jpg', '2026-01-10 08:47:39', NULL, NULL, 38, NULL, 1),
(67, 'Wr Rete', 'Ndondong mbungah', '', '-7.0316342', '112.5606758', 'scaled_a4d1a3fd-7010-4b66-92a0-10862eb6b18e6307121710891410503.jpg', '2026-01-10 08:50:22', NULL, NULL, 38, NULL, 1),
(68, 'Wr Sa\'ada', 'Ndondong mbungah', '', '-7.0317062', '112.5604362', 'scaled_4ec7bd5d-41bb-4ffe-b190-b9743b6358667838019742542639637.jpg', '2026-01-10 08:58:06', NULL, NULL, 38, NULL, 1),
(69, 'Nada cell', 'Masangan mbungah', '', '-7.0452189', '112.554495', 'scaled_c703e96e-a135-471d-ac78-0c5ae0d199e21397312179629006051.jpg', '2026-01-10 09:10:45', NULL, NULL, 38, NULL, 1),
(70, 'Bu mami', 'MASANGAN MBUNGAH', '', '-7.0452189', '112.554495', 'scaled_7720e1b0-5d90-4361-8387-5b6b8b22cbe68516893427423832591.jpg', '2026-01-10 09:16:23', NULL, NULL, 38, NULL, 1),
(71, 'Toko Pk anas', 'Masangan Mbungah', '', '-7.0455327', '112.554495', 'scaled_e5265e70-32a3-4203-a9a0-bdab3b4dc6848675255392363166511.jpg', '2026-01-10 09:19:48', NULL, NULL, 38, NULL, 1),
(72, 'Tk Pkmunawir', 'Masangan mbungah', '', '-7.0454833', '112.5545125', 'scaled_1781b93c-252e-4beb-8187-69c199ea7ae65863250867387744912.jpg', '2026-01-10 09:27:51', NULL, NULL, 38, NULL, 1),
(73, 'Tk Najwa', 'Masangan mbungah', '', '-7.0491185', '112.5630897', 'scaled_29c4d660-cb65-464b-a092-f6d2efb4be951932995896426614888.jpg', '2026-01-10 09:38:18', NULL, NULL, 38, NULL, 1),
(74, 'Wr Mak ti', 'Danten mbungah', '', '-7.0553967', '112.5828038', 'scaled_ae359ab9-736e-4778-b010-868638fa8aa25214261304233752976.jpg', '2026-01-10 09:49:06', NULL, NULL, 38, NULL, 1),
(75, 'Wr GAPURO', 'Mbedanten mbungah', '', '-7.0553076', '112.5834505', 'scaled_4635704f-e18b-46ea-b5d6-b4afb90aebb87878222644899710983.jpg', '2026-01-10 09:56:17', NULL, NULL, 38, NULL, 1),
(76, 'Tk Mini', 'Bedanten mbungah', '', '-7.0550378', '112.5873344', 'scaled_d9e3c5a1-5965-4b16-b4ca-0946157dcb5c5877609947035262078.jpg', '2026-01-10 10:28:31', NULL, NULL, 38, NULL, 1),
(77, 'Tk aslikha', 'Bedanten mbungah', '', '-7.0531601', '112.5879796', 'scaled_bb6825f0-0cfb-438b-af6c-3202523efa778511601983695268918.jpg', '2026-01-10 10:32:36', NULL, NULL, 38, NULL, 1),
(78, 'Tk alina', 'Ngindro mbungah', '', '-7.0484863', '112.5891359', 'scaled_22202695-14ed-4252-b783-dd0daa5b12691907170222937691057.jpg', '2026-01-10 10:37:57', NULL, NULL, 38, NULL, 1),
(79, 'Tk bu Suratin', 'Sungonlegowo mbungah', '', '-7.0449029', '112.5917432', 'scaled_956b0a2b-eb13-4ed1-a14d-e911505cf6046436382954839160402.jpg', '2026-01-10 10:41:26', NULL, NULL, 38, NULL, 1),
(80, 'Tk Makin', 'Sungonlegowo mbungah', '', '-7.0449218', '112.5913708', 'scaled_80d36468-92af-4467-a21c-c649d87677867585504561757575287.jpg', '2026-01-10 10:43:36', NULL, NULL, 38, NULL, 1),
(81, 'Wr Mujiono', 'Sungonlegowo mbungah', '', '-7.0430749', '112.5884436', 'scaled_d46e23bf-7c85-47df-82d1-51a5d8ddc5487387512224906987500.jpg', '2026-01-10 10:47:38', NULL, NULL, 38, NULL, 1),
(82, 'Kd Arrayan', 'Kisik mbungah', '', '-7.0378432', '112.5835954', 'scaled_1a2f3787-b8e0-4d28-b767-1b3c4a3245558950357057290165606.jpg', '2026-01-10 10:55:57', NULL, NULL, 38, NULL, 1),
(83, 'R-bacco', 'Sidayu gresik', '', '-6.9925589', '112.5611795', 'scaled_de797f07-c02e-49a0-9990-632414e584e61607880522598633976.jpg', '2026-01-10 11:10:49', NULL, NULL, 38, NULL, 1),
(84, 'Wr Mak ju', 'Ngawen sidayu', '', '-7.0080986', '112.5671888', 'scaled_d00f5c5b-09de-416d-8726-0b180df99dd21713259852318035556.jpg', '2026-01-12 08:44:33', NULL, NULL, 38, NULL, 1),
(85, 'Wr Taufek', 'Kisik mbungah', '', '-7.0345761', '112.5770431', NULL, '2026-01-12 09:12:20', NULL, NULL, 38, NULL, 1),
(86, 'Tk subandi', 'Kisik mbungah', '', '-7.0399371', '112.5832778', 'scaled_f6160db9-37a4-49d9-9ce6-f4891c6c0a994284650844233060398.jpg', '2026-01-12 09:25:23', NULL, NULL, 38, NULL, 1),
(87, 'Tk ad cell', 'Ngindro mbungah', '', '-7.0398732', '112.5832578', 'scaled_a0d48bfc-43da-4a80-9778-78297007c6613803310950479385963.jpg', '2026-01-12 09:27:54', NULL, NULL, 38, NULL, 1),
(88, 'Bu Nihaya', 'Legowo mbungah', '', '-7.0425548', '112.5875732', 'scaled_9c486e6d-be63-4816-82c6-3b9fb078e9dc958680734455484953.jpg', '2026-01-12 09:33:49', NULL, NULL, 38, NULL, 1),
(89, 'Bu Saedah', 'Mbungah', '', '-7.0560298', '112.5793184', 'scaled_2307b82c-2c2e-42fb-82ec-fc7d4cf3cd626735943998530306370.jpg', '2026-01-12 09:44:51', NULL, NULL, 38, NULL, 1),
(90, 'TK Sumber rejeki', 'Mojopuro gede mbunga', '', '-7.0305012', '112.5213815', 'scaled_207cdbb9-6f53-42ed-913a-c1795658fafb4837797799362222032.jpg', '2026-01-12 10:17:00', NULL, NULL, 38, NULL, 1),
(91, 'Tk aan', 'Mbungah', '', '-7.0310654', '112.5231057', 'scaled_2c5b0309-59b9-41cf-ab89-709ddb683a7364651689507943645.jpg', '2026-01-12 10:24:54', NULL, NULL, 38, NULL, 1),
(92, 'TK suhaimi', 'Mbungah', '', '-7.0315359', '112.5233319', 'scaled_c856ea39-3149-4952-aa80-a86677cb901e5593237692974713080.jpg', '2026-01-12 10:27:22', NULL, NULL, 38, NULL, 1),
(93, 'Tk KHASANA', 'Mojopuro Mbungah', '', '-7.0342778', '112.528793', 'scaled_d3559530-6d30-4008-82d6-7ac15c8efab86288992968955579179.jpg', '2026-01-12 10:34:00', NULL, NULL, 38, NULL, 1),
(94, 'Tk Khasana', 'Mbungah', '', '-7.0335753', '112.5258941', 'scaled_071ec00a-59ab-4b07-8d4c-79487128ef9a1867055109027880303.jpg', '2026-01-12 10:37:18', NULL, NULL, 38, NULL, 1),
(95, 'Tk Nadhifa', 'Mbungah', '', '-7.0334533', '112.525806', 'scaled_3aeef56e-68bb-46a4-a42f-01b1ee6a75b78796403767225109657.jpg', '2026-01-12 10:40:13', NULL, NULL, 38, NULL, 1),
(96, 'Tk ULUM', 'Mbungah', '', '-7.0335538', '112.5258967', NULL, '2026-01-12 10:42:03', NULL, NULL, 38, NULL, 1),
(97, 'Cak BALI', 'Mbungah', '', '-7.0345426', '112.5283169', 'scaled_e34e5a2a-21f8-4c27-9ce7-a40e7fdf22f55676679964792941426.jpg', '2026-01-12 10:48:24', NULL, NULL, 38, NULL, 1),
(98, 'Tk Dua bersodara', 'Mbungah', '', '-7.0342778', '112.528793', 'scaled_76332723-0f4e-4b4f-883f-9701de9967e21260612476781458642.jpg', '2026-01-12 10:55:07', NULL, NULL, 38, NULL, 1),
(99, 'Bu sony', 'Galalo mbungah', '', '-7.0358832', '112.5306981', 'scaled_d3ab4458-a68e-4e81-a6bd-8ac47ceff0c37380817822166910424.jpg', '2026-01-12 11:01:55', NULL, NULL, 38, NULL, 1),
(100, 'Bunga inda', 'Mbungah', '', '-7.0382871', '112.5343296', 'scaled_83205628-2d38-45a0-9dae-77a9edea24f06523699749577977051.jpg', '2026-01-12 11:04:22', NULL, NULL, 38, NULL, 1),
(101, 'Tk angga anugra', 'Sidayu', '', '-7.0002284', '112.5751423', 'scaled_7565bd9d-39d6-473e-8296-d1c76986951a707016934878460818.jpg', '2026-01-12 11:35:43', NULL, NULL, 38, NULL, 1),
(102, 'Tk atisa', 'Purwodadi sdy', '', '-6.992672', '112.5601193', 'scaled_e6f65e63-32fa-4228-aae7-bd41178c052f8101035107223304729.jpg', '2026-01-12 14:00:53', NULL, NULL, 38, NULL, 1),
(103, 'TK atisa', 'Purwodadi', '', '-6.9926293', '112.5600799', 'scaled_1d411f7e-aca8-4583-ae79-aa11e46da1898401661849372324980.jpg', '2026-01-12 14:01:31', NULL, NULL, 38, NULL, 1),
(104, 'Wr error', 'Petong', '', '-6.9712117', '112.476888', 'scaled_fd56a814-5229-4584-8d2d-2f22b051daa17249810332461534287.jpg', '2026-01-14 08:02:33', NULL, NULL, 38, NULL, 1),
(105, 'TK Maulana', 'Sirowiti panceng', '', '-6.9292614', '112.4686177', 'scaled_92ffe838-eeaa-477e-8162-33da76972cef7323640836321116674.jpg', '2026-01-14 10:17:05', NULL, NULL, 38, NULL, 1),
(106, 'Bu rustatik', 'Larangan panceng', '', '-6.9122553', '112.4796225', 'scaled_b2749a96-a20c-4627-8969-b20d6ba504e61700441181214730280.jpg', '2026-01-14 10:27:48', NULL, NULL, 38, NULL, 1),
(107, 'Wr kawan lama', 'Sidayu', '', '-6.9913032', '112.5617945', 'scaled_3e332b3f-a64f-4020-b13a-1c8b49250fe73175710733364046381.jpg', '2026-01-15 07:48:10', NULL, NULL, 38, NULL, 1),
(108, 'Tk hani', 'Mentaras', '', '-6.9722223', '112.4526942', 'scaled_d76d7288-99de-47f8-bf33-2bf514b776c53097477006994993617.jpg', '2026-01-15 08:56:31', NULL, NULL, 38, NULL, 1),
(109, 'Adi jaya', 'Mentaras', '', '-6.9726691', '112.4537162', 'scaled_44055767-1ea2-4558-906f-b37b6f31513f3423708963888255840.jpg', '2026-01-15 09:04:57', NULL, NULL, 38, NULL, 1),
(110, 'Mita jaya', 'Mbeluri', '', '-6.9214058', '112.4174744', 'scaled_c7fc52ad-4170-4ee9-bd13-dedafc0743a22030280238362154614.jpg', '2026-01-15 09:53:11', NULL, NULL, 38, NULL, 1),
(111, 'TK unik', 'Campurejo', '', '-6.8902686', '112.4619026', 'scaled_6d9fdb2a-e8d6-46df-95a5-ad1249e644353152962747862406888.jpg', '2026-01-15 11:01:04', NULL, NULL, 38, NULL, 1),
(112, 'Wr sedayu', 'Sidayu', '', '-6.9941683', '112.5638935', 'scaled_2d1acee6-10eb-462b-8947-b0b7ffeeff108285910861917152264.jpg', '2026-01-16 08:19:49', NULL, NULL, 38, NULL, 1),
(113, 'Wr B-pas', 'Sidayu', '', '-6.9869996', '112.5645521', 'scaled_be472959-66c6-4567-97b8-c412de0d78f46972499123180450473.jpg', '2026-01-16 09:35:32', NULL, NULL, 38, NULL, 1),
(114, 'Tk Subandi', 'Kisik mbungah', '', '-7.0398136', '112.5831421', NULL, '2026-01-19 09:17:11', NULL, NULL, 38, NULL, 1),
(115, 'Wr fauzan', 'Kisik mbungah', '', '-7.0550704', '112.5872392', 'scaled_4e5fa209-83c4-493c-900d-5e2a9a26e8cc5483587901933056596.jpg', '2026-01-19 09:35:56', NULL, NULL, 38, NULL, 1),
(116, 'Wr dua saudara', 'Galalo mbungah', '', '-7.0354789', '112.5302615', 'scaled_e1f0ffd9-79fb-4f89-9b5b-c6e2945785366246608885038773893.jpg', '2026-01-19 10:17:31', NULL, NULL, 38, NULL, 1),
(117, 'Wr sodara', 'Galalo mbungah', '', '-7.0355298', '112.5303673', 'scaled_f9094bda-d7d0-48e5-b362-0f39bed244c82348800254656984388.jpg', '2026-01-19 10:18:49', NULL, NULL, 38, NULL, 1),
(118, 'TOKO SRJ', 'Ndukon', '', '-7.012719', '112.515157', NULL, '2026-01-19 10:31:27', NULL, NULL, 38, NULL, 1),
(119, 'TK Abra', 'Dokon', '', '-7.0103337', '112.5120305', 'scaled_fed9bea9-0896-42c9-ae0f-262ca9db976a4078770596567323121.jpg', '2026-01-19 10:35:03', NULL, NULL, 38, NULL, 1),
(120, 'Wr kasiadi', 'Lasem sdy', '', '-6.9876105', '112.5068176', 'scaled_23e0ca2a-8d6d-4a78-8fb8-9a77c96f1a0e2412556718779036431.jpg', '2026-01-19 11:15:28', NULL, NULL, 38, NULL, 1),
(121, 'HM motor', 'Purwodadi', '', '-6.988255', '112.5577535', 'scaled_26662511-b8a6-406b-a536-88279c313ac38946574890147394378.jpg', '2026-01-19 14:37:55', NULL, NULL, 38, NULL, 1),
(122, 'Bu ismail', 'Sera panceng', '', '-6.9521657', '112.4447489', 'scaled_dfd40447-7a02-4d41-8743-b562300558661647321199369510232.jpg', '2026-01-20 09:48:02', NULL, NULL, 38, NULL, 1),
(123, 'Bu sukana', 'Larangan prupo', '', '-6.9194437', '112.4762961', 'scaled_c914195b-9ea2-40fe-939b-748564e3c1701348088269206938541.jpg', '2026-01-20 10:14:38', NULL, NULL, 38, NULL, 1),
(124, 'Ud muntarno', 'Lasem sidayu', '', '-6.9859265', '112.517652', 'scaled_e2944690-b6a9-418a-b319-ca1ac5ca3bd82998560292932600950.jpg', '2026-01-20 11:05:41', NULL, NULL, 38, NULL, 1),
(125, 'Adi jaya', 'Mentaras', '', '-6.9721603', '112.4524956', NULL, '2026-01-21 08:38:52', NULL, NULL, 38, NULL, 1),
(126, 'Khasanah', 'Murber panceng', '', '-6.946706', '112.4303653', 'scaled_ace7438c-8081-454c-b43f-0c91b4c2ccc08792544783483113569.jpg', '2026-01-21 09:51:48', NULL, NULL, 38, NULL, 1),
(127, 'Zhafir cell', 'Siwalan panceng', '', '-6.9431262', '112.4318159', 'scaled_f24aa7fe-5409-4e89-96ba-a91b807dd7694559730295832293199.jpg', '2026-01-21 09:54:42', NULL, NULL, 38, NULL, 1),
(128, 'TK Rejo mulyo', 'Panceng', '', '-6.919148', '112.4524766', 'scaled_35801644-6a1e-46d0-9ef9-ef6be03ca3297693848478112463960.jpg', '2026-01-21 10:06:31', NULL, NULL, 38, NULL, 1),
(129, 'Bu romiyatun', 'Sawo', '', '-6.9252369', '112.4159228', 'scaled_67d3147c-913b-4152-922b-5471e4fc8a327194336495719822183.jpg', '2026-01-22 09:25:02', NULL, NULL, 38, NULL, 1),
(130, 'Rully', 'Sadang', '', '-6.8943322', '112.4332267', 'scaled_79bd5a38-5c8b-4d6c-9d22-9e3d8fdafa4b9198255578113560199.jpg', '2026-01-22 09:45:42', NULL, NULL, 38, NULL, 1),
(131, 'Bu tianah', 'Legowo', '', '-7.0402444', '112.5897063', 'scaled_574cd5ed-844a-4e5a-b43a-390eeed3f9c57306091107272030227.jpg', '2026-01-24 09:42:21', NULL, NULL, 38, NULL, 1),
(132, 'Bu niamila', 'Legowo', '', '-7.040489', '112.590134', 'scaled_83b7242e-064a-4d4a-9002-a4afb1fb58b46943698196519975141.jpg', '2026-01-24 09:44:48', NULL, NULL, 38, NULL, 1),
(133, 'Asofiya', 'Legowo', '', '-7.041036', '112.591019', 'scaled_f012d081-6810-4156-b79b-2be0272023533176235816729634895.jpg', '2026-01-24 09:49:23', NULL, NULL, 38, NULL, 1),
(134, 'pojok kali', 'Legowo', '', '-7.0418116', '112.5934025', 'scaled_e377c820-2817-4514-b353-4f10120817a88715372516144438205.jpg', '2026-01-24 09:54:26', NULL, NULL, 38, NULL, 1),
(135, 'Bu hima', 'Legowo', '', '-7.0416689', '112.5935834', 'scaled_ea858e81-ccb7-4665-a895-33b4a8545c227324416070676412939.jpg', '2026-01-24 09:59:25', NULL, NULL, 38, NULL, 1),
(136, 'Bu hima', 'Legowo', '', '-7.0418159', '112.5936836', 'scaled_8080dca4-9c15-4da1-b711-6e22f0bc4ee78793669830556912625.jpg', '2026-01-24 10:00:37', NULL, NULL, 38, NULL, 1),
(137, 'barokah', 'Ngindro mbunga', '', '-7.0407061', '112.5845696', 'scaled_f0a84d7e-d2de-43d1-a50f-7a1cbd8df564445674766503630404.jpg', '2026-01-24 10:07:13', NULL, NULL, 38, NULL, 1),
(138, 'Wr kasan', 'Ngawen', '', '-7.0079325', '112.5660421', 'scaled_285219ad-ad4d-45da-9d0c-c99c745c06987246406691377642667.jpg', '2026-01-24 10:19:45', NULL, NULL, 38, NULL, 1),
(139, 'Wr kasan', 'Ngawen sidayu', '', '-7.0060892', '112.564901', 'scaled_41cf7e0a-4ba1-4932-9143-275e28f77cb71982323455121875814.jpg', '2026-01-24 10:21:16', NULL, NULL, 38, NULL, 1),
(140, 'Tk ilmiati', 'Danten', '', '-7.0442566', '112.5921157', 'scaled_334965ac-1a39-43e0-81ee-376d5ebc1bd75804394105798369176.jpg', '2026-01-26 09:19:36', NULL, NULL, 38, NULL, 1),
(141, 'TK abra', 'Ndukon', '', '-7.0113577', '112.5152208', 'scaled_a54c95c5-45ca-4244-989c-0b33e8d280073439870805296309308.jpg', '2026-01-26 10:21:56', NULL, NULL, 38, NULL, 1),
(142, 'Tk Tengah sawa', 'Lasem sidayu', '', '-6.9872214', '112.5207791', 'scaled_aef0f281-64ea-427e-8bd4-8c0e7e6316bf5830369831236202453.jpg', '2026-01-26 11:31:43', NULL, NULL, 38, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_warehouse`
--

DROP TABLE IF EXISTS `m_warehouse`;
CREATE TABLE IF NOT EXISTS `m_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `m_warehouse`
--

INSERT INTO `m_warehouse` (`id`, `name`, `address`, `phone`, `logo`, `latitude`, `longitude`, `created_at`, `created_by`, `updated_by`, `updated_at`, `deleted_at`, `company_id`) VALUES
(2, 'gresik', 'gresik', '081216252499', NULL, 0, 0, '2025-12-19 04:03:03', 30, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_agen`
--

DROP TABLE IF EXISTS `stock_agen`;
CREATE TABLE IF NOT EXISTS `stock_agen` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `stock_agen`
--

INSERT INTO `stock_agen` (`id`, `product_id`, `agen_id`, `count`, `created_at`, `created_by`, `updated_at`, `updated_by`, `company_id`) VALUES
(17, 13, 31, 5, NULL, NULL, NULL, NULL, 1),
(18, 18, 31, 11, NULL, NULL, NULL, NULL, 1),
(19, 2, 38, 0, NULL, NULL, NULL, NULL, 1),
(20, 3, 38, 21, NULL, NULL, NULL, NULL, 1),
(21, 1, 38, 0, NULL, NULL, NULL, NULL, 1),
(22, 10, 38, 11, NULL, NULL, NULL, NULL, 1),
(23, 9, 38, 11, NULL, NULL, NULL, NULL, 1),
(24, 13, 38, 11, NULL, NULL, NULL, NULL, 1),
(25, 15, 38, 17, NULL, NULL, NULL, NULL, 1),
(26, 20, 38, 13, NULL, NULL, NULL, NULL, 1),
(27, 17, 38, 27, NULL, NULL, NULL, NULL, 1),
(28, 18, 38, 11, NULL, NULL, NULL, NULL, 1),
(29, 5, 38, 24, NULL, NULL, NULL, NULL, 1),
(30, 16, 38, 12, NULL, NULL, NULL, NULL, 1),
(31, 22, 38, 20, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_warehouse`
--

DROP TABLE IF EXISTS `stock_warehouse`;
CREATE TABLE IF NOT EXISTS `stock_warehouse` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `stock_warehouse`
--

INSERT INTO `stock_warehouse` (`id`, `product_id`, `company_id`, `warehouse_id`, `count`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(6, 13, 1, 2, 350, '2025-12-18 13:52:24', 30, '2026-01-12 01:15:42', 30),
(7, 18, 1, 2, 139, '2025-12-18 13:52:24', 30, '2026-01-02 03:29:03', 30),
(8, 2, 1, 2, 199, '2026-01-02 03:24:46', 30, '2026-01-26 00:56:57', 30),
(9, 1, 1, 2, 110, '2026-01-02 03:24:46', 30, '2026-01-02 03:29:03', 30),
(10, 3, 1, 2, 190, '2026-01-02 03:24:46', 30, '2026-01-26 00:56:57', 30),
(11, 10, 1, 2, 214, '2026-01-02 03:24:46', 30, '2026-01-18 22:05:58', 30),
(12, 9, 1, 2, 120, '2026-01-02 03:24:46', 30, '2026-01-02 03:29:03', 30),
(13, 5, 1, 2, 90, '2026-01-02 03:24:46', 30, '2026-01-26 00:56:57', 30),
(14, 17, 1, 2, 150, '2026-01-02 03:24:46', 30, '2026-01-26 00:56:57', 30),
(15, 15, 1, 2, 50, '2026-01-02 03:24:46', 30, '2026-01-02 03:29:03', 30),
(16, 16, 1, 2, 300, '2026-01-02 03:24:46', 30, '2026-01-14 01:10:16', 30),
(17, 20, 1, 2, 120, '2026-01-02 03:24:46', 30, '2026-01-21 01:05:56', 30),
(18, 22, 1, 2, 30, '2026-01-12 01:13:13', 30, '2026-01-26 00:56:57', 30);

-- --------------------------------------------------------

--
-- Table structure for table `s_akses`
--

DROP TABLE IF EXISTS `s_akses`;
CREATE TABLE IF NOT EXISTS `s_akses` (
  `akses_id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `akses_active` varchar(1) DEFAULT 'y',
  `akses_code` varchar(100) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`akses_id`) USING BTREE,
  KEY `lnk_m_menu_t_akses` (`menu_id`) USING BTREE,
  KEY `lnk_m_usergroup_t_akses` (`usergroup_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_akses`
--

INSERT INTO `s_akses` (`akses_id`, `usergroup_id`, `menu_id`, `akses_active`, `akses_code`, `order`, `created_at`, `updated_at`, `updated_by`, `created_by`) VALUES
(1, 1, 1, 'y', '[\"xcreate\",\"xread\",\"xupdate\",\"xdelete\"]', 1, NULL, NULL, NULL, NULL),
(2, 1, 2, 'y', '[\"xcreate\",\"xread\",\"xupdate\",\"xdelete\"]', 1, NULL, NULL, NULL, NULL),
(3, 1, 3, 'y', '[\"xcreate\",\"xupdate\",\"xdelete\"]', 1, NULL, NULL, NULL, NULL),
(19, 1, 10, 'y', 'null', NULL, NULL, NULL, NULL, NULL),
(35, 1, 26, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(48, 1, 32, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(49, 2, 32, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(57, 1, 37, 'y', '[\"xread\",\"xupdate\"]', NULL, NULL, '2025-09-05 10:54:05', 1, NULL),
(58, 3, 37, 'y', '[\"xread\",\"xupdate\"]', NULL, NULL, '2025-09-05 10:54:17', 1, NULL),
(59, 4, 37, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(60, 1, 38, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(61, 2, 38, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(62, 1, 39, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(63, 3, 3, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(64, 3, 10, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(65, 1, 40, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(66, 1, 41, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(67, 2, 10, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(68, 2, 3, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(69, 2, 40, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(70, 4, 40, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(77, 3, 32, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(78, 1, 44, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(79, 2, 44, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(80, 1, 45, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(81, 2, 45, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(82, 3, 45, 'y', '[\"xread\"]', NULL, NULL, NULL, NULL, NULL),
(84, 1, 47, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(87, 1, 46, 'y', '[\"xread\"]', NULL, NULL, NULL, NULL, NULL),
(88, 2, 46, 'y', 'null', NULL, NULL, NULL, NULL, NULL),
(89, 3, 46, 'y', 'null', NULL, NULL, NULL, NULL, NULL),
(90, 1, 49, 'y', '[\"xread\"]', NULL, NULL, NULL, NULL, NULL),
(94, 1, 50, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(95, 2, 26, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(96, 3, 26, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(97, 1, 51, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-05-26 22:26:24', NULL, NULL, 1),
(98, 2, 51, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-05-26 22:26:33', NULL, NULL, 1),
(99, 4, 51, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-05-26 22:26:41', NULL, NULL, 1),
(100, 1, 52, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-08-21 21:55:12', NULL, NULL, 1),
(101, 2, 52, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-08-21 21:55:24', NULL, NULL, 1),
(102, 4, 52, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-08-25 18:42:27', NULL, NULL, 1),
(103, 1, 53, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-09-05 17:40:45', NULL, NULL, 1),
(104, 2, 53, 'y', '[\"xread\"]', NULL, '2025-09-05 17:40:55', '2025-11-07 08:34:58', 1, 1),
(105, 2, 54, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-09-05 18:03:21', NULL, NULL, 1),
(106, 1, 54, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-09-05 18:03:31', NULL, NULL, 1),
(107, 1, 55, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-09-18 17:24:23', NULL, NULL, 1),
(108, 1, 56, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-09-18 17:24:41', NULL, NULL, 1),
(109, 1, 57, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-10-18 16:25:56', NULL, NULL, 1),
(110, 2, 57, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-10-18 16:26:16', NULL, NULL, 1),
(111, 2, 58, 'y', '[\"xread\"]', NULL, '2025-10-22 15:46:15', '2025-10-22 08:46:25', 1, 1),
(112, 1, 58, 'y', '[\"xread\"]', NULL, '2025-10-22 15:46:42', NULL, NULL, 1),
(113, 3, 58, 'y', '[\"xread\"]', NULL, '2025-10-22 15:46:54', NULL, NULL, 1),
(114, 2, 37, 'y', '[\"xread\"]', NULL, '2025-10-27 09:49:48', NULL, NULL, 1),
(115, 1, 59, 'y', '[\"xread\"]', NULL, '2025-10-27 10:51:30', NULL, NULL, 1),
(116, 2, 59, 'y', '[\"xread\"]', NULL, '2025-10-27 10:51:37', NULL, NULL, 1),
(117, 3, 59, 'y', '[\"xread\"]', NULL, '2025-10-27 10:51:45', NULL, NULL, 1),
(118, 2, 60, 'y', '[\"xread\"]', NULL, '2025-11-05 09:43:04', NULL, NULL, 1),
(119, 1, 60, 'y', '[\"xread\"]', NULL, '2025-11-05 09:43:26', NULL, NULL, 1),
(120, 1, 61, 'y', '[\"xread\",\"xcreate\"]', NULL, '2025-11-05 11:16:30', NULL, NULL, 1),
(121, 2, 61, 'y', '[\"xread\",\"xcreate\"]', NULL, '2025-11-05 11:16:50', NULL, NULL, 1),
(122, 1, 62, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-11-08 10:04:27', NULL, NULL, 1),
(123, 2, 62, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-11-08 10:04:39', NULL, NULL, 1),
(124, 1, 63, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-11-08 18:37:37', NULL, NULL, 1),
(125, 2, 63, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-11-08 18:37:47', NULL, NULL, 1),
(126, 1, 64, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-11-08 18:40:00', NULL, NULL, 1),
(127, 2, 64, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2025-11-08 18:40:18', NULL, NULL, 1),
(128, 1, 65, 'y', '[\"xread\"]', NULL, '2025-11-11 12:00:45', NULL, NULL, 1),
(129, 2, 65, 'y', '[\"xread\"]', NULL, '2025-11-11 12:01:36', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `s_api_keys`
--

DROP TABLE IF EXISTS `s_api_keys`;
CREATE TABLE IF NOT EXISTS `s_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `ignore_limits` tinyint(1) DEFAULT 0,
  `is_private_key` tinyint(1) DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_api_keys`
--

INSERT INTO `s_api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, '0695cabefc1d6bd11e6e13f1e04cffc2b2e07a3251af24c960dbae5c758b62b7', NULL, 0, 0, NULL, NULL),
(2, 1, '1f38c77fb7c5893ba61826b1087a9638429c8959059b73b0847f132ca5e01a13', NULL, 0, 0, NULL, NULL),
(3, 30, '105bf1d755e56dd35711052d6b6629ab2f6dcf2eb6ead40ed51fde9ae4320095', NULL, 0, 0, NULL, NULL),
(4, 31, 'e8084ef026210fca3137f2a956c37cf1c7d07c5146a7445491bc622354c69dd7', NULL, 0, 0, NULL, NULL),
(5, 31, 'f94ffe2191e6b7c664dc8a104f7a0ccc1e85b8b2b7d24895c372501ed1190c59', NULL, 0, 0, NULL, NULL),
(6, 31, '60fc511ed3f645b20b4a1fc425d1b0510979944509fed8297b0dd0b26983f54f', NULL, 0, 0, NULL, NULL),
(7, 31, '9f038242665d657981deab53557691df3dd8ad387ffe1f3e95ef16aa4678b21e', NULL, 0, 0, NULL, NULL),
(8, 31, 'dcf9788a69581e5546abe74028b619f39a48e94863c1422b8581968f5c8fae8e', NULL, 0, 0, NULL, NULL),
(9, 31, '5e9f1d84be3c9a88d210b4aaa8bd69a18eeb458205fe8a85a04fd6df35321887', NULL, 0, 0, NULL, NULL),
(10, 31, '48e5bc6d463ab327ef8341dceec24ed102527f417e26b9337c336be5ba1a9632', NULL, 0, 0, NULL, NULL),
(11, 31, 'd6b8488f891c283aca007bd6783a95e9301dcc30afebdd76645f1522882e76d0', NULL, 0, 0, NULL, NULL),
(12, 31, 'f06e4c35e1c7141be7e919275f47df97b480f10f2c685f9d0c52f3da2a9c44a6', NULL, 0, 0, NULL, NULL),
(13, 31, '58c5bda02f6b9773e2b7d48e837346aa9fb2496f746c2440beaef25ca0b7d7f6', NULL, 0, 0, NULL, NULL),
(14, 31, '973b673dfeec70b9c4d21620e1ead043bcd315ab6be56cd4e2a930892edac139', NULL, 0, 0, NULL, NULL),
(15, 31, '2691a1e3b43ce8c2e488a3dc2e7377382a62fda68ba55cb4d5e246e329f6fcd5', NULL, 0, 0, NULL, NULL),
(16, 31, 'b218cfe1ea3accd11170f08731f664adc5140efe4b739ffddcbcdcaeaef10fed', NULL, 0, 0, NULL, NULL),
(17, 31, '50a8897cbf4b9b1644e7da108c4bf7d3db36982bf4f5bffc6a6471bd0700efb7', NULL, 0, 0, NULL, NULL),
(18, 31, 'd5eb7dfd1c39097710828f1002d11e7ff6066a233a3f58dfe83aec11a92d4002', NULL, 0, 0, NULL, NULL),
(19, 31, '9b3cbfda2abffce36c86851327df55d2dd7a3201c66140c18d9ffbbe92b1b2b5', NULL, 0, 0, NULL, NULL),
(20, 31, 'c52f7df0d6c86a99bbf29470f09653a2f13d4dbd77c2c14107628a68712b34db', NULL, 0, 0, NULL, NULL),
(21, 31, '54929b07587f382dc1453b4967c2afb305c0374d2a712e6b155f82a7d64fc952', NULL, 0, 0, NULL, NULL),
(22, 31, 'b975bc96af295d890eba0bf51f166bb691da2138464ef76556311cfe9047a2c4', NULL, 0, 0, NULL, NULL),
(23, 31, 'f8727d00bf67aa88264df94d528f32daaa52e3ec1164d344f595a45fd44a2caa', NULL, 0, 0, NULL, NULL),
(24, 31, 'a9b07ae7044acbc5363c36858035c3f88c68ac53fa427b9b933caad794e16010', NULL, 0, 0, NULL, NULL),
(25, 31, 'd00fc29970e3a1dc07a93469d353c0c569ec6b8c4de0f476b56c4b555fe38e6b', NULL, 0, 0, NULL, NULL),
(26, 31, '928f5ba542af482975803f32251b8f1847c36fbfbd4013ace24dec19fd392f4f', NULL, 0, 0, NULL, NULL),
(27, 31, '6a3cf228a8322586fed061360f8d4163cf62502a01eb0bd5c243411a699847ed', NULL, 0, 0, NULL, NULL),
(28, 31, 'c60d2a216f68511316b661eb9b7f490540127f4200dab96a291f90513622d8fd', NULL, 0, 0, NULL, NULL),
(29, 31, 'baa97e9c3e1f40bef4445d604af390e808cfd261e811ea3be3bb5b23662a6b19', NULL, 0, 0, NULL, NULL),
(30, 31, 'b6721f426068571e8b865c3a4a3a26fe6cff74116f3266334731027af572473b', NULL, 0, 0, NULL, NULL),
(31, 31, '98f176b51e9a257d368370377356100e3f11843c4433b4d6e1927ace8d65e327', NULL, 0, 0, NULL, NULL),
(32, 31, '36b1886b4f68f4eb55d9024149cdf8d855c83c51b77ac7010f0e64d10b77ba68', NULL, 0, 0, NULL, NULL),
(33, 31, 'daa51b1d0b9e612418e87348470bb9d005e67d5c96a42030d0eb8f99d55b4128', NULL, 0, 0, NULL, NULL),
(34, 31, '9b4a45120ab1933cd9e6ab96706ee6b7007b187bf28355451646b61f5db69de4', NULL, 0, 0, NULL, NULL),
(35, 31, '5b16b73bfde2a2e912b29ad3bfa359da3815e86808d394a724ceae8f5b0a5899', NULL, 0, 0, NULL, NULL),
(36, 31, 'd7d226acffe0b4e9469b65b8516a7cfda1cc3420db8b5ea513043badf93218fe', NULL, 0, 0, NULL, NULL),
(37, 31, '98a0cb72ce7217426063f67f457c6e7c38c2bba08a20d2856f96956752762eb3', NULL, 0, 0, NULL, NULL),
(38, 31, 'f8e144557069e5c49070d42cc267c3c36681b10dfedebeeb4e45a7fc98871236', NULL, 0, 0, NULL, NULL),
(39, 31, '56934fdcaf955c6798e9f135a48bdd2e1a980b9349ec262f6db53c89a554db3f', NULL, 0, 0, NULL, NULL),
(40, 31, '09d8e6bc6ede1c699c594242fdb1d31b3496de6e1f2f4f0233cf9371135ca539', NULL, 0, 0, NULL, NULL),
(41, 31, 'a1485cc4137470c86f1d761e29389262ec1c0fb5a454d683888778606c12655d', NULL, 0, 0, NULL, NULL),
(42, 31, '3c3bf25708b4913eed2142f6a795f36e83b557f40645e7bf24c50109c537898d', NULL, 0, 0, NULL, NULL),
(43, 31, '06eb11d4d24bc487220787851a49bfa44b3f09f7375a5ca7d5528704f29949e2', NULL, 0, 0, NULL, NULL),
(44, 31, '92cb3782333f25bda58da91f1fc0e7715c44fb76e0be5d2dbc9d12f95de3ee95', NULL, 0, 0, NULL, NULL),
(45, 31, 'cdd8e63e8876dc6d835d3a63b748a00b0f4c4802a39204392a8d27662c3993d4', NULL, 0, 0, NULL, NULL),
(46, 31, '38d90cdad52d82a1cd5dafc63e8daf6acc1c58c2f1cecdffb8c9ed10f3265836', NULL, 0, 0, NULL, NULL),
(47, 31, '446da90be39403f171bdd9eb5cd05adafd3055cb782455603abf7b641538740e', NULL, 0, 0, NULL, NULL),
(48, 31, 'f16f2a7514048fb6c231812e6f295a8be5be9e7b622299cf519c10ae24f0b0a3', NULL, 0, 0, NULL, NULL),
(49, 31, '28ad1e69889616c944e37c51f916aa630c94e3931699f470ee850df5c1bcbf89', NULL, 0, 0, NULL, NULL),
(50, 31, '5d7d60a206618128a01da2eb41fbbe3efae01c6ea56c0e4431d01935d8d16644', NULL, 0, 0, NULL, NULL),
(51, 31, '789242c8dc5e4ea35e992374f5ed678cf2a088453eb0751184ef0d15358d0f76', NULL, 0, 0, NULL, NULL),
(52, 31, 'b93636b2cb03767b36c634e6c62748257ba10779eb983863437a6995a3cf978d', NULL, 0, 0, NULL, NULL),
(53, 31, 'adbbab26b1b46f80f8a3cedfe646eb09982b850b127ec720cc2aa9f11ac4feb7', NULL, 0, 0, NULL, NULL),
(54, 31, '7456a5c1591a6be6ccc4b53c8da21b2ad741dd3c39cde339d2cc342fe207578e', NULL, 0, 0, NULL, NULL),
(55, 31, 'f1f75bde0cad19a61c16d9ca9fcb28b222679a1acc7b467c3a93a36acc432fb8', NULL, 0, 0, NULL, NULL),
(56, 32, '81bc3d528f3f3f5c7357adb4589e35723394e7a941f1983f70cbbf23c0dae5be', NULL, 0, 0, NULL, NULL),
(57, 32, '09375838b3e9518d8e65f8bfecee73e746d9758ab0f07d2842a649404b6327d6', NULL, 0, 0, NULL, NULL),
(58, 31, '31e99b3ba9b6ae20f5450cf54bfc4775a53b45c4575e834e34aeda85d256e298', NULL, 0, 0, NULL, NULL),
(59, 31, '4226097c24b5b042fad3866792d33cadac6364acb6080597f20cd80932c4d49e', NULL, 0, 0, NULL, NULL),
(60, 31, 'c21b8a0eb978923209dec8fa134e3d91a61da2ec61c34019b80b29179f0cdd16', NULL, 0, 0, NULL, NULL),
(61, 31, '7fb1a28b3b9f9efee412880c495615c66e045f14f8249afe996c2e830fce7705', NULL, 0, 0, NULL, NULL),
(62, 31, '0808a8c762427286a1d45bc5a6fceeb10807367c0bca3c3e2b49a4a858933d74', NULL, 0, 0, NULL, NULL),
(63, 31, 'feb1c3828a179d4d21195561cc1e6af2b30d9bf641c3554ee220cf86f5228b6e', NULL, 0, 0, NULL, NULL),
(64, 31, 'e5bd3a879d5c3fb77d97eeeab48b772057e3f356d4053efb396262da99f300b2', NULL, 0, 0, NULL, NULL),
(65, 31, '749a93e9c02171d0d287257a87c2b197b53672cf6192c999ffbbd83f94829950', NULL, 0, 0, NULL, NULL),
(66, 31, 'd8469ad0a136f3ec77a0e4c7dbe96e82952ab0c711e329a4670f82ff5178aa4d', NULL, 0, 0, NULL, NULL),
(67, 31, '9d5de2b5fcdaf8783f8c542c96218b2223c61bd8bcb33a2eed1f034509c24005', NULL, 0, 0, NULL, NULL),
(68, 31, 'a876c4375aedd24c02c22d1522d13d75070e3c67ebdf9e388ed19c37fc878345', NULL, 0, 0, NULL, NULL),
(69, 31, '679459209aee791f4697208a5a5fdf8a250fa511b0f978a6c354c46a597c9547', NULL, 0, 0, NULL, NULL),
(70, 31, 'c967b3e25efd2958f34b42e088420387f273d5e0588a04ee48f42069d2b340f9', NULL, 0, 0, NULL, NULL),
(71, 31, 'c2deda20f708d65b29a6424319fd6119831b22ae1eb7c084fbb163a5df60bc9f', NULL, 0, 0, NULL, NULL),
(72, 31, '720bc5bd03f0d5de53c935cee7ddd850d703e0abc7b725c1accf4e90f5911c8a', NULL, 0, 0, NULL, NULL),
(73, 31, '5994aa6b8361fefd7418a29c78bb027ae6bac9629d7f689cabfa7a286279158b', NULL, 0, 0, NULL, NULL),
(74, 31, '42a1cd992a0d71f17cba362b5cad6594df8aa48a387b0014d9433ea72ba62e1f', NULL, 0, 0, NULL, NULL),
(75, 31, 'e0f5c4c0fe43c34ac5c6c7e8b3a385c6c4e0510a7aef9c40b1c33236f3476704', NULL, 0, 0, NULL, NULL),
(76, 31, '364f86d9684d5cdd5ee6bf1c72d25514bedbe95c7e62760a3f20f26a3149d8f3', NULL, 0, 0, NULL, NULL),
(77, 31, '764d4205190233b3436e3397bb2e0cf120f8f333827ef0a4dcc146067a5ba919', NULL, 0, 0, NULL, NULL),
(78, 31, '7266e43af3c1f436f402cb1bc327817009987081b5b05d98febc264003f95ea2', NULL, 0, 0, NULL, NULL),
(79, 31, '52b04dc0c66b02a82f09374248785ffea7cb3a2cd6d54381dfffad2c368fcc60', NULL, 0, 0, NULL, NULL),
(80, 31, 'eaf45f4c0a9a5ef4d7f69d20b16b1912eaaaba5bc55561d1601227b2e41be95b', NULL, 0, 0, NULL, NULL),
(81, 31, '39ff397dcc79f6b6e7d0c0339e27c474dfc45abc6254e10560ff9729281ed03a', NULL, 0, 0, NULL, NULL),
(82, 31, '2f0922156711d5e91334f9089a7d122a87bcd9935c2d3d7a4ef2ccf4d18407b1', NULL, 0, 0, NULL, NULL),
(83, 31, 'c55940952242108c6dc90d64e9849f36ac99c2e3769c6dca55264214741b0a2c', NULL, 0, 0, NULL, NULL),
(84, 31, 'f2cabb251009e1317a5f6ef400d1eee78c65d46c02f03b38c9d69f663e4804a3', NULL, 0, 0, NULL, NULL),
(85, 31, '9862a2afd85b1e1897482bfc625e91ebccdc78e0c720c1df5037ae13fa5fcf60', NULL, 0, 0, NULL, NULL),
(86, 31, 'b3ab00824279c1daab6b626322d686d51465df8c58a4d3672794a9b107f877eb', NULL, 0, 0, NULL, NULL),
(87, 31, '3aa3510b01ed1d57a1bf7361433c39d20bd32c22f76632ad652c7bd2a1a03bef', NULL, 0, 0, NULL, NULL),
(88, 31, 'f34b016b7df28bba1a99366149c83d4eaaca3b3a373a0afb0f476b85a638deff', NULL, 0, 0, NULL, NULL),
(89, 31, '81532ccdcf446d86ab48118992f7b91483973b36200b0d83d9b249befc2583da', NULL, 0, 0, NULL, NULL),
(90, 32, '37e872f0dbf53daafb4fd58f616b2036b76121f86d84589ef6be2aef30fffeb8', NULL, 0, 0, NULL, NULL),
(91, 31, '95c082133bc834c598bbea028cde17211abe4e9324987f6515747f92022407bf', NULL, 0, 0, NULL, NULL),
(92, 31, 'da4f966c75926b270221835889cd47ba338bd7100b9e03e4b27aa12bd7f611e9', NULL, 0, 0, NULL, NULL),
(93, 31, '6996d165c7444afe9510b3900b5aa69880681d239ddcb904d52728330174f5ea', NULL, 0, 0, NULL, NULL),
(94, 31, 'fb380ad0c093995c42d6ed8d6d90259b4b8658f0834a819f657aaacff574176a', NULL, 0, 0, NULL, NULL),
(95, 31, '170036d565ba537327ef5226e1db957f9dd4543ece251020d08785a28ea5091b', NULL, 0, 0, NULL, NULL),
(96, 31, '6ff868da5356770fb88c853fc080a185cf5e8c674d38b9bd67a076117fdcd9e4', NULL, 0, 0, NULL, NULL),
(97, 31, '8caf7b246fad1912a4d9738834aadd46afa6d9f945c47520cea5d95aa25df9d4', NULL, 0, 0, NULL, NULL),
(98, 31, '04a9a22be8b9ebb1592e58fc350ca50d9cedc7c714fff43c65c37f033cd7ad9c', NULL, 0, 0, NULL, NULL),
(99, 31, 'cf35fa60e18f2c06557f42019120e72a813fcceea4b9b6d45a6938a13e3b2cf7', NULL, 0, 0, NULL, NULL),
(100, 31, '0b7e0e65b71bf2e461d2a020420490a475a87055ac9e6f1741cadb15240affa1', NULL, 0, 0, NULL, NULL),
(101, 31, 'cd7bc6db4d7a7523f78bccfbf90e1dcd18433cb5ef45ffb2832ddaaf78160d07', NULL, 0, 0, NULL, NULL),
(102, 31, 'c1867f7f5e5670d03a01e2f5a6cf30288a77f8d87eb6f599a4fa646be66a4087', NULL, 0, 0, NULL, NULL),
(103, 31, '07311d35f946c65e1bc19e0e58e05b771eab3c99ae23ca7d259ed7de6baa733d', NULL, 0, 0, NULL, NULL),
(104, 31, 'a9684841a2a4f2e66ee686a88c67b5581a1da480daefd14608b7069c18391d52', NULL, 0, 0, NULL, NULL),
(105, 31, '5faba2be7c6d15f6a5d4e3ad466ff3a8ab3e67b37da449df685d2159bfd48eb6', NULL, 0, 0, NULL, NULL),
(106, 31, '018f9ad3fba90b134e7d5dc1fc549168ff69f7b2db377828d9821c6146f672e3', NULL, 0, 0, NULL, NULL),
(107, 31, '37ca2dfa96b0d031019f5c5c6c4bacfa7b253640052482b0970760c3eda722f6', NULL, 0, 0, NULL, NULL),
(108, 31, '7e0214364e73ce899f3d5c1737ecea46aa2e4422a26d5ed14ed58691c5f90c3f', NULL, 0, 0, NULL, NULL),
(109, 31, '44160fe2d1b388f540de41b46fea1d5e025521bb5a43e5aa81bb1bd131135481', NULL, 0, 0, NULL, NULL),
(110, 31, '598bfa1606491dc76ec8ad6f022bf3b3318184bf6659fb56709f34d880e59223', NULL, 0, 0, NULL, NULL),
(111, 31, '2a5b87ca12c319548ac451e5d36c4a27b4556e5648c45f74bb3acc88405c000c', NULL, 0, 0, NULL, NULL),
(112, 31, 'a4b4f3ae430a28731382325dd50a637b4fb67e5a43894e2f6b4ac14ceb621fdb', NULL, 0, 0, NULL, NULL),
(113, 31, '6fae8c9bcf30b5979af67a45134b03098bb59ba9b41abc29b0f74c25d2c00940', NULL, 0, 0, NULL, NULL),
(114, 31, 'b8596982bb0d9d22393d150518dd2354d16a8dbd6669424d900bbed8523e1607', NULL, 0, 0, NULL, NULL),
(115, 31, 'd33a54881ac9fa5eaca225546fac0f7d1c519be1428e4962ef85e89cccb83b0c', NULL, 0, 0, NULL, NULL),
(116, 31, '5bcb1ea8a805cf0003ff67f81e308c0a57ec63d1a9f7d936b4ff2040f7e7db83', NULL, 0, 0, NULL, NULL),
(117, 31, '55b990206019f54a3c174ff8fefae7d38fc86142f01b69557ef6e82f08efd5fd', NULL, 0, 0, NULL, NULL),
(118, 31, '977c0400aed581aaf54b14db441c9b1a3c41cfb07a9052162a59f41c744c62f5', NULL, 0, 0, NULL, NULL),
(119, 31, '140b08ba2bc34a51e0b40b5fd5b7ef82caf492cabaa3dea27cb6fab6e4be74c1', NULL, 0, 0, NULL, NULL),
(120, 31, '7e19b728b6dc1127de3d7c9a66ff7ed7c828c53e8ff50a117c9f287d0d98081b', NULL, 0, 0, NULL, NULL),
(121, 31, '6edf47b6019a312fb3ea4efca3405ea6c9fc8b9b2b0a4bc5062d50e86fbe500a', NULL, 0, 0, NULL, NULL),
(122, 31, '83225d19bf76c10b663ea241d7d4a2b718d8f594855b6b87e04dd3a6313908a4', NULL, 0, 0, NULL, NULL),
(123, 31, '0eb0e34917ba5bf874868e159e99cf95ba1387dcc7a7309664e40f8da30b8ec5', NULL, 0, 0, NULL, NULL),
(124, 31, 'ad73583ed7ed23f05d1f9ed67f6405786ea7f847caba6d632484ad9ab655e11d', NULL, 0, 0, NULL, NULL),
(125, 31, '2e8471faa00c6997c9fd6b013f86239b4d0722c0400d11662ddd93c058f922f5', NULL, 0, 0, NULL, NULL),
(126, 31, '156538e4c8e1af275a2af647c16649676152329e4e51d4c933c49b5c0e7189ea', NULL, 0, 0, NULL, NULL),
(127, 31, 'f3563dfcf28475d7da2cceba4402ac402cce6d6365c5375ce4e9efea865cbac2', NULL, 0, 0, NULL, NULL),
(128, 31, 'ff1d3be132678b2c7af93ac0dd8bc2d5773530f524c41e3eb3ee4f81eb13fbaf', NULL, 0, 0, NULL, NULL),
(129, 31, 'be5bc6595d486c6c3ed8679a79b4030f07189dae7e65d90bf8be066a1560007c', NULL, 0, 0, NULL, NULL),
(130, 31, '8a59fa6c5ad5d385d87deba1c5d36310e7c04c6dd72f3d3a11ae90ad3e9ed8fe', NULL, 0, 0, NULL, NULL),
(131, 31, '2e6a6bacf559cf00dc754be7d9a0e5467b84871ce5f998a2fb15f2123f61aa5b', NULL, 0, 0, NULL, NULL),
(132, 31, '751309a9f5ea81a95aca8fb760ec08d4632a573368b65c738ad63cba75804ea0', NULL, 0, 0, NULL, NULL),
(133, 31, '3469a469f0e370f6b813997b237c5ccb68276d11ced938f3f542135a637dd61b', NULL, 0, 0, NULL, NULL),
(134, 31, 'e15884a1f3a5b8708a42dc8bba14b547b75b15b8e6e545086143fb1c41e9864b', NULL, 0, 0, NULL, NULL),
(135, 31, '0e8f10d2342d3f971b384713a81db2eab6da60a96225a54d15449fe16fe88b36', NULL, 0, 0, NULL, NULL),
(136, 31, '0cecc08d66b3129ecee37d917bdf32b93b89908422afc65589e16f6baaa36335', NULL, 0, 0, NULL, NULL),
(137, 31, '88058783c859f27b68f748df8f8efa3d033f31d43479a9bb227e31faff48633f', NULL, 0, 0, NULL, NULL),
(138, 31, 'c0f74e12d4dba835999aea12e43a0c2dcf0bb171c72371fa0478111046de1149', NULL, 0, 0, NULL, NULL),
(139, 31, '8be1d632a1a180479b4705490a0b4a26d4f036289f5f1363d08a09416a1946af', NULL, 0, 0, NULL, NULL),
(140, 31, '6e5525c016fa1e0f0d0395c5c033f9fa5892f9217fddd757cc30faccab2a2a83', NULL, 0, 0, NULL, NULL),
(141, 31, '7c1f20958d285abb5344402f22c186a9549dbd160002554eb7d3b846d4919019', NULL, 0, 0, NULL, NULL),
(142, 31, '5c8189acaec210dd39af0382c5174947866e379315559b4f3a9887e017cd80ff', NULL, 0, 0, NULL, NULL),
(143, 31, 'bf53c31165bcf571da05460dc465d658ae812075547b272637d7938bd23fc3d2', NULL, 0, 0, NULL, NULL),
(144, 31, 'f85a683bb954e9be862b37244ae6b6c0b1b95c3a2749ec5c7c5878b701f05a22', NULL, 0, 0, NULL, NULL),
(145, 31, 'c171a891ddc2b4248dca10b1d9620216bc2deb8ded58ca03de7ee574d200f973', NULL, 0, 0, NULL, NULL),
(146, 31, 'e3e099d45525aa5d0ad1f8ee4f925f4f50bb382e39db5c008e9bee4c44167933', NULL, 0, 0, NULL, NULL),
(147, 31, '40b5fd619047795b3c6e29950ccfd80a5552022b80aa10478e125232b4f5edc4', NULL, 0, 0, NULL, NULL),
(148, 31, '028da8d518d536aa1d7db37ce028b10749e3b8cde7a52ff5f3c86516497166c1', NULL, 0, 0, NULL, NULL),
(149, 31, 'b3539e464f803d129b22df715194d7e4cfc23d8008d7dd1c79402839a4948534', NULL, 0, 0, NULL, NULL),
(150, 31, '468aa3663c03ad2069beb7a0f63700a0c582323beba8d761722c472a54d07add', NULL, 0, 0, NULL, NULL),
(151, 31, '3e1e49f662a7db0052085d4bb030379edf4a35dc2fcc1e40a7b3e082b2fce1d3', NULL, 0, 0, NULL, NULL),
(152, 31, '20a474c03bbdfafc633c84ec0513a233e1d9ce90551c9ded9efac28e6176f18c', NULL, 0, 0, NULL, NULL),
(153, 31, '30f8287550859de104456c78f949163d28b523ed34937ac65abbe7211e96562d', NULL, 0, 0, NULL, NULL),
(154, 31, 'fdb618f1bd66de428a336f9116c3cc22d00a28e377a0bfb1deae6c2fd0abd924', NULL, 0, 0, NULL, NULL),
(155, 31, '966dbad561cbda74fd27f08eadc2f53a5334b0f719db939b5548facdb1891255', NULL, 0, 0, NULL, NULL),
(156, 31, '5056103e4e5df002f516968d59267d512c38d686734a332e656449c91dba10ee', NULL, 0, 0, NULL, NULL),
(157, 31, 'e312aab0b59426a0a670d0cb6d842b4097d620cb6273984f426a49ac574f3c2c', NULL, 0, 0, NULL, NULL),
(158, 31, '08ac9510c5f3dbd4b348d853c5551917ad34e8a2ed6f1465e76cc7f6d95e7f56', NULL, 0, 0, NULL, NULL),
(159, 31, 'b45d8c5eb995c966c0c92ad8a4c48d862d904f568981b2613f14490cda3fec9a', NULL, 0, 0, NULL, NULL),
(160, 31, '32fce7ecb0d4bdc337315dad885d14a731fd8c50141ab81c7389a82197c34c1c', NULL, 0, 0, NULL, NULL),
(161, 31, '218d9724caec16e22f3b7d25fe23906ec7fd5cdb636b5b844fe7d4e054223cbe', NULL, 0, 0, NULL, NULL),
(162, 31, '7218ae2db0297cb82f04814e60dd745858b3932c4acf6c6555521c2c1cf1006a', NULL, 0, 0, NULL, NULL),
(163, 31, '1a542e9ee7d59f294466e9874ece5483d71bbdeda5b18c5ef3e221889a0c1e8b', NULL, 0, 0, NULL, NULL),
(164, 31, '793374190d9ecd0762feced7a2a3c4849912a03289cb15d0a8b465d638349a24', NULL, 0, 0, NULL, NULL),
(165, 31, 'a873e8749d522add89ef0c872a054775f8c898aaa843837fa76941cc6a1ae2cd', NULL, 0, 0, NULL, NULL),
(166, 31, 'e31958597f7acb875c324a90264e512034825cd31a25f3856cb6f1acce65a1c0', NULL, 0, 0, NULL, NULL),
(167, 31, '802fa552f617ed5fee06f75192d0d528dce1eede5dae513257e3991ff35b1792', NULL, 0, 0, NULL, NULL),
(168, 31, '28ae1782db502ee8a3739880dad247cee809deb2cbc9bde3b8e3f86cf09b5a46', NULL, 0, 0, NULL, NULL),
(169, 31, '7ede461c2815d24a492256b20fc2c2ea9508276beee99a81dde111e5160ceea2', NULL, 0, 0, NULL, NULL),
(170, 31, '92974d81ad8e8d06cdb9b5eb7e4e6f509b5fc1a485fda235f7f791e9e9deb11d', NULL, 0, 0, NULL, NULL),
(171, 31, '36fbe358c8e513df0f5073f5a15942f996edf77d540ac252708dd4fd0f45e1be', NULL, 0, 0, NULL, NULL),
(172, 31, '1319b298424b00ba5a957ffdc6d13f780339af625633acc2d851f4462b1c3d8c', NULL, 0, 0, NULL, NULL),
(173, 31, '040d157853ef0d9cc348638225059d89aa791408fa35ee64af27562db20e4694', NULL, 0, 0, NULL, NULL),
(174, 31, '7ceb3aba03174b219dbabdf5ea3f65da3d5d1214bf8f53c7ee2a827e5acfb8e2', NULL, 0, 0, NULL, NULL),
(175, 31, '286179e85c7a81492f1b75657be7d3929823422f5c33f26d92dcbd0ce19aad00', NULL, 0, 0, NULL, NULL),
(176, 31, 'ff0179efda99a3a8eac9ca4537e533b8d8cae6ca701d81cdbd3213ded85a7537', NULL, 0, 0, NULL, NULL),
(177, 31, 'c974e12c18acd7729b52840291f48031285c5c965bd5ba97c6717a60dd9de2e2', NULL, 0, 0, NULL, NULL),
(178, 31, '8a26165cf6147e00c3b92662511e4968d7f1689773b1a5721cc87419f809b19e', NULL, 0, 0, NULL, NULL),
(179, 31, '79dda3d9a5ac99ac14979d2e2374cd5520f216d91ce2588ca823ecc9b9712e7b', NULL, 0, 0, NULL, NULL),
(180, 31, 'eec57ca3a56ea6c8c12849fcd7f41c48f1db3085999da84355cd9472170f9091', NULL, 0, 0, NULL, NULL),
(181, 31, '14e75406dd0853d0254372860474bb717600fb582dbb2efd0a8dff300de84fc6', NULL, 0, 0, NULL, NULL),
(182, 31, '71533144de7d3eb6877cb749e0dae9d720bf9c4a82c2990f7d2cb2489e87a441', NULL, 0, 0, NULL, NULL),
(183, 31, 'f9a87788b2c1ddc76202dc0a0fc4993cb3115078147d5fc4119a57c0fec788f6', NULL, 0, 0, NULL, NULL),
(184, 31, '629aeba80d7f9d81cf22a526ca5d90f8ecf2c7f13dacc9b21c1908b60164d837', NULL, 0, 0, NULL, NULL),
(185, 31, 'c8e39086629c6d1c68001c2de8294d5b4a1ec9d62f7c7e6b0ebd8cfbf2e71f0b', NULL, 0, 0, NULL, NULL),
(186, 31, 'b20102760823581e0977445a3ec019c7bc11467290a1c626abaceecec9b902ed', NULL, 0, 0, NULL, NULL),
(187, 31, 'ee5ade08c87227f705c514ec192b800b87fc29fcd36a71fb2b5739dc665077a7', NULL, 0, 0, NULL, NULL),
(188, 31, 'cfc16690c0f35e1905d8397dbd2461aca3e1a73eca86d6e70a1862053a50087a', NULL, 0, 0, NULL, NULL),
(189, 31, '77f4f4a616cd865e26c91847c325e1a1391b63deb95f7605d10ebb963349b464', NULL, 0, 0, NULL, NULL),
(190, 31, '817d71be43d8928cc79a58ba9069301f0e632688de62e6b0087e051a4eefdacb', NULL, 0, 0, NULL, NULL),
(191, 31, 'a87bc5a1c2db09c6445fd143fab9837ed5c2f8eb4204fe066e29151296a6d2c0', NULL, 0, 0, NULL, NULL),
(192, 31, 'b893c5b3be80d24258e0ff0a86846559d470ef1c96fe308de251b2ebad6b64cf', NULL, 0, 0, NULL, NULL),
(193, 31, '623c043403b891d55335e3a9dd46c4858e1a7edff2acd8bdcb69b0eb14a1ef42', NULL, 0, 0, NULL, NULL),
(194, 31, '7adf05df4be18f564fe51de48a650be9a823677fab1ceb93c2e3f64181bd36a6', NULL, 0, 0, NULL, NULL),
(195, 31, 'dc076c5af6e4687e93946aba52e5dcbde6a9ff9b6d7fd47f715058c6c883efc4', NULL, 0, 0, NULL, NULL),
(196, 31, '03375c9961946e636973f1aac90ca2b8763181d5de43f3b2bb0e2b771a20beda', NULL, 0, 0, NULL, NULL),
(197, 31, '683fcf3c5eecf50b69a117216e3bf37c378e63129133558638a582e7642c9474', NULL, 0, 0, NULL, NULL),
(198, 31, '5c113f9fc1fd06a55cce35eea403d4b07733d64178c0c7d1556e0894be549aa9', NULL, 0, 0, NULL, NULL),
(199, 31, '61452e57e73a144cf6382de3dd38ca2f68231a8cd1f2ccfb23095953cfa2aca5', NULL, 0, 0, NULL, NULL),
(200, 31, '566a0a68dfcaf4377b8a26f0316576feb155b8e1fc801eb9c09a9629237a4431', NULL, 0, 0, NULL, NULL),
(201, 31, '3ff3ef86e95903975f31e5f3920a750b513a6d1670e6aa9906ebccf67bb9a42f', NULL, 0, 0, NULL, NULL),
(202, 31, '33139be35c12baf49b8d709350d1dc5078f8471fb8575f9b80464b458580c97f', NULL, 0, 0, NULL, NULL),
(203, 31, '76bc5bd439dc8bdbc079b40f47677bb090792d18f19cfc44c9f861cbac47d616', NULL, 0, 0, NULL, NULL),
(204, 31, 'b8e4606224a3a0451aefd0a5422a3503fad90c12acb8a07b0b890e682ef48f23', NULL, 0, 0, NULL, NULL),
(205, 31, 'd9948f3c4aa1524806bfd65f1a3c7578a543b770e68f7435995ac07d1272547d', NULL, 0, 0, NULL, NULL),
(206, 31, 'fbf3e609e82774c967d75e2916d76f4c910af4cbfb4288ac85615b1307bfa8aa', NULL, 0, 0, NULL, NULL),
(207, 31, 'fa427e7d22677eaf9e5b7839de617a5730aaefa2430286c66f49f56eaf6084c9', NULL, 0, 0, NULL, NULL),
(208, 31, '39e4f6dfab8371f62259888d5b1338dfa49295c69d760149f5dfefa9be75a4b5', NULL, 0, 0, NULL, NULL),
(209, 31, '1882f2982390c02096799e7077f70dc3209e9b931ec5e1afaf59ddd4adf7f623', NULL, 0, 0, NULL, NULL),
(210, 31, 'f6500033f6985c7ae2663f92c3e0bc740145bc0197c70a28a0ca8615880ff6b2', NULL, 0, 0, NULL, NULL),
(211, 31, 'dac10edcc332e77d586a84e45aa0ffd5b84d60705501c0fc31bf523542c5a7ee', NULL, 0, 0, NULL, NULL),
(212, 31, 'ba7d803645f56700973b8a31c0c1d22b914e8b0fa94a802536185e36020c3119', NULL, 0, 0, NULL, NULL),
(213, 38, 'fda657504cb07e5ecfbd7b91d48e7cd9d25ba155e24f2c58650271d12dee79c1', NULL, 0, 0, NULL, NULL),
(214, 38, '01436792a2842da17d6270e1415c3b2be5cf0e2c497cec5c1c00dde401b07bd1', NULL, 0, 0, NULL, NULL),
(215, 38, 'c13000938f4059f8812a30e23152ed73c5071ba9b1bd5fce6cb6332fdfc6a82b', NULL, 0, 0, NULL, NULL),
(216, 38, 'a48ab110bfe81580f8076a0bcdd214cc83768003bd862d5c7619cc16b341a655', NULL, 0, 0, NULL, NULL),
(217, 38, '6e1072febe1abd30d68a1a9e1ce3936bbd8881b700ae84765a3ec5d59bfa5940', NULL, 0, 0, NULL, NULL),
(218, 38, 'cff933db6fc1b5792098f5632df7400474ce563aae4563738f4231579022f8a7', NULL, 0, 0, NULL, NULL),
(219, 38, '108d67a1815ab8268d4549d753b78726d15b50085426691a72404a665d0ff748', NULL, 0, 0, NULL, NULL),
(220, 38, 'de6858cfbb04e5b3f57325e41a4936eef5ec267971f0538e43590331a235885d', NULL, 0, 0, NULL, NULL),
(221, 38, '9850e244d74c753a15cee3bc8cb07358e61a584fbde83e52672ed533581bf6a7', NULL, 0, 0, NULL, NULL),
(222, 38, '8715b7e28bd98540b5adb319dd15c689884a8c44b51d874719ddfa31038293d3', NULL, 0, 0, NULL, NULL),
(223, 38, '97993dfcc5e6092f0055f3d556e8c6de41e1799c6e95b1d3ec4b44eb754d63e8', NULL, 0, 0, NULL, NULL),
(224, 38, '784dfe0acd7b38661a9b82f12ef7f16e027b7d9d05f95cf2f6a088c873cbe7b7', NULL, 0, 0, NULL, NULL),
(225, 38, 'd8e36f020ad300c281d61ef2bccf3139f7c6fff07bae21cf344d03afc3ed476e', NULL, 0, 0, NULL, NULL),
(226, 38, '9ee0bd94f46ae8433eabd7dd1f8955312c82041aa046104fb1cdf76d87b3a3f5', NULL, 0, 0, NULL, NULL),
(227, 38, '6d0e708f66cc40ebffc0d4844e754363503a2f56cdfc9d7ee06d8dbb6f7465b7', NULL, 0, 0, NULL, NULL),
(228, 38, 'ac29b4d83a67ef4897e9d132ad864edbc686b4b50a710d46a7dfa72392c6e5ba', NULL, 0, 0, NULL, NULL),
(229, 38, '470dbee19b2b9ce57be36bf5fed4fc6c3daf6d6605bcb0d1ab9d988d775fa3c7', NULL, 0, 0, NULL, NULL),
(230, 38, '94025436654723ecbc9230cf9967e44fd85fdc1adc8bbf679178a884a902c978', NULL, 0, 0, NULL, NULL),
(231, 38, '5bd849acf771e5dfa4e4a319d48e744516592975f0440fcb9e1edf3f4f6352be', NULL, 0, 0, NULL, NULL),
(232, 38, 'ba95baa4764cd14115cab64c5d5141c32030d5a38affe2fc4f13d02756d99032', NULL, 0, 0, NULL, NULL),
(233, 38, 'c591f5b973170f64b43070f074bea550665e583ab4bf21e306ea0447c4d247b8', NULL, 0, 0, NULL, NULL),
(234, 38, 'b5c1426e47bd7b767983bf1dda969f9a1865b077a5816602c316f4641e42babb', NULL, 0, 0, NULL, NULL),
(235, 38, '1a8474d6b82a53ef7058c89b7a47cb7836aca57020601d6d555da824f5aa0d49', NULL, 0, 0, NULL, NULL),
(236, 38, '4c45ac0ad27eb3fbdf7bd97a8d430cd443eb54f27bff744995977559390d9e08', NULL, 0, 0, NULL, NULL),
(237, 38, 'a789e3f64f0bb66052c0dd6b3e72cdfcc28a0c800f332cddae6438a962f336be', NULL, 0, 0, NULL, NULL),
(238, 38, 'f9ba5ed3e385b2c8ce928caff85bf638ffb7e1d3e1a2fb99bc5dbfdd40fb93cc', NULL, 0, 0, NULL, NULL),
(239, 38, '9199f5fcd631df8f809df2e9edd985f332d3ae72f0139c7f5b084ab8fa0bb14c', NULL, 0, 0, NULL, NULL),
(240, 38, '94698dcfaead1c9f383b7bee297fc5bb516d6728079c7e0ad4f6f41ffbc64985', NULL, 0, 0, NULL, NULL),
(241, 38, '8ed706640a0d038040bdefded0075f94dd426bee8873c2bedfe5cf27fbf3afb5', NULL, 0, 0, NULL, NULL),
(242, 38, '2f0c51a8f3351acabf056d71d3c1343c4d0cb20bf4cf828f5c9899c132d50726', NULL, 0, 0, NULL, NULL),
(243, 38, 'af6b5d24087254c295f20c3b92803ac1aa0a960b84cef687ba3c3939cdb4e723', NULL, 0, 0, NULL, NULL),
(244, 38, 'c029e94b5579b47a8244708f095b5a1bd7074b1be389f54dc35530172d37b503', NULL, 0, 0, NULL, NULL),
(245, 38, '1190c466235bc879fea17014d463e052973b3669bb0ca86918b2ace5f43e31e6', NULL, 0, 0, NULL, NULL),
(246, 38, '69039002d8093db21e2698c6ee4f337b625247d879ef277760378451da673f25', NULL, 0, 0, NULL, NULL),
(247, 38, 'a8143ac4b95cbecdce90c5792b780635926f98fc43d8ecadf6645fe2f8c3d94c', NULL, 0, 0, NULL, NULL),
(248, 38, '3225c5130bf77053e8a9688425e23e8c11174eb997b3894403da62bab72cd40d', NULL, 0, 0, NULL, NULL),
(249, 38, 'cb04bdbb45cc18ba2d61fc2732a8a9edb674fa2181e9640c1cae687d5d87fb0d', NULL, 0, 0, NULL, NULL),
(250, 38, '0c75f49207c233d605a38da92ad98711e053a50e218e2fe66e3ace6d9686ec8d', NULL, 0, 0, NULL, NULL),
(251, 38, '7040a1ec592dd5d4ddb0f3f1f6c09939beda692fffe13aca0b1b4f4c3b5a8178', NULL, 0, 0, NULL, NULL),
(252, 38, '0aaeb7f384171d7101710003a85cc2b92f343050da860441b489c6ba1ec14aa2', NULL, 0, 0, NULL, NULL),
(253, 38, '678abd6dc77cb364d089d560216701db7af6e5cda576042c3f342130895e427a', NULL, 0, 0, NULL, NULL),
(254, 38, '92360dc73cd5b6ef1a98d6dfac338cb51ec4760235c94c68f2b4420559d7c7f3', NULL, 0, 0, NULL, NULL),
(255, 38, '58594150789ac40765eb9d1a0b6e85fb1fe712e6d7ca1995e90789ffe6cf3ccb', NULL, 0, 0, NULL, NULL),
(256, 38, '51485f5740db61c05bee084bcb030cd8b1bdfaf4911c47bfc8a02f897d4257a9', NULL, 0, 0, NULL, NULL),
(257, 38, '0ba7606be60ddf8f66721f2a01c1464d3c8cecb7800b9bd4b8501bebd7e9788e', NULL, 0, 0, NULL, NULL),
(258, 38, '6c3ea559798759787813edf1090e802eeae017964d581ae6fbe9df55499fe5eb', NULL, 0, 0, NULL, NULL),
(259, 38, '62b17e3f95cf60901e6f56573a3be828b38218f9de9ecf699bef255f086110cf', NULL, 0, 0, NULL, NULL),
(260, 38, 'f16f0351717e4f63e53846ae2747a811bc2f52a214324582b3c4d515aa39405f', NULL, 0, 0, NULL, NULL),
(261, 38, 'e8b5b744af64ecd072f2a5f53574aa87e1bc77d458f6fc4b3727f3dee31ec9a4', NULL, 0, 0, NULL, NULL),
(262, 38, '660466c390826cbc015ec0649af83c1ff77eb2b38b2972b836f1ebb3fc5b6e94', NULL, 0, 0, NULL, NULL),
(263, 38, 'dd07aa64909b4f28217be9688273365717cadd6dca76112b09409748db63356b', NULL, 0, 0, NULL, NULL),
(264, 38, '8a0d08a5b69f8ffa50105941047f6c1c81514af1684cdf6fa32caa58e4765e40', NULL, 0, 0, NULL, NULL),
(265, 38, '3b2840bca41a4c1e26a0a1164f9b67a31fb529329c541a3ac61154cfd7ae6ed6', NULL, 0, 0, NULL, NULL),
(266, 38, 'c41fd2662bbf6d7230d5c5f0a68399092c307e1cd7e8db1eb9fd2cf42635bcee', NULL, 0, 0, NULL, NULL),
(267, 38, '8a8c01a6b7937cb03de2029f94a357f3aac4b828c0cc5d1a64fbb723f18214c5', NULL, 0, 0, NULL, NULL),
(268, 38, '2c24dec80df13d07129d8752a60994ed4de97bf114f85c94e8efddcd867a82f0', NULL, 0, 0, NULL, NULL),
(269, 38, 'e33e9cd4b7beadcbfbaca4a54463a78a7e2697f09659539629f80d53721d4a7e', NULL, 0, 0, NULL, NULL),
(270, 38, 'f44264f612120324ca19bd40af335e21c15037124e126e14f70c3c82228ece2f', NULL, 0, 0, NULL, NULL),
(271, 38, 'efed395576c4d7b0c1a3c57dc4a4bd7bfbde9349d93347476caa8e2f248c993a', NULL, 0, 0, NULL, NULL),
(272, 38, 'c61cf8966ca89bad273f3a7b4c7eab2e77cff7a59237cd73d2aed84ad1a56e28', NULL, 0, 0, NULL, NULL),
(273, 38, 'a36ce43e2321d5b77cf37fe625d704808c6a4e967a36cdcc1b6a5f0a29dec5bc', NULL, 0, 0, NULL, NULL),
(274, 38, '9e602f0949c0094bdd168ad4f2701a5b89c07806fb333bb2d59197834d0c909f', NULL, 0, 0, NULL, NULL),
(275, 38, 'e2058eee7e7618e23c66544ac1c819eccd154dbd586b647e20cb7d0504f7bc2e', NULL, 0, 0, NULL, NULL),
(276, 38, 'eba5721593d8f1d764b752a546dd7764964b7de71eb3a326ff6e2dd4da870133', NULL, 0, 0, NULL, NULL),
(277, 38, '1f6ee0706762c6c77a262ac74bde3cadbea6b084d61d508c1ac19aa860307441', NULL, 0, 0, NULL, NULL),
(278, 38, 'a55c7d70f21f195ac72bd63747cb8c159bd8ca35b0f6e65297028a63163a9b9d', NULL, 0, 0, NULL, NULL),
(279, 38, 'f99c44ad9cae58086900d3f2967ad0786d3f67d2b046a375d530b502a3b4a216', NULL, 0, 0, NULL, NULL),
(280, 38, '83967d1c66a48ecab14563b5687c555c4451d4f4720dac809dca38ce9eed942b', NULL, 0, 0, NULL, NULL),
(281, 38, '1a7c5b1a5834f3a9359d3125a06f44f38cd5b59876bfbc69f448c9d3b2360b81', NULL, 0, 0, NULL, NULL),
(282, 38, '254893a19f8f936c5e350575201338c53c65f69bd34cc9f1429156de0620bbb9', NULL, 0, 0, NULL, NULL),
(283, 38, '7d16901ab8a0ecb37bba4a029c3ad6ca61e0dbed5fc27cbdd8bbde2af2b24823', NULL, 0, 0, NULL, NULL),
(284, 38, 'b9dbbfb303c60c6ab69fd2bac773ea6f40c06f90ca56f996f0f1c7c34b44601d', NULL, 0, 0, NULL, NULL),
(285, 38, '75833aebda8fc82a4ecacb66cbcc6bc15e3017661580ef70cbbca3b34571bb15', NULL, 0, 0, NULL, NULL),
(286, 38, 'd0e82ca8d713ae3e297c0f6ca2f4537ae091e124f08b35c3a332328406f0dfeb', NULL, 0, 0, NULL, NULL),
(287, 38, '7635a56e9e973ce0bcbf201bb030983f58a7fbc758748f3b75cacd94039400d4', NULL, 0, 0, NULL, NULL),
(288, 38, '4d139b7b78aa72ddfe4f89a9e6780a6b63b719a5f1d4e0db2cd97b5859c1ffad', NULL, 0, 0, NULL, NULL),
(289, 38, 'aa8b68abf9c3b72bfb1bde8dfad776dbdafcf99cfdc9519d8ec16703d0b22429', NULL, 0, 0, NULL, NULL),
(290, 38, 'af6275720c77d6b06fe74b348c0105f84129f04674816d7264ae614194bb08fd', NULL, 0, 0, NULL, NULL),
(291, 38, 'a07b18f98db22551590b0e7b2404b93948dd8efadb4601bd8906dfbc6dfbc4f9', NULL, 0, 0, NULL, NULL),
(292, 38, '4e7be27279e1af8b253c947bbe22109a2b63a6d63b229e3695bf24f8ccd1a606', NULL, 0, 0, NULL, NULL),
(293, 38, '05a59adaa3e0fd93765b1d2c743ef638a0fef43f3c2e2c4a08e4d78c1c8859b5', NULL, 0, 0, NULL, NULL),
(294, 38, '91952c3272e5005f8f2be7097f280e549d7555701d7cc809d95b2dff69e833c2', NULL, 0, 0, NULL, NULL),
(295, 38, '3e19e4a6d25a753119bd8eed78f70cf0177afff276629a292bd97cf5ad917474', NULL, 0, 0, NULL, NULL),
(296, 38, 'e712d04f44ef638ccb617ff427f435491bd83f4e04e78b4b90a6b1e405a26678', NULL, 0, 0, NULL, NULL),
(297, 38, 'a1362ace431582a8221b60ae0f14e4b6b0bb6ec80ec4740e40cd13de4c509657', NULL, 0, 0, NULL, NULL),
(298, 38, '7abc835a0f791e5f085b889bd222fa75143853a043d13f6061fce99b708dfd2a', NULL, 0, 0, NULL, NULL),
(299, 38, 'f5f3cc5ecaa8b33d87a372fc6437ad79f646a54cc722c903b1c9207ca50c66d5', NULL, 0, 0, NULL, NULL),
(300, 38, 'd6287d2baac4767a35709d7af599933eb3e6176df30ab2d1c8be2ef88be80d24', NULL, 0, 0, NULL, NULL),
(301, 38, 'ecae74de8905733a60a73d1a764b70b5961fffd0bb2c9fab0caa45588d66a4f3', NULL, 0, 0, NULL, NULL),
(302, 38, '8c20435b20b95bcc5d37bb5f5c80ee94d288d4abf1fc9ed3f5088be3cd05a380', NULL, 0, 0, NULL, NULL),
(303, 38, 'f7b39f3c3fe3f0202456e3975d506c0c0cb2412264fffb4f5a81a26ba210b87e', NULL, 0, 0, NULL, NULL),
(304, 38, '57ebaf01b173bf1473ebd8d0f52566f493a45676ee4757889545889235713aaa', NULL, 0, 0, NULL, NULL),
(305, 38, 'a1420de1b798bd3bdc09386f9ed6cf73f250bc8262b63516562bb126c31d33cd', NULL, 0, 0, NULL, NULL),
(306, 38, '478f291e53a002d27a27dd705257f2bb5ced4e53866d47f04bc548a3e3979cd3', NULL, 0, 0, NULL, NULL),
(307, 38, 'ad13b799c08f665d68f20f4a821ee2cbad0e32839b18bb8659c17472b4c576db', NULL, 0, 0, NULL, NULL),
(308, 38, '6cfdb4c8171d35e0a41f54c64a5543fbaeb257bb12fee065e6dc5fb7f649206d', NULL, 0, 0, NULL, NULL),
(309, 38, '3db242246ac165ce30b94c75e506a750f024c68eea5157c1322ddbbcf4d8f069', NULL, 0, 0, NULL, NULL),
(310, 38, '18004516d984d4300267ab15aa664f0cff40ea02ef918e6aad57fc54e3308e29', NULL, 0, 0, NULL, NULL),
(311, 38, '118c27cc56f45a575f80919b7a019465e8d51ae397523667dd44c59a9efe36b3', NULL, 0, 0, NULL, NULL),
(312, 38, '2a410f577a72be5d0d770803b740b8a124d3d5c459c0c549a8b4d587ac1107e2', NULL, 0, 0, NULL, NULL),
(313, 38, 'b79457ab4d58fadb1b2e7a4d11c821be6bdcf883fb4cd91dca8db19416a6263a', NULL, 0, 0, NULL, NULL),
(314, 38, 'e1c521e2b859ed3c6d3dfced924fe71eae5624134b5e10be87646270133b41a8', NULL, 0, 0, NULL, NULL),
(315, 38, '384f80cc55b7d1e319ef078cb403ffda440ccc1b3ae6f214f23f221d3e97c2c8', NULL, 0, 0, NULL, NULL),
(316, 38, '9ba2cedb680b736e2207c726efa5646145e92de72472708ce2c28ea5995da930', NULL, 0, 0, NULL, NULL),
(317, 38, '28d3d6dac358d2f89075262375a7f629a30a7297b9267ae0735bfc325f69ee6b', NULL, 0, 0, NULL, NULL),
(318, 38, 'ddf12268d7c2ba27b2a477a4e5e799e2a292592e5c09c711ae66e54dd9f24738', NULL, 0, 0, NULL, NULL),
(319, 38, 'db41b138c2b3f8d1b640d7281eb6d2493738d2e001a3c5a40c2e1f9516ccd568', NULL, 0, 0, NULL, NULL),
(320, 38, '78a7be03b7253abe09437b5603f8c9a872279f3e0cb1f7e2a7fe39824d1ecc39', NULL, 0, 0, NULL, NULL),
(321, 38, '02106cc1ed35249aa650efdd90cc61490c826090a4533407b662239af05c14a1', NULL, 0, 0, NULL, NULL),
(322, 38, '45c4e6e37d4d4a7e222c58e2e33a2ee2f1c0fabdb8897e53487c390656f9e15d', NULL, 0, 0, NULL, NULL),
(323, 38, '8a0ff785eeea19d468bad130433f9f244dfd3f155222587936667677335e0674', NULL, 0, 0, NULL, NULL),
(324, 38, 'cc5166bf5777e7195434df76140343533f53dbab0a928af779593c81459a4e76', NULL, 0, 0, NULL, NULL),
(325, 38, '8d9eb3298cbe2e02ee699367addbb36d54cf31a4a2431ae4407dc6a5cdcb3961', NULL, 0, 0, NULL, NULL),
(326, 38, '98c32019b95a0c8dbebe1c51bde3217fd65cf7c180843eb5fea7cc5b2f3c7033', NULL, 0, 0, NULL, NULL),
(327, 38, 'bb56244b1253336d6adcb91301b2235bc4565b452af93d0dfab0bfc61f5580f2', NULL, 0, 0, NULL, NULL),
(328, 38, '750ac81077f717697e778fdb9288be2316f3d1eba9336238a7b90ae39b827b3b', NULL, 0, 0, NULL, NULL),
(329, 38, 'a3a3299bdfd6fba5df3467ec056c3cf3d541d924ebaf61e5264678de5f48b169', NULL, 0, 0, NULL, NULL),
(330, 38, '5bc5ed5285a060129fe7b82d2c2a913f10a9f3b55bad5ea0c1aca0f18602626a', NULL, 0, 0, NULL, NULL),
(331, 38, 'd2b7251b84b0090a6256a20e5dae36b0042a8f2abbb9f0e3c759f10835576388', NULL, 0, 0, NULL, NULL),
(332, 38, 'fb50c7bb5a37e8e722c1cf3db6dd6d1b543e7c887401561737416ea9ae5d2e05', NULL, 0, 0, NULL, NULL),
(333, 38, '7ed66d2245de18d0bea8028c6c5e761e64101db943f4b9655dd86ab817c4d809', NULL, 0, 0, NULL, NULL),
(334, 38, 'ec45bda25534ddcc520601600d69be3cf6888837ecb9191f700e763bf90f4d10', NULL, 0, 0, NULL, NULL),
(335, 38, '3d39ad53279c7d1d728d58a07c135f45b938d95502fe33bc3493bb18e37f5efc', NULL, 0, 0, NULL, NULL),
(336, 38, 'da65e28cd6340f476c8df6efaf70e2ec27a9f86f1db1742232ebcadb5a924d2b', NULL, 0, 0, NULL, NULL),
(337, 38, 'a2bd430801d3464d292eada6a0bbee8f12dfccdb5975907135f4491e9316da36', NULL, 0, 0, NULL, NULL),
(338, 38, '315ed09e4d74d98d0ad09b45c69afcd2bec1d36f929d8b5be0d3cece60c0b306', NULL, 0, 0, NULL, NULL),
(339, 38, '3fe2233e4aa19da7030366893645e8efd669d8f2693d2713e46284f2a60dbc6b', NULL, 0, 0, NULL, NULL),
(340, 38, 'd4705df6f73ed84ae14687ff75aea7c1bfb17aa94af8bed1b50024fb30448083', NULL, 0, 0, NULL, NULL),
(341, 38, 'da2d8110c075820f6ae7c500a54627df5dee84339125cb6695cc4344efaac916', NULL, 0, 0, NULL, NULL),
(342, 38, 'cac02687282ef5b8ba3d2de48beb0c3b25b09ea8ef1dc35d263ce3e0bc87742f', NULL, 0, 0, NULL, NULL),
(343, 38, '4dbd36254f6ff6fd3bb04ed41d2a923b6a42c639f63f886cb048b5a3e89aaf18', NULL, 0, 0, NULL, NULL),
(344, 38, 'bbae3fb99c5c97efb06dc6c45c9d40e27c47ac67f529e2db02960a520b40876e', NULL, 0, 0, NULL, NULL),
(345, 38, '659d8245fa70f1e6f87f52eb0cc86efa8071fed7146bbbad90a8ae255ac63dcb', NULL, 0, 0, NULL, NULL),
(346, 38, 'ad361a99408df9175c4ea27a72762d48517807db82c0d23f213b885f3ef2223e', NULL, 0, 0, NULL, NULL),
(347, 38, 'f3a3af185c383d27cd7b90ddd8d30c1709ed8cdee9df1ecf335d6368e939bc33', NULL, 0, 0, NULL, NULL),
(348, 38, 'd11b13b75e42e34efb0863f62ddc634bfa3af1cc5088db9650089c2566916fd7', NULL, 0, 0, NULL, NULL),
(349, 38, '1b03f28cfb21538cdcb1cea6bf42b004d5223eb37255edb47b37ab143663244d', NULL, 0, 0, NULL, NULL),
(350, 38, '0ec7f1530eb56fcdbbdc5c700dde66f8716c1ad8962840a88f6f6d4424ed1bc1', NULL, 0, 0, NULL, NULL),
(351, 38, 'a892d67a4c1c27d19366d803e7c711478ff64257f10f77766884bd12f09bc4a1', NULL, 0, 0, NULL, NULL),
(352, 38, '507b792af8fdecd9c7292cedf79b29b3cc28ccb39ebb83054196cd7756a9d5d0', NULL, 0, 0, NULL, NULL),
(353, 38, '249cc1437ad0bc6963104b43e258248082325073dde71b54402ccfdce6de1c55', NULL, 0, 0, NULL, NULL),
(354, 38, 'eafbd7476fc5e2bb36d71794b63f45238f9489a71538e7de07c16a1c2bfdeb62', NULL, 0, 0, NULL, NULL),
(355, 38, '5e2952480cf632aee514e13d109bf415118ac9d684b48c687ab43ee8f42b05aa', NULL, 0, 0, NULL, NULL),
(356, 38, 'c43227d2232c9957370c7908dc8a9eb07e4748139090df771fcf95828bf4f5b8', NULL, 0, 0, NULL, NULL),
(357, 38, '31bbe438acc397a799ab5a3b261185449939b4071da37975c35b1ef1612f4fad', NULL, 0, 0, NULL, NULL),
(358, 38, 'af781019086dff2e9b8bb4f60fdc387b7deb437d4173d17c4df5f274147540e2', NULL, 0, 0, NULL, NULL),
(359, 38, '7c91ed98c55a7c976493e531299355390e62e7d024ecdfabe0161336ad2d50ab', NULL, 0, 0, NULL, NULL),
(360, 38, '82aae7b0ba4fa0a24944a13aabf1c12770a4e60782fec2c7205ec67550fe0e1d', NULL, 0, 0, NULL, NULL),
(361, 38, 'e3856ff10ac7fc902c9533c2766cb79144219864f506c5dcd1f2d7b8460ca9a4', NULL, 0, 0, NULL, NULL),
(362, 38, '6bc701ef0f1086b9e3261ab3e28f8b1db1c6f3d0b4c61b24ae7766293bd979e3', NULL, 0, 0, NULL, NULL),
(363, 38, '9cd261fe2b8f45a175f7990c576563e4919165f17bc6bacf3be688d782d5eb5c', NULL, 0, 0, NULL, NULL),
(364, 38, '0e29f1d94e8f87c91883ca6c4149eabc8e6183fab1e98fb3675df937968b35b3', NULL, 0, 0, NULL, NULL),
(365, 38, '3084f947d1f5e0809b0f28b86d90f3891ad10b2f184ed7b1accb8ab877bc3015', NULL, 0, 0, NULL, NULL),
(366, 38, 'd7ac7c3c8ecb8b1e9505d3277f5ed73fb88419720a43b2e71f15c4aa7c5c00f2', NULL, 0, 0, NULL, NULL),
(367, 38, '42ee1b378521882ba885779eb7657114d901ef607841bd2d220e4707c30f5093', NULL, 0, 0, NULL, NULL),
(368, 38, 'd4515ca716530a738f95a92edc906af26c57dcd9c820169be8e761801f4999e8', NULL, 0, 0, NULL, NULL),
(369, 38, '97bbee25478527c2585c97e41dca7e2d1e4fab42a8408e00fcbf6fb3a23bd27a', NULL, 0, 0, NULL, NULL),
(370, 38, 'a98ffac4ffafcb8388ac17709579e4c2ed13ef4b125f61f95f0d3a27552b9355', NULL, 0, 0, NULL, NULL),
(371, 38, '02205dba774296dddaaa992828924520d8f7ac0f78088c01eca9cadac4922007', NULL, 0, 0, NULL, NULL),
(372, 38, '12acbf189711ad624f917fa8cc483c5295c611426addfeced7751f7513e0ec47', NULL, 0, 0, NULL, NULL),
(373, 38, 'b8df5f706082f92d99dfeb390f07dd9747426ac67d6b077663c13adbb19baced', NULL, 0, 0, NULL, NULL),
(374, 38, '48bd10050c7882f15352d0abacf8ab378d13b4452f85951e21eb3e8d2a6cdced', NULL, 0, 0, NULL, NULL),
(375, 38, '3ab8fd6222f9f95b78065cb7f863188fdcdfd8950a04fa7747821a2fd09efe83', NULL, 0, 0, NULL, NULL),
(376, 38, 'ae0ca17d93434c00430ac2cf2463798a759c00608d67a9c656685ca42ba40edf', NULL, 0, 0, NULL, NULL),
(377, 38, '921e4dab281dc9cbb1d0a0774f9ef428ecdb196abc3247071596896dc041bdc1', NULL, 0, 0, NULL, NULL),
(378, 38, 'ab4a3b4a1d23a8433f6f3eb479478381683fdbf332188aed385883a6dc5d8289', NULL, 0, 0, NULL, NULL),
(379, 38, 'b1dd4342dce60cd867ccf465721ac89e09ecc329f98b593f2bc7ee1ec5b3982a', NULL, 0, 0, NULL, NULL),
(380, 38, '1ce7bd7fad5150a3ca9d4e466ba5f5196786fa7ba881474bd6630dcf196e26bb', NULL, 0, 0, NULL, NULL),
(381, 38, '07bfec425a72a6779ff9e88bd005f7996266a6203d4db2c787500c2b1b57dc87', NULL, 0, 0, NULL, NULL),
(382, 38, '818223373f4aea222602b0c669e3227ec8ac3661aa798651ca65b1a815b07530', NULL, 0, 0, NULL, NULL),
(383, 38, '3b5c7b29755ce8f464fc6d99a2d59dd58253a1b3d9fd87b6da01385f0a53c5e3', NULL, 0, 0, NULL, NULL),
(384, 38, '5bf3b40d1213a622031dc3b8f858172e86bf94c080c0ba9441a10b1a94e6125e', NULL, 0, 0, NULL, NULL),
(385, 38, '61ae1ec589734b46be6e6e8209fd6164a94341df77bf5304cdce976403e9ab36', NULL, 0, 0, NULL, NULL),
(386, 38, '6918049ce2ab103cfeff81e87bec1a808cdf7cc755cfa7f8c6a72823cc7691e9', NULL, 0, 0, NULL, NULL),
(387, 38, '0c4105d255c787e2d284e531ae732c57505298c1f5f0c34a5a36c18ebe406bcf', NULL, 0, 0, NULL, NULL),
(388, 38, 'f7e4fb79e996e245b1df64b38c195b2f5e51c8ebe41273f080f778b9839d805f', NULL, 0, 0, NULL, NULL),
(389, 38, '06dd6bd4b2cf8f94be0952a301cdc4becf89ebb2603ef022f27031f50cdc5a2c', NULL, 0, 0, NULL, NULL),
(390, 38, 'c7dbd63ce4c4a1bbe91ea92452289c4d05781bdaf392587081576f876288935f', NULL, 0, 0, NULL, NULL),
(391, 38, '430f8bdeac4acc9e55b060e61bc5814e1484b766cecb1f148c2cebcd5e24bd33', NULL, 0, 0, NULL, NULL),
(392, 38, '71fe39beaeb84709a53c1a17464ac05913b4c1646bd15893271ed830fb4bff79', NULL, 0, 0, NULL, NULL),
(393, 38, 'c81d4ef73e7bc526c2ea156496160b85c39bfc8ebfb9fef664110ffba6e407a8', NULL, 0, 0, NULL, NULL),
(394, 38, '6de80d3c874398dda6a710e29bd66528a15613dcb32eaa68f9204475a7c423c1', NULL, 0, 0, NULL, NULL),
(395, 38, '68ea453cfc13f2108217f3a787df71d418a9630b9c300165772e2b9a9ab0db91', NULL, 0, 0, NULL, NULL),
(396, 38, 'dca6e017c67277cb50873331b20505311d8e9a83233a1f1d4b136aff911d3a40', NULL, 0, 0, NULL, NULL),
(397, 38, '6f858e916dcc3b9b3a949bb6a832e0135e465f68395c591ea8785d408027ac4c', NULL, 0, 0, NULL, NULL),
(398, 38, '3acc8c09f8ef5f454120158ace1d1f64283894758e7daded03c1e38588affca7', NULL, 0, 0, NULL, NULL),
(399, 38, '2d6efa775f8142accf7bcd564263633f3f41c9af3deba28c79b6c0a1fc86c211', NULL, 0, 0, NULL, NULL),
(400, 38, '31f47432d81f17dcaee0207501bbe2321ec14c5e61875682b03c2d95060504d9', NULL, 0, 0, NULL, NULL),
(401, 38, 'a10f5b84ae57c692f2596bded9c34ab87ded4371f4a0ec5f3c82ed224551f11a', NULL, 0, 0, NULL, NULL),
(402, 38, 'db0c0b8024b7758baee0b8fdb11004f81a6843ad87e2a89507c563c414c9409b', NULL, 0, 0, NULL, NULL),
(403, 38, 'aa2a3f261f85821c6c9a7a91a680a8b322f1ec852d381e02a305cfaf3b4d9b8c', NULL, 0, 0, NULL, NULL),
(404, 38, 'c7b4813c14cfc98219a74fcbb60d04a899339335339c47600f19cf108f8db3c9', NULL, 0, 0, NULL, NULL),
(405, 38, '5cb8984a8a3c35cd2220103f9234b083c6c17f77682aa9fa0daf075e3b87735c', NULL, 0, 0, NULL, NULL),
(406, 38, '4a020e32704b8a51fb1b5956f84913567ce5b8705238b7fc41d9bcf106cac070', NULL, 0, 0, NULL, NULL),
(407, 38, 'a75f0b87c4a4731298d9e23d648b1f1ea2489d07a52c353e0258c2169680cb9f', NULL, 0, 0, NULL, NULL),
(408, 38, '12b451bb755fc29ad1583e8ba355d8ffa0e0040d75ec0913007b5af409faa159', NULL, 0, 0, NULL, NULL),
(409, 38, '647e265f5df4f24d28a41cc8e181a14641d6d87deb229bdd5d9ba82c1f8b99d4', NULL, 0, 0, NULL, NULL),
(410, 38, 'b6250c7658dedcf69740085da22db8b91832d636791d21bd7ca92a1ef0f8cdce', NULL, 0, 0, NULL, NULL),
(411, 38, '56c57d6a8eaa8078db3b2af50d0f095a0598cb2a200ce2a5c00f45529517f2bf', NULL, 0, 0, NULL, NULL),
(412, 38, 'a1733d10b38ec3f664f2b763976ef9686e6a3a40afddef572e3baa52ef10325a', NULL, 0, 0, NULL, NULL),
(413, 38, '4f7cd72c9dd0331482611dfb887b4b60886bcc709d2041e08a92d99e44d12ff9', NULL, 0, 0, NULL, NULL),
(414, 38, '958b2390f483d38668bbfc34d1a2b594d52cb7762c6d679bb0bc7bdef64b70c7', NULL, 0, 0, NULL, NULL),
(415, 38, '19a7f905fe315c6cbb9a40dfde33ffb599b1dda66e0ec4c7177d44782dafa740', NULL, 0, 0, NULL, NULL),
(416, 38, '82bc924d4928fa51766936be9a573a2fb711b642cbdff16b80d9653a8780e434', NULL, 0, 0, NULL, NULL),
(417, 38, '2feea6862aa497d7f2edb79b7a1e1bb4ac244287cbec907efab0b89b3b8055de', NULL, 0, 0, NULL, NULL),
(418, 38, 'f9f62409312da0f0eb291b1acabed2e881afe9d36784144d6f387375447acacb', NULL, 0, 0, NULL, NULL),
(419, 38, '5f7a80bf52311703136337f514b3739d5e26f7ac218ca898dbf5bdaa2aad9905', NULL, 0, 0, NULL, NULL),
(420, 38, '9b20fb6df1b9548cfc2284da3223b2dc36f3d39b0906b68cfb5ae52ca495396a', NULL, 0, 0, NULL, NULL),
(421, 38, 'f39ccc9d8d2c81d8899202eb90edbee3a3de7c51531c37058e507565b039e84d', NULL, 0, 0, NULL, NULL),
(422, 38, '2523a3a48514b24487033fd4468728a788d6f832983d52b5341f111b0fbbd27c', NULL, 0, 0, NULL, NULL),
(423, 38, '668f67201860af92dc1c906bf4744ad7c0c0e95cfb7ef4a0f3321aa632ff5efe', NULL, 0, 0, NULL, NULL),
(424, 38, '1b58f27e71417ca593fbb232ae8314a494eea836109cfa7bca0c2685933a600d', NULL, 0, 0, NULL, NULL),
(425, 38, '9c0dd0b8e21e7063cc0ddd6d007c08e0d32eab778f41427ba6b10aca61fb1ab8', NULL, 0, 0, NULL, NULL),
(426, 38, 'afb12d061ceec56b464ccefeef72bdd2a8ec8f754fd646c2a8dd17ad5c05289a', NULL, 0, 0, NULL, NULL),
(427, 38, '6790713cd488c85ca777eef82560b2f2ba60c038ccd4c249802d7a13970bf9c0', NULL, 0, 0, NULL, NULL),
(428, 38, 'f3e606f2023972fe7cf9bc0a653c4524fd962569bf99fb3d34a07f773398ac25', NULL, 0, 0, NULL, NULL),
(429, 38, '503f13c20b694a7ce0f14fdcb5a61f148c84120605941a706928f49c7b14e420', NULL, 0, 0, NULL, NULL),
(430, 38, '905fb5ad5aae6b6756514fe53822ed85766c34d5efc4a07683ab775ba49161af', NULL, 0, 0, NULL, NULL),
(431, 38, '459e268d769ed7ee3ff34c0b57823b15de9c1086293d1c72095b5bbc1f1c5de7', NULL, 0, 0, NULL, NULL),
(432, 38, '65a929b1d952970db96b57e4ec55aa8cb33e08168e13362aaae553d7cc3eca3c', NULL, 0, 0, NULL, NULL),
(433, 38, 'aeba19eff2a8eddccc0d9329373cd6ff35efc34aa110dc3704e4adc224b1ed3a', NULL, 0, 0, NULL, NULL),
(434, 38, '4d0357f4ff8d3915c75683fd7aa109bb36155e5dae119e33125a65eebfa0b56d', NULL, 0, 0, NULL, NULL),
(435, 38, '6fb216f8d1f121ae8de40c3b3927199405ccfb343cfa3ec3cbb1de29f60ba6f4', NULL, 0, 0, NULL, NULL),
(436, 38, '9fca0406c6593c04445b60d72d3ddfc3efe2b40d39fc2ebdbbfb73a154b6ca11', NULL, 0, 0, NULL, NULL),
(437, 38, 'e2c6a7403c7f47eb45f6813a8ee50fbfe1ee1a214eb9f898124e52fd62ebf9db', NULL, 0, 0, NULL, NULL),
(438, 38, '5d390c3723d1ca7a1f687e559be5cd8f511c070e933d84c79655a9ccb23b4608', NULL, 0, 0, NULL, NULL),
(439, 38, 'afb7207eaafe37c606baab83072648fd7a871e3fafd19a7b3cd38ba86e6ae708', NULL, 0, 0, NULL, NULL),
(440, 38, 'd5b97826022c2791a0e5f8dc982d65c78c190a4900a7bded5986fff7e3118c01', NULL, 0, 0, NULL, NULL),
(441, 38, 'ee8d5ebee99a1ea00e548fc738c381178ebd499bbcfbc5bbd951f52d13d2adf3', NULL, 0, 0, NULL, NULL),
(442, 38, '6c1a286a14199fe795f422e082f83553bf6465eb1c41f1e5661f050ad45f85dc', NULL, 0, 0, NULL, NULL),
(443, 38, '8fec0190d4c680a07aea796cc9a3632a15749eba1cf5fe81adb471fc6e936c0d', NULL, 0, 0, NULL, NULL),
(444, 38, '1821a2386570a71fda8340b8cc8568f2d1a8dea7ff9f9414447082260fb733a8', NULL, 0, 0, NULL, NULL),
(445, 38, 'ada05491b36187276456753db0b60c9fda15f5cea0b4bbf43fcb4f12dcb173e9', NULL, 0, 0, NULL, NULL),
(446, 38, '45f89f2c9a83598e711191954a5bdb746daf611d47f6f907b3a415367c74f843', NULL, 0, 0, NULL, NULL),
(447, 38, '34015e9187ce9f60c8ba65da7fc6850312e9059a2913d5768b8f3bb796249be6', NULL, 0, 0, NULL, NULL),
(448, 38, 'dbd34c720a5c25fadc5236e9e0e3188a9851cbe192761eb50b1a194dda23d39b', NULL, 0, 0, NULL, NULL),
(449, 38, '97f29ebf4bf85a5d10d93ac5fee0d9947f79a8b989e041ca05d8e9b4b70aba74', NULL, 0, 0, NULL, NULL),
(450, 38, '9d86e9c72619087b1099307450ae0d6ebf8016cd69ed9bc83213c43900455009', NULL, 0, 0, NULL, NULL),
(451, 38, '988c2c068dccb3eabe0ba79cd6470b73583cce4de34dc8026c342675418720db', NULL, 0, 0, NULL, NULL),
(452, 38, '21ad1ead8ed144772bd1d6b0cb279730f8c29788e4644e9fbdbac66a4945d1ed', NULL, 0, 0, NULL, NULL),
(453, 38, '13059155f225c52b7f612b840daffdf852ba45c28ae7fd47e9fd2f14601d19c8', NULL, 0, 0, NULL, NULL),
(454, 38, 'bf9fc96f34cad72fb1795c664123348e1d3b089dc4c3b561edadea7847bbff9a', NULL, 0, 0, NULL, NULL),
(455, 38, '39661d25f9db22cd48a0107e793fea5a6b7891d57aa35b4211f7d8f2eb38d65d', NULL, 0, 0, NULL, NULL),
(456, 38, 'd661196373dee257743c5f6596c659a882d57578ea8998cd95850220778a1378', NULL, 0, 0, NULL, NULL),
(457, 38, '76ed16cad59400536ab9c82c8015c68a377f54873e0dbb8d3859f5412c6e76ed', NULL, 0, 0, NULL, NULL),
(458, 38, '6f70e23d39524fa2904112adfa23cd1cfbed7c6f76e5c6d9a9f4bf5fbd4a4670', NULL, 0, 0, NULL, NULL),
(459, 38, '9c9d828ec2a5b1c0cac2f0d4fdfd167b65b2cce75222934ccd2a7d32968464dc', NULL, 0, 0, NULL, NULL),
(460, 38, 'eb99bf3b5fee5015334f85a931764fec373e9aaa6cee3beeed9117b3294ab1a4', NULL, 0, 0, NULL, NULL),
(461, 38, 'e5ceb408f01fad453eb3e3c89f80cd2e4481626ee56b24f5fdfb436a92419400', NULL, 0, 0, NULL, NULL),
(462, 38, '6f012ef007f4ad6f3c1ef1f2f427f8ec79e2a86b02e0407b0c56f4c024689ed8', NULL, 0, 0, NULL, NULL),
(463, 38, 'b79df8e25afe5d4dd502743bef1a75f7632fcd03ed28d5eb78166ee96339acd8', NULL, 0, 0, NULL, NULL),
(464, 38, '9c2356ab78ec5dc28796149f42ba958003c362783dd73efef3ebbcdffb670de2', NULL, 0, 0, NULL, NULL),
(465, 38, '8693bd80939b09141f326f4acfb18a5c7df02733916d4e55d80489a426927e50', NULL, 0, 0, NULL, NULL),
(466, 38, '3ea937a5b2651ae176349fb57739a148beb25aa3953b86b7920b7aab59a314e8', NULL, 0, 0, NULL, NULL),
(467, 38, 'a4a46d8ea41bcacd3bf5967776752374dfd87ef636a55fd604c33e655c71522e', NULL, 0, 0, NULL, NULL),
(468, 38, 'e1b0b0abfa4d5f2158f88e6abb882aef2a2f333ff2e0b75afb2cc62514334225', NULL, 0, 0, NULL, NULL),
(469, 38, '929c5f4e69206b67a7266d58c5f0e87f3331fa7b2fde7aca2b150527de95b242', NULL, 0, 0, NULL, NULL),
(470, 38, 'a8bb0d8529f41142cc3410d15185a38c18892f838554aea58d8ac28c4b3c1c1e', NULL, 0, 0, NULL, NULL),
(471, 38, '0c5a9505a704803c6e2a560668ce1b67b2bf21d24471f7a353947b1f839f83cb', NULL, 0, 0, NULL, NULL),
(472, 38, '3b5609bd0718de514b1f48239acf4c3c5c2fa1368353efd213690c376cdf7a06', NULL, 0, 0, NULL, NULL),
(473, 38, '5c21bc3ed681f2d248bb6750db2504ff0787b39edd15609a4bd7fda6c4e0a8f5', NULL, 0, 0, NULL, NULL),
(474, 38, 'f22db2b3777a61710242001611436cc6c20fc7e3169de508053d05fee2a21ebb', NULL, 0, 0, NULL, NULL),
(475, 38, 'cad356aa04744fccbe1125ebd8df2d0a752ca32442f02c4f62e8af555ca260cd', NULL, 0, 0, NULL, NULL),
(476, 38, 'a1e55f9090331794f620d343152cb37a55880e2f2a76228112bc071335293020', NULL, 0, 0, NULL, NULL),
(477, 38, '9473c93600979750573543ad3cc166dbae300f618449e59e49e915bbfd8236c7', NULL, 0, 0, NULL, NULL),
(478, 38, 'cb832190984f45493158b52c05b0674ea4c8b1939ae2811bd184f9393ee47b08', NULL, 0, 0, NULL, NULL),
(479, 38, 'a3b77f904f0991fd942e40ce41ad5de793695402c55551e05dfb1efb0b50631e', NULL, 0, 0, NULL, NULL),
(480, 38, 'fdcad82422ed4a74dc3ee80df9a8426e30e64d5ce108ff97a2d08caa340966e7', NULL, 0, 0, NULL, NULL),
(481, 38, '01d2127a14ff4fa0831300fe754a06c9a933f706355cf155024d435b69a1930e', NULL, 0, 0, NULL, NULL),
(482, 38, '371ae19f358b03fc629985e99ffb36edaffdb7704f6a5fc2c89d3ee451cd9bcc', NULL, 0, 0, NULL, NULL),
(483, 38, '9920e001ac101e9464b9122fa5d3c3fd4c7633751698068be02490ef7095456e', NULL, 0, 0, NULL, NULL),
(484, 38, 'bb7c525a89c1115f207feeba9f85b7aef35cb44e6c9478daf9a37916ff4f14f9', NULL, 0, 0, NULL, NULL),
(485, 38, '104125f0eb686af41b95f12ab2169c13282e9d46121b724f94725d7e3fcd27c2', NULL, 0, 0, NULL, NULL),
(486, 38, '3e198e65224f479c7e8b134e83d0f971476ce350674d6ab551eb31d2d822aa16', NULL, 0, 0, NULL, NULL),
(487, 38, '738dddecb4da20c414038abcaec04fc8403e3560f00d166a1c0a47391e82d83d', NULL, 0, 0, NULL, NULL),
(488, 38, 'b23d5a2c121f51a02b71997ca89e1934b2e2ba23340cba44dd8453abea657914', NULL, 0, 0, NULL, NULL),
(489, 38, '291b31ce124b8bf9711c2439fb2ebe2ab9ea5361d9facef29a06e42d9a94a82e', NULL, 0, 0, NULL, NULL),
(490, 38, '18e3d77b774a0e7c1df7911a75f794d04e8ccec8500c19aab48d8cf535e2a6ef', NULL, 0, 0, NULL, NULL),
(491, 38, '9df5cb7361e2de156ad677f1ebc175326309c9fc603f48636b70bb54f42f99f1', NULL, 0, 0, NULL, NULL),
(492, 38, 'd23b13b5db11f4a163ef9940a8e263c887a1af20382c144f1916cf9fd703cb83', NULL, 0, 0, NULL, NULL),
(493, 38, 'd5afd803f9560125c5f4683c54c498d10f518dd7ba8b159acdea94c75ecbd8fc', NULL, 0, 0, NULL, NULL),
(494, 38, 'aeb3be02dc033382656d2e2268ceea2147305a2247151d9e4144b34d559429ef', NULL, 0, 0, NULL, NULL);
INSERT INTO `s_api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(495, 38, 'e3fd1818a4f26e4134a617005b8191821dea67a1925aa789e166ec4d1ecabc8b', NULL, 0, 0, NULL, NULL),
(496, 38, 'b0a50e437236b63e3d3c1f76a14f2321ac976156617ea462683d86d592f3309c', NULL, 0, 0, NULL, NULL),
(497, 38, 'b77e4aa3853edba43f0d97006a5c3291dd7cdccf9494b7c90daa7f09f3ce85f7', NULL, 0, 0, NULL, NULL),
(498, 38, '2570d43d0ea2de7c76ef0d02e2b18a2fee9ab78ced645056dee5860b41440d32', NULL, 0, 0, NULL, NULL),
(499, 38, 'eda25540073543823f1efb0a14f51d928b150a42361b5af779ffb714e652f895', NULL, 0, 0, NULL, NULL),
(500, 38, 'ac32539dbcde6ec6fd9ff423ea7143fd2c5e182ee2785d9c2b346b40c1be93de', NULL, 0, 0, NULL, NULL),
(501, 38, '54b40d08986aa4912c700cdccb4ccad4b84e50b91ab9aa3f943f37248cef7570', NULL, 0, 0, NULL, NULL),
(502, 38, '8ccbf9ea2ec2c05480cc2c89c20e43b0a7764333044a8cfb89dc45190127ae4e', NULL, 0, 0, NULL, NULL),
(503, 38, '4f662f9de97f5d9664967f490fb696428300774d3d1c0cb0dd6d2ad30211a7dd', NULL, 0, 0, NULL, NULL),
(504, 38, 'a3311d4e0064992f1acfd322a4dcee3a6ef4862bc502e1eccee9cefd36ac6c50', NULL, 0, 0, NULL, NULL),
(505, 38, '5c85bdb48d547520c74375cbbbb1bc68a8f845006ea4eb25be4e8d8a2b140a9b', NULL, 0, 0, NULL, NULL),
(506, 38, '2e994460ad505b47c51c9cb0bc88a9fe8a5ea428514d5f617a714b489a445c59', NULL, 0, 0, NULL, NULL),
(507, 38, 'fa93436b4e3bbcdaa9a1c957e3db6e6394e4493bb43c6a8a175d876bf487db48', NULL, 0, 0, NULL, NULL),
(508, 38, '501943cb4e2e64f8a0b3ca5c5f33bdff61834f2c2635f9068067d365241aabca', NULL, 0, 0, NULL, NULL),
(509, 38, '08e801fb2ba3a41757315560ca109678ccbc9af21676d8df9246adf6848217e3', NULL, 0, 0, NULL, NULL),
(510, 38, 'e949a01c7b1d8b283b46933507d97b0a84f1d1f0d78b409d2ad8829c54f69d6f', NULL, 0, 0, NULL, NULL),
(511, 38, '13639e6724e5711146bd38b7fb98667ea145ad9887bdcd8f88bb2c76fe4e4e95', NULL, 0, 0, NULL, NULL),
(512, 38, 'd214bd442bb29db6d67ffcb830c4297369142b70a1fcb0f3f46bcd2c9d362f18', NULL, 0, 0, NULL, NULL),
(513, 38, '844efd21727c3e7d67b9f0612946140c2a119a617f0f7fff4005c553ddcdf9bb', NULL, 0, 0, NULL, NULL),
(514, 38, 'e59a4ef359f084c6da88d8a83789a0067aea655e0ebe79942488ff7b4e801afe', NULL, 0, 0, NULL, NULL),
(515, 38, '50683eee63b405e5bb3ba940af1df5d0372c67d041c990c78cabd99b8c4aa199', NULL, 0, 0, NULL, NULL),
(516, 38, '7d0e90b1d709437d3569149675a75384481075eeeb5079b11767d9dd3aeb573a', NULL, 0, 0, NULL, NULL),
(517, 38, '5def226f1867c3bd486fa5d2c7a615b8647e6ec805f83415651dc5ed647ffa1d', NULL, 0, 0, NULL, NULL),
(518, 38, 'cdfc0b89b29532cfd2293ca34f2a09387fca727a88f4dcdec98e6880d8618417', NULL, 0, 0, NULL, NULL),
(519, 38, '71ab0b73668991264b23030d5a02f7f94060b43b5cacc69e108738c3370ffc4a', NULL, 0, 0, NULL, NULL),
(520, 38, 'b213e9b584323f2a830ba06daf726eabb132701b7dbf16f693a50737f0d7713f', NULL, 0, 0, NULL, NULL),
(521, 38, '6d4eabac368751cc95efcae02d7f3d5fe59a1cd7885c8fde9b0077b76709f491', NULL, 0, 0, NULL, NULL),
(522, 38, '8e9d335742fd131b6b12dfc68fed08d7930d78cb6aa535c3ae355d9813476c14', NULL, 0, 0, NULL, NULL),
(523, 38, 'f75f9c20037c2cd00170796c4c44ea2146727cc210d3464091ea7f66be4e457b', NULL, 0, 0, NULL, NULL),
(524, 38, '54088389319c799276652c90c7b13a2267058fe5c5032c384b23192a74ec724d', NULL, 0, 0, NULL, NULL),
(525, 38, '7a12ec64060369ac7c9bb350ebb7af9072bf912a52a71e1ff1b412eaf02752c1', NULL, 0, 0, NULL, NULL),
(526, 38, '7c99565c4b7c4868b1f4cb2de45ade61e6fb858e0c0340a31c18faf9ea20710c', NULL, 0, 0, NULL, NULL),
(527, 38, '4675625b84a4147f585a7b47feb81702c0bc765febf12681d6dffbd9c15ead68', NULL, 0, 0, NULL, NULL),
(528, 38, '876b0aa28f3f4a85d08655dc6e91e9788fefe20235890e4327d70a91f36c5ffc', NULL, 0, 0, NULL, NULL),
(529, 38, 'b37c151ec81a1b1621ef6eda61c184e7decb563a84e282c90d461da1860d7b10', NULL, 0, 0, NULL, NULL),
(530, 38, '023fe32d009d835beadd35a987885fddb3e15571769892f0ad51537bd56ae816', NULL, 0, 0, NULL, NULL),
(531, 38, 'e8c4f7c755188b0ce8b4a21746e76cd50e86fab077ac31759b80683a4908f6a4', NULL, 0, 0, NULL, NULL),
(532, 38, '6a7a60ba3058dc86678f2af9551b56c7f374083a524be167ceda56f311fd4e69', NULL, 0, 0, NULL, NULL),
(533, 38, '2f6224006c0b8dd357d366d84c436016dfb18611f29b15b96bdd2a0840f4c359', NULL, 0, 0, NULL, NULL),
(534, 38, '8be121b27e3a70f80d31304e54b24fc32e95afa26dbe1c3afc389e866d67e266', NULL, 0, 0, NULL, NULL),
(535, 38, 'fb0a2e21a9d221d1487ee3629591f42ef5427f9a7c434bc4b7f1e0a1999bfaf7', NULL, 0, 0, NULL, NULL),
(536, 38, '6d8b06177a601e20729f55a1e9cbe2d649af861cb30c3d490db358cc8b572808', NULL, 0, 0, NULL, NULL),
(537, 38, '179d1e586aec8791d768068fc1d65caa6376e648e6dd3fcad02fd2ecfbd4e46e', NULL, 0, 0, NULL, NULL),
(538, 38, 'eba052ad71ba56028c5f20f2d6164265eb5da47e32370e653e5bb68bfadb049f', NULL, 0, 0, NULL, NULL),
(539, 38, '84af10466147707131817bde8ee5fcf120043ecb36b33a53efa49060b1683d2f', NULL, 0, 0, NULL, NULL),
(540, 38, 'a62d73118a6156b83251d93968e35e54ea5ef24be698c31ec0e6f150351cadf7', NULL, 0, 0, NULL, NULL),
(541, 38, '862a806412c78f4f98ee3fe7a1a79e90b908ea2693174f6642510c7a888bcf69', NULL, 0, 0, NULL, NULL),
(542, 38, '3dc0c1de6f450b4520222f75151a38b897e28f5a5e92f808dcaade9fcd3c1555', NULL, 0, 0, NULL, NULL),
(543, 38, 'f195ac2a9e665866a18a07f98e5260b514f85f0801a694e1f7757335bfcb5e2c', NULL, 0, 0, NULL, NULL),
(544, 38, '3dd3afbf783d44b1c3642d09f2db846b7fdfdab89f5f1e585e0e03b80e04023f', NULL, 0, 0, NULL, NULL),
(545, 38, 'fc348087c7e878d11f29cc4316c3913b54275e373e1da823d75151bc4f73c59d', NULL, 0, 0, NULL, NULL),
(546, 38, '86415104c0163474a9260a45febf45d799b70ea302703b42c5ab1f8df162b617', NULL, 0, 0, NULL, NULL),
(547, 38, 'fd52421901f7bafaebf012ec9072f13b66691119c11038b6e546d9aaf3e3ba6b', NULL, 0, 0, NULL, NULL),
(548, 31, '91eed684334219433e76a44f349c5941a823cfdcf98db54f5f56dad9fee07127', NULL, 0, 0, NULL, NULL),
(549, 31, '0fa67bcd8e74f3a0807094ed411ac25d48d08108f3783deeac7f0f2abf649b54', NULL, 0, 0, NULL, NULL),
(550, 38, 'cc53eeb474663c98fa1f257b044348f0b09f48c94a88327638f0678c14da4789', NULL, 0, 0, NULL, NULL),
(551, 38, 'de8bb1e1525cee2b71a133af2b50f7578fa8b16bd06ffdc4719308d8f0feb580', NULL, 0, 0, NULL, NULL),
(552, 38, 'd6616c12e971edcab581209f39140966865631f5cc31776cd07bdf3d8caf8ad1', NULL, 0, 0, NULL, NULL),
(553, 30, '7047af4c33671c976e5196473fcd2c896935c61ce87883ad1d8941ba8d74e0a3', NULL, 0, 0, NULL, NULL),
(554, 1, '01c2c8b2fa2878507b9a39738552e5662af22682a2511089357463d4b5856ef2', NULL, 0, 0, NULL, NULL),
(555, 31, '4b75d6090d9ec26fe6a897922c8af8ed259c4b9aaf42244aa0165dd321dae1f1', NULL, 0, 0, NULL, NULL),
(556, 31, '0c806954673e16478b8bfb555476d8f9ea3b5105ee41ebf4753300336dc42aa3', NULL, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_dropdown`
--

DROP TABLE IF EXISTS `s_dropdown`;
CREATE TABLE IF NOT EXISTS `s_dropdown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  `dd_field_name` varchar(255) DEFAULT NULL,
  `dd_field_id` varchar(255) DEFAULT NULL,
  `dd_field_subname` varchar(255) DEFAULT NULL,
  `dd_title` varchar(100) DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_dropdown`
--

INSERT INTO `s_dropdown` (`id`, `table_name`, `dd_field_name`, `dd_field_id`, `dd_field_subname`, `dd_title`, `json_value`) VALUES
(1, 's_usergroup', 'name', 'id', NULL, 'dd_usergroup', NULL),
(2, NULL, NULL, NULL, NULL, 'dd_ya_tidak', '{\"1\":\"ya\",\"0\":\"tidak\"}'),
(3, NULL, NULL, NULL, NULL, 'dd_year', '{\"2025\":\"2025\",\"2026\":\"2026\",\"2027\":\"2027\"}'),
(4, 'm_productcategory', 'productcategory_name', 'productcategory_id', NULL, 'dd_category', NULL),
(8, NULL, NULL, NULL, NULL, 'dd_gender', '{\"P\":\"Perempuan\",\"L\":\"Laki-laki\"}'),
(13, NULL, NULL, NULL, NULL, 'dd_month', '{\"1\":\"Januari\",\"2\":\"Februari\",\"3\":\"Maret\",\"4\":\"April\",\"5\":\"Mei\",\"6\":\"Juni\",\"7\":\"Juli\",\"8\":\"Agustus\",\"9\":\"September\",\"10\":\"Oktober\",\"11\":\"Nopember\",\"12\":\"Desember\"}'),
(14, NULL, NULL, NULL, NULL, 'dd_status_transaksi', '{\"tagihan\":\"tagihan\",\"lunas\":\"lunas\"}'),
(15, 'm_company', 'name', 'id', NULL, 'dd_company', NULL),
(16, NULL, NULL, NULL, NULL, 'dd_role_user_distributor', '{\"4\":\"agen\"}'),
(17, 'm_retail', 'name', 'id', NULL, 'dd_retail', NULL),
(18, NULL, NULL, NULL, NULL, 'dd_jurnal_type', '{\"in\":\"in\",\"out\":\"out\",\"adj\":\"adjustment\"}'),
(19, 't_product', 'name', 'id', NULL, 'dd_product', NULL),
(20, 'm_warehouse', 'name', 'id', NULL, 'dd_warehouse', NULL),
(21, 's_user', 'email', 'id', NULL, 'dd_user_agen', NULL),
(22, NULL, NULL, NULL, NULL, 'dd_status_stock', '{\"draft\":\"draft\",\"diterima\":\"diterima\"}'),
(23, 'm_lokasi', 'name', 'id', NULL, 'dd_lokasi', NULL),
(24, NULL, NULL, NULL, NULL, 'dd_y_t', '{\"y\":\"ya\",\"t\":\"tidak\"}');

-- --------------------------------------------------------

--
-- Table structure for table `s_form`
--

DROP TABLE IF EXISTS `s_form`;
CREATE TABLE IF NOT EXISTS `s_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(255) NOT NULL,
  `form_table` varchar(255) NOT NULL,
  `parent_form_id` int(11) DEFAULT NULL,
  `parent_form_foreign_key` varchar(100) DEFAULT NULL,
  `is_soft_delete` smallint(6) DEFAULT 0,
  `js_addon` varchar(255) DEFAULT NULL,
  `datatable_button_addon` varchar(2044) DEFAULT NULL,
  `fun_is_editable` varchar(2044) DEFAULT NULL,
  `col_sort_name` varchar(100) DEFAULT NULL,
  `col_sort_type` varchar(10) DEFAULT NULL,
  `table_type` varchar(10) DEFAULT 'datatable',
  `slug` varchar(255) DEFAULT NULL,
  `is_import` smallint(6) DEFAULT 0,
  `form_table_read` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_form`
--

INSERT INTO `s_form` (`id`, `form_name`, `form_table`, `parent_form_id`, `parent_form_foreign_key`, `is_soft_delete`, `js_addon`, `datatable_button_addon`, `fun_is_editable`, `col_sort_name`, `col_sort_type`, `table_type`, `slug`, `is_import`, `form_table_read`) VALUES
(1, 'menu', 's_menu', NULL, 'menu_parent', 0, NULL, NULL, NULL, 'menu_order', 'asc', 'tree', 'menu', 0, NULL),
(2, 'menu akses', 's_akses', 1, 'menu_id', 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'akses', 0, NULL),
(3, 'user', 's_user', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'user', 0, ''),
(28, 'Config', 'm_config', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'm_config', 0, ''),
(29, 'media', 't_media', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'media', 0, ''),
(30, 'Master Product', 't_product', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 't_product_admin', 0, 't_product'),
(31, 'Data Toko Retail', 'm_retail', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'datatable', 'm_retail', 0, 'm_retail'),
(32, 'Data Company', 'm_company', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'datatable', 'm_company', 0, 'm_company'),
(33, '[trx] Detil Transaksi Agen/Sales', 'jurnal_agen_sales', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'jurnal_agen_sales', 0, 'v_agen_sales_2_product'),
(35, 'Warehouse', 'm_warehouse', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'datatable', 'm_warehouse', 0, 'm_warehouse'),
(36, 'Stock di Warehouse', 'stock_warehouse', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'stock_warehouse', 0, 'stock_warehouse'),
(37, 'Transaksi Warehouse', 's_menu', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'jurnal_stock_warehouse', 0, 'jurnal_stock_warehouse'),
(39, 'Stock di Sales', 'stock_agen', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'stock_agen', 0, 'v_product_in_agen'),
(40, 'sys-user', 's_user', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'datatable', 'sys-s_user', 0, 's_user'),
(41, 'Absen Datang', 't_absen', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 't_absen', 0, 't_absen'),
(42, 'Absen Pulang', 't_absen_out', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 't_absen_out', 0, 't_absen_out'),
(43, 'Kunjungan Sales', 'jurnal_visitasi', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'jurnal_visitasi', 0, 'jurnal_visitasi'),
(44, 'Penjualan Sales', 'jurnal_agen', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'jurnal_agen', 0, 'jurnal_agen'),
(45, 'Alokasi Produk ke Sales', 'jurnal_inquiry_agen', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'jurnal_inquiry_agen', 0, 'jurnal_inquiry_agen'),
(46, 'Jurnal Inquiry Detail', 'jurnal_inquiry_detail', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'jurnal_inquiry_detail', 0, 'jurnal_inquiry_detail'),
(47, 'MProfil', 's_user', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 's_user', 0, 's_user'),
(48, 'Laporan Stok Agen', 'v_product_in_agen', NULL, NULL, 0, 'stock_trx.js', '<button class=\'btn btn-icon btn-sm btn-default jq-terima-stock\' lang=\'ID\'>Terima Stock</button>  ', NULL, NULL, NULL, 'datatable', 'v_product_in_agen', 0, 'v_product_in_agen'),
(49, 'Titik Lokasi', 'm_lokasi', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'm_lokasi', 0, 'm_lokasi');

-- --------------------------------------------------------

--
-- Table structure for table `s_form_filter`
--

DROP TABLE IF EXISTS `s_form_filter`;
CREATE TABLE IF NOT EXISTS `s_form_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `dropdown_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lnk_m_form_m_form_filter` (`form_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `s_form_param`
--

DROP TABLE IF EXISTS `s_form_param`;
CREATE TABLE IF NOT EXISTS `s_form_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(2044) DEFAULT NULL,
  `form_id` int(11) NOT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `table_ref` varchar(255) DEFAULT NULL,
  `info` varchar(2044) DEFAULT NULL,
  `active` smallint(6) DEFAULT 1,
  `column_datatable` smallint(6) DEFAULT 1,
  `column_rest` smallint(6) DEFAULT 1,
  `required` smallint(6) DEFAULT 0,
  `path_upload` varchar(100) DEFAULT NULL,
  `col_md` varchar(50) DEFAULT 'col-md-6',
  `readonly` smallint(6) DEFAULT 0,
  `default_value` varchar(50) DEFAULT NULL,
  `new_form_id` int(11) DEFAULT NULL,
  `is_unique` smallint(6) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lnk_m_form_m_form_param` (`form_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_form_param`
--

INSERT INTO `s_form_param` (`id`, `label_name`, `form_id`, `column_name`, `type`, `order_no`, `validation`, `table_ref`, `info`, `active`, `column_datatable`, `column_rest`, `required`, `path_upload`, `col_md`, `readonly`, `default_value`, `new_form_id`, `is_unique`) VALUES
(1, 'menu nama', 1, 'menu_nama', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, NULL, 'col-md-6', 0, NULL, NULL, NULL),
(2, 'menu url', 1, 'menu_url', 'text', NULL, NULL, '', NULL, 1, NULL, 1, NULL, NULL, 'col-md-6', 0, NULL, NULL, NULL),
(3, 'menu icon', 1, 'menu_icon', 'text', NULL, NULL, '', NULL, 1, NULL, 1, NULL, NULL, 'col-md-6', 0, NULL, NULL, NULL),
(4, 'menu active', 1, 'menu_active', 'select', NULL, NULL, '{\"y\":\"ya\",\"t\":\"tidak\"}', NULL, 1, NULL, 1, NULL, NULL, 'col-md-6', 0, NULL, NULL, NULL),
(5, 'menu kode', 1, 'menu_kode', 'text', NULL, NULL, '', NULL, 1, NULL, 1, NULL, NULL, 'col-md-6', 0, NULL, NULL, NULL),
(6, 'usergroup', 2, 'usergroup_id', 'select_ajax', NULL, NULL, 'dd_usergroup', NULL, 1, 1, 1, 0, NULL, 'col-md-6', 0, NULL, NULL, 0),
(7, 'akses', 2, 'akses_code', 'checkbox', NULL, NULL, '{\"xread\":\"read\",\"xcreate\":\"create\",\"xupdate\":\"update\",\"xdelete\":\"delete\"}', NULL, 1, 1, 1, 0, NULL, 'col-md-6', 0, NULL, NULL, 0),
(8, 'usergroup', 3, 'usergroup_id', 'select_ajax', 3, NULL, 'dd_usergroup', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(9, 'password', 3, 'password', 'password', 2, NULL, '', NULL, 1, NULL, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(10, 'active', 3, 'active', 'select', 5, NULL, 'dd_ya_tidak', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(19, 'username', 3, 'email', 'text', 1, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(45, 'karyawan', 3, 'employee_id', 'int', NULL, NULL, '', NULL, NULL, NULL, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(133, 'nama', 28, 'config_name', 'text', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(134, 'value', 28, 'config_value', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(137, 'media file', 29, 'media_file', 'file', NULL, NULL, '', NULL, 1, 1, 1, NULL, 'uploads/media/', 'col-md-6', 0, NULL, NULL, NULL),
(138, 'media title', 29, 'media_title', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(139, 'media url', 29, 'media_url', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(144, 'name', 31, 'name', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(145, 'address', 31, 'address', 'textarea', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(146, 'latitude', 31, 'location_lat', 'latlong', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(147, 'longitude', 31, 'location_long', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(148, 'picture', 31, 'picture', 'img', NULL, NULL, '', NULL, 1, NULL, 1, NULL, 'uploads/retail/', 'col-md-6', 0, NULL, NULL, NULL),
(149, 'name', 32, 'name', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(150, 'address', 32, 'address', 'textarea', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(151, 'phone', 32, 'phone', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(152, 'logo', 32, 'logo', 'img', NULL, NULL, '', NULL, 1, NULL, 1, NULL, 'uploads/company/', 'col-md-6', 0, NULL, NULL, NULL),
(167, 'name', 30, 'name', 'text', 1, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(168, 'picture', 30, 'picture', 'img', 2, NULL, '', NULL, 1, NULL, 1, NULL, 'uploads/product/', 'col-md-6', 0, NULL, NULL, NULL),
(169, 'Harga Jual 1', 30, 'price_sale', 'numeric', 4, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(170, 'Harga Dasar', 30, 'price_purchase', 'numeric', 3, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(171, 'name', 35, 'name', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(172, 'address', 35, 'address', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(173, 'phone', 35, 'phone', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(174, 'logo', 35, 'logo', 'img', NULL, NULL, '', NULL, 1, NULL, 1, NULL, 'uploads/warehouse/', 'col-md-6', 0, NULL, NULL, NULL),
(175, 'latitude', 35, 'latitude', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(176, 'longitude', 35, 'longitude', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(177, 'product id', 36, 'product_id', 'select_ajax', 3, NULL, 'dd_product', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(178, 'company id', 36, 'company_id', 'select_ajax', 1, NULL, 'dd_company', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(179, 'warehouse id', 36, 'warehouse_id', 'select_ajax', 2, NULL, 'dd_warehouse', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(180, 'count', 36, 'count', 'numeric', 4, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(181, 'date', 37, 'date', 'date', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(182, 'warehouse id', 37, 'warehouse_id', 'select_ajax', NULL, NULL, 'dd_warehouse', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(183, 'company id', 37, 'company_id', 'select_ajax', NULL, NULL, 'dd_company', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(184, 'product id', 37, 'product_id', 'select_ajax', NULL, NULL, 'dd_product', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(185, 'count', 37, 'count', 'numeric', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(186, 'price', 37, 'price', 'numeric', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(187, 'subtotal', 37, 'subtotal', 'numeric', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(188, 'status', 37, 'status', 'select', NULL, NULL, 'dd_jurnal_type', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(194, 'product id', 39, 'product_id', 'select_ajax', 3, NULL, 'dd_product', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(195, 'agen id', 39, 'agen_id', 'select_ajax', 2, NULL, 'dd_user_agen', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(196, 'count', 39, 'count', 'int', 4, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(197, 'company id', 39, 'company_id', 'select_ajax', 1, NULL, 'dd_company', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(198, 'usergroup id', 40, 'usergroup_id', 'select_ajax', NULL, NULL, 'dd_usergroup', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(199, 'ip address', 40, 'ip_address', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(200, 'username', 40, 'username', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(201, 'password', 40, 'password', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(202, 'email', 40, 'email', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(203, 'activation code', 40, 'activation_code', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(204, 'forgotten password code', 40, 'forgotten_password_code', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(205, 'forgotten password time', 40, 'forgotten_password_time', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(206, 'remember code', 40, 'remember_code', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(207, 'active', 40, 'active', 'text', NULL, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(208, 'full name', 40, 'full_name', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(209, 'company id', 40, 'company_id', 'select_ajax', NULL, NULL, 'dd_company', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(210, 'phone', 40, 'phone', 'numeric', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(211, 'last login', 40, 'last_login', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(212, 'foto', 40, 'foto', 'img', NULL, NULL, '', NULL, 1, 1, 1, NULL, 'uploads/user_profile/', 'col-md-6', 0, NULL, NULL, NULL),
(213, 'employee id', 40, 'employee_id', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(214, 'assign lat', 40, 'assign_lat', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(215, 'assign long', 40, 'assign_long', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(216, 'absen date', 41, 'absen_date', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(217, 'absen user id', 41, 'absen_user_id', 'select_ajax', NULL, NULL, 'dd_user_agen', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(218, 'absen date time', 41, 'absen_date_time', 'datetime', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(219, 'absen lattitude', 41, 'absen_lattitude', 'latitude', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(220, 'absen longitude', 41, 'absen_longitude', 'longitude', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(221, 'absen foto', 41, 'absen_foto', 'img', NULL, NULL, '', NULL, 1, 1, 1, NULL, 'uploads/absen_datang/', 'col-md-6', 0, NULL, NULL, NULL),
(222, 'absen status', 41, 'absen_status', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(223, 'absen date', 42, 'absen_date', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(224, 'absen user id', 42, 'absen_user_id', 'select_ajax', NULL, NULL, 'dd_user_agen', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(225, 'absen date time', 42, 'absen_date_time', 'datetime', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(226, 'absen lattitude', 42, 'absen_lattitude', 'latitude', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(227, 'absen longitude', 42, 'absen_longitude', 'longitude', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(228, 'absen foto', 42, 'absen_foto', 'img', NULL, NULL, '', NULL, 1, 1, 1, NULL, 'uploads/absen_pulang/', 'col-md-6', 0, NULL, NULL, NULL),
(229, 'absen status', 42, 'absen_status', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(230, 'agen id (diisi jika out ke agen)', 37, 'agen_id', 'select_ajax', NULL, NULL, 'dd_user_agen', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(231, 'Harga Agen', 30, 'price_agen', 'numeric', 5, NULL, '', NULL, 1, 1, 1, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(232, 'company id', 30, 'company_id', 'select_ajax', 6, NULL, 'dd_company', NULL, NULL, NULL, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(234, 'latitude', 32, 'latitude', 'latlong', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(235, 'agen id', 43, 'agen_id', 'select_ajax', 1, NULL, 'dd_user_agen', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(236, 'created at', 43, 'created_at', 'datetime', 5, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(237, 'latlong', 43, 'latlong', 'latlong', 4, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(238, 'photo', 43, 'photo', 'img', 3, NULL, '', NULL, 1, 1, 1, NULL, 'uploads/jurnal_agen/', 'col-md-6', 0, NULL, NULL, NULL),
(239, 'retail id', 43, 'retail_id', 'select_ajax', 2, NULL, 'dd_retail', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(241, 'is new', 43, 'is_new', 'text', NULL, NULL, '', NULL, 1, NULL, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(242, 'total price', 43, 'total_price', 'int', NULL, NULL, '', NULL, 1, NULL, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(244, 'Harga Jual 2', 30, 'price_sale2', 'numeric', 7, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(245, 'Min for Harga 2', 30, 'price_sale_min2', 'numeric', 8, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(246, 'Harga Jual 3', 30, 'price_sale3', 'numeric', 9, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(247, 'Min for Harga 3', 30, 'price_sale_min3', 'numeric', 10, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(248, 'phone', 31, 'phone', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(251, 'created by', 43, 'created_by', 'select_ajax', NULL, NULL, 'dd_user_agen', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(261, 'agen id', 33, 'agen_id', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(262, 'product id', 33, 'product_id', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(263, 'retail id', 33, 'retail_id', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(264, 'count', 33, 'count', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(265, 'price', 33, 'price', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(266, 'subtotal', 33, 'subtotal', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(267, 'status', 33, 'status', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(268, 'created by', 33, 'created_by', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(269, 'created at', 33, 'created_at', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(270, 'company id', 33, 'company_id', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(271, 'jurnal id', 33, 'jurnal_id', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(272, 'product name', 33, 'product_name', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(273, 'company id', 44, 'company_id', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(274, 'created at', 44, 'created_at', 'date', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(275, 'created by', 44, 'created_by', 'select_ajax', NULL, NULL, 'dd_user_agen', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(276, 'retail id', 44, 'retail_id', 'select_ajax', NULL, NULL, 'dd_retail', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(277, 'photo', 44, 'photo', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(278, 'agen id', 44, 'agen_id', 'select_ajax', NULL, NULL, 'dd_user_agen', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(279, 'latlong', 44, 'latlong', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(280, 'is new', 44, 'is_new', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(281, 'total price', 44, 'total_price', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(282, 'picture', 33, 'picture', 'img', NULL, NULL, '', NULL, 1, 1, 1, NULL, 'uploads/product/', 'col-md-6', 0, NULL, NULL, NULL),
(283, 'created by', 31, 'created_by', 'select_ajax', NULL, NULL, 'dd_user_agen', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(284, 'created at', 45, 'created_at', 'date', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(285, 'created by', 45, 'created_by', 'select_ajax', NULL, NULL, 'dd_role_user_distributor', NULL, NULL, NULL, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(286, 'description', 45, 'description', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(287, 'agen id', 45, 'agen_id', 'select_ajax', NULL, NULL, 'dd_user_agen', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(288, 'status', 45, 'status', 'select_ajax', NULL, NULL, 'dd_status_stock', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(289, 'total price', 45, 'total_price', 'text', NULL, NULL, '', NULL, NULL, NULL, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(290, 'product id', 46, 'product_id', 'select_ajax', 1, NULL, 'dd_product', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(291, 'count', 46, 'count', 'numeric', 2, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(292, 'price', 46, 'price', 'numeric', NULL, NULL, '', NULL, NULL, NULL, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(293, 'subtotal', 46, 'subtotal', 'numeric', NULL, NULL, '', NULL, NULL, NULL, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(294, 'status', 46, 'status', 'text', NULL, NULL, '', NULL, NULL, NULL, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(295, 'created at', 46, 'created_at', 'text', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(296, 'product name', 46, 'product_name', 'text', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(297, 'jurnal id', 46, 'jurnal_id', 'text', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(298, 'product name', 39, 'product_name', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(299, 'price sale', 39, 'price_sale', 'text', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(300, 'price sale2', 39, 'price_sale2', 'text', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(301, 'price sale3', 39, 'price_sale3', 'text', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(302, 'price sale min2', 39, 'price_sale_min2', 'text', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(303, 'price sale min3', 39, 'price_sale_min3', 'text', NULL, NULL, '', NULL, NULL, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(304, 'picture', 39, 'picture', 'img', NULL, NULL, '', NULL, NULL, 1, 1, NULL, 'uploads/product/', 'col-md-6', 0, NULL, NULL, NULL),
(305, 'username', 47, 'username', 'text', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(306, 'password', 47, 'password', 'password', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(307, 'email', 47, 'email', 'text', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(308, 'full name', 47, 'full_name', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(309, 'phone', 47, 'phone', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(310, 'foto', 47, 'foto', 'text', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(311, 'agen id', 48, 'agen_id', 'select_ajax', 1, NULL, 'dd_user_agen', NULL, 1, 1, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(312, 'count', 48, 'count', 'numeric', 3, NULL, '', NULL, 1, 1, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(313, 'product name', 48, 'product_name', 'text', 2, NULL, '', NULL, 1, 1, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(314, 'Nama Lokasi', 49, 'name', 'text', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(315, 'lat', 49, 'lat', 'numeric', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(316, 'long', 49, 'long', 'numeric', NULL, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(317, 'lokasi', 3, 'lokasi_id', 'select_ajax', 7, NULL, 'dd_lokasi', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(318, 'phone', 3, 'phone', 'text', 6, NULL, '', NULL, 1, 1, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(319, 'full name', 3, 'full_name', 'text', 4, NULL, '', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(320, 'status lock', 49, 'status_lock', 'select_ajax', NULL, NULL, 'dd_y_t', NULL, 1, 1, 1, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(321, 'radius', 49, 'radius', 'numeric', NULL, NULL, '', NULL, 1, 1, NULL, 1, '', 'col-md-6', 0, NULL, NULL, NULL),
(322, 'description', 37, 'description', 'text', NULL, NULL, '', NULL, NULL, 1, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(323, 'total', 37, 'total', 'text', NULL, NULL, '', NULL, NULL, 1, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(324, 'created by', 37, 'created_by', 'text', NULL, NULL, '', NULL, NULL, 1, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL),
(325, 'created at', 37, 'created_at', 'text', NULL, NULL, '', NULL, NULL, 1, NULL, NULL, '', 'col-md-6', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_form_parent`
--

DROP TABLE IF EXISTS `s_form_parent`;
CREATE TABLE IF NOT EXISTS `s_form_parent` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_parent_id` int(11) NOT NULL,
  `form_child_id` int(11) NOT NULL,
  `form_child_fk` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_form_parent`
--

INSERT INTO `s_form_parent` (`id`, `form_parent_id`, `form_child_id`, `form_child_fk`) VALUES
(19, 1, 2, 'menu_id'),
(20, 44, 33, 'jurnal_id'),
(21, 45, 46, 'jurnal_id');

-- --------------------------------------------------------

--
-- Table structure for table `s_menu`
--

DROP TABLE IF EXISTS `s_menu`;
CREATE TABLE IF NOT EXISTS `s_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_nama` varchar(255) DEFAULT NULL,
  `menu_ket` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `menu_parent` int(11) DEFAULT 0,
  `menu_active` char(1) DEFAULT NULL,
  `menu_kode` varchar(255) DEFAULT NULL,
  `menu_order` smallint(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_menu`
--

INSERT INTO `s_menu` (`menu_id`, `menu_nama`, `menu_ket`, `menu_url`, `menu_icon`, `menu_parent`, `menu_active`, `menu_kode`, `menu_order`, `updated_by`, `updated_at`, `created_by`, `created_at`) VALUES
(1, '[< sys >]', NULL, 'formx/formx/table/menu', 'fa fa-list', 0, 'y', 'form_1', 0, NULL, NULL, NULL, NULL),
(2, 'sys-menu', NULL, 'formx/formx/table/menu', '', 1, 'y', 'form_2', NULL, NULL, NULL, NULL, NULL),
(3, 'user', NULL, 'formx/formx/table/user', 'fa fa-user', 10, 'y', 'form_3', 11, NULL, NULL, NULL, NULL),
(10, 'Master', NULL, '', '', 0, 'y', '', 1, NULL, NULL, NULL, NULL),
(26, 'Laporan', NULL, '', '', 0, 'y', 'L1', 4, 1, '2025-12-18 22:49:07', NULL, NULL),
(32, 'Presensi Sales', NULL, 'laporan/laporan/tunggakan', 'fa fa-table', 26, 'y', '', 0, 1, '2025-11-04 09:13:57', NULL, NULL),
(37, 'Data Toko Retail', NULL, 'formx/formx/table/31', 'fa fa-home', 10, 'y', 'form_31', 0, NULL, NULL, NULL, NULL),
(38, 'Master Product', NULL, 'formx/formx/table/30', NULL, 10, 'y', 'form_30', 13, NULL, NULL, NULL, NULL),
(39, 'Data Company', NULL, 'formx/formx/table/32', '', 1, 'y', 'form_32', 0, NULL, NULL, NULL, NULL),
(40, 'Jurnal', NULL, '', 'fa fa-chart', 0, 'y', '', 2, NULL, NULL, NULL, NULL),
(41, 'sys-form generator', NULL, 'formx_gen/', '', 1, 'y', '', NULL, NULL, NULL, NULL, NULL),
(44, 'Warehouse', NULL, 'formx/formx/table/35', NULL, 10, 'y', 'form_35', 12, NULL, NULL, NULL, NULL),
(45, 'Stok Distributor', NULL, 'formx/formx/table/36', '', 46, 't', 'form_36', 0, 1, '2025-11-28 12:00:09', NULL, NULL),
(46, 'Stock', NULL, '', '', 0, 'y', '', 3, NULL, NULL, NULL, NULL),
(47, 'Jurnal Warehouse', NULL, 'formx/formx/table/37', '', 63, 'y', 'form_37', 0, 1, '2026-02-16 05:58:13', NULL, NULL),
(49, 'API - Stock Sales', NULL, 'formx/formx/table/39', '', 55, 'y', 'form_39', 0, 1, '2025-11-05 03:45:42', NULL, NULL),
(50, 'sys-user', NULL, 'formx/formx/table/40', NULL, 1, 'y', 'form_40', 0, NULL, NULL, NULL, NULL),
(51, 'Kunjungan', NULL, 'formx/formx/table/43', '', 40, 'y', 'form_43', 24, 1, '2025-08-21 20:31:39', NULL, NULL),
(52, 'Penjualan Agen', NULL, 'formx/formx/table/44', '', 40, 't', 'form_44', 23, 1, '2025-10-27 02:38:07', NULL, NULL),
(53, 'Daftar Alokasi Produk', NULL, 'formx/formx/table/45', '', 40, 'y', 'form_45', 22, 1, '2025-12-18 21:29:13', NULL, NULL),
(54, 'Jurnal Inquiry Detail', NULL, 'formx/formx/table/46', '', 0, 't', 'form_46', NULL, 1, '2025-09-06 13:21:19', NULL, NULL),
(55, '[< REST-FORM >]', NULL, '', '', 0, 'y', '', NULL, NULL, NULL, 1, '2025-09-18 17:19:16'),
(56, 'MProfil', NULL, 'formx/formx/table/47', NULL, 55, 'y', 'form_47', 0, NULL, NULL, NULL, NULL),
(57, 'Kunjungan Sales', NULL, 'laporan/laporan/kunjungan', '', 26, 'y', '', NULL, 1, '2025-12-18 22:50:03', 1, '2025-10-18 16:25:15'),
(58, 'Pengembalian Produk', NULL, 'formx/formx/table/48', '', 40, 'y', 'form_48', 23, 1, '2025-11-04 09:11:51', NULL, NULL),
(59, 'Penjualan Sales', NULL, 'laporan/laporan/penjualan', '', 26, 'y', '', NULL, 1, '2025-12-18 22:51:35', 1, '2025-10-27 10:51:08'),
(60, 'Stock di Sales', NULL, 'laporan/laporan/stock_sales', '', 26, 'y', '', NULL, NULL, NULL, 1, '2025-11-05 09:39:43'),
(61, 'Alokasi Produk Sales', NULL, 'transaksi/transaksi/alokasi_stocksales', '', 40, 'y', '', 21, 1, '2025-12-18 22:52:08', 1, '2025-11-05 11:15:17'),
(62, 'Titik Absen', NULL, 'formx/formx/table/49', 'fa-globe', 10, 'y', 'form_49', 0, 1, '2025-12-18 22:34:09', NULL, NULL),
(63, 'Inventory', NULL, '', 'fa fa-home', 0, 'y', '', NULL, NULL, NULL, 1, '2025-11-08 18:37:19'),
(64, 'Input Stock Warehouse', NULL, 'transaksi/transaksi/warehouse', '', 63, 'y', '', NULL, 1, '2025-12-18 22:50:58', 1, '2025-11-08 18:39:37'),
(65, 'Stock di Warehouse', NULL, 'formx/formx/table/36', NULL, 46, 'y', 'form_36', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_user`
--

DROP TABLE IF EXISTS `s_user`;
CREATE TABLE IF NOT EXISTS `s_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL DEFAULT 3,
  `ip_address` varchar(45) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(100) DEFAULT NULL,
  `forgotten_password_time` int(11) DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `active` smallint(6) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `lokasi_id` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `assign_lat` decimal(10,0) DEFAULT NULL,
  `assign_long` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lnk_m_usergroup_m_user` (`usergroup_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_user`
--

INSERT INTO `s_user` (`id`, `usergroup_id`, `ip_address`, `username`, `password`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `active`, `full_name`, `company_id`, `lokasi_id`, `phone`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `last_login`, `foto`, `employee_id`, `assign_lat`, `assign_long`) VALUES
(1, 1, NULL, 'admin', '$2y$10$2Ln2x4QpuA/N7mQLKpdmJuBLLbfNMCt1oW8YNWLPet6qvaS62Q6UW', 'owner', NULL, NULL, NULL, NULL, 1, 'Administrator', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 3, NULL, NULL, '$2y$10$LHiseKYmK88tT9IvD/yhbO.kVmBnBpaHfunON3e8xfnCK0TQQfKHS', 'distributor', NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 2, NULL, NULL, '$2y$10$zbdzA25JoytWAlHkeCHfr.Mo.JclvxCGIxcZAIbnIyRcG4SawzK9S', 'admin', NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 4, NULL, NULL, '$2y$10$Mb.JSNhPQCEWKXfoVaG1luFV7jubBcIC9IyyPtl031B95YskNrD62', 'sales1', NULL, NULL, NULL, NULL, 1, 'Sales 1', 1, 2, '085259300068', '2025-09-18 22:11:52', '2025-12-15 15:35:04', NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL),
(32, 4, NULL, NULL, '$2y$10$488Z9oF3N8yW/LBKksgDT.AG1kDK76z9jL3sdNIV2.w/XA06pLOt.', 'sales2', NULL, NULL, NULL, NULL, 1, 'Sales 2', 1, 2, '081999082633', NULL, '2025-11-24 22:18:09', NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL),
(35, 3, NULL, NULL, '$2y$10$3dG1SReo5weyR1/ILAgrJO4XAVY4Ksi3Yz1KCuAKvlEpD5OXW4nKK', 'distributor2', NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 4, NULL, NULL, '$2y$10$Qp4fwUQ0cXXjGGc9InK/COLRdum3ZS.nnKNiLE8gpAGQvjSHoYPlC', 'Eric', NULL, NULL, NULL, NULL, 1, 'Wahyudi Isnaini', 1, 2, '085123787539', '2026-01-21 18:21:40', '2026-01-02 10:34:36', NULL, 30, 30, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_usergroup`
--

DROP TABLE IF EXISTS `s_usergroup`;
CREATE TABLE IF NOT EXISTS `s_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_usergroup`
--

INSERT INTO `s_usergroup` (`id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `name`, `desc`) VALUES
(1, '2019-02-14 17:47:52', NULL, NULL, NULL, NULL, '1. owner', 'administrator'),
(2, '2021-01-19 20:00:20', NULL, NULL, NULL, NULL, '2. admin', NULL),
(3, '2021-01-19 20:00:20', NULL, NULL, NULL, NULL, '3. distributor', NULL),
(4, '2021-01-19 20:00:20', NULL, NULL, NULL, NULL, '4. agen', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_absen`
--

DROP TABLE IF EXISTS `t_absen`;
CREATE TABLE IF NOT EXISTS `t_absen` (
  `absen_id` int(11) NOT NULL AUTO_INCREMENT,
  `absen_date` date DEFAULT NULL,
  `absen_user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `absen_date_time` datetime DEFAULT NULL,
  `absen_lattitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `absen_longitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `absen_foto` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `absen_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`absen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_absen`
--

INSERT INTO `t_absen` (`absen_id`, `absen_date`, `absen_user_id`, `absen_date_time`, `absen_lattitude`, `absen_longitude`, `absen_foto`, `absen_status`, `created_at`, `created_by`, `updated_at`, `updated_by`, `company_id`) VALUES
(2, NULL, NULL, NULL, '-6.9896369', '112.563985', 'scaled_3e55f6bb-4dc5-42b2-9f2d-d47eb2fab0dd2926884546568538261.jpg', NULL, '2026-01-02 10:39:02', 38, NULL, NULL, 1),
(3, NULL, NULL, NULL, '-6.9900069', '112.5644516', 'scaled_fff2a671-3ee5-4063-9bff-4db7322d33941073326246221976195.jpg', NULL, '2026-01-05 07:40:38', 38, NULL, NULL, 1),
(4, NULL, NULL, NULL, '-6.9899978', '112.5644545', 'scaled_6e880563-68ca-4da2-9f7b-858d032839666095927993704850201.jpg', NULL, '2026-01-06 07:50:17', 38, NULL, NULL, 1),
(5, NULL, NULL, NULL, '-6.9896467', '112.5640075', 'scaled_a878201c-0b90-4570-ad50-71928aea4bf13829993626940893554.jpg', NULL, '2026-01-07 07:31:40', 38, NULL, NULL, 1),
(6, NULL, NULL, NULL, '-6.9896073', '112.5641061', 'scaled_0ab8a5c3-ef22-4739-9afa-ff0ce7c9c4367652745004105441802.jpg', NULL, '2026-01-08 07:58:07', 38, NULL, NULL, 1),
(7, NULL, NULL, NULL, '-6.9912717', '112.5628038', 'scaled_ed501c85-9aa2-4e22-9621-f8f91dae07114503282662696349914.jpg', NULL, '2026-01-09 07:43:01', 38, NULL, NULL, 1),
(8, NULL, NULL, NULL, '-6.9896527', '112.5640083', 'scaled_fcbf8f80-3158-4bc9-85a5-38c456390f991444318846384170561.jpg', NULL, '2026-01-10 07:47:29', 38, NULL, NULL, 1),
(9, NULL, NULL, NULL, '-6.9869996', '112.5645521', 'scaled_d783aa42-f007-45bf-86fa-f802e06700ea3311054993246077937.jpg', NULL, '2026-01-12 07:36:43', 38, NULL, NULL, 1),
(10, NULL, NULL, NULL, '-6.9896696', '112.5638985', 'scaled_9433ade0-54b5-4628-8753-48d4cff4aabc7514167857767858354.jpg', NULL, '2026-01-14 07:21:58', 38, NULL, NULL, 1),
(11, NULL, NULL, NULL, '-6.9898756', '112.5640503', 'scaled_deda19f9-bc46-4e6f-bc3a-bd641755af60300526359745114710.jpg', NULL, '2026-01-15 07:36:19', 38, NULL, NULL, 1),
(12, NULL, NULL, NULL, '-6.9896489', '112.5640031', 'scaled_52756c46-4bcd-48ab-9b0a-200e81334d572593150466602125850.jpg', NULL, '2026-01-16 08:00:05', 38, NULL, NULL, 1),
(13, NULL, NULL, NULL, '-6.9896545', '112.5639971', 'scaled_7dc2339f-18fa-444a-a3b5-899a6b1135127108279826986203091.jpg', NULL, '2026-01-19 07:37:16', 38, NULL, NULL, 1),
(14, NULL, NULL, NULL, '-6.9896593', '112.5639976', 'scaled_7a6da4f8-ed02-414c-944b-0ebd19a1044a5306360061982749575.jpg', NULL, '2026-01-20 07:46:46', 38, NULL, NULL, 1),
(15, NULL, NULL, NULL, '-6.9896553', '112.5639988', 'scaled_fadabc19-ab1f-4b6e-a562-706a198898f63235398228578711056.jpg', NULL, '2026-01-21 07:24:36', 38, NULL, NULL, 1),
(16, NULL, NULL, NULL, '-6.9911126', '112.5638072', 'scaled_bf074bd4-ba6d-4fcf-8f9d-2e8f464114955256082311696151251.jpg', NULL, '2026-01-22 07:42:21', 38, NULL, NULL, 1),
(17, NULL, NULL, NULL, '-6.9896591', '112.5640044', 'scaled_9330ca7c-4ac7-4278-bd71-47f5c17feab46629335894857613139.jpg', NULL, '2026-01-23 08:23:05', 38, NULL, NULL, 1),
(18, NULL, NULL, NULL, '-6.9896743', '112.5639943', 'scaled_036798a6-5b4e-404f-938d-ad7ba74fef156551994323404771636.jpg', NULL, '2026-01-24 08:47:50', 38, NULL, NULL, 1),
(19, NULL, NULL, NULL, '-6.9896549', '112.5639989', 'scaled_7c7d1089-63f9-4c63-ac40-78eb342cc5728632978786580801436.jpg', NULL, '2026-01-26 07:32:57', 38, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_absen_out`
--

DROP TABLE IF EXISTS `t_absen_out`;
CREATE TABLE IF NOT EXISTS `t_absen_out` (
  `absen_id` int(11) NOT NULL AUTO_INCREMENT,
  `absen_date` date DEFAULT NULL,
  `absen_user_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `absen_date_time` datetime DEFAULT NULL,
  `absen_lattitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `absen_longitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `absen_foto` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `absen_status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`absen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `t_absen_out`
--

INSERT INTO `t_absen_out` (`absen_id`, `absen_date`, `absen_user_id`, `absen_date_time`, `absen_lattitude`, `absen_longitude`, `absen_foto`, `absen_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `company_id`) VALUES
(1, NULL, NULL, NULL, '-6.9896343', '112.563981', 'scaled_dafe8729-0dd5-4e21-8fe5-dcf93d7cde511933220355117639880.jpg', NULL, '2026-01-02 10:39:29', NULL, 38, NULL, 1),
(2, NULL, NULL, NULL, '-6.9896438', '112.5639856', 'scaled_30434aae-05de-4dca-8106-8ce8980f25984982833837793293741.jpg', NULL, '2026-01-05 20:57:01', NULL, 38, NULL, 1),
(3, NULL, NULL, NULL, '-6.9896384', '112.563985', 'scaled_ed4807bd-8811-4833-ad4a-03779b38ec915635414157410365131.jpg', NULL, '2026-01-06 16:27:59', NULL, 38, NULL, 1),
(4, NULL, NULL, NULL, '-6.9883266', '112.5649777', 'scaled_1c02dc76-2062-4def-913e-6a9cdfa9555d8989176292900021243.jpg', NULL, '2026-01-07 17:31:36', NULL, 38, NULL, 1),
(5, NULL, NULL, NULL, '-6.989647', '112.5640072', 'scaled_be397e4c-4ccf-4456-b817-b9fcf29a03911401734998913514348.jpg', NULL, '2026-01-08 16:32:06', NULL, 38, NULL, 1),
(6, NULL, NULL, NULL, '-6.9896498', '112.5639982', 'scaled_b8c30e96-45fc-49b7-becd-be3e5c260c22999229430615592538.jpg', NULL, '2026-01-09 17:27:16', NULL, 38, NULL, 1),
(7, NULL, NULL, NULL, '-6.9897047', '112.5641249', 'scaled_d8d2ed26-2036-4987-a5f5-49eb44295b365939356843293435461.jpg', NULL, '2026-01-12 16:59:29', NULL, 38, NULL, 1),
(8, NULL, NULL, NULL, '-6.9894527', '112.5640178', 'scaled_02bbe529-3d00-49d6-a7d3-e1a9097872873320182831332234828.jpg', NULL, '2026-01-14 17:42:06', NULL, 38, NULL, 1),
(9, NULL, NULL, NULL, '-6.9896583', '112.5639983', 'scaled_39020db1-b3d5-4a1d-9307-fbef640b10af7857563996132413366.jpg', NULL, '2026-01-15 19:43:49', NULL, 38, NULL, 1),
(10, NULL, NULL, NULL, '-6.9896613', '112.5639981', 'scaled_ba0822d2-b61a-4a37-ad42-1d0afcfe9cb67042109432984124178.jpg', NULL, '2026-01-16 23:26:08', NULL, 38, NULL, 1),
(11, NULL, NULL, NULL, '-6.9885484', '112.5649246', 'scaled_edd2b0eb-9a72-48cf-b761-555421bcb7656786300396424723835.jpg', NULL, '2026-01-19 17:00:38', NULL, 38, NULL, 1),
(12, NULL, NULL, NULL, '-6.9914261', '112.5638072', 'scaled_9fd59e1c-c5d3-4980-a637-d42a5a68cdcf2388467339112786336.jpg', NULL, '2026-01-20 20:29:22', NULL, 38, NULL, 1),
(13, NULL, NULL, NULL, '-6.989636', '112.5640013', 'scaled_638a7074-ae73-441f-99ff-d7bb5fb14aba5746450177939227705.jpg', NULL, '2026-01-21 18:20:34', NULL, 38, NULL, 1),
(14, NULL, NULL, NULL, '-6.9896537', '112.5640072', 'scaled_ce816df4-d165-480a-bb61-89133369c728252138650210190424.jpg', NULL, '2026-01-22 15:42:03', NULL, 38, NULL, 1),
(15, NULL, NULL, NULL, '-6.9898585', '112.5638072', 'scaled_7170ae6b-3f65-4c8b-8a22-b95afd1b9a194260331699170227191.jpg', NULL, '2026-01-24 18:05:35', NULL, 38, NULL, 1),
(16, NULL, NULL, NULL, '-6.9896691', '112.5640029', 'scaled_7a2ada9a-c72c-4bb4-8b87-80d134c791474869869232140314147.jpg', NULL, '2026-01-26 19:07:48', NULL, 38, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_media`
--

DROP TABLE IF EXISTS `t_media`;
CREATE TABLE IF NOT EXISTS `t_media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_file` varchar(255) DEFAULT NULL,
  `media_title` varchar(255) DEFAULT NULL,
  `media_category` varchar(100) DEFAULT NULL,
  `media_url` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_product`
--

DROP TABLE IF EXISTS `t_product`;
CREATE TABLE IF NOT EXISTS `t_product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price_purchase` decimal(20,0) DEFAULT NULL,
  `price_sale` decimal(20,0) DEFAULT NULL,
  `price_sale2` decimal(10,0) DEFAULT NULL,
  `price_sale_min2` int(11) DEFAULT NULL,
  `price_sale3` decimal(11,0) DEFAULT NULL,
  `price_sale_min3` int(11) DEFAULT NULL,
  `price_agen` decimal(20,0) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_product`
--

INSERT INTO `t_product` (`id`, `name`, `picture`, `price_purchase`, `price_sale`, `price_sale2`, `price_sale_min2`, `price_sale3`, `price_sale_min3`, `price_agen`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`, `company_id`) VALUES
(1, 'DJAVA HIJAU-(12)', NULL, 6650, 7800, NULL, NULL, NULL, NULL, 7600, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(2, 'DJAVA HIJAU-(16)', NULL, 8300, 9500, NULL, NULL, NULL, NULL, 8500, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(3, 'LENTERA-(16)', NULL, 8300, 9500, NULL, NULL, NULL, NULL, 8500, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(4, 'DJAVA MERAH-(12)', NULL, 6650, 7800, NULL, NULL, NULL, NULL, 7600, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(5, 'DJAVA PREMIUM GOLD-(12)', NULL, 10500, 11500, NULL, NULL, NULL, NULL, 11100, 30, 30, '2025-05-23 14:21:45', '2026-01-02 10:33:33', NULL, 1),
(6, 'LONGSIZE-(12)', NULL, 10000, 11000, NULL, NULL, NULL, NULL, 10800, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(7, 'OCHA-(12)', NULL, 8100, 9100, NULL, NULL, NULL, NULL, 8900, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(8, 'HK REEBORN-(12)', NULL, 6600, 7750, NULL, NULL, NULL, NULL, 7550, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(9, 'OCHA MANGO-(12)', NULL, 8000, 9000, NULL, NULL, NULL, NULL, 8800, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(10, 'OCHA GUAVA-(12)', NULL, 8000, 9000, NULL, NULL, NULL, NULL, 8800, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(11, 'OCHA FILTER-(12)', NULL, 14500, 15500, NULL, NULL, NULL, NULL, 15300, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(12, 'OCHA FILTER-(20)', NULL, 24000, 26000, NULL, NULL, NULL, NULL, 24800, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(13, 'DJAVA FILTER-(12)', NULL, 14500, 15500, NULL, NULL, NULL, NULL, 15300, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(14, 'DJAVA FILTER-(20)', NULL, 24000, 25000, NULL, NULL, NULL, NULL, 24800, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(15, 'LAKSAMANA-(12)', NULL, 14500, 15500, NULL, NULL, NULL, NULL, 15300, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(16, 'LAKSAMANA-(20)', NULL, 24000, 18500, NULL, NULL, NULL, NULL, 24800, 30, 30, '2025-05-23 14:21:45', '2026-01-02 10:32:09', NULL, 1),
(17, 'DJAVA MILD BLUE-(16)', NULL, 22000, 17000, NULL, NULL, NULL, NULL, 22800, 30, 30, '2025-05-23 14:21:45', '2026-01-02 10:32:50', NULL, 1),
(18, 'DJAVA FLAVOUR BLUEBERRY-(16)', NULL, 23000, 24000, NULL, NULL, NULL, NULL, 23800, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(19, 'DJAVA FLAVOUR PINEAPPLE-(16)', 'think_lightbulb.jpg', 23000, 24000, NULL, NULL, NULL, NULL, 23800, 30, 1, '2025-05-23 14:21:45', '2025-08-30 08:57:44', NULL, 1),
(20, 'KING DJAVA CLASSIC-(20)', NULL, 24500, 25500, NULL, NULL, NULL, NULL, 25300, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(21, 'KING DJAVA MENTHOL-(20)', '156.jpg', 25500, 26500, 22000, 5, 20000, 10, 26300, 30, 30, '2025-05-23 14:21:45', '2025-12-18 20:54:44', NULL, 1),
(22, 'OCHA APPLE ICE SKT (12)', NULL, 8100, 9500, NULL, NULL, NULL, NULL, 8900, 30, NULL, '2026-01-12 08:11:28', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_agen_sales_2_product`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_agen_sales_2_product`;
CREATE TABLE IF NOT EXISTS `v_agen_sales_2_product` (
`id` int(10) unsigned
,`agen_id` int(11)
,`product_id` int(11)
,`retail_id` int(11)
,`count` int(11)
,`price` decimal(10,0)
,`subtotal` decimal(10,0)
,`status` varchar(3)
,`created_by` int(11)
,`created_at` timestamp
,`updated_by` int(11)
,`updated_at` datetime
,`deleted_at` datetime
,`company_id` int(11)
,`jurnal_id` int(10) unsigned
,`product_name` varchar(255)
,`picture` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_product_in_agen`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_product_in_agen`;
CREATE TABLE IF NOT EXISTS `v_product_in_agen` (
`id` int(10) unsigned
,`product_id` int(11)
,`agen_id` int(11)
,`count` int(11)
,`created_at` datetime
,`created_by` int(11)
,`updated_at` datetime
,`updated_by` int(11)
,`company_id` int(11)
,`product_name` varchar(100)
,`price_sale` decimal(20,0)
,`price_sale2` decimal(10,0)
,`price_sale3` decimal(11,0)
,`price_sale_min2` int(11)
,`price_sale_min3` int(11)
,`picture` varchar(255)
,`price_agen` decimal(20,0)
,`price_purchase` decimal(20,0)
);

-- --------------------------------------------------------

--
-- Structure for view `v_agen_sales_2_product`
--
DROP TABLE IF EXISTS `v_agen_sales_2_product`;

DROP VIEW IF EXISTS `v_agen_sales_2_product`;
CREATE ALGORITHM=UNDEFINED DEFINER=`djadol`@`localhost` SQL SECURITY DEFINER VIEW `v_agen_sales_2_product`  AS SELECT `jurnal_agen_sales`.`id` AS `id`, `jurnal_agen_sales`.`agen_id` AS `agen_id`, `jurnal_agen_sales`.`product_id` AS `product_id`, `jurnal_agen_sales`.`retail_id` AS `retail_id`, `jurnal_agen_sales`.`count` AS `count`, `jurnal_agen_sales`.`price` AS `price`, `jurnal_agen_sales`.`subtotal` AS `subtotal`, `jurnal_agen_sales`.`status` AS `status`, `jurnal_agen_sales`.`created_by` AS `created_by`, `jurnal_agen_sales`.`created_at` AS `created_at`, `jurnal_agen_sales`.`updated_by` AS `updated_by`, `jurnal_agen_sales`.`updated_at` AS `updated_at`, `jurnal_agen_sales`.`deleted_at` AS `deleted_at`, `jurnal_agen_sales`.`company_id` AS `company_id`, `jurnal_agen_sales`.`jurnal_id` AS `jurnal_id`, `jurnal_agen_sales`.`product_name` AS `product_name`, `t_product`.`picture` AS `picture` FROM (`jurnal_agen_sales` left join `t_product` on(`jurnal_agen_sales`.`product_id` = `t_product`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_product_in_agen`
--
DROP TABLE IF EXISTS `v_product_in_agen`;

DROP VIEW IF EXISTS `v_product_in_agen`;
CREATE ALGORITHM=UNDEFINED DEFINER=`djadol`@`localhost` SQL SECURITY DEFINER VIEW `v_product_in_agen`  AS SELECT `stock_agen`.`id` AS `id`, `stock_agen`.`product_id` AS `product_id`, `stock_agen`.`agen_id` AS `agen_id`, `stock_agen`.`count` AS `count`, `stock_agen`.`created_at` AS `created_at`, `stock_agen`.`created_by` AS `created_by`, `stock_agen`.`updated_at` AS `updated_at`, `stock_agen`.`updated_by` AS `updated_by`, `stock_agen`.`company_id` AS `company_id`, `t_product`.`name` AS `product_name`, `t_product`.`price_sale` AS `price_sale`, `t_product`.`price_sale2` AS `price_sale2`, `t_product`.`price_sale3` AS `price_sale3`, `t_product`.`price_sale_min2` AS `price_sale_min2`, `t_product`.`price_sale_min3` AS `price_sale_min3`, `t_product`.`picture` AS `picture`, `t_product`.`price_agen` AS `price_agen`, `t_product`.`price_purchase` AS `price_purchase` FROM (`stock_agen` left join `t_product` on(`t_product`.`id` = `stock_agen`.`product_id`)) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `s_akses`
--
ALTER TABLE `s_akses`
  ADD CONSTRAINT `s_akses_ibfk_1` FOREIGN KEY (`usergroup_id`) REFERENCES `s_usergroup` (`id`),
  ADD CONSTRAINT `s_akses_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `s_menu` (`menu_id`) ON DELETE CASCADE;

--
-- Constraints for table `s_form_filter`
--
ALTER TABLE `s_form_filter`
  ADD CONSTRAINT `s_form_filter_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `s_form` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `s_form_param`
--
ALTER TABLE `s_form_param`
  ADD CONSTRAINT `s_form_param_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `s_form` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `s_user`
--
ALTER TABLE `s_user`
  ADD CONSTRAINT `s_user_ibfk_1` FOREIGN KEY (`usergroup_id`) REFERENCES `s_usergroup` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
