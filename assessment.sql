-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2024 at 07:49 AM
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
-- Database: `assessment`
--

-- --------------------------------------------------------

--
-- Table structure for table `apks`
--

CREATE TABLE `apks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_apk` varchar(150) NOT NULL,
  `nama_kegiatan` varchar(150) DEFAULT NULL,
  `thn_anggaran` varchar(15) DEFAULT NULL,
  `kegiatan_dpa` enum('dpa','non_dpa') NOT NULL,
  `cttan_dpa` text DEFAULT NULL,
  `pj` varchar(150) NOT NULL,
  `opd_id` int(11) NOT NULL,
  `user_apk_id` int(11) NOT NULL,
  `jenis_kegiatan_id` int(11) NOT NULL,
  `developer_id` int(11) NOT NULL,
  `programer_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `apks`
--

INSERT INTO `apks` (`id`, `nama_apk`, `nama_kegiatan`, `thn_anggaran`, `kegiatan_dpa`, `cttan_dpa`, `pj`, `opd_id`, `user_apk_id`, `jenis_kegiatan_id`, `developer_id`, `programer_id`, `created_at`, `updated_at`) VALUES
(1, 'test 1', 'test kegiatan', '2020', 'dpa', NULL, 'test orang 1', 1, 1, 1, 1, 1, '2024-06-13 21:10:02', '2024-06-13 21:10:02'),
(2, 'test 1', 'test kegiatan', '2020', 'dpa', NULL, 'test orang 1', 1, 1, 1, 2, 2, '2024-06-13 21:10:05', '2024-06-13 21:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `apk_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`id`, `apk_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-06-13 21:10:02', '2024-06-13 21:13:09'),
(2, 2, 2, '2024-06-13 21:10:05', '2024-06-13 21:20:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `developers`
--

CREATE TABLE `developers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(150) NOT NULL,
  `nama_pj` varchar(150) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `developers`
--

