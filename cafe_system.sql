-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2024 at 04:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) NOT NULL,
  `category` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(1, 'Hot Drinks'),
(2, 'Cold Drinks'),
(3, 'Fresh Juice');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `state` varchar(20) NOT NULL DEFAULT 'ordered',
  `total_price` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_notes` varchar(100) DEFAULT NULL,
  `table_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date`, `state`, `total_price`, `user_id`, `order_notes`, `table_number`) VALUES
(53, '2022-03-28 10:49:24', 'processing', 50, 15, 'fddd', 3),
(54, '2024-05-14 13:20:07', 'ordered', 35, 15, 'test', 6),
(55, '2024-05-14 13:20:32', 'ordered', 35, 15, 'test', 6),
(56, '2024-05-17 02:18:44', 'deleiverd', 27, 15, 'no sugar in my coffe', 3),
(57, '2024-05-17 02:24:50', 'processing', 27, 15, 'test ', 1),
(58, '2024-05-17 03:04:31', 'ordered', 10, 15, '', 7);

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_id`, `product_id`, `product_amount`) VALUES
(49, 3, 2),
(50, 3, 2),
(51, 7, 2),
(52, 3, 2),
(53, 4, 2),
(54, 3, 1),
(55, 3, 1),
(56, 3, 1),
(58, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `avilable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`, `image`, `category`, `avilable`) VALUES
(3, 'tea', 5, 'different-types-of-tea-FT-BLOG0621.jpg', 'Hot Drinks', 1),
(4, 'coffe', 10, 'ZZKgZkZZNFFABG2B4J66HF.jpg', 'Cold Drinks', 1),
(5, 'orange', 20, 'orange.jpg', 'Fresh Juice', 1),
(6, 'mango', 15, 'mango (2).jpg', 'Fresh Juice', 1),
(7, 'chocolate', 12, 'hot-chocolate.jpg', 'Hot Drinks', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `table_number` int(11) DEFAULT NULL,
  `ext` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `email`, `password`, `table_number`, `ext`, `image`, `role`) VALUES
(12, 'test', 'admin@admin.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 2, '../uploads/m.jpg', 1),
(15, 'testUser', 'user@user.com', '827ccb0eea8a706c4c34a16891f84e7b', 4, 44, '../uploads/mlogo.jpg', 0),
(17, 'user', 'user@test.com', '827ccb0eea8a706c4c34a16891f84e7b', NULL, NULL, '../uploads/WhatsApp Image 2022-03-05 at 9.13.47 PM (1).jpeg', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
