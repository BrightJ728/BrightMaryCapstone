-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2022 at 05:11 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `capstone`
--

-- --------------------------------------------------------

--
-- Table structure for table `fireservice`
--

CREATE TABLE `fireservice` (
  `id` int(255) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `location` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `new_users`
--

CREATE TABLE `new_users` (
  `id` int(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `FK_email` varchar(155) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `new_users`
--

INSERT INTO `new_users` (`id`, `user_id`, `FK_email`, `Name`, `phoneNumber`, `email`) VALUES
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'B', 'service@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'B', 'service@gmail.com', '12345678'),
(NULL, 0, '', 'B', 'service@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 0, '', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 12, 'servicefire.gh@gmail.com', 'phone Number', 'servicefire.gh@gmail.com', '12345678'),
(NULL, 12, 'servicefire.gh@gmail.com', 'Number', 'servicefire.gh@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(155) NOT NULL,
  `location` varchar(255) NOT NULL,
  `sensorID` int(255) NOT NULL,
  `password` varchar(124) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'fire',
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `longitude` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `sensorDetails` varchar(255) NOT NULL,
  `serials` varchar(255) NOT NULL,
  `roomName` varchar(255) NOT NULL,
  `floor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phoneNumber`, `location`, `sensorID`, `password`, `status`, `time`, `longitude`, `latitude`, `region`, `sensorDetails`, `serials`, `roomName`, `floor`) VALUES
(1, 'Bright.service', 'service@gmail.com', '0', 'Accra', 0, 'password', 'fire', '0000-00-00 00:00:00.000000', '40', '', 'Ashanti', '', '', '', ''),
(2, 'service', 'service.gh@gmail.com', '', 'Berekuso', 0, '123456', 'fire', '0000-00-00 00:00:00.000000', '', '', 'Accra', '$details', '$serial', '$room', '$floor'),
(5, 'fire.service', 'service.ghi@gmail.com', '', 'Accra', 0, '123456', 'no fire', '0000-00-00 00:00:00.000000', '', '', 'Western', '', '', '', ''),
(11, 'rhema', 'rhemagh@gmail.com', '0589865', 'Accra', 0, '12345678', 'fire', '2022-02-04 16:31:14.719204', '', '', '', '', '', '', ''),
(12, 'service.fire', 'servicefire.gh@gmail.com', '0584983323', 'Adabraka', 0, '123456', 'fire', '2022-02-04 16:36:19.482403', '', '', '', 'Smoke sensor', '09393', 'wh22', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fireservice`
--
ALTER TABLE `fireservice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fireservice`
--
ALTER TABLE `fireservice`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
