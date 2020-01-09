-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2020 at 11:19 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shareposts`
--

-- --------------------------------------------------------

--
-- Table structure for table `idiom`
--

CREATE TABLE `idiom` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `letter_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `idiom`
--

INSERT INTO `idiom` (`id`, `content`, `letter_id`, `user_id`, `created_at`) VALUES
(1, 'adorkable', 1, 3, '2020-01-07 21:10:59'),
(2, 'after party', 1, 3, '2020-01-07 21:10:59'),
(3, 'A-game', 1, 3, '2020-01-07 21:14:43'),
(4, 'aight', 1, 7, '2020-01-07 21:14:43'),
(5, 'a baby bump', 2, 3, '2020-01-07 21:16:25'),
(6, 'bad ass', 2, 7, '2020-01-07 21:16:25'),
(7, 'bae, boo, baby', 2, 3, '2020-01-07 21:17:52'),
(8, 'to bail', 2, 8, '2020-01-07 21:21:47'),
(9, 'not have the balls', 2, 8, '2020-01-07 21:22:06'),
(10, 'to go bananas', 2, 8, '2020-01-07 21:22:33'),
(11, 'baller', 2, 8, '2020-01-07 21:23:01'),
(12, 'to bang', 2, 8, '2020-01-07 21:23:22'),
(13, 'to be basic', 2, 8, '2020-01-07 21:23:59'),
(14, 'blah', 2, 8, '2020-01-07 21:24:24'),
(15, 'blasé', 2, 8, '2020-01-07 21:24:39'),
(16, 'to blow it', 2, 8, '2020-01-07 21:25:05'),
(17, 'to be blue', 2, 8, '2020-01-07 21:25:22'),
(18, 'bod', 2, 8, '2020-01-07 21:25:53'),
(19, 'to pull an all nighter', 1, 8, '2020-01-07 21:26:20'),
(20, 'ankle bitter', 1, 8, '2020-01-07 21:26:35'),
(21, 'antsy', 1, 8, '2020-01-07 21:26:52'),
(22, 'to go apeshit', 1, 8, '2020-01-07 21:27:08'),
(23, 'ass / asshat / asshole / asswipe', 1, 8, '2020-01-07 21:27:22'),
(24, 'attention whore', 1, 8, '2020-01-07 21:27:40'),
(25, 'to chat s.o. up', 3, 8, '2020-01-07 21:28:11'),
(26, 'cheezy', 3, 8, '2020-01-07 21:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `meaning`
--

CREATE TABLE `meaning` (
  `id` int(11) NOT NULL,
  `language_register_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `idiom_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meaning`
--

INSERT INTO `meaning` (`id`, `language_register_id`, `content`, `idiom_id`, `user_id`, `created_at`) VALUES
(1, 3, 'a party held after another event like a concert or another party', 2, 7, '2020-01-09 17:21:27'),
(2, 3, 'tough, uncompromising or intimidating', 6, 3, '2020-01-09 17:22:12'),
(3, 4, 'to express wild excitement or anger', 22, 7, '2020-01-09 17:22:56'),
(4, 3, 'overdramatic, excessively emotional', 26, 7, '2020-01-09 17:23:46'),
(5, 2, 'resembling, or containing cheese', 26, 7, '2020-01-09 17:24:32'),
(6, 2, 'exaggerated and likely to be forced or insincere', 26, 3, '2020-01-09 17:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `user_id`, `title`, `body`, `created_at`) VALUES
(3, 2, 'Post One one', 'blabla bla', '2020-01-04 23:41:28'),
(6, 2, 'post two', 'again a post blabla', '2020-01-07 00:31:31'),
(8, 7, 'banana', 'yet another clever post by Toto', '2020-01-07 21:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `ref_language_register`
--

CREATE TABLE `ref_language_register` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_language_register`
--

INSERT INTO `ref_language_register` (`id`, `code`, `name`, `description`) VALUES
(1, 'FORMAL', 'Formal', 'Formal language register'),
(2, 'COLLOQUIAL', 'Colloquial', 'Colloquial language register'),
(3, 'INFORMAL', 'Informal', 'Informal language register'),
(4, 'SLANG', 'Slang', 'Slang language'),
(5, 'VULGAR', 'Vulgar', 'Vulgar language');

-- --------------------------------------------------------

--
-- Table structure for table `ref_letter`
--

CREATE TABLE `ref_letter` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ref_letter`
--

INSERT INTO `ref_letter` (`id`, `code`, `name`, `description`) VALUES
(1, 'A', 'A', 'Letter A'),
(2, 'B', 'B', 'Letter B'),
(3, 'C', 'C', 'Letter C'),
(4, 'D', 'D', 'Letter D'),
(5, 'E', 'E', 'Letter E'),
(6, 'F', 'F', 'Letter F'),
(7, 'G', 'G', 'Letter G'),
(8, 'H', 'H', 'Letter H'),
(9, 'I', 'I', 'Letter I'),
(10, 'J', 'J', 'Letter J'),
(11, 'K', 'K', 'Letter K'),
(12, 'L', 'L', 'Letter L'),
(13, 'M', 'M', 'Letter M'),
(14, 'N', 'N', 'Letter N'),
(15, 'O', 'O', 'Letter O'),
(16, 'P', 'P', 'Letter P'),
(17, 'Q', 'Q', 'Letter Q'),
(18, 'R', 'R', 'Letter R'),
(19, 'S', 'S', 'Letter S'),
(20, 'T', 'T', 'Letter T'),
(21, 'U', 'U', 'Letter U'),
(22, 'V', 'V', 'Letter V'),
(23, 'W', 'W', 'Letter W'),
(24, 'X', 'X', 'Letter X'),
(25, 'Y', 'Y', 'Letter Y'),
(26, 'Z', 'Z', 'Letter Z');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `created_at`) VALUES
(2, 'Brad', 'traversy@gmail.com', '$2y$10$.SCL8wSYlIhj8tAE0EsaGeSrfGCf7wt0CZjztXbHR1ZAMeJyhYR0m', '2020-01-04 17:05:15'),
(3, 'Titi', 'titi@gmail.com', '$2y$10$NxYbAb80lR0bTYtBvpLYoe6wvbCpQU2qdQPvJ08nUtaqqV5gcuNkO', '2020-01-04 18:14:26'),
(4, 'tata', 'tata@tata.ta', '$2y$10$RTZw3pUMCtt.M.PFZREHYul6beiOyuHDD8Qgw7H1.koqJyCMpMPEa', '2020-01-04 18:16:37'),
(5, 'titi', 'titi@titi.ti', '$2y$10$MCo2gwYwcr.y/1yJrCzMduMUOjv3PpTCZNwXij1sWjyTvn87DiBHa', '2020-01-04 23:48:35'),
(6, 'Nicolas Péron', 'nperon@gmail.com', '$2y$10$gVhY7S5YScatmO1eJyU0c.3KvbLZg/brGMZVP/T9DPpiOlUjB4BHi', '2020-01-07 00:14:50'),
(7, 'toto', 'toto@toto.fr', '$2y$10$rdVo8JkrGMSJSzvUE.MeFOLr98Ut9HGqKGF56qiVbArEcaUfMvnDK', '2020-01-07 08:42:52'),
(8, 'default', 'default@default', '$2y$10$nKPNyT3FMjDNemmEOY.0pu1NKTV8nnHgpLBdB5PuIy/CBp2Gbxb1W', '2020-01-07 21:20:20'),
(9, 'Zsuzsa', 'rezsuzs@yahoo.com', '$2y$10$J3yfmf4VFT4rXoDkjWqPIeo7TLkj2JDhXdijOcr6f4yDQARJxgUhW', '2020-01-09 13:46:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `idiom`
--
ALTER TABLE `idiom`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_idiom_letter_id` (`letter_id`),
  ADD KEY `fk_idiom_user_id` (`user_id`);

--
-- Indexes for table `meaning`
--
ALTER TABLE `meaning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_meaning_language_register` (`language_register_id`),
  ADD KEY `fk_meaning_idiom` (`idiom_id`),
  ADD KEY `fk_meaning_user` (`user_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_post_user_id` (`user_id`);

--
-- Indexes for table `ref_language_register`
--
ALTER TABLE `ref_language_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_letter`
--
ALTER TABLE `ref_letter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `idiom`
--
ALTER TABLE `idiom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `meaning`
--
ALTER TABLE `meaning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ref_language_register`
--
ALTER TABLE `ref_language_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ref_letter`
--
ALTER TABLE `ref_letter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `idiom`
--
ALTER TABLE `idiom`
  ADD CONSTRAINT `fk_idiom_letter_id` FOREIGN KEY (`letter_id`) REFERENCES `ref_letter` (`id`),
  ADD CONSTRAINT `fk_idiom_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `meaning`
--
ALTER TABLE `meaning`
  ADD CONSTRAINT `fk_meaning_idiom` FOREIGN KEY (`idiom_id`) REFERENCES `idiom` (`id`),
  ADD CONSTRAINT `fk_meaning_language_register` FOREIGN KEY (`language_register_id`) REFERENCES `ref_language_register` (`id`),
  ADD CONSTRAINT `fk_meaning_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_post_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
