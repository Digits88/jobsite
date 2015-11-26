-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2015 at 08:21 AM
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
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`detailid`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `userid_2` (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `detail`
--

INSERT INTO `detail` (`detailid`, `firstname`, `lastname`, `birthdate`, `gender`, `address`, `email`, `currentjob`, `skills`, `qualifications`, `phonenumber`, `cv`, `userid`) VALUES
(1, 'Tichaona', 'Matongo', '2015-11-21', 'male', '11 Philips Avenue', 'matticc@gmail.com', 'support technician', 'programming', 'degree', '+263773286128', 'HGI_Profile_Final.pdf', 1),
(5, 'User', 'One', '2015-10-26', 'male', '11 Philips Avenue', 'oneuser@example.com', 'graphic designer', 'copy-writing\nsocial-media\ngraphic-design', 'degree\ndiploma\ncertificate', '+263734777777', 'HGI_Profile_Final-1.pdf', 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
