-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2023 pada 10.31
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deskapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'System Admin'),
(2, 'user', 'Reguler');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_groups_permissions`
--

INSERT INTO `auth_groups_permissions` (`group_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_groups_users`
--

INSERT INTO `auth_groups_users` (`group_id`, `user_id`) VALUES
(1, 4),
(2, 10),
(2, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'q', NULL, '2022-12-22 09:02:40', 0),
(2, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-22 23:42:31', 0),
(3, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 12:56:02', 0),
(4, '::1', 'agungsilaban25@gmail.com', 1, '2022-12-23 13:08:02', 1),
(5, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:32:34', 0),
(6, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:32:40', 0),
(7, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:33:25', 0),
(8, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:33:31', 0),
(9, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:33:36', 0),
(10, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:34:22', 0),
(11, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:34:31', 0),
(12, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:34:36', 0),
(13, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:34:54', 0),
(14, '::1', 'santa25', NULL, '2022-12-23 13:35:41', 0),
(15, '::1', 'santa25', NULL, '2022-12-23 13:35:50', 0),
(16, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-23 13:36:16', 0),
(17, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-23 13:36:21', 0),
(18, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:37:08', 0),
(19, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:37:44', 0),
(20, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:37:50', 0),
(21, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-23 13:38:42', 1),
(22, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:38:59', 0),
(23, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 13:41:07', 0),
(24, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-23 13:57:59', 1),
(25, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-23 14:04:26', 1),
(26, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 22:22:04', 0),
(27, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 22:26:58', 0),
(28, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 22:44:16', 0),
(29, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 22:44:20', 0),
(30, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-23 22:44:25', 1),
(31, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 22:44:45', 0),
(32, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-23 22:51:45', 1),
(33, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 23:02:14', 0),
(34, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 23:02:19', 0),
(35, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-23 23:03:43', 1),
(36, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 23:08:23', 0),
(37, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 23:08:41', 0),
(38, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-23 23:16:04', 0),
(39, '::1', 'aldops', NULL, '2022-12-24 00:21:36', 0),
(40, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-24 00:21:43', 0),
(41, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-24 00:21:59', 0),
(42, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-24 00:22:41', 0),
(43, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-24 00:22:51', 0),
(44, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-24 00:23:36', 0),
(45, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-24 00:23:40', 0),
(46, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-24 00:23:45', 1),
(47, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-24 00:24:41', 0),
(48, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-24 00:25:24', 0),
(49, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-24 00:29:01', 0),
(50, '::1', 'tumbal.game25@gmail.com', 8, '2022-12-24 00:35:01', 1),
(51, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-24 00:38:36', 1),
(52, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-24 00:39:07', 1),
(53, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-24 00:39:53', 1),
(54, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-24 00:43:47', 1),
(55, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-24 00:44:16', 0),
(56, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-24 00:44:57', 1),
(57, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-24 00:47:04', 0),
(58, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-24 00:51:29', 1),
(59, '::1', 'andiexcited@yahoo.com', 9, '2022-12-24 00:53:00', 1),
(60, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 09:21:07', 1),
(61, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 09:55:45', 1),
(62, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 10:20:32', 1),
(63, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 10:31:36', 1),
(64, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 10:33:44', 1),
(65, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 10:41:37', 1),
(66, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 10:44:47', 1),
(67, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:17:49', 1),
(68, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-25 11:18:13', 0),
(69, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:18:17', 1),
(70, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-25 11:22:49', 0),
(71, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:22:54', 1),
(72, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-25 11:23:55', 0),
(73, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:24:02', 1),
(74, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:39:56', 1),
(75, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:40:29', 1),
(76, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-25 11:42:21', 0),
(77, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-25 11:42:28', 0),
(78, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-25 11:42:34', 0),
(79, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-25 11:42:43', 0),
(80, '::1', 'tumbal.game25@gmail.com', 10, '2022-12-25 11:44:19', 1),
(81, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:48:07', 1),
(82, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-25 11:49:01', 0),
(83, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:49:06', 1),
(84, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:49:16', 1),
(85, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 11:49:27', 1),
(86, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-25 11:49:49', 0),
(87, '::1', 'tumbal.game25@gmail.com', 10, '2022-12-25 11:49:54', 1),
(88, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 12:02:50', 1),
(89, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 12:13:21', 1),
(90, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 21:54:22', 1),
(91, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 21:55:33', 1),
(92, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 21:58:15', 1),
(93, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 22:00:23', 1),
(94, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-25 22:00:33', 0),
(95, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 22:00:40', 1),
(96, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 22:05:06', 1),
(97, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 22:08:11', 1),
(98, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 22:08:45', 1),
(99, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 22:09:12', 1),
(100, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 22:15:46', 1),
(101, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 22:18:18', 1),
(102, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-25 23:45:08', 1),
(103, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 00:36:54', 1),
(104, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 00:41:22', 1),
(105, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 00:57:09', 1),
(106, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 00:57:28', 1),
(107, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 00:58:09', 1),
(108, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 01:22:26', 1),
(109, '::1', 'tumbal.game25@gmail.com', NULL, '2022-12-26 01:26:45', 0),
(110, '::1', 'dani', NULL, '2022-12-26 01:27:10', 0),
(111, '::1', 'dasdasd@gmail.com', 11, '2022-12-26 01:27:15', 1),
(112, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 01:27:38', 1),
(113, '::1', 'dasdasd@gmail.com', 11, '2022-12-26 01:28:31', 1),
(114, '::1', 'dani', NULL, '2022-12-26 03:38:44', 0),
(115, '::1', 'dasdasd@gmail.com', 11, '2022-12-26 03:38:50', 1),
(116, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 03:47:13', 1),
(117, '::1', 'dasdasd@gmail.com', 11, '2022-12-26 03:48:55', 1),
(118, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 04:02:31', 1),
(119, '::1', 'dasdasd@gmail.com', 11, '2022-12-26 04:06:10', 1),
(120, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 04:35:30', 1),
(121, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-26 11:36:29', 1),
(122, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 00:05:30', 1),
(123, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 01:17:11', 1),
(124, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 01:17:27', 1),
(125, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 01:19:31', 1),
(126, '::1', 'dasdasd@gmail.com', 11, '2022-12-27 01:20:21', 1),
(127, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 01:29:15', 1),
(128, '::1', 'dasdasd@gmail.com', 11, '2022-12-27 01:30:13', 1),
(129, '::1', 'agungsilaban25@gmail.com', NULL, '2022-12-27 01:30:22', 0),
(130, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 01:30:26', 1),
(131, '::1', 'dasdasd@gmail.com', 11, '2022-12-27 01:34:22', 1),
(132, '::1', 'dasdasd@gmail.com', 11, '2022-12-27 01:35:10', 1),
(133, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 01:35:38', 1),
(134, '::1', 'dasdasd@gmail.com', 11, '2022-12-27 01:35:55', 1),
(135, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 01:37:21', 1),
(136, '::1', 'dasdasd@gmail.com', 11, '2022-12-27 01:37:39', 1),
(137, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 07:16:39', 1),
(138, '::1', 'dasdasd@gmail.com', 11, '2022-12-27 07:26:57', 1),
(139, '::1', 'dasdasd@gmail.com', 11, '2022-12-27 07:28:28', 1),
(140, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 07:31:47', 1),
(141, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-27 23:54:41', 1),
(142, '::1', 'dasdasd@gmail.com', 11, '2022-12-28 00:26:36', 1),
(143, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-28 00:27:09', 1),
(144, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-29 10:17:58', 1),
(145, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-29 22:21:07', 1),
(146, '::1', 'dasdasd@gmail.com', 11, '2022-12-30 00:54:29', 1),
(147, '::1', 'agungsilaban25@gmail.com', 4, '2022-12-30 00:54:41', 1),
(148, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-01 21:18:13', 1),
(149, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-01 21:53:14', 1),
(150, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-01 21:53:25', 1),
(151, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-01 22:16:08', 1),
(152, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-02 06:19:39', 1),
(153, '::1', 'agungsilaban25@gmail.com', NULL, '2023-01-04 05:23:03', 0),
(154, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-04 05:23:09', 1),
(155, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-04 20:58:05', 1),
(156, '::1', 'parataon', NULL, '2023-01-04 21:19:19', 0),
(157, '::1', 'ina', NULL, '2023-01-04 21:19:32', 0),
(158, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-05 06:49:01', 1),
(159, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-05 06:57:57', 1),
(160, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-06 04:16:43', 1),
(161, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-07 00:37:02', 1),
(162, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-07 08:14:13', 1),
(163, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-08 09:03:52', 1),
(164, '::1', 'agungsilaban25@gmail.com', NULL, '2023-01-08 22:53:19', 0),
(165, '::1', 'agungsilaban25@gmail.com', NULL, '2023-01-08 22:54:13', 0),
(166, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-08 22:54:19', 1),
(167, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-09 04:21:44', 1),
(168, '::1', 'dasdasd@gmail.com', 11, '2023-01-09 05:30:35', 1),
(169, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-09 09:29:18', 1),
(170, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-09 09:29:37', 1),
(171, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-09 20:16:23', 1),
(172, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-10 05:10:54', 1),
(173, '::1', 'caca', NULL, '2023-01-10 05:23:53', 0),
(174, '::1', 'caca', NULL, '2023-01-10 05:24:01', 0),
(175, '::1', 'agungsilaban25@gmail.com', NULL, '2023-01-10 05:24:07', 0),
(176, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-10 05:24:12', 1),
(177, '::1', 'agungsilaban25@gmail.com', NULL, '2023-01-10 10:57:18', 0),
(178, '::1', 'agungsilaban25@gmail.com', NULL, '2023-01-10 10:57:23', 0),
(179, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-10 10:57:29', 1),
(180, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-10 22:19:52', 1),
(181, '::1', 'agungsilaban25@gmail.com', 4, '2023-01-11 09:32:12', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
(1, 'manage-user', ''),
(2, 'manage-profile', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jemaat`
--

