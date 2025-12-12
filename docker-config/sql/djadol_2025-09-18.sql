# ************************************************************
# Sequel Ace SQL dump
# Version 20077
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: coolify.kopicode.com (MySQL 11.8.3-MariaDB-ubu2404)
# Database: djadol
# Generation Time: 2025-09-18 08:25:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table jurnal_agen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jurnal_agen`;

CREATE TABLE `jurnal_agen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `jurnal_agen` WRITE;
/*!40000 ALTER TABLE `jurnal_agen` DISABLE KEYS */;

INSERT INTO `jurnal_agen` (`id`, `company_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `retail_id`, `photo`, `agen_id`, `latlong`, `is_new`, `total_price`)
VALUES
	(1,1,'2025-09-12 14:27:40',31,NULL,NULL,24,NULL,NULL,'null,null',0,237000),
	(2,1,'2025-09-12 14:30:03',31,NULL,NULL,24,NULL,NULL,'null,null',0,261000),
	(3,1,'2025-09-12 14:34:20',31,NULL,NULL,14,NULL,NULL,'null,null',0,213000),
	(4,1,'2025-09-12 14:41:28',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(5,1,'2025-09-12 14:42:44',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(6,1,'2025-09-12 14:44:24',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(7,1,'2025-09-12 14:48:15',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(8,1,'2025-09-12 14:49:17',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(9,1,'2025-09-12 14:50:37',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(10,1,'2025-09-12 14:51:57',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(11,1,'2025-09-12 15:01:08',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(12,1,'2025-09-12 15:02:49',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(13,1,'2025-09-12 15:03:25',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(14,1,'2025-09-12 15:04:44',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(15,1,'2025-09-12 15:05:28',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(16,1,'2025-09-12 15:06:38',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(17,1,'2025-09-12 15:07:14',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(18,1,'2025-09-12 15:07:39',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(19,1,'2025-09-12 15:09:39',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(20,1,'2025-09-12 15:10:32',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(21,1,'2025-09-12 15:11:30',31,NULL,NULL,24,NULL,NULL,'null,null',0,141000),
	(22,1,'2025-09-12 15:13:27',31,NULL,NULL,24,NULL,NULL,'null,null',0,133200),
	(23,1,'2025-09-12 15:14:41',31,NULL,NULL,24,NULL,NULL,'null,null',0,133200),
	(24,1,'2025-09-12 15:16:02',31,NULL,NULL,24,NULL,NULL,'null,null',0,133200),
	(25,1,'2025-09-12 15:16:53',31,NULL,NULL,24,NULL,NULL,'null,null',0,133200),
	(26,1,'2025-09-12 15:23:19',31,NULL,NULL,24,NULL,NULL,'null,null',0,102000),
	(27,1,'2025-09-12 23:59:49',31,NULL,NULL,15,NULL,NULL,'null,null',0,216000),
	(28,1,'2025-09-13 00:11:49',31,NULL,NULL,13,NULL,NULL,'null,null',0,552000),
	(29,1,'2025-09-13 01:03:02',31,NULL,NULL,7,NULL,NULL,'null,null',0,31000),
	(30,1,'2025-09-13 01:03:18',31,NULL,NULL,11,NULL,NULL,'null,null',0,7750),
	(31,1,'2025-09-17 01:55:10',31,NULL,NULL,13,NULL,NULL,'null,null',0,744000);

/*!40000 ALTER TABLE `jurnal_agen` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jurnal_agen_sales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jurnal_agen_sales`;

CREATE TABLE `jurnal_agen_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `jurnal_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jurnal_agen_sales_relation_1` (`jurnal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `jurnal_agen_sales` WRITE;
/*!40000 ALTER TABLE `jurnal_agen_sales` DISABLE KEYS */;

INSERT INTO `jurnal_agen_sales` (`id`, `agen_id`, `product_id`, `retail_id`, `count`, `price`, `subtotal`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`, `company_id`, `jurnal_id`, `product_name`)
VALUES
	(1,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:27:40',NULL,NULL,NULL,1,1,'DJAVA HIJAU-(12)'),
	(2,NULL,1,NULL,5,24000,-120000,'out',NULL,'2025-09-12 14:27:40',NULL,NULL,NULL,1,1,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(3,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:30:03',NULL,NULL,NULL,1,2,'DJAVA HIJAU-(12)'),
	(4,NULL,1,NULL,6,24000,-144000,'out',NULL,'2025-09-12 14:30:03',NULL,NULL,NULL,1,2,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(5,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:34:20',NULL,NULL,NULL,1,3,'DJAVA HIJAU-(12)'),
	(6,NULL,1,NULL,4,24000,-96000,'out',NULL,'2025-09-12 14:34:20',NULL,NULL,NULL,1,3,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(7,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:41:29',NULL,NULL,NULL,1,4,'DJAVA HIJAU-(12)'),
	(8,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 14:41:30',NULL,NULL,NULL,1,4,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(9,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:42:46',NULL,NULL,NULL,1,5,'DJAVA HIJAU-(12)'),
	(10,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 14:42:46',NULL,NULL,NULL,1,5,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(11,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:44:25',NULL,NULL,NULL,1,6,'DJAVA HIJAU-(12)'),
	(12,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 14:44:25',NULL,NULL,NULL,1,6,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(13,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:48:16',NULL,NULL,NULL,1,7,'DJAVA HIJAU-(12)'),
	(14,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 14:48:16',NULL,NULL,NULL,1,7,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(15,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:49:19',NULL,NULL,NULL,1,8,'DJAVA HIJAU-(12)'),
	(16,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 14:49:19',NULL,NULL,NULL,1,8,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(17,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:50:38',NULL,NULL,NULL,1,9,'DJAVA HIJAU-(12)'),
	(18,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 14:50:38',NULL,NULL,NULL,1,9,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(19,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 14:51:58',NULL,NULL,NULL,1,10,'DJAVA HIJAU-(12)'),
	(20,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 14:51:59',NULL,NULL,NULL,1,10,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(21,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:01:09',NULL,NULL,NULL,1,11,'DJAVA HIJAU-(12)'),
	(22,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:01:09',NULL,NULL,NULL,1,11,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(23,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:02:50',NULL,NULL,NULL,1,12,'DJAVA HIJAU-(12)'),
	(24,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:02:51',NULL,NULL,NULL,1,12,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(25,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:03:26',NULL,NULL,NULL,1,13,'DJAVA HIJAU-(12)'),
	(26,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:03:26',NULL,NULL,NULL,1,13,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(27,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:04:45',NULL,NULL,NULL,1,14,'DJAVA HIJAU-(12)'),
	(28,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:04:45',NULL,NULL,NULL,1,14,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(29,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:05:30',NULL,NULL,NULL,1,15,'DJAVA HIJAU-(12)'),
	(30,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:05:31',NULL,NULL,NULL,1,15,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(31,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:06:40',NULL,NULL,NULL,1,16,'DJAVA HIJAU-(12)'),
	(32,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:06:40',NULL,NULL,NULL,1,16,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(33,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:07:15',NULL,NULL,NULL,1,17,'DJAVA HIJAU-(12)'),
	(34,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:07:15',NULL,NULL,NULL,1,17,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(35,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:07:40',NULL,NULL,NULL,1,18,'DJAVA HIJAU-(12)'),
	(36,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:07:40',NULL,NULL,NULL,1,18,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(37,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:09:40',NULL,NULL,NULL,1,19,'DJAVA HIJAU-(12)'),
	(38,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:09:41',NULL,NULL,NULL,1,19,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(39,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:10:33',NULL,NULL,NULL,1,20,'DJAVA HIJAU-(12)'),
	(40,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:10:34',NULL,NULL,NULL,1,20,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(41,NULL,2,NULL,15,7800,-117000,'out',NULL,'2025-09-12 15:11:31',NULL,NULL,NULL,1,21,'DJAVA HIJAU-(12)'),
	(42,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:11:32',NULL,NULL,NULL,1,21,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(43,NULL,2,NULL,14,7800,-109200,'out',NULL,'2025-09-12 15:13:28',NULL,NULL,NULL,1,22,'DJAVA HIJAU-(12)'),
	(44,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:13:28',NULL,NULL,NULL,1,22,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(45,NULL,2,NULL,14,7800,-109200,'out',NULL,'2025-09-12 15:14:42',NULL,NULL,NULL,1,23,'DJAVA HIJAU-(12)'),
	(46,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:14:42',NULL,NULL,NULL,1,23,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(47,NULL,2,NULL,14,7800,-109200,'out',NULL,'2025-09-12 15:16:03',NULL,NULL,NULL,1,24,'DJAVA HIJAU-(12)'),
	(48,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:16:03',NULL,NULL,NULL,1,24,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(49,NULL,2,NULL,14,7800,-109200,'out',NULL,'2025-09-12 15:16:54',NULL,NULL,NULL,1,25,'DJAVA HIJAU-(12)'),
	(50,NULL,1,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:16:54',NULL,NULL,NULL,1,25,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(51,NULL,1,NULL,10,7800,-78000,'out',NULL,'2025-09-12 15:23:20',NULL,NULL,NULL,1,26,'DJAVA HIJAU-(12)'),
	(52,NULL,18,NULL,1,24000,-24000,'out',NULL,'2025-09-12 15:23:20',NULL,NULL,NULL,1,26,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(53,NULL,18,NULL,9,24000,-216000,'out',NULL,'2025-09-12 23:59:49',NULL,NULL,NULL,1,27,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(54,NULL,17,NULL,24,23000,-552000,'out',NULL,'2025-09-13 00:11:49',NULL,NULL,NULL,1,28,'DJAVA MILD BLUE-(16)'),
	(55,NULL,11,NULL,2,15500,-31000,'out',NULL,'2025-09-13 01:03:02',NULL,NULL,NULL,1,29,'OCHA FILTER-(12)'),
	(56,NULL,8,NULL,1,7750,-7750,'out',NULL,'2025-09-13 01:03:18',NULL,NULL,NULL,1,30,'HK REEBORN-(12)'),
	(57,NULL,11,NULL,48,15500,-744000,'out',NULL,'2025-09-17 01:55:10',NULL,NULL,NULL,1,31,'OCHA FILTER-(12)');

/*!40000 ALTER TABLE `jurnal_agen_sales` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jurnal_inquiry_agen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jurnal_inquiry_agen`;

CREATE TABLE `jurnal_inquiry_agen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `jurnal_inquiry_agen` WRITE;
/*!40000 ALTER TABLE `jurnal_inquiry_agen` DISABLE KEYS */;

INSERT INTO `jurnal_inquiry_agen` (`id`, `company_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `description`, `agen_id`, `status`, `total_price`)
VALUES
	(5,1,'2025-09-06 14:41:46',30,'2025-09-06 07:11:11',30,'tahap 1',31,'diterima',NULL),
	(6,1,'2025-09-06 14:11:33',30,NULL,NULL,'Berikan joni thp 2',31,'diterima',NULL),
	(7,1,'2025-09-06 16:23:07',30,'2025-09-06 08:15:03',30,'Penyerahan Sept Awal',31,'diterima',NULL),
	(8,1,'2025-09-10 21:58:08',30,'2025-09-10 14:53:37',30,'Penyerahan ke boby',31,'diterima',NULL),
	(9,1,'2025-09-12 22:42:54',30,NULL,NULL,'ke ubaid',31,'diterima',NULL),
	(10,1,'2025-09-12 22:47:02',30,NULL,NULL,'ke ubaid 2',31,'diterima',NULL),
	(11,1,'2025-09-12 22:49:38',30,NULL,NULL,'Ke OK',32,'diterima',NULL),
	(12,1,'2025-09-13 08:01:57',30,'2025-09-13 00:40:04',30,'Ke boby',31,'diterima',NULL);

/*!40000 ALTER TABLE `jurnal_inquiry_agen` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jurnal_inquiry_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jurnal_inquiry_detail`;

CREATE TABLE `jurnal_inquiry_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `jurnal_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentindex_2_inquiry` (`jurnal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `jurnal_inquiry_detail` WRITE;
/*!40000 ALTER TABLE `jurnal_inquiry_detail` DISABLE KEYS */;

INSERT INTO `jurnal_inquiry_detail` (`id`, `agen_id`, `product_id`, `count`, `price`, `subtotal`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`, `company_id`, `jurnal_id`, `product_name`)
VALUES
	(8,NULL,18,200,NULL,NULL,NULL,30,'2025-09-06 14:11:09',NULL,NULL,NULL,1,5,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(9,NULL,2,25,NULL,NULL,NULL,30,'2025-09-06 14:11:52',NULL,NULL,NULL,1,6,'DJAVA HIJAU-(16)'),
	(10,NULL,19,30,NULL,NULL,NULL,30,'2025-09-06 14:12:02',NULL,NULL,NULL,1,6,'DJAVA FLAVOUR PINEAPPLE-(16)'),
	(11,NULL,1,30,NULL,NULL,NULL,30,'2025-09-06 15:14:35',NULL,NULL,NULL,1,7,'DJAVA HIJAU-(12)'),
	(12,NULL,4,40,NULL,NULL,NULL,30,'2025-09-06 15:14:43',NULL,NULL,NULL,1,7,'DJAVA MERAH-(12)'),
	(13,NULL,21,100,NULL,NULL,NULL,30,'2025-09-06 15:14:53',NULL,NULL,NULL,1,7,'KING DJAVA MENTHOL-(20)'),
	(14,NULL,18,200,NULL,NULL,NULL,30,'2025-09-10 21:53:07',NULL,NULL,NULL,1,8,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(15,NULL,1,300,NULL,NULL,NULL,30,'2025-09-10 21:53:31',NULL,NULL,NULL,1,8,'DJAVA HIJAU-(12)'),
	(16,NULL,19,30,NULL,NULL,NULL,30,'2025-09-12 22:30:14',NULL,NULL,NULL,1,9,'DJAVA FLAVOUR PINEAPPLE-(16)'),
	(17,NULL,17,24,NULL,NULL,NULL,30,'2025-09-12 22:46:40',NULL,NULL,NULL,1,10,'DJAVA MILD BLUE-(16)'),
	(18,NULL,1,35,NULL,NULL,NULL,30,'2025-09-12 22:49:07',NULL,NULL,NULL,1,11,'DJAVA HIJAU-(12)'),
	(19,NULL,5,25,NULL,NULL,NULL,30,'2025-09-12 22:49:21',NULL,NULL,NULL,1,11,'DJAVA PREMIUM GOLD-(12)'),
	(20,NULL,8,10,NULL,NULL,NULL,30,'2025-09-13 07:39:37',NULL,NULL,NULL,1,12,'HK REEBORN-(12)'),
	(21,NULL,6,20,NULL,NULL,NULL,30,'2025-09-13 07:39:48',NULL,NULL,NULL,1,12,'LONGSIZE-(12)'),
	(22,NULL,11,50,NULL,NULL,NULL,30,'2025-09-13 07:40:01',NULL,NULL,NULL,1,12,'OCHA FILTER-(12)');

/*!40000 ALTER TABLE `jurnal_inquiry_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jurnal_stock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jurnal_stock`;

CREATE TABLE `jurnal_stock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `status` varchar(3) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;



# Dump of table jurnal_visitasi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jurnal_visitasi`;

CREATE TABLE `jurnal_visitasi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `jurnal_visitasi` WRITE;
/*!40000 ALTER TABLE `jurnal_visitasi` DISABLE KEYS */;

INSERT INTO `jurnal_visitasi` (`id`, `company_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `retail_id`, `photo`, `agen_id`, `latlong`, `is_new`, `total_price`)
VALUES
	(1,1,'2025-08-20 02:18:01',31,'2025-08-22 01:01:15',NULL,4,NULL,NULL,'null,null',1,NULL),
	(2,1,'2025-08-20 02:18:30',31,'2025-08-22 01:01:15',NULL,4,NULL,NULL,'null,null',0,NULL),
	(3,1,'2025-08-20 02:19:13',31,'2025-08-22 01:01:15',NULL,4,'scaled_a5b685a4-5218-4058-aa26-2147e2550f385290138855555448021.jpg',NULL,'null,null',0,NULL),
	(4,1,'2025-08-20 02:19:27',31,'2025-08-22 01:01:15',NULL,4,'scaled_a5b685a4-5218-4058-aa26-2147e2550f385290138855555448021.jpg',NULL,'null,null',0,NULL),
	(5,1,'2025-08-20 02:20:14',31,'2025-08-22 01:01:15',NULL,4,NULL,NULL,'-7.1610466,113.4906866',0,NULL),
	(6,1,'2025-08-20 02:20:33',32,'2025-08-22 01:01:15',NULL,NULL,NULL,NULL,'-7.1610586,113.4908676',0,NULL),
	(7,1,'2025-08-20 02:35:47',32,'2025-08-22 01:01:15',NULL,5,NULL,NULL,'-7.1610579,113.4908186',1,NULL),
	(8,1,'2025-08-20 02:36:05',32,'2025-08-22 01:01:15',NULL,5,'scaled_7f7e0739-0ab0-413d-987d-501709da81928495629280354221155.jpg',NULL,'-7.161056,113.4908707',0,NULL),
	(9,1,'2025-08-20 02:36:14',31,'2025-08-22 01:01:15',NULL,5,'scaled_7f7e0739-0ab0-413d-987d-501709da81928495629280354221155.jpg',NULL,'-7.161056,113.4908707',0,NULL),
	(11,1,'2025-08-20 04:01:58',31,'2025-08-22 01:01:15',NULL,4,'scaled_f4d2b821-89f2-4eb1-bcf2-c7d517d1432e4776273373147841375.jpg',NULL,'37.4219983,-122.084',0,NULL),
	(12,1,'2025-08-20 04:02:07',31,'2025-08-22 01:01:15',NULL,4,'scaled_f4d2b821-89f2-4eb1-bcf2-c7d517d1432e4776273373147841375.jpg',NULL,'37.4219983,-122.084',0,NULL),
	(13,1,'2025-08-20 04:40:49',31,'2025-08-22 01:01:15',NULL,4,'scaled_bc37ce9e-a72e-4e53-8778-fc1e059829467469699882264414243.jpg',NULL,'-7.3209695,112.7967031',0,NULL),
	(14,1,'2025-08-20 04:43:11',31,'2025-08-22 01:01:15',NULL,4,'scaled_bc37ce9e-a72e-4e53-8778-fc1e059829467469699882264414243.jpg',NULL,'-7.3209695,112.7967031',0,NULL),
	(16,1,'2025-08-20 05:18:10',31,'2025-08-22 01:01:15',NULL,5,'scaled_d6d5467b-f777-4120-b37d-ae4a689230691760238468928121699.jpg',NULL,'-7.3209582,112.7966858',0,NULL),
	(18,1,'2025-08-20 05:23:59',31,'2025-08-22 01:01:15',NULL,2,'scaled_a4797db7-5582-4e7d-8b08-bdab3f2ed2e94688327975193679606.jpg',NULL,'-7.3209207,112.7966963',0,NULL),
	(20,1,'2025-08-25 11:38:06',31,NULL,NULL,5,NULL,NULL,'null,null',0,732000),
	(21,1,'2025-08-25 11:43:22',31,NULL,NULL,2,NULL,NULL,'null,null',0,582000),
	(22,1,'2025-08-26 12:46:22',31,NULL,NULL,5,NULL,NULL,'null,null',0,343500),
	(23,1,'2025-08-26 14:43:20',31,NULL,NULL,4,NULL,NULL,'-7.1345843,112.7171668',0,NULL),
	(24,1,'2025-08-26 14:46:12',31,NULL,NULL,6,'scaled_50377f18-31ab-49ae-99fb-b7c5afd65b066756622774452795708.jpg',NULL,'-7.134589,112.717165',1,NULL),
	(25,1,'2025-08-27 09:17:13',31,NULL,NULL,5,'scaled_362d33f2-a0b4-4f72-a26c-b735a241620c5507053876082129644.jpg',NULL,'-7.0964904,113.6704771',0,NULL),
	(26,1,'2025-08-27 09:18:51',31,NULL,NULL,7,NULL,NULL,'-7.1006122,113.6722058',0,NULL),
	(27,1,'2025-08-27 09:20:24',31,NULL,NULL,NULL,NULL,NULL,'-7.1068575,113.6725747',0,NULL),
	(28,1,'2025-08-28 12:18:24',31,NULL,NULL,8,'scaled_df278e5f-5184-44e9-835e-62edf99b51f06657170295446852311.jpg',NULL,'-7.1555895,113.4976363',0,NULL),
	(29,1,'2025-08-30 11:01:25',31,NULL,NULL,4,NULL,NULL,'null,null',0,NULL),
	(30,1,'2025-08-30 11:01:40',31,NULL,NULL,7,NULL,NULL,'null,null',0,NULL),
	(31,1,'2025-08-30 11:04:11',31,NULL,NULL,6,NULL,NULL,'null,null',0,NULL),
	(34,1,'2025-08-30 14:01:22',31,NULL,NULL,7,'scaled_2bc15b9a-6c30-4559-b90f-ec86fd6aa1364430215456501612507.jpg',NULL,'-7.1348141,112.7173293',0,NULL),
	(37,1,'2025-08-31 04:31:14',31,NULL,NULL,12,'scaled_f6289cea-34ab-401e-ac39-aeb98cfaf8657033515727285758981.jpg',NULL,'-7.3209586,112.7966914',0,NULL),
	(38,1,'2025-08-31 15:14:50',31,NULL,NULL,4,'scaled_a2e28350-0d16-4606-a903-9fb23c47f50a8853817444934978366.jpg',NULL,'-7.0273827,113.7838981',0,NULL),
	(39,1,'2025-08-31 15:15:27',31,NULL,NULL,6,'scaled_280ef9e4-b554-4168-b48d-caa92b5df098491670174892815774.jpg',NULL,'-7.0273831,113.7838976',0,NULL),
	(40,1,'2025-08-31 15:15:47',31,NULL,NULL,6,'scaled_97d3a7bf-d460-402b-88e2-13da2dfb5c2b791992495469528931.jpg',NULL,'-7.0273828,113.7838982',0,NULL),
	(41,1,'2025-08-31 15:16:07',31,NULL,NULL,10,'scaled_30ba9e1c-482e-42c8-86c6-d8ee15335acd5393718266219400571.jpg',NULL,'-7.0273828,113.7838977',1,NULL),
	(42,1,'2025-08-31 15:16:40',31,NULL,NULL,11,'scaled_e22f765f-8d4b-4d19-b234-4ad13bee7cb3490665390740908165.jpg',NULL,'-7.0273845,113.7838984',1,NULL),
	(43,1,'2025-08-31 15:17:22',31,NULL,NULL,9,'scaled_08a56c7a-4cca-4b52-a86f-292fac2938484908335234261644955.jpg',NULL,'-7.0273826,113.783898',1,NULL),
	(45,1,'2025-08-31 15:18:22',31,NULL,NULL,4,'scaled_8cf68c62-218d-420f-9166-445ee4e6c9a8813662880411019732.jpg',NULL,'-7.0273828,113.7838977',0,NULL),
	(46,1,'2025-08-31 15:19:38',31,NULL,NULL,13,'scaled_d6c9fe1f-f9ee-4775-b5e0-2a899c42a0304821980397350498843.jpg',NULL,'-7.0273828,113.7838977',1,NULL),
	(47,1,'2025-09-02 16:03:19',31,NULL,NULL,6,'scaled_a772e1fe-3604-4353-9e16-2a4bc0703da85105207013127771722.jpg',NULL,'-7.0072883,113.8548493',0,NULL),
	(49,1,'2025-09-02 16:06:21',31,NULL,NULL,5,'scaled_7fff994b-49a7-4955-a784-96bf2b4d419b6120479450942363172.jpg',NULL,'-7.0072888,113.8548499',0,NULL),
	(50,1,'2025-09-02 16:07:27',31,NULL,NULL,5,'scaled_509252a0-40dc-445d-a60d-971b8cb97fa877698807759337336.jpg',NULL,'-7.0072893,113.8548463',0,NULL),
	(51,1,'2025-09-02 22:32:46',31,NULL,NULL,14,'scaled_75d96b5e-210b-4905-9ad0-86bca1ce960f9021998499465099244.jpg',NULL,'37.4219983,-122.084',1,NULL),
	(52,1,'2025-09-02 22:35:33',31,NULL,NULL,11,'scaled_3240e8bb-8453-4982-a672-027effb1ca027313275693564812513.jpg',NULL,'37.4219983,-122.084',0,NULL),
	(53,1,'2025-09-02 22:37:15',31,NULL,NULL,15,'scaled_25c7e97c-b022-4954-aec3-66bb7bab5ec26138777814314285847.jpg',NULL,'37.4219983,-122.084',1,NULL),
	(54,1,'2025-09-03 02:30:32',31,NULL,NULL,14,'scaled_e40a0ddd-9b12-4c5c-a528-1c36398506a25065849610586264782.jpg',NULL,'-7.1610662,113.4908279',0,NULL),
	(55,1,'2025-09-03 02:36:05',31,NULL,NULL,24,'scaled_8293f708-850d-4bbe-8c36-d6abe3cb674c4052380901865026554.jpg',NULL,'-7.1610485,113.4907599',1,NULL),
	(56,1,'2025-09-03 02:36:44',31,NULL,NULL,9,'scaled_57e4f64d-c337-45d3-a3e1-89bfe05f89083207696593463220827.jpg',NULL,'-7.1614031,113.4907335',0,NULL),
	(57,1,'2025-09-03 02:36:59',31,NULL,NULL,24,'scaled_60418328-5104-4ee5-acc8-d15d896145573096848102853460532.jpg',NULL,'-7.1614451,113.4907181',0,NULL),
	(58,1,'2025-09-03 02:37:17',31,NULL,NULL,12,'scaled_d725dbf5-896c-4777-9964-2cfa2c48c32a9143779178504355046.jpg',NULL,'-7.1614443,113.4907199',0,NULL),
	(59,1,'2025-09-03 02:37:37',31,NULL,NULL,8,'scaled_d3278103-e986-47ad-b914-9aeeed59353b3327969697304719260.jpg',NULL,'-7.1614447,113.490717',0,NULL),
	(60,1,'2025-09-03 02:38:14',31,NULL,NULL,11,'scaled_a19c6ed8-7f48-42d1-9f35-810e44743cc37641491110221793555.jpg',NULL,'-7.1614475,113.4907193',0,NULL),
	(61,1,'2025-09-03 02:38:52',31,NULL,NULL,12,'scaled_f399bbce-8bde-4371-a7f8-6d1ab8b4108f624372083704834567.jpg',NULL,'-7.1614475,113.4907193',0,NULL),
	(62,1,'2025-09-03 02:40:04',31,NULL,NULL,2,'scaled_12571f03-f465-4512-a385-6723bf43d9461288107228205569106.jpg',NULL,'-7.1614475,113.4907193',0,NULL),
	(63,1,'2025-09-03 02:40:33',31,NULL,NULL,9,'scaled_922a88d7-6bed-4f6f-878d-18ed1d3f126d7746953600339131392.jpg',NULL,'-7.1612437,113.4907893',0,NULL),
	(64,1,'2025-09-03 03:23:39',31,NULL,NULL,24,'scaled_8a285b47-34ad-4d55-8a0f-e5390c1ca7285159307900108549020.jpg',NULL,'-7.0446935,112.7381876',0,NULL),
	(65,1,'2025-09-03 10:45:23',31,NULL,NULL,24,'scaled_44798865-1897-42a8-8da9-6cfc6b71e4f9567464538843058400.jpg',NULL,'37.4219983,-122.084',0,NULL),
	(66,1,'2025-09-17 08:56:21',31,NULL,NULL,9,'scaled_7f928f94-7e5f-4563-9d61-7bca80e03ecb7209484934175676692.jpg',NULL,'-7.1614529,113.4907266',0,NULL),
	(67,1,'2025-09-17 09:00:10',31,NULL,NULL,25,'scaled_08d2f05f-3f40-4936-8846-10c29b1cb40d7759978474740826113.jpg',NULL,'-7.1614497,113.4907274',1,NULL);

/*!40000 ALTER TABLE `jurnal_visitasi` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table m_company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `m_company`;

CREATE TABLE `m_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(10) unsigned zerofill DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `m_company` WRITE;
/*!40000 ALTER TABLE `m_company` DISABLE KEYS */;

INSERT INTO `m_company` (`id`, `name`, `address`, `phone`, `logo`, `latitude`, `longitude`, `created_at`, `created_by`, `updated_by`, `updated_at`, `deleted_at`)
VALUES
	(1,'CV. Gresik','Gresik','081999082633','Screenshot_2025-04-11_at_09.15.51.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'CV. Surabaya','Surabaya','085259300068',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `m_company` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table m_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `m_config`;

CREATE TABLE `m_config` (
  `config_id` int(11) NOT NULL,
  `config_name` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `m_config` WRITE;
/*!40000 ALTER TABLE `m_config` DISABLE KEYS */;

INSERT INTO `m_config` (`config_id`, `config_name`, `config_value`)
VALUES
	(1,'app_name','Hippam'),
	(2,'admin_price','2000'),
	(3,'company_address','Bojonegoro');

/*!40000 ALTER TABLE `m_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table m_flow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `m_flow`;

CREATE TABLE `m_flow` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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



# Dump of table m_productcategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `m_productcategory`;

CREATE TABLE `m_productcategory` (
  `productcategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `productcategory_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `productcategory_price` decimal(10,2) DEFAULT NULL,
  `productcategory_created_date` datetime DEFAULT current_timestamp(),
  `productcategory_created_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `productcategory_parent_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`productcategory_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `m_productcategory` WRITE;
/*!40000 ALTER TABLE `m_productcategory` DISABLE KEYS */;

INSERT INTO `m_productcategory` (`productcategory_id`, `productcategory_name`, `productcategory_price`, `productcategory_created_date`, `productcategory_created_by`, `productcategory_parent_id`)
VALUES
	(1,'Abonemen',1000.00,NULL,NULL,'0'),
	(2,'SOSIAL',NULL,NULL,NULL,'0'),
	(3,'RUMAH TANGGA',4000.00,NULL,NULL,'0');

/*!40000 ALTER TABLE `m_productcategory` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table m_retail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `m_retail`;

CREATE TABLE `m_retail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `m_retail` WRITE;
/*!40000 ALTER TABLE `m_retail` DISABLE KEYS */;

INSERT INTO `m_retail` (`id`, `name`, `address`, `phone`, `location_lat`, `location_long`, `picture`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `company_id`)
VALUES
	(1,'Toko Socah','Socah',NULL,'0.177878','0.9892187','Screenshot_2025-04-11_at_14.12.58.png',NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'tokoabc','Rungkut',NULL,'276183612786','276112786',NULL,'2025-05-22 13:38:23','2025-05-23 15:29:06',NULL,31,1,1),
	(3,'Toko Basmalah','Graha Kamal Permai',NULL,'8723166','171833',NULL,NULL,'2025-05-23 15:30:27',NULL,NULL,1,NULL),
	(4,'Toko Barokah','jl sidayu',NULL,NULL,NULL,'scaled_e3c4141b-e566-418a-8194-458cbba3821a111407839589903946.jpg','2025-08-20 02:17:17',NULL,NULL,31,NULL,1),
	(5,'toko basmalah','pamekasan',NULL,NULL,NULL,'scaled_1001838994.jpg','2025-08-20 02:35:14',NULL,NULL,31,NULL,1),
	(6,'toko pada bede','Kamal Bangkalan','081999082633',NULL,NULL,'scaled_b0d76616-ecfc-4035-b692-133b29db72bf2477020897062181595.jpg','2025-08-26 14:44:46',NULL,NULL,31,NULL,1),
	(7,'Toko Baru','sumenep','081233557887',NULL,NULL,NULL,'2025-08-27 09:18:34',NULL,NULL,31,NULL,1),
	(8,'Toko Baru 2','pamekasan','08122222222',NULL,NULL,NULL,'2025-08-27 09:20:14',NULL,NULL,31,NULL,1),
	(9,'Toko Makmur','Bangkalan','0963947484932',NULL,NULL,NULL,'2025-08-31 01:00:05',NULL,NULL,31,NULL,1),
	(10,'Toko Maju','Jakarta','081938038222',NULL,NULL,NULL,'2025-08-31 01:01:46',NULL,NULL,32,NULL,1),
	(11,'toko jakarta','Jakdndmdds','93749404020',NULL,NULL,NULL,'2025-08-31 01:06:10',NULL,NULL,31,NULL,1),
	(12,'Joyo Mangun Karso','Gresik Utara Jaya','97283667761',NULL,NULL,'scaled_1001088049.jpg','2025-08-31 01:27:31',NULL,NULL,31,NULL,1),
	(13,'toko jaya sejahtera','tes','081938038444',NULL,NULL,NULL,'2025-08-31 15:19:17',NULL,NULL,31,NULL,1),
	(14,'Hamdalah','Sampang Bersinar','98752177711',NULL,NULL,'scaled_99d006af-7cfe-457b-9fee-ab1933145d1f8771175739322866613.jpg','2025-09-02 22:32:22',NULL,NULL,31,NULL,1),
	(15,'Toko Bersinar','Bangkalan Dakiring','087762167655',NULL,NULL,NULL,'2025-09-02 22:36:27',NULL,NULL,31,NULL,1),
	(24,'Toko Serbaguna','Dsn Pakong-Pamekasan','0912374959592',NULL,NULL,'scaled_144cd250-7bb6-4ed9-82e6-72208c65f5628061282314220056226.jpg','2025-09-03 02:35:37',NULL,NULL,31,NULL,1),
	(25,'toko jaya sejahtera','Jl Raya Sumenep','081938088863',NULL,NULL,'scaled_15c4d74a-6f08-4695-8e6a-389b78b2bf107017806089409729821.jpg','2025-09-17 08:59:43',NULL,NULL,31,NULL,1);

/*!40000 ALTER TABLE `m_retail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table m_warehouse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `m_warehouse`;

CREATE TABLE `m_warehouse` (
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `m_warehouse` WRITE;
/*!40000 ALTER TABLE `m_warehouse` DISABLE KEYS */;

INSERT INTO `m_warehouse` (`id`, `name`, `address`, `phone`, `logo`, `latitude`, `longitude`, `created_at`, `created_by`, `updated_by`, `updated_at`, `deleted_at`, `company_id`)
VALUES
	(1,'Gudang A','Gresik','09238138786','Screenshot_2025-04-11_at_09.15.51.png',0,0,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `m_warehouse` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table s_akses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_akses`;

CREATE TABLE `s_akses` (
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
  KEY `lnk_m_usergroup_t_akses` (`usergroup_id`) USING BTREE,
  CONSTRAINT `s_akses_ibfk_1` FOREIGN KEY (`usergroup_id`) REFERENCES `s_usergroup` (`id`),
  CONSTRAINT `s_akses_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `s_menu` (`menu_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_akses` WRITE;
/*!40000 ALTER TABLE `s_akses` DISABLE KEYS */;

INSERT INTO `s_akses` (`akses_id`, `usergroup_id`, `menu_id`, `akses_active`, `akses_code`, `order`, `created_at`, `updated_at`, `updated_by`, `created_by`)
VALUES
	(1,1,1,'y','[\"xcreate\",\"xread\",\"xupdate\",\"xdelete\"]',1,NULL,NULL,NULL,NULL),
	(2,1,2,'y','[\"xcreate\",\"xread\",\"xupdate\",\"xdelete\"]',1,NULL,NULL,NULL,NULL),
	(3,1,3,'y','[\"xcreate\",\"xupdate\",\"xdelete\"]',1,NULL,NULL,NULL,NULL),
	(19,1,10,'y','null',NULL,NULL,NULL,NULL,NULL),
	(35,1,26,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(48,1,32,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(49,2,32,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(57,1,37,'y','[\"xread\",\"xupdate\"]',NULL,NULL,'2025-09-05 03:54:05',1,NULL),
	(58,3,37,'y','[\"xread\",\"xupdate\"]',NULL,NULL,'2025-09-05 03:54:17',1,NULL),
	(59,4,37,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(60,1,38,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(61,2,38,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(62,1,39,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(63,3,3,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(64,3,10,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(65,1,40,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(66,1,41,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(67,2,10,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(68,2,3,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(69,2,40,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(70,4,40,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(77,3,32,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(78,1,44,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(79,2,44,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(80,1,45,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(81,2,45,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(82,3,45,'y','[\"xread\"]',NULL,NULL,NULL,NULL,NULL),
	(84,1,47,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(85,2,47,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(86,3,47,'y','[\"xread\",\"xcreate\",\"xupdate\"]',NULL,NULL,NULL,NULL,NULL),
	(87,1,46,'y','[\"xread\"]',NULL,NULL,NULL,NULL,NULL),
	(88,2,46,'y','null',NULL,NULL,NULL,NULL,NULL),
	(89,3,46,'y','null',NULL,NULL,NULL,NULL,NULL),
	(90,1,49,'y','[\"xread\"]',NULL,NULL,NULL,NULL,NULL),
	(91,2,49,'y','[\"xread\"]',NULL,NULL,NULL,NULL,NULL),
	(92,3,49,'y','[\"xread\"]',NULL,NULL,NULL,NULL,NULL),
	(94,1,50,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(95,2,26,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(96,3,26,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(97,1,51,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-05-26 15:26:24',NULL,NULL,1),
	(98,2,51,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-05-26 15:26:33',NULL,NULL,1),
	(99,4,51,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-05-26 15:26:41',NULL,NULL,1),
	(100,1,52,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-08-21 14:55:12',NULL,NULL,1),
	(101,2,52,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-08-21 14:55:24',NULL,NULL,1),
	(102,4,52,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-08-25 11:42:27',NULL,NULL,1),
	(103,1,53,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-09-05 10:40:45',NULL,NULL,1),
	(104,2,53,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-09-05 10:40:55',NULL,NULL,1),
	(105,2,54,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-09-05 11:03:21',NULL,NULL,1),
	(106,1,54,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-09-05 11:03:31',NULL,NULL,1),
	(107,1,55,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-09-18 10:24:23',NULL,NULL,1),
	(108,1,56,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-09-18 10:24:41',NULL,NULL,1);

/*!40000 ALTER TABLE `s_akses` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table s_api_keys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_api_keys`;

CREATE TABLE `s_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `ignore_limits` tinyint(1) DEFAULT 0,
  `is_private_key` tinyint(1) DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_api_keys` WRITE;
/*!40000 ALTER TABLE `s_api_keys` DISABLE KEYS */;

INSERT INTO `s_api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`)
VALUES
	(1,1,'0695cabefc1d6bd11e6e13f1e04cffc2b2e07a3251af24c960dbae5c758b62b7',NULL,0,0,NULL,NULL),
	(2,1,'1f38c77fb7c5893ba61826b1087a9638429c8959059b73b0847f132ca5e01a13',NULL,0,0,NULL,NULL),
	(3,30,'105bf1d755e56dd35711052d6b6629ab2f6dcf2eb6ead40ed51fde9ae4320095',NULL,0,0,NULL,NULL),
	(4,31,'e8084ef026210fca3137f2a956c37cf1c7d07c5146a7445491bc622354c69dd7',NULL,0,0,NULL,NULL),
	(5,31,'f94ffe2191e6b7c664dc8a104f7a0ccc1e85b8b2b7d24895c372501ed1190c59',NULL,0,0,NULL,NULL),
	(6,31,'60fc511ed3f645b20b4a1fc425d1b0510979944509fed8297b0dd0b26983f54f',NULL,0,0,NULL,NULL),
	(7,31,'9f038242665d657981deab53557691df3dd8ad387ffe1f3e95ef16aa4678b21e',NULL,0,0,NULL,NULL),
	(8,31,'dcf9788a69581e5546abe74028b619f39a48e94863c1422b8581968f5c8fae8e',NULL,0,0,NULL,NULL),
	(9,31,'5e9f1d84be3c9a88d210b4aaa8bd69a18eeb458205fe8a85a04fd6df35321887',NULL,0,0,NULL,NULL),
	(10,31,'48e5bc6d463ab327ef8341dceec24ed102527f417e26b9337c336be5ba1a9632',NULL,0,0,NULL,NULL),
	(11,31,'d6b8488f891c283aca007bd6783a95e9301dcc30afebdd76645f1522882e76d0',NULL,0,0,NULL,NULL),
	(12,31,'f06e4c35e1c7141be7e919275f47df97b480f10f2c685f9d0c52f3da2a9c44a6',NULL,0,0,NULL,NULL),
	(13,31,'58c5bda02f6b9773e2b7d48e837346aa9fb2496f746c2440beaef25ca0b7d7f6',NULL,0,0,NULL,NULL),
	(14,31,'973b673dfeec70b9c4d21620e1ead043bcd315ab6be56cd4e2a930892edac139',NULL,0,0,NULL,NULL),
	(15,31,'2691a1e3b43ce8c2e488a3dc2e7377382a62fda68ba55cb4d5e246e329f6fcd5',NULL,0,0,NULL,NULL),
	(16,31,'b218cfe1ea3accd11170f08731f664adc5140efe4b739ffddcbcdcaeaef10fed',NULL,0,0,NULL,NULL),
	(17,31,'50a8897cbf4b9b1644e7da108c4bf7d3db36982bf4f5bffc6a6471bd0700efb7',NULL,0,0,NULL,NULL),
	(18,31,'d5eb7dfd1c39097710828f1002d11e7ff6066a233a3f58dfe83aec11a92d4002',NULL,0,0,NULL,NULL),
	(19,31,'9b3cbfda2abffce36c86851327df55d2dd7a3201c66140c18d9ffbbe92b1b2b5',NULL,0,0,NULL,NULL),
	(20,31,'c52f7df0d6c86a99bbf29470f09653a2f13d4dbd77c2c14107628a68712b34db',NULL,0,0,NULL,NULL),
	(21,31,'54929b07587f382dc1453b4967c2afb305c0374d2a712e6b155f82a7d64fc952',NULL,0,0,NULL,NULL),
	(22,31,'b975bc96af295d890eba0bf51f166bb691da2138464ef76556311cfe9047a2c4',NULL,0,0,NULL,NULL),
	(23,31,'f8727d00bf67aa88264df94d528f32daaa52e3ec1164d344f595a45fd44a2caa',NULL,0,0,NULL,NULL),
	(24,31,'a9b07ae7044acbc5363c36858035c3f88c68ac53fa427b9b933caad794e16010',NULL,0,0,NULL,NULL),
	(25,31,'d00fc29970e3a1dc07a93469d353c0c569ec6b8c4de0f476b56c4b555fe38e6b',NULL,0,0,NULL,NULL),
	(26,31,'928f5ba542af482975803f32251b8f1847c36fbfbd4013ace24dec19fd392f4f',NULL,0,0,NULL,NULL),
	(27,31,'6a3cf228a8322586fed061360f8d4163cf62502a01eb0bd5c243411a699847ed',NULL,0,0,NULL,NULL),
	(28,31,'c60d2a216f68511316b661eb9b7f490540127f4200dab96a291f90513622d8fd',NULL,0,0,NULL,NULL),
	(29,31,'baa97e9c3e1f40bef4445d604af390e808cfd261e811ea3be3bb5b23662a6b19',NULL,0,0,NULL,NULL),
	(30,31,'b6721f426068571e8b865c3a4a3a26fe6cff74116f3266334731027af572473b',NULL,0,0,NULL,NULL),
	(31,31,'98f176b51e9a257d368370377356100e3f11843c4433b4d6e1927ace8d65e327',NULL,0,0,NULL,NULL),
	(32,31,'36b1886b4f68f4eb55d9024149cdf8d855c83c51b77ac7010f0e64d10b77ba68',NULL,0,0,NULL,NULL),
	(33,31,'daa51b1d0b9e612418e87348470bb9d005e67d5c96a42030d0eb8f99d55b4128',NULL,0,0,NULL,NULL),
	(34,31,'9b4a45120ab1933cd9e6ab96706ee6b7007b187bf28355451646b61f5db69de4',NULL,0,0,NULL,NULL),
	(35,31,'5b16b73bfde2a2e912b29ad3bfa359da3815e86808d394a724ceae8f5b0a5899',NULL,0,0,NULL,NULL),
	(36,31,'d7d226acffe0b4e9469b65b8516a7cfda1cc3420db8b5ea513043badf93218fe',NULL,0,0,NULL,NULL),
	(37,31,'98a0cb72ce7217426063f67f457c6e7c38c2bba08a20d2856f96956752762eb3',NULL,0,0,NULL,NULL),
	(38,31,'f8e144557069e5c49070d42cc267c3c36681b10dfedebeeb4e45a7fc98871236',NULL,0,0,NULL,NULL),
	(39,31,'56934fdcaf955c6798e9f135a48bdd2e1a980b9349ec262f6db53c89a554db3f',NULL,0,0,NULL,NULL),
	(40,31,'09d8e6bc6ede1c699c594242fdb1d31b3496de6e1f2f4f0233cf9371135ca539',NULL,0,0,NULL,NULL),
	(41,31,'a1485cc4137470c86f1d761e29389262ec1c0fb5a454d683888778606c12655d',NULL,0,0,NULL,NULL),
	(42,31,'3c3bf25708b4913eed2142f6a795f36e83b557f40645e7bf24c50109c537898d',NULL,0,0,NULL,NULL),
	(43,31,'06eb11d4d24bc487220787851a49bfa44b3f09f7375a5ca7d5528704f29949e2',NULL,0,0,NULL,NULL),
	(44,31,'92cb3782333f25bda58da91f1fc0e7715c44fb76e0be5d2dbc9d12f95de3ee95',NULL,0,0,NULL,NULL),
	(45,31,'cdd8e63e8876dc6d835d3a63b748a00b0f4c4802a39204392a8d27662c3993d4',NULL,0,0,NULL,NULL),
	(46,31,'38d90cdad52d82a1cd5dafc63e8daf6acc1c58c2f1cecdffb8c9ed10f3265836',NULL,0,0,NULL,NULL),
	(47,31,'446da90be39403f171bdd9eb5cd05adafd3055cb782455603abf7b641538740e',NULL,0,0,NULL,NULL),
	(48,31,'f16f2a7514048fb6c231812e6f295a8be5be9e7b622299cf519c10ae24f0b0a3',NULL,0,0,NULL,NULL),
	(49,31,'28ad1e69889616c944e37c51f916aa630c94e3931699f470ee850df5c1bcbf89',NULL,0,0,NULL,NULL),
	(50,31,'5d7d60a206618128a01da2eb41fbbe3efae01c6ea56c0e4431d01935d8d16644',NULL,0,0,NULL,NULL),
	(51,31,'789242c8dc5e4ea35e992374f5ed678cf2a088453eb0751184ef0d15358d0f76',NULL,0,0,NULL,NULL),
	(52,31,'b93636b2cb03767b36c634e6c62748257ba10779eb983863437a6995a3cf978d',NULL,0,0,NULL,NULL),
	(53,31,'adbbab26b1b46f80f8a3cedfe646eb09982b850b127ec720cc2aa9f11ac4feb7',NULL,0,0,NULL,NULL),
	(54,31,'7456a5c1591a6be6ccc4b53c8da21b2ad741dd3c39cde339d2cc342fe207578e',NULL,0,0,NULL,NULL),
	(55,31,'f1f75bde0cad19a61c16d9ca9fcb28b222679a1acc7b467c3a93a36acc432fb8',NULL,0,0,NULL,NULL),
	(56,32,'81bc3d528f3f3f5c7357adb4589e35723394e7a941f1983f70cbbf23c0dae5be',NULL,0,0,NULL,NULL),
	(57,32,'09375838b3e9518d8e65f8bfecee73e746d9758ab0f07d2842a649404b6327d6',NULL,0,0,NULL,NULL),
	(58,31,'31e99b3ba9b6ae20f5450cf54bfc4775a53b45c4575e834e34aeda85d256e298',NULL,0,0,NULL,NULL),
	(59,31,'4226097c24b5b042fad3866792d33cadac6364acb6080597f20cd80932c4d49e',NULL,0,0,NULL,NULL),
	(60,31,'c21b8a0eb978923209dec8fa134e3d91a61da2ec61c34019b80b29179f0cdd16',NULL,0,0,NULL,NULL),
	(61,31,'7fb1a28b3b9f9efee412880c495615c66e045f14f8249afe996c2e830fce7705',NULL,0,0,NULL,NULL),
	(62,31,'0808a8c762427286a1d45bc5a6fceeb10807367c0bca3c3e2b49a4a858933d74',NULL,0,0,NULL,NULL),
	(63,31,'feb1c3828a179d4d21195561cc1e6af2b30d9bf641c3554ee220cf86f5228b6e',NULL,0,0,NULL,NULL),
	(64,31,'e5bd3a879d5c3fb77d97eeeab48b772057e3f356d4053efb396262da99f300b2',NULL,0,0,NULL,NULL),
	(65,31,'749a93e9c02171d0d287257a87c2b197b53672cf6192c999ffbbd83f94829950',NULL,0,0,NULL,NULL),
	(66,31,'d8469ad0a136f3ec77a0e4c7dbe96e82952ab0c711e329a4670f82ff5178aa4d',NULL,0,0,NULL,NULL),
	(67,31,'9d5de2b5fcdaf8783f8c542c96218b2223c61bd8bcb33a2eed1f034509c24005',NULL,0,0,NULL,NULL),
	(68,31,'a876c4375aedd24c02c22d1522d13d75070e3c67ebdf9e388ed19c37fc878345',NULL,0,0,NULL,NULL),
	(69,31,'679459209aee791f4697208a5a5fdf8a250fa511b0f978a6c354c46a597c9547',NULL,0,0,NULL,NULL),
	(70,31,'c967b3e25efd2958f34b42e088420387f273d5e0588a04ee48f42069d2b340f9',NULL,0,0,NULL,NULL),
	(71,31,'c2deda20f708d65b29a6424319fd6119831b22ae1eb7c084fbb163a5df60bc9f',NULL,0,0,NULL,NULL),
	(72,31,'720bc5bd03f0d5de53c935cee7ddd850d703e0abc7b725c1accf4e90f5911c8a',NULL,0,0,NULL,NULL),
	(73,31,'5994aa6b8361fefd7418a29c78bb027ae6bac9629d7f689cabfa7a286279158b',NULL,0,0,NULL,NULL),
	(74,31,'42a1cd992a0d71f17cba362b5cad6594df8aa48a387b0014d9433ea72ba62e1f',NULL,0,0,NULL,NULL),
	(75,31,'e0f5c4c0fe43c34ac5c6c7e8b3a385c6c4e0510a7aef9c40b1c33236f3476704',NULL,0,0,NULL,NULL),
	(76,31,'364f86d9684d5cdd5ee6bf1c72d25514bedbe95c7e62760a3f20f26a3149d8f3',NULL,0,0,NULL,NULL),
	(77,31,'764d4205190233b3436e3397bb2e0cf120f8f333827ef0a4dcc146067a5ba919',NULL,0,0,NULL,NULL),
	(78,31,'7266e43af3c1f436f402cb1bc327817009987081b5b05d98febc264003f95ea2',NULL,0,0,NULL,NULL),
	(79,31,'52b04dc0c66b02a82f09374248785ffea7cb3a2cd6d54381dfffad2c368fcc60',NULL,0,0,NULL,NULL),
	(80,31,'eaf45f4c0a9a5ef4d7f69d20b16b1912eaaaba5bc55561d1601227b2e41be95b',NULL,0,0,NULL,NULL),
	(81,31,'39ff397dcc79f6b6e7d0c0339e27c474dfc45abc6254e10560ff9729281ed03a',NULL,0,0,NULL,NULL),
	(82,31,'2f0922156711d5e91334f9089a7d122a87bcd9935c2d3d7a4ef2ccf4d18407b1',NULL,0,0,NULL,NULL),
	(83,31,'c55940952242108c6dc90d64e9849f36ac99c2e3769c6dca55264214741b0a2c',NULL,0,0,NULL,NULL),
	(84,31,'f2cabb251009e1317a5f6ef400d1eee78c65d46c02f03b38c9d69f663e4804a3',NULL,0,0,NULL,NULL),
	(85,31,'9862a2afd85b1e1897482bfc625e91ebccdc78e0c720c1df5037ae13fa5fcf60',NULL,0,0,NULL,NULL),
	(86,31,'b3ab00824279c1daab6b626322d686d51465df8c58a4d3672794a9b107f877eb',NULL,0,0,NULL,NULL),
	(87,31,'3aa3510b01ed1d57a1bf7361433c39d20bd32c22f76632ad652c7bd2a1a03bef',NULL,0,0,NULL,NULL),
	(88,31,'f34b016b7df28bba1a99366149c83d4eaaca3b3a373a0afb0f476b85a638deff',NULL,0,0,NULL,NULL),
	(89,31,'81532ccdcf446d86ab48118992f7b91483973b36200b0d83d9b249befc2583da',NULL,0,0,NULL,NULL),
	(90,32,'37e872f0dbf53daafb4fd58f616b2036b76121f86d84589ef6be2aef30fffeb8',NULL,0,0,NULL,NULL),
	(91,31,'95c082133bc834c598bbea028cde17211abe4e9324987f6515747f92022407bf',NULL,0,0,NULL,NULL),
	(92,31,'da4f966c75926b270221835889cd47ba338bd7100b9e03e4b27aa12bd7f611e9',NULL,0,0,NULL,NULL),
	(93,31,'6996d165c7444afe9510b3900b5aa69880681d239ddcb904d52728330174f5ea',NULL,0,0,NULL,NULL),
	(94,31,'fb380ad0c093995c42d6ed8d6d90259b4b8658f0834a819f657aaacff574176a',NULL,0,0,NULL,NULL),
	(95,31,'170036d565ba537327ef5226e1db957f9dd4543ece251020d08785a28ea5091b',NULL,0,0,NULL,NULL),
	(96,31,'6ff868da5356770fb88c853fc080a185cf5e8c674d38b9bd67a076117fdcd9e4',NULL,0,0,NULL,NULL),
	(97,31,'8caf7b246fad1912a4d9738834aadd46afa6d9f945c47520cea5d95aa25df9d4',NULL,0,0,NULL,NULL),
	(98,31,'04a9a22be8b9ebb1592e58fc350ca50d9cedc7c714fff43c65c37f033cd7ad9c',NULL,0,0,NULL,NULL),
	(99,31,'cf35fa60e18f2c06557f42019120e72a813fcceea4b9b6d45a6938a13e3b2cf7',NULL,0,0,NULL,NULL),
	(100,31,'0b7e0e65b71bf2e461d2a020420490a475a87055ac9e6f1741cadb15240affa1',NULL,0,0,NULL,NULL),
	(101,31,'cd7bc6db4d7a7523f78bccfbf90e1dcd18433cb5ef45ffb2832ddaaf78160d07',NULL,0,0,NULL,NULL),
	(102,31,'c1867f7f5e5670d03a01e2f5a6cf30288a77f8d87eb6f599a4fa646be66a4087',NULL,0,0,NULL,NULL),
	(103,31,'07311d35f946c65e1bc19e0e58e05b771eab3c99ae23ca7d259ed7de6baa733d',NULL,0,0,NULL,NULL),
	(104,31,'a9684841a2a4f2e66ee686a88c67b5581a1da480daefd14608b7069c18391d52',NULL,0,0,NULL,NULL),
	(105,31,'5faba2be7c6d15f6a5d4e3ad466ff3a8ab3e67b37da449df685d2159bfd48eb6',NULL,0,0,NULL,NULL),
	(106,31,'018f9ad3fba90b134e7d5dc1fc549168ff69f7b2db377828d9821c6146f672e3',NULL,0,0,NULL,NULL),
	(107,31,'37ca2dfa96b0d031019f5c5c6c4bacfa7b253640052482b0970760c3eda722f6',NULL,0,0,NULL,NULL),
	(108,31,'7e0214364e73ce899f3d5c1737ecea46aa2e4422a26d5ed14ed58691c5f90c3f',NULL,0,0,NULL,NULL),
	(109,31,'44160fe2d1b388f540de41b46fea1d5e025521bb5a43e5aa81bb1bd131135481',NULL,0,0,NULL,NULL),
	(110,31,'598bfa1606491dc76ec8ad6f022bf3b3318184bf6659fb56709f34d880e59223',NULL,0,0,NULL,NULL),
	(111,31,'2a5b87ca12c319548ac451e5d36c4a27b4556e5648c45f74bb3acc88405c000c',NULL,0,0,NULL,NULL),
	(112,31,'a4b4f3ae430a28731382325dd50a637b4fb67e5a43894e2f6b4ac14ceb621fdb',NULL,0,0,NULL,NULL),
	(113,31,'6fae8c9bcf30b5979af67a45134b03098bb59ba9b41abc29b0f74c25d2c00940',NULL,0,0,NULL,NULL),
	(114,31,'b8596982bb0d9d22393d150518dd2354d16a8dbd6669424d900bbed8523e1607',NULL,0,0,NULL,NULL),
	(115,31,'d33a54881ac9fa5eaca225546fac0f7d1c519be1428e4962ef85e89cccb83b0c',NULL,0,0,NULL,NULL),
	(116,31,'5bcb1ea8a805cf0003ff67f81e308c0a57ec63d1a9f7d936b4ff2040f7e7db83',NULL,0,0,NULL,NULL),
	(117,31,'55b990206019f54a3c174ff8fefae7d38fc86142f01b69557ef6e82f08efd5fd',NULL,0,0,NULL,NULL),
	(118,31,'977c0400aed581aaf54b14db441c9b1a3c41cfb07a9052162a59f41c744c62f5',NULL,0,0,NULL,NULL),
	(119,31,'140b08ba2bc34a51e0b40b5fd5b7ef82caf492cabaa3dea27cb6fab6e4be74c1',NULL,0,0,NULL,NULL),
	(120,31,'7e19b728b6dc1127de3d7c9a66ff7ed7c828c53e8ff50a117c9f287d0d98081b',NULL,0,0,NULL,NULL),
	(121,31,'6edf47b6019a312fb3ea4efca3405ea6c9fc8b9b2b0a4bc5062d50e86fbe500a',NULL,0,0,NULL,NULL),
	(122,31,'83225d19bf76c10b663ea241d7d4a2b718d8f594855b6b87e04dd3a6313908a4',NULL,0,0,NULL,NULL),
	(123,31,'0eb0e34917ba5bf874868e159e99cf95ba1387dcc7a7309664e40f8da30b8ec5',NULL,0,0,NULL,NULL),
	(124,31,'ad73583ed7ed23f05d1f9ed67f6405786ea7f847caba6d632484ad9ab655e11d',NULL,0,0,NULL,NULL),
	(125,31,'2e8471faa00c6997c9fd6b013f86239b4d0722c0400d11662ddd93c058f922f5',NULL,0,0,NULL,NULL),
	(126,31,'156538e4c8e1af275a2af647c16649676152329e4e51d4c933c49b5c0e7189ea',NULL,0,0,NULL,NULL),
	(127,31,'f3563dfcf28475d7da2cceba4402ac402cce6d6365c5375ce4e9efea865cbac2',NULL,0,0,NULL,NULL),
	(128,31,'ff1d3be132678b2c7af93ac0dd8bc2d5773530f524c41e3eb3ee4f81eb13fbaf',NULL,0,0,NULL,NULL);

/*!40000 ALTER TABLE `s_api_keys` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table s_dropdown
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_dropdown`;

CREATE TABLE `s_dropdown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  `dd_field_name` varchar(255) DEFAULT NULL,
  `dd_field_id` varchar(255) DEFAULT NULL,
  `dd_field_subname` varchar(255) DEFAULT NULL,
  `dd_title` varchar(100) DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_dropdown` WRITE;
/*!40000 ALTER TABLE `s_dropdown` DISABLE KEYS */;

INSERT INTO `s_dropdown` (`id`, `table_name`, `dd_field_name`, `dd_field_id`, `dd_field_subname`, `dd_title`, `json_value`)
VALUES
	(1,'s_usergroup','name','id',NULL,'dd_usergroup',NULL),
	(2,NULL,NULL,NULL,NULL,'dd_ya_tidak',X'7B2231223A227961222C2230223A22746964616B227D'),
	(3,NULL,NULL,NULL,NULL,'dd_year',X'7B2232303235223A2232303235222C2232303236223A2232303236222C2232303237223A2232303237227D'),
	(4,'m_productcategory','productcategory_name','productcategory_id',NULL,'dd_category',NULL),
	(8,NULL,NULL,NULL,NULL,'dd_gender',X'7B2250223A22506572656D7075616E222C224C223A224C616B692D6C616B69227D'),
	(13,NULL,NULL,NULL,NULL,'dd_month',X'7B2231223A224A616E75617269222C2232223A224665627275617269222C2233223A224D61726574222C2234223A22417072696C222C2235223A224D6569222C2236223A224A756E69222C2237223A224A756C69222C2238223A2241677573747573222C2239223A2253657074656D626572222C223130223A224F6B746F626572222C223131223A224E6F70656D626572222C223132223A22446573656D626572227D'),
	(14,NULL,NULL,NULL,NULL,'dd_status_transaksi',X'7B227461676968616E223A227461676968616E222C226C756E6173223A226C756E6173227D'),
	(15,'m_company','name','id',NULL,'dd_company',NULL),
	(16,NULL,NULL,NULL,NULL,'dd_role_user_distributor',X'7B2234223A226167656E227D'),
	(17,'m_retail','name','id',NULL,'dd_retail',NULL),
	(18,NULL,NULL,NULL,NULL,'dd_jurnal_type',X'7B22696E223A22696E222C226F7574223A226F7574222C2261646A223A2261646A7573746D656E74227D'),
	(19,'t_product','name','id',NULL,'dd_product',NULL),
	(20,'m_warehouse','name','id',NULL,'dd_warehouse',NULL),
	(21,'s_user','email','id',NULL,'dd_user_agen',NULL),
	(22,NULL,NULL,NULL,NULL,'dd_status_stock',X'7B226472616674223A226472616674222C226469746572696D61223A226469746572696D61227D');

/*!40000 ALTER TABLE `s_dropdown` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table s_form
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_form`;

CREATE TABLE `s_form` (
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_form` WRITE;
/*!40000 ALTER TABLE `s_form` DISABLE KEYS */;

INSERT INTO `s_form` (`id`, `form_name`, `form_table`, `parent_form_id`, `parent_form_foreign_key`, `is_soft_delete`, `js_addon`, `datatable_button_addon`, `fun_is_editable`, `col_sort_name`, `col_sort_type`, `table_type`, `slug`, `is_import`, `form_table_read`)
VALUES
	(1,'menu','s_menu',NULL,'menu_parent',0,NULL,NULL,NULL,'menu_order','asc','tree','menu',0,NULL),
	(2,'menu akses','s_akses',1,'menu_id',0,NULL,NULL,NULL,NULL,NULL,'datatable','akses',0,NULL),
	(3,'user','s_user',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','user',0,''),
	(28,'Config','m_config',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','m_config',0,''),
	(29,'media','t_media',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','media',0,''),
	(30,'Master Product','t_product',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','t_product_admin',0,'t_product'),
	(31,'Data Toko Retail','m_retail',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'datatable','m_retail',0,'m_retail'),
	(32,'Data Company','m_company',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'datatable','m_company',0,'m_company'),
	(33,'[trx] Detil Transaksi Agen/Sales','jurnal_agen_sales',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','jurnal_agen_sales',0,'v_agen_sales_2_product'),
	(35,'Warehouse','m_warehouse',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'datatable','m_warehouse',0,'m_warehouse'),
	(36,'Stock di Warehouse','stock_warehouse',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','stock_warehouse',0,'stock_warehouse'),
	(37,'Transaksi Warehouse','jurnal_stock',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','jurnal_stock',0,'jurnal_stock'),
	(39,'Stock di Agen','stock_agen',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','stock_agen',0,'v_product_in_agen'),
	(40,'sys-user','s_user',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'datatable','sys-s_user',0,'s_user'),
	(41,'Absen Datang','t_absen',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','t_absen',0,'t_absen'),
	(42,'Absen Pulang','t_absen_out',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','t_absen_out',0,'t_absen_out'),
	(43,'Kunjungan','jurnal_visitasi',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','jurnal_visitasi',0,'jurnal_visitasi'),
	(44,'Penjualan Agen','jurnal_agen',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','jurnal_agen',0,'jurnal_agen'),
	(45,'Inquiry Agen','jurnal_inquiry_agen',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','jurnal_inquiry_agen',0,'jurnal_inquiry_agen'),
	(46,'Jurnal Inquiry Detail','jurnal_inquiry_detail',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','jurnal_inquiry_detail',0,'jurnal_inquiry_detail'),
	(47,'MProfil','s_user',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','s_user',0,'s_user');

/*!40000 ALTER TABLE `s_form` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table s_form_filter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_form_filter`;

CREATE TABLE `s_form_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `dropdown_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lnk_m_form_m_form_filter` (`form_id`) USING BTREE,
  CONSTRAINT `s_form_filter_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `s_form` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;



# Dump of table s_form_param
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_form_param`;

CREATE TABLE `s_form_param` (
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
  KEY `lnk_m_form_m_form_param` (`form_id`) USING BTREE,
  CONSTRAINT `s_form_param_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `s_form` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_form_param` WRITE;
/*!40000 ALTER TABLE `s_form_param` DISABLE KEYS */;

INSERT INTO `s_form_param` (`id`, `label_name`, `form_id`, `column_name`, `type`, `order_no`, `validation`, `table_ref`, `info`, `active`, `column_datatable`, `column_rest`, `required`, `path_upload`, `col_md`, `readonly`, `default_value`, `new_form_id`, `is_unique`)
VALUES
	(1,'menu nama',1,'menu_nama','text',NULL,NULL,'',NULL,1,1,1,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(2,'menu url',1,'menu_url','text',NULL,NULL,'',NULL,1,NULL,1,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(3,'menu icon',1,'menu_icon','text',NULL,NULL,'',NULL,1,NULL,1,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(4,'menu active',1,'menu_active','select',NULL,NULL,'{\"y\":\"ya\",\"t\":\"tidak\"}',NULL,1,NULL,1,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(5,'menu kode',1,'menu_kode','text',NULL,NULL,'',NULL,1,NULL,1,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(6,'usergroup',2,'usergroup_id','select_ajax',NULL,NULL,'dd_usergroup',NULL,1,1,1,0,NULL,'col-md-6',0,NULL,NULL,0),
	(7,'akses',2,'akses_code','checkbox',NULL,NULL,'{\"xread\":\"read\",\"xcreate\":\"create\",\"xupdate\":\"update\",\"xdelete\":\"delete\"}',NULL,1,1,1,0,NULL,'col-md-6',0,NULL,NULL,0),
	(8,'usergroup',3,'usergroup_id','select_ajax',3,NULL,'dd_usergroup',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(9,'password',3,'password','password',2,NULL,'',NULL,1,NULL,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(10,'active',3,'active','select',4,NULL,'dd_ya_tidak',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(19,'username',3,'email','text',1,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(45,'karyawan',3,'employee_id','select_ajax',NULL,NULL,'',NULL,NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(133,'nama',28,'config_name','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(134,'value',28,'config_value','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(137,'media file',29,'media_file','file',NULL,NULL,'',NULL,1,1,1,NULL,'uploads/media/','col-md-6',0,NULL,NULL,NULL),
	(138,'media title',29,'media_title','text',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(139,'media url',29,'media_url','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(144,'name',31,'name','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(145,'address',31,'address','textarea',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(146,'latitude',31,'location_lat','latlong',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(147,'longitude',31,'location_long','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(148,'picture',31,'picture','img',NULL,NULL,'',NULL,1,NULL,1,NULL,'uploads/retail/','col-md-6',0,NULL,NULL,NULL),
	(149,'name',32,'name','text',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(150,'address',32,'address','textarea',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(151,'phone',32,'phone','text',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(152,'logo',32,'logo','img',NULL,NULL,'',NULL,1,NULL,1,NULL,'uploads/company/','col-md-6',0,NULL,NULL,NULL),
	(167,'name',30,'name','text',1,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(168,'picture',30,'picture','img',2,NULL,'',NULL,1,NULL,1,NULL,'uploads/product/','col-md-6',0,NULL,NULL,NULL),
	(169,'price sale',30,'price_sale','numeric',4,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(170,'price purchase',30,'price_purchase','numeric',3,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(171,'name',35,'name','text',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(172,'address',35,'address','text',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(173,'phone',35,'phone','text',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(174,'logo',35,'logo','img',NULL,NULL,'',NULL,1,NULL,1,NULL,'uploads/warehouse/','col-md-6',0,NULL,NULL,NULL),
	(175,'latitude',35,'latitude','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(176,'longitude',35,'longitude','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(177,'product id',36,'product_id','select_ajax',3,NULL,'dd_product',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(178,'company id',36,'company_id','select_ajax',1,NULL,'dd_company',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(179,'warehouse id',36,'warehouse_id','select_ajax',2,NULL,'dd_warehouse',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(180,'count',36,'count','numeric',4,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(181,'date',37,'date','date',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(182,'warehouse id',37,'warehouse_id','select_ajax',NULL,NULL,'dd_warehouse',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(183,'company id',37,'company_id','select_ajax',NULL,NULL,'dd_company',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(184,'product id',37,'product_id','select_ajax',NULL,NULL,'dd_product',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(185,'count',37,'count','numeric',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(186,'price',37,'price','numeric',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(187,'subtotal',37,'subtotal','numeric',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(188,'status',37,'status','select',NULL,NULL,'dd_jurnal_type',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(194,'product id',39,'product_id','select_ajax',3,NULL,'dd_product',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(195,'agen id',39,'agen_id','select_ajax',2,NULL,'dd_user_agen',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(196,'count',39,'count','int',4,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(197,'company id',39,'company_id','select_ajax',1,NULL,'dd_company',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(198,'usergroup id',40,'usergroup_id','select_ajax',NULL,NULL,'dd_usergroup',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(199,'ip address',40,'ip_address','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(200,'username',40,'username','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(201,'password',40,'password','text',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(202,'email',40,'email','text',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(203,'activation code',40,'activation_code','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(204,'forgotten password code',40,'forgotten_password_code','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(205,'forgotten password time',40,'forgotten_password_time','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(206,'remember code',40,'remember_code','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(207,'active',40,'active','text',NULL,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(208,'full name',40,'full_name','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(209,'company id',40,'company_id','select_ajax',NULL,NULL,'dd_company',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(210,'phone',40,'phone','numeric',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(211,'last login',40,'last_login','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(212,'foto',40,'foto','img',NULL,NULL,'',NULL,1,1,1,NULL,'uploads/user_profile/','col-md-6',0,NULL,NULL,NULL),
	(213,'employee id',40,'employee_id','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(214,'assign lat',40,'assign_lat','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(215,'assign long',40,'assign_long','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(216,'absen date',41,'absen_date','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(217,'absen user id',41,'absen_user_id','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(218,'absen date time',41,'absen_date_time','datetime',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(219,'absen lattitude',41,'absen_lattitude','latitude',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(220,'absen longitude',41,'absen_longitude','longitude',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(221,'absen foto',41,'absen_foto','img',NULL,NULL,'',NULL,1,1,1,NULL,'uploads/absen_datang/','col-md-6',0,NULL,NULL,NULL),
	(222,'absen status',41,'absen_status','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(223,'absen date',42,'absen_date','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(224,'absen user id',42,'absen_user_id','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(225,'absen date time',42,'absen_date_time','datetime',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(226,'absen lattitude',42,'absen_lattitude','latitude',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(227,'absen longitude',42,'absen_longitude','longitude',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(228,'absen foto',42,'absen_foto','img',NULL,NULL,'',NULL,1,1,1,NULL,'uploads/absen_pulang/','col-md-6',0,NULL,NULL,NULL),
	(229,'absen status',42,'absen_status','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(230,'agen id (diisi jika out ke agen)',37,'agen_id','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(231,'price agen',30,'price_agen','numeric',5,NULL,'',NULL,1,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(232,'company id',30,'company_id','select_ajax',6,NULL,'dd_company',NULL,NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(234,'latitude',32,'latitude','latlong',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(235,'agen id',43,'agen_id','select_ajax',1,NULL,'dd_user_agen',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(236,'created at',43,'created_at','datetime',5,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(237,'latlong',43,'latlong','latlong',4,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(238,'photo',43,'photo','img',3,NULL,'',NULL,1,1,1,NULL,'uploads/jurnal_agen/','col-md-6',0,NULL,NULL,NULL),
	(239,'retail id',43,'retail_id','select_ajax',2,NULL,'dd_retail',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(241,'is new',43,'is_new','text',NULL,NULL,'',NULL,1,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(242,'total price',43,'total_price','int',NULL,NULL,'',NULL,1,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(244,'price sale 2',30,'price_sale2','numeric',7,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(245,'price sale min 2',30,'price_sale_min2','numeric',8,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(246,'price sale 3',30,'price_sale3','numeric',9,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(247,'price sale min 3',30,'price_sale_min3','numeric',10,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(248,'phone',31,'phone','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(251,'created by',43,'created_by','select_ajax',NULL,NULL,'dd_user_agen',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(261,'agen id',33,'agen_id','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(262,'product id',33,'product_id','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(263,'retail id',33,'retail_id','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(264,'count',33,'count','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(265,'price',33,'price','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(266,'subtotal',33,'subtotal','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(267,'status',33,'status','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(268,'created by',33,'created_by','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(269,'created at',33,'created_at','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(270,'company id',33,'company_id','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(271,'jurnal id',33,'jurnal_id','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(272,'product name',33,'product_name','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(273,'company id',44,'company_id','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(274,'created at',44,'created_at','date',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(275,'created by',44,'created_by','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(276,'retail id',44,'retail_id','select_ajax',NULL,NULL,'dd_retail',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(277,'photo',44,'photo','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(278,'agen id',44,'agen_id','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(279,'latlong',44,'latlong','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(280,'is new',44,'is_new','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(281,'total price',44,'total_price','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(282,'picture',33,'picture','img',NULL,NULL,'',NULL,1,1,1,NULL,'uploads/product/','col-md-6',0,NULL,NULL,NULL),
	(283,'created by',31,'created_by','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(284,'created at',45,'created_at','date',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(285,'created by',45,'created_by','select_ajax',NULL,NULL,'dd_role_user_distributor',NULL,NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(286,'description',45,'description','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(287,'agen id',45,'agen_id','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(288,'status',45,'status','select_ajax',NULL,NULL,'dd_status_stock',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(289,'total price',45,'total_price','text',NULL,NULL,'',NULL,NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(290,'product id',46,'product_id','select_ajax',1,NULL,'dd_product',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(291,'count',46,'count','numeric',2,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(292,'price',46,'price','numeric',NULL,NULL,'',NULL,NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(293,'subtotal',46,'subtotal','numeric',NULL,NULL,'',NULL,NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(294,'status',46,'status','text',NULL,NULL,'',NULL,NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(295,'created at',46,'created_at','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(296,'product name',46,'product_name','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(297,'jurnal id',46,'jurnal_id','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(298,'product name',39,'product_name','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(299,'price sale',39,'price_sale','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(300,'price sale2',39,'price_sale2','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(301,'price sale3',39,'price_sale3','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(302,'price sale min2',39,'price_sale_min2','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(303,'price sale min3',39,'price_sale_min3','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(304,'picture',39,'picture','text',NULL,NULL,'',NULL,NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(305,'username',47,'username','text',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(306,'password',47,'password','password',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(307,'email',47,'email','text',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(308,'full name',47,'full_name','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(309,'phone',47,'phone','text',NULL,NULL,'',NULL,1,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(310,'foto',47,'foto','text',NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,'','col-md-6',0,NULL,NULL,NULL);

/*!40000 ALTER TABLE `s_form_param` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table s_form_parent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_form_parent`;

CREATE TABLE `s_form_parent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_parent_id` int(11) NOT NULL,
  `form_child_id` int(11) NOT NULL,
  `form_child_fk` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_form_parent` WRITE;
/*!40000 ALTER TABLE `s_form_parent` DISABLE KEYS */;

INSERT INTO `s_form_parent` (`id`, `form_parent_id`, `form_child_id`, `form_child_fk`)
VALUES
	(19,1,2,'menu_id'),
	(20,44,33,'jurnal_id'),
	(21,45,46,'jurnal_id');

/*!40000 ALTER TABLE `s_form_parent` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table s_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_menu`;

CREATE TABLE `s_menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_menu` WRITE;
/*!40000 ALTER TABLE `s_menu` DISABLE KEYS */;

INSERT INTO `s_menu` (`menu_id`, `menu_nama`, `menu_ket`, `menu_url`, `menu_icon`, `menu_parent`, `menu_active`, `menu_kode`, `menu_order`, `updated_by`, `updated_at`, `created_by`, `created_at`)
VALUES
	(1,'[< sys >]',NULL,'formx/formx/table/menu','fa fa-list',0,'y','form_1',0,NULL,NULL,NULL,NULL),
	(2,'sys-menu',NULL,'formx/formx/table/menu','',1,'y','form_2',NULL,NULL,NULL,NULL,NULL),
	(3,'user',NULL,'formx/formx/table/user','fa fa-user',10,'y','form_3',11,NULL,NULL,NULL,NULL),
	(10,'Master',NULL,'','',0,'y','',1,NULL,NULL,NULL,NULL),
	(26,'Laporan',NULL,'','',0,'y','',4,NULL,NULL,NULL,NULL),
	(32,'Presensi Agen/Employee',NULL,'laporan/laporan/tunggakan','fa fa-table',26,'y','',0,NULL,NULL,NULL,NULL),
	(37,'Data Toko Retail',NULL,'formx/formx/table/31','fa fa-home',10,'y','form_31',0,NULL,NULL,NULL,NULL),
	(38,'Master Product',NULL,'formx/formx/table/30',NULL,10,'y','form_30',13,NULL,NULL,NULL,NULL),
	(39,'Data Company',NULL,'formx/formx/table/32','',1,'y','form_32',0,NULL,NULL,NULL,NULL),
	(40,'Jurnal',NULL,'','fa fa-chart',0,'y','',2,NULL,NULL,NULL,NULL),
	(41,'sys-form generator',NULL,'formx_gen/','',1,'y','',NULL,NULL,NULL,NULL,NULL),
	(44,'Warehouse',NULL,'formx/formx/table/35',NULL,10,'y','form_35',12,NULL,NULL,NULL,NULL),
	(45,'Stok di Warehouse',NULL,'formx/formx/table/36','',46,'y','form_36',0,NULL,NULL,NULL,NULL),
	(46,'Stock',NULL,'','',0,'y','',3,NULL,NULL,NULL,NULL),
	(47,'Transaksi Warehouse',NULL,'formx/formx/table/37',NULL,40,'y','form_37',21,NULL,NULL,NULL,NULL),
	(49,'Stock di Agen',NULL,'formx/formx/table/39',NULL,46,'y','form_39',0,NULL,NULL,NULL,NULL),
	(50,'sys-user',NULL,'formx/formx/table/40',NULL,1,'y','form_40',0,NULL,NULL,NULL,NULL),
	(51,'Kunjungan',NULL,'formx/formx/table/43','',40,'y','form_43',24,1,'2025-08-21 13:31:39',NULL,NULL),
	(52,'Penjualan Agen',NULL,'formx/formx/table/44',NULL,40,'y','form_44',23,NULL,NULL,NULL,NULL),
	(53,'Inquiry Agen',NULL,'formx/formx/table/45',NULL,40,'y','form_45',22,NULL,NULL,NULL,NULL),
	(54,'Jurnal Inquiry Detail',NULL,'formx/formx/table/46','',0,'t','form_46',NULL,1,'2025-09-06 06:21:19',NULL,NULL),
	(55,'[< REST-FORM >]',NULL,'','',0,'y','',NULL,NULL,NULL,1,'2025-09-18 10:19:16'),
	(56,'MProfil',NULL,'formx/formx/table/47',NULL,55,'y','form_47',0,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `s_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table s_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_user`;

CREATE TABLE `s_user` (
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
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `assign_lat` decimal(10,0) DEFAULT NULL,
  `assign_long` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lnk_m_usergroup_m_user` (`usergroup_id`) USING BTREE,
  CONSTRAINT `s_user_ibfk_1` FOREIGN KEY (`usergroup_id`) REFERENCES `s_usergroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_user` WRITE;
/*!40000 ALTER TABLE `s_user` DISABLE KEYS */;

INSERT INTO `s_user` (`id`, `usergroup_id`, `ip_address`, `username`, `password`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `active`, `full_name`, `company_id`, `phone`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `last_login`, `foto`, `employee_id`, `assign_lat`, `assign_long`)
VALUES
	(1,1,NULL,'admin','$2y$10$2Ln2x4QpuA/N7mQLKpdmJuBLLbfNMCt1oW8YNWLPet6qvaS62Q6UW','owner',NULL,NULL,NULL,NULL,1,'Administrator',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(29,3,NULL,NULL,'$2y$10$LHiseKYmK88tT9IvD/yhbO.kVmBnBpaHfunON3e8xfnCK0TQQfKHS','distributor',NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(30,2,NULL,NULL,'$2y$10$zbdzA25JoytWAlHkeCHfr.Mo.JclvxCGIxcZAIbnIyRcG4SawzK9S','admin',NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(31,4,NULL,NULL,'$2y$10$cb3Sj5K2HSKeRIgs3V5vWOmjNjQQmmPyFQ2NDkffQA2p0RjrO9EMe','sales1',NULL,NULL,NULL,NULL,1,'Adi Dwif',1,'123','2025-09-18 15:11:52','2025-08-13 14:06:34',NULL,NULL,30,NULL,NULL,NULL,NULL,NULL),
	(32,4,NULL,NULL,'$2y$10$QvPyq2rfTxQoC8mQmgZI3e/YSf2AnoiS6GTeok2OBd2zD9GsmulRa','sales2',NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(33,4,NULL,NULL,'$2y$10$X1KIxL7UQNH5HIn540jpaOKk7Ba0UwthBH7tUoswDIPt4Nt7ThZcK','sales1.2',NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(34,4,NULL,NULL,'$2y$10$mDRR77qWSpgkIhgVI4g/6OQEo07p9fyaPDEeIsvfGI2j/2MfGnt3i','sales1.2',NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(35,3,NULL,NULL,'$2y$10$3dG1SReo5weyR1/ILAgrJO4XAVY4Ksi3Yz1KCuAKvlEpD5OXW4nKK','distributor2',NULL,NULL,NULL,NULL,1,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(37,4,NULL,NULL,'$2y$10$dTrwvPrfLFmg9GWKPk0pjuDNndRqD96RlNw1En6MaVKTGitesfYTW','sales2.1',NULL,NULL,NULL,NULL,1,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `s_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table s_usergroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `s_usergroup`;

CREATE TABLE `s_usergroup` (
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

LOCK TABLES `s_usergroup` WRITE;
/*!40000 ALTER TABLE `s_usergroup` DISABLE KEYS */;

INSERT INTO `s_usergroup` (`id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `name`, `desc`)
VALUES
	(1,'2019-02-14 10:47:52',NULL,NULL,NULL,NULL,'1. owner','administrator'),
	(2,'2021-01-19 13:00:20',NULL,NULL,NULL,NULL,'2. admin',NULL),
	(3,'2021-01-19 13:00:20',NULL,NULL,NULL,NULL,'3. distributor',NULL),
	(4,'2021-01-19 13:00:20',NULL,NULL,NULL,NULL,'4. agen',NULL);

/*!40000 ALTER TABLE `s_usergroup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stock_agen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_agen`;

CREATE TABLE `stock_agen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `agen_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `stock_agen` WRITE;
/*!40000 ALTER TABLE `stock_agen` DISABLE KEYS */;

INSERT INTO `stock_agen` (`id`, `product_id`, `agen_id`, `count`, `created_at`, `created_by`, `updated_at`, `updated_by`, `company_id`)
VALUES
	(1,18,31,0,NULL,NULL,NULL,NULL,1),
	(2,1,31,0,NULL,NULL,NULL,NULL,1),
	(8,17,31,0,NULL,NULL,NULL,NULL,1),
	(9,1,32,35,NULL,NULL,NULL,NULL,1),
	(10,5,32,25,NULL,NULL,NULL,NULL,1),
	(11,8,31,9,NULL,NULL,NULL,NULL,1),
	(12,6,31,20,NULL,NULL,NULL,NULL,1),
	(13,11,31,0,NULL,NULL,NULL,NULL,1);

/*!40000 ALTER TABLE `stock_agen` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stock_warehouse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stock_warehouse`;

CREATE TABLE `stock_warehouse` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;



# Dump of table t_absen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_absen`;

CREATE TABLE `t_absen` (
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

LOCK TABLES `t_absen` WRITE;
/*!40000 ALTER TABLE `t_absen` DISABLE KEYS */;

INSERT INTO `t_absen` (`absen_id`, `absen_date`, `absen_user_id`, `absen_date_time`, `absen_lattitude`, `absen_longitude`, `absen_foto`, `absen_status`, `created_at`, `created_by`, `updated_at`, `updated_by`, `company_id`)
VALUES
	(1,NULL,NULL,NULL,'8198277','276183612786',NULL,NULL,'2025-05-22 13:04:09',30,NULL,NULL,1),
	(2,NULL,NULL,NULL,'8198277','276183612786',NULL,NULL,'2025-05-22 13:07:00',31,NULL,NULL,1),
	(3,NULL,NULL,NULL,'-7.0362147','113.6776251','scaled_fdf9b477-b065-4dd6-98c6-3165ad9f41b72016106875831080293.jpg',NULL,'2025-08-27 08:43:50',31,NULL,NULL,1),
	(4,NULL,NULL,NULL,'-7.036448','113.6777986','scaled_92404fcd-57ba-4a64-91be-46eba9a057401554453230687912757.jpg',NULL,'2025-08-27 08:45:14',31,NULL,NULL,1),
	(5,NULL,NULL,NULL,'-7.1555905','113.4976342','scaled_0ecafe13-bca8-47d9-88a1-8f1d51b3b2111801133352192916440.jpg',NULL,'2025-08-28 12:16:05',31,NULL,NULL,1),
	(6,NULL,NULL,NULL,'-7.1555914','113.497636','scaled_e575a9fa-03ff-4796-bba3-717b8d3b9e596621160543163029331.jpg',NULL,'2025-08-28 12:16:49',31,NULL,NULL,1),
	(7,NULL,NULL,NULL,'-7.0072893','113.8548493','scaled_6d544b09-f905-4e96-9e47-125ee32740757354689071788689442.jpg',NULL,'2025-09-02 15:28:12',31,NULL,NULL,1),
	(8,NULL,NULL,NULL,'-7.1614447','113.490717','scaled_2e4e5cdd-5edb-4c82-a5dd-8936c3454db26704038646819587092.jpg',NULL,'2025-09-03 02:43:30',31,NULL,NULL,1),
	(9,NULL,NULL,NULL,'-7.0446627','112.738181','scaled_6725922a-f876-40e1-a2aa-091fd28eecee7690762417942412238.jpg',NULL,'2025-09-03 03:30:30',31,NULL,NULL,1),
	(10,NULL,NULL,NULL,'37.4219983','-122.084','scaled_46b16fd9-cb75-42c6-a3de-8abf09a248613374376098949704113.jpg',NULL,'2025-09-03 10:57:55',31,NULL,NULL,1);

/*!40000 ALTER TABLE `t_absen` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_absen_out
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_absen_out`;

CREATE TABLE `t_absen_out` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

LOCK TABLES `t_absen_out` WRITE;
/*!40000 ALTER TABLE `t_absen_out` DISABLE KEYS */;

INSERT INTO `t_absen_out` (`absen_id`, `absen_date`, `absen_user_id`, `absen_date_time`, `absen_lattitude`, `absen_longitude`, `absen_foto`, `absen_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `company_id`)
VALUES
	(1,NULL,NULL,NULL,'8198277','276183612786',NULL,NULL,'2025-05-22 13:07:33',NULL,31,NULL,1),
	(2,NULL,NULL,NULL,'8198277','276183612786',NULL,NULL,'2025-05-22 13:07:34',NULL,31,NULL,1);

/*!40000 ALTER TABLE `t_absen_out` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_media`;

CREATE TABLE `t_media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_file` varchar(255) DEFAULT NULL,
  `media_title` varchar(255) DEFAULT NULL,
  `media_category` varchar(100) DEFAULT NULL,
  `media_url` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `t_media` WRITE;
/*!40000 ALTER TABLE `t_media` DISABLE KEYS */;

INSERT INTO `t_media` (`media_id`, `media_file`, `media_title`, `media_category`, `media_url`, `status`)
VALUES
	(1,'akte_lahir_akira.pdf','Akira',NULL,'',1),
	(2,'Undangan_Defect_List.docx','Video',NULL,'',2);

/*!40000 ALTER TABLE `t_media` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_product`;

CREATE TABLE `t_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `t_product` WRITE;
/*!40000 ALTER TABLE `t_product` DISABLE KEYS */;

INSERT INTO `t_product` (`id`, `name`, `picture`, `price_purchase`, `price_sale`, `price_sale2`, `price_sale_min2`, `price_sale3`, `price_sale_min3`, `price_agen`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`, `company_id`)
VALUES
	(1,'DJAVA HIJAU-(12)',NULL,6650,7800,NULL,NULL,NULL,NULL,7600,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(2,'DJAVA HIJAU-(16)',NULL,8300,9500,NULL,NULL,NULL,NULL,8500,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(3,'LENTERA-(16)',NULL,8300,9500,NULL,NULL,NULL,NULL,8500,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(4,'DJAVA MERAH-(12)',NULL,6650,7800,NULL,NULL,NULL,NULL,7600,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(5,'DJAVA PREMIUM GOLD-(12)',NULL,10500,11300,NULL,NULL,NULL,NULL,11100,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(6,'LONGSIZE-(12)',NULL,10000,11000,NULL,NULL,NULL,NULL,10800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(7,'OCHA-(12)',NULL,8100,9100,NULL,NULL,NULL,NULL,8900,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(8,'HK REEBORN-(12)',NULL,6600,7750,NULL,NULL,NULL,NULL,7550,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(9,'OCHA MANGO-(12)',NULL,8000,9000,NULL,NULL,NULL,NULL,8800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(10,'OCHA GUAVA-(12)',NULL,8000,9000,NULL,NULL,NULL,NULL,8800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(11,'OCHA FILTER-(12)',NULL,14500,15500,NULL,NULL,NULL,NULL,15300,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(12,'OCHA FILTER-(20)',NULL,24000,26000,NULL,NULL,NULL,NULL,24800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(13,'DJAVA FILTER-(12)',NULL,14500,15500,NULL,NULL,NULL,NULL,15300,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(14,'DJAVA FILTER-(20)',NULL,24000,25000,NULL,NULL,NULL,NULL,24800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(15,'LAKSAMANA-(12)',NULL,14500,15500,NULL,NULL,NULL,NULL,15300,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(16,'LAKSAMANA-(20)',NULL,24000,25000,NULL,NULL,NULL,NULL,24800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(17,'DJAVA MILD BLUE-(16)',NULL,22000,23000,NULL,NULL,NULL,NULL,22800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(18,'DJAVA FLAVOUR BLUEBERRY-(16)',NULL,23000,24000,NULL,NULL,NULL,NULL,23800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(19,'DJAVA FLAVOUR PINEAPPLE-(16)','think_lightbulb.jpg',23000,24000,NULL,NULL,NULL,NULL,23800,30,1,'2025-05-23 14:21:45','2025-08-30 08:57:44',NULL,1),
	(20,'KING DJAVA CLASSIC-(20)',NULL,24500,25500,NULL,NULL,NULL,NULL,25300,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(21,'KING DJAVA MENTHOL-(20)','156.jpg',25500,26500,22000,5,20000,10,26300,30,30,'2025-05-23 14:21:45','2025-08-13 15:00:54',NULL,1);

/*!40000 ALTER TABLE `t_product` ENABLE KEYS */;
UNLOCK TABLES;








# Dump of view v_kunjungan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `v_kunjungan`; DROP VIEW IF EXISTS `v_kunjungan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_kunjungan`
AS SELECT
   `jurnal_agen`.`id` AS `id`,
   `jurnal_agen`.`company_id` AS `company_id`,
   `jurnal_agen`.`created_at` AS `created_at`,
   `jurnal_agen`.`created_by` AS `created_by`,
   `jurnal_agen`.`updated_at` AS `updated_at`,
   `jurnal_agen`.`updated_by` AS `updated_by`,
   `jurnal_agen`.`retail_id` AS `retail_id`,
   `jurnal_agen`.`photo` AS `photo`,
   `jurnal_agen`.`agen_id` AS `agen_id`,
   `jurnal_agen`.`latlong` AS `latlong`,
   `jurnal_agen`.`is_new` AS `is_new`,
   `jurnal_agen`.`total_price` AS `total_price`
FROM `jurnal_agen` where `jurnal_agen`.`total_price` is null;

# Dump of view v_agen_sales_2_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `v_agen_sales_2_product`; DROP VIEW IF EXISTS `v_agen_sales_2_product`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_agen_sales_2_product`
AS SELECT
   `jurnal_agen_sales`.`id` AS `id`,
   `jurnal_agen_sales`.`agen_id` AS `agen_id`,
   `jurnal_agen_sales`.`product_id` AS `product_id`,
   `jurnal_agen_sales`.`retail_id` AS `retail_id`,
   `jurnal_agen_sales`.`count` AS `count`,
   `jurnal_agen_sales`.`price` AS `price`,
   `jurnal_agen_sales`.`subtotal` AS `subtotal`,
   `jurnal_agen_sales`.`status` AS `status`,
   `jurnal_agen_sales`.`created_by` AS `created_by`,
   `jurnal_agen_sales`.`created_at` AS `created_at`,
   `jurnal_agen_sales`.`updated_by` AS `updated_by`,
   `jurnal_agen_sales`.`updated_at` AS `updated_at`,
   `jurnal_agen_sales`.`deleted_at` AS `deleted_at`,
   `jurnal_agen_sales`.`company_id` AS `company_id`,
   `jurnal_agen_sales`.`jurnal_id` AS `jurnal_id`,
   `jurnal_agen_sales`.`product_name` AS `product_name`,
   `t_product`.`picture` AS `picture`
FROM (`jurnal_agen_sales` left join `t_product` on(`jurnal_agen_sales`.`product_id` = `t_product`.`id`));

# Dump of view v_product_in_agen
# ------------------------------------------------------------

DROP TABLE IF EXISTS `v_product_in_agen`; DROP VIEW IF EXISTS `v_product_in_agen`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mariadb`@`%` SQL SECURITY DEFINER VIEW `v_product_in_agen`
AS SELECT
   `stock_agen`.`id` AS `id`,
   `stock_agen`.`product_id` AS `product_id`,
   `stock_agen`.`agen_id` AS `agen_id`,
   `stock_agen`.`count` AS `count`,
   `stock_agen`.`created_at` AS `created_at`,
   `stock_agen`.`created_by` AS `created_by`,
   `stock_agen`.`updated_at` AS `updated_at`,
   `stock_agen`.`updated_by` AS `updated_by`,
   `stock_agen`.`company_id` AS `company_id`,
   `t_product`.`name` AS `product_name`,
   `t_product`.`price_sale` AS `price_sale`,
   `t_product`.`price_sale2` AS `price_sale2`,
   `t_product`.`price_sale3` AS `price_sale3`,
   `t_product`.`price_sale_min2` AS `price_sale_min2`,
   `t_product`.`price_sale_min3` AS `price_sale_min3`,
   `t_product`.`picture` AS `picture`,
   `t_product`.`price_agen` AS `price_agen`,
   `t_product`.`price_purchase` AS `price_purchase`
FROM (`stock_agen` left join `t_product` on(`t_product`.`id` = `stock_agen`.`product_id`));


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
