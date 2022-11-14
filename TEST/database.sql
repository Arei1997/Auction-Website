-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 14, 2022 at 05:52 PM
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
-- Database: `database`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `catID` varchar(10) NOT NULL,
  `name` tinytext,
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`catID`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`catID`, `name`, `category_id`) VALUES
('CAT001', 'Home', 1),
('CAT002', 'Clothes', 2),
('CAT003', 'Kids', 3),
('CAT004', 'Sports', 4),
('CAT005', 'Office ', 5),
('CAT006', 'Miscellaneous', 6),
('CAT007', 'Cameras', 7),
('CAT008', 'Appliances', 8),
('CAT009', 'Phones', 9),
('CAT010', 'Computers', 10),
('CAT011', 'Music', 11),
('CAT012', 'Health', 12),
('CAT013', 'Cars', 13),
('CAT014', 'DIY', 14),
('CAT015', 'Stereos', 15),
('CAT016', 'TVs', 16),
('CAT017', 'Consoles', 17),
('CAT018', 'Outdoors', 18),
('CAT019', 'Tickets', 19),
('CAT020', 'Leisure', 20),
('CAT021', 'Films', 21),
('CAT022', 'Books', 22),
('CAT023', 'Bicycles', 23);

-- --------------------------------------------------------

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
CREATE TABLE IF NOT EXISTS `listings` (
  `listing_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `posttime` datetime NOT NULL,
  `endtime` datetime DEFAULT NULL,
  `itemdescription` text,
  `item_title` text,
  `category` text,
  `reserveprice` decimal(10,2) DEFAULT NULL,
  `startprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`listing_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`listing_id`, `user_id`, `posttime`, `endtime`, `itemdescription`, `item_title`, `category`, `reserveprice`, `startprice`) VALUES
(11, 2, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'British Eagle Hybrid Bicycle - Medium', 'CAT023', '100.00', '75.00'),
(10, 2, '2022-11-10 22:37:56', '2022-11-14 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Natuzzi \"Love Seat\"', 'CAT001', '350.00', '300.00'),
(9, 3, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Vintage ECC83 Pre Amp /Summing Mixer', 'CAT015', '1000.00', '750.00'),
(8, 1, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Brand new car', 'CAT013', '15000.00', '10000.00'),
(12, 2, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'IKEA mahogany slim bookshelf, wooden, 178 x 52 x 40 cm', 'CAT001', '20.00', '14.00'),
(13, 3, '2022-11-10 22:37:56', '2022-11-16 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Huawei watch 2 sports black excellent condition rarely worn with box and all accessories', 'CAT002', '150.00', '120.00'),
(14, 3, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Apple EarPods with 3.5mm Headphone Plug', 'CAT011', '15.00', '10.00'),
(15, 3, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Solid Wood side tables x 2', 'CAT001', '20.00', '15.00'),
(16, 2, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'ASKVOLL Wardrobe, white stained oak effect, white - white stained oak effect/white', 'CAT001', '60.00', '50.00'),
(17, 3, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Large TV Media Storage Unit.TV Stand. Fits Up To 55 inch TV. (Light Oak)', 'CAT016', '50.00', '45.00'),
(18, 2, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Coffee Table', 'CAT001', '45.00', '30.00'),
(19, 3, '2022-11-10 22:37:56', '2022-11-17 22:37:56', 'Lorem Ipsum Lorem Ipsum', '* BOARDMAN HYB 8.6 * HYBRID / ROAD BIKE / BICYCLE', 'CAT023', '295.00', '250.00'),
(20, 2, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Single metal white loft bed', 'CAT001', '60.00', '50.00'),
(21, 3, '2022-11-10 22:37:56', '2022-11-13 22:37:56', 'Lorem Ipsum Lorem Ipsum', 'Apple iMac Slim 27 inch i5 Quad Core 2.9Ghz 24gb Ram 1TB HDD Cinema 4D Vectorworks Adobe Dimension', 'CAT010', '900.00', '850.00'),
(22, 10, '2022-11-10 23:04:00', '2022-11-20 03:04:00', '', 'fef', 'CAT001', '100.00', '50.00');

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
  `end_date` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`listing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_listings`
--

INSERT INTO `tbl_listings` (`listing_id`, `title`, `details`, `category_id`, `starting_price`, `reserve_price`, `end_date`, `user_id`, `is_active`, `created_at`, `deleted_at`) VALUES
(9, 'Mountain Bike', 'A bike that bikes', 7, '45', '100', '2022-11-27T17:55', 13, 1, '2022-11-14 17:49:50', NULL),
(10, 'Computer', 'Does cool things', 10, '300', '450', '2022-12-14T17:55', 14, 1, '2022-11-14 17:51:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(300) DEFAULT NULL,
  `email_address` varchar(300) DEFAULT NULL,
  `post_code` varchar(300) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text,
  `email_address` text,
  `address` text,
  `post_code` text,
  `password` text,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email_address`, `address`, `post_code`, `password`, `is_active`) VALUES
(14, 'TestAccount1', 'Test1@Email.com', 'Address Mock 45', '123 8GG', '$2y$10$L7h03Bcz84JdKh.s26LM0eZhRBvQXJjmGzT9IShlQG.7kd8qB79LO', 1),
(13, 'TestAccount', 'Test@Email.com', 'Address Mock 44 ', '123 8BB', '$2y$10$v824APpbcQxzG0oBhhILQuptCIx.mfbUnbXO6BilHgw8X2Yrtq0p2', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
