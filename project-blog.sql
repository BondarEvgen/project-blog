-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 01, 2020 at 09:27 PM
-- Server version: 10.3.22-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project-blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `cover`, `cover_small`, `timestamp`) VALUES
(7, 'Galaxy', 'Good phone', NULL, NULL, NULL),
(8, 'Samsung', 'Good brand', NULL, NULL, NULL),
(15, 'autгmn', 'That was a good autumn', '25025320.jpg', '290-25025320.jpg', NULL),
(16, 'Summer', 'That was very cold summer', '66807021.jpg', '290-66807021.jpg', NULL),
(17, 'La istoria de la casa', 'Esta casa es istorico', '22548416.jpg', '290-22548416.jpg', NULL),
(18, 'Sunset', 'What we know about sunset?', '55420080.jpg', '290-55420080.jpg', 1594812558);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recovery_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_small` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `role`, `password`, `recovery_code`, `name`, `surname`, `country`, `city`, `avatar`, `avatar_small`) VALUES
(1, 'jon.do@gmail.com', 'user', '$2y$10$OJP9x7L6/mJwn8cEfITd1Om9r0sJ2GdGAnXEIwF2z3A22wFk/2YpK', '', 'Jon', 'Do', 'Canada', 'Los Angeles', NULL, NULL),
(6, 'rafaelmejor@gmail.com', 'user', '$2y$10$morLBImHtS29U3SWfISAM.FJ6clUz6CahHGlrIktcAK65ski2CS0.', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'genry.miller@gmail.com', 'user', '$2y$10$wDoAbBbcFeKKwc4qeYsG0OEh95.jCSlYBo.D0BrEFxkBlS8rJAQtS', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'jon.uoker@yandex.ru', 'user', '$2y$10$ZE/7ubI9JrQxZZIS.FPKleKkBav6REZKS2UBXwIZe0p9KcqU7JBBG', NULL, 'Lord', 'Jon', '', 'New York', NULL, NULL),
(9, 'adam.smith@gmail.com', 'admin', '$2y$10$wJDJvAbRQHRsNMAUohbag.ts42iN5lyCjq7Ymn0OFReCi0d/RNk5G', NULL, 'Adam', 'Smith', 'USA', 'Los Angeles', '32789277.jpg', '48-32789277.jpg'),
(14, 'rora@gmail.com', 'user', '$2y$10$S9XL9tWOfrwclWUxhdzWae/97ogftizBU3c0BjZQRDZWSpA1EbIaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'rrrr@gmai.com', 'user', '$2y$10$KuafGzugAJiD1zmzkInPleWF4wwnhuqm7/xgTjjkndNpZMjTGkaiq', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'tttt@gmail.com', 'user', '$2y$10$fzSYbnozdnZ3PV6XqlX7U.mq6Dz5B3biAdD1PRZPMOC6WUY2ZOhKS', NULL, 'Tamila', 'Tramp', '', '', '13501695.jpg', '48-13501695.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
