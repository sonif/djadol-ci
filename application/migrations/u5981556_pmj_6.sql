-- -------------------------------------------------------------
-- TablePlus 3.12.0(354)
--
-- https://tableplus.com/
--
-- Database: u5981556_pmj
-- Generation Time: 2021-01-12 10:22:28.2690
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP VIEW IF EXISTS `deposit_cuti_tahun_sebelumnya`;


DROP TABLE IF EXISTS `legal_perusahaan`;
CREATE TABLE `legal_perusahaan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `date_realease` date DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `on_create` datetime(6) DEFAULT current_timestamp(6),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `legal_perusahaan_file`;
CREATE TABLE `legal_perusahaan_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `legal_perusahaan_id` bigint(20) unsigned DEFAULT NULL,
  `on_create` datetime(6) DEFAULT current_timestamp(6),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `m_company`;
CREATE TABLE `m_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `parent` int(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `m_department`;
CREATE TABLE `m_department` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `m_employee`;
CREATE TABLE `m_employee` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `rt_rw` varchar(255) DEFAULT NULL,
  `sub_district` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `is_marriage` varchar(1) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `is_wni` varchar(1) DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_karyawan_id` bigint(20) unsigned DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `usergroup_id` bigint(20) unsigned DEFAULT NULL,
  `jumlah_cuti` int(11) DEFAULT 12,
  `parent_id` int(11) DEFAULT NULL,
  `id_level_lembur` int(11) DEFAULT NULL,
  `deposit_cuti` float DEFAULT 0,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `m_employee_doc`;
CREATE TABLE `m_employee_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `nama_document` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `m_flow`;
CREATE TABLE `m_flow` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `usergroup_view_all` varchar(100) DEFAULT NULL,
  `usergroup_menu` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `m_flow_level`;
CREATE TABLE `m_flow_level` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `form_id` varchar(255) DEFAULT NULL,
  `form_id_read` varchar(255) DEFAULT NULL,
  `usergroup_id` int(11) DEFAULT NULL,
  `form_many` varchar(255) DEFAULT NULL,
  `form_many_read` varchar(255) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `flow_id` bigint(20) unsigned NOT NULL,
  `back_to_level_no` int(11) DEFAULT NULL,
  `is_approve_leader` tinyint(1) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `flow_id` (`flow_id`) USING BTREE,
  CONSTRAINT `m_flow_level_ibfk_1` FOREIGN KEY (`flow_id`) REFERENCES `m_flow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `m_jenis_cuti`;
CREATE TABLE `m_jenis_cuti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis_cuti` varchar(255) DEFAULT NULL,
  `total_hari` int(11) DEFAULT 0,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `m_kendaraan`;
CREATE TABLE `m_kendaraan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) DEFAULT NULL,
  `nama_pemilik` varchar(255) DEFAULT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `nopol` varchar(255) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `stnk` date DEFAULT NULL,
  `bpkp` date DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `m_kendaraan_item`;
CREATE TABLE `m_kendaraan_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `kendaraan_id` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `m_payment_method`;
CREATE TABLE `m_payment_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `m_sop`;
CREATE TABLE `m_sop` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `date_release` date DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `m_sop_file`;
CREATE TABLE `m_sop_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `sop_id` bigint(20) unsigned DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `m_status_karyawan`;
CREATE TABLE `m_status_karyawan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `p_cuti`;
CREATE TABLE `p_cuti` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `tanggal_cuti_start` date DEFAULT NULL,
  `tanggal_cuti_end` date DEFAULT NULL,
  `jumlah_hari` float DEFAULT NULL,
  `tanggal_cuti_realisasi_start` date DEFAULT NULL,
  `tanggal_cuti_realisasi_end` date DEFAULT NULL,
  `jumlah_hari_realisasi` int(11) DEFAULT NULL,
  `jenis_cuti_id` int(11) DEFAULT NULL,
  `keperluan` varchar(255) DEFAULT NULL,
  `alamat_cuti` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `t_flow_id` bigint(20) unsigned DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `t_flow_id` (`t_flow_id`),
  CONSTRAINT `p_cuti_ibfk_1` FOREIGN KEY (`t_flow_id`) REFERENCES `t_flow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `p_etol`;
CREATE TABLE `p_etol` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `t_flow_id` bigint(20) unsigned DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `t_flow_id` (`t_flow_id`),
  CONSTRAINT `p_etol_ibfk_1` FOREIGN KEY (`t_flow_id`) REFERENCES `t_flow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `p_etol_item`;
CREATE TABLE `p_etol_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `etol_id` bigint(20) unsigned DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `etol_id` (`etol_id`),
  CONSTRAINT `p_etol_item_ibfk_1` FOREIGN KEY (`etol_id`) REFERENCES `p_etol` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `p_klaim_kesehatan`;
CREATE TABLE `p_klaim_kesehatan` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `t_flow_id` bigint(20) unsigned DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `t_flow_id` (`t_flow_id`),
  CONSTRAINT `p_klaim_kesehatan_ibfk_1` FOREIGN KEY (`t_flow_id`) REFERENCES `t_flow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `p_klaim_kesehatan_item`;
CREATE TABLE `p_klaim_kesehatan_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uraian` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `klaim_kesehatan_id` bigint(20) unsigned DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `klaim_kesehatan_id` (`klaim_kesehatan_id`),
  CONSTRAINT `p_klaim_kesehatan_item_ibfk_1` FOREIGN KEY (`klaim_kesehatan_id`) REFERENCES `p_klaim_kesehatan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `p_lembur`;
CREATE TABLE `p_lembur` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam_mulai` varchar(10) DEFAULT NULL,
  `jam_selesai` varchar(10) DEFAULT NULL,
  `uraian_tugas` text DEFAULT NULL,
  `uang_lembur` int(11) DEFAULT NULL,
  `uang_makan` int(11) DEFAULT NULL,
  `t_flow_id` bigint(20) unsigned DEFAULT NULL,
  `jenis_hari` varchar(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `t_flow_id` (`t_flow_id`),
  CONSTRAINT `p_lembur_ibfk_1` FOREIGN KEY (`t_flow_id`) REFERENCES `t_flow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `p_memo_kendaraan`;