CREATE TABLE `jemaat` (
  `id` int(11) NOT NULL,
  `nama_jemaat` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `nohp` bigint(20) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tgl_lahir` varchar(64) NOT NULL,
  `umur` varchar(5) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `kategori` varchar(64) NOT NULL,
  `pekerjaan` varchar(128) NOT NULL,
  `sektor` varchar(64) NOT NULL,
  `img` varchar(128) NOT NULL,
  `kepala_keluarga` varchar(128) NOT NULL,
  `nohp_kp` varchar(15) NOT NULL,
  `created` varchar(20) NOT NULL,
  `modified` varchar(20) NOT NULL,
  `status` varchar(2) NOT NULL,
  `otp` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jemaat`
--

INSERT INTO `jemaat` (`id`, `nama_jemaat`, `email`, `nohp`, `jenis_kelamin`, `tgl_lahir`, `umur`, `alamat`, `kategori`, `pekerjaan`, `sektor`, `img`, `kepala_keluarga`, `nohp_kp`, `created`, `modified`, `status`, `otp`) VALUES
(1, 'Agung Ferdinan', 'agungsilaban25@gmail.com', 89508837177, 'L', '0000-00-00', '0', 'Jalan parkit 8 Perumahan sidomulyo', '', 'Mahasiswa', '', '', '', '', '2023-01-06 04:23:22', '2023-01-06 04:23:22', '', ''),
(8, 'tania', 'cace@gmail.com', 89508837177, 'L', '0000-00-00', '0', 'Jalan parkit 8 Perumahan sidomulyo', '', 'Mahasiswa', 'Yudea', '1673102036_ffb2af08820464606591.jpg', '', '', '2023-01-07 08:33:56', '2023-01-07 08:33:56', '', ''),
(13, 'candra', 'caki@gmail.com', 89508837177, 'P', '0000-00-00', '0', 'Purwodadi 25 Pekanbaru', '', 'Mahasiswa', 'Nazaret', '1673317530_97e9d1ed82e609d95b62.jpg', '', '', '2023-01-09 20:25:30', '2023-01-09 20:25:30', '', ''),
(14, 'Andika', 'cacx@gmail.com', 89508837177, 'Laki-laki', '11 May 2000', '22', '      Purwodadi 25 Pekanbaru                                                      \r\n                                            ', 'Ama', 'Mahasiswa', 'Yudea', '1673451979_0d582c9afda9bf5d8072.jpg', 'Aldo Fernando', '08942134232', '2023-01-09 20:35:31', '2023-01-11 10:15:27', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(5) NOT NULL,
  `nama_kategori` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(1, 'Sekolah Minggu'),
(2, 'Naposo'),
(3, 'Ina'),
(4, 'Ama'),
(5, 'Lansia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1671706311, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `mobile` bigint(20) DEFAULT NULL,
  `divisi` varchar(64) NOT NULL,
  `user_img` varchar(255) NOT NULL DEFAULT 'default.png',
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `fullname`, `mobile`, `divisi`, `user_img`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'agungsilaban25@gmail.com', 'agunglbn', NULL, 0, '', 'default.png', '$2y$10$TJhXaHfDEehZqlTFYE7Ro.xtxA11LJ0eZ8plGF/WAlWJInPyxGWMK', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-12-23 13:38:37', '2022-12-23 13:38:37', NULL),
(10, 'tumbal.game25@gmail.com', 'santa25', NULL, 0, '', 'default.png', '$2y$10$y6NhKpJQIhanC953beegze5O4NKj0Oa170rSPjjOXsAqMCbYkeUpy', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-12-25 11:44:13', '2022-12-25 11:44:13', NULL),
(11, 'dasdasd@gmail.com', 'dani', NULL, 0, '', 'default.png', '$2y$10$y.Ocx/OheYEuPPbauR3OGumYg0oPVl17OcpZg9hMwg1taHvZ4x86W', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2022-12-26 00:51:40', '2022-12-26 00:51:40', NULL),
(19, 'parataon@gmail.com', 'Parataon', 'parataon', 2147483647, '', 'default.png', '$2y$10$XJUYaw9/k8M.eQ3ZLtD3p.fBXil.ZikyYVivARTYaHbdYgnZ9d97O', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '2023-01-04 21:16:05', '2023-01-04 21:16:05', NULL),
(21, 'caca@gmail.com', 'parhataon', 'caca', NULL, '', 'default.png', '$2y$10$qkU9ZS3tUXtl9qktks3i9uX93CmaWfc6rqLcuVPy9EHTNh8eDsvj.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-01-05 06:57:39', '2023-01-05 06:57:39', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `userss`
--

CREATE TABLE `userss` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `userss`
--

INSERT INTO `userss` (`id`, `username`, `firstname`, `lastname`, `email`, `phone`, `avatar`, `password`, `created_at`, `updated_at`) VALUES
(1, 'vendetta', 'Mushe', 'Abdul-Hakim', 'musheabdulhakim99@gmail.com', '0542441933', '/opt/lampp/temp/phpBI156N', '$2y$10$w/Mlff4D8r8na63sum221eTIsQmwLMUdDivFnZ5lbSQwHEkibhZJ.', '2021-02-13 22:00:56', '2021-02-13 22:00:56'),
(2, 'bfoster', 'Walk-In', 'Customer', 'info@bfoster.com', '0342020369', '1613288323_dbc66a90b1c291bffaa4.jpg', '$2y$10$zy8n93A1cr5p3I8P8AxgGuqtlQzTEsjnP8sIT6RUzZWmcXwP/t1qy', '2021-02-14 07:38:43', '2021-02-14 07:38:43'),
(3, 'agunglbn', 'Agung', 'Ferdinan', 'agungsilaban25@gmail.com', '089508837177', '1671698934_672c3f7152cc7337beb3.jpeg', '$2y$10$nNggfN4cVH3XvOrP.jjM4.R5/zhy1lwFYuQSwc.Sbs7D3vd.T2m22', '2022-12-22 15:48:54', '2022-12-22 15:48:54');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indeks untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indeks untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indeks untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indeks untuk tabel `jemaat`
--
ALTER TABLE `jemaat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `userss`
--
ALTER TABLE `userss`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `jemaat`
--
ALTER TABLE `jemaat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `userss`
--
ALTER TABLE `userss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
