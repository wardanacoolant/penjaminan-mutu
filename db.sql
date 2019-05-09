-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.6.35 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cias
DROP DATABASE IF EXISTS `pekael1`;
CREATE DATABASE IF NOT EXISTS `pekael1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pekael1`;

--
-- Table structure for table `dosen`
--

CREATE TABLE IF NOT EXISTS `tbl_dosen` (
  `nip_dosen` varchar(20) NOT NULL,
  `nidn_dosen` varchar(10) NOT NULL,
  `nama_dosen` varchar(30) NOT NULL,
  `jk_dosen` enum('Laki-laki','Perempuan','','') NOT NULL,
  `email_dosen` varchar(20) NOT NULL,
  PRIMARY KEY (`nip_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `tbl_mahasiswa` (
  `nim_mhs` varchar(10) NOT NULL,
  `nama_mhs` varchar(30) NOT NULL,
  `jk_mhs` enum('Laki-laki','Perempuan','','') NOT NULL,
  `tanggal_lahir_mhs` date NOT NULL,
  `alamat_mhs` varchar(20) NOT NULL,
  `no_telp_mhs` int(20) NOT NULL,
  `email_mhs` varchar(10) NOT NULL,
  `status_mhs` enum('Aktif','Non Aktif','','') NOT NULL,
  PRIMARY KEY (`nim_mhs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE IF NOT EXISTS `tbl_matakuliah` (
  `kode_matakuliah` varchar(10) NOT NULL,
  `nama_matakuliah` varchar(20) NOT NULL,
  `semester` int(2) NOT NULL,
  `sks` int(1) NOT NULL,
  `jenis_matakuliah` varchar(20) NOT NULL,
  `status_matakuliah` enum('Aktif','Non Aktif','','') NOT NULL,
  PRIMARY KEY (`kode_matakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah_per_semster`
--

CREATE TABLE IF NOT EXISTS `tbl_matakuliah_per_semster` (
  `semester` decimal(10,0) NOT NULL,
  `nim_mhs` varchar(10) NOT NULL,
  `nama_mhs` varchar(30) NOT NULL,
  `kode_matakuliah` varchar(10) NOT NULL,
  `nama_matakuliah` varchar(20) NOT NULL,
  PRIMARY KEY (`kode_matakuliah`),
  KEY `nim_mhs` (`nim_mhs`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `perkuliahan`
--

CREATE TABLE IF NOT EXISTS `tbl_perkuliahan` (
  `nim_mhs` varchar(10) NOT NULL DEFAULT '',
  `kode_matakuliah` varchar(10) DEFAULT NULL,
  `nip_dosen` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nim_mhs`),
  KEY `nim_mhs` (`nim_mhs`),
  KEY `kode_matakuliah` (`kode_matakuliah`),
  KEY `nip_dosen` (`nip_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rps`
--

CREATE TABLE IF NOT EXISTS `tbl_rps` (
  `nim_mhs` varchar(10) NOT NULL,
  `nama_mhs` varchar(30) NOT NULL,
  `kode_matakuliah` varchar(10) NOT NULL,
  `nama_matakuliah` varchar(20) NOT NULL,
  `nilai_keaktifan` float NOT NULL,
  `nilai_tugas_mandiri` float NOT NULL,
  `nilai_tugas_kelompok` float NOT NULL,
  `nilai_uts` float NOT NULL,
  `nilai_uas` float NOT NULL,
  `nilai_akhir` float NOT NULL,
  `nilai` char(2) NOT NULL,
  PRIMARY KEY (`nim_mhs`),
  KEY `kode_matakuliah` (`kode_matakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `matakuliah_per_semster`
--
ALTER TABLE `tbl_matakuliah_per_semster`
  ADD CONSTRAINT `matakuliah_per_semster_ibfk_1` FOREIGN KEY (`nim_mhs`) REFERENCES `tbl_mahasiswa` (`nim_mhs`),
  ADD CONSTRAINT `matakuliah_per_semster_ibfk_2` FOREIGN KEY (`kode_matakuliah`) REFERENCES `tbl_matakuliah` (`kode_matakuliah`);

--
-- Constraints for table `perkuliahan`
--
ALTER TABLE `tbl_perkuliahan`
  ADD CONSTRAINT `perkuliahan_ibfk_1` FOREIGN KEY (`nim_mhs`) REFERENCES `tbl_mahasiswa` (`nim_mhs`),
  ADD CONSTRAINT `perkuliahan_ibfk_2` FOREIGN KEY (`kode_matakuliah`) REFERENCES `tbl_matakuliah` (`kode_matakuliah`),
  ADD CONSTRAINT `perkuliahan_ibfk_3` FOREIGN KEY (`nip_dosen`) REFERENCES `tbl_dosen` (`nip_dosen`);

--
-- Constraints for table `rps`
--
ALTER TABLE `tbl_rps`
  ADD CONSTRAINT `rps_ibfk_1` FOREIGN KEY (`nim_mhs`) REFERENCES `tbl_mahasiswa` (`nim_mhs`),
  ADD CONSTRAINT `rps_ibfk_2` FOREIGN KEY (`kode_matakuliah`) REFERENCES `tbl_matakuliah` (`kode_matakuliah`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;


-- Dumping structure for table cias.tbl_items
DROP TABLE IF EXISTS `tbl_items`;
CREATE TABLE IF NOT EXISTS `tbl_items` (
  `itemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemHeader` varchar(512) NOT NULL COMMENT 'Heading',
  `itemSub` varchar(1021) NOT NULL COMMENT 'sub heading',
  `itemDesc` text COMMENT 'content or description',
  `itemImage` varchar(80) DEFAULT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table cias.tbl_items: 2 rows
/*!40000 ALTER TABLE `tbl_items` DISABLE KEYS */;
REPLACE INTO `tbl_items` (`itemId`, `itemHeader`, `itemSub`, `itemDesc`, `itemImage`, `isDeleted`, `createdBy`, `createdDtm`, `updatedDtm`, `updatedBy`) VALUES
	(1, 'jquery.validation.js', 'Contribution towards jquery.validation.js', 'jquery.validation.js is the client side javascript validation library authored by Jörn Zaefferer hosted on github for us and we are trying to contribute to it. Working on localization now', 'validation.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL),
	(2, 'CodeIgniter User Management', 'Demo for user management system', 'This the demo of User Management System (Admin Panel) using CodeIgniter PHP MVC Framework and AdminLTE bootstrap theme. You can download the code from the repository or forked it to contribute. Usage and installation instructions are provided in ReadMe.MD', 'cias.png', 0, 1, '2015-09-02 00:00:00', NULL, NULL);
/*!40000 ALTER TABLE `tbl_items` ENABLE KEYS */;

-- Dumping structure for table cias.tbl_reset_password
DROP TABLE IF EXISTS `tbl_reset_password`;
CREATE TABLE IF NOT EXISTS `tbl_reset_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `activation_id` varchar(32) NOT NULL,
  `agent` varchar(512) NOT NULL,
  `client_ip` varchar(32) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` bigint(20) NOT NULL DEFAULT '1',
  `createdDtm` datetime NOT NULL,
  `updatedBy` bigint(20) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table cias.tbl_reset_password: ~0 rows (approximately)
/*!40000 ALTER TABLE `tbl_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reset_password` ENABLE KEYS */;

-- Dumping structure for table cias.tbl_roles
DROP TABLE IF EXISTS `tbl_roles`;
CREATE TABLE IF NOT EXISTS `tbl_roles` (
  `roleId` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'role id',
  `role` varchar(50) NOT NULL COMMENT 'role text',
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table cias.tbl_roles: 3 rows
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
REPLACE INTO `tbl_roles` (`roleId`, `role`) VALUES
	(1, 'System Administrator'),
	(2, 'Manager'),
	(3, 'Employee');
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;

-- Dumping structure for table cias.tbl_users
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL COMMENT 'login email',
  `password` varchar(128) NOT NULL COMMENT 'hashed login password',
  `name` varchar(128) DEFAULT NULL COMMENT 'full name of user',
  `mobile` varchar(20) DEFAULT NULL,
  `roleId` tinyint(4) NOT NULL,
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  `createdBy` int(11) NOT NULL,
  `createdDtm` datetime NOT NULL,
  `updatedBy` int(11) DEFAULT NULL,
  `updatedDtm` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table cias.tbl_users: 3 rows
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
REPLACE INTO `tbl_users` (`userId`, `email`, `password`, `name`, `mobile`, `roleId`, `isDeleted`, `createdBy`, `createdDtm`, `updatedBy`, `updatedDtm`) VALUES
	(1, 'admin@gmail.com', '$2y$10$SAvFim22ptA9gHVORtIaru1dn9rhgerJlJCPxRNA02MjQaJnkxawq', 'Admin', '9890098900', 1, 0, 0, '2015-07-01 18:56:49', 1, '2017-06-19 09:22:53'),
	(2, 'dosen@gmail.com', '$2y$10$Gkl9ILEdGNoTIV9w/xpf3.mSKs0LB1jkvvPKK7K0PSYDsQY7GE9JK', 'Dosen', '9890098900', 2, 0, 1, '2016-12-09 17:49:56', 1, '2017-06-19 09:22:29'),
	(3, 'supervisor@gmail.com', '$2y$10$MB5NIu8i28XtMCnuExyFB.Ao1OXSteNpCiZSiaMSRPQx1F1WLRId2', 'Supervisor', '9890098900', 3, 0, 1, '2016-12-09 17:50:22', 1, '2017-06-19 09:23:21'),
	(4, 'mahasiswa@gmail.com', '$2y$10$tBwxx6JBGKmU1k2EZ.78R.OO5QQp/1JdO0iFRepNp.jjAUmCdJEr.', 'Mahasiswa', '1805673029', 2, 0, 1, '2019-04-12 14:31:59', NULL, NULL);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
