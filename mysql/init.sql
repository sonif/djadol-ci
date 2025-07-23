# ************************************************************
# Sequel Ace SQL dump
# Version 20077
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Host: localhost (MySQL 5.5.5-10.11.11-MariaDB-0ubuntu0.24.04.2)
# Database: aman-ci
# Generation Time: 2025-05-30 08:03:56 +0000
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `jurnal_agen` WRITE;
/*!40000 ALTER TABLE `jurnal_agen` DISABLE KEYS */;

INSERT INTO `jurnal_agen` (`id`, `company_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `retail_id`, `photo`, `agen_id`, `latlong`, `is_new`, `total_price`)
VALUES
	(11,1,'2025-05-30 13:33:21',31,NULL,NULL,2,'image_picker_26C06802-4C6D-44B4-9E06-0C67B03FC165-40396-00000529396563D9.jpg',NULL,'37.785834,-122.406417',1,71500),
	(12,1,'2025-05-30 13:36:59',31,NULL,NULL,2,'image_picker_876BB3A5-CC96-409A-B72F-E21BEF43AD12-40396-0000052ACD73C037.jpg',NULL,'37.785834,-122.406417',0,40800),
	(13,1,'2025-05-30 14:50:37',31,NULL,NULL,2,NULL,NULL,'37.785834,-122.406417',1,68500);

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
  `created_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `jurnal_id` int(10) unsigned DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jurnal_agen_sales_relation_1` (`jurnal_id`),
  CONSTRAINT `jurnal_agen_sales_relation_1` FOREIGN KEY (`jurnal_id`) REFERENCES `jurnal_agen` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `jurnal_agen_sales` WRITE;
/*!40000 ALTER TABLE `jurnal_agen_sales` DISABLE KEYS */;

INSERT INTO `jurnal_agen_sales` (`id`, `agen_id`, `product_id`, `retail_id`, `count`, `price`, `subtotal`, `status`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_at`, `company_id`, `jurnal_id`, `product_name`)
VALUES
	(21,NULL,20,NULL,1,25500,-25500,'out',NULL,NULL,NULL,NULL,NULL,NULL,11,'KING DJAVA CLASSIC-(20)'),
	(22,NULL,17,NULL,2,23000,-46000,'out',NULL,NULL,NULL,NULL,NULL,NULL,11,'DJAVA MILD BLUE-(16)'),
	(23,NULL,18,NULL,1,24000,-24000,'out',NULL,NULL,NULL,NULL,NULL,1,12,'DJAVA FLAVOUR BLUEBERRY-(16)'),
	(24,NULL,10,NULL,1,9000,-9000,'out',NULL,NULL,NULL,NULL,NULL,1,12,'OCHA GUAVA-(12)'),
	(25,NULL,4,NULL,1,7800,-7800,'out',NULL,NULL,NULL,NULL,NULL,1,12,'DJAVA MERAH-(12)'),
	(26,NULL,21,NULL,2,26500,-53000,'out',NULL,NULL,NULL,NULL,NULL,1,13,'KING DJAVA MENTHOL-(20)'),
	(27,NULL,15,NULL,1,15500,-15500,'out',NULL,NULL,NULL,NULL,NULL,1,13,'LAKSAMANA-(12)');

/*!40000 ALTER TABLE `jurnal_agen_sales` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `m_retail` WRITE;
/*!40000 ALTER TABLE `m_retail` DISABLE KEYS */;

