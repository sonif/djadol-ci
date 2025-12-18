-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2025 at 11:58 PM
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
CREATE TABLE `jurnal_agen` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_agen`
--

INSERT INTO `jurnal_agen` (`id`, `company_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `retail_id`, `photo`, `agen_id`, `latlong`, `is_new`, `total_price`) VALUES
(6, 1, '2025-12-18 22:31:51', 31, NULL, NULL, 7, NULL, NULL, 'null,null', 0, 72000),
(7, 1, '2025-12-18 22:32:15', 31, NULL, NULL, 7, NULL, NULL, 'null,null', 0, 39500),
(8, 1, '2025-12-18 22:40:14', 31, NULL, NULL, 6, NULL, NULL, 'null,null', 0, 87500);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_agen_sales`
--

DROP TABLE IF EXISTS `jurnal_agen_sales`;
CREATE TABLE `jurnal_agen_sales` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `product_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_agen_sales`
--

INSERT INTO `jurnal_agen_sales` (`id`, `agen_id`, `product_id`, `retail_id`, `count`, `price`, `subtotal`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`, `company_id`, `jurnal_id`, `product_name`) VALUES
(6, NULL, 18, NULL, 3, 24000, -72000, 'out', NULL, '2025-12-18 14:31:51', NULL, NULL, NULL, 1, 6, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(7, NULL, 13, NULL, 1, 15500, -15500, 'out', NULL, '2025-12-18 14:32:15', NULL, NULL, NULL, 1, 7, 'DJAVA FILTER-(12)'),
(8, NULL, 18, NULL, 1, 24000, -24000, 'out', NULL, '2025-12-18 14:32:15', NULL, NULL, NULL, 1, 7, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(9, NULL, 13, NULL, 1, 15500, -15500, 'out', NULL, '2025-12-18 14:40:14', NULL, NULL, NULL, 1, 8, 'DJAVA FILTER-(12)'),
(10, NULL, 18, NULL, 3, 24000, -72000, 'out', NULL, '2025-12-18 14:40:14', NULL, NULL, NULL, 1, 8, 'DJAVA FLAVOUR BLUEBERRY-(16)');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_inquiry_agen`
--

DROP TABLE IF EXISTS `jurnal_inquiry_agen`;
CREATE TABLE `jurnal_inquiry_agen` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'draft',
  `total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_inquiry_agen`
--

INSERT INTO `jurnal_inquiry_agen` (`id`, `company_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `description`, `agen_id`, `status`, `total_price`) VALUES
(1, 1, '2025-12-18 14:10:57', 30, NULL, NULL, NULL, 31, 'draft', NULL),
(2, 1, '2025-12-19 05:20:31', 30, NULL, NULL, '', 31, 'diterima', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_inquiry_detail`
--

DROP TABLE IF EXISTS `jurnal_inquiry_detail`;
CREATE TABLE `jurnal_inquiry_detail` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `product_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_inquiry_detail`
--

INSERT INTO `jurnal_inquiry_detail` (`id`, `agen_id`, `product_id`, `count`, `price`, `subtotal`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`, `company_id`, `jurnal_id`, `product_name`) VALUES
(1, NULL, 18, 20, NULL, NULL, NULL, 30, '2025-12-18 14:10:57', NULL, NULL, NULL, 1, 1, 'DJAVA FLAVOUR BLUEBERRY-(16)'),
(2, NULL, 13, 10, NULL, NULL, NULL, 30, '2025-12-18 14:14:50', NULL, NULL, NULL, 1, 2, 'DJAVA FILTER-(12)'),
(3, NULL, 18, 20, NULL, NULL, NULL, 30, '2025-12-18 14:14:50', NULL, NULL, NULL, 1, 2, 'DJAVA FLAVOUR BLUEBERRY-(16)');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_return_agen`
--

DROP TABLE IF EXISTS `jurnal_return_agen`;
CREATE TABLE `jurnal_return_agen` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_stock_warehouse`
--

DROP TABLE IF EXISTS `jurnal_stock_warehouse`;
CREATE TABLE `jurnal_stock_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `total` decimal(10,0) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_stock_warehouse`
--

INSERT INTO `jurnal_stock_warehouse` (`id`, `description`, `warehouse_id`, `company_id`, `total`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`) VALUES
(1, NULL, 2, 1, 5200000, 'diterima', 30, '2025-12-18 13:20:49', 30, '2025-12-18 13:52:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_stock_warehouse_detail`
--

DROP TABLE IF EXISTS `jurnal_stock_warehouse_detail`;
CREATE TABLE `jurnal_stock_warehouse_detail` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `jurnal_stock_warehouse_detail`
--

INSERT INTO `jurnal_stock_warehouse_detail` (`id`, `jurnal_id`, `company_id`, `product_id`, `product_name`, `count`, `price`, `subtotal`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 13, 'DJAVA FILTER-(12)', 200, 14500, 2900000, 30, '2025-12-18 13:20:49', NULL, NULL, NULL),
(2, 1, 1, 18, 'DJAVA FLAVOUR BLUEBERRY-(16)', 100, 23000, 2300000, 30, '2025-12-18 13:20:49', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_visitasi`
--

DROP TABLE IF EXISTS `jurnal_visitasi`;
CREATE TABLE `jurnal_visitasi` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

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
(9, 1, '2025-12-18 22:14:13', 31, NULL, NULL, 5, 'scaled_b5472c43-94b6-4afb-9212-13697f0dca2d5280996218668865171.jpg', NULL, '-7.1345768,112.7171662', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_company`
--

DROP TABLE IF EXISTS `m_company`;
CREATE TABLE `m_company` (
  `id` int(11) NOT NULL,
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
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `m_company`
--

INSERT INTO `m_company` (`id`, `name`, `address`, `phone`, `logo`, `latitude`, `longitude`, `created_at`, `created_by`, `updated_by`, `updated_at`, `deleted_at`) VALUES
(1, 'CV. Gresik', 'Gresik', '081999082633', 'Screenshot_2025-04-11_at_09.15.51.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'CV. Surabaya', 'Surabaya', '085259300068', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_config`
--

DROP TABLE IF EXISTS `m_config`;
CREATE TABLE `m_config` (
  `config_id` int(11) NOT NULL,
  `config_name` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL
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
CREATE TABLE `m_flow` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `usergroup_view_all` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `usergroup_menu` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `m_lokasi`
--

DROP TABLE IF EXISTS `m_lokasi`;
CREATE TABLE `m_lokasi` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `m_lokasi`
--

INSERT INTO `m_lokasi` (`id`, `name`, `lat`, `long`, `status_lock`, `radius`, `created_at`, `created_by`, `updated_at`, `updated_by`, `deleted_at`, `company_id`) VALUES
(2, 'Masjid Kanjeng Sepuh Sedayu Gresik', '-6.989864', '112.5614821', 'y', 0.100, '2025-11-25 05:16:45', 30, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_productcategory`
--

DROP TABLE IF EXISTS `m_productcategory`;
CREATE TABLE `m_productcategory` (
  `productcategory_id` int(11) NOT NULL,
  `productcategory_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `productcategory_price` decimal(10,2) DEFAULT NULL,
  `productcategory_created_date` datetime DEFAULT current_timestamp(),
  `productcategory_created_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `productcategory_parent_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

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
CREATE TABLE `m_retail` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `m_retail`
--

INSERT INTO `m_retail` (`id`, `name`, `address`, `phone`, `location_lat`, `location_long`, `picture`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `company_id`) VALUES
(5, 'andromeda', 'bangkalan', '087373662223', '-7.1345775', '112.7171608', 'scaled_5bb51597-d81b-4530-b7fb-2489e0508b367084145567603224975.jpg', '2025-12-19 05:25:25', NULL, NULL, 31, NULL, 1),
(6, 'toko upinipin', 'hallo', '9984736363737', '-7.1345776', '112.7171607', NULL, '2025-12-19 05:27:02', NULL, NULL, 31, NULL, 1),
(7, 'toko rame2', 'sumenep', '09876543321', '-7.0072955', '113.8548122', 'scaled_1763951299996.jpg', '2025-12-19 05:31:31', NULL, NULL, 31, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m_warehouse`
--

DROP TABLE IF EXISTS `m_warehouse`;
CREATE TABLE `m_warehouse` (
  `id` int(11) NOT NULL,
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
  `company_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

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
CREATE TABLE `stock_agen` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `stock_agen`
--

INSERT INTO `stock_agen` (`id`, `product_id`, `agen_id`, `count`, `created_at`, `created_by`, `updated_at`, `updated_by`, `company_id`) VALUES
(17, 13, 31, 8, NULL, NULL, NULL, NULL, 1),
(18, 18, 31, 13, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_warehouse`
--

DROP TABLE IF EXISTS `stock_warehouse`;
CREATE TABLE `stock_warehouse` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `stock_warehouse`
--

INSERT INTO `stock_warehouse` (`id`, `product_id`, `company_id`, `warehouse_id`, `count`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(6, 13, 1, 2, 190, '2025-12-18 13:52:24', 30, '2025-12-18 14:14:50', 30),
(7, 18, 1, 2, 60, '2025-12-18 13:52:24', 30, '2025-12-18 14:14:50', 30);

-- --------------------------------------------------------

--
-- Table structure for table `s_akses`
--

DROP TABLE IF EXISTS `s_akses`;
CREATE TABLE `s_akses` (
  `akses_id` int(11) NOT NULL,
  `usergroup_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `akses_active` varchar(1) DEFAULT 'y',
  `akses_code` varchar(100) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
(85, 2, 47, 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, NULL, NULL, NULL, NULL),
(86, 3, 47, 'y', '[\"xread\",\"xcreate\",\"xupdate\"]', NULL, NULL, NULL, NULL, NULL),
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
CREATE TABLE `s_api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `ignore_limits` tinyint(1) DEFAULT 0,
  `is_private_key` tinyint(1) DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
(209, 31, '1882f2982390c02096799e7077f70dc3209e9b931ec5e1afaf59ddd4adf7f623', NULL, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_dropdown`
--

DROP TABLE IF EXISTS `s_dropdown`;
CREATE TABLE `s_dropdown` (
  `id` int(11) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `dd_field_name` varchar(255) DEFAULT NULL,
  `dd_field_id` varchar(255) DEFAULT NULL,
  `dd_field_subname` varchar(255) DEFAULT NULL,
  `dd_title` varchar(100) DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
CREATE TABLE `s_form` (
  `id` int(11) NOT NULL,
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
  `form_table_read` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
(37, 'Transaksi Warehouse', 'jurnal_stock', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'datatable', 'jurnal_stock', 0, 'jurnal_stock'),
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
CREATE TABLE `s_form_filter` (
  `id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `dropdown_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `placeholder` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `s_form_param`
--

DROP TABLE IF EXISTS `s_form_param`;
CREATE TABLE `s_form_param` (
  `id` int(11) NOT NULL,
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
  `is_unique` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
(321, 'radius', 49, 'radius', 'numeric', NULL, NULL, '', NULL, 1, 1, NULL, 1, '', 'col-md-6', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_form_parent`
--

DROP TABLE IF EXISTS `s_form_parent`;
CREATE TABLE `s_form_parent` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_parent_id` int(11) NOT NULL,
  `form_child_id` int(11) NOT NULL,
  `form_child_fk` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

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
CREATE TABLE `s_menu` (
  `menu_id` int(11) NOT NULL,
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
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
(47, 'Input Stok Distributor', NULL, 'formx/formx/table/37', '', 40, 't', 'form_37', 0, 1, '2025-12-15 15:29:45', NULL, NULL),
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
CREATE TABLE `s_user` (
  `id` int(11) NOT NULL,
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
  `assign_long` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `s_user`
--

INSERT INTO `s_user` (`id`, `usergroup_id`, `ip_address`, `username`, `password`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `active`, `full_name`, `company_id`, `lokasi_id`, `phone`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `last_login`, `foto`, `employee_id`, `assign_lat`, `assign_long`) VALUES
(1, 1, NULL, 'admin', '$2y$10$2Ln2x4QpuA/N7mQLKpdmJuBLLbfNMCt1oW8YNWLPet6qvaS62Q6UW', 'owner', NULL, NULL, NULL, NULL, 1, 'Administrator', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 3, NULL, NULL, '$2y$10$LHiseKYmK88tT9IvD/yhbO.kVmBnBpaHfunON3e8xfnCK0TQQfKHS', 'distributor', NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 2, NULL, NULL, '$2y$10$zbdzA25JoytWAlHkeCHfr.Mo.JclvxCGIxcZAIbnIyRcG4SawzK9S', 'admin', NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 4, NULL, NULL, '$2y$10$Mb.JSNhPQCEWKXfoVaG1luFV7jubBcIC9IyyPtl031B95YskNrD62', 'sales1', NULL, NULL, NULL, NULL, 1, 'Sales 1', 1, 2, '085259300068', '2025-09-18 22:11:52', '2025-12-15 15:35:04', NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL),
(32, 4, NULL, NULL, '$2y$10$488Z9oF3N8yW/LBKksgDT.AG1kDK76z9jL3sdNIV2.w/XA06pLOt.', 'sales2', NULL, NULL, NULL, NULL, 1, 'Sales 2', 1, 2, '081999082633', NULL, '2025-11-24 22:18:09', NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL),
(35, 3, NULL, NULL, '$2y$10$3dG1SReo5weyR1/ILAgrJO4XAVY4Ksi3Yz1KCuAKvlEpD5OXW4nKK', 'distributor2', NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `s_usergroup`
--

DROP TABLE IF EXISTS `s_usergroup`;
CREATE TABLE `s_usergroup` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `desc` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
CREATE TABLE `t_absen` (
  `absen_id` int(11) NOT NULL,
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
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_absen_out`
--

DROP TABLE IF EXISTS `t_absen_out`;
CREATE TABLE `t_absen_out` (
  `absen_id` int(11) NOT NULL,
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
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_media`
--

DROP TABLE IF EXISTS `t_media`;
CREATE TABLE `t_media` (
  `media_id` int(11) NOT NULL,
  `media_file` varchar(255) DEFAULT NULL,
  `media_title` varchar(255) DEFAULT NULL,
  `media_category` varchar(100) DEFAULT NULL,
  `media_url` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_product`
--

DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product` (
  `id` int(10) UNSIGNED NOT NULL,
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
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `t_product`
--

INSERT INTO `t_product` (`id`, `name`, `picture`, `price_purchase`, `price_sale`, `price_sale2`, `price_sale_min2`, `price_sale3`, `price_sale_min3`, `price_agen`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`, `company_id`) VALUES
(1, 'DJAVA HIJAU-(12)', NULL, 6650, 7800, NULL, NULL, NULL, NULL, 7600, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(2, 'DJAVA HIJAU-(16)', NULL, 8300, 9500, NULL, NULL, NULL, NULL, 8500, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(3, 'LENTERA-(16)', NULL, 8300, 9500, NULL, NULL, NULL, NULL, 8500, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(4, 'DJAVA MERAH-(12)', NULL, 6650, 7800, NULL, NULL, NULL, NULL, 7600, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(5, 'DJAVA PREMIUM GOLD-(12)', NULL, 10500, 11300, NULL, NULL, NULL, NULL, 11100, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
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
(16, 'LAKSAMANA-(20)', NULL, 24000, 25000, NULL, NULL, NULL, NULL, 24800, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(17, 'DJAVA MILD BLUE-(16)', NULL, 22000, 23000, NULL, NULL, NULL, NULL, 22800, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(18, 'DJAVA FLAVOUR BLUEBERRY-(16)', NULL, 23000, 24000, NULL, NULL, NULL, NULL, 23800, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(19, 'DJAVA FLAVOUR PINEAPPLE-(16)', 'think_lightbulb.jpg', 23000, 24000, NULL, NULL, NULL, NULL, 23800, 30, 1, '2025-05-23 14:21:45', '2025-08-30 08:57:44', NULL, 1),
(20, 'KING DJAVA CLASSIC-(20)', NULL, 24500, 25500, NULL, NULL, NULL, NULL, 25300, 30, NULL, '2025-05-23 14:21:45', NULL, NULL, 1),
(21, 'KING DJAVA MENTHOL-(20)', '156.jpg', 25500, 26500, 22000, 5, 20000, 10, 26300, 30, 30, '2025-05-23 14:21:45', '2025-12-18 20:54:44', NULL, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_agen_sales_2_product`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `v_agen_sales_2_product`;
CREATE TABLE `v_agen_sales_2_product` (
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
CREATE TABLE `v_product_in_agen` (
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jurnal_agen`
--
ALTER TABLE `jurnal_agen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal_agen_sales`
--
ALTER TABLE `jurnal_agen_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jurnal_agen_sales_relation_1` (`jurnal_id`);

--
-- Indexes for table `jurnal_inquiry_agen`
--
ALTER TABLE `jurnal_inquiry_agen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal_inquiry_detail`
--
ALTER TABLE `jurnal_inquiry_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentindex_2_inquiry` (`jurnal_id`);

--
-- Indexes for table `jurnal_return_agen`
--
ALTER TABLE `jurnal_return_agen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal_stock_warehouse`
--
ALTER TABLE `jurnal_stock_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal_stock_warehouse_detail`
--
ALTER TABLE `jurnal_stock_warehouse_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurnal_visitasi`
--
ALTER TABLE `jurnal_visitasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_company`
--
ALTER TABLE `m_company`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `m_config`
--
ALTER TABLE `m_config`
  ADD PRIMARY KEY (`config_id`) USING BTREE;

--
-- Indexes for table `m_flow`
--
ALTER TABLE `m_flow`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `m_lokasi`
--
ALTER TABLE `m_lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_productcategory`
--
ALTER TABLE `m_productcategory`
  ADD PRIMARY KEY (`productcategory_id`) USING BTREE;

--
-- Indexes for table `m_retail`
--
ALTER TABLE `m_retail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_warehouse`
--
ALTER TABLE `m_warehouse`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stock_agen`
--
ALTER TABLE `stock_agen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_warehouse`
--
ALTER TABLE `stock_warehouse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `s_akses`
--
ALTER TABLE `s_akses`
  ADD PRIMARY KEY (`akses_id`) USING BTREE,
  ADD KEY `lnk_m_menu_t_akses` (`menu_id`) USING BTREE,
  ADD KEY `lnk_m_usergroup_t_akses` (`usergroup_id`) USING BTREE;

--
-- Indexes for table `s_api_keys`
--
ALTER TABLE `s_api_keys`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `s_dropdown`
--
ALTER TABLE `s_dropdown`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `s_form`
--
ALTER TABLE `s_form`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `s_form_filter`
--
ALTER TABLE `s_form_filter`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `lnk_m_form_m_form_filter` (`form_id`) USING BTREE;

--
-- Indexes for table `s_form_param`
--
ALTER TABLE `s_form_param`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `lnk_m_form_m_form_param` (`form_id`) USING BTREE;

--
-- Indexes for table `s_form_parent`
--
ALTER TABLE `s_form_parent`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`) USING BTREE;

--
-- Indexes for table `s_menu`
--
ALTER TABLE `s_menu`
  ADD PRIMARY KEY (`menu_id`) USING BTREE;

--
-- Indexes for table `s_user`
--
ALTER TABLE `s_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `lnk_m_usergroup_m_user` (`usergroup_id`) USING BTREE;

--
-- Indexes for table `s_usergroup`
--
ALTER TABLE `s_usergroup`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `t_absen`
--
ALTER TABLE `t_absen`
  ADD PRIMARY KEY (`absen_id`);

--
-- Indexes for table `t_absen_out`
--
ALTER TABLE `t_absen_out`
  ADD PRIMARY KEY (`absen_id`);

--
-- Indexes for table `t_media`
--
ALTER TABLE `t_media`
  ADD PRIMARY KEY (`media_id`);

--
-- Indexes for table `t_product`
--
ALTER TABLE `t_product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jurnal_agen`
--
ALTER TABLE `jurnal_agen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jurnal_agen_sales`
--
ALTER TABLE `jurnal_agen_sales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jurnal_inquiry_agen`
--
ALTER TABLE `jurnal_inquiry_agen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jurnal_inquiry_detail`
--
ALTER TABLE `jurnal_inquiry_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jurnal_return_agen`
--
ALTER TABLE `jurnal_return_agen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurnal_stock_warehouse`
--
ALTER TABLE `jurnal_stock_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jurnal_stock_warehouse_detail`
--
ALTER TABLE `jurnal_stock_warehouse_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jurnal_visitasi`
--
ALTER TABLE `jurnal_visitasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `m_company`
--
ALTER TABLE `m_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_flow`
--
ALTER TABLE `m_flow`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `m_lokasi`
--
ALTER TABLE `m_lokasi`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `m_productcategory`
--
ALTER TABLE `m_productcategory`
  MODIFY `productcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_retail`
--
ALTER TABLE `m_retail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `m_warehouse`
--
ALTER TABLE `m_warehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stock_agen`
--
ALTER TABLE `stock_agen`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `stock_warehouse`
--
ALTER TABLE `stock_warehouse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `s_akses`
--
ALTER TABLE `s_akses`
  MODIFY `akses_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `s_api_keys`
--
ALTER TABLE `s_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `s_dropdown`
--
ALTER TABLE `s_dropdown`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `s_form`
--
ALTER TABLE `s_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `s_form_filter`
--
ALTER TABLE `s_form_filter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `s_form_param`
--
ALTER TABLE `s_form_param`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT for table `s_form_parent`
--
ALTER TABLE `s_form_parent`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `s_menu`
--
ALTER TABLE `s_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `s_user`
--
ALTER TABLE `s_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `s_usergroup`
--
ALTER TABLE `s_usergroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `t_absen`
--
ALTER TABLE `t_absen`
  MODIFY `absen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_absen_out`
--
ALTER TABLE `t_absen_out`
  MODIFY `absen_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_media`
--
ALTER TABLE `t_media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_product`
--
ALTER TABLE `t_product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