INSERT INTO `developers` (`id`, `nama_perusahaan`, `nama_pj`, `alamat`, `telp`, `email`, `created_at`, `updated_at`) VALUES
(1, 'test company 1', 'test leader company 1', 'Bogor', '087766543265', 'testemail@gmail.com', '2024-06-13 21:10:01', '2024-06-13 21:10:01'),
(2, 'test company 1', 'test leader company 1', 'Bogor', '087766543265', 'testemail@gmail.com', '2024-06-13 21:10:05', '2024-06-13 21:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `dokumens`
--

CREATE TABLE `dokumens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_dok` varchar(150) NOT NULL,
  `dok` varchar(250) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dokumens`
--

INSERT INTO `dokumens` (`id`, `nama_dok`, `dok`, `assessment_id`, `created_at`, `updated_at`) VALUES
(1, 'permohonan', '65gIJIwUYoAsLgGJoNe6DsvtbcvOVKjxh3G6IUTI.pdf', 1, NULL, NULL),
(2, 'undangan', 'A5UlQdSj7jBycNkVWc341XvaD6zcqDo09S4Kaiuw.pdf', 1, NULL, NULL),
(3, 'hosting', 'k2EhxvRvss6THUZHB4mwtjzRgJ4sgEF4vjuHpiTM.pdf', 1, NULL, NULL),
(4, 'api', '4fBbqvY1rUyzkmmPnlRldo7ck8COvLukQW68Ddha.pdf', 1, NULL, NULL),
(5, 'code', '1LIPkJ4ns9rzzHwhrTNObNqDhIcpnkWs2IFVkqvF.pdf', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hosting_sub_domains`
--

CREATE TABLE `hosting_sub_domains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `collocation_server` enum('ya','tidak') NOT NULL,
  `hosting` enum('ya','tidak') NOT NULL,
  `sub_domain` enum('ya','tidak') NOT NULL,
  `nama_subdomain` varchar(50) NOT NULL,
  `cttan_collock_server` text DEFAULT NULL,
  `cttan_hosting` text DEFAULT NULL,
  `cttan_sub_domain` text DEFAULT NULL,
  `assessment_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_kegiatans`
--

CREATE TABLE `jenis_kegiatans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_kegiatan` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jenis_kegiatans`
--

INSERT INTO `jenis_kegiatans` (`id`, `jenis_kegiatan`, `created_at`, `updated_at`) VALUES
(1, 'Pembangunan', NULL, NULL),
(2, 'Pengembangan', NULL, NULL),
(3, 'Pemeliharaan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_01_093404_create_tags_table', 1),
(6, '2022_06_01_093500_create_categories_table', 1),
(7, '2022_06_01_093551_create_posts_table', 1),
(8, '2022_06_01_093640_post_tag', 1),
(9, '2022_06_01_093712_create_comments_table', 1),
(10, '2022_06_01_093750_create_menus_table', 1),
(11, '2022_06_01_093822_create_sliders_table', 1),
(12, '2024_04_23_030236_create_opds_table', 1),
(13, '2024_04_24_031506_create_developers_table', 1),
(14, '2024_04_24_033254_create_programers_table', 1),
(15, '2024_04_24_063803_create_user_apks_table', 1),
(16, '2024_04_24_071309_create_jenis_kegiatans_table', 1),
(17, '2024_04_24_075307_create_statuses_table', 1),
(18, '2024_04_25_012343_create_apks_table', 1),
(19, '2024_04_25_060616_create_assessments_table', 1),
(20, '2024_04_29_020212_create_hosting_sub_domains_table', 1),
(21, '2024_04_29_035254_create_dokumens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `opds`
--

CREATE TABLE `opds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opd` varchar(150) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `opds`
--

INSERT INTO `opds` (`id`, `opd`, `alamat`, `telp`, `email`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Diskominfo', 'Bogor', '087766554233', 'diskominfo@gmail.com', 3, '2024-06-13 20:49:51', '2024-06-13 20:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penilaian_ui_uxes`
--

CREATE TABLE `penilaian_ui_uxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `penilaian_warna` enum('sesuai','tidak') NOT NULL,
  `penilaian_logo_kotabgr` enum('sesuai','tidak') NOT NULL,
  `penilaian_logo_apk` enum('sesuai','tidak') NOT NULL,
  `penilaian_copyright_pemkot` enum('sesuai','tidak') NOT NULL,
  `penilaian_info_identitasopd` enum('sesuai','tidak') NOT NULL,
  `penilaian_info_apk` enum('sesuai','tidak') NOT NULL,
  `penilaian_faq` enum('sesuai','tidak') NOT NULL,
  `penilaian_user_friendly` enum('sesuai','tidak') NOT NULL,
  `penilaian_fungsionalitas` enum('sesuai','tidak') NOT NULL,
  `penilaian_dashboard` enum('sesuai','tidak') NOT NULL,
  `penilaian_log_user` enum('sesuai','tidak') NOT NULL,
  `cttan_penilaian_warna` text DEFAULT NULL,
  `cttan_penilaian_logo_kota` text DEFAULT NULL,
  `cttan_penilaian_logo_apk` text DEFAULT NULL,
  `cttan_penilaian_cr_pemkot` text DEFAULT NULL,
  `cttan_penilaian_identitas_odp` text DEFAULT NULL,
  `cttan_penilaian_info_apk` text DEFAULT NULL,
  `cttan_penilaian_faq` text DEFAULT NULL,
  `cttan_penilaian_uiux_frendly` text DEFAULT NULL,
  `cttan_penilaian_fungsionalitas` text DEFAULT NULL,
  `cttan_penilaian_dashboard` text DEFAULT NULL,
  `cttan_penilaian_log_usr` text DEFAULT NULL,
  `assessment_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penilaian_ui_uxes`
--

INSERT INTO `penilaian_ui_uxes` (`id`, `penilaian_warna`, `penilaian_logo_kotabgr`, `penilaian_logo_apk`, `penilaian_copyright_pemkot`, `penilaian_info_identitasopd`, `penilaian_info_apk`, `penilaian_faq`, `penilaian_user_friendly`, `penilaian_fungsionalitas`, `penilaian_dashboard`, `penilaian_log_user`, `cttan_penilaian_warna`, `cttan_penilaian_logo_kota`, `cttan_penilaian_logo_apk`, `cttan_penilaian_cr_pemkot`, `cttan_penilaian_identitas_odp`, `cttan_penilaian_info_apk`, `cttan_penilaian_faq`, `cttan_penilaian_uiux_frendly`, `cttan_penilaian_fungsionalitas`, `cttan_penilaian_dashboard`, `cttan_penilaian_log_usr`, `assessment_id`, `created_at`, `updated_at`) VALUES
(1, 'sesuai', 'sesuai', 'sesuai', 'sesuai', 'sesuai', 'sesuai', 'sesuai', 'sesuai', 'sesuai', 'sesuai', 'sesuai', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, '2024-06-13 21:25:50', '2024-06-13 21:25:50');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'my-token', 'fa4354dfc85d4d06b40afb00d9c1359eca9266a238ffa3366418f36bd6af2195', '[\"*\"]', '2024-06-13 20:49:54', NULL, '2024-06-13 20:47:16', '2024-06-13 20:49:54'),
(2, 'App\\Models\\User', 3, 'my-token', 'f47c9518832fa7ddc75a45fe397ae7b9a148c8811132f251fd1c251ac2f634bb', '[\"*\"]', NULL, NULL, '2024-06-13 20:50:20', '2024-06-13 20:50:20'),
(3, 'App\\Models\\User', 3, 'my-token', '32fa5b3257dac37859dda83976da8373367ec3cf52d2e8b22e7ae9580a2a1c28', '[\"*\"]', '2024-06-13 21:11:33', NULL, '2024-06-13 21:08:16', '2024-06-13 21:11:33'),
(4, 'App\\Models\\User', 2, 'my-token', 'a52194d60822455e80e289e3ba8c40093736f1b0f28edac1087f795046dc167f', '[\"*\"]', '2024-06-13 21:33:22', NULL, '2024-06-13 21:11:56', '2024-06-13 21:33:22'),
(5, 'App\\Models\\User', 1, 'my-token', '3269d6fa98261ac0acc82d9e75d8498729602c3549f4c9219727f198aa60dbc7', '[\"*\"]', NULL, NULL, '2024-06-13 21:36:07', '2024-06-13 21:36:07'),
(6, 'App\\Models\\User', 1, 'my-token', '3d891d4dfa317ca909b91fc4c882d8088469091981aeb5be4dc39d1601b66a1e', '[\"*\"]', NULL, NULL, '2024-06-13 21:37:20', '2024-06-13 21:37:20'),
(7, 'App\\Models\\User', 1, 'my-token', '16c757ac5751c5d89c3259a2d51bf46a49b0a02bac9ae9087af766974e246dc7', '[\"*\"]', NULL, NULL, '2024-06-13 21:37:53', '2024-06-13 21:37:53'),
(8, 'App\\Models\\User', 2, 'my-token', 'a24e38d26e341addc5ae7ff76e2070f13a5433d449e037da208226f90ce80ed2', '[\"*\"]', '2024-06-13 22:48:35', NULL, '2024-06-13 22:47:35', '2024-06-13 22:48:35');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programers`
--

CREATE TABLE `programers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(150) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programers`
--

INSERT INTO `programers` (`id`, `nama`, `alamat`, `telp`, `email`, `created_at`, `updated_at`) VALUES
(1, 'test programer 1', 'Bogor', '08663342135353', 'testprogramer@gmail.com', '2024-06-13 21:10:02', '2024-06-13 21:10:02'),
(2, 'test programer 1', 'Bogor', '08663342135353', 'testprogramer@gmail.com', '2024-06-13 21:10:05', '2024-06-13 21:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Pengajuan Assessment', NULL, NULL),
(2, 'Assessment Selesai', NULL, NULL),
(3, 'Assessment Ditolak', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','opd','assessment') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$H5SBPDf4Ijk1U2DaaCKs0.jW0k0ZAFmYcTwc8sjJkLAhBPGuu9ZiG', 'admin', NULL, NULL, NULL),
(2, 'Assessor', 'assessor@gmail.com', NULL, '$2y$10$0DXSkiJf4lYg7YbiC8EEUuxqusXXyQxdWOug7qFHuj0bdQ09PKb7u', 'assessment', NULL, '2024-06-13 20:47:53', '2024-06-13 20:47:53'),
(3, 'Diskominfo', 'diskominfo@gmail.com', NULL, '$2y$10$2VusIJOpmXXf6Sg/f8gT9u5g72aJFLYtKCrtgr3tlhziVPkV63qvG', 'opd', NULL, '2024-06-13 20:48:55', '2024-06-13 20:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_apks`
--

CREATE TABLE `user_apks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pengguna_apk` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_apks`
--

INSERT INTO `user_apks` (`id`, `pengguna_apk`, `created_at`, `updated_at`) VALUES
(1, 'Aplikasi Internal Perangkat Daerah', NULL, NULL),
(2, 'Perangkat Daerah Pemilik Aplikasi dan Beberapa Perangkat Daerah Lain', NULL, NULL),
(3, 'Semua Perangkat Daerah Pemerintah Kota Bogor', NULL, NULL),
(4, 'Perangkat Daerah Pemilik Aplikasi dan Masyarakat', NULL, NULL),
(5, 'Perangkat Daerah Pemilik Aplikasi, Beberapa Perangkat Daerah Lain dan Masyarakat', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apks`
--
ALTER TABLE `apks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `developers`
--
ALTER TABLE `developers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dokumens`
--
ALTER TABLE `dokumens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hosting_sub_domains`
--
ALTER TABLE `hosting_sub_domains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_kegiatans`
--
ALTER TABLE `jenis_kegiatans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opds`
--
ALTER TABLE `opds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `penilaian_ui_uxes`
--
ALTER TABLE `penilaian_ui_uxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `programers`
--
ALTER TABLE `programers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_apks`
--
ALTER TABLE `user_apks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apks`
--
ALTER TABLE `apks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `developers`
--
ALTER TABLE `developers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dokumens`
--
ALTER TABLE `dokumens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hosting_sub_domains`
--
ALTER TABLE `hosting_sub_domains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jenis_kegiatans`
--
ALTER TABLE `jenis_kegiatans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `opds`
--
ALTER TABLE `opds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penilaian_ui_uxes`
--
ALTER TABLE `penilaian_ui_uxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programers`
--
ALTER TABLE `programers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_apks`
--
ALTER TABLE `user_apks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
