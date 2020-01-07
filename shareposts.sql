-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 07, 2020 at 08:28 PM
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
(6, 2, 'post two', 'again a post blabla', '2020-01-07 00:31:31');

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
(7, 'toto', 'toto@toto.fr', '$2y$10$rdVo8JkrGMSJSzvUE.MeFOLr98Ut9HGqKGF56qiVbArEcaUfMvnDK', '2020-01-07 08:42:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `post`
--
ALTER TABLE `post`
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
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