INSERT INTO `m_retail` (`id`, `name`, `address`, `location_lat`, `location_long`, `picture`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `company_id`)
VALUES
	(1,'Toko Socah','Socah','0.177878','0.9892187','Screenshot_2025-04-11_at_14.12.58.png',NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'tokoabc','Rungkut','276183612786','276112786',NULL,'2025-05-22 13:38:23','2025-05-23 15:29:06',NULL,31,1,1),
	(3,'Toko Basmalah','Graha Kamal Permai','8723166','171833',NULL,NULL,'2025-05-23 15:30:27',NULL,NULL,1,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
	(57,1,37,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(58,3,37,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
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
	(71,4,42,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(72,3,42,'y','[\"xread\"]',NULL,NULL,NULL,NULL,NULL),
	(73,1,42,'y','[\"xread\"]',NULL,NULL,NULL,NULL,NULL),
	(77,3,32,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(78,1,44,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(79,2,44,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(80,1,45,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(81,2,45,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,NULL,NULL,NULL),
	(82,3,45,'y','[\"xread\"]',NULL,NULL,NULL,NULL,NULL),
	(83,2,42,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,NULL,'2025-05-26 15:33:15',1,NULL),
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
	(99,4,51,'y','[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]',NULL,'2025-05-26 15:26:41',NULL,NULL,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_api_keys` WRITE;
/*!40000 ALTER TABLE `s_api_keys` DISABLE KEYS */;

INSERT INTO `s_api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`)
VALUES
	(1,1,'0695cabefc1d6bd11e6e13f1e04cffc2b2e07a3251af24c960dbae5c758b62b7',NULL,0,0,NULL,NULL),
	(2,1,'1f38c77fb7c5893ba61826b1087a9638429c8959059b73b0847f132ca5e01a13',NULL,0,0,NULL,NULL),
	(3,30,'105bf1d755e56dd35711052d6b6629ab2f6dcf2eb6ead40ed51fde9ae4320095',NULL,0,0,NULL,NULL),
	(4,31,'e8084ef026210fca3137f2a956c37cf1c7d07c5146a7445491bc622354c69dd7',NULL,0,0,NULL,NULL),
	(5,31,'f94ffe2191e6b7c664dc8a104f7a0ccc1e85b8b2b7d24895c372501ed1190c59',NULL,0,0,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
	(21,'s_user','email','id',NULL,'dd_user_agen',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

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
	(33,'Transaksi Agen/Sales','jurnal_agen_sales',43,'jurnal_id',0,NULL,NULL,NULL,NULL,NULL,'datatable','jurnal_agen_sales',0,'jurnal_agen_sales'),
	(35,'Warehouse','m_warehouse',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'datatable','m_warehouse',0,'m_warehouse'),
	(36,'Stock di Warehouse','stock_warehouse',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','stock_warehouse',0,'stock_warehouse'),
	(37,'Transaksi Warehouse','jurnal_stock',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','jurnal_stock',0,'jurnal_stock'),
	(39,'Stock di Agen','stock_agen',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','stock_agen',0,'stock_agen'),
	(40,'sys-user','s_user',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,'datatable','sys-s_user',0,'s_user'),
	(41,'Absen Datang','t_absen',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','t_absen',0,'t_absen'),
	(42,'Absen Pulang','t_absen_out',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','t_absen_out',0,'t_absen_out'),
	(43,'jurnal_agen','jurnal_agen',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'datatable','jurnal_agen',0,'jurnal_agen');

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
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_form_param` WRITE;
/*!40000 ALTER TABLE `s_form_param` DISABLE KEYS */;

INSERT INTO `s_form_param` (`id`, `label_name`, `form_id`, `column_name`, `type`, `order_no`, `validation`, `table_ref`, `info`, `active`, `column_datatable`, `required`, `path_upload`, `col_md`, `readonly`, `default_value`, `new_form_id`, `is_unique`)
VALUES
	(1,'menu nama',1,'menu_nama','text',NULL,NULL,'',NULL,1,1,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(2,'menu url',1,'menu_url','text',NULL,NULL,'',NULL,1,NULL,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(3,'menu icon',1,'menu_icon','text',NULL,NULL,'',NULL,1,NULL,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(4,'menu active',1,'menu_active','select',NULL,NULL,'{\"y\":\"ya\",\"t\":\"tidak\"}',NULL,1,NULL,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(5,'menu kode',1,'menu_kode','text',NULL,NULL,'',NULL,1,NULL,NULL,NULL,'col-md-6',0,NULL,NULL,NULL),
	(6,'usergroup',2,'usergroup_id','select_ajax',NULL,NULL,'dd_usergroup',NULL,1,1,0,NULL,'col-md-6',0,NULL,NULL,0),
	(7,'akses',2,'akses_code','checkbox',NULL,NULL,'{\"xread\":\"read\",\"xcreate\":\"create\",\"xupdate\":\"update\",\"xdelete\":\"delete\"}',NULL,1,1,0,NULL,'col-md-6',0,NULL,NULL,0),
	(8,'usergroup',3,'usergroup_id','select_ajax',3,NULL,'dd_usergroup',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(9,'password',3,'password','password',2,NULL,'',NULL,1,NULL,1,'','col-md-6',0,NULL,NULL,NULL),
	(10,'active',3,'active','select',4,NULL,'dd_ya_tidak',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(19,'username',3,'email','text',1,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(45,'karyawan',3,'employee_id','select_ajax',NULL,NULL,'',NULL,NULL,NULL,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(133,'nama',28,'config_name','text',NULL,NULL,'',NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(134,'value',28,'config_value','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(137,'media file',29,'media_file','file',NULL,NULL,'',NULL,1,1,NULL,'uploads/media/','col-md-6',0,NULL,NULL,NULL),
	(138,'media title',29,'media_title','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(139,'media url',29,'media_url','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(144,'name',31,'name','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(145,'address',31,'address','textarea',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(146,'latitude',31,'location_lat','latlong',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(147,'longitude',31,'location_long','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(148,'picture',31,'picture','img',NULL,NULL,'',NULL,1,NULL,NULL,'uploads/retail/','col-md-6',0,NULL,NULL,NULL),
	(149,'name',32,'name','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(150,'address',32,'address','textarea',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(151,'phone',32,'phone','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(152,'logo',32,'logo','img',NULL,NULL,'',NULL,1,NULL,NULL,'uploads/company/','col-md-6',0,NULL,NULL,NULL),
	(153,'product id',33,'product_id','select_ajax',NULL,NULL,'dd_product',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(154,'retail id',33,'retail_id','select_ajax',NULL,NULL,'dd_retail',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(155,'count',33,'count','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(156,'price',33,'price','numeric',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(157,'subtotal',33,'subtotal','numeric',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(158,'status',33,'status','select_ajax',NULL,NULL,'dd_jurnal_type',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(167,'name',30,'name','text',1,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(168,'picture',30,'picture','img',2,NULL,'',NULL,1,NULL,NULL,'uploads/product/','col-md-6',0,NULL,NULL,NULL),
	(169,'price sale',30,'price_sale','numeric',4,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(170,'price purchase',30,'price_purchase','numeric',3,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(171,'name',35,'name','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(172,'address',35,'address','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(173,'phone',35,'phone','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(174,'logo',35,'logo','img',NULL,NULL,'',NULL,1,NULL,NULL,'uploads/warehouse/','col-md-6',0,NULL,NULL,NULL),
	(175,'latitude',35,'latitude','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(176,'longitude',35,'longitude','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(177,'product id',36,'product_id','select_ajax',3,NULL,'dd_product',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(178,'company id',36,'company_id','select_ajax',1,NULL,'dd_company',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(179,'warehouse id',36,'warehouse_id','select_ajax',2,NULL,'dd_warehouse',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(180,'count',36,'count','numeric',4,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(181,'date',37,'date','date',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(182,'warehouse id',37,'warehouse_id','select_ajax',NULL,NULL,'dd_warehouse',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(183,'company id',37,'company_id','select_ajax',NULL,NULL,'dd_company',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(184,'product id',37,'product_id','select_ajax',NULL,NULL,'dd_product',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(185,'count',37,'count','numeric',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(186,'price',37,'price','numeric',NULL,NULL,'',NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(187,'subtotal',37,'subtotal','numeric',NULL,NULL,'',NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(188,'status',37,'status','select',NULL,NULL,'dd_jurnal_type',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(189,'agen id',33,'agen_id','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(194,'product id',39,'product_id','select_ajax',3,NULL,'dd_product',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(195,'agen id',39,'agen_id','select_ajax',2,NULL,'dd_user_agen',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(196,'count',39,'count','numeric',4,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(197,'company id',39,'company_id','select_ajax',1,NULL,'dd_company',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(198,'usergroup id',40,'usergroup_id','select_ajax',NULL,NULL,'dd_usergroup',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(199,'ip address',40,'ip_address','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(200,'username',40,'username','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(201,'password',40,'password','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(202,'email',40,'email','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(203,'activation code',40,'activation_code','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(204,'forgotten password code',40,'forgotten_password_code','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(205,'forgotten password time',40,'forgotten_password_time','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(206,'remember code',40,'remember_code','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(207,'active',40,'active','text',NULL,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(208,'full name',40,'full_name','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(209,'company id',40,'company_id','select_ajax',NULL,NULL,'dd_company',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(210,'phone',40,'phone','numeric',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(211,'last login',40,'last_login','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(212,'foto',40,'foto','img',NULL,NULL,'',NULL,1,1,NULL,'uploads/user_profile/','col-md-6',0,NULL,NULL,NULL),
	(213,'employee id',40,'employee_id','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(214,'assign lat',40,'assign_lat','latitude',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(215,'assign long',40,'assign_long','longitude',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(216,'absen date',41,'absen_date','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(217,'absen user id',41,'absen_user_id','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(218,'absen date time',41,'absen_date_time','datetime',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(219,'absen lattitude',41,'absen_lattitude','latitude',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(220,'absen longitude',41,'absen_longitude','longitude',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(221,'absen foto',41,'absen_foto','img',NULL,NULL,'',NULL,1,1,NULL,'uploads/absen_datang/','col-md-6',0,NULL,NULL,NULL),
	(222,'absen status',41,'absen_status','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(223,'absen date',42,'absen_date','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(224,'absen user id',42,'absen_user_id','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(225,'absen date time',42,'absen_date_time','datetime',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(226,'absen lattitude',42,'absen_lattitude','latitude',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(227,'absen longitude',42,'absen_longitude','longitude',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(228,'absen foto',42,'absen_foto','img',NULL,NULL,'',NULL,1,1,NULL,'uploads/absen_pulang/','col-md-6',0,NULL,NULL,NULL),
	(229,'absen status',42,'absen_status','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(230,'agen id (diisi jika out ke agen)',37,'agen_id','select_ajax',NULL,NULL,'dd_user_agen',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(231,'price agen',30,'price_agen','numeric',5,NULL,'',NULL,1,1,1,'','col-md-6',0,NULL,NULL,NULL),
	(232,'company id',30,'company_id','select_ajax',6,NULL,'dd_company',NULL,NULL,NULL,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(233,'created at',33,'created_at','date',NULL,NULL,'',NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(234,'latitude',32,'latitude','latlong',NULL,NULL,'',NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(235,'agen id',43,'agen_id','select_ajax',1,NULL,'dd_user_agen',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(236,'created at',43,'created_at','datetime',5,NULL,'',NULL,NULL,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(237,'latlong',43,'latlong','latlong',4,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(238,'photo',43,'photo','img',3,NULL,'',NULL,1,1,NULL,'uploads/jurnal_agen/','col-md-6',0,NULL,NULL,NULL),
	(239,'retail id',43,'retail_id','select_ajax',2,NULL,'dd_retail',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(240,'jurnal id',33,'jurnal_id','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(241,'is new',43,'is_new','text',NULL,NULL,'',NULL,1,NULL,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(242,'total price',43,'total_price','int',NULL,NULL,'',NULL,1,NULL,NULL,'','col-md-6',0,NULL,NULL,NULL),
	(243,'product name',33,'product_name','text',NULL,NULL,'',NULL,1,1,NULL,'','col-md-6',0,NULL,NULL,NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_form_parent` WRITE;
/*!40000 ALTER TABLE `s_form_parent` DISABLE KEYS */;

INSERT INTO `s_form_parent` (`id`, `form_parent_id`, `form_child_id`, `form_child_fk`)
VALUES
	(19,1,2,'menu_id'),
	(20,43,33,'jurnal_id');

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
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

LOCK TABLES `s_menu` WRITE;
/*!40000 ALTER TABLE `s_menu` DISABLE KEYS */;

INSERT INTO `s_menu` (`menu_id`, `menu_nama`, `menu_ket`, `menu_url`, `menu_icon`, `menu_parent`, `menu_active`, `menu_kode`, `menu_order`)
VALUES
	(1,'[< sys >]',NULL,'formx/formx/table/menu','fa fa-list',0,'y','form_1',0),
	(2,'sys-menu',NULL,'formx/formx/table/menu','',1,'y','form_2',NULL),
	(3,'user',NULL,'formx/formx/table/user','fa fa-user',10,'y','form_3',101),
	(10,'Master',NULL,'','',0,'y','',1),
	(26,'Laporan',NULL,'','',0,'y','',3),
	(32,'Presensi Agen/Employee',NULL,'laporan/laporan/tunggakan','fa fa-table',26,'y','',0),
	(37,'Data Toko Retail',NULL,'formx/formx/table/31','fa fa-home',10,'y','form_31',0),
	(38,'Master Product',NULL,'formx/formx/table/30',NULL,10,'y','form_30',0),
	(39,'Data Company',NULL,'formx/formx/table/32','',1,'y','form_32',0),
	(40,'Jurnal',NULL,'','fa fa-chart',0,'y','',1),
	(41,'sys-form generator',NULL,'formx_gen/','',1,'y','',NULL),
	(42,'Transaksi Agen/Sales',NULL,'formx/formx/table/33','',40,'y','form_33',0),
	(44,'Warehouse',NULL,'formx/formx/table/35',NULL,10,'y','form_35',4),
	(45,'Stok di Warehouse',NULL,'formx/formx/table/36','',46,'y','form_36',0),
	(46,'Stock',NULL,'','',0,'y','',3),
	(47,'Transaksi Warehouse',NULL,'formx/formx/table/37',NULL,40,'y','form_37',0),
	(49,'Stock di Agen',NULL,'formx/formx/table/39',NULL,46,'y','form_39',0),
	(50,'sys-user',NULL,'formx/formx/table/40',NULL,1,'y','form_40',0),
	(51,'jurnal_agen',NULL,'formx/formx/table/43',NULL,40,'y','form_43',0);

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
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
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
	(31,4,NULL,NULL,'$2y$10$QeQQl5XSUfCWHbgLCpwAPeu7aecMbbXTuMcINbWob/leZaFP82JiO','sales1',NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(32,4,NULL,NULL,'$2y$10$VgaE3lDdXWD/N4Fq2O/0S./Chkk1SVQ47uCBRrWVtQJjUD.5VVJeq','sales2',NULL,NULL,NULL,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(33,4,NULL,NULL,'$2y$10$X1KIxL7UQNH5HIn540jpaOKk7Ba0UwthBH7tUoswDIPt4Nt7ThZcK','sales1.2',NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(34,4,NULL,NULL,'$2y$10$mDRR77qWSpgkIhgVI4g/6OQEo07p9fyaPDEeIsvfGI2j/2MfGnt3i','sales1.2',NULL,NULL,NULL,NULL,1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(35,3,NULL,NULL,'$2y$10$3dG1SReo5weyR1/ILAgrJO4XAVY4Ksi3Yz1KCuAKvlEpD5OXW4nKK','distributor2',NULL,NULL,NULL,NULL,1,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(37,4,NULL,NULL,'$2y$10$dTrwvPrfLFmg9GWKPk0pjuDNndRqD96RlNw1En6MaVKTGitesfYTW','sales2.1',NULL,NULL,NULL,NULL,2,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

LOCK TABLES `stock_agen` WRITE;
/*!40000 ALTER TABLE `stock_agen` DISABLE KEYS */;

INSERT INTO `stock_agen` (`id`, `product_id`, `agen_id`, `count`, `created_at`, `created_by`, `updated_at`, `updated_by`, `company_id`)
VALUES
	(1,14,30,-80,NULL,NULL,NULL,NULL,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

LOCK TABLES `t_absen` WRITE;
/*!40000 ALTER TABLE `t_absen` DISABLE KEYS */;

INSERT INTO `t_absen` (`absen_id`, `absen_date`, `absen_user_id`, `absen_date_time`, `absen_lattitude`, `absen_longitude`, `absen_foto`, `absen_status`, `created_at`, `created_by`, `updated_at`, `updated_by`, `company_id`)
VALUES
	(1,NULL,NULL,NULL,'8198277','276183612786',NULL,NULL,'2025-05-22 13:04:09',30,NULL,NULL,1),
	(2,NULL,NULL,NULL,'8198277','276183612786',NULL,NULL,'2025-05-22 13:07:00',31,NULL,NULL,1);

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

INSERT INTO `t_product` (`id`, `name`, `picture`, `price_purchase`, `price_sale`, `price_agen`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`, `company_id`)
VALUES
	(1,'DJAVA HIJAU-(12)',NULL,6650,7800,7600,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(2,'DJAVA HIJAU-(16)',NULL,8300,9500,8500,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(3,'LENTERA-(16)',NULL,8300,9500,8500,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(4,'DJAVA MERAH-(12)',NULL,6650,7800,7600,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(5,'DJAVA PREMIUM GOLD-(12)',NULL,10500,11300,11100,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(6,'LONGSIZE-(12)',NULL,10000,11000,10800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(7,'OCHA-(12)',NULL,8100,9100,8900,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(8,'HK REEBORN-(12)',NULL,6600,7750,7550,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(9,'OCHA MANGO-(12)',NULL,8000,9000,8800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(10,'OCHA GUAVA-(12)',NULL,8000,9000,8800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(11,'OCHA FILTER-(12)',NULL,14500,15500,15300,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(12,'OCHA FILTER-(20)',NULL,24000,26000,24800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(13,'DJAVA FILTER-(12)',NULL,14500,15500,15300,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(14,'DJAVA FILTER-(20)',NULL,24000,25000,24800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(15,'LAKSAMANA-(12)',NULL,14500,15500,15300,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(16,'LAKSAMANA-(20)',NULL,24000,25000,24800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(17,'DJAVA MILD BLUE-(16)',NULL,22000,23000,22800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(18,'DJAVA FLAVOUR BLUEBERRY-(16)',NULL,23000,24000,23800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(19,'DJAVA FLAVOUR PINEAPPLE-(16)',NULL,23000,24000,23800,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(20,'KING DJAVA CLASSIC-(20)',NULL,24500,25500,25300,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1),
	(21,'KING DJAVA MENTHOL-(20)',NULL,25500,26500,26300,30,NULL,'2025-05-23 14:21:45',NULL,NULL,1);

/*!40000 ALTER TABLE `t_product` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
