-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2016 at 08:13 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_columbia_compcenter`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jobdetails`
--

CREATE TABLE IF NOT EXISTS `tbl_jobdetails` (
  `jod_id` int(11) NOT NULL AUTO_INCREMENT,
  `jod_qty` int(11) NOT NULL,
  `jod_item` varchar(100) NOT NULL,
  `jod_serial` varchar(30) NOT NULL,
  `jod_complaint` varchar(100) NOT NULL,
  `jod_itemDesc` varchar(400) NOT NULL,
  `jo_no` int(11) NOT NULL,
  `jod_removed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`jod_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_jobdetails`
--

INSERT INTO `tbl_jobdetails` (`jod_id`, `jod_qty`, `jod_item`, `jod_serial`, `jod_complaint`, `jod_itemDesc`, `jo_no`, `jod_removed`) VALUES
(1, 1, 'MacBook', '21-3432gfdg3-423', 'Ning boto ang fan', '', 1, b'0'),
(2, 1, 'Phone', '3322fd', 'Guba ang screen', '', 1, b'1'),
(3, 1, 'HP', 'sdfdsfsdf', 'guba ang hardisk.', '', 2, b'0'),
(4, 1, 'Acer PC', 'erwersf4rsf', 'daot', '', 3, b'1'),
(5, 1, 'Sony Laptop', 'gfdgdf', 'Daot dili mu on', 'ITEM MODEL: vgn-ddeg\nCPU: intel core i3\nRAM: corsair 4gb\nSTORAGE: seagate 500gb\nOS INSTALLED: windows 7', 4, b'0'),
(6, 1, 's', 's', 's', ' ITEM MODEL: \r\n CPU: \r\n RAM: \r\n STORAGE: \r\n OS INSTALLED: ', 3, b'1'),
(7, 1, 'MacBook 5s', 'apples-121', 'dili mo on. takes forever on bootscreen', 'ITEM MODEL: Macbook 5s dual sim\r\nCPU: intel inner core i5s\r\nRAM: Corsair 4GB \r\nSTORAGE: 1 TB superfast\r\nOS INSTALLED: Mac OS xxx', 3, b'0'),
(8, 1, 'HP', 'sadwrs', 'daot ang screen', ' ITEM MODEL: hp-111\r\n CPU: intel core 2 duo 2.1 GHz\r\n RAM: Corsair 4 GB\r\n STORAGE: Seagate 500 GB\r\n OS INSTALLED: Windows 10 pro version 1511', 4, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_joborder`
--

CREATE TABLE IF NOT EXISTS `tbl_joborder` (
  `jo_no` int(11) NOT NULL AUTO_INCREMENT,
  `jo_fname` varchar(50) NOT NULL,
  `jo_lname` varchar(50) NOT NULL,
  `jo_mname` varchar(50) NOT NULL,
  `jo_add_street` varchar(30) NOT NULL,
  `jo_add_brgy` varchar(30) NOT NULL,
  `jo_add_city` varchar(30) NOT NULL,
  `jo_telno` varchar(8) NOT NULL,
  `jo_mobileNo` varchar(11) NOT NULL,
  `jo_conformedby` varchar(50) NOT NULL,
  `jo_serviceby` varchar(50) NOT NULL,
  `jo_releasedby` varchar(50) NOT NULL,
  `jo_status` int(11) NOT NULL,
  `jo_date` date NOT NULL,
  `jo_finishedDate` date DEFAULT NULL,
  `jo_picked-upDate` date DEFAULT NULL,
  `jo_deleteDate` date DEFAULT NULL,
  PRIMARY KEY (`jo_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_joborder`
--

INSERT INTO `tbl_joborder` (`jo_no`, `jo_fname`, `jo_lname`, `jo_mname`, `jo_add_street`, `jo_add_brgy`, `jo_add_city`, `jo_telno`, `jo_mobileNo`, `jo_conformedby`, `jo_serviceby`, `jo_releasedby`, `jo_status`, `jo_date`, `jo_finishedDate`, `jo_picked-upDate`, `jo_deleteDate`) VALUES
(1, 'Amor', 'Biritera', 'Sukass', 'Lacson', 'Matina Crossing', 'Davao City', '09091234', '', 'Oelbert', 'Oelbert', '', 3, '2016-02-09', '2016-02-09', '2016-02-09', NULL),
(2, 'Amor', 'Powers', 'T', 'Bangkerohan', 'Bangkerohan', 'Davao City', '344322', '', 'Jacob Cadelina', 'Jacob Cadelina', '', 1, '2016-02-09', '2016-02-09', NULL, NULL),
(3, 'Oelbert', 'Hermosisima', 'Robles', 'Narra', 'Daliao Toril', 'Davao City', '09092233', '', '', '', '', 2, '2016-02-13', NULL, NULL, NULL),
(4, 'Virgilio', 'Pedrosa', 'Paolo', 'Eart St GSIS Heights', 'Matina Crossing', 'Davao City', '', '', '09123456789', 'Jacob Cadelina', '', 2, '2016-02-20', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_people`
--

CREATE TABLE IF NOT EXISTS `tbl_people` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_fname` varchar(30) NOT NULL,
  `p_lname` varchar(30) NOT NULL,
  `p_mname` varchar(30) NOT NULL,
  `p_bdate` date NOT NULL,
  `p_address` varchar(100) NOT NULL,
  `p_mobile` varchar(11) NOT NULL,
  `p_username` varchar(50) NOT NULL,
  `p_password` varchar(500) NOT NULL,
  `p_flag` bit(1) NOT NULL DEFAULT b'1',
  `p_admin` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_people`
--

INSERT INTO `tbl_people` (`p_id`, `p_fname`, `p_lname`, `p_mname`, `p_bdate`, `p_address`, `p_mobile`, `p_username`, `p_password`, `p_flag`, `p_admin`) VALUES
(1, 'Jacob', 'Cadelina', 'Ladanan', '1993-05-04', 'Bago Gallera, Davao City', '09090909099', 'admin', 'admin', b'1', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_servicereport`
--

CREATE TABLE IF NOT EXISTS `tbl_servicereport` (
  `sr_id` int(11) NOT NULL AUTO_INCREMENT,
  `sr_name` varchar(100) NOT NULL,
  `sr_parts` varchar(50) NOT NULL,
  `sr_amount` decimal(10,2) NOT NULL,
  `jo_no` int(11) NOT NULL,
  `sr_removed` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_servicereport`
--

INSERT INTO `tbl_servicereport` (`sr_id`, `sr_name`, `sr_parts`, `sr_amount`, `jo_no`, `sr_removed`) VALUES
(1, 'Alisdan ang fan?', 'Fan', '2000.00', 1, b'0'),
(2, 'Alisdan ang fan?', 'Wire', '5.34', 1, b'0'),
(3, 'Alisdan ang hard disk', 'Seagate hard disk 500mg', '2500.00', 2, b'0'),
(4, 'change it', 'PC', '30000.00', 3, b'0'),
(5, 'Fan is damaged. change fan', 'Fan triple x', '1000.00', 3, b'0'),
(6, 'Cpu is damaged. change cpu/', 'CPU intel core i7', '30000.00', 3, b'0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
