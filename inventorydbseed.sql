-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2025 at 10:26 AM
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
-- Database: `inventorydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `description`, `name`) VALUES
(1, 'Kategori 001 açıklaması', 'Kategori 001'),
(2, 'Kategori 002 açıklaması', 'Kategori 002'),
(3, 'Kategori 003 açıklaması', 'Kategori 003'),
(4, 'Kategori 004 açıklaması', 'Kategori 004'),
(5, 'Kategori 005 açıklaması', 'Kategori 005'),
(6, 'Kategori 006 açıklaması', 'Kategori 006'),
(7, 'Kategori 007 açıklaması', 'Kategori 007'),
(8, 'Kategori 008 açıklaması', 'Kategori 008'),
(9, 'Kategori 009 açıklaması', 'Kategori 009'),
(10, 'Kategori 010 açıklaması', 'Kategori 010'),
(11, 'Kategori 011 açıklaması', 'Kategori 011'),
(12, 'Kategori 012 açıklaması', 'Kategori 012'),
(13, 'Kategori 013 açıklaması', 'Kategori 013'),
(14, 'Kategori 014 açıklaması', 'Kategori 014'),
(15, 'Kategori 015 açıklaması', 'Kategori 015'),
(16, 'Kategori 016 açıklaması', 'Kategori 016'),
(17, 'Kategori 017 açıklaması', 'Kategori 017'),
(18, 'Kategori 018 açıklaması', 'Kategori 018'),
(19, 'Kategori 019 açıklaması', 'Kategori 019'),
(20, 'Kategori 020 açıklaması', 'Kategori 020'),
(21, 'Kategori 021 açıklaması', 'Kategori 021'),
(22, 'Kategori 022 açıklaması', 'Kategori 022'),
(23, 'Kategori 023 açıklaması', 'Kategori 023'),
(24, 'Kategori 024 açıklaması', 'Kategori 024'),
(25, 'Kategori 025 açıklaması', 'Kategori 025'),
(26, 'Kategori 026 açıklaması', 'Kategori 026'),
(27, 'Kategori 027 açıklaması', 'Kategori 027'),
(28, 'Kategori 028 açıklaması', 'Kategori 028'),
(29, 'Kategori 029 açıklaması', 'Kategori 029'),
(30, 'Kategori 030 açıklaması', 'Kategori 030'),
(31, 'Kategori 031 açıklaması', 'Kategori 031'),
(32, 'Kategori 032 açıklaması', 'Kategori 032'),
(33, 'Kategori 033 açıklaması', 'Kategori 033'),
(34, 'Kategori 034 açıklaması', 'Kategori 034'),
(35, 'Kategori 035 açıklaması', 'Kategori 035'),
(36, 'Kategori 036 açıklaması', 'Kategori 036'),
(37, 'Kategori 037 açıklaması', 'Kategori 037'),
(38, 'Kategori 038 açıklaması', 'Kategori 038'),
(39, 'Kategori 039 açıklaması', 'Kategori 039'),
(40, 'Kategori 040 açıklaması', 'Kategori 040'),
(41, 'Kategori 041 açıklaması', 'Kategori 041'),
(42, 'Kategori 042 açıklaması', 'Kategori 042'),
(43, 'Kategori 043 açıklaması', 'Kategori 043'),
(44, 'Kategori 044 açıklaması', 'Kategori 044'),
(45, 'Kategori 045 açıklaması', 'Kategori 045'),
(46, 'Kategori 046 açıklaması', 'Kategori 046'),
(47, 'Kategori 047 açıklaması', 'Kategori 047'),
(48, 'Kategori 048 açıklaması', 'Kategori 048'),
(49, 'Kategori 049 açıklaması', 'Kategori 049'),
(50, 'Kategori 050 açıklaması', 'Kategori 050'),
(51, 'Kategori 051 açıklaması', 'Kategori 051'),
(52, 'Kategori 052 açıklaması', 'Kategori 052'),
(53, 'Kategori 053 açıklaması', 'Kategori 053'),
(54, 'Kategori 054 açıklaması', 'Kategori 054'),
(55, 'Kategori 055 açıklaması', 'Kategori 055'),
(56, 'Kategori 056 açıklaması', 'Kategori 056'),
(57, 'Kategori 057 açıklaması', 'Kategori 057'),
(58, 'Kategori 058 açıklaması', 'Kategori 058'),
(59, 'Kategori 059 açıklaması', 'Kategori 059'),
(60, 'Kategori 060 açıklaması', 'Kategori 060'),
(61, 'Kategori 061 açıklaması', 'Kategori 061'),
(62, 'Kategori 062 açıklaması', 'Kategori 062'),
(63, 'Kategori 063 açıklaması', 'Kategori 063'),
(64, 'Kategori 064 açıklaması', 'Kategori 064'),
(65, 'Kategori 065 açıklaması', 'Kategori 065'),
(66, 'Kategori 066 açıklaması', 'Kategori 066'),
(67, 'Kategori 067 açıklaması', 'Kategori 067'),
(68, 'Kategori 068 açıklaması', 'Kategori 068'),
(69, 'Kategori 069 açıklaması', 'Kategori 069'),
(70, 'Kategori 070 açıklaması', 'Kategori 070'),
(71, 'Kategori 071 açıklaması', 'Kategori 071'),
(72, 'Kategori 072 açıklaması', 'Kategori 072'),
(73, 'Kategori 073 açıklaması', 'Kategori 073'),
(74, 'Kategori 074 açıklaması', 'Kategori 074'),
(75, 'Kategori 075 açıklaması', 'Kategori 075'),
(76, 'Kategori 076 açıklaması', 'Kategori 076'),
(77, 'Kategori 077 açıklaması', 'Kategori 077'),
(78, 'Kategori 078 açıklaması', 'Kategori 078'),
(79, 'Kategori 079 açıklaması', 'Kategori 079'),
(80, 'Kategori 080 açıklaması', 'Kategori 080'),
(81, 'Kategori 081 açıklaması', 'Kategori 081'),
(82, 'Kategori 082 açıklaması', 'Kategori 082'),
(83, 'Kategori 083 açıklaması', 'Kategori 083'),
(84, 'Kategori 084 açıklaması', 'Kategori 084'),
(85, 'Kategori 085 açıklaması', 'Kategori 085'),
(86, 'Kategori 086 açıklaması', 'Kategori 086'),
(87, 'Kategori 087 açıklaması', 'Kategori 087'),
(88, 'Kategori 088 açıklaması', 'Kategori 088'),
(89, 'Kategori 089 açıklaması', 'Kategori 089'),
(90, 'Kategori 090 açıklaması', 'Kategori 090'),
(91, 'Kategori 091 açıklaması', 'Kategori 091'),
(92, 'Kategori 092 açıklaması', 'Kategori 092'),
(93, 'Kategori 093 açıklaması', 'Kategori 093'),
(94, 'Kategori 094 açıklaması', 'Kategori 094'),
(95, 'Kategori 095 açıklaması', 'Kategori 095'),
(96, 'Kategori 096 açıklaması', 'Kategori 096'),
(97, 'Kategori 097 açıklaması', 'Kategori 097'),
(98, 'Kategori 098 açıklaması', 'Kategori 098'),
(99, 'Kategori 099 açıklaması', 'Kategori 099'),
(100, 'Kategori 100 açıklaması', 'Kategori 100');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `address`, `email`, `name`, `phone`) VALUES
(1, 'Adres M001 Cad. No:1', 'cus001@example.com', 'Müşteri 001', '+90 5259 2001'),
(2, 'Adres M002 Cad. No:2', 'cus002@example.com', 'Müşteri 002', '+90 5408 2002'),
(3, 'Adres M003 Cad. No:3', 'cus003@example.com', 'Müşteri 003', '+90 5657 2003'),
(4, 'Adres M004 Cad. No:4', 'cus004@example.com', 'Müşteri 004', '+90 5806 2004'),
(5, 'Adres M005 Cad. No:5', 'cus005@example.com', 'Müşteri 005', '+90 5055 2005'),
(6, 'Adres M006 Cad. No:6', 'cus006@example.com', 'Müşteri 006', '+90 5204 2006'),
(7, 'Adres M007 Cad. No:7', 'cus007@example.com', 'Müşteri 007', '+90 5453 2007'),
(8, 'Adres M008 Cad. No:8', 'cus008@example.com', 'Müşteri 008', '+90 5602 2008'),
(9, 'Adres M009 Cad. No:9', 'cus009@example.com', 'Müşteri 009', '+90 5851 2009'),
(10, 'Adres M010 Cad. No:10', 'cus010@example.com', 'Müşteri 010', '+90 5000 2010'),
(11, 'Adres M011 Cad. No:11', 'cus011@example.com', 'Müşteri 011', '+90 5259 2011'),
(12, 'Adres M012 Cad. No:12', 'cus012@example.com', 'Müşteri 012', '+90 5408 2012'),
(13, 'Adres M013 Cad. No:13', 'cus013@example.com', 'Müşteri 013', '+90 5657 2013'),
(14, 'Adres M014 Cad. No:14', 'cus014@example.com', 'Müşteri 014', '+90 5806 2014'),
(15, 'Adres M015 Cad. No:15', 'cus015@example.com', 'Müşteri 015', '+90 5055 2015'),
(16, 'Adres M016 Cad. No:16', 'cus016@example.com', 'Müşteri 016', '+90 5204 2016'),
(17, 'Adres M017 Cad. No:17', 'cus017@example.com', 'Müşteri 017', '+90 5453 2017'),
(18, 'Adres M018 Cad. No:18', 'cus018@example.com', 'Müşteri 018', '+90 5602 2018'),
(19, 'Adres M019 Cad. No:19', 'cus019@example.com', 'Müşteri 019', '+90 5851 2019'),
(20, 'Adres M020 Cad. No:20', 'cus020@example.com', 'Müşteri 020', '+90 5000 2020'),
(21, 'Adres M021 Cad. No:21', 'cus021@example.com', 'Müşteri 021', '+90 5259 2021'),
(22, 'Adres M022 Cad. No:22', 'cus022@example.com', 'Müşteri 022', '+90 5408 2022'),
(23, 'Adres M023 Cad. No:23', 'cus023@example.com', 'Müşteri 023', '+90 5657 2023'),
(24, 'Adres M024 Cad. No:24', 'cus024@example.com', 'Müşteri 024', '+90 5806 2024'),
(25, 'Adres M025 Cad. No:25', 'cus025@example.com', 'Müşteri 025', '+90 5055 2025'),
(26, 'Adres M026 Cad. No:26', 'cus026@example.com', 'Müşteri 026', '+90 5204 2026'),
(27, 'Adres M027 Cad. No:27', 'cus027@example.com', 'Müşteri 027', '+90 5453 2027'),
(28, 'Adres M028 Cad. No:28', 'cus028@example.com', 'Müşteri 028', '+90 5602 2028'),
(29, 'Adres M029 Cad. No:29', 'cus029@example.com', 'Müşteri 029', '+90 5851 2029'),
(30, 'Adres M030 Cad. No:30', 'cus030@example.com', 'Müşteri 030', '+90 5000 2030'),
(31, 'Adres M031 Cad. No:31', 'cus031@example.com', 'Müşteri 031', '+90 5259 2031'),
(32, 'Adres M032 Cad. No:32', 'cus032@example.com', 'Müşteri 032', '+90 5408 2032'),
(33, 'Adres M033 Cad. No:33', 'cus033@example.com', 'Müşteri 033', '+90 5657 2033'),
(34, 'Adres M034 Cad. No:34', 'cus034@example.com', 'Müşteri 034', '+90 5806 2034'),
(35, 'Adres M035 Cad. No:35', 'cus035@example.com', 'Müşteri 035', '+90 5055 2035'),
(36, 'Adres M036 Cad. No:36', 'cus036@example.com', 'Müşteri 036', '+90 5204 2036'),
(37, 'Adres M037 Cad. No:37', 'cus037@example.com', 'Müşteri 037', '+90 5453 2037'),
(38, 'Adres M038 Cad. No:38', 'cus038@example.com', 'Müşteri 038', '+90 5602 2038'),
(39, 'Adres M039 Cad. No:39', 'cus039@example.com', 'Müşteri 039', '+90 5851 2039'),
(40, 'Adres M040 Cad. No:40', 'cus040@example.com', 'Müşteri 040', '+90 5000 2040'),
(41, 'Adres M041 Cad. No:41', 'cus041@example.com', 'Müşteri 041', '+90 5259 2041'),
(42, 'Adres M042 Cad. No:42', 'cus042@example.com', 'Müşteri 042', '+90 5408 2042'),
(43, 'Adres M043 Cad. No:43', 'cus043@example.com', 'Müşteri 043', '+90 5657 2043'),
(44, 'Adres M044 Cad. No:44', 'cus044@example.com', 'Müşteri 044', '+90 5806 2044'),
(45, 'Adres M045 Cad. No:45', 'cus045@example.com', 'Müşteri 045', '+90 5055 2045'),
(46, 'Adres M046 Cad. No:46', 'cus046@example.com', 'Müşteri 046', '+90 5204 2046'),
(47, 'Adres M047 Cad. No:47', 'cus047@example.com', 'Müşteri 047', '+90 5453 2047'),
(48, 'Adres M048 Cad. No:48', 'cus048@example.com', 'Müşteri 048', '+90 5602 2048'),
(49, 'Adres M049 Cad. No:49', 'cus049@example.com', 'Müşteri 049', '+90 5851 2049'),
(50, 'Adres M050 Cad. No:50', 'cus050@example.com', 'Müşteri 050', '+90 5000 2050'),
(51, 'Adres M051 Cad. No:51', 'cus051@example.com', 'Müşteri 051', '+90 5259 2051'),
(52, 'Adres M052 Cad. No:52', 'cus052@example.com', 'Müşteri 052', '+90 5408 2052'),
(53, 'Adres M053 Cad. No:53', 'cus053@example.com', 'Müşteri 053', '+90 5657 2053'),
(54, 'Adres M054 Cad. No:54', 'cus054@example.com', 'Müşteri 054', '+90 5806 2054'),
(55, 'Adres M055 Cad. No:55', 'cus055@example.com', 'Müşteri 055', '+90 5055 2055'),
(56, 'Adres M056 Cad. No:56', 'cus056@example.com', 'Müşteri 056', '+90 5204 2056'),
(57, 'Adres M057 Cad. No:57', 'cus057@example.com', 'Müşteri 057', '+90 5453 2057'),
(58, 'Adres M058 Cad. No:58', 'cus058@example.com', 'Müşteri 058', '+90 5602 2058'),
(59, 'Adres M059 Cad. No:59', 'cus059@example.com', 'Müşteri 059', '+90 5851 2059'),
(60, 'Adres M060 Cad. No:60', 'cus060@example.com', 'Müşteri 060', '+90 5000 2060'),
(61, 'Adres M061 Cad. No:61', 'cus061@example.com', 'Müşteri 061', '+90 5259 2061'),
(62, 'Adres M062 Cad. No:62', 'cus062@example.com', 'Müşteri 062', '+90 5408 2062'),
(63, 'Adres M063 Cad. No:63', 'cus063@example.com', 'Müşteri 063', '+90 5657 2063'),
(64, 'Adres M064 Cad. No:64', 'cus064@example.com', 'Müşteri 064', '+90 5806 2064'),
(65, 'Adres M065 Cad. No:65', 'cus065@example.com', 'Müşteri 065', '+90 5055 2065'),
(66, 'Adres M066 Cad. No:66', 'cus066@example.com', 'Müşteri 066', '+90 5204 2066'),
(67, 'Adres M067 Cad. No:67', 'cus067@example.com', 'Müşteri 067', '+90 5453 2067'),
(68, 'Adres M068 Cad. No:68', 'cus068@example.com', 'Müşteri 068', '+90 5602 2068'),
(69, 'Adres M069 Cad. No:69', 'cus069@example.com', 'Müşteri 069', '+90 5851 2069'),
(70, 'Adres M070 Cad. No:70', 'cus070@example.com', 'Müşteri 070', '+90 5000 2070'),
(71, 'Adres M071 Cad. No:71', 'cus071@example.com', 'Müşteri 071', '+90 5259 2071'),
(72, 'Adres M072 Cad. No:72', 'cus072@example.com', 'Müşteri 072', '+90 5408 2072'),
(73, 'Adres M073 Cad. No:73', 'cus073@example.com', 'Müşteri 073', '+90 5657 2073'),
(74, 'Adres M074 Cad. No:74', 'cus074@example.com', 'Müşteri 074', '+90 5806 2074'),
(75, 'Adres M075 Cad. No:75', 'cus075@example.com', 'Müşteri 075', '+90 5055 2075'),
(76, 'Adres M076 Cad. No:76', 'cus076@example.com', 'Müşteri 076', '+90 5204 2076'),
(77, 'Adres M077 Cad. No:77', 'cus077@example.com', 'Müşteri 077', '+90 5453 2077'),
(78, 'Adres M078 Cad. No:78', 'cus078@example.com', 'Müşteri 078', '+90 5602 2078'),
(79, 'Adres M079 Cad. No:79', 'cus079@example.com', 'Müşteri 079', '+90 5851 2079'),
(80, 'Adres M080 Cad. No:80', 'cus080@example.com', 'Müşteri 080', '+90 5000 2080'),
(81, 'Adres M081 Cad. No:81', 'cus081@example.com', 'Müşteri 081', '+90 5259 2081'),
(82, 'Adres M082 Cad. No:82', 'cus082@example.com', 'Müşteri 082', '+90 5408 2082'),
(83, 'Adres M083 Cad. No:83', 'cus083@example.com', 'Müşteri 083', '+90 5657 2083'),
(84, 'Adres M084 Cad. No:84', 'cus084@example.com', 'Müşteri 084', '+90 5806 2084'),
(85, 'Adres M085 Cad. No:85', 'cus085@example.com', 'Müşteri 085', '+90 5055 2085'),
(86, 'Adres M086 Cad. No:86', 'cus086@example.com', 'Müşteri 086', '+90 5204 2086'),
(87, 'Adres M087 Cad. No:87', 'cus087@example.com', 'Müşteri 087', '+90 5453 2087'),
(88, 'Adres M088 Cad. No:88', 'cus088@example.com', 'Müşteri 088', '+90 5602 2088'),
(89, 'Adres M089 Cad. No:89', 'cus089@example.com', 'Müşteri 089', '+90 5851 2089'),
(90, 'Adres M090 Cad. No:90', 'cus090@example.com', 'Müşteri 090', '+90 5000 2090'),
(91, 'Adres M091 Cad. No:91', 'cus091@example.com', 'Müşteri 091', '+90 5259 2091'),
(92, 'Adres M092 Cad. No:92', 'cus092@example.com', 'Müşteri 092', '+90 5408 2092'),
(93, 'Adres M093 Cad. No:93', 'cus093@example.com', 'Müşteri 093', '+90 5657 2093'),
(94, 'Adres M094 Cad. No:94', 'cus094@example.com', 'Müşteri 094', '+90 5806 2094'),
(95, 'Adres M095 Cad. No:95', 'cus095@example.com', 'Müşteri 095', '+90 5055 2095'),
(96, 'Adres M096 Cad. No:96', 'cus096@example.com', 'Müşteri 096', '+90 5204 2096'),
(97, 'Adres M097 Cad. No:97', 'cus097@example.com', 'Müşteri 097', '+90 5453 2097'),
(98, 'Adres M098 Cad. No:98', 'cus098@example.com', 'Müşteri 098', '+90 5602 2098'),
(99, 'Adres M099 Cad. No:99', 'cus099@example.com', 'Müşteri 099', '+90 5851 2099'),
(100, 'Adres M100 Cad. No:100', 'cus100@example.com', 'Müşteri 100', '+90 5000 2100');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `description`, `name`, `product_code`, `unit`, `category_id`) VALUES
(1, '2025-01-02 00:00:00.000000', 'Ürün 001 açıklaması', 'Ürün 001', 'P0001', 'kg', 1),
(2, '2025-01-03 00:00:00.000000', 'Ürün 002 açıklaması', 'Ürün 002', 'P0002', 'litre', 2),
(3, '2025-01-04 00:00:00.000000', 'Ürün 003 açıklaması', 'Ürün 003', 'P0003', 'koli', 3),
(4, '2025-01-05 00:00:00.000000', 'Ürün 004 açıklaması', 'Ürün 004', 'P0004', 'paket', 4),
(5, '2025-01-06 00:00:00.000000', 'Ürün 005 açıklaması', 'Ürün 005', 'P0005', 'adet', 5),
(6, '2025-01-07 00:00:00.000000', 'Ürün 006 açıklaması', 'Ürün 006', 'P0006', 'kg', 6),
(7, '2025-01-08 00:00:00.000000', 'Ürün 007 açıklaması', 'Ürün 007', 'P0007', 'litre', 7),
(8, '2025-01-09 00:00:00.000000', 'Ürün 008 açıklaması', 'Ürün 008', 'P0008', 'koli', 8),
(9, '2025-01-10 00:00:00.000000', 'Ürün 009 açıklaması', 'Ürün 009', 'P0009', 'paket', 9),
(10, '2025-01-11 00:00:00.000000', 'Ürün 010 açıklaması', 'Ürün 010', 'P0010', 'adet', 10),
(11, '2025-01-12 00:00:00.000000', 'Ürün 011 açıklaması', 'Ürün 011', 'P0011', 'kg', 11),
(12, '2025-01-13 00:00:00.000000', 'Ürün 012 açıklaması', 'Ürün 012', 'P0012', 'litre', 12),
(13, '2025-01-14 00:00:00.000000', 'Ürün 013 açıklaması', 'Ürün 013', 'P0013', 'koli', 13),
(14, '2025-01-15 00:00:00.000000', 'Ürün 014 açıklaması', 'Ürün 014', 'P0014', 'paket', 14),
(15, '2025-01-16 00:00:00.000000', 'Ürün 015 açıklaması', 'Ürün 015', 'P0015', 'adet', 15),
(16, '2025-01-17 00:00:00.000000', 'Ürün 016 açıklaması', 'Ürün 016', 'P0016', 'kg', 16),
(17, '2025-01-18 00:00:00.000000', 'Ürün 017 açıklaması', 'Ürün 017', 'P0017', 'litre', 17),
(18, '2025-01-19 00:00:00.000000', 'Ürün 018 açıklaması', 'Ürün 018', 'P0018', 'koli', 18),
(19, '2025-01-20 00:00:00.000000', 'Ürün 019 açıklaması', 'Ürün 019', 'P0019', 'paket', 19),
(20, '2025-01-21 00:00:00.000000', 'Ürün 020 açıklaması', 'Ürün 020', 'P0020', 'adet', 20),
(21, '2025-01-22 00:00:00.000000', 'Ürün 021 açıklaması', 'Ürün 021', 'P0021', 'kg', 21),
(22, '2025-01-23 00:00:00.000000', 'Ürün 022 açıklaması', 'Ürün 022', 'P0022', 'litre', 22),
(23, '2025-01-24 00:00:00.000000', 'Ürün 023 açıklaması', 'Ürün 023', 'P0023', 'koli', 23),
(24, '2025-01-25 00:00:00.000000', 'Ürün 024 açıklaması', 'Ürün 024', 'P0024', 'paket', 24),
(25, '2025-01-26 00:00:00.000000', 'Ürün 025 açıklaması', 'Ürün 025', 'P0025', 'adet', 25),
(26, '2025-01-27 00:00:00.000000', 'Ürün 026 açıklaması', 'Ürün 026', 'P0026', 'kg', 26),
(27, '2025-01-28 00:00:00.000000', 'Ürün 027 açıklaması', 'Ürün 027', 'P0027', 'litre', 27),
(28, '2025-01-29 00:00:00.000000', 'Ürün 028 açıklaması', 'Ürün 028', 'P0028', 'koli', 28),
(29, '2025-01-30 00:00:00.000000', 'Ürün 029 açıklaması', 'Ürün 029', 'P0029', 'paket', 29),
(30, '2025-01-31 00:00:00.000000', 'Ürün 030 açıklaması', 'Ürün 030', 'P0030', 'adet', 30),
(31, '2025-02-01 00:00:00.000000', 'Ürün 031 açıklaması', 'Ürün 031', 'P0031', 'kg', 31),
(32, '2025-02-02 00:00:00.000000', 'Ürün 032 açıklaması', 'Ürün 032', 'P0032', 'litre', 32),
(33, '2025-02-03 00:00:00.000000', 'Ürün 033 açıklaması', 'Ürün 033', 'P0033', 'koli', 33),
(34, '2025-02-04 00:00:00.000000', 'Ürün 034 açıklaması', 'Ürün 034', 'P0034', 'paket', 34),
(35, '2025-02-05 00:00:00.000000', 'Ürün 035 açıklaması', 'Ürün 035', 'P0035', 'adet', 35),
(36, '2025-02-06 00:00:00.000000', 'Ürün 036 açıklaması', 'Ürün 036', 'P0036', 'kg', 36),
(37, '2025-02-07 00:00:00.000000', 'Ürün 037 açıklaması', 'Ürün 037', 'P0037', 'litre', 37),
(38, '2025-02-08 00:00:00.000000', 'Ürün 038 açıklaması', 'Ürün 038', 'P0038', 'koli', 38),
(39, '2025-02-09 00:00:00.000000', 'Ürün 039 açıklaması', 'Ürün 039', 'P0039', 'paket', 39),
(40, '2025-02-10 00:00:00.000000', 'Ürün 040 açıklaması', 'Ürün 040', 'P0040', 'adet', 40),
(41, '2025-02-11 00:00:00.000000', 'Ürün 041 açıklaması', 'Ürün 041', 'P0041', 'kg', 41),
(42, '2025-02-12 00:00:00.000000', 'Ürün 042 açıklaması', 'Ürün 042', 'P0042', 'litre', 42),
(43, '2025-02-13 00:00:00.000000', 'Ürün 043 açıklaması', 'Ürün 043', 'P0043', 'koli', 43),
(44, '2025-02-14 00:00:00.000000', 'Ürün 044 açıklaması', 'Ürün 044', 'P0044', 'paket', 44),
(45, '2025-02-15 00:00:00.000000', 'Ürün 045 açıklaması', 'Ürün 045', 'P0045', 'adet', 45),
(46, '2025-02-16 00:00:00.000000', 'Ürün 046 açıklaması', 'Ürün 046', 'P0046', 'kg', 46),
(47, '2025-02-17 00:00:00.000000', 'Ürün 047 açıklaması', 'Ürün 047', 'P0047', 'litre', 47),
(48, '2025-02-18 00:00:00.000000', 'Ürün 048 açıklaması', 'Ürün 048', 'P0048', 'koli', 48),
(49, '2025-02-19 00:00:00.000000', 'Ürün 049 açıklaması', 'Ürün 049', 'P0049', 'paket', 49),
(50, '2025-02-20 00:00:00.000000', 'Ürün 050 açıklaması', 'Ürün 050', 'P0050', 'adet', 50),
(51, '2025-02-21 00:00:00.000000', 'Ürün 051 açıklaması', 'Ürün 051', 'P0051', 'kg', 51),
(52, '2025-02-22 00:00:00.000000', 'Ürün 052 açıklaması', 'Ürün 052', 'P0052', 'litre', 52),
(53, '2025-02-23 00:00:00.000000', 'Ürün 053 açıklaması', 'Ürün 053', 'P0053', 'koli', 53),
(54, '2025-02-24 00:00:00.000000', 'Ürün 054 açıklaması', 'Ürün 054', 'P0054', 'paket', 54),
(55, '2025-02-25 00:00:00.000000', 'Ürün 055 açıklaması', 'Ürün 055', 'P0055', 'adet', 55),
(56, '2025-02-26 00:00:00.000000', 'Ürün 056 açıklaması', 'Ürün 056', 'P0056', 'kg', 56),
(57, '2025-02-27 00:00:00.000000', 'Ürün 057 açıklaması', 'Ürün 057', 'P0057', 'litre', 57),
(58, '2025-02-28 00:00:00.000000', 'Ürün 058 açıklaması', 'Ürün 058', 'P0058', 'koli', 58),
(59, '2025-03-01 00:00:00.000000', 'Ürün 059 açıklaması', 'Ürün 059', 'P0059', 'paket', 59),
(60, '2025-03-02 00:00:00.000000', 'Ürün 060 açıklaması', 'Ürün 060', 'P0060', 'adet', 60),
(61, '2025-03-03 00:00:00.000000', 'Ürün 061 açıklaması', 'Ürün 061', 'P0061', 'kg', 61),
(62, '2025-03-04 00:00:00.000000', 'Ürün 062 açıklaması', 'Ürün 062', 'P0062', 'litre', 62),
(63, '2025-03-05 00:00:00.000000', 'Ürün 063 açıklaması', 'Ürün 063', 'P0063', 'koli', 63),
(64, '2025-03-06 00:00:00.000000', 'Ürün 064 açıklaması', 'Ürün 064', 'P0064', 'paket', 64),
(65, '2025-03-07 00:00:00.000000', 'Ürün 065 açıklaması', 'Ürün 065', 'P0065', 'adet', 65),
(66, '2025-03-08 00:00:00.000000', 'Ürün 066 açıklaması', 'Ürün 066', 'P0066', 'kg', 66),
(67, '2025-03-09 00:00:00.000000', 'Ürün 067 açıklaması', 'Ürün 067', 'P0067', 'litre', 67),
(68, '2025-03-10 00:00:00.000000', 'Ürün 068 açıklaması', 'Ürün 068', 'P0068', 'koli', 68),
(69, '2025-03-11 00:00:00.000000', 'Ürün 069 açıklaması', 'Ürün 069', 'P0069', 'paket', 69),
(70, '2025-03-12 00:00:00.000000', 'Ürün 070 açıklaması', 'Ürün 070', 'P0070', 'adet', 70),
(71, '2025-03-13 00:00:00.000000', 'Ürün 071 açıklaması', 'Ürün 071', 'P0071', 'kg', 71),
(72, '2025-03-14 00:00:00.000000', 'Ürün 072 açıklaması', 'Ürün 072', 'P0072', 'litre', 72),
(73, '2025-03-15 00:00:00.000000', 'Ürün 073 açıklaması', 'Ürün 073', 'P0073', 'koli', 73),
(74, '2025-03-16 00:00:00.000000', 'Ürün 074 açıklaması', 'Ürün 074', 'P0074', 'paket', 74),
(75, '2025-03-17 00:00:00.000000', 'Ürün 075 açıklaması', 'Ürün 075', 'P0075', 'adet', 75),
(76, '2025-03-18 00:00:00.000000', 'Ürün 076 açıklaması', 'Ürün 076', 'P0076', 'kg', 76),
(77, '2025-03-19 00:00:00.000000', 'Ürün 077 açıklaması', 'Ürün 077', 'P0077', 'litre', 77),
(78, '2025-03-20 00:00:00.000000', 'Ürün 078 açıklaması', 'Ürün 078', 'P0078', 'koli', 78),
(79, '2025-03-21 00:00:00.000000', 'Ürün 079 açıklaması', 'Ürün 079', 'P0079', 'paket', 79),
(80, '2025-03-22 00:00:00.000000', 'Ürün 080 açıklaması', 'Ürün 080', 'P0080', 'adet', 80),
(81, '2025-03-23 00:00:00.000000', 'Ürün 081 açıklaması', 'Ürün 081', 'P0081', 'kg', 81),
(82, '2025-03-24 00:00:00.000000', 'Ürün 082 açıklaması', 'Ürün 082', 'P0082', 'litre', 82),
(83, '2025-03-25 00:00:00.000000', 'Ürün 083 açıklaması', 'Ürün 083', 'P0083', 'koli', 83),
(84, '2025-03-26 00:00:00.000000', 'Ürün 084 açıklaması', 'Ürün 084', 'P0084', 'paket', 84),
(85, '2025-03-27 00:00:00.000000', 'Ürün 085 açıklaması', 'Ürün 085', 'P0085', 'adet', 85),
(86, '2025-03-28 00:00:00.000000', 'Ürün 086 açıklaması', 'Ürün 086', 'P0086', 'kg', 86),
(87, '2025-03-29 00:00:00.000000', 'Ürün 087 açıklaması', 'Ürün 087', 'P0087', 'litre', 87),
(88, '2025-03-30 00:00:00.000000', 'Ürün 088 açıklaması', 'Ürün 088', 'P0088', 'koli', 88),
(89, '2025-03-31 00:00:00.000000', 'Ürün 089 açıklaması', 'Ürün 089', 'P0089', 'paket', 89),
(90, '2025-04-01 00:00:00.000000', 'Ürün 090 açıklaması', 'Ürün 090', 'P0090', 'adet', 90),
(91, '2025-04-02 00:00:00.000000', 'Ürün 091 açıklaması', 'Ürün 091', 'P0091', 'kg', 91),
(92, '2025-04-03 00:00:00.000000', 'Ürün 092 açıklaması', 'Ürün 092', 'P0092', 'litre', 92),
(93, '2025-04-04 00:00:00.000000', 'Ürün 093 açıklaması', 'Ürün 093', 'P0093', 'koli', 93),
(94, '2025-04-05 00:00:00.000000', 'Ürün 094 açıklaması', 'Ürün 094', 'P0094', 'paket', 94),
(95, '2025-04-06 00:00:00.000000', 'Ürün 095 açıklaması', 'Ürün 095', 'P0095', 'adet', 95),
(96, '2025-04-07 00:00:00.000000', 'Ürün 096 açıklaması', 'Ürün 096', 'P0096', 'kg', 96),
(97, '2025-04-08 00:00:00.000000', 'Ürün 097 açıklaması', 'Ürün 097', 'P0097', 'litre', 97),
(98, '2025-04-09 00:00:00.000000', 'Ürün 098 açıklaması', 'Ürün 098', 'P0098', 'koli', 98),
(99, '2025-04-10 00:00:00.000000', 'Ürün 099 açıklaması', 'Ürün 099', 'P0099', 'paket', 99),
(100, '2025-04-11 00:00:00.000000', 'Ürün 100 açıklaması', 'Ürün 100', 'P0100', 'adet', 100);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) NOT NULL,
  `quantity` double NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `warehouse_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `quantity`, `product_id`, `warehouse_id`) VALUES
