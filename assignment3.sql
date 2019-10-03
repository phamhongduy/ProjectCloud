-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 07, 2019 lúc 06:55 PM
-- Phiên bản máy phục vụ: 10.1.34-MariaDB
-- Phiên bản PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `assignment3`
--
CREATE DATABASE IF NOT EXISTS `assignment3` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `assignment3`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'tivi'),
(2, 'tu lanh'),
(3, 'dien thoai');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `quantity`, `orderId`, `productId`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 2),
(3, 1, 2, 3),
(4, 2, 3, 2),
(5, 1, 3, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `datepay` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `datepay`, `name`, `price`) VALUES
(1, '2019-09-07 23:37:55', 'hiennt', 200),
(2, '2019-09-07 23:50:56', 'hien', 350),
(3, '2019-09-07 23:51:56', 'hien', 350);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `price` double DEFAULT NULL,
  `thumnail` varchar(255) DEFAULT NULL,
  `cateId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `amount`, `description`, `name`, `price`, `thumnail`, `cateId`) VALUES
(1, 1000, 'Sieu mong', 'Tivi LCD', 100, 'http://muasamraovat.vn/wp-content/uploads/2016/05/ASANZO-25s350.jpg', 1),
(2, 10, 'Tu lanh the he moi', 'Tu lanh Samsung', 100, 'https://dienmaycholon.vn/public/picture/product/product13209/product_13209_1.png', 2),
(3, 25, 'Samsung A5', 'Dien thoai Samsung A5', 150, 'https://cdn.fptshop.com.vn/Uploads/Originals/2015/12/8/635851640637838005_A5-Gold-4.jpg', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` int(11) NOT NULL,
  `password` varchar(450) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `username` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `birthdate`, `email`, `enabled`, `password`, `phone`, `username`) VALUES
(1, NULL, NULL, 1, '123456', NULL, 'hiennt'),
(2, NULL, NULL, 1, '', NULL, ''),
(3, NULL, NULL, 1, '123456', NULL, 'hien');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL,
  `ROLE` varchar(45) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `ROLE`, `user_id`) VALUES
(1, 'ROLE_USER', 1),
(2, 'ROLE_USER', 2),
(3, 'ROLE_USER', 3);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2EAD37344FC934B0` (`productId`),
  ADD KEY `FK2EAD3734DB4E7F6E` (`orderId`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKC42BD1642E344F11` (`cateId`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_role_id`),
  ADD UNIQUE KEY `ROLE` (`ROLE`,`user_id`),
  ADD KEY `FK734299495B7997C3` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FK2EAD37344FC934B0` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK2EAD3734DB4E7F6E` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKC42BD1642E344F11` FOREIGN KEY (`cateId`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FK734299495B7997C3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
