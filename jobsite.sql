-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2015 at 01:10 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jobsite`
--

-- --------------------------------------------------------

--
-- Table structure for table `dashboard`
--

CREATE TABLE IF NOT EXISTS `dashboard` (
  `dashboard_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`dashboard_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dashboard`
--

INSERT INTO `dashboard` (`dashboard_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `dataface__failed_logins`
--

CREATE TABLE IF NOT EXISTS `dataface__failed_logins` (
  `attempt_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `time_of_attempt` int(11) NOT NULL,
  PRIMARY KEY (`attempt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dataface__modules`
--

CREATE TABLE IF NOT EXISTS `dataface__modules` (
  `module_name` varchar(255) NOT NULL,
  `module_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`module_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dataface__mtimes`
--

CREATE TABLE IF NOT EXISTS `dataface__mtimes` (
  `name` varchar(255) NOT NULL,
  `mtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dataface__mtimes`
--

INSERT INTO `dataface__mtimes` (`name`, `mtime`) VALUES
('dashboard', 1447838333),
('dataface__failed_logins', 1447837946),
('dataface__modules', 1447837937),
('dataface__mtimes', 1447837946),
('dataface__preferences', 1447863862),
('dataface__record_mtimes', 1447859629),
('dataface__version', 1447837938),
('detail', 1448452056),
('user', 1447837938);

-- --------------------------------------------------------

--
-- Table structure for table `dataface__preferences`
--

CREATE TABLE IF NOT EXISTS `dataface__preferences` (
  `pref_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `table` varchar(128) NOT NULL,
  `record_id` varchar(255) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`pref_id`),
  KEY `username` (`username`),
  KEY `table` (`table`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dataface__preferences`
--

INSERT INTO `dataface__preferences` (`pref_id`, `username`, `table`, `record_id`, `key`, `value`) VALUES
(2, 'tt', '*', '*', 'tables.user.sections.user__relationship.display', 'expanded'),
(5, 'tt', '*', '*', 'tables.user.sections..order', '1'),
(6, 'tt', '*', '*', 'tables.user.sections.user__relationship.order', '2');

-- --------------------------------------------------------

--
-- Table structure for table `dataface__record_mtimes`
--

CREATE TABLE IF NOT EXISTS `dataface__record_mtimes` (
  `recordhash` varchar(32) NOT NULL,
  `recordid` varchar(255) NOT NULL,
  `mtime` int(11) NOT NULL,
  PRIMARY KEY (`recordhash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dataface__record_mtimes`
--

INSERT INTO `dataface__record_mtimes` (`recordhash`, `recordid`, `mtime`) VALUES
('043efa8bbbb7dfca81bc59db94756d08', 'detail?detailid=5', 1447875482),
('11cae9c26c81ec0e531592d1ff8f1e66', 'detail?detailid=3', 1447861786),
('b5a117121ce3bfcdcf2cecd3d2d16de4', 'detail?detailid=9', 1448451952),
('bd43460db32e6acd3453f52aee2fa072', 'detail?detailid=10', 1448452056),
('c16f925ba28a138fb716265637e58a6a', 'detail?detailid=4', 1447875328),
('cdb7f153bb5dfc1ead6778ec27ff4512', 'detail?detailid=2', 1447859630),
('dfc4434e3f6573cf193ac40b99d2d8ee', 'detail?detailid=8', 1448438588),
('e72883d89f6267c5b5fb368935d732a7', 'detail?detailid=7', 1447875792),
('f8d3e357ccd310f83d5daefdaca11b19', 'detail?detailid=6', 1448436451);

-- --------------------------------------------------------

--
-- Table structure for table `dataface__version`
--

CREATE TABLE IF NOT EXISTS `dataface__version` (
  `version` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dataface__version`
--

INSERT INTO `dataface__version` (`version`) VALUES
(0);

-- --------------------------------------------------------

--
-- Table structure for table `detail`
--

CREATE TABLE IF NOT EXISTS `detail` (
  `detailid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `address` varchar(140) NOT NULL,
  `email` varchar(50) NOT NULL,
  `currentjob` varchar(50) NOT NULL,
  `skills` varchar(100) NOT NULL,
  `qualifications` varchar(50) NOT NULL,
  `phonenumber` varchar(50) NOT NULL,
  `cv` varchar(255) NOT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`detailid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`detailid`, `firstname`, `lastname`, `birthdate`, `gender`, `address`, `email`, `currentjob`, `skills`, `qualifications`, `phonenumber`, `cv`, `registration_date`) VALUES
(1, 'Tichaona', 'Matongo', '2015-11-21', 'male', '11 Philips Avenue', 'matticc@gmail.com', 'support technician', 'programming', 'degree', '+263773286128', 'HGI_Profile_Final.pdf', '2015-11-25 07:22:47'),
(5, 'User', 'One', '2015-10-26', 'male', '11 Philips Avenue', 'oneuser@example.com', 'graphic designer', 'copy-writing\nsocial-media\ngraphic-design', 'degree\ndiploma\ncertificate', '+263734777777', 'HGI_Profile_Final-1.pdf', '2015-11-25 07:22:47'),
(6, 'Test', 'User', '1970-01-01', 'female', '11 Philips Avenue', 'testy@example.com', 'party planner', 'social-media', 'masters', '+263734 987 723', 'test.pdf', '2015-11-25 06:27:31'),
(8, 'new ', 'user', '1995-11-04', 'male', '11 Philips Avenue', 'new@example.com', 'paper chaser', 'programming\nnetworking\nsysadmin\ncopy-writing', 'degree\ndiploma\ncertificate\nmasters', '+263734777777', 'test-2.pdf', '2015-11-25 07:03:08'),
(9, 'David', 'Vuj', '1995-10-26', 'male', '11 Philips Avenue', 'dj@example.com', 'Developer', 'programming\ngraphic-design', 'certificate', '+26377777777', 'test-3.pdf', '2015-11-25 10:45:52'),
(10, 'Naija', 'Boy', '1975-11-02', 'male', '11 Philips Avenue', 'nj@gmail.com', 'Student', 'graphic-design', 'masters', '+263773223238', 'test-4.pdf', '2015-11-25 10:47:36');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Regular','Admin') NOT NULL DEFAULT 'Regular',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `username`, `password`, `role`) VALUES
(1, 'tt', 'p', 'Admin'),
(2, 'uu', 'p', 'Regular');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