(1, 51, 1, 1),
(2, 52, 2, 2),
(3, 53, 3, 3),
(4, 54, 4, 4),
(5, 55, 5, 5),
(6, 56, 6, 6),
(7, 57, 7, 7),
(8, 58, 8, 8),
(9, 59, 9, 9),
(10, 60, 10, 10),
(11, 61, 11, 11),
(12, 62, 12, 12),
(13, 63, 13, 13),
(14, 64, 14, 14),
(15, 65, 15, 15),
(16, 66, 16, 16),
(17, 67, 17, 17),
(18, 68, 18, 18),
(19, 69, 19, 19),
(20, 70, 20, 20),
(21, 71, 21, 21),
(22, 72, 22, 22),
(23, 73, 23, 23),
(24, 74, 24, 24),
(25, 75, 25, 25),
(26, 76, 26, 26),
(27, 77, 27, 27),
(28, 78, 28, 28),
(29, 79, 29, 29),
(30, 80, 30, 30),
(31, 81, 31, 31),
(32, 82, 32, 32),
(33, 83, 33, 33),
(34, 84, 34, 34),
(35, 85, 35, 35),
(36, 86, 36, 36),
(37, 87, 37, 37),
(38, 88, 38, 38),
(39, 89, 39, 39),
(40, 90, 40, 40),
(41, 91, 41, 41),
(42, 92, 42, 42),
(43, 93, 43, 43),
(44, 94, 44, 44),
(45, 95, 45, 45),
(46, 96, 46, 46),
(47, 97, 47, 47),
(48, 98, 48, 48),
(49, 99, 49, 49),
(50, 100, 50, 50),
(51, 50, 51, 51),
(52, 51, 52, 52),
(53, 52, 53, 53),
(54, 53, 54, 54),
(55, 54, 55, 55),
(56, 55, 56, 56),
(57, 56, 57, 57),
(58, 57, 58, 58),
(59, 58, 59, 59),
(60, 59, 60, 60),
(61, 60, 61, 61),
(62, 61, 62, 62),
(63, 62, 63, 63),
(64, 63, 64, 64),
(65, 64, 65, 65),
(66, 65, 66, 66),
(67, 66, 67, 67),
(68, 67, 68, 68),
(69, 68, 69, 69),
(70, 69, 70, 70),
(71, 70, 71, 71),
(72, 71, 72, 72),
(73, 72, 73, 73),
(74, 73, 74, 74),
(75, 74, 75, 75),
(76, 75, 76, 76),
(77, 76, 77, 77),
(78, 77, 78, 78),
(79, 78, 79, 79),
(80, 79, 80, 80),
(81, 80, 81, 81),
(82, 81, 82, 82),
(83, 82, 83, 83),
(84, 83, 84, 84),
(85, 84, 85, 85),
(86, 85, 86, 86),
(87, 86, 87, 87),
(88, 87, 88, 88),
(89, 88, 89, 89),
(90, 89, 90, 90),
(91, 90, 91, 91),
(92, 91, 92, 92),
(93, 92, 93, 93),
(94, 93, 94, 94),
(95, 94, 95, 95),
(96, 95, 96, 96),
(97, 96, 97, 97),
(98, 97, 98, 98),
(99, 98, 99, 99),
(100, 99, 100, 100);

