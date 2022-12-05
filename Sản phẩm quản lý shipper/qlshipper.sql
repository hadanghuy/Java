-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 02, 2022 lúc 12:44 PM
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
-- Cơ sở dữ liệu: `qlshipper`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `madh` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `tendh` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `dongia` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`madh`, `tendh`, `dongia`) VALUES
('mk01', 'Bánh kẹo', '100000 '),
('mk02', 'Bánh ngọt', '200000'),
('mk03', 'Bánh mì', '500000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipper`
--

CREATE TABLE `shipper` (
  `mashipper` int(9) NOT NULL,
  `hoten` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `madh` varchar(30) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `gioitinh` bit(1) NOT NULL,
  `ngaysinh` date NOT NULL,
  `dantoc` varchar(35) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `quequan` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `shipper`
--

INSERT INTO `shipper` (`mashipper`, `hoten`, `madh`, `gioitinh`, `ngaysinh`, `dantoc`, `quequan`) VALUES
(2, 'Hà Thị Diễm Quỳnh', 'mk02', b'1', '2022-10-20', 'Kinh', 'Hưng Yên'),
(3, 'Nguyễn Thị Minh Nghĩa', 'mk03', b'0', '2022-10-09', 'Kinh', 'Quảng Trị'),
(4, 'huy', 'mk02', b'1', '2001-03-12', '', 'thaibinh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(9) NOT NULL,
  `username` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mod` bit(10) NOT NULL,
  `state` bit(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `mod`, `state`) VALUES
(1, 'admin', '12345', b'0000000001', b'0000000001'),
(2, 'quang', '123', b'0000000000', b'0000000000'),
(3, 'trung', '111', b'0000000000', b'0000000000'),
(5, 'cuong', '456', b'0000000001', b'0000000001');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`madh`);

--
-- Chỉ mục cho bảng `shipper`
--
ALTER TABLE `shipper`
  ADD PRIMARY KEY (`mashipper`),
  ADD KEY `madh` (`madh`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `shipper`
--
ALTER TABLE `shipper`
  MODIFY `mashipper` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `shipper`
--
ALTER TABLE `shipper`
  ADD CONSTRAINT `shipper_ibfk_1` FOREIGN KEY (`madh`) REFERENCES `donhang` (`madh`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
