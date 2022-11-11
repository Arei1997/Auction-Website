-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 11, 2022 at 12:52 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_auction`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
CREATE TABLE IF NOT EXISTS `bids` (
  `bid_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `listing_id` int DEFAULT NULL,
  `bidtime` datetime DEFAULT NULL,
  `bidprice` decimal(10,2) DEFAULT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid_id`),
  KEY `listing_id` (`listing_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `catID` varchar(10) NOT NULL,
  `name` tinytext,
  PRIMARY KEY (`catID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `listing_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `posttime` datetime NOT NULL,
  `endtime` datetime DEFAULT NULL,
  `itemdescription` text,
  `item_title` text,
  `category` text,
  `reserveprice` decimal(10,2) DEFAULT NULL,
  `startprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`listing_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `listings`
--

INSERT INTO `listings` (`listing_id`, `user_id`, `posttime`, `endtime`, `itemdescription`, `item_title`, `category`, `reserveprice`, `startprice`) VALUES
(1, 8, '2022-11-11 12:27:00', '2022-11-22 19:00:00', 'dhuwdh', 'dhuwdh', 'CAT001', '21.00', '20.00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(300) DEFAULT NULL,
  `email_address` varchar(300) DEFAULT NULL,
  `post_code` varchar(300) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`user_id`, `username`, `email_address`, `post_code`, `password`, `is_active`, `address`) VALUES
(2, 'Username1', 'hjyuijk@dfdd.com', 'Abcd1234', '$2y$10$E9S4R3hqgmy.xisxstpwEeSzjZSBVTYhXC96tSbwZWf8k6ZrafDMy', 1, ''),
(3, 'Username1', 'hh', '', '$2y$10$xg1sgUTGJdOe4LlhWwrCGuy5JJK6vUBsEmUfq6iutPR3W3VpCbrlO', 1, ''),
(4, 'Username1', '', '', '$2y$10$W.slXHUam.jz8acoJ4yi7uMG4dumzae7mvKU44wlb.RqHbOZZJekS', 1, ''),
(5, '', '', '', '$2y$10$3ZUSR4awv14X0/llQY6ImeLK4Im9E8db7tdcsM97RqL5gefBTRde.', 1, ''),
(6, '', '', '', '$2y$10$o7YQFb3apoM//SFWOsVcxucmgE5FloQk2G0VP3TgoyCoZBOMF7fxG', 1, ''),
(7, 'User1', 'User1@email.com', 'aa1 111', '$2y$10$uXkrSA3qOyZ94eDYCtxRpeZ9t7ZmsqGbJy1XLx9GrS7L6SVuIdWUK', 1, ''),
(8, 'aaa', 'aa@aa.com', 'aa1 1aa', '$2y$10$iIINL93iK3A1L71GlARe.e05r2YiMoVM0H0mHAuASSo8V0vktM4ey', 1, 'aaa'),
(9, 'Username123', 'eeee@e.com', 'eeeeeeeeeeee', '$2y$10$.LM9rWR2MLkzYeuCrR025OUF.JdrlN2ambUANaD8mhTSWA/yqpmUe', 1, 'eee'),
(10, 'a123', 'asdsd@email.com', 'dsjfkdsf', '$2y$10$ArwO3HxmdtuNN.mZQhG7zuJAoXELevQ5GXEL73koH7A2Fez.dBole', 1, 'esfnkjrfdjk'),
(14, 'testuser', 'testuser@gmail.com', 'test', '$2y$10$.24YGpJdUe.3/yO1DQ6HFORGKxuY3f8lQXI2736ig8IUspPw9bem2', 1, 'test');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listings` (`listing_id`),
  ADD CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);

--
-- Constraints for table `listings`
--
ALTER TABLE `listings`
  ADD CONSTRAINT `listings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