CREATE TABLE `p_memo_kendaraan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kendaraan_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `t_flow_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `p_memo_kendaraan_item`;
CREATE TABLE `p_memo_kendaraan_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_memo_kendaraan_id` int(11) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `perkiraan_biaya` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `p_memo_legal_doc`;
CREATE TABLE `p_memo_legal_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legal_id` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `t_flow_id` bigint(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `p_memo_legal_doc_item`;
CREATE TABLE `p_memo_legal_doc_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_memo_legal_doc_id` int(11) DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `perkiraan_biaya` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `p_perjalanan_dinas`;
CREATE TABLE `p_perjalanan_dinas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tanggal_berangkat` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `tujuan` varchar(255) DEFAULT NULL,
  `kota` varchar(255) DEFAULT NULL,
  `uraian` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `total_fee_planning` int(11) DEFAULT NULL,
  `total_free_realisasi` int(11) DEFAULT NULL,
  `t_flow_id` bigint(20) unsigned DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `t_flow_id` (`t_flow_id`),
  CONSTRAINT `p_perjalanan_dinas_ibfk_1` FOREIGN KEY (`t_flow_id`) REFERENCES `t_flow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `p_perjalanan_dinas_item`;
CREATE TABLE `p_perjalanan_dinas_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value_planning` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `categori_id` varchar(50) DEFAULT NULL,
  `value_realisasi` int(11) DEFAULT NULL,
  `perjalanan_dinas_id` bigint(20) unsigned DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `perjalanan_dinas_id` (`perjalanan_dinas_id`),
  CONSTRAINT `p_perjalanan_dinas_item_ibfk_1` FOREIGN KEY (`perjalanan_dinas_id`) REFERENCES `p_perjalanan_dinas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `p_service_kendaraan`;
CREATE TABLE `p_service_kendaraan` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `kendaraan_id` bigint(11) unsigned NOT NULL,
  `tanggal` date DEFAULT NULL,
  `odometer` int(11) DEFAULT NULL,
  `t_flow_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t_flow_id` (`t_flow_id`),
  CONSTRAINT `p_service_kendaraan_ibfk_1` FOREIGN KEY (`t_flow_id`) REFERENCES `t_flow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `p_service_kendaraan_item`;
CREATE TABLE `p_service_kendaraan_item` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `service_kendaraan_id` bigint(11) unsigned DEFAULT NULL,
  `item` varchar(255) DEFAULT NULL,
  `biaya` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_kendaraan_id` (`service_kendaraan_id`),
  CONSTRAINT `p_service_kendaraan_item_ibfk_1` FOREIGN KEY (`service_kendaraan_id`) REFERENCES `p_service_kendaraan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

DROP VIEW IF EXISTS `remainder_legal_perusahaan`;


DROP VIEW IF EXISTS `remainder_m_kendaraan`;


DROP TABLE IF EXISTS `s_akses`;
CREATE TABLE `s_akses` (
  `akses_id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `akses_active` varchar(1) DEFAULT 'y',
  `akses_code` varchar(100) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`akses_id`) USING BTREE,
  KEY `lnk_m_menu_t_akses` (`menu_id`) USING BTREE,
  KEY `lnk_m_usergroup_t_akses` (`usergroup_id`) USING BTREE,
  CONSTRAINT `lnk_m_usergroup_t_akses` FOREIGN KEY (`usergroup_id`) REFERENCES `s_usergroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `s_akses_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `s_menu` (`menu_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `s_api_keys`;
CREATE TABLE `s_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `level` int(2) DEFAULT NULL,
  `ignore_limits` tinyint(1) DEFAULT 0,
  `is_private_key` tinyint(1) DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `s_dropdown`;
CREATE TABLE `s_dropdown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  `dd_field_name` varchar(255) DEFAULT NULL,
  `dd_field_id` varchar(255) DEFAULT NULL,
  `dd_field_subname` varchar(255) DEFAULT NULL,
  `dd_title` varchar(100) DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `s_form`;
CREATE TABLE `s_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(100) NOT NULL,
  `form_table` varchar(100) NOT NULL,
  `parent_form_id` int(11) DEFAULT NULL,
  `parent_form_foreign_key` varchar(100) DEFAULT NULL,
  `is_soft_delete` smallint(11) DEFAULT 0,
  `js_addon` varchar(100) DEFAULT NULL,
  `datatable_button_addon` varchar(100) DEFAULT NULL,
  `fun_is_editable` varchar(100) DEFAULT NULL,
  `col_sort_name` varchar(100) DEFAULT NULL,
  `col_sort_type` varchar(10) DEFAULT NULL,
  `table_type` varchar(10) DEFAULT 'datatable',
  `slug` varchar(255) DEFAULT NULL,
  `is_import` smallint(6) DEFAULT 0,
  `form_table_read` varchar(100) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `footersum_index_table` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `s_form_filter`;
CREATE TABLE `s_form_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `dropdown_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lnk_m_form_m_form_filter` (`form_id`) USING BTREE,
  CONSTRAINT `s_form_filter_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `s_form` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lnk_m_form_m_form_param` (`form_id`) USING BTREE,
  CONSTRAINT `s_form_param_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `s_form` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `s_form_parent`;
CREATE TABLE `s_form_parent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_parent_id` int(11) NOT NULL,
  `form_child_id` int(11) NOT NULL,
  `form_child_fk` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

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
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `s_user`;
CREATE TABLE `s_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usergroup_id` int(11) NOT NULL,
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
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email_unique` (`email`) USING BTREE,
  KEY `lnk_m_usergroup_m_user` (`usergroup_id`) USING BTREE,
  CONSTRAINT `lnk_m_usergroup_m_user` FOREIGN KEY (`usergroup_id`) REFERENCES `s_usergroup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `lembur_hari_kerja` int(11) DEFAULT NULL,
  `lembur_hari_libur` int(11) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `sk_direksi`;
CREATE TABLE `sk_direksi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no_sk` varchar(255) DEFAULT NULL,
  `perihal` varchar(255) DEFAULT NULL,
  `date_release` date DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `sk_direksi_file`;
CREATE TABLE `sk_direksi_file` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `sk_direksi_id` bigint(20) unsigned DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `t_doc`;
CREATE TABLE `t_doc` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `t_flow`;
CREATE TABLE `t_flow` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `approval_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `approval_catatan` varchar(255) DEFAULT NULL,
  `approval_status` varchar(255) DEFAULT NULL,
  `flow_id` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `from_level_no` int(11) DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `finish` int(11) DEFAULT 0,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `t_flow_history`;
CREATE TABLE `t_flow_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `approval_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `approval_catatan` varchar(255) DEFAULT NULL,
  `approval_status` varchar(255) DEFAULT NULL,
  `flow_id` int(11) DEFAULT NULL,
  `to_user` int(11) DEFAULT NULL,
  `from_level_no` int(11) DEFAULT NULL,
  `level_no` int(11) DEFAULT NULL,
  `t_flow_id` bigint(20) unsigned DEFAULT NULL,
  `on_create` datetime DEFAULT current_timestamp(),
  `on_update` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `t_flow_id` (`t_flow_id`),
  CONSTRAINT `t_flow_history_ibfk_1` FOREIGN KEY (`t_flow_id`) REFERENCES `t_flow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

DROP VIEW IF EXISTS `v_level_finish`;


DROP VIEW IF EXISTS `v_p_klaim_kesehatan`;


DROP VIEW IF EXISTS `v_p_perjalanan_dinas`;


DROP VIEW IF EXISTS `v_p_perjalanan_dinas_item`;


DROP VIEW IF EXISTS `v_p_service_kendaraan`;


DROP VIEW IF EXISTS `v_r_p_cuti`;


DROP VIEW IF EXISTS `v_r_p_etol`;


DROP VIEW IF EXISTS `v_r_p_klaim_kesehatan`;


DROP VIEW IF EXISTS `v_r_p_lembur`;


DROP VIEW IF EXISTS `v_r_p_perjalanan_dinas`;


DROP VIEW IF EXISTS `v_t_flow`;


DROP VIEW IF EXISTS `v_t_flow_history`;


DROP VIEW IF EXISTS `v_total_cuti`;


DROP VIEW IF EXISTS `v_user`;


INSERT INTO `legal_perusahaan` (`id`, `no`, `name`, `desc`, `date_realease`, `date_finish`, `on_create`, `on_update`) VALUES
('1', '02.607.942.6-411.000', 'NPWP PMJ', 'NPWP PERUSAHAAN', '2020-11-16', '2024-11-16', '2020-12-23 22:35:22.893684', NULL),
('3', '1111', 'SBU NON KONTRUKSI', '-', '2020-12-16', '2020-12-31', '2020-12-23 22:35:22.893684', NULL);

INSERT INTO `legal_perusahaan_file` (`id`, `name`, `filename`, `legal_perusahaan_id`, `on_create`, `on_update`) VALUES
('1', 'NPWP PMJ', 'WhatsApp_Image_2020-03-31_at_18.42.17.jpeg', '1', '2020-12-23 22:37:19.694415', NULL),
('3', 'sbu_', '219b9c45875261f23d5490bba2ab547a.jpg', '3', '2020-12-23 22:37:19.694415', '2020-12-23 22:38:03');

INSERT INTO `m_company` (`id`, `name`, `parent`, `on_create`, `on_update`) VALUES
('1', 'PMJ', NULL, '2020-12-23 22:40:01', NULL);

INSERT INTO `m_department` (`id`, `name`, `deleted_at`) VALUES
('1', 'Keuangan', NULL),
('2', 'HRD', NULL),
('3', 'FINANCIAL', NULL);

INSERT INTO `m_employee` (`id`, `name`, `birth_place`, `nik`, `address`, `rt_rw`, `sub_district`, `district`, `religion`, `is_marriage`, `job`, `is_wni`, `department_id`, `deleted_at`, `status_karyawan_id`, `gender`, `birth_date`, `usergroup_id`, `jumlah_cuti`, `parent_id`, `id_level_lembur`, `deposit_cuti`, `on_create`, `on_update`) VALUES
('2', 'Abdul Aziz', '', 'PMJ.11.029', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '4', '12', NULL, '3', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:53'),
('3', 'Abdul Karim', '', 'PMJ.12.049', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '3', '12', '15', '2', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:53'),
('4', 'Dwi Adhe Ayu N', '', 'PMJ.19.121', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'P', NULL, '2', '12', '18', NULL, '12', '2020-12-23 22:41:04', '2021-01-05 14:50:53'),
('5', 'Eva Holipa', '', '-', '', '', '', '', '', NULL, '', NULL, NULL, NULL, '2', 'P', NULL, '6', '12', '23', NULL, '12', '2020-12-23 22:41:04', '2021-01-05 14:50:53'),
('6', 'Hendriyanto Aziz', '', '-', '', '', '', '', '', NULL, '', '1', NULL, NULL, '2', 'L', NULL, '7', '12', '15', '2', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:53'),
('7', 'Ira Dayanti', '', '-', '', '', '', '', '', NULL, '', '1', NULL, NULL, '3', 'P', NULL, '8', '12', '21', NULL, '0', '2020-12-23 22:41:04', '2021-01-05 14:52:03'),
('8', 'Nur Endraningsih', '', 'PMJ.16.123', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'P', NULL, '9', '12', NULL, NULL, '12', '2020-12-23 22:41:04', '2021-01-05 14:50:54'),
('9', 'Purwito', '', 'PMJ.16.109', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '10', '12', NULL, '4', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:54'),
('10', 'Rahmat Suhendi', '', 'PMJ.18.115', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '11', '12', NULL, '4', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:54'),
('11', 'Rhodatul Hasanah Anisa Wulandari', '', '-', '', '', '', '', '', '1', '', '1', NULL, NULL, '2', 'P', NULL, '19', '12', '18', '2', '0', '2020-12-23 22:41:04', '2021-01-05 14:51:41'),
('12', 'Sahroni', '', 'PMJ.15.088', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '4', '12', NULL, '3', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:54'),
('13', 'Sarmono', '', 'PMJ.11.040', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '13', '12', '15', '3', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:54'),
('14', 'Sentia Saptriyani', '', 'PMJ.16.103', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'P', NULL, '14', '12', '23', '1', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:54'),
('15', 'Siswanto', '', 'PMJ.15.082', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '15', '12', NULL, '1', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:55'),
('16', 'Sorayah', '', 'PMJ.16.124', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'P', NULL, '16', '12', '14', '2', '12', '2020-12-23 22:41:04', '2021-01-12 10:09:06'),
('17', 'Sumardi', '', 'PMJ.16.108', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '7', '12', '15', '2', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:55'),
('18', 'Talitha Salma Riyanto', '', 'PMJ.16.095', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'P', NULL, '17', '12', NULL, '1', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:55'),
('19', 'Tedi Kuswara', '', 'PMJ.16.102', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '18', '12', NULL, '4', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:55'),
('20', 'Tiyara Arista Sari', '', '-', '', '', '', '', '', NULL, '', '1', NULL, NULL, '2', 'P', NULL, '19', '12', '18', '2', '0', '2020-12-23 22:41:04', '2021-01-05 14:51:55'),
('21', 'Yenny Juniaty', '', 'PMJ.10.027', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'P', NULL, '20', '12', NULL, NULL, '12', '2020-12-23 22:41:04', '2021-01-05 14:50:55'),
('22', 'Yopi Guproni', '', 'PMJ.18.120', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'L', NULL, '7', '12', '15', '2', '12', '2020-12-23 22:41:04', '2021-01-05 14:50:56'),
('23', 'Yuke Damayanti', '', 'PMJ.16.100', '', '', '', '', '', '1', '', '1', NULL, NULL, '1', 'P', NULL, '21', '12', NULL, NULL, '12', '2020-12-23 22:41:04', '2021-01-05 14:50:56'),
('24', 'Zufrizal', '', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, '5', '12', NULL, NULL, '12', '2020-12-23 22:41:04', '2021-01-05 14:50:56'),
('25', 'test', '', '', '', '', '', '', '', NULL, '', NULL, NULL, NULL, '1', NULL, NULL, '3', '12', NULL, NULL, '12', '2021-01-06 07:59:07', '2021-01-08 07:34:41');

INSERT INTO `m_flow` (`id`, `name`, `form_id`, `on_create`, `on_update`, `usergroup_view_all`, `usergroup_menu`, `active`) VALUES
('1', 'Pengajuan Cuti', '17', '2020-12-23 22:41:54', '2020-12-24 08:52:30', NULL, NULL, '1'),
('2', 'Perjalanan Dinas', '29', '2020-12-23 22:41:54', '2020-12-24 08:52:28', NULL, NULL, '1'),
('3', 'Klaim Kesehatan', '28', '2020-12-23 22:41:54', '2020-12-24 08:52:34', NULL, NULL, '1'),
('4', 'Lembur', '22', '2020-12-23 22:41:54', '2020-12-29 09:27:00', NULL, NULL, '1'),
('5', 'E-Tol', '23', '2020-12-23 22:41:54', '2021-01-08 08:07:27', NULL, '4,9,21,5,14,3', '1'),
('6', 'Service Kendaraan', '39', '2020-12-30 06:42:36', '2020-12-30 08:29:05', NULL, '9,21,5', '1'),
('7', 'memo kendaraan', '41', '2020-12-30 08:10:48', '2021-01-08 10:38:01', NULL, '', '0');

INSERT INTO `m_flow_level` (`id`, `level_name`, `level_no`, `form_id`, `form_id_read`, `usergroup_id`, `form_many`, `form_many_read`, `to_user`, `flow_id`, `back_to_level_no`, `is_approve_leader`, `on_create`, `on_update`) VALUES
('1', 'pengajuan karyawan', '1', '17', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2020-12-23 22:42:38', NULL),
('2', 'Staff HR & GA', '3', NULL, '17', '9', NULL, NULL, NULL, '1', NULL, NULL, '2020-12-23 22:42:38', NULL),
('3', 'persetujuan direktur', '5', NULL, '17', '5', NULL, NULL, NULL, '1', NULL, NULL, '2020-12-23 22:42:38', NULL),
('4', 'selesai', '6', NULL, '17', NULL, NULL, NULL, NULL, '1', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 21:03:00'),
('8', 'Creator', '1', '20', NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-29 15:24:41'),
('9', 'Staff HR & GA', '2', '29', '', '9', '', NULL, NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 19:35:19'),
('10', 'klaim kesehatan', '1', '18', NULL, NULL, NULL, NULL, NULL, '3', NULL, NULL, '2020-12-23 22:42:38', NULL),
('11', 'Staff HR & GA', '2', NULL, '18', '9', NULL, NULL, NULL, '3', NULL, NULL, '2020-12-23 22:42:38', '2020-12-29 11:46:37'),
('12', 'lembur', '1', '22', NULL, NULL, NULL, NULL, NULL, '4', NULL, NULL, '2020-12-23 22:42:38', NULL),
('13', 'Staff HR & GA', '3', NULL, '30', '9', NULL, NULL, NULL, '4', NULL, NULL, '2020-12-23 22:42:38', '2020-12-30 21:04:55'),
('14', 'persetujuan direktur', '5', NULL, '30', '5', NULL, NULL, NULL, '4', NULL, NULL, '2020-12-23 22:42:38', '2020-12-30 21:06:04'),
('15', 'selesai', '6', NULL, '30', NULL, NULL, NULL, NULL, '4', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 21:03:52'),
('16', 'Assistant Manager FinAcc dan HRD', '4', NULL, '30', '21', NULL, NULL, NULL, '4', NULL, NULL, '2020-12-23 22:42:38', '2020-12-30 21:06:07'),
('17', 'Assistant Manager FinAcc dan HRD', '3', NULL, '18', '21', NULL, NULL, NULL, '3', NULL, NULL, '2020-12-23 22:42:38', '2020-12-29 11:46:37'),
('18', 'Direktur', '4', NULL, '18', '5', NULL, NULL, NULL, '3', NULL, NULL, '2020-12-23 22:42:38', '2020-12-29 11:46:37'),
('19', 'Keuangan', '5', NULL, '18', '14', NULL, NULL, NULL, '3', NULL, NULL, '2020-12-23 22:42:38', '2020-12-29 11:46:37'),
('20', 'selesai', '6', NULL, '18', NULL, NULL, NULL, NULL, '3', NULL, NULL, '2020-12-23 22:42:38', '2020-12-29 11:46:37'),
('21', 'Assistant Manager FinAcc dan HRD', '3', NULL, '29', '21', NULL, '', NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 19:35:06'),
('22', 'Direktur', '4', NULL, '29', '5', NULL, '', NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 19:35:06'),
('23', 'Keuangan', '5', NULL, '29', '14', NULL, '', NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 19:35:06'),
('24', 'selesai', '10', NULL, '29', NULL, NULL, '', NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 21:03:18'),
('25', 'Assistant Manager FinAcc dan HRD', '4', NULL, '17', '21', NULL, NULL, NULL, '1', NULL, NULL, '2020-12-23 22:42:38', NULL),
('26', 'report perjalanan dinas', '6', '29', NULL, NULL, '', '', NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 19:35:06'),
('27', 'Staff HR & GA', '7', NULL, '29', '9', NULL, '', NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 19:35:05'),
('28', 'Assistant Manager FinAcc dan HRD', '8', NULL, '29', '21', NULL, '', NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 19:35:05'),
('29', 'Direktur', '9', NULL, '29', '5', NULL, '', NULL, '2', NULL, NULL, '2020-12-23 22:42:38', '2020-12-25 19:35:05'),
('30', 'Pengajuan e-tol', '1', '23', NULL, '4', '', NULL, NULL, '5', NULL, NULL, '2020-12-23 22:42:38', NULL),
('31', 'Staff HR & GA', '2', NULL, '23', '9', NULL, '', NULL, '5', NULL, NULL, '2020-12-23 22:42:38', '2020-12-24 05:42:27'),
('32', 'Assistant Manager FinAcc dan HRD', '3', NULL, '23', '21', NULL, '', NULL, '5', NULL, NULL, '2020-12-23 22:42:38', '2020-12-24 05:42:58'),
('33', 'Direktur', '4', NULL, '23', '5', NULL, '', NULL, '5', NULL, NULL, '2020-12-23 22:42:38', '2020-12-24 05:43:12'),
('34', 'persetujuan atasan', '2', NULL, '17', NULL, NULL, NULL, NULL, '1', NULL, '1', '2020-12-23 22:42:38', NULL),
('35', 'persetujuan atasan', '2', NULL, '30', NULL, NULL, NULL, NULL, '4', NULL, '1', '2020-12-23 22:42:38', '2020-12-24 06:11:11'),
('38', 'Keuangan', '5', NULL, '23', '14', NULL, NULL, NULL, '5', NULL, NULL, '2020-12-24 05:43:51', '2020-12-24 05:45:01'),
('39', 'selesai', '6', NULL, NULL, NULL, NULL, NULL, NULL, '5', NULL, NULL, '2020-12-24 05:44:14', '2020-12-25 21:04:09'),
('41', 'HRD', '1', '39', '', '9', NULL, NULL, NULL, '6', NULL, NULL, '2020-12-30 06:45:16', '2020-12-30 08:24:21'),
('42', 'Finance', '2', NULL, '39', '21', NULL, NULL, NULL, '6', NULL, NULL, '2020-12-30 06:45:16', '2020-12-30 08:00:01'),
('43', 'Direktur', '3', NULL, '39', '5', NULL, NULL, NULL, '6', NULL, NULL, '2020-12-30 06:45:16', '2020-12-30 07:38:36'),
('44', 'selesai', '4', NULL, '39', NULL, NULL, NULL, NULL, '6', NULL, NULL, '2020-12-30 06:45:16', '2020-12-30 07:38:36'),
('45', 'HRD', '1', '42', '', '9', '', '', NULL, '7', NULL, NULL, '2020-12-30 08:13:51', '2020-12-30 08:15:41'),
('46', 'Finance', '2', '', '42', '21', '', '', NULL, '7', NULL, NULL, '2020-12-30 08:15:24', '2020-12-30 08:24:28'),
('47', 'Direktur', '3', '', '42', '5', '', '', NULL, '7', NULL, NULL, '2020-12-30 08:21:52', '2020-12-30 08:24:28');

INSERT INTO `m_jenis_cuti` (`id`, `jenis_cuti`, `total_hari`, `on_create`, `on_update`) VALUES
('1', 'Tahunan', '0', '2020-12-24 12:51:29', '2020-12-24 12:55:30'),
('2', 'Khusus', '0', '2020-12-24 12:51:36', '2020-12-24 12:55:31'),
('3', 'Panjang', '0', '2020-12-24 12:51:40', '2020-12-24 12:55:32'),
('4', 'Ijin Setengah Hari', '0', '2020-12-24 12:51:51', '2020-12-24 12:55:32'),
('5', 'Kelahiran Anak/Keguguran', '2', '2020-12-24 12:52:16', '2020-12-24 12:52:18'),
('6', 'Pernikahan anak sah / Menikah (Menjadi Wali Nikah)', '2', '2020-12-24 12:53:23', '2020-12-24 12:53:28'),
('7', 'Pernikahan Karyawan Bersangkutan', '3', '2020-12-24 12:53:47', NULL),
('8', 'Kematian anak, istri/suami, orang tua, kake/nenek, mertua, menantu, saudara kandung, saudarakandung istri/suami', '3', '2020-12-24 12:54:50', NULL),
('9', 'Khitanan', '2', '2020-12-24 12:54:58', NULL),
('10', 'kematian anggota keluarga lain dalam satu rumah', '1', '2020-12-24 12:55:16', NULL),
('11', 'Naik haji', '0', '2020-12-24 12:55:27', NULL);

INSERT INTO `m_kendaraan` (`id`, `no`, `nama_pemilik`, `jenis`, `type`, `nopol`, `tahun`, `stnk`, `bpkp`, `on_create`, `on_update`) VALUES
('1', '', 'Apriana Tri Widayanti', 'Motor', 'Yamaha NMAX', 'B4572NBC', '2016', '2021-04-01', '2020-04-01', '2020-12-23 22:43:27', '2020-12-24 16:17:52'),
('2', NULL, 'Budhi Nurhayati', 'Motor', 'Sepeda Motor Kawasaki EX250S', 'B4390NHW', '2019', '2025-07-25', '2020-07-25', '2020-12-24 16:15:22', NULL),
('3', NULL, 'Budhi Nurhayati', 'Motor', 'Sepeda Montor Kawasaki EX250X', 'B4391NHW', '2019', '2025-07-25', '2020-07-25', '2020-12-24 16:16:38', NULL),
('4', NULL, 'Budhi Nurhayati', 'Motor', 'Honda D1B02N26L2 A/T', 'B4860NFP', '2018', '2023-08-28', '2020-08-28', '2020-12-24 16:19:27', '2020-12-24 16:21:55'),
('5', NULL, 'Budhi Nurhayati', 'Motor', 'Honda Sepeda Motor Solo', 'B4597NFR', '2018', '2023-08-07', '2020-08-07', '2020-12-24 16:21:00', NULL),
('6', NULL, 'PT. Perdana Makmur Jaya', 'Minibus', 'Sienta 1.5G CVT', 'B1701NOT', '2016', '2021-08-13', '2020-08-13', '2020-12-24 16:24:06', NULL),
('7', NULL, 'PT. Perdana Makmur Jaya', 'Mobil', 'Avanza 1.3 G A/T', 'B1498NOL', '2015', '2020-08-31', '2020-08-31', '2020-12-24 16:25:09', NULL),
('8', NULL, 'PT. Perdana Makmur Jaya', 'Mobil', 'Hilux Pick Up 2.5 DSL M/T', 'B9768NAK', '2015', '2020-09-14', '2020-09-14', '2020-12-24 16:26:37', NULL),
('9', NULL, 'Zufrizal', 'Mobil', 'New Avanza 1,3 G M/T', 'B1331NKR', '2013', '2023-10-10', '2020-10-10', '2020-12-24 16:28:01', NULL),
('10', NULL, 'PT. Perdana Makmur Jaya', 'Minibus', 'Toyota Vellfire 2,5G A/T', 'B43DHI', '2019', '2024-10-11', '2020-10-11', '2020-12-24 16:29:39', NULL),
('11', NULL, 'Budhi Nurhayati', 'Mobil', 'Yaris 1.5 J A/T', 'B1436NKY', '2013', '2023-10-17', '2020-10-17', '2020-12-24 16:30:46', NULL),
('12', NULL, 'PT. Perdana Makmur Jaya', 'Mini Bus', 'Kijang Inova 2.4 G M/T', 'B1014NRV', '2018', '2023-10-17', '2020-10-17', '2020-12-24 16:32:04', NULL),
('13', NULL, 'Budhi Nurhayati', 'Motor', 'Yamaha 28D (AL 115S/MIO)/WC', 'B3826NKR', '2010', '2020-10-18', '2020-10-18', '2020-12-24 16:33:27', NULL),
('14', NULL, 'Budhi Nurhayati', 'Jeep', 'Honda CR-V 1.5 TC Jeep', 'B1763NJG', '2018', '2023-10-22', '2020-10-22', '2020-12-24 16:34:37', NULL),
('15', NULL, 'Zufrizal', 'Mobil', 'New Avanza 1.3 G M/T', 'B1589NKY', '2013', '2023-10-28', '2020-10-28', '2020-12-24 16:36:09', NULL),
('16', NULL, 'PT. Perdana Makmur Jaya', 'Mobil', 'Kijang Inova 2.4 A/T', 'B1293NRW', '2018', '2023-11-26', '2020-11-26', '2020-12-24 16:37:31', NULL),
('17', NULL, 'Purwito', 'Mobil', 'Toyota Voxy 2.0 A/T', 'B1962NZG', '2019', '2024-12-13', '2020-12-13', '2020-12-24 16:39:22', NULL),
('18', NULL, 'Timur Diana', 'Mobil', 'Mobil Honda Civic Genio', 'BG1117IG', '1992', '2023-02-06', '2021-02-06', '2020-12-24 16:40:30', NULL),
('19', NULL, 'PT. Dinamika Mitra Karya Pratama', 'Mobil', 'Honda Brio RS 1.2 CVT CKD', 'B1439NZI', '2019', '2025-02-06', '2021-02-06', '2020-12-24 16:41:52', NULL);

INSERT INTO `m_payment_method` (`id`, `name`, `on_create`, `on_update`) VALUES
('1', 'Cash', '2020-12-23 22:44:54', NULL),
('2', 'Ovo', '2020-12-23 22:44:54', NULL),
('3', 'Debit BCA', '2020-12-23 22:44:54', NULL),
('4', 'Debit Mandiri', '2020-12-23 22:44:54', NULL);

INSERT INTO `m_sop` (`id`, `no`, `desc`, `date_release`, `on_create`, `on_update`) VALUES
('3', 'SOP-03', 'SOP 3 - MANUAL BOOK HUMAN RESOURCES', '2020-11-16', '2020-12-23 22:45:34', NULL),
('4', 'SOP-4', 'SOP 4 - MANUAL BOOK ADMINITRASI', '2020-11-16', '2020-12-23 22:45:34', NULL),
('5', 'SOP-5', 'SOP 5 - MANUAL BOOK ENGINEER', '2020-11-16', '2020-12-23 22:45:34', NULL),
('6', 'SOP-6', 'SOP 6 - MANUAL BOOK SATUAN PENGAMAN', '2020-11-16', '2020-12-23 22:45:34', NULL),
('7', 'SOP-7', 'WAREHOUSE', '2020-11-16', '2020-12-23 22:45:34', NULL),
('8', 'SOP-02', 'MANUAL BOOK PURCHASING', '2020-12-28', '2020-12-29 14:35:36', NULL),
('9', '-', 'BUKU PERATURAN PERUSAHAAN', '2020-12-31', '2020-12-29 14:37:07', NULL),
('10', 'SOP-01', 'MANUAL BOOK FINANCE ACCOUNTING', '2021-01-01', '2021-01-04 13:23:22', NULL);

INSERT INTO `m_sop_file` (`id`, `name`, `filename`, `sop_id`, `on_create`, `on_update`) VALUES
('1', 'logo', 'Screen_Shot_2020-11-17_at_13_53_58.png', '1', '2020-12-23 22:46:20', NULL),
('2', 'excel', 'Book1.xlsx', '1', '2020-12-23 22:46:20', NULL),
('3', 'MANUAL BOOK FINANCE ACCOUNTING', 'SOP_1_-_MANUAL_BOOK_FINANCE_ACCOUNTING.docx', '2', '2020-12-23 22:46:20', NULL),
('4', 'MANUAL BOOK HUMAN RESOURCES', 'SOP_3_-_MANUAL_BOOK_HUMAN_RESOURCES.docx', '2', '2020-12-23 22:46:20', NULL),
('5', 'MANUAL BOOK ADMINITRASI', 'SOP_4_-_MANUAL_BOOK_ADMINITRASI.docx', '4', '2020-12-23 22:46:20', NULL),
('6', 'MANUAL BOOK ENGINEER', 'SOP_5_-_MANUAL_BOOK_ENGINEER_(1).docx', '5', '2020-12-23 22:46:20', NULL),
('7', 'MANUAL BOOK SATUAN PENGAMAN', 'SOP_6_-_MANUAL_BOOK_SATUAN_PENGAMAN.docx', '6', '2020-12-23 22:46:20', NULL),
('9', 'PROCESS WEREHOUSE', 'SOP_7_-_PROCESS_WEREHOUSE.docx', '7', '2020-12-23 22:46:20', NULL),
('10', 'JOB DESK WEREHOUSE', 'SOP_7_-_JOB_DESK_WEREHOUSE.docx', '7', '2020-12-23 22:46:20', NULL),
('11', 'MANUAL BOOK HUMAN RESOURCES', 'SOP_3_-_MANUAL_BOOK_HUMAN_RESOURCES.docx', '3', '2020-12-23 22:46:20', NULL),
('13', 'MANUAL BOOK PURCHASING', 'SOP_2_-_MANUAL_BOOK_PURCHASING.docx', '8', '2020-12-29 14:36:06', NULL),
('14', 'BUKU PERATURAN PERUSAHAAN', 'Buku_Peraturan_Perusahaan.pdf', '9', '2020-12-29 14:37:39', NULL),
('15', 'SOP 1 - MANUAL BOOK FINANCE ACCOUNTING', 'SOP_1_-_MANUAL_BOOK_FINANCE_ACCOUNTING.docx', '10', '2021-01-04 13:23:49', NULL);

INSERT INTO `m_status_karyawan` (`id`, `name`, `on_create`, `on_update`) VALUES
('1', 'karyawan tetap', '2020-12-23 22:46:58', NULL),
('2', 'karyawan kontrak', '2020-12-23 22:46:58', NULL),
('3', 'karyawan percobaan', '2020-12-23 22:46:58', NULL);

INSERT INTO `p_cuti` (`id`, `employee_id`, `tanggal_cuti_start`, `tanggal_cuti_end`, `jumlah_hari`, `tanggal_cuti_realisasi_start`, `tanggal_cuti_realisasi_end`, `jumlah_hari_realisasi`, `jenis_cuti_id`, `keperluan`, `alamat_cuti`, `telephone`, `t_flow_id`, `on_create`, `on_update`) VALUES
('44', '16', '2021-01-13', '2021-01-13', '1', NULL, NULL, NULL, '1', 'Undangan PA', 'Jl.Sunan Gunung Jati Gg. H.Lancong RT 03 RW. 08 Paninggilan, Tangerang', '089607489085', '206', '2021-01-12 10:18:56', NULL);

INSERT INTO `p_etol` (`id`, `employee_id`, `tanggal`, `t_flow_id`, `on_create`, `on_update`) VALUES
('1', '2', '2020-12-09', '73', '2020-12-23 22:48:35', '2020-12-24 10:54:27'),
('2', '2', '2020-12-22', '92', '2020-12-24 05:34:56', '2020-12-24 10:54:28');

INSERT INTO `p_etol_item` (`id`, `etol_id`, `jumlah`, `foto`, `on_create`, `on_update`) VALUES
('1', '1', '5000', 'login_image2.png', '2020-12-23 22:49:28', NULL),
('2', '2', '24500', '219b9c45875261f23d5490bba2ab547a.jpg', '2020-12-24 05:35:17', NULL),
('3', '1', '7500', NULL, '2020-12-24 10:58:00', NULL);

INSERT INTO `p_klaim_kesehatan` (`id`, `tanggal`, `employee_id`, `t_flow_id`, `no`, `on_create`, `on_update`) VALUES
('10', '2021-01-05', '18', '195', NULL, '2021-01-07 16:07:55', NULL);

INSERT INTO `p_klaim_kesehatan_item` (`id`, `uraian`, `foto`, `klaim_kesehatan_id`, `biaya`, `on_create`, `on_update`) VALUES
('13', 'pengobatan anak (indikasi alergi) ke dokter anak', 'WhatsApp_Image_2021-01-05_at_08.25.24.jpeg', '10', '604964', '2021-01-07 16:10:05', NULL);

INSERT INTO `p_lembur` (`id`, `employee_id`, `lokasi`, `tanggal`, `jam_mulai`, `jam_selesai`, `uraian_tugas`, `uang_lembur`, `uang_makan`, `t_flow_id`, `jenis_hari`, `on_create`, `on_update`) VALUES
('15', '9', 'Kantor ', '2021-01-05', '14:00', '18:00', 'Pengganti jaga pak tedi tidak masuk sakit diare', '86000', NULL, '173', 'kerja', '2021-01-06 06:23:24', '2021-01-12 09:58:47'),
('16', '19', 'Kantor pmj ', '2021-01-07', '06:00', '14:00', 'Bekap pak Pur yang lagi cuti', '172000', NULL, '203', 'kerja', '2021-01-11 12:56:51', '2021-01-12 09:58:44'),
('17', '19', 'Kantor pmj ', '2021-01-09', '08:00', '15:00', 'Mengawal pekerjaan cat woksop dan pembersihan aac', '164500', NULL, '204', 'libur', '2021-01-11 13:00:12', '2021-01-12 09:58:36');

INSERT INTO `p_service_kendaraan` (`id`, `kendaraan_id`, `tanggal`, `odometer`, `t_flow_id`) VALUES
('2', '11', '2021-01-08', '56182', '197'),
('4', '10', '2021-01-08', '5937', '200');

INSERT INTO `p_service_kendaraan_item` (`id`, `service_kendaraan_id`, `item`, `biaya`, `foto`) VALUES
('2', '2', 'Sevice Rutin ke 60.000 km Mobil Yaris B 1436 NKY', '2067300', NULL),
('3', '4', 'Service berkala mobil Vellfire B 43 DHI ke 20.000 km', '1815000', 'B43DHI.jpg');

INSERT INTO `s_akses` (`akses_id`, `usergroup_id`, `menu_id`, `akses_active`, `akses_code`, `order`, `on_create`, `on_update`) VALUES
('1', '1', '1', 'y', '[\"xcreate\",\"xread\",\"xupdate\",\"xdelete\"]', '1', '2020-12-23 22:53:40', NULL),
('2', '1', '2', 'y', '[\"xcreate\",\"xread\",\"xupdate\",\"xdelete\"]', '1', '2020-12-23 22:53:40', NULL),
('3', '1', '3', 'y', '[\"xcreate\",\"xread\",\"xupdate\",\"xdelete\"]', '1', '2020-12-23 22:53:40', NULL),
('13', '1', '4', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('17', '1', '8', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('18', '1', '9', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('19', '1', '10', 'y', 'null', NULL, '2020-12-23 22:53:40', NULL),
('20', '1', '11', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('21', '1', '12', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('22', '1', '13', 'y', '[\"xread\"]', NULL, '2020-12-23 22:53:40', '2020-12-29 11:09:02'),
('23', '1', '16', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('24', '1', '14', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', '2020-12-29 11:05:22'),
('25', '1', '17', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('26', '1', '15', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('27', '1', '18', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('28', '1', '19', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-23 22:53:40', NULL),
('29', '1', '25', 'y', '[\"xread\"]', NULL, '2020-12-24 13:19:20', '2020-12-25 07:51:53'),
('30', '1', '24', 'y', '[\"xread\"]', NULL, '2020-12-24 13:19:37', '2020-12-25 07:45:39'),
('31', '1', '23', 'y', '[\"xread\"]', NULL, '2020-12-24 13:19:55', '2020-12-25 07:51:43'),
('32', '1', '22', 'y', '[\"xread\"]', NULL, '2020-12-24 13:20:11', '2020-12-25 07:51:31'),
('33', '1', '21', 'y', '[\"xread\"]', NULL, '2020-12-24 13:20:26', '2020-12-25 07:45:30'),
('34', '1', '20', 'y', 'null', NULL, '2020-12-24 13:20:58', NULL),
('35', '1', '28', 'y', 'null', NULL, '2020-12-25 07:37:07', NULL),
('36', '1', '27', 'y', '[\"xread\"]', NULL, '2020-12-25 07:37:19', NULL),
('37', '1', '26', 'y', '[\"xread\"]', NULL, '2020-12-25 07:37:29', NULL),
('38', '1', '29', 'y', '[\"xread\",\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-26 09:28:03', NULL),
('59', '2', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:10:50', NULL),
('60', '3', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:40', NULL),
('61', '4', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:40', NULL),
('62', '5', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:40', NULL),
('63', '6', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:40', NULL),
('64', '7', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:40', NULL),
('65', '8', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:40', NULL),
('66', '9', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:40', NULL),
('67', '10', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:40', NULL),
('68', '11', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('69', '13', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('70', '14', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('71', '15', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('72', '16', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('73', '17', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('74', '18', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('75', '19', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('76', '20', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('77', '21', '13', 'y', '[\"xread\"]', NULL, '2020-12-29 11:11:41', NULL),
('78', '2', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('79', '3', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('80', '4', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('81', '5', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('82', '6', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('83', '7', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('84', '8', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('85', '9', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('86', '10', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('87', '11', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('88', '13', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:33', NULL),
('89', '14', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:34', NULL),
('90', '15', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:34', NULL),
('91', '16', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:34', NULL),
('92', '17', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:34', NULL),
('93', '18', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:34', NULL),
('94', '19', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:34', NULL),
('95', '20', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:34', NULL),
('96', '21', '14', 'y', '[\"xread\"]', NULL, '2020-12-29 12:02:34', NULL),
('97', '2', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:38', NULL),
('98', '3', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:38', NULL),
('99', '4', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:38', NULL),
('100', '5', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:38', NULL),
('101', '6', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('102', '7', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('103', '8', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('104', '9', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('105', '10', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('106', '11', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('107', '13', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('108', '14', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('109', '15', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('110', '16', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('111', '17', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('112', '18', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('113', '19', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('114', '20', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('115', '21', '15', 'y', '[\"xread\"]', NULL, '2020-12-29 12:03:39', NULL),
('116', '2', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:03', NULL),
('117', '3', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('118', '4', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('119', '5', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('120', '6', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('121', '7', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('122', '8', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('123', '9', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('124', '10', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('125', '11', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('126', '13', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('127', '14', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('128', '15', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('129', '16', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('130', '17', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('131', '18', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('132', '19', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('133', '20', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:04', NULL),
('134', '21', '11', 'y', '[\"xread\"]', NULL, '2020-12-29 12:04:05', NULL),
('135', '1', '31', 'y', '[\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-30 07:53:25', NULL),
('136', '1', '32', 'y', '[\"xcreate\",\"xupdate\",\"xdelete\"]', NULL, '2020-12-30 08:11:58', NULL);

INSERT INTO `s_api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`, `on_create`, `on_update`) VALUES
('1', '1', '0695cabefc1d6bd11e6e13f1e04cffc2b2e07a3251af24c960dbae5c758b62b7', NULL, '0', '0', NULL, NULL, '2020-12-23 22:54:17', NULL),
('2', '1', '1f38c77fb7c5893ba61826b1087a9638429c8959059b73b0847f132ca5e01a13', NULL, '0', '0', NULL, NULL, '2020-12-23 22:54:17', NULL);

INSERT INTO `s_dropdown` (`id`, `table_name`, `dd_field_name`, `dd_field_id`, `dd_field_subname`, `dd_title`, `json_value`, `on_create`, `on_update`) VALUES
('1', 's_usergroup', 'name', 'id', NULL, 'dd_usergroup', NULL, '2020-12-23 22:55:05', NULL),
('2', NULL, NULL, NULL, NULL, 'dd_ya_tidak', '{\"1\":\"ya\",\"0\":\"tidak\"}', '2020-12-23 22:55:05', NULL),
('4', 'm_payment_method', 'name', 'id', NULL, 'dd_payment', NULL, '2020-12-23 22:55:05', NULL),
('5', 'm_employee', 'name', 'id', NULL, 'dd_employee', NULL, '2020-12-23 22:55:05', NULL),
('6', 'm_department', 'name', 'id', NULL, 'dd_deparment', NULL, '2020-12-23 22:55:05', NULL),
('7', 'm_status_karyawan', 'name', 'id', NULL, 'dd_status_karyawan', NULL, '2020-12-23 22:55:05', NULL),
('8', NULL, NULL, NULL, NULL, 'dd_gender', '{\"P\":\"Perempuan\",\"L\":\"Laki-laki\"}', '2020-12-23 22:55:05', NULL),
('9', NULL, NULL, NULL, NULL, 'dd_categori_perjalanan', '{\"transportasi\":\"transportasi\",\"uang_saku\":\"uang saku\",\"penginapan\":\"penginapan\",\"lain\":\"lain-lain\"}', '2020-12-23 22:55:05', NULL),
('10', 'm_jenis_cuti', 'jenis_cuti', 'id', NULL, 'dd_categori_cuti', '', '2020-12-23 22:55:05', '2020-12-24 13:36:49'),
('11', NULL, NULL, NULL, NULL, 'dd_jenis_hari', '{\"kerja\":\"Hari kerja\",\"libur\":\"Hari libur\"}', '2020-12-23 22:55:05', NULL),
('12', NULL, NULL, NULL, NULL, 'dd_jam_full', '{\"00:00\":\"00:00\",\"01:00\":\"01:00\",\"02:00\":\"02:00\",\"03:00\":\"03:00\",\"04:00\":\"04:00\",\"05:00\":\"05:00\",\"06:00\":\"06:00\",\"07:00\":\"07:00\",\"08:00\":\"08:00\",\"09:00\":\"09:00\",\"10:00\":\"10:00\",\"11:00\":\"11:00\",\"12:00\":\"12:00\",\"13:00\":\"13:00\",\"14:00\":\"14:00\",\"15:00\":\"15:00\",\"16:00\":\"16:00\",\"17:00\":\"17:00\",\"18:00\":\"18:00\",\"19:00\":\"19:00\",\"20:00\":\"20:00\",\"21:00\":\"21:00\",\"22:00\":\"22:00\",\"23:00\":\"23:00\",\"24:00\":\"24:00\"}', '2020-12-23 22:55:05', NULL),
('13', NULL, NULL, NULL, NULL, 'dd_jam_partial', '{\"16:00\":\"16:00\",\"17:00\":\"17:00\",\"18:00\":\"18:00\",\"19:00\":\"19:00\",\"20:00\":\"20:00\",\"21:00\":\"21:00\",\"22:00\":\"22:00\",\"23:00\":\"23:00\",\"24:00\":\"24:00\"}', '2020-12-23 22:55:05', NULL),
('14', 'm_flow_level', NULL, '1', NULL, 'dd_flow_cuti', NULL, '2020-12-26 14:45:31', '2020-12-26 14:46:19'),
('15', 'm_flow_level', NULL, '2', NULL, 'dd_flow_perjalanan', NULL, '2020-12-26 15:01:26', '2020-12-26 15:01:34'),
('16', 'm_flow_level', NULL, '3', NULL, 'dd_flow_kesehatan', NULL, '2020-12-26 15:01:26', NULL),
('17', 'm_flow_level', NULL, '4', NULL, 'dd_flow_lembur', NULL, '2020-12-26 15:01:26', NULL),
('18', 'm_flow_level', NULL, '5', NULL, 'dd_flow_etol', NULL, '2020-12-26 15:01:26', NULL),
('19', 'm_kendaraan', 'type', 'id', '', 'dd_kendaraan', NULL, '2020-12-30 06:39:40', '2020-12-30 08:04:12'),
('20', 'remainder_legal_perusahaan', 'name', 'id', NULL, 'dd_remider_legal', NULL, '2020-12-30 08:04:12', NULL),
('21', 'remainder_m_kendaraan', 'type', 'id', NULL, 'dd_reminder_kendaraan', NULL, '2020-12-30 08:05:03', NULL);

INSERT INTO `s_form` (`id`, `form_name`, `form_table`, `parent_form_id`, `parent_form_foreign_key`, `is_soft_delete`, `js_addon`, `datatable_button_addon`, `fun_is_editable`, `col_sort_name`, `col_sort_type`, `table_type`, `slug`, `is_import`, `form_table_read`, `on_create`, `on_update`, `footersum_index_table`) VALUES
('1', 'menu', 's_menu', NULL, 'menu_parent', '0', NULL, NULL, NULL, 'menu_order', 'asc', 'tree', 'menu', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('2', 'menu akses', 's_akses', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'akses', '0', NULL, '2020-12-23 22:55:45', '2020-12-25 19:08:55', NULL),
('3', 'user', 's_user', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'user', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('4', 'Jabatan', 's_usergroup', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'usergroup', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('6', 'Tiket Masuk', 't_tiket_masuk', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'tiket_masuk', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('9', 'karyawan', 'm_employee', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'datatable', 'karyawan', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('10', 'departemen', 'm_department', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, 'datatable', 'departemen', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('11', 'sop', 'm_sop', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'sop', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('12', 'sop file', 'm_sop_file', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'sop_file', '0', NULL, '2020-12-23 22:55:45', '2020-12-25 19:08:55', NULL),
('13', 'SK Direksi', 'sk_direksi', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'sk_direksi', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('14', 'sk direksi file', 'sk_direksi_file', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'sk_direksi_file', '0', NULL, '2020-12-23 22:55:45', '2020-12-25 19:08:55', NULL),
('15', 'legal perusahaan', 'legal_perusahaan', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'legal_perusahaan', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('16', 'legal_perusahaan_file', 'legal_perusahaan_file', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'legal_perusahaan_file', '0', NULL, '2020-12-23 22:55:45', '2020-12-25 19:08:55', NULL),
('17', 'cuti', 'p_cuti', NULL, NULL, '0', 'form_cuti.js', NULL, NULL, NULL, NULL, 'datatable', 'cuti', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('18', 'klaim kesehatan', 'p_klaim_kesehatan', NULL, NULL, '0', '', NULL, NULL, NULL, NULL, 'datatable', 'p_klaim_kesehatan', '0', NULL, '2020-12-23 22:55:45', '2020-12-24 11:37:01', NULL),
('19', 'klaim kesehatan item', 'p_klaim_kesehatan_item', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_klaim_kesehatan_item', '0', NULL, '2020-12-23 22:55:45', '2020-12-25 19:08:55', '3'),
('20', 'perjalanan dinas', 'p_perjalanan_dinas', NULL, NULL, '0', '', NULL, NULL, NULL, NULL, 'datatable', 'p_perjalanan_dinas', '0', NULL, '2020-12-23 22:55:45', '2020-12-24 11:37:01', NULL),
('21', 'komponen biaya', 'p_perjalanan_dinas_item', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_perjalanan_dinas_item', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('22', 'Lembur', 'p_lembur', NULL, NULL, '0', '', NULL, NULL, NULL, NULL, 'datatable', 'lembur', '0', NULL, '2020-12-23 22:55:45', '2020-12-24 11:37:07', NULL),
('23', 'e-tol', 'p_etol', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'etol', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('24', 'komponen', 'p_etol_item', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_etol_item', '0', NULL, '2020-12-23 22:55:45', '2020-12-25 19:08:55', NULL),
('25', 'kendaraan', 'm_kendaraan', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'm_kendaraan', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('26', 'dokumen', 'm_kendaraan_item', NULL, '', '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'm_kendaraan_item', '0', NULL, '2020-12-23 22:55:45', '2020-12-25 19:08:55', NULL),
('27', 'item biaya perjalanan dinas', 'p_perjalanan_dinas_item', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_perjalanan_dinas_item', '0', NULL, '2020-12-23 22:55:45', '2020-12-29 11:52:11', '3,4'),
('28', 'Data klaim kesehatan', 'v_p_klaim_kesehatan', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'v_p_klaim_kesehatan', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('29', 'data perjalanan dinas', 'v_p_perjalanan_dinas', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'v_p_perjalanan_dinas', '0', NULL, '2020-12-23 22:55:45', NULL, NULL),
('30', 'data lembur ', 'p_lembur', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_lembur', '0', NULL, '2020-12-24 06:10:07', NULL, NULL),
('31', 'report cuti', 'v_r_p_cuti', NULL, NULL, '0', NULL, '', NULL, NULL, NULL, 'datatable', 'v_r_p_cuti', '0', NULL, '2020-12-24 13:14:53', '2020-12-25 07:46:02', NULL),
('32', 'report etol', 'v_r_p_etol', NULL, NULL, '0', NULL, '', NULL, NULL, NULL, 'datatable', 'v_r_p_etol', '0', NULL, '2020-12-24 13:15:33', '2020-12-25 07:50:50', NULL),
('33', 'report klaim kesehatan', 'v_r_p_klaim_kesehatan', NULL, NULL, '0', NULL, '', NULL, NULL, NULL, 'datatable', 'v_r_p_klaim_kesehatan', '0', NULL, '2020-12-24 13:16:05', '2020-12-25 07:50:50', NULL),
('34', 'report lembur', 'v_r_p_lembur', NULL, NULL, '0', NULL, '', NULL, NULL, NULL, 'datatable', 'v_r_p_lembur', '0', NULL, '2020-12-24 13:17:17', '2020-12-25 07:45:57', NULL),
('35', 'report perjalanan dinas', 'v_r_p_perjalanan_dinas', NULL, NULL, '0', NULL, '', NULL, NULL, NULL, 'datatable', 'v_r_p_perjalanan_dinas', '0', NULL, '2020-12-24 13:18:06', '2020-12-25 07:50:50', NULL),
('36', 'remainder kendaraan', 'remainder_m_kendaraan', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'remainder_m_kendaraan', '0', NULL, '2020-12-25 07:32:20', NULL, NULL),
('37', 'remainder legal perusahaan', 'remainder_legal_perusahaan', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'remainder_legal_perusahaan', '0', NULL, '2020-12-25 07:36:11', NULL, NULL),
('38', 'employee document', 'm_employee_doc', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'm_employee_doc', '0', NULL, '2020-12-26 09:25:33', NULL, NULL),
('39', 'service kendaraan', 'p_service_kendaraan', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_service_kendaraan', '0', 'v_p_service_kendaraan', '2020-12-30 06:36:02', '2021-01-08 15:31:29', NULL),
('40', 'komponen service', 'p_service_kendaraan_item', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_service_kendaraan_item', '0', NULL, '2020-12-30 06:36:59', '2021-01-08 12:54:02', '2'),
('41', 'master flow', 'm_flow', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'm_flow', '0', NULL, '2020-12-30 07:44:43', NULL, NULL),
('42', 'flow level', 'm_flow_level', NULL, NULL, '0', NULL, NULL, NULL, 'level_no', 'asc', 'datatable', 'm_flow_level', '0', NULL, '2020-12-30 07:45:39', '2020-12-30 08:17:31', NULL),
('43', 'memo kendaraan', 'p_memo_kendaraan', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_memo_kendaraan', '0', NULL, '2020-12-30 07:59:28', NULL, NULL),
('44', 'memo kendaraan item', 'p_memo_kendaraan_item', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_memo_kendaraan_item', '0', NULL, '2020-12-30 08:00:28', NULL, NULL),
('45', 'memo legal doc', 'p_memo_legal_doc', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_memo_legal_doc', '0', NULL, '2020-12-30 08:01:24', NULL, NULL),
('46', 'memo legal doc item', 'p_memo_legal_doc_item', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'datatable', 'p_memo_legal_doc_item', '0', NULL, '2020-12-30 08:06:12', NULL, NULL);

INSERT INTO `s_form_param` (`id`, `label_name`, `form_id`, `column_name`, `type`, `order_no`, `validation`, `table_ref`, `info`, `active`, `column_datatable`, `required`, `path_upload`, `col_md`, `readonly`, `default_value`, `new_form_id`, `is_unique`, `on_create`, `on_update`) VALUES
('1', 'menu nama', '1', 'menu_nama', 'text', NULL, NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('2', 'menu url', '1', 'menu_url', 'text', NULL, NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('3', 'menu icon', '1', 'menu_icon', 'text', NULL, NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('4', 'menu active', '1', 'menu_active', 'select', NULL, NULL, '{\"y\":\"ya\",\"t\":\"tidak\"}', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('5', 'menu kode', '1', 'menu_kode', 'text', NULL, NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('6', 'usergroup', '2', 'usergroup_id', 'select_ajax', NULL, NULL, 'dd_usergroup', NULL, '1', '1', '0', NULL, 'col-md-6', '0', NULL, NULL, '0', '2020-12-23 22:57:15', NULL),
('7', 'akses', '2', 'akses_code', 'checkbox', NULL, NULL, '{\"xread\":\"read\",\"xcreate\":\"create\",\"xupdate\":\"update\",\"xdelete\":\"delete\"}', NULL, '1', '1', '0', NULL, 'col-md-6', '0', NULL, NULL, '0', '2020-12-23 22:57:15', NULL),
('8', 'usergroup', '3', 'usergroup_id', 'select_ajax', NULL, NULL, 'dd_usergroup', NULL, '1', '1', '1', '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-26 08:58:56'),
('9', 'password', '3', 'password', 'password', NULL, NULL, '', NULL, '1', NULL, '1', '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-26 08:58:56'),
('10', 'active', '3', 'active', 'select', NULL, NULL, 'dd_ya_tidak', NULL, '1', '1', '1', '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-26 08:58:56'),
('11', 'nama', '4', 'name', 'text', NULL, NULL, '', NULL, '1', '1', '1', '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-26 09:11:16'),
('12', 'desc', '4', 'desc', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-26 09:11:16'),
('19', 'username', '3', 'email', 'text', NULL, NULL, '', NULL, '1', '1', '1', '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-26 08:58:56'),
('20', 'dewasa', '6', 'jumlah_pengunjung_dewasa', 'int', '2', NULL, '', NULL, '1', '1', '0', NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('21', 'plat no', '6', 'plat_no', 'text', '1', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('22', 'jenis kendaraan', '6', 'jenis_kendaraan', 'select', '5', NULL, 'dd_jenis_kendaraan', NULL, '1', '1', '1', NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('23', 'nilai cash pembayaran', '6', 'nilai_cash_pembayaran', 'int', '6', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('24', 'nilai tagihan', '6', 'nilai_tagihan', 'int', '7', NULL, '', NULL, '1', '1', '1', NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('25', 'nilai cash kembalian', '6', 'nilai_cash_kembalian', 'int', NULL, NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('26', 'payment method', '6', 'payment_method', 'select', '8', NULL, 'dd_payment', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('27', 'waktu', '6', 'created_at', 'date', '9', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('28', 'anak2', '6', 'jumlah_pengunjung_anak', 'int', '3', NULL, '', NULL, '1', '1', '0', NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('29', 'mancanegara', '6', 'jumlah_mancanegara', 'int', '4', NULL, '', NULL, '1', '1', '0', NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('33', 'nama', '9', 'name', 'text', '2', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('34', 'tempat lahir', '9', 'birth_place', 'text', '3', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('35', 'nik', '9', 'nik', 'text', '1', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('36', 'alamat', '9', 'address', 'text', '5', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('37', 'RT/RW', '9', 'rt_rw', 'text', '8', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('38', 'kelurahan', '9', 'sub_district', 'text', '7', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('39', 'kecamatan', '9', 'district', 'text', '6', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('40', 'agama', '9', 'religion', 'text', '9', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('41', 'status pernikahan', '9', 'is_marriage', 'select', '10', NULL, 'dd_ya_tidak', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('42', 'pekerjanan', '9', 'job', 'text', '11', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('43', 'wni', '9', 'is_wni', 'select', '12', NULL, 'dd_ya_tidak', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('44', 'departement', '9', 'department_id', 'select', '13', NULL, 'dd_deparment', NULL, NULL, NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('45', 'karyawan', '3', 'employee_id', 'select_ajax', NULL, NULL, 'dd_employee', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-26 08:58:56'),
('46', 'name', '10', 'name', 'text', NULL, NULL, '', NULL, '1', '1', '1', NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('47', 'no document', '11', 'no', 'text', '1', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('48', 'desc', '11', 'desc', 'textarea', '3', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('49', 'date release', '11', 'date_release', 'date', '2', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('50', 'name', '12', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('51', 'filename', '12', 'filename', 'file', NULL, NULL, '', NULL, '1', '1', NULL, 'uploads/sop/', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('52', 'no sk', '13', 'no_sk', 'text', '1', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('53', 'perihal', '13', 'perihal', 'textarea', '3', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('54', 'tanggal terbit', '13', 'date_release', 'date', '2', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('55', 'name', '14', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('56', 'filename', '14', 'filename', 'file', NULL, NULL, '', NULL, '1', '1', NULL, 'uploads/sk/', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('57', 'no dokumen', '15', 'no', 'text', '1', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('58', 'nama', '15', 'name', 'text', '2', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('59', 'keterangan', '15', 'desc', 'textarea', '5', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('60', 'tanggal terbit', '15', 'date_realease', 'date', '3', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('61', 'tanggal berakhir', '15', 'date_finish', 'date', '4', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('62', 'name', '16', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('63', 'filename', '16', 'filename', 'file', NULL, NULL, '', NULL, '1', '1', NULL, 'uploads/legal/', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('64', 'status karyawan', '9', 'status_karyawan_id', 'select', '14', NULL, 'dd_status_karyawan', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('65', 'gender', '9', 'gender', 'select', '15', NULL, 'dd_gender', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('66', 'birth date', '9', 'birth_date', 'date', '4', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('67', 'jabatan', '9', 'usergroup_id', 'select', '16', NULL, 'dd_usergroup', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('68', 'karyawan', '17', 'employee_id', 'selfemployee', '1', NULL, 'dd_employee', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-25 20:14:04'),
('69', 'tanggal cuti mulai', '17', 'tanggal_cuti_start', 'date', '3', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-25 20:14:04'),
('70', 'tanggal cuti akhir', '17', 'tanggal_cuti_end', 'date', '4', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-25 20:14:04'),
('71', 'jumlah hari', '17', 'jumlah_hari', 'numeric', '5', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 08:28:25'),
('72', 'tanggal cuti mulai - realisasi', '17', 'tanggal_cuti_realisasi_start', 'date', '6', NULL, '', NULL, NULL, NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 08:28:25'),
('73', 'tanggal cuti akhir - realisasi', '17', 'tanggal_cuti_realisasi_end', 'date', '7', NULL, '', NULL, NULL, NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 08:28:25'),
('74', 'jumlah hari - realisasi', '17', 'jumlah_hari_realisasi', 'int', '5', NULL, '', NULL, NULL, NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 08:28:25'),
('75', 'jenis cuti', '17', 'jenis_cuti_id', 'select', '8', NULL, 'dd_categori_cuti', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-25 20:14:04'),
('76', 'keperluan', '17', 'keperluan', 'text', '9', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 08:28:25'),
('77', 'alamat cuti', '17', 'alamat_cuti', 'text', '10', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 08:28:25'),
('78', 'telephone', '17', 'telephone', 'text', '11', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 08:28:25'),
('79', 'tanggal', '18', 'tanggal', 'date', '3', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 07:47:57'),
('80', 'karyawan', '18', 'employee_id', 'selfemployee', '2', NULL, 'dd_employee', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 07:47:57'),
('81', 'uraian', '19', 'uraian', 'text', NULL, NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('82', 'foto', '19', 'foto', 'img', NULL, NULL, '', NULL, '1', '1', NULL, 'uploads/klaim_kesehatan/', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('83', 'tanggal berangkat', '20', 'tanggal_berangkat', 'date', '3', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:33:44'),
('84', 'karyawan', '20', 'employee_id', 'selfemployee', '2', NULL, 'dd_employee', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:33:44'),
('85', 'tanggal kembali', '20', 'tanggal_kembali', 'date', '4', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:47:34'),
('86', 'supervisor', '20', 'supervisor_id', 'select', '5', NULL, 'dd_employee', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:47:34'),
('87', 'tujuan', '20', 'tujuan', 'text', '6', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:47:34'),
('88', 'kota', '20', 'kota', 'text', '7', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:47:34'),
('89', 'uraian', '20', 'uraian', 'text', '8', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:33:45'),
('90', 'keterangan', '20', 'keterangan', 'text', '9', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:47:34'),
('91', 'nama', '21', 'name', 'text', '1', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('92', 'biaya', '21', 'value_planning', 'int_separator', '5', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('93', 'foto', '21', 'filename', 'img', '4', NULL, '', NULL, NULL, NULL, NULL, 'uploads/perjalanan_dinas/', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('94', 'keterangan', '21', 'keterangan', 'text', '3', NULL, '', NULL, '1', NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('95', 'kategori', '21', 'categori_id', 'select', '2', NULL, 'dd_categori_perjalanan', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('96', 'biaya realisasi', '21', 'value_realisasi', 'int', '6', NULL, '', NULL, NULL, NULL, NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('97', 'biaya', '19', 'biaya', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('98', 'no dokumen', '18', 'no', 'text', '1', NULL, '', NULL, NULL, NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:40:01'),
('99', 'no', '20', 'no', 'text', '1', NULL, '', NULL, NULL, NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:47:34'),
('100', 'karyawan', '22', 'employee_id', 'selfemployee', '1', NULL, 'dd_employee', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:30'),
('101', 'lokasi', '22', 'lokasi', 'text', '2', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:30'),
('102', 'tanggal', '22', 'tanggal', 'date', '3', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:30'),
('103', 'jam mulai', '22', 'jam_mulai', 'select', '5', NULL, 'dd_jam_full', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:30'),
('104', 'jam selesai', '22', 'jam_selesai', 'select', '6', NULL, 'dd_jam_full', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:30'),
('105', 'uraian tugas', '22', 'uraian_tugas', 'textarea', '7', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:30'),
('106', 'uang lembur', '22', 'uang_lembur', 'int', '8', NULL, '', NULL, NULL, NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:31'),
('107', 'uang makan', '22', 'uang_makan', 'int', '9', NULL, '', NULL, NULL, NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:31'),
('108', 'jenis hari', '22', 'jenis_hari', 'select', '4', NULL, 'dd_jenis_hari', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:31'),
('109', 'tanggal', '23', 'tanggal', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:08:39'),
('112', 'jumlah', '24', 'jumlah', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('113', 'foto', '24', 'foto', 'img', NULL, NULL, '', NULL, '1', '1', NULL, 'uploads/etol/', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 14:20:17'),
('114', 'no', '25', 'no', 'text', NULL, NULL, '', NULL, NULL, NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 14:22:33'),
('115', 'nama pemilik', '25', 'nama_pemilik', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 13:33:26'),
('116', 'jenis', '25', 'jenis', 'text', NULL, NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 14:22:33'),
('117', 'type', '25', 'type', 'text', NULL, NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 14:22:33'),
('118', 'nopol', '25', 'nopol', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 13:33:26'),
('119', 'tahun', '25', 'tahun', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 13:33:26'),
('120', 'stnk', '25', 'stnk', 'date', NULL, NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 14:22:33'),
('121', 'bpkp', '25', 'bpkp', 'date', NULL, NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 14:22:33'),
('122', 'nama', '26', 'nama', 'text', NULL, NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('123', 'file', '26', 'file', 'img', NULL, NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('124', 'item', '27', 'name', 'text', '1', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:52:11'),
('125', 'biaya planning', '27', 'value_planning', 'int_separator', '3', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 08:24:09'),
('126', 'foto', '27', 'filename', 'img', '6', NULL, '', NULL, '1', '1', NULL, 'uploads/perjalanan_dinas/', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:58:27'),
('127', 'keterangan', '27', 'keterangan', 'text', '5', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-29 11:58:27'),
('128', 'kategori', '27', 'categori_id', 'select', '2', NULL, 'dd_categori_perjalanan', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 08:24:42'),
('129', 'Biaya realisasi', '27', 'value_realisasi', 'int_separator', '4', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 08:24:09'),
('130', 'tanggal', '28', 'tanggal', 'date', '3', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('131', 'karyawan', '28', 'employee_id', 'select', '2', NULL, 'dd_employee', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('132', 'nomor', '28', 'nomor', 'text', '1', NULL, '', NULL, '1', '1', NULL, NULL, 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', NULL),
('133', 'tanggal berangkat', '29', 'tanggal_berangkat', 'date', '3', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:09'),
('134', 'nomor sppd', '29', 'nomor_sppd', 'text', '1', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:10'),
('135', 'nomor lbpd', '29', 'nomor_lbpd', 'text', '2', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:10'),
('136', 'karyawan', '29', 'employee_id', 'selfemployee', '4', NULL, 'dd_employee', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-23 22:57:15', '2020-12-24 11:34:09'),
('137', 'lembur hari kerja', '4', 'lembur_hari_kerja', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:02:24', '2020-12-26 09:11:16'),
('138', 'lembur hari libur', '4', 'lembur_hari_libur', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:02:24', '2020-12-26 09:11:16'),
('139', 'karyawan', '30', 'employee_id', 'selfemployee', '1', NULL, 'dd_employee', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:10:07', '2020-12-24 11:34:47'),
('140', 'lokasi', '30', 'lokasi', 'text', '2', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:10:08', '2020-12-24 11:34:47'),
('141', 'tanggal', '30', 'tanggal', 'date', '3', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:10:08', '2020-12-24 11:34:48'),
('142', 'jam mulai', '30', 'jam_mulai', 'select', '5', NULL, 'dd_jam_full', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:10:08', '2020-12-24 11:34:48'),
('143', 'jam selesai', '30', 'jam_selesai', 'select', '6', NULL, 'dd_jam_full', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:10:08', '2020-12-24 11:34:48'),
('144', 'uraian tugas', '30', 'uraian_tugas', 'text', '9', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:10:08', '2020-12-24 11:34:48'),
('145', 'uang lembur', '30', 'uang_lembur', 'int_separator', '7', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:10:08', '2020-12-24 11:34:48'),
('146', 'uang makan', '30', 'uang_makan', 'int_separator', '8', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:10:08', '2020-12-24 11:34:48'),
('147', 'jenis hari', '30', 'jenis_hari', 'text', '4', NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 06:10:09', '2020-12-24 11:34:48'),
('148', 'karyawan', '23', 'employee_id', 'selfemployee', NULL, NULL, 'dd_employee', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 11:08:38', NULL),
('149', 'name', '31', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:14:53', NULL),
('150', 'tanggal cuti start', '31', 'tanggal_cuti_start', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:14:53', NULL),
('151', 'tanggal cuti akhir', '31', 'tanggal_cuti_end', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:14:54', NULL),
('152', 'jumlah hari', '31', 'jumlah_hari', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:14:54', '2020-12-25 09:06:39'),
('153', 'jenis cuti id', '31', 'jenis_cuti_id', 'select', NULL, NULL, 'dd_categori_cuti', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:14:54', NULL),
('154', 'keperluan', '31', 'keperluan', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:14:54', NULL),
('155', 'alamat cuti', '31', 'alamat_cuti', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:14:54', NULL),
('156', 'telephone', '31', 'telephone', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:14:55', NULL),
('157', 'tanggal', '32', 'tanggal', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:15:33', NULL),
('158', 'name', '32', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:15:33', NULL),
('159', 'TOTAL', '32', 'TOTAL', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:15:34', '2020-12-24 13:26:51'),
('160', 'nomor', '33', 'nomor', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:16:06', NULL),
('161', 'tanggal', '33', 'tanggal', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:16:06', NULL),
('162', 'name', '33', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:16:06', NULL),
('163', 'total biaya', '33', 'total_biaya', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:16:06', NULL),
('164', 'tanggal', '34', 'tanggal', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:17', NULL),
('165', 'jenis hari', '34', 'jenis_hari', 'text', NULL, NULL, 'dd_jenis_hari', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:17', '2020-12-24 13:28:21'),
('166', 'name', '34', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:17', NULL),
('167', 'lokasi', '34', 'lokasi', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:18', NULL),
('168', 'jam mulai', '34', 'jam_mulai', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:18', NULL),
('169', 'jam selesai', '34', 'jam_selesai', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:18', NULL),
('170', 'lama', '34', 'lama', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:18', NULL),
('171', 'hari kerja', '34', 'hari_kerja', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:18', NULL),
('172', 'hari libur', '34', 'hari_libur', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:19', NULL),
('173', 'total uang lembur', '34', 'total_uang_lembur', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:19', '2020-12-24 13:28:21'),
('174', 'uraian tugas', '34', 'uraian_tugas', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:17:19', NULL),
('175', 'nomor lbpd', '35', 'nomor_lbpd', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:07', NULL),
('176', 'nomor sppd', '35', 'nomor_sppd', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:07', NULL),
('177', 'tanggal berangkat', '35', 'tanggal_berangkat', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:07', NULL),
('178', 'tanggal kembali', '35', 'tanggal_kembali', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:07', NULL),
('179', 'name', '35', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:07', NULL),
('180', 'supervisor', '35', 'supervisor', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:08', NULL),
('181', 'tujuan', '35', 'tujuan', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:08', NULL),
('182', 'kota', '35', 'kota', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:08', NULL),
('183', 'uraian', '35', 'uraian', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:08', NULL),
('184', 'keterangan', '35', 'keterangan', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:11', NULL),
('185', 'planing', '35', 'planing', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:11', '2020-12-25 09:08:20'),
('186', 'realisasi', '35', 'realisasi', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:12', '2020-12-25 09:08:20'),
('187', 'selisih', '35', 'selisih', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-24 13:18:12', '2020-12-25 09:08:20'),
('188', 'nama pemilik', '36', 'nama_pemilik', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:32:20', NULL),
('189', 'jenis', '36', 'jenis', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:32:20', NULL),
('190', 'type', '36', 'type', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:32:20', NULL),
('191', 'nopol', '36', 'nopol', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:32:20', NULL),
('192', 'tahun', '36', 'tahun', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:32:20', NULL),
('193', 'stnk', '36', 'stnk', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:32:20', NULL),
('194', 'bpkp', '36', 'bpkp', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:32:20', NULL),
('195', 'remainder stnk', '36', 'remainder_stnk', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:32:20', NULL),
('196', 'remainder bpkb', '36', 'remainder_bpkb', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:32:20', NULL),
('197', 'no', '37', 'no', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:36:11', NULL),
('198', 'name', '37', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:36:11', NULL),
('199', 'desc', '37', 'desc', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:36:11', NULL),
('200', 'date realease', '37', 'date_realease', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:36:11', NULL),
('201', 'date finish', '37', 'date_finish', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:36:11', NULL),
('202', 'remainder', '37', 'remainder', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-25 07:36:11', NULL),
('203', 'document', '38', 'nama_document', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-26 09:25:33', NULL),
('204', 'foto', '38', 'file', 'img', NULL, NULL, '', NULL, '1', '1', NULL, 'uploads/employee_doc', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-26 09:25:33', '2020-12-26 09:26:25'),
('205', 'status', '31', 'level_no', 'select_ajax', NULL, NULL, 'dd_flow_cuti', NULL, NULL, '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-26 14:31:18', '2020-12-27 10:47:38'),
('206', 'status', '32', 'level_no', 'select_ajax', NULL, NULL, 'dd_flow_etol', NULL, NULL, '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-26 14:31:25', '2020-12-27 10:48:33'),
('207', 'status', '33', 'level_no', 'select_ajax', NULL, NULL, 'dd_flow_kesehatan', NULL, NULL, '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-26 14:31:33', '2020-12-27 10:48:27'),
('208', 'status', '34', 'level_no', 'select_ajax', NULL, NULL, 'dd_flow_lembur', NULL, NULL, '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-26 14:31:41', '2020-12-27 10:48:19'),
('209', 'status', '35', 'level_no', 'select_ajax', NULL, NULL, 'dd_flow_perjalanan', NULL, NULL, '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-26 14:31:49', '2020-12-27 10:48:12'),
('210', 'tanggal', '39', 'tanggal', 'date', '4', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 06:36:02', '2021-01-08 15:21:01'),
('211', 'odometer', '39', 'odometer', 'int', '5', NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 06:36:02', '2021-01-08 15:21:01'),
('212', 'item', '40', 'item', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 06:36:59', NULL),
('213', 'biaya', '40', 'biaya', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 06:36:59', NULL),
('214', 'kendaraan', '39', 'kendaraan_id', 'select_ajax', '3', NULL, 'dd_kendaraan', NULL, '1', '1', '1', '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 06:40:08', '2021-01-08 15:21:01'),
('215', 'name', '41', 'name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:44:43', NULL),
('216', 'form id', '41', 'form_id', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:44:43', NULL),
('217', 'usergroup menu', '41', 'usergroup_menu', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:44:43', NULL),
('218', 'level name', '42', 'level_name', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', NULL),
('219', 'level no', '42', 'level_no', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', NULL),
('220', 'form id', '42', 'form_id', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', NULL),
('221', 'form id read', '42', 'form_id_read', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', NULL),
('222', 'usergroup id', '42', 'usergroup_id', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', NULL),
('223', 'form many', '42', 'form_many', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', NULL),
('224', 'form many read', '42', 'form_many_read', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', NULL),
('225', 'to user', '42', 'to_user', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', NULL),
('226', 'flow id', '42', 'flow_id', 'text', NULL, NULL, '', NULL, NULL, NULL, '1', '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', '2020-12-30 08:13:10'),
('227', 'back to level no', '42', 'back_to_level_no', 'int', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:45:39', NULL),
('228', 'kendaraan', '43', 'kendaraan_id', 'select_ajax', NULL, NULL, 'dd_reminder_kendaraan', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:59:28', '2020-12-30 08:09:40'),
('229', 'tanggal', '43', 'tanggal', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:59:28', NULL),
('230', 'keterangan', '43', 'keterangan', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 07:59:28', NULL),
('231', 'item', '44', 'item', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 08:00:28', NULL),
('232', 'perkiraan biaya', '44', 'perkiraan_biaya', 'int_separator', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 08:00:28', NULL),
('233', 'legal', '45', 'legal_id', 'select', NULL, NULL, 'dd_remider_legal', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 08:01:24', '2020-12-30 08:09:30'),
('234', 'tanggal', '45', 'tanggal', 'date', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 08:01:24', NULL),
('235', 'keterangan', '45', 'keterangan', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 08:01:24', NULL),
('236', 'item', '46', 'item', 'text', NULL, NULL, '', NULL, '1', '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 08:06:12', NULL),
('237', 'perkiraan biaya', '46', 'perkiraan_biaya', 'int_separator', NULL, NULL, '', NULL, '1', NULL, NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2020-12-30 08:06:12', NULL),
('238', 'foto', '40', 'foto', 'img', NULL, NULL, '', NULL, '1', '1', NULL, 'uploads/service_kendaraan/', 'col-md-6', '0', NULL, NULL, NULL, '2021-01-08 12:53:17', '2021-01-08 15:15:46'),
('239', 'nomor', '39', 'nomor', 'text', '1', NULL, '', NULL, NULL, '1', NULL, '', 'col-md-6', '0', NULL, NULL, NULL, '2021-01-08 15:47:57', NULL);

INSERT INTO `s_form_parent` (`id`, `form_parent_id`, `form_child_id`, `form_child_fk`) VALUES
('1', '1', '2', 'menu_id'),
('2', '32', '24', 'etol_id'),
('3', '23', '24', 'etol_id'),
('6', '11', '12', 'sop_id'),
('7', '13', '14', 'sk_direksi_id'),
('8', '15', '16', 'legal_perusahaan_id'),
('9', '18', '19', 'klaim_kesehatan_id'),
('10', '25', '26', 'kendaraan_id'),
('11', '33', '19', 'klaim_kesehatan_id'),
('12', '35', '27', 'perjalanan_dinas_id'),
('14', '29', '27', 'perjalanan_dinas_id'),
('15', '9', '38', 'employee_id'),
('16', '28', '19', 'klaim_kesehatan_id'),
('17', '39', '40', 'service_kendaraan_id'),
('18', '41', '42', 'flow_id');

INSERT INTO `s_menu` (`menu_id`, `menu_nama`, `menu_ket`, `menu_url`, `menu_icon`, `menu_parent`, `menu_active`, `menu_kode`, `menu_order`, `on_create`, `on_update`) VALUES
('1', 'menu', NULL, 'formx/formx/table/menu', 'fa fa-list', '30', 't', 'form_1', '0', '2020-12-23 22:57:48', '2020-12-30 07:52:51'),
('2', 'akses', NULL, 'formx/formx/table/akses', NULL, '1', 't', 'form_2', NULL, '2020-12-23 22:57:48', NULL),
('3', 'user', NULL, 'formx/formx/table/user', 'fa fa-user', '10', 'y', 'form_3', '12', '2020-12-23 22:57:48', NULL),
('4', 'Jabatan', NULL, 'formx/formx/table/usergroup', 'fa fa-users', '10', 'y', 'form_4', '11', '2020-12-23 22:57:48', NULL),
('8', 'karyawan', NULL, 'formx/formx/table/9', NULL, '10', 'y', 'form_9', '13', '2020-12-23 22:57:48', NULL),
('9', 'departemen', NULL, 'formx/formx/table/10', '', '10', 't', 'form_10', '14', '2020-12-23 22:57:48', NULL),
('10', 'Master', NULL, '', 'fa fa-bars', '0', 'y', '', '1', '2020-12-23 22:57:48', '2020-12-26 15:08:33'),
('11', 'sop', NULL, 'formx/formx/table/11', NULL, '13', 'y', 'form_11', '21', '2020-12-23 22:57:48', NULL),
('12', 'sop file', NULL, 'formx/formx/table/12', '', '11', 't', 'form_12', '0', '2020-12-23 22:57:48', NULL),
('13', 'Dokumen', NULL, '', 'fa fa-bars', '0', 'y', '', '2', '2020-12-23 22:57:48', '2020-12-24 13:49:34'),
('14', 'sk direksi', NULL, 'formx/formx/table/13', '', '13', 'y', 'form_13', '22', '2020-12-23 22:57:48', NULL),
('15', 'sk direksi file', NULL, 'formx/formx/table/14', NULL, '14', 'y', 'form_14', '0', '2020-12-23 22:57:48', NULL),
('16', 'legal perusahaan', NULL, 'formx/formx/table/15', NULL, '13', 'y', 'form_15', '23', '2020-12-23 22:57:48', NULL),
('17', 'legal_perusahaan_file', NULL, 'formx/formx/table/16', NULL, '16', 'y', 'form_16', '0', '2020-12-23 22:57:48', NULL),
('18', 'kendaraan', NULL, 'formx/formx/table/25', '', '10', 'y', 'form_25', '15', '2020-12-23 22:57:48', NULL),
('19', 'dokumen', NULL, 'formx/formx/table/26', NULL, '18', 'y', 'form_26', '2', '2020-12-23 22:57:48', '2020-12-24 11:42:29'),
('20', 'Report', NULL, '', 'fa fa-bars', '0', 'y', '', '3', '2020-12-24 11:40:31', '2020-12-24 13:49:52'),
('21', 'cuti', NULL, 'formx/formx/table/31', '', '20', 'y', 'form_31', '31', '2020-12-24 13:15:01', '2020-12-25 07:53:49'),
('22', 'etol', NULL, 'formx/formx/table/32', '', '20', 'y', 'form_32', '32', '2020-12-24 13:18:33', '2020-12-25 07:53:57'),
('23', 'klaim kesehatan', NULL, 'formx/formx/table/33', '', '20', 'y', 'form_33', '33', '2020-12-24 13:18:35', '2020-12-25 07:54:06'),
('24', 'lembur', NULL, 'formx/formx/table/34', '', '20', 'y', 'form_34', '34', '2020-12-24 13:18:38', '2020-12-25 07:54:15'),
('25', 'perjalanan dinas', NULL, 'formx/formx/table/35', '', '20', 'y', 'form_35', '35', '2020-12-24 13:18:41', '2020-12-25 07:54:24'),
('26', 'kendaraan', NULL, 'formx/formx/table/36', '', '28', 'y', 'form_36', '41', '2020-12-25 07:36:15', '2020-12-25 07:52:59'),
('27', 'legal perusahaan', NULL, 'formx/formx/table/37', '', '28', 'y', 'form_37', '42', '2020-12-25 07:36:17', '2020-12-25 07:53:07'),
('28', 'Reminder', NULL, '', '', '0', 'y', '', '4', '2020-12-25 07:36:50', '2020-12-26 15:08:33'),
('29', 'employee document', NULL, 'formx/formx/table/38', NULL, '8', 'y', 'form_38', '0', '2020-12-26 09:27:34', '2020-12-26 09:27:48'),
('30', 'Setting App', NULL, '', '', '0', 't', '', NULL, '2020-12-30 07:52:45', NULL),
('31', 'master flow', NULL, 'formx/formx/table/41', NULL, '30', 'y', 'form_41', '0', '2020-12-30 07:53:02', '2020-12-30 07:53:09'),
('32', 'flow level', NULL, 'formx/formx/table/42', NULL, '31', 'y', 'form_42', '0', '2020-12-30 08:11:40', '2020-12-30 08:11:48');

INSERT INTO `s_user` (`id`, `usergroup_id`, `ip_address`, `username`, `password`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `active`, `full_name`, `company`, `phone`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `last_login`, `foto`, `employee_id`, `on_create`, `on_update`) VALUES
('1', '1', NULL, 'admin', '$2y$10$oe36uixTBiJ4FQhDchbOPuN0dESx2kB17oF113GdflIHBMbDH5FB2', 'admin', NULL, NULL, NULL, NULL, '1', 'Administrator', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 22:58:48', NULL),
('2', '2', NULL, NULL, '$2y$10$49eHzwsjQWmKK2T6VZlFie7CKImku83asWjJUsGLSAsqn0gqQcxKy', 'staff', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 22:58:48', NULL),
('3', '3', NULL, NULL, '$2y$10$Y3bHG4/OQfuQrL3wo1/vhu4k7Bq5sgAvjNiA.OW17.m7gIjKdkDR.', 'hrd', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 22:58:48', NULL),
('4', '4', NULL, NULL, '$2y$10$Gfjrj5nHtF7FePrr9XzW5u30JsCpmzcLtDopnkWnrrhFDPRp4tWPW', 'keuangan', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 22:58:48', NULL),
('5', '5', NULL, NULL, '$2y$10$B4aZDg6nK.Y4WlGMeXtdEu0L2tXcTpyzXcH6LabhrwLz6EzumB81K', 'pimpinan', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 22:58:48', NULL),
('7', '21', NULL, NULL, '$2y$10$Ed9NhABwi/NUIRLWhPlVmOOfGDYcdUEP37YLTG/Uulvb.lmEQEYvW', 'yuke', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23', '2020-12-23 22:58:48', NULL),
('8', '20', NULL, NULL, '$2y$10$mqqKK/1mLoiKbsAk2I7WY.owD1iRh99.ySZbWOU17b0FP2FWoQde.', 'yenni', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21', '2020-12-23 22:58:48', NULL),
('9', '5', NULL, NULL, '$2y$10$v83Zmv9JEUy8M/ur/DQtBOkGergznsssxyQ9TLnsTikfQ4ejKLcPK', 'zufrizal', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '2021-01-08 08:36:22', NULL, NULL, NULL, NULL, NULL, '24', '2020-12-23 22:58:48', '2021-01-08 15:36:22'),
('10', '4', NULL, NULL, '$2y$10$kz/HUXJRYjheM0ovkqJ11.Yqyq60fGREHw/dPbQZiqfJuyTTG4hW6', 'azis', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '2020-12-23 22:58:48', NULL),
('11', '4', NULL, NULL, '$2y$10$EhiPPONriUh0VcIWAnK8eum26cQbyywGidUEPjMcNYzoGmadTWDk6', 'sahroni', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12', '2020-12-23 22:58:48', NULL),
('12', '7', NULL, NULL, '$2y$10$YYQUyUeFNBYQFdy1tPR1xe4mZrpu.LXseW20UCW2omGDaA5Wd0lAG', 'yopi', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22', '2020-12-23 22:58:48', NULL),
('13', '7', NULL, NULL, '$2y$10$zXkciKp8a3g5akg8LDNSbeaW8C0gFGFiVSgrCeYBhx0ztgp2FGt.G', 'hendri', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '6', '2020-12-23 22:58:48', NULL),
('14', '13', NULL, NULL, '$2y$10$QQybxNkKRT5nVP4k68YVY.vQMNepLUfItN4HiL2JLBzkK9hLFeBYa', 'sarmono', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '2021-01-06 00:48:30', NULL, NULL, NULL, NULL, NULL, '13', '2020-12-23 22:58:48', '2021-01-06 07:48:30'),
('15', '10', NULL, NULL, '$2y$10$/MaCZfSrj0voupdrc7UoG.T8Dll.KiM/nH1AKzVcMmZgTGpfNMSL2', 'purwito', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '2021-01-05 00:57:33', NULL, NULL, NULL, NULL, NULL, '9', '2020-12-23 22:58:48', '2021-01-05 07:57:33'),
('16', '11', NULL, NULL, '$2y$10$kdlkRYfQmTkps3dSg4.Q0eOiE2hY/ZXQfiy6c/m3Ic6prywbNPjD2', 'rahmat', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10', '2020-12-23 22:58:48', NULL),
('17', '2', NULL, NULL, '$2y$10$tSQuj640G6BSawiovEMIQ.BRe4tLm09iuwZHGDOI1DTs2cRBmtQMy', 'dwi', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', '2020-12-23 22:58:48', NULL),
('19', '18', NULL, NULL, '$2y$10$.GX2MGmBRD1/o1jc00CxTuy6onDUxRqPepGuyTaTsyUxpI.6kfKda', 'tedi', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '19', '2020-12-23 22:58:48', NULL),
('20', '19', NULL, NULL, '$2y$10$nGWRaqBnThMFNNd4zvdneOSt67XMfeAToUr5pmH17HN4jIiM/bk9q', 'anisa', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11', '2020-12-23 22:58:48', NULL),
('21', '16', NULL, NULL, '$2y$10$nh2Fx3Bz1Puk17Gv.IEeHOXM/WgwYd/U1yS1QMXnNRom.Nhw0vFTW', 'sorayah', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '16', '2020-12-23 22:58:48', NULL),
('22', '9', NULL, NULL, '$2y$10$A3b9ETQTIpLPcFBTu/fu9engWSwXV2oUjqirXKbkn7GOOnBJvUN9O', 'nur', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8', '2020-12-23 22:58:48', NULL),
('23', '3', NULL, NULL, '$2y$10$hYhOJPzUsk103X0dim9Lpu4MpewXzWjOKorHodu.lSKVlfZQ7sGKy', 'karim', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '2021-01-08 00:38:12', NULL, NULL, NULL, NULL, NULL, '3', '2020-12-23 22:58:48', '2021-01-08 07:38:12'),
('24', '8', NULL, NULL, '$2y$10$Ah6WWvP7Sm74e2Q1Mxp3a.k/JGeM2a9Idcs5ChhnmgLxOKhRU568a', 'ira', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7', '2020-12-23 22:58:48', NULL),
('25', '17', NULL, NULL, '$2y$10$rewJUPmZFYvNHnLbFes3aOZcU7Fj2GHC0Srqh/uMBZOzBrxLBC8cm', 'talitha', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '2021-01-05 01:20:32', NULL, NULL, NULL, NULL, NULL, '18', '2020-12-23 22:58:48', '2021-01-05 08:20:32'),
('26', '15', NULL, NULL, '$2y$10$0pfuY.UVMtaBdy35IRRyPuLbP0FOA/XUQK0UQuX/dg8hm7TZN/5AO', 'siswanto', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15', '2020-12-23 22:58:48', NULL),
('27', '14', NULL, NULL, '$2y$10$1LkH02f3508O2wcm9tppHeHf.6.poEZQAiU0a6gztWoTfjphqNO8G', 'sentia', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14', '2020-12-23 22:58:48', NULL),
('47', '19', NULL, NULL, '$2y$10$6uo0akuv1bixyuWgBVxNnuo1GM.qA//aMzinCoxjv3j0cuWzHi5G.', 'tiyara', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '20', '2021-01-05 08:03:24', NULL),
('48', '7', NULL, NULL, '$2y$10$HQ3buXRY5HBrN9yufv.EY.7rgZoXtgwOdKwujJIfwfFHKfRmVjN4O', 'sumardi', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17', '2021-01-05 09:28:09', NULL),
('49', '3', NULL, NULL, '$2y$10$hJSeLeVaNPcwSLml9iyt0eJTiX5cJZU6acXXutSrG6pSrMNTQzfqO', 'test', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '25', '2021-01-06 07:59:44', '2021-01-08 08:19:11');

INSERT INTO `s_usergroup` (`id`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `name`, `desc`, `lembur_hari_kerja`, `lembur_hari_libur`, `on_create`, `on_update`) VALUES
('1', '2019-02-14 10:47:52', NULL, NULL, NULL, NULL, 'admin', 'administrator', NULL, NULL, '2020-12-23 22:59:33', NULL),
('2', '2020-11-08 11:46:35', NULL, NULL, NULL, NULL, 'Sales Support', '', '32000', '35000', '2020-12-23 22:59:33', '2020-12-30 21:14:35'),
('3', '2020-11-08 11:46:45', NULL, NULL, NULL, NULL, 'Staff Logistik', '', '32000', '35000', '2020-12-23 22:59:33', '2020-12-24 06:07:37'),
('4', '2020-11-08 11:46:58', NULL, NULL, NULL, NULL, 'Driver', '', '26500', '29000', '2020-12-23 22:59:33', '2020-12-24 06:08:03'),
('5', '2020-11-08 11:47:50', NULL, NULL, NULL, NULL, 'Direktur', '', NULL, NULL, '2020-12-23 22:59:33', NULL),
('6', '2020-11-18 13:52:01', NULL, NULL, NULL, NULL, 'Scanning & Filling Dokumen', '', '32000', '35000', '2020-12-23 22:59:33', '2020-12-30 21:14:47'),
('7', '2020-11-18 13:52:41', NULL, NULL, NULL, NULL, 'Engineer', '', '32000', '35000', '2020-12-23 22:59:33', '2020-12-24 06:09:22'),
('8', '2020-11-18 13:52:51', NULL, NULL, NULL, NULL, 'Staff Purchasing', '', '32000', '35000', '2020-12-23 22:59:33', '2020-12-30 21:15:16'),
('9', '2020-11-18 13:53:01', NULL, NULL, NULL, NULL, 'Staff HR & GA', '', '32000', '35000', '2020-12-23 22:59:33', '2020-12-30 21:15:17'),
('10', '2020-11-18 13:53:10', NULL, NULL, NULL, NULL, 'Koordinator security', '', '21500', '23500', '2020-12-23 22:59:33', '2020-12-24 06:10:16'),
('11', '2020-11-18 13:53:19', NULL, NULL, NULL, NULL, 'Office Boy', '', '21500', '23500', '2020-12-23 22:59:33', '2020-12-24 06:10:32'),
('13', '2020-11-18 13:54:00', NULL, NULL, NULL, NULL, 'Helper Enginer', '', '26500', '29000', '2020-12-23 22:59:33', '2020-12-24 06:11:16'),
('14', '2020-11-18 13:54:32', NULL, NULL, NULL, NULL, 'Supervisor Finance Accounting', '', '37500', '40500', '2020-12-23 22:59:33', '2020-12-24 06:11:40'),
('15', '2020-11-18 13:55:26', NULL, NULL, NULL, NULL, 'Supervisor Engineer dan Logistik', '', '37500', '40500', '2020-12-23 22:59:33', '2020-12-24 06:11:58'),
('16', '2020-11-18 13:55:41', NULL, NULL, NULL, NULL, 'Staff Finance Dan Accounting', '', '32000', '35000', '2020-12-23 22:59:33', '2020-12-24 06:12:34'),
('17', '2020-11-18 13:57:15', NULL, NULL, NULL, NULL, 'Supervisor Administrasi', '', '37500', '40500', '2020-12-23 22:59:33', '2020-12-24 06:12:54'),
('18', '2020-11-18 13:58:26', NULL, NULL, NULL, NULL, 'Security', '', '21500', '23500', '2020-12-23 22:59:33', '2020-12-24 06:13:08'),
('19', '2020-11-18 13:58:45', NULL, NULL, NULL, NULL, 'Staff Administrasi', '', '32000', '35000', '2020-12-23 22:59:33', '2020-12-24 06:13:32'),
('20', '2020-11-18 13:59:00', NULL, NULL, NULL, NULL, 'Assistant Manager Purchasing & Logistik', '', '37500', '40500', '2020-12-23 22:59:33', '2020-12-30 21:15:10'),
('21', '2020-11-18 13:59:13', NULL, NULL, NULL, NULL, 'Assistant Manager FinAcc dan HRD', '', '37500', '40500', '2020-12-23 22:59:33', '2020-12-30 21:15:11');

INSERT INTO `sk_direksi` (`id`, `no_sk`, `perihal`, `date_release`, `on_create`, `on_update`) VALUES
('1', 'SK 001-SK-LBR-DIR-PMJ-IX-2019', 'Waktu kerja lembur dan upah kerja lembur', '2019-09-16', '2020-12-23 23:00:04', NULL),
('2', 'SK 002-SK-MKN-TRNSP-DIR-PMJ-IX-2019', 'Tunjangan uang makan dan transport', '2019-09-15', '2020-12-23 23:00:04', NULL),
('3', 'SK 001-SK-IBD-DIR-PMJ-I-2018', 'Penyelenggaran Haji', '2018-01-17', '2020-12-23 23:00:04', NULL),
('4', 'SK 002-SK-PD-DIR-PMJ-III-2018', 'Perjalanan Dinas', '2018-05-01', '2020-12-23 23:00:04', NULL),
('5', 'SK 003-SK-KPR-DIR-PMJ-IV-2018', 'Tunjangan Fasilitas Kepemilikan Rumah Karyawan', '2018-04-09', '2020-12-23 23:00:04', NULL),
('6', 'SK 004-SK-HRD-PMJ-V-2018', 'Revisi Pengaktifan Tunjangan Cuti Tahunan', '2018-06-22', '2020-12-23 23:00:04', NULL),
('7', 'SK 007-SK-DIR-PMJ-V-2017', 'Review Penilaian Prestasi Kerja Kenaikan Gaji & Bonus', '2017-10-13', '2020-12-23 23:00:04', NULL),
('8', 'SK 001-SK-KES-DIR-PMJ-XI-2015', 'Tunjangan Kesehatan', '2015-11-17', '2020-12-23 23:00:04', NULL),
('9', 'SK 006-SK-DIR-PMJ-IX-2011', 'Santunan Kematian Keluarga', '2011-10-12', '2020-12-23 23:00:04', NULL);

INSERT INTO `sk_direksi_file` (`id`, `name`, `filename`, `sk_direksi_id`, `on_create`, `on_update`) VALUES
('1', 'Santunan Kematian Keluarga', '2011_-_SK_006-SK-DIR-PMJ-IX-2011_Santunan_Kematian_Keluarga.pdf', '9', '2020-12-30 20:54:07', NULL),
('2', 'Tunjangan Kesehatan', '2015_-_SK_001-SK-KES-DIR-PMJ-XI-2015_Tunjangan_Kesehatan.pdf', '8', '2020-12-30 20:54:44', NULL),
('4', 'Review Penilaian Kerja Kenaikan gaji dan bonus', '2017_-_SK_007-SK-DIR-PMJ-X-2017_Review_Penilaian_Prestasi_Kerja_Kenaikan_Gaji_Bonus011.pdf', '7', '2020-12-30 20:55:37', NULL),
('5', 'Revisi Pengaktifan tunjangan cuti tahunan', '2018_-_SK_004-SK-HRD-PMJ-V-2018_REVISI_Pengaktifan_Tunjangan_Cuti_Tahunan.pdf', '6', '2020-12-30 20:56:32', NULL),
('6', 'Tunjangan Fasilitas Kepemilikan Rumah Karyawan', '2018_-_SK_003-SK-KPR-DIR-PMJ-IV-2018_Tunjangan_Fasilitas_Kepemilikan_Rumah_Karyawan-halaman-1-3.pdf', '5', '2020-12-30 20:57:11', NULL),
('7', 'Perjalanan Dinas', '2018_-_SK_002-SK-PD-DIR-PMJ-III-2018_Perjalanan_Dinas.pdf', '4', '2020-12-30 20:57:40', NULL),
('8', 'Penyelengara Haji', '2018_-_SK_001-SK-IBD-DIR-PMJ-I-2018_Penyelenggaran_Haji.pdf', '3', '2020-12-30 20:58:06', NULL),
('9', 'Tunjangan Uang Makan dan Transport', '2019_-_SK_002-SK-MKN-TRNSP-DIR-PMJ-IX-2019_tunjangan_uang_makan_dan_transport-halaman-1-2.pdf', '2', '2020-12-30 20:58:41', NULL),
('10', 'tentang waktu kerja lembur dan upah kerja lembur', '2019_-_SK_001-SK-LBR-DIR-PMJ-IX-2019_tentang_waktu_kerja_lembur_dan_upah_kerja_lembur-halaman-1-4.pdf', '1', '2020-12-30 20:59:17', NULL);

INSERT INTO `t_flow` (`id`, `approval_date`, `user_id`, `approval_catatan`, `approval_status`, `flow_id`, `to_user`, `from_level_no`, `level_no`, `created_by`, `created_at`, `finish`, `on_create`, `on_update`) VALUES
('19', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('20', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '2', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('21', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '2', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('22', NULL, NULL, NULL, NULL, '3', NULL, NULL, '1', '2', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('23', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '2', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('24', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '2', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('27', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '1', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('31', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('33', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '1', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('34', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '1', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('35', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '1', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('36', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('39', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '2', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('40', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '2', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('41', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '2', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('53', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '22', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('56', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '26', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('57', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '26', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('58', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '1', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('59', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', '2020-12-21 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('73', NULL, NULL, NULL, NULL, '5', NULL, NULL, '1', '10', '2020-12-22 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('77', NULL, NULL, NULL, NULL, '3', NULL, NULL, '1', '26', '2020-12-22 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('78', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '26', '2020-12-22 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('83', NULL, NULL, NULL, NULL, '5', NULL, NULL, '1', '10', '2020-12-22 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('84', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '26', '2020-12-22 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('86', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '23', '2020-12-22 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('88', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '23', '2020-12-23 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('89', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '23', '2020-12-23 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('90', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '1', '2020-12-23 00:00:00', '0', '2020-12-23 23:02:08', NULL),
('92', '2020-12-29', '27', 'OK', 'ekposisi', '5', NULL, '5', '6', '10', '2020-12-24 00:00:00', '1', '2020-12-24 05:34:49', '2020-12-29 12:29:08'),
('96', NULL, NULL, NULL, NULL, '5', NULL, NULL, '1', '10', '2020-12-24 00:00:00', '0', '2020-12-24 11:30:51', NULL),
('97', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '23', '2020-12-24 00:00:00', '0', '2020-12-24 11:35:11', NULL),
('98', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-24 00:00:00', '0', '2020-12-24 11:38:00', NULL),
('99', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', '2020-12-24 00:00:00', '0', '2020-12-24 12:45:25', NULL),
('100', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', '2020-12-24 00:00:00', '0', '2020-12-24 19:54:07', NULL),
('102', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-25 00:00:00', '0', '2020-12-25 20:14:32', NULL),
('103', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-25 00:00:00', '0', '2020-12-25 20:24:00', NULL),
('104', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-25 00:00:00', '0', '2020-12-25 20:24:49', NULL),
('105', '2020-12-25', '23', NULL, 'ekposisi', '1', '26', '1', '2', '23', '2020-12-25 00:00:00', '0', '2020-12-25 20:28:05', '2020-12-25 20:28:09'),
('106', '2020-12-25', '23', NULL, 'ekposisi', '1', '26', '1', '2', '23', '2020-12-25 00:00:00', '0', '2020-12-25 20:28:49', '2020-12-25 20:28:59'),
('109', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '26', '2020-12-26 00:00:00', '0', '2020-12-26 16:06:00', NULL),
('110', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-26 00:00:00', '0', '2020-12-26 20:21:15', NULL),
('111', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '23', '2020-12-26 00:00:00', '0', '2020-12-26 20:36:41', NULL),
('113', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '23', '2020-12-26 00:00:00', '0', '2020-12-26 20:59:34', NULL),
('114', NULL, NULL, NULL, NULL, '5', NULL, NULL, '1', '10', '2020-12-26 00:00:00', '0', '2020-12-26 21:08:53', NULL),
('115', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '26', '2020-12-28 00:00:00', '0', '2020-12-28 06:23:11', NULL),
('116', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '10', '2020-12-28 00:00:00', '0', '2020-12-28 11:21:19', NULL),
('117', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '23', '2020-12-28 00:00:00', '0', '2020-12-28 16:12:00', NULL),
('118', NULL, NULL, NULL, NULL, '3', NULL, NULL, '1', '23', '2020-12-28 00:00:00', '0', '2020-12-28 16:12:06', NULL),
('122', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 07:39:41', NULL),
('123', NULL, NULL, NULL, NULL, '3', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 07:39:46', NULL),
('124', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 07:40:28', NULL),
('125', NULL, NULL, NULL, NULL, '5', NULL, NULL, '1', '10', '2020-12-29 00:00:00', '0', '2020-12-29 07:40:46', NULL),
('126', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 07:41:43', NULL),
('127', NULL, NULL, NULL, NULL, '3', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 07:50:43', NULL),
('128', NULL, NULL, NULL, NULL, '4', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 07:50:51', NULL),
('129', NULL, NULL, NULL, NULL, '2', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 07:50:57', NULL),
('130', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 07:51:02', NULL),
('132', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 08:14:41', NULL),
('133', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 08:20:28', NULL),
('134', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-29 00:00:00', '0', '2020-12-29 08:55:10', NULL),
('141', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-30 07:20:19', '0', '2020-12-30 07:20:19', NULL),
('142', NULL, NULL, NULL, NULL, '6', NULL, NULL, '1', '23', '2020-12-30 07:47:15', '0', '2020-12-30 07:47:15', NULL),
('143', NULL, NULL, NULL, NULL, '6', NULL, NULL, '1', '22', '2020-12-30 08:21:47', '0', '2020-12-30 08:21:47', NULL),
('144', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '22', '2020-12-30 08:24:54', '0', '2020-12-30 08:24:54', NULL),
('145', NULL, NULL, NULL, NULL, '6', NULL, NULL, '1', '22', '2020-12-30 08:29:18', '0', '2020-12-30 08:29:18', NULL),
('149', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '25', '2020-12-30 11:07:52', '0', '2020-12-30 11:07:52', NULL),
('150', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-30 11:09:54', '0', '2020-12-30 11:09:54', NULL),
('152', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-30 17:32:24', '0', '2020-12-30 17:32:24', NULL),
('153', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2020-12-30 17:44:01', '0', '2020-12-30 17:44:01', NULL),
('154', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '22', '2020-12-30 17:46:41', '0', '2020-12-30 17:46:41', NULL),
('160', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '22', '2020-12-31 07:38:48', '0', '2020-12-31 07:38:48', NULL),
('162', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '23', '2021-01-04 12:49:06', '0', '2021-01-04 12:49:06', NULL),
('163', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '26', '2021-01-04 12:49:52', '0', '2021-01-04 12:49:52', NULL),
('164', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '22', '2021-01-04 13:40:20', '0', '2021-01-04 13:40:20', NULL),
('165', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', '2021-01-04 13:42:37', '0', '2021-01-04 13:42:37', NULL),
('166', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '22', '2021-01-04 13:43:46', '0', '2021-01-04 13:43:46', NULL),
('167', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '22', '2021-01-04 13:47:02', '0', '2021-01-04 13:47:02', NULL),
('168', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '22', '2021-01-04 13:48:25', '0', '2021-01-04 13:48:25', NULL),
('173', '2021-01-08', '7', '', 'ekposisi', '4', NULL, '4', '5', '15', '2021-01-06 06:20:41', '0', '2021-01-06 06:20:41', '2021-01-08 15:13:47'),
('178', NULL, '1', NULL, NULL, '1', NULL, '1', '6', '1', '2021-01-06 07:36:00', '1', '2021-01-06 07:36:00', NULL),
('179', NULL, '1', NULL, NULL, '1', NULL, '1', '6', '1', '2021-01-06 07:36:00', '1', '2021-01-06 07:36:00', NULL),
('180', NULL, '1', NULL, NULL, '1', NULL, '1', '6', '1', '2021-01-06 07:36:00', '1', '2021-01-06 07:36:00', NULL),
('181', NULL, '1', NULL, NULL, '1', NULL, '1', '6', '1', '2021-01-06 07:36:00', '1', '2021-01-06 07:36:00', NULL),
('182', NULL, '1', NULL, NULL, '1', NULL, '1', '6', '1', '2021-01-06 07:36:00', '1', '2021-01-06 07:36:00', NULL),
('183', NULL, '1', NULL, NULL, '1', NULL, '1', '6', '1', '2021-01-06 07:36:00', '1', '2021-01-06 07:36:00', NULL),
('184', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '22', '2021-01-06 07:56:02', '0', '2021-01-06 07:56:02', NULL),
('185', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', '2021-01-06 07:58:21', '0', '2021-01-06 07:58:21', NULL),
('187', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '12', '2021-01-06 08:06:48', '0', '2021-01-06 08:06:48', NULL),
('189', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '49', '2021-01-06 08:57:06', '0', '2021-01-06 08:57:06', NULL),
('191', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '12', '2021-01-06 10:54:12', '0', '2021-01-06 10:54:12', NULL),
('192', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '15', '2021-01-06 13:17:16', '0', '2021-01-06 13:17:16', NULL),
('193', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '15', '2021-01-06 13:17:37', '0', '2021-01-06 13:17:37', NULL),
('194', NULL, NULL, NULL, NULL, '3', NULL, NULL, '1', '25', '2021-01-07 14:10:46', '0', '2021-01-07 14:10:46', NULL),
('195', '2021-01-08', '7', '', 'ekposisi', '3', NULL, '3', '4', '25', '2021-01-07 16:07:18', '0', '2021-01-07 16:07:18', '2021-01-08 15:10:23'),
('196', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '1', '2021-01-08 05:48:19', '0', '2021-01-08 05:48:19', NULL),
('197', '2021-01-08', '7', '', 'ekposisi', '6', NULL, '2', '3', '22', '2021-01-08 10:17:30', '0', '2021-01-08 10:17:30', '2021-01-08 15:23:23'),
('199', NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', '26', '2021-01-08 13:57:44', '0', '2021-01-08 13:57:44', NULL),
('200', '2021-01-08', '7', '', 'ekposisi', '6', NULL, '2', '3', '22', '2021-01-08 14:37:37', '0', '2021-01-08 14:37:37', '2021-01-08 15:23:02'),
('201', NULL, NULL, NULL, NULL, '6', NULL, NULL, '1', '22', '2021-01-08 17:06:28', '0', '2021-01-08 17:06:28', NULL),
('203', '2021-01-12', '7', '', 'ekposisi', '4', NULL, '4', '5', '19', '2021-01-11 12:54:36', '0', '2021-01-11 12:54:36', '2021-01-12 10:00:53'),
('204', '2021-01-12', '7', '', 'ekposisi', '4', NULL, '4', '5', '19', '2021-01-11 12:57:11', '0', '2021-01-11 12:57:11', '2021-01-12 10:00:39'),
('206', '2021-01-12', '21', NULL, 'ekposisi', '1', '27', '1', '2', '21', '2021-01-12 10:17:54', '0', '2021-01-12 10:17:54', '2021-01-12 10:19:02');

INSERT INTO `t_flow_history` (`id`, `approval_date`, `user_id`, `approval_catatan`, `approval_status`, `flow_id`, `to_user`, `from_level_no`, `level_no`, `t_flow_id`, `on_create`, `on_update`) VALUES
('35', '2020-12-23', '10', NULL, 'ekposisi', '5', NULL, '1', '2', '92', '2020-12-24 05:36:18', NULL),
('36', '2020-12-25', '23', NULL, 'ekposisi', '1', '26', '1', '2', '105', '2020-12-25 20:28:09', NULL),
('37', '2020-12-25', '23', NULL, 'ekposisi', '1', '26', '1', '2', '106', '2020-12-25 20:28:59', NULL),
('67', '2020-12-29', '22', 'ok', 'ekposisi', '5', NULL, '2', '3', '92', '2020-12-29 12:26:24', NULL),
('68', '2020-12-29', '7', 'ok', 'ekposisi', '5', NULL, '3', '4', '92', '2020-12-29 12:27:50', NULL),
('69', '2020-12-29', '9', 'OK', 'ekposisi', '5', NULL, '4', '5', '92', '2020-12-29 12:28:31', NULL),
('70', '2020-12-29', '27', 'OK', 'ekposisi', '5', NULL, '5', '6', '92', '2020-12-29 12:29:08', NULL),
('138', '2021-01-05', '15', NULL, 'ekposisi', '4', NULL, '1', '3', '173', '2021-01-06 06:23:37', NULL),
('139', '2021-01-07', '22', 'OK', 'ekposisi', '4', NULL, '3', '4', '173', '2021-01-07 13:40:05', NULL),
('143', '2021-01-07', '25', NULL, 'ekposisi', '3', NULL, '1', '2', '195', '2021-01-07 16:10:35', NULL),
('144', '2021-01-07', '22', 'OK\r\nmohon di Approve ya Bu Yuke \r\nTerimakasih', 'ekposisi', '3', NULL, '2', '3', '195', '2021-01-07 16:13:29', NULL),
('157', '2021-01-08', '22', NULL, 'ekposisi', '6', NULL, '1', '2', '197', '2021-01-08 10:29:40', NULL),
('158', '2021-01-08', '22', NULL, 'ekposisi', '6', NULL, '1', '2', '200', '2021-01-08 15:03:25', NULL),
('159', '2021-01-08', '7', '', 'ekposisi', '3', NULL, '3', '4', '195', '2021-01-08 15:10:23', NULL),
('160', '2021-01-08', '7', '', 'ekposisi', '4', NULL, '4', '5', '173', '2021-01-08 15:13:47', NULL),
('161', '2021-01-08', '7', '', 'ekposisi', '6', NULL, '2', '3', '200', '2021-01-08 15:23:02', NULL),
('162', '2021-01-08', '7', '', 'ekposisi', '6', NULL, '2', '3', '197', '2021-01-08 15:23:23', NULL),
('164', '2021-01-11', '19', NULL, 'ekposisi', '4', NULL, '1', '3', '203', '2021-01-11 12:57:03', NULL),
('165', '2021-01-11', '19', NULL, 'ekposisi', '4', NULL, '1', '3', '204', '2021-01-11 13:00:52', NULL),
('166', '2021-01-11', '22', 'OK, mohon bantuannya Approval Ya Bu Terimakasih', 'ekposisi', '4', NULL, '3', '4', '204', '2021-01-11 15:00:10', NULL),
('167', '2021-01-11', '22', 'OK, mohon bantuannya Approval Ya Bu Terimakasih', 'ekposisi', '4', NULL, '3', '4', '203', '2021-01-11 15:00:28', NULL),
('169', '2021-01-12', '7', '', 'ekposisi', '4', NULL, '4', '5', '204', '2021-01-12 10:00:39', NULL),
('170', '2021-01-12', '7', '', 'ekposisi', '4', NULL, '4', '5', '203', '2021-01-12 10:00:54', NULL),
('172', '2021-01-12', '21', NULL, 'ekposisi', '1', '27', '1', '2', '206', '2021-01-12 10:19:02', NULL);

CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `deposit_cuti_tahun_sebelumnya` AS select `tbl2`.`id` AS `id`,`tbl2`.`employee_id` AS `employee_id`,`tbl2`.`employee_name` AS `employee_name`,`tbl2`.`jumlah_hari` AS `jumlah_hari`,`tbl2`.`jenis_cuti_id` AS `jenis_cuti_id`,`tbl2`.`finish` AS `finish`,`tbl2`.`total_hari` AS `total_hari`,`tbl2`.`tahun` AS `tahun`,`tbl2`.`total_cuti` AS `total_cuti`,12 - sum(`tbl2`.`total_cuti`) AS `deposit` from (select `tbl1`.`id` AS `id`,`tbl1`.`employee_id` AS `employee_id`,`tbl1`.`employee_name` AS `employee_name`,`tbl1`.`jumlah_hari` AS `jumlah_hari`,`tbl1`.`jenis_cuti_id` AS `jenis_cuti_id`,`tbl1`.`finish` AS `finish`,`tbl1`.`total_hari` AS `total_hari`,`tbl1`.`tahun` AS `tahun`,case when `tbl1`.`jumlah_hari` - `tbl1`.`total_hari` < 0 then 0 else `tbl1`.`jumlah_hari` - `tbl1`.`total_hari` end AS `total_cuti` from (select `u5981556_pmj`.`p_cuti`.`id` AS `id`,`u5981556_pmj`.`p_cuti`.`employee_id` AS `employee_id`,`v_t_flow`.`employee_name` AS `employee_name`,`u5981556_pmj`.`p_cuti`.`jumlah_hari` AS `jumlah_hari`,`u5981556_pmj`.`p_cuti`.`jenis_cuti_id` AS `jenis_cuti_id`,`v_t_flow`.`finish` AS `finish`,`u5981556_pmj`.`m_jenis_cuti`.`total_hari` AS `total_hari`,year(`u5981556_pmj`.`p_cuti`.`tanggal_cuti_start`) AS `tahun` from ((`u5981556_pmj`.`p_cuti` left join `u5981556_pmj`.`v_t_flow` on(`u5981556_pmj`.`p_cuti`.`t_flow_id` = `v_t_flow`.`id`)) left join `u5981556_pmj`.`m_jenis_cuti` on(`u5981556_pmj`.`p_cuti`.`jenis_cuti_id` = `u5981556_pmj`.`m_jenis_cuti`.`id`)) where `v_t_flow`.`finish` = 1) `tbl1`) `tbl2` where `tbl2`.`tahun` = year(current_timestamp()) - 1 group by `tbl2`.`employee_id`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `remainder_legal_perusahaan` AS select `legal_perusahaan`.`id` AS `id`,`legal_perusahaan`.`no` AS `no`,`legal_perusahaan`.`name` AS `name`,`legal_perusahaan`.`desc` AS `desc`,`legal_perusahaan`.`date_realease` AS `date_realease`,`legal_perusahaan`.`date_finish` AS `date_finish`,`legal_perusahaan`.`on_create` AS `on_create`,`legal_perusahaan`.`on_update` AS `on_update`,to_days(`legal_perusahaan`.`date_finish`) - to_days(current_timestamp()) AS `remainder` from `legal_perusahaan` where to_days(`legal_perusahaan`.`date_finish`) - to_days(current_timestamp()) < 60;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `remainder_m_kendaraan` AS select `tbl1`.`id` AS `id`,`tbl1`.`no` AS `no`,`tbl1`.`nama_pemilik` AS `nama_pemilik`,`tbl1`.`jenis` AS `jenis`,`tbl1`.`type` AS `type`,`tbl1`.`nopol` AS `nopol`,`tbl1`.`tahun` AS `tahun`,`tbl1`.`stnk` AS `stnk`,`tbl1`.`bpkp` AS `bpkp`,`tbl1`.`on_create` AS `on_create`,`tbl1`.`on_update` AS `on_update`,`tbl1`.`remainder_stnk` AS `remainder_stnk`,`tbl1`.`remainder_bpkb` AS `remainder_bpkb` from (select `u5981556_pmj`.`m_kendaraan`.`id` AS `id`,`u5981556_pmj`.`m_kendaraan`.`no` AS `no`,`u5981556_pmj`.`m_kendaraan`.`nama_pemilik` AS `nama_pemilik`,`u5981556_pmj`.`m_kendaraan`.`jenis` AS `jenis`,`u5981556_pmj`.`m_kendaraan`.`type` AS `type`,`u5981556_pmj`.`m_kendaraan`.`nopol` AS `nopol`,`u5981556_pmj`.`m_kendaraan`.`tahun` AS `tahun`,`u5981556_pmj`.`m_kendaraan`.`stnk` AS `stnk`,`u5981556_pmj`.`m_kendaraan`.`bpkp` AS `bpkp`,`u5981556_pmj`.`m_kendaraan`.`on_create` AS `on_create`,`u5981556_pmj`.`m_kendaraan`.`on_update` AS `on_update`,to_days(`u5981556_pmj`.`m_kendaraan`.`stnk`) - to_days(current_timestamp()) AS `remainder_stnk`,to_days(`u5981556_pmj`.`m_kendaraan`.`bpkp`) - to_days(current_timestamp()) AS `remainder_bpkb` from `u5981556_pmj`.`m_kendaraan`) `tbl1` where `tbl1`.`remainder_bpkb` < 60 or `tbl1`.`remainder_bpkb` < 60;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_level_finish` AS select `m_flow_level`.`id` AS `id`,`m_flow_level`.`level_name` AS `level_name`,`m_flow_level`.`level_no` AS `level_no`,`m_flow_level`.`form_id` AS `form_id`,`m_flow_level`.`form_id_read` AS `form_id_read`,`m_flow_level`.`usergroup_id` AS `usergroup_id`,`m_flow_level`.`form_many` AS `form_many`,`m_flow_level`.`form_many_read` AS `form_many_read`,`m_flow_level`.`to_user` AS `to_user`,`m_flow_level`.`flow_id` AS `flow_id`,`m_flow_level`.`back_to_level_no` AS `back_to_level_no`,`m_flow_level`.`is_approve_leader` AS `is_approve_leader`,`m_flow_level`.`on_create` AS `on_create`,`m_flow_level`.`on_update` AS `on_update`,max(`m_flow_level`.`level_no`) AS `finish` from `m_flow_level` group by `m_flow_level`.`flow_id`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_p_klaim_kesehatan` AS select `p_klaim_kesehatan`.`id` AS `id`,`p_klaim_kesehatan`.`tanggal` AS `tanggal`,`p_klaim_kesehatan`.`employee_id` AS `employee_id`,`p_klaim_kesehatan`.`t_flow_id` AS `t_flow_id`,`p_klaim_kesehatan`.`no` AS `no`,concat(case when `p_klaim_kesehatan`.`id` < 10 then concat('00',`p_klaim_kesehatan`.`id`) when `p_klaim_kesehatan`.`id` > 9 and `p_klaim_kesehatan`.`id` < 100 then concat('0',`p_klaim_kesehatan`.`id`) else `p_klaim_kesehatan`.`id` end,'/FFK/HRD/PMJ/',case extract(month from `p_klaim_kesehatan`.`tanggal`) when '1' then 'I' when '2' then 'II' when '3' then 'III' when '4' then 'IV' when '5' then 'V' when '6' then 'VI' when '7' then 'VII' when '8' then 'VIII' when '9' then 'IX' when '10' then 'X' when '11' then 'XI' when '12' then 'XII' end,'/',extract(year from `p_klaim_kesehatan`.`tanggal`)) AS `nomor`,`t_flow`.`level_no` AS `level_no` from (`p_klaim_kesehatan` left join `t_flow` on(`p_klaim_kesehatan`.`t_flow_id` = `t_flow`.`id`));
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_p_perjalanan_dinas` AS select `p_perjalanan_dinas`.`id` AS `id`,`p_perjalanan_dinas`.`tanggal_berangkat` AS `tanggal_berangkat`,`p_perjalanan_dinas`.`employee_id` AS `employee_id`,`p_perjalanan_dinas`.`tanggal_kembali` AS `tanggal_kembali`,`p_perjalanan_dinas`.`supervisor_id` AS `supervisor_id`,`p_perjalanan_dinas`.`tujuan` AS `tujuan`,`p_perjalanan_dinas`.`kota` AS `kota`,`p_perjalanan_dinas`.`uraian` AS `uraian`,`p_perjalanan_dinas`.`keterangan` AS `keterangan`,`p_perjalanan_dinas`.`total_fee_planning` AS `total_fee_planning`,`p_perjalanan_dinas`.`total_free_realisasi` AS `total_free_realisasi`,`p_perjalanan_dinas`.`t_flow_id` AS `t_flow_id`,`p_perjalanan_dinas`.`no` AS `no`,concat(case when `p_perjalanan_dinas`.`id` < 10 then concat('00',`p_perjalanan_dinas`.`id`) when `p_perjalanan_dinas`.`id` > 9 and `p_perjalanan_dinas`.`id` < 100 then concat('0',`p_perjalanan_dinas`.`id`) else `p_perjalanan_dinas`.`id` end,'/SPPD/HRD/PMJ/',case extract(month from `p_perjalanan_dinas`.`tanggal_berangkat`) when '1' then 'I' when '2' then 'II' when '3' then 'III' when '4' then 'IV' when '5' then 'V' when '6' then 'VI' when '7' then 'VII' when '8' then 'VIII' when '9' then 'IX' when '10' then 'X' when '11' then 'XI' when '12' then 'XII' end,'/',extract(year from `p_perjalanan_dinas`.`tanggal_berangkat`)) AS `nomor_sppd`,concat(case when `p_perjalanan_dinas`.`id` < 10 then concat('00',`p_perjalanan_dinas`.`id`) when `p_perjalanan_dinas`.`id` > 9 and `p_perjalanan_dinas`.`id` < 100 then concat('0',`p_perjalanan_dinas`.`id`) else `p_perjalanan_dinas`.`id` end,'/LBPD/HRD/PMJ/',case extract(month from `p_perjalanan_dinas`.`tanggal_kembali`) when '1' then 'I' when '2' then 'II' when '3' then 'III' when '4' then 'IV' when '5' then 'V' when '6' then 'VI' when '7' then 'VII' when '8' then 'VIII' when '9' then 'IX' when '10' then 'X' when '11' then 'XI' when '12' then 'XII' end,'/',extract(year from `p_perjalanan_dinas`.`tanggal_kembali`)) AS `nomor_lbpd` from `p_perjalanan_dinas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_p_perjalanan_dinas_item` AS select `p_perjalanan_dinas_item`.`id` AS `id`,`p_perjalanan_dinas_item`.`name` AS `name`,`p_perjalanan_dinas_item`.`value_planning` AS `value_planning`,`p_perjalanan_dinas_item`.`filename` AS `filename`,`p_perjalanan_dinas_item`.`keterangan` AS `keterangan`,`p_perjalanan_dinas_item`.`categori_id` AS `categori_id`,`p_perjalanan_dinas_item`.`value_realisasi` AS `value_realisasi`,`p_perjalanan_dinas_item`.`perjalanan_dinas_id` AS `perjalanan_dinas_id`,`p_perjalanan_dinas_item`.`on_create` AS `on_create`,`p_perjalanan_dinas_item`.`on_update` AS `on_update` from `p_perjalanan_dinas_item` union select '1000000001' AS `id`,'TOTAL' AS `name`,sum(`p_perjalanan_dinas_item`.`value_planning`) AS `value_planning`,'' AS `filename`,'' AS `keterangan`,'' AS `categori_id`,sum(`p_perjalanan_dinas_item`.`value_realisasi`) AS `value_realisasi`,`p_perjalanan_dinas_item`.`perjalanan_dinas_id` AS `perjalanan_dinas_id`,`p_perjalanan_dinas_item`.`on_create` AS `on_create`,`p_perjalanan_dinas_item`.`on_update` AS `on_update` from `p_perjalanan_dinas_item` group by `p_perjalanan_dinas_item`.`perjalanan_dinas_id`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_p_service_kendaraan` AS select `p_service_kendaraan`.`id` AS `id`,`p_service_kendaraan`.`kendaraan_id` AS `kendaraan_id`,`p_service_kendaraan`.`tanggal` AS `tanggal`,`p_service_kendaraan`.`odometer` AS `odometer`,`p_service_kendaraan`.`t_flow_id` AS `t_flow_id`,concat(case when `p_service_kendaraan`.`id` < 10 then concat('00',`p_service_kendaraan`.`id`) when `p_service_kendaraan`.`id` > 9 and `p_service_kendaraan`.`id` < 100 then concat('0',`p_service_kendaraan`.`id`) else `p_service_kendaraan`.`id` end,'/SERVICE/HRD/PMJ/',case extract(month from `p_service_kendaraan`.`tanggal`) when '1' then 'I' when '2' then 'II' when '3' then 'III' when '4' then 'IV' when '5' then 'V' when '6' then 'VI' when '7' then 'VII' when '8' then 'VIII' when '9' then 'IX' when '10' then 'X' when '11' then 'XI' when '12' then 'XII' end,'/',extract(year from `p_service_kendaraan`.`tanggal`)) AS `nomor` from `p_service_kendaraan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_r_p_cuti` AS select `p_cuti`.`id` AS `id`,`m_employee`.`name` AS `name`,`p_cuti`.`tanggal_cuti_start` AS `tanggal_cuti_start`,`p_cuti`.`tanggal_cuti_end` AS `tanggal_cuti_end`,`p_cuti`.`jumlah_hari` AS `jumlah_hari`,`p_cuti`.`jenis_cuti_id` AS `jenis_cuti_id`,`p_cuti`.`keperluan` AS `keperluan`,`p_cuti`.`alamat_cuti` AS `alamat_cuti`,`p_cuti`.`telephone` AS `telephone`,`t_flow`.`level_no` AS `level_no`,`p_cuti`.`t_flow_id` AS `t_flow_id`,year(`p_cuti`.`tanggal_cuti_start`) AS `tahun` from ((`p_cuti` left join `m_employee` on(`p_cuti`.`employee_id` = `m_employee`.`id`)) left join `t_flow` on(`p_cuti`.`t_flow_id` = `t_flow`.`id`));
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_r_p_etol` AS select `p_etol`.`id` AS `id`,`p_etol`.`tanggal` AS `tanggal`,`m_employee`.`name` AS `name`,`t_flow`.`level_no` AS `level_no`,sum(`p_etol_item`.`jumlah`) AS `TOTAL`,`p_etol`.`t_flow_id` AS `t_flow_id` from (((`p_etol` left join `p_etol_item` on(`p_etol`.`id` = `p_etol_item`.`etol_id`)) left join `m_employee` on(`p_etol`.`employee_id` = `m_employee`.`id`)) left join `t_flow` on(`p_etol`.`t_flow_id` = `t_flow`.`id`)) group by `p_etol`.`id`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_r_p_klaim_kesehatan` AS select `v_p_klaim_kesehatan`.`id` AS `id`,`v_p_klaim_kesehatan`.`nomor` AS `nomor`,`v_p_klaim_kesehatan`.`tanggal` AS `tanggal`,`m_employee`.`name` AS `name`,`t_flow`.`level_no` AS `level_no`,sum(`p_klaim_kesehatan_item`.`biaya`) AS `total_biaya`,`v_p_klaim_kesehatan`.`t_flow_id` AS `t_flow_id` from (((`v_p_klaim_kesehatan` left join `p_klaim_kesehatan_item` on(`v_p_klaim_kesehatan`.`id` = `p_klaim_kesehatan_item`.`klaim_kesehatan_id`)) left join `m_employee` on(`v_p_klaim_kesehatan`.`employee_id` = `m_employee`.`id`)) left join `t_flow` on(`v_p_klaim_kesehatan`.`t_flow_id` = `t_flow`.`id`)) group by `v_p_klaim_kesehatan`.`id`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_r_p_lembur` AS select `p_lembur`.`id` AS `id`,`p_lembur`.`tanggal` AS `tanggal`,`p_lembur`.`jenis_hari` AS `jenis_hari`,`m_employee`.`name` AS `name`,`p_lembur`.`lokasi` AS `lokasi`,`p_lembur`.`jam_mulai` AS `jam_mulai`,`p_lembur`.`jam_selesai` AS `jam_selesai`,`p_lembur`.`jam_selesai` - `p_lembur`.`jam_mulai` AS `lama`,case `p_lembur`.`jenis_hari` when 'kerja' then `p_lembur`.`uang_lembur` / (`p_lembur`.`jam_selesai` - `p_lembur`.`jam_mulai`) else NULL end AS `hari_kerja`,case `p_lembur`.`jenis_hari` when 'libur' then `p_lembur`.`uang_lembur` / (`p_lembur`.`jam_selesai` - `p_lembur`.`jam_mulai`) else NULL end AS `hari_libur`,`p_lembur`.`uang_lembur` AS `total_uang_lembur`,`p_lembur`.`uraian_tugas` AS `uraian_tugas`,`t_flow`.`level_no` AS `level_no`,`p_lembur`.`t_flow_id` AS `t_flow_id` from ((`p_lembur` left join `m_employee` on(`p_lembur`.`employee_id` = `m_employee`.`id`)) left join `t_flow` on(`p_lembur`.`t_flow_id` = `t_flow`.`id`)) where `p_lembur`.`uang_lembur` is not null;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_r_p_perjalanan_dinas` AS select `tbl2`.`id` AS `id`,`tbl2`.`nomor_lbpd` AS `nomor_lbpd`,`tbl2`.`nomor_sppd` AS `nomor_sppd`,`tbl2`.`tanggal_berangkat` AS `tanggal_berangkat`,`tbl2`.`tanggal_kembali` AS `tanggal_kembali`,`tbl2`.`name` AS `name`,`tbl2`.`supervisor` AS `supervisor`,`tbl2`.`tujuan` AS `tujuan`,`tbl2`.`kota` AS `kota`,`tbl2`.`uraian` AS `uraian`,`tbl2`.`keterangan` AS `keterangan`,`tbl2`.`planing` AS `planing`,`tbl2`.`realisasi` AS `realisasi`,`tbl2`.`planing` - `tbl2`.`realisasi` AS `selisih`,`tbl2`.`level_no` AS `level_no`,`tbl2`.`t_flow_id` AS `t_flow_id` from (select `tbl1`.`id` AS `id`,`tbl1`.`nomor_lbpd` AS `nomor_lbpd`,`tbl1`.`nomor_sppd` AS `nomor_sppd`,`tbl1`.`tanggal_berangkat` AS `tanggal_berangkat`,`tbl1`.`tanggal_kembali` AS `tanggal_kembali`,`tbl1`.`name` AS `name`,`u5981556_pmj`.`m_employee`.`name` AS `supervisor`,`tbl1`.`tujuan` AS `tujuan`,`tbl1`.`kota` AS `kota`,`tbl1`.`uraian` AS `uraian`,`tbl1`.`keterangan` AS `keterangan`,case when `tbl1`.`planing` is null then 0 else `tbl1`.`planing` end AS `planing`,case when `tbl1`.`realisasi` is null then 0 else `tbl1`.`realisasi` end AS `realisasi`,`tbl1`.`level_no` AS `level_no`,`tbl1`.`t_flow_id` AS `t_flow_id` from (((select `v_p_perjalanan_dinas`.`id` AS `id`,`v_p_perjalanan_dinas`.`nomor_lbpd` AS `nomor_lbpd`,`v_p_perjalanan_dinas`.`nomor_sppd` AS `nomor_sppd`,`v_p_perjalanan_dinas`.`tanggal_berangkat` AS `tanggal_berangkat`,`v_p_perjalanan_dinas`.`tanggal_kembali` AS `tanggal_kembali`,`u5981556_pmj`.`m_employee`.`name` AS `name`,`v_p_perjalanan_dinas`.`supervisor_id` AS `supervisor_id`,`v_p_perjalanan_dinas`.`tujuan` AS `tujuan`,`v_p_perjalanan_dinas`.`kota` AS `kota`,`v_p_perjalanan_dinas`.`uraian` AS `uraian`,`v_p_perjalanan_dinas`.`keterangan` AS `keterangan`,sum(`u5981556_pmj`.`p_perjalanan_dinas_item`.`value_planning`) AS `planing`,sum(`u5981556_pmj`.`p_perjalanan_dinas_item`.`value_realisasi`) AS `realisasi`,`u5981556_pmj`.`t_flow`.`level_no` AS `level_no`,`v_p_perjalanan_dinas`.`t_flow_id` AS `t_flow_id` from (((`u5981556_pmj`.`v_p_perjalanan_dinas` left join `u5981556_pmj`.`p_perjalanan_dinas_item` on(`v_p_perjalanan_dinas`.`id` = `u5981556_pmj`.`p_perjalanan_dinas_item`.`perjalanan_dinas_id`)) left join `u5981556_pmj`.`m_employee` on(`v_p_perjalanan_dinas`.`employee_id` = `u5981556_pmj`.`m_employee`.`id`)) left join `u5981556_pmj`.`t_flow` on(`v_p_perjalanan_dinas`.`t_flow_id` = `u5981556_pmj`.`t_flow`.`id`)) group by `v_p_perjalanan_dinas`.`id`)) `tbl1` left join `u5981556_pmj`.`m_employee` on(`tbl1`.`supervisor_id` = `u5981556_pmj`.`m_employee`.`id`))) `tbl2`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_t_flow` AS select `t_flow`.`id` AS `id`,`t_flow`.`approval_date` AS `approval_date`,`t_flow`.`user_id` AS `user_id`,`t_flow`.`approval_catatan` AS `approval_catatan`,`t_flow`.`approval_status` AS `approval_status`,`t_flow`.`flow_id` AS `flow_id`,`t_flow`.`to_user` AS `to_user`,`t_flow`.`from_level_no` AS `from_level_no`,`t_flow`.`level_no` AS `level_no`,`t_flow`.`created_by` AS `created_by`,`v_user`.`employee_name` AS `employee_name`,`t_flow`.`finish` AS `finish` from (`t_flow` join `v_user` on(`v_user`.`id` = `t_flow`.`created_by`));
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_t_flow_history` AS select `t_flow_history`.`id` AS `id`,`t_flow_history`.`approval_date` AS `approval_date`,`t_flow_history`.`user_id` AS `user_id`,`t_flow_history`.`approval_catatan` AS `approval_catatan`,`t_flow_history`.`approval_status` AS `approval_status`,`t_flow_history`.`flow_id` AS `flow_id`,`t_flow_history`.`to_user` AS `to_user`,`t_flow_history`.`from_level_no` AS `from_level_no`,`t_flow_history`.`level_no` AS `level_no`,`t_flow_history`.`t_flow_id` AS `t_flow_id`,`m_flow_level`.`level_name` AS `level_name` from (`t_flow_history` left join `m_flow_level` on(`t_flow_history`.`flow_id` = `m_flow_level`.`flow_id` and `t_flow_history`.`from_level_no` = `m_flow_level`.`level_no`));
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_total_cuti` AS select `tbl1`.`id` AS `employee_id`,`tbl1`.`name` AS `name`,`tbl1`.`deposit_cuti` AS `deposit_cuti`,`tbl1`.`deposit_tahun_sebelumnya` AS `deposit_tahun_sebelumnya`,case when `tbl1`.`deposit_cuti` + `tbl1`.`deposit_tahun_sebelumnya` > 12 then 12 else `tbl1`.`deposit_cuti` + `tbl1`.`deposit_tahun_sebelumnya` end AS `deposit` from (select `u5981556_pmj`.`m_employee`.`id` AS `id`,`u5981556_pmj`.`m_employee`.`name` AS `name`,`u5981556_pmj`.`m_employee`.`deposit_cuti` AS `deposit_cuti`,case when `deposit_cuti_tahun_sebelumnya`.`deposit` is null then 0 else `deposit_cuti_tahun_sebelumnya`.`deposit` end AS `deposit_tahun_sebelumnya` from (`u5981556_pmj`.`m_employee` left join `u5981556_pmj`.`deposit_cuti_tahun_sebelumnya` on(`u5981556_pmj`.`m_employee`.`id` = `deposit_cuti_tahun_sebelumnya`.`employee_id`))) `tbl1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`u5981556_system`@`%` SQL SECURITY DEFINER VIEW `v_user` AS select `s_user`.`id` AS `id`,`s_user`.`usergroup_id` AS `usergroup_id`,`s_user`.`email` AS `email`,`s_user`.`active` AS `active`,`s_user`.`employee_id` AS `employee_id`,`m_employee`.`name` AS `employee_name`,`s_usergroup`.`name` AS `usergroup_name` from ((`s_user` left join `m_employee` on(`m_employee`.`id` = `s_user`.`employee_id`)) left join `s_usergroup` on(`s_usergroup`.`id` = `s_user`.`usergroup_id`));


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;