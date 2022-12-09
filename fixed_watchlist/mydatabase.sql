-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 08, 2022 at 12:56 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `biding`
--

DROP TABLE IF EXISTS `biding`;
CREATE TABLE IF NOT EXISTS `biding` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `biding_price` decimal(10,2) DEFAULT NULL,
  `biding_time` datetime DEFAULT NULL,
  PRIMARY KEY (`bid_id`) USING BTREE,
  KEY `listing_id` (`listing_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinytext,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Home'),
(2, 'Clothes'),
(3, 'Kids'),
(4, 'Sports'),
(5, 'Office '),
(6, 'Miscellaneous'),
(7, 'Cameras'),
(8, 'Appliances'),
(9, 'Phones'),
(10, 'Computers'),
(11, 'Music'),
(12, 'Health'),
(13, 'Cars'),
(14, 'DIY'),
(15, 'Stereos'),
(16, 'TVs'),
(17, 'Consoles'),
(18, 'Outdoors'),
(19, 'Tickets'),
(20, 'Leisure'),
(21, 'Films'),
(22, 'Books'),
(23, 'Bicycles');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_listings`
--

DROP TABLE IF EXISTS `tbl_listings`;
CREATE TABLE IF NOT EXISTS `tbl_listings` (
  `listing_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `details` text,
  `category_id` int(11) DEFAULT NULL,
  `starting_price` varchar(100) DEFAULT NULL,
  `reserve_price` varchar(100) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`listing_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tbl_listings`
--

INSERT INTO `tbl_listings` (`listing_id`, `title`, `details`, `category_id`, `starting_price`, `reserve_price`, `end_date`, `user_id`, `is_active`, `created_at`, `deleted_at`) VALUES
(9, 'Mountain Bike', 'A bike that bikes', 7, '45', '100', '2022-11-27 17:55:00', 13, 0, '2022-11-14 17:49:50', NULL),
(10, 'Computer', 'Does cool things', 10, '300', '450', '2022-12-14 17:55:00', 14, 1, '2022-11-14 17:51:29', NULL),
(11, 'erqer', 'qrqe', 3, '95623', '65', '2222-12-31 17:02:00', 15, 1, '2022-12-07 16:17:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `username` text,
  `email_address` text,
  `address` text,
  `post_code` text,
  `password` text,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email_address`, `address`, `post_code`, `password`, `is_active`) VALUES
(1, 'a', 'a@a', 'a', 'a', '$2y$10$3GXXPp9g.SQm/ZZ44Y8FUOwgMU33eDRq94Fx9SxKcZXQwhYY2FI3i', 1);

-- --------------------------------------------------------

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
CREATE TABLE IF NOT EXISTS `watchlist` (
  `user_id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `watchlist`
--

INSERT INTO `watchlist` (`user_id`, `listing_id`) VALUES
(1, 10),
(1, 11);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `biding`
--
ALTER TABLE `biding`
  ADD CONSTRAINT `biding_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `tbl_listings` (`listing_id`),
  ADD CONSTRAINT `biding_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tbl_listings`
--
ALTER TABLE `tbl_listings`
  ADD CONSTRAINT `tbl_listings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tbl_listings_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
