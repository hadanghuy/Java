-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 02, 2022 lúc 03:59 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlcb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `canbo`
--

CREATE TABLE `canbo` (
  `macb` int(9) NOT NULL,
  `hoten` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mapb` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `gioitinh` bit(1) NOT NULL,
  `ngaysinh` date NOT NULL,
  `dantoc` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `quequan` varchar(60) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `chucvu` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `canbo`
--

INSERT INTO `canbo` (`macb`, `hoten`, `mapb`, `gioitinh`, `ngaysinh`, `dantoc`, `quequan`, `chucvu`) VALUES
(6, 'xuan', 'wrt3', b'1', '2002-12-23', 'kinh', 'thaibinh', 'nhanvien'),
(7, 'huy', 'wrt2', b'1', '2002-12-23', 'kinh', 'thaibinh', 'nhanvien'),
(8, 'hung', 'wrt5', b'1', '2002-12-23', 'kinh', 'thaibinh', 'nhanvien');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phongban`
--

CREATE TABLE `phongban` (
  `mapb` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `tenphongban` varchar(60) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `phongban`
--

INSERT INTO `phongban` (`mapb`, `tenphongban`) VALUES
('wrt', 'Tài Chính'),
('wrt1', 'Tài Chính'),
('wrt2', 'Kế Toán'),
('wrt3', 'Nội Vụ'),
('wrt5', 'thanhtra');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(9) NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mod` bit(10) NOT NULL,
  `state` bit(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `mod`, `state`) VALUES
(1, 'admin', '123', b'0000000001', b'0000000001'),
(2, 'huy', '1234', b'0000000000', b'0000000001');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `canbo`
--
ALTER TABLE `canbo`
  ADD PRIMARY KEY (`macb`),
  ADD KEY `mapb` (`mapb`);

--
-- Chỉ mục cho bảng `phongban`
--
ALTER TABLE `phongban`
  ADD PRIMARY KEY (`mapb`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `canbo`
--
ALTER TABLE `canbo`
  MODIFY `macb` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `canbo`
--
ALTER TABLE `canbo`
  ADD CONSTRAINT `canbo_ibfk_1` FOREIGN KEY (`mapb`) REFERENCES `phongban` (`mapb`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
