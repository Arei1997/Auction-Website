-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 11, 2022 at 12:30 PM
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
  PRIMARY KEY (`catID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`catID`, `name`) VALUES
('CAT001', 'Home'),
('CAT002', 'Clothes'),
('CAT003', 'Kids'),
('CAT004', 'Sports'),
('CAT005', 'Office '),
('CAT006', 'Miscellaneous'),
('CAT007', 'Cameras'),
('CAT008', 'Appliances'),
('CAT009', 'Phones'),
('CAT010', 'Computers'),
('CAT011', 'Music'),
('CAT012', 'Health'),
('CAT013', 'Cars'),
('CAT014', 'DIY'),
('CAT015', 'Stereos'),
('CAT016', 'TVs'),
('CAT017', 'Consoles'),
('CAT018', 'Outdoors'),
('CAT019', 'Tickets'),
('CAT020', 'Leisure'),
('CAT021', 'Films'),
('CAT022', 'Books'),
('CAT023', 'Bicycles');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email_address`, `address`, `post_code`, `password`, `is_active`) VALUES
(11, 'Username', 'User@email.com', 'Address', 'Postcode', '$2y$10$cz6SqyZlypEBalqwtu5CcuXL.E8LydeeJ9PZaTlO0wI2UnsQUe8ti', 1),
(10, 'Lad1@lad.com', 'TestSelsl@ucl.ac.uk', '44 green pastures', 'SK4 3RA', '$2y$10$WH8GznbN7oi5kUFyn7pRn.ulyxXUpBMtaXLFcE73Hm7c7ATzpWw.2', 1),
(9, 'Arei', 'arei1997@hotmail.co.uk', '44 green pastures', 'sk4 3ra', '$2y$10$umsouh2uu9VZIShfQOWyzOVKEM.VUHhBz/nqaPf0HjNdfAek/LMp6', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