-- --------------------------------------------------------

--
-- Table structure for table `stock_movements`
--

CREATE TABLE `stock_movements` (
  `id` bigint(20) NOT NULL,
  `movement_date` datetime(6) DEFAULT NULL,
  `movement_type` enum('IN','OUT') NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `quantity` double NOT NULL,
  `unit_price` double NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `warehouse_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `stock_movements`
--

INSERT INTO `stock_movements` (`id`, `movement_date`, `movement_type`, `note`, `quantity`, `unit_price`, `product_id`, `user_id`, `warehouse_id`) VALUES
(1, '2025-01-02 00:00:00.000000', 'IN', 'Otomatik hareket 001', 6, 11, 1, 1, 1),
(2, '2025-01-03 00:00:00.000000', 'OUT', 'Otomatik hareket 002', 7, 12, 2, 2, 2),
(3, '2025-01-04 00:00:00.000000', 'IN', 'Otomatik hareket 003', 8, 13, 3, 3, 3),
(4, '2025-01-05 00:00:00.000000', 'OUT', 'Otomatik hareket 004', 9, 14, 4, 4, 4),
(5, '2025-01-06 00:00:00.000000', 'IN', 'Otomatik hareket 005', 10, 15, 5, 5, 5),
(6, '2025-01-07 00:00:00.000000', 'OUT', 'Otomatik hareket 006', 11, 16, 6, 6, 6),
(7, '2025-01-08 00:00:00.000000', 'IN', 'Otomatik hareket 007', 12, 17, 7, 7, 7),
(8, '2025-01-09 00:00:00.000000', 'OUT', 'Otomatik hareket 008', 13, 18, 8, 8, 8),
(9, '2025-01-10 00:00:00.000000', 'IN', 'Otomatik hareket 009', 14, 19, 9, 9, 9),
(10, '2025-01-11 00:00:00.000000', 'OUT', 'Otomatik hareket 010', 15, 20, 10, 10, 10),
(11, '2025-01-12 00:00:00.000000', 'IN', 'Otomatik hareket 011', 16, 21, 11, 11, 11),
(12, '2025-01-13 00:00:00.000000', 'OUT', 'Otomatik hareket 012', 17, 22, 12, 12, 12),
(13, '2025-01-14 00:00:00.000000', 'IN', 'Otomatik hareket 013', 18, 23, 13, 13, 13),
(14, '2025-01-15 00:00:00.000000', 'OUT', 'Otomatik hareket 014', 19, 24, 14, 14, 14),
(15, '2025-01-16 00:00:00.000000', 'IN', 'Otomatik hareket 015', 20, 25, 15, 15, 15),
(16, '2025-01-17 00:00:00.000000', 'OUT', 'Otomatik hareket 016', 21, 26, 16, 16, 16),
(17, '2025-01-18 00:00:00.000000', 'IN', 'Otomatik hareket 017', 22, 27, 17, 17, 17),
(18, '2025-01-19 00:00:00.000000', 'OUT', 'Otomatik hareket 018', 23, 28, 18, 18, 18),
(19, '2025-01-20 00:00:00.000000', 'IN', 'Otomatik hareket 019', 24, 29, 19, 19, 19),
(20, '2025-01-21 00:00:00.000000', 'OUT', 'Otomatik hareket 020', 5, 30, 20, 20, 20),
(21, '2025-01-22 00:00:00.000000', 'IN', 'Otomatik hareket 021', 6, 31, 21, 21, 21),
(22, '2025-01-23 00:00:00.000000', 'OUT', 'Otomatik hareket 022', 7, 32, 22, 22, 22),
(23, '2025-01-24 00:00:00.000000', 'IN', 'Otomatik hareket 023', 8, 33, 23, 23, 23),
(24, '2025-01-25 00:00:00.000000', 'OUT', 'Otomatik hareket 024', 9, 34, 24, 24, 24),
(25, '2025-01-26 00:00:00.000000', 'IN', 'Otomatik hareket 025', 10, 35, 25, 25, 25),
(26, '2025-01-27 00:00:00.000000', 'OUT', 'Otomatik hareket 026', 11, 36, 26, 26, 26),
(27, '2025-01-28 00:00:00.000000', 'IN', 'Otomatik hareket 027', 12, 37, 27, 27, 27),
(28, '2025-01-29 00:00:00.000000', 'OUT', 'Otomatik hareket 028', 13, 38, 28, 28, 28),
(29, '2025-01-30 00:00:00.000000', 'IN', 'Otomatik hareket 029', 14, 39, 29, 29, 29),
(30, '2025-01-31 00:00:00.000000', 'OUT', 'Otomatik hareket 030', 15, 40, 30, 30, 30),
(31, '2025-02-01 00:00:00.000000', 'IN', 'Otomatik hareket 031', 16, 41, 31, 31, 31),
(32, '2025-02-02 00:00:00.000000', 'OUT', 'Otomatik hareket 032', 17, 42, 32, 32, 32),
(33, '2025-02-03 00:00:00.000000', 'IN', 'Otomatik hareket 033', 18, 43, 33, 33, 33),
(34, '2025-02-04 00:00:00.000000', 'OUT', 'Otomatik hareket 034', 19, 44, 34, 34, 34),
(35, '2025-02-05 00:00:00.000000', 'IN', 'Otomatik hareket 035', 20, 45, 35, 35, 35),
(36, '2025-02-06 00:00:00.000000', 'OUT', 'Otomatik hareket 036', 21, 46, 36, 36, 36),
(37, '2025-02-07 00:00:00.000000', 'IN', 'Otomatik hareket 037', 22, 47, 37, 37, 37),
(38, '2025-02-08 00:00:00.000000', 'OUT', 'Otomatik hareket 038', 23, 48, 38, 38, 38),
(39, '2025-02-09 00:00:00.000000', 'IN', 'Otomatik hareket 039', 24, 49, 39, 39, 39),
(40, '2025-02-10 00:00:00.000000', 'OUT', 'Otomatik hareket 040', 5, 50, 40, 40, 40),
(41, '2025-02-11 00:00:00.000000', 'IN', 'Otomatik hareket 041', 6, 51, 41, 41, 41),
(42, '2025-02-12 00:00:00.000000', 'OUT', 'Otomatik hareket 042', 7, 52, 42, 42, 42),
(43, '2025-02-13 00:00:00.000000', 'IN', 'Otomatik hareket 043', 8, 53, 43, 43, 43),
(44, '2025-02-14 00:00:00.000000', 'OUT', 'Otomatik hareket 044', 9, 54, 44, 44, 44),
(45, '2025-02-15 00:00:00.000000', 'IN', 'Otomatik hareket 045', 10, 55, 45, 45, 45),
(46, '2025-02-16 00:00:00.000000', 'OUT', 'Otomatik hareket 046', 11, 56, 46, 46, 46),
(47, '2025-02-17 00:00:00.000000', 'IN', 'Otomatik hareket 047', 12, 57, 47, 47, 47),
(48, '2025-02-18 00:00:00.000000', 'OUT', 'Otomatik hareket 048', 13, 58, 48, 48, 48),
(49, '2025-02-19 00:00:00.000000', 'IN', 'Otomatik hareket 049', 14, 59, 49, 49, 49),
(50, '2025-02-20 00:00:00.000000', 'OUT', 'Otomatik hareket 050', 15, 10, 50, 50, 50),
(51, '2025-02-21 00:00:00.000000', 'IN', 'Otomatik hareket 051', 16, 11, 51, 51, 51),
(52, '2025-02-22 00:00:00.000000', 'OUT', 'Otomatik hareket 052', 17, 12, 52, 52, 52),
(53, '2025-02-23 00:00:00.000000', 'IN', 'Otomatik hareket 053', 18, 13, 53, 53, 53),
(54, '2025-02-24 00:00:00.000000', 'OUT', 'Otomatik hareket 054', 19, 14, 54, 54, 54),
(55, '2025-02-25 00:00:00.000000', 'IN', 'Otomatik hareket 055', 20, 15, 55, 55, 55),
(56, '2025-02-26 00:00:00.000000', 'OUT', 'Otomatik hareket 056', 21, 16, 56, 56, 56),
(57, '2025-02-27 00:00:00.000000', 'IN', 'Otomatik hareket 057', 22, 17, 57, 57, 57),
(58, '2025-02-28 00:00:00.000000', 'OUT', 'Otomatik hareket 058', 23, 18, 58, 58, 58),
(59, '2025-03-01 00:00:00.000000', 'IN', 'Otomatik hareket 059', 24, 19, 59, 59, 59),
(60, '2025-03-02 00:00:00.000000', 'OUT', 'Otomatik hareket 060', 5, 20, 60, 60, 60),
(61, '2025-03-03 00:00:00.000000', 'IN', 'Otomatik hareket 061', 6, 21, 61, 61, 61),
(62, '2025-03-04 00:00:00.000000', 'OUT', 'Otomatik hareket 062', 7, 22, 62, 62, 62),
(63, '2025-03-05 00:00:00.000000', 'IN', 'Otomatik hareket 063', 8, 23, 63, 63, 63),
(64, '2025-03-06 00:00:00.000000', 'OUT', 'Otomatik hareket 064', 9, 24, 64, 64, 64),
(65, '2025-03-07 00:00:00.000000', 'IN', 'Otomatik hareket 065', 10, 25, 65, 65, 65),
(66, '2025-03-08 00:00:00.000000', 'OUT', 'Otomatik hareket 066', 11, 26, 66, 66, 66),
(67, '2025-03-09 00:00:00.000000', 'IN', 'Otomatik hareket 067', 12, 27, 67, 67, 67),
(68, '2025-03-10 00:00:00.000000', 'OUT', 'Otomatik hareket 068', 13, 28, 68, 68, 68),
(69, '2025-03-11 00:00:00.000000', 'IN', 'Otomatik hareket 069', 14, 29, 69, 69, 69),
(70, '2025-03-12 00:00:00.000000', 'OUT', 'Otomatik hareket 070', 15, 30, 70, 70, 70),
(71, '2025-03-13 00:00:00.000000', 'IN', 'Otomatik hareket 071', 16, 31, 71, 71, 71),
(72, '2025-03-14 00:00:00.000000', 'OUT', 'Otomatik hareket 072', 17, 32, 72, 72, 72),
(73, '2025-03-15 00:00:00.000000', 'IN', 'Otomatik hareket 073', 18, 33, 73, 73, 73),
(74, '2025-03-16 00:00:00.000000', 'OUT', 'Otomatik hareket 074', 19, 34, 74, 74, 74),
(75, '2025-03-17 00:00:00.000000', 'IN', 'Otomatik hareket 075', 20, 35, 75, 75, 75),
(76, '2025-03-18 00:00:00.000000', 'OUT', 'Otomatik hareket 076', 21, 36, 76, 76, 76),
(77, '2025-03-19 00:00:00.000000', 'IN', 'Otomatik hareket 077', 22, 37, 77, 77, 77),
(78, '2025-03-20 00:00:00.000000', 'OUT', 'Otomatik hareket 078', 23, 38, 78, 78, 78),
(79, '2025-03-21 00:00:00.000000', 'IN', 'Otomatik hareket 079', 24, 39, 79, 79, 79),
(80, '2025-03-22 00:00:00.000000', 'OUT', 'Otomatik hareket 080', 5, 40, 80, 80, 80),
(81, '2025-03-23 00:00:00.000000', 'IN', 'Otomatik hareket 081', 6, 41, 81, 81, 81),
(82, '2025-03-24 00:00:00.000000', 'OUT', 'Otomatik hareket 082', 7, 42, 82, 82, 82),
(83, '2025-03-25 00:00:00.000000', 'IN', 'Otomatik hareket 083', 8, 43, 83, 83, 83),
(84, '2025-03-26 00:00:00.000000', 'OUT', 'Otomatik hareket 084', 9, 44, 84, 84, 84),
(85, '2025-03-27 00:00:00.000000', 'IN', 'Otomatik hareket 085', 10, 45, 85, 85, 85),
(86, '2025-03-28 00:00:00.000000', 'OUT', 'Otomatik hareket 086', 11, 46, 86, 86, 86),
(87, '2025-03-29 00:00:00.000000', 'IN', 'Otomatik hareket 087', 12, 47, 87, 87, 87),
(88, '2025-03-30 00:00:00.000000', 'OUT', 'Otomatik hareket 088', 13, 48, 88, 88, 88),
(89, '2025-03-31 00:00:00.000000', 'IN', 'Otomatik hareket 089', 14, 49, 89, 89, 89),
(90, '2025-04-01 00:00:00.000000', 'OUT', 'Otomatik hareket 090', 15, 50, 90, 90, 90),
(91, '2025-04-02 00:00:00.000000', 'IN', 'Otomatik hareket 091', 16, 51, 91, 91, 91),
(92, '2025-04-03 00:00:00.000000', 'OUT', 'Otomatik hareket 092', 17, 52, 92, 92, 92),
(93, '2025-04-04 00:00:00.000000', 'IN', 'Otomatik hareket 093', 18, 53, 93, 93, 93),
(94, '2025-04-05 00:00:00.000000', 'OUT', 'Otomatik hareket 094', 19, 54, 94, 94, 94),
(95, '2025-04-06 00:00:00.000000', 'IN', 'Otomatik hareket 095', 20, 55, 95, 95, 95),
(96, '2025-04-07 00:00:00.000000', 'OUT', 'Otomatik hareket 096', 21, 56, 96, 96, 96),
(97, '2025-04-08 00:00:00.000000', 'IN', 'Otomatik hareket 097', 22, 57, 97, 97, 97),
(98, '2025-04-09 00:00:00.000000', 'OUT', 'Otomatik hareket 098', 23, 58, 98, 98, 98),
(99, '2025-04-10 00:00:00.000000', 'IN', 'Otomatik hareket 099', 24, 59, 99, 99, 99),
(100, '2025-04-11 00:00:00.000000', 'OUT', 'Otomatik hareket 100', 5, 10, 100, 100, 100);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `address`, `email`, `name`, `phone`) VALUES
(1, 'Adres T001 Mah. No:1', 'sup001@example.com', 'Tedarikçi 001', '+90 5137 1001'),
(2, 'Adres T002 Mah. No:2', 'sup002@example.com', 'Tedarikçi 002', '+90 5264 1002'),
(3, 'Adres T003 Mah. No:3', 'sup003@example.com', 'Tedarikçi 003', '+90 5391 1003'),
(4, 'Adres T004 Mah. No:4', 'sup004@example.com', 'Tedarikçi 004', '+90 5428 1004'),
(5, 'Adres T005 Mah. No:5', 'sup005@example.com', 'Tedarikçi 005', '+90 5555 1005'),
(6, 'Adres T006 Mah. No:6', 'sup006@example.com', 'Tedarikçi 006', '+90 5682 1006'),
(7, 'Adres T007 Mah. No:7', 'sup007@example.com', 'Tedarikçi 007', '+90 5719 1007'),
(8, 'Adres T008 Mah. No:8', 'sup008@example.com', 'Tedarikçi 008', '+90 5846 1008'),
(9, 'Adres T009 Mah. No:9', 'sup009@example.com', 'Tedarikçi 009', '+90 5973 1009'),
(10, 'Adres T010 Mah. No:10', 'sup010@example.com', 'Tedarikçi 010', '+90 5000 1010'),
(11, 'Adres T011 Mah. No:11', 'sup011@example.com', 'Tedarikçi 011', '+90 5137 1011'),
(12, 'Adres T012 Mah. No:12', 'sup012@example.com', 'Tedarikçi 012', '+90 5264 1012'),
(13, 'Adres T013 Mah. No:13', 'sup013@example.com', 'Tedarikçi 013', '+90 5391 1013'),
(14, 'Adres T014 Mah. No:14', 'sup014@example.com', 'Tedarikçi 014', '+90 5428 1014'),
(15, 'Adres T015 Mah. No:15', 'sup015@example.com', 'Tedarikçi 015', '+90 5555 1015'),
(16, 'Adres T016 Mah. No:16', 'sup016@example.com', 'Tedarikçi 016', '+90 5682 1016'),
(17, 'Adres T017 Mah. No:17', 'sup017@example.com', 'Tedarikçi 017', '+90 5719 1017'),
(18, 'Adres T018 Mah. No:18', 'sup018@example.com', 'Tedarikçi 018', '+90 5846 1018'),
(19, 'Adres T019 Mah. No:19', 'sup019@example.com', 'Tedarikçi 019', '+90 5973 1019'),
(20, 'Adres T020 Mah. No:20', 'sup020@example.com', 'Tedarikçi 020', '+90 5000 1020'),
(21, 'Adres T021 Mah. No:21', 'sup021@example.com', 'Tedarikçi 021', '+90 5137 1021'),
(22, 'Adres T022 Mah. No:22', 'sup022@example.com', 'Tedarikçi 022', '+90 5264 1022'),
(23, 'Adres T023 Mah. No:23', 'sup023@example.com', 'Tedarikçi 023', '+90 5391 1023'),
(24, 'Adres T024 Mah. No:24', 'sup024@example.com', 'Tedarikçi 024', '+90 5428 1024'),
(25, 'Adres T025 Mah. No:25', 'sup025@example.com', 'Tedarikçi 025', '+90 5555 1025'),
(26, 'Adres T026 Mah. No:26', 'sup026@example.com', 'Tedarikçi 026', '+90 5682 1026'),
(27, 'Adres T027 Mah. No:27', 'sup027@example.com', 'Tedarikçi 027', '+90 5719 1027'),
(28, 'Adres T028 Mah. No:28', 'sup028@example.com', 'Tedarikçi 028', '+90 5846 1028'),
(29, 'Adres T029 Mah. No:29', 'sup029@example.com', 'Tedarikçi 029', '+90 5973 1029'),
(30, 'Adres T030 Mah. No:30', 'sup030@example.com', 'Tedarikçi 030', '+90 5000 1030'),
(31, 'Adres T031 Mah. No:31', 'sup031@example.com', 'Tedarikçi 031', '+90 5137 1031'),
(32, 'Adres T032 Mah. No:32', 'sup032@example.com', 'Tedarikçi 032', '+90 5264 1032'),
(33, 'Adres T033 Mah. No:33', 'sup033@example.com', 'Tedarikçi 033', '+90 5391 1033'),
(34, 'Adres T034 Mah. No:34', 'sup034@example.com', 'Tedarikçi 034', '+90 5428 1034'),
(35, 'Adres T035 Mah. No:35', 'sup035@example.com', 'Tedarikçi 035', '+90 5555 1035'),
(36, 'Adres T036 Mah. No:36', 'sup036@example.com', 'Tedarikçi 036', '+90 5682 1036'),
(37, 'Adres T037 Mah. No:37', 'sup037@example.com', 'Tedarikçi 037', '+90 5719 1037'),
(38, 'Adres T038 Mah. No:38', 'sup038@example.com', 'Tedarikçi 038', '+90 5846 1038'),
(39, 'Adres T039 Mah. No:39', 'sup039@example.com', 'Tedarikçi 039', '+90 5973 1039'),
(40, 'Adres T040 Mah. No:40', 'sup040@example.com', 'Tedarikçi 040', '+90 5000 1040'),
(41, 'Adres T041 Mah. No:41', 'sup041@example.com', 'Tedarikçi 041', '+90 5137 1041'),
(42, 'Adres T042 Mah. No:42', 'sup042@example.com', 'Tedarikçi 042', '+90 5264 1042'),
(43, 'Adres T043 Mah. No:43', 'sup043@example.com', 'Tedarikçi 043', '+90 5391 1043'),
(44, 'Adres T044 Mah. No:44', 'sup044@example.com', 'Tedarikçi 044', '+90 5428 1044'),
(45, 'Adres T045 Mah. No:45', 'sup045@example.com', 'Tedarikçi 045', '+90 5555 1045'),
(46, 'Adres T046 Mah. No:46', 'sup046@example.com', 'Tedarikçi 046', '+90 5682 1046'),
(47, 'Adres T047 Mah. No:47', 'sup047@example.com', 'Tedarikçi 047', '+90 5719 1047'),
(48, 'Adres T048 Mah. No:48', 'sup048@example.com', 'Tedarikçi 048', '+90 5846 1048'),
(49, 'Adres T049 Mah. No:49', 'sup049@example.com', 'Tedarikçi 049', '+90 5973 1049'),
(50, 'Adres T050 Mah. No:50', 'sup050@example.com', 'Tedarikçi 050', '+90 5000 1050'),
(51, 'Adres T051 Mah. No:51', 'sup051@example.com', 'Tedarikçi 051', '+90 5137 1051'),
(52, 'Adres T052 Mah. No:52', 'sup052@example.com', 'Tedarikçi 052', '+90 5264 1052'),
(53, 'Adres T053 Mah. No:53', 'sup053@example.com', 'Tedarikçi 053', '+90 5391 1053'),
(54, 'Adres T054 Mah. No:54', 'sup054@example.com', 'Tedarikçi 054', '+90 5428 1054'),
(55, 'Adres T055 Mah. No:55', 'sup055@example.com', 'Tedarikçi 055', '+90 5555 1055'),
(56, 'Adres T056 Mah. No:56', 'sup056@example.com', 'Tedarikçi 056', '+90 5682 1056'),
(57, 'Adres T057 Mah. No:57', 'sup057@example.com', 'Tedarikçi 057', '+90 5719 1057'),
(58, 'Adres T058 Mah. No:58', 'sup058@example.com', 'Tedarikçi 058', '+90 5846 1058'),
(59, 'Adres T059 Mah. No:59', 'sup059@example.com', 'Tedarikçi 059', '+90 5973 1059'),
(60, 'Adres T060 Mah. No:60', 'sup060@example.com', 'Tedarikçi 060', '+90 5000 1060'),
(61, 'Adres T061 Mah. No:61', 'sup061@example.com', 'Tedarikçi 061', '+90 5137 1061'),
(62, 'Adres T062 Mah. No:62', 'sup062@example.com', 'Tedarikçi 062', '+90 5264 1062'),
(63, 'Adres T063 Mah. No:63', 'sup063@example.com', 'Tedarikçi 063', '+90 5391 1063'),
(64, 'Adres T064 Mah. No:64', 'sup064@example.com', 'Tedarikçi 064', '+90 5428 1064'),
(65, 'Adres T065 Mah. No:65', 'sup065@example.com', 'Tedarikçi 065', '+90 5555 1065'),
(66, 'Adres T066 Mah. No:66', 'sup066@example.com', 'Tedarikçi 066', '+90 5682 1066'),
(67, 'Adres T067 Mah. No:67', 'sup067@example.com', 'Tedarikçi 067', '+90 5719 1067'),
(68, 'Adres T068 Mah. No:68', 'sup068@example.com', 'Tedarikçi 068', '+90 5846 1068'),
(69, 'Adres T069 Mah. No:69', 'sup069@example.com', 'Tedarikçi 069', '+90 5973 1069'),
(70, 'Adres T070 Mah. No:70', 'sup070@example.com', 'Tedarikçi 070', '+90 5000 1070'),
(71, 'Adres T071 Mah. No:71', 'sup071@example.com', 'Tedarikçi 071', '+90 5137 1071'),
(72, 'Adres T072 Mah. No:72', 'sup072@example.com', 'Tedarikçi 072', '+90 5264 1072'),
(73, 'Adres T073 Mah. No:73', 'sup073@example.com', 'Tedarikçi 073', '+90 5391 1073'),
(74, 'Adres T074 Mah. No:74', 'sup074@example.com', 'Tedarikçi 074', '+90 5428 1074'),
(75, 'Adres T075 Mah. No:75', 'sup075@example.com', 'Tedarikçi 075', '+90 5555 1075'),
(76, 'Adres T076 Mah. No:76', 'sup076@example.com', 'Tedarikçi 076', '+90 5682 1076'),
(77, 'Adres T077 Mah. No:77', 'sup077@example.com', 'Tedarikçi 077', '+90 5719 1077'),
(78, 'Adres T078 Mah. No:78', 'sup078@example.com', 'Tedarikçi 078', '+90 5846 1078'),
(79, 'Adres T079 Mah. No:79', 'sup079@example.com', 'Tedarikçi 079', '+90 5973 1079'),
(80, 'Adres T080 Mah. No:80', 'sup080@example.com', 'Tedarikçi 080', '+90 5000 1080'),
(81, 'Adres T081 Mah. No:81', 'sup081@example.com', 'Tedarikçi 081', '+90 5137 1081'),
(82, 'Adres T082 Mah. No:82', 'sup082@example.com', 'Tedarikçi 082', '+90 5264 1082'),
(83, 'Adres T083 Mah. No:83', 'sup083@example.com', 'Tedarikçi 083', '+90 5391 1083'),
(84, 'Adres T084 Mah. No:84', 'sup084@example.com', 'Tedarikçi 084', '+90 5428 1084'),
(85, 'Adres T085 Mah. No:85', 'sup085@example.com', 'Tedarikçi 085', '+90 5555 1085'),
(86, 'Adres T086 Mah. No:86', 'sup086@example.com', 'Tedarikçi 086', '+90 5682 1086'),
(87, 'Adres T087 Mah. No:87', 'sup087@example.com', 'Tedarikçi 087', '+90 5719 1087'),
(88, 'Adres T088 Mah. No:88', 'sup088@example.com', 'Tedarikçi 088', '+90 5846 1088'),
(89, 'Adres T089 Mah. No:89', 'sup089@example.com', 'Tedarikçi 089', '+90 5973 1089'),
(90, 'Adres T090 Mah. No:90', 'sup090@example.com', 'Tedarikçi 090', '+90 5000 1090'),
(91, 'Adres T091 Mah. No:91', 'sup091@example.com', 'Tedarikçi 091', '+90 5137 1091'),
(92, 'Adres T092 Mah. No:92', 'sup092@example.com', 'Tedarikçi 092', '+90 5264 1092'),
(93, 'Adres T093 Mah. No:93', 'sup093@example.com', 'Tedarikçi 093', '+90 5391 1093'),
(94, 'Adres T094 Mah. No:94', 'sup094@example.com', 'Tedarikçi 094', '+90 5428 1094'),
(95, 'Adres T095 Mah. No:95', 'sup095@example.com', 'Tedarikçi 095', '+90 5555 1095'),
(96, 'Adres T096 Mah. No:96', 'sup096@example.com', 'Tedarikçi 096', '+90 5682 1096'),
(97, 'Adres T097 Mah. No:97', 'sup097@example.com', 'Tedarikçi 097', '+90 5719 1097'),
(98, 'Adres T098 Mah. No:98', 'sup098@example.com', 'Tedarikçi 098', '+90 5846 1098'),
(99, 'Adres T099 Mah. No:99', 'sup099@example.com', 'Tedarikçi 099', '+90 5973 1099'),
(100, 'Adres T100 Mah. No:100', 'sup100@example.com', 'Tedarikçi 100', '+90 5000 1100');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `password`, `roles`, `username`) VALUES
(1, '2025-01-02 01:00:00.000000', 'pass1234', 'ROLE_USER', 'user001'),
(2, '2025-01-03 02:00:00.000000', 'pass1234', 'ROLE_USER', 'user002'),
(3, '2025-01-04 03:00:00.000000', 'pass1234', 'ROLE_USER', 'user003'),
(4, '2025-01-05 04:00:00.000000', 'pass1234', 'ROLE_USER', 'user004'),
(5, '2025-01-06 05:00:00.000000', 'pass1234', 'ROLE_USER', 'user005'),
(6, '2025-01-07 06:00:00.000000', 'pass1234', 'ROLE_USER', 'user006'),
(7, '2025-01-08 07:00:00.000000', 'pass1234', 'ROLE_USER', 'user007'),
(8, '2025-01-09 08:00:00.000000', 'pass1234', 'ROLE_USER', 'user008'),
(9, '2025-01-10 09:00:00.000000', 'pass1234', 'ROLE_USER', 'user009'),
(10, '2025-01-11 10:00:00.000000', 'pass1234', 'ROLE_USER', 'user010'),
(11, '2025-01-12 11:00:00.000000', 'pass1234', 'ROLE_USER', 'user011'),
(12, '2025-01-13 12:00:00.000000', 'pass1234', 'ROLE_USER', 'user012'),
(13, '2025-01-14 13:00:00.000000', 'pass1234', 'ROLE_USER', 'user013'),
(14, '2025-01-15 14:00:00.000000', 'pass1234', 'ROLE_USER', 'user014'),
(15, '2025-01-16 15:00:00.000000', 'pass1234', 'ROLE_USER', 'user015'),
(16, '2025-01-17 16:00:00.000000', 'pass1234', 'ROLE_USER', 'user016'),
(17, '2025-01-18 17:00:00.000000', 'pass1234', 'ROLE_USER', 'user017'),
(18, '2025-01-19 18:00:00.000000', 'pass1234', 'ROLE_USER', 'user018'),
(19, '2025-01-20 19:00:00.000000', 'pass1234', 'ROLE_USER', 'user019'),
(20, '2025-01-21 20:00:00.000000', 'pass1234', 'ROLE_USER', 'user020'),
(21, '2025-01-22 21:00:00.000000', 'pass1234', 'ROLE_USER', 'user021'),
(22, '2025-01-23 22:00:00.000000', 'pass1234', 'ROLE_USER', 'user022'),
(23, '2025-01-24 23:00:00.000000', 'pass1234', 'ROLE_USER', 'user023'),
(24, '2025-01-25 00:00:00.000000', 'pass1234', 'ROLE_USER', 'user024'),
(25, '2025-01-26 01:00:00.000000', 'pass1234', 'ROLE_USER', 'user025'),
(26, '2025-01-27 02:00:00.000000', 'pass1234', 'ROLE_USER', 'user026'),
(27, '2025-01-28 03:00:00.000000', 'pass1234', 'ROLE_USER', 'user027'),
(28, '2025-01-29 04:00:00.000000', 'pass1234', 'ROLE_USER', 'user028'),
(29, '2025-01-30 05:00:00.000000', 'pass1234', 'ROLE_USER', 'user029'),
(30, '2025-01-01 06:00:00.000000', 'pass1234', 'ROLE_USER', 'user030'),
(31, '2025-01-02 07:00:00.000000', 'pass1234', 'ROLE_USER', 'user031'),
(32, '2025-01-03 08:00:00.000000', 'pass1234', 'ROLE_USER', 'user032'),
(33, '2025-01-04 09:00:00.000000', 'pass1234', 'ROLE_USER', 'user033'),
(34, '2025-01-05 10:00:00.000000', 'pass1234', 'ROLE_USER', 'user034'),
(35, '2025-01-06 11:00:00.000000', 'pass1234', 'ROLE_USER', 'user035'),
(36, '2025-01-07 12:00:00.000000', 'pass1234', 'ROLE_USER', 'user036'),
(37, '2025-01-08 13:00:00.000000', 'pass1234', 'ROLE_USER', 'user037'),
(38, '2025-01-09 14:00:00.000000', 'pass1234', 'ROLE_USER', 'user038'),
(39, '2025-01-10 15:00:00.000000', 'pass1234', 'ROLE_USER', 'user039'),
(40, '2025-01-11 16:00:00.000000', 'pass1234', 'ROLE_USER', 'user040'),
(41, '2025-01-12 17:00:00.000000', 'pass1234', 'ROLE_USER', 'user041'),
(42, '2025-01-13 18:00:00.000000', 'pass1234', 'ROLE_USER', 'user042'),
(43, '2025-01-14 19:00:00.000000', 'pass1234', 'ROLE_USER', 'user043'),
(44, '2025-01-15 20:00:00.000000', 'pass1234', 'ROLE_USER', 'user044'),
(45, '2025-01-16 21:00:00.000000', 'pass1234', 'ROLE_USER', 'user045'),
(46, '2025-01-17 22:00:00.000000', 'pass1234', 'ROLE_USER', 'user046'),
(47, '2025-01-18 23:00:00.000000', 'pass1234', 'ROLE_USER', 'user047'),
(48, '2025-01-19 00:00:00.000000', 'pass1234', 'ROLE_USER', 'user048'),
(49, '2025-01-20 01:00:00.000000', 'pass1234', 'ROLE_USER', 'user049'),
(50, '2025-01-21 02:00:00.000000', 'pass1234', 'ROLE_USER', 'user050'),
(51, '2025-01-22 03:00:00.000000', 'pass1234', 'ROLE_USER', 'user051'),
(52, '2025-01-23 04:00:00.000000', 'pass1234', 'ROLE_USER', 'user052'),
(53, '2025-01-24 05:00:00.000000', 'pass1234', 'ROLE_USER', 'user053'),
(54, '2025-01-25 06:00:00.000000', 'pass1234', 'ROLE_USER', 'user054'),
(55, '2025-01-26 07:00:00.000000', 'pass1234', 'ROLE_USER', 'user055'),
(56, '2025-01-27 08:00:00.000000', 'pass1234', 'ROLE_USER', 'user056'),
(57, '2025-01-28 09:00:00.000000', 'pass1234', 'ROLE_USER', 'user057'),
(58, '2025-01-29 10:00:00.000000', 'pass1234', 'ROLE_USER', 'user058'),
(59, '2025-01-30 11:00:00.000000', 'pass1234', 'ROLE_USER', 'user059'),
(60, '2025-01-01 12:00:00.000000', 'pass1234', 'ROLE_USER', 'user060'),
(61, '2025-01-02 13:00:00.000000', 'pass1234', 'ROLE_USER', 'user061'),
(62, '2025-01-03 14:00:00.000000', 'pass1234', 'ROLE_USER', 'user062'),
(63, '2025-01-04 15:00:00.000000', 'pass1234', 'ROLE_USER', 'user063'),
(64, '2025-01-05 16:00:00.000000', 'pass1234', 'ROLE_USER', 'user064'),
(65, '2025-01-06 17:00:00.000000', 'pass1234', 'ROLE_USER', 'user065'),
(66, '2025-01-07 18:00:00.000000', 'pass1234', 'ROLE_USER', 'user066'),
(67, '2025-01-08 19:00:00.000000', 'pass1234', 'ROLE_USER', 'user067'),
(68, '2025-01-09 20:00:00.000000', 'pass1234', 'ROLE_USER', 'user068'),
(69, '2025-01-10 21:00:00.000000', 'pass1234', 'ROLE_USER', 'user069'),
(70, '2025-01-11 22:00:00.000000', 'pass1234', 'ROLE_USER', 'user070'),
(71, '2025-01-12 23:00:00.000000', 'pass1234', 'ROLE_USER', 'user071'),
(72, '2025-01-13 00:00:00.000000', 'pass1234', 'ROLE_USER', 'user072'),
(73, '2025-01-14 01:00:00.000000', 'pass1234', 'ROLE_USER', 'user073'),
(74, '2025-01-15 02:00:00.000000', 'pass1234', 'ROLE_USER', 'user074'),
(75, '2025-01-16 03:00:00.000000', 'pass1234', 'ROLE_USER', 'user075'),
(76, '2025-01-17 04:00:00.000000', 'pass1234', 'ROLE_USER', 'user076'),
(77, '2025-01-18 05:00:00.000000', 'pass1234', 'ROLE_USER', 'user077'),
(78, '2025-01-19 06:00:00.000000', 'pass1234', 'ROLE_USER', 'user078'),
(79, '2025-01-20 07:00:00.000000', 'pass1234', 'ROLE_USER', 'user079'),
(80, '2025-01-21 08:00:00.000000', 'pass1234', 'ROLE_USER', 'user080'),
(81, '2025-01-22 09:00:00.000000', 'pass1234', 'ROLE_USER', 'user081'),
(82, '2025-01-23 10:00:00.000000', 'pass1234', 'ROLE_USER', 'user082'),
(83, '2025-01-24 11:00:00.000000', 'pass1234', 'ROLE_USER', 'user083'),
(84, '2025-01-25 12:00:00.000000', 'pass1234', 'ROLE_USER', 'user084'),
(85, '2025-01-26 13:00:00.000000', 'pass1234', 'ROLE_USER', 'user085'),
(86, '2025-01-27 14:00:00.000000', 'pass1234', 'ROLE_USER', 'user086'),
(87, '2025-01-28 15:00:00.000000', 'pass1234', 'ROLE_USER', 'user087'),
(88, '2025-01-29 16:00:00.000000', 'pass1234', 'ROLE_USER', 'user088'),
(89, '2025-01-30 17:00:00.000000', 'pass1234', 'ROLE_USER', 'user089'),
(90, '2025-01-01 18:00:00.000000', 'pass1234', 'ROLE_USER', 'user090'),
(91, '2025-01-02 19:00:00.000000', 'pass1234', 'ROLE_USER', 'user091'),
(92, '2025-01-03 20:00:00.000000', 'pass1234', 'ROLE_USER', 'user092'),
(93, '2025-01-04 21:00:00.000000', 'pass1234', 'ROLE_USER', 'user093'),
(94, '2025-01-05 22:00:00.000000', 'pass1234', 'ROLE_USER', 'user094'),
(95, '2025-01-06 23:00:00.000000', 'pass1234', 'ROLE_USER', 'user095'),
(96, '2025-01-07 00:00:00.000000', 'pass1234', 'ROLE_USER', 'user096'),
(97, '2025-01-08 01:00:00.000000', 'pass1234', 'ROLE_USER', 'user097'),
(98, '2025-01-09 02:00:00.000000', 'pass1234', 'ROLE_USER', 'user098'),
(99, '2025-01-10 03:00:00.000000', 'pass1234', 'ROLE_USER', 'user099'),
(100, '2025-01-11 04:00:00.000000', 'pass1234', 'ROLE_USER', 'user100'),
(101, NULL, '$2a$10$uyUWuqRngBx8KIDJwJEpQ.tv3n8TTc7pqhKUtmkGyt4qsWH5k5ajK', 'ROLE_ADMIN,ROLE_USER', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `location`, `name`) VALUES
(1, 'Lokasyon 001', 'Depo 001'),
(2, 'Lokasyon 002', 'Depo 002'),
(3, 'Lokasyon 003', 'Depo 003'),
(4, 'Lokasyon 004', 'Depo 004'),
(5, 'Lokasyon 005', 'Depo 005'),
(6, 'Lokasyon 006', 'Depo 006'),
(7, 'Lokasyon 007', 'Depo 007'),
(8, 'Lokasyon 008', 'Depo 008'),
(9, 'Lokasyon 009', 'Depo 009'),
(10, 'Lokasyon 010', 'Depo 010'),
(11, 'Lokasyon 011', 'Depo 011'),
(12, 'Lokasyon 012', 'Depo 012'),
(13, 'Lokasyon 013', 'Depo 013'),
(14, 'Lokasyon 014', 'Depo 014'),
(15, 'Lokasyon 015', 'Depo 015'),
(16, 'Lokasyon 016', 'Depo 016'),
(17, 'Lokasyon 017', 'Depo 017'),
(18, 'Lokasyon 018', 'Depo 018'),
(19, 'Lokasyon 019', 'Depo 019'),
(20, 'Lokasyon 020', 'Depo 020'),
(21, 'Lokasyon 021', 'Depo 021'),
(22, 'Lokasyon 022', 'Depo 022'),
(23, 'Lokasyon 023', 'Depo 023'),
(24, 'Lokasyon 024', 'Depo 024'),
(25, 'Lokasyon 025', 'Depo 025'),
(26, 'Lokasyon 026', 'Depo 026'),
(27, 'Lokasyon 027', 'Depo 027'),
(28, 'Lokasyon 028', 'Depo 028'),
(29, 'Lokasyon 029', 'Depo 029'),
(30, 'Lokasyon 030', 'Depo 030'),
(31, 'Lokasyon 031', 'Depo 031'),
(32, 'Lokasyon 032', 'Depo 032'),
(33, 'Lokasyon 033', 'Depo 033'),
(34, 'Lokasyon 034', 'Depo 034'),
(35, 'Lokasyon 035', 'Depo 035'),
(36, 'Lokasyon 036', 'Depo 036'),
(37, 'Lokasyon 037', 'Depo 037'),
(38, 'Lokasyon 038', 'Depo 038'),
(39, 'Lokasyon 039', 'Depo 039'),
(40, 'Lokasyon 040', 'Depo 040'),
(41, 'Lokasyon 041', 'Depo 041'),
(42, 'Lokasyon 042', 'Depo 042'),
(43, 'Lokasyon 043', 'Depo 043'),
(44, 'Lokasyon 044', 'Depo 044'),
(45, 'Lokasyon 045', 'Depo 045'),
(46, 'Lokasyon 046', 'Depo 046'),
(47, 'Lokasyon 047', 'Depo 047'),
(48, 'Lokasyon 048', 'Depo 048'),
(49, 'Lokasyon 049', 'Depo 049'),
(50, 'Lokasyon 050', 'Depo 050'),
(51, 'Lokasyon 051', 'Depo 051'),
(52, 'Lokasyon 052', 'Depo 052'),
(53, 'Lokasyon 053', 'Depo 053'),
(54, 'Lokasyon 054', 'Depo 054'),
(55, 'Lokasyon 055', 'Depo 055'),
(56, 'Lokasyon 056', 'Depo 056'),
(57, 'Lokasyon 057', 'Depo 057'),
(58, 'Lokasyon 058', 'Depo 058'),
(59, 'Lokasyon 059', 'Depo 059'),
(60, 'Lokasyon 060', 'Depo 060'),
(61, 'Lokasyon 061', 'Depo 061'),
(62, 'Lokasyon 062', 'Depo 062'),
(63, 'Lokasyon 063', 'Depo 063'),
(64, 'Lokasyon 064', 'Depo 064'),
(65, 'Lokasyon 065', 'Depo 065'),
(66, 'Lokasyon 066', 'Depo 066'),
(67, 'Lokasyon 067', 'Depo 067'),
(68, 'Lokasyon 068', 'Depo 068'),
(69, 'Lokasyon 069', 'Depo 069'),
(70, 'Lokasyon 070', 'Depo 070'),
(71, 'Lokasyon 071', 'Depo 071'),
(72, 'Lokasyon 072', 'Depo 072'),
(73, 'Lokasyon 073', 'Depo 073'),
(74, 'Lokasyon 074', 'Depo 074'),
(75, 'Lokasyon 075', 'Depo 075'),
(76, 'Lokasyon 076', 'Depo 076'),
(77, 'Lokasyon 077', 'Depo 077'),
(78, 'Lokasyon 078', 'Depo 078'),
(79, 'Lokasyon 079', 'Depo 079'),
(80, 'Lokasyon 080', 'Depo 080'),
(81, 'Lokasyon 081', 'Depo 081'),
(82, 'Lokasyon 082', 'Depo 082'),
(83, 'Lokasyon 083', 'Depo 083'),
(84, 'Lokasyon 084', 'Depo 084'),
(85, 'Lokasyon 085', 'Depo 085'),
(86, 'Lokasyon 086', 'Depo 086'),
(87, 'Lokasyon 087', 'Depo 087'),
(88, 'Lokasyon 088', 'Depo 088'),
(89, 'Lokasyon 089', 'Depo 089'),
(90, 'Lokasyon 090', 'Depo 090'),
(91, 'Lokasyon 091', 'Depo 091'),
(92, 'Lokasyon 092', 'Depo 092'),
(93, 'Lokasyon 093', 'Depo 093'),
(94, 'Lokasyon 094', 'Depo 094'),
(95, 'Lokasyon 095', 'Depo 095'),
(96, 'Lokasyon 096', 'Depo 096'),
(97, 'Lokasyon 097', 'Depo 097'),
(98, 'Lokasyon 098', 'Depo 098'),
(99, 'Lokasyon 099', 'Depo 099'),
(100, 'Lokasyon 100', 'Depo 100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKt8o6pivur7nn124jehx7cygw5` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKab24j7hhticnxlfe8vbsakyt1` (`product_code`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKt63cpr1a23ari7clpnbfglbtf` (`product_id`,`warehouse_id`),
  ADD KEY `FKjftt43i266337pt7y8b291hpx` (`warehouse_id`);

--
-- Indexes for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjcaag8ogfjxpwmqypi1wfdaog` (`product_id`),
  ADD KEY `FKfqq1iu0gt0la6ruk2o62bry5v` (`user_id`),
  ADD KEY `FKiparp4rp4rsfsxb9y02oyxauh` (`warehouse_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK2qm0l82n5ivhyqwmgejxxefm1` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `stock_movements`
--
ALTER TABLE `stock_movements`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `FKff7be959jyco0iukc1dcjj9qm` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKjftt43i266337pt7y8b291hpx` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `stock_movements`
--
ALTER TABLE `stock_movements`
  ADD CONSTRAINT `FKfqq1iu0gt0la6ruk2o62bry5v` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKiparp4rp4rsfsxb9y02oyxauh` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `FKjcaag8ogfjxpwmqypi1wfdaog` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
