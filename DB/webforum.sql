-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Jul 2021 pada 09.29
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webforum`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `content`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'aaaaaaaaaaaaaaaa', 1, 'App\\Models\\Forum', '2021-07-20 08:40:41', '2021-07-20 08:40:41'),
(2, 1, 'hahaaa', 3, 'App\\Models\\Forum', '2021-07-20 08:47:17', '2021-07-20 08:47:17'),
(3, 1, 'reply 1', 1, 'App\\Models\\Comment', '2021-07-20 10:08:37', '2021-07-20 10:08:37'),
(4, 1, 'reply 2', 1, 'App\\Models\\Comment', '2021-07-20 10:11:30', '2021-07-20 10:11:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `counterables`
--

CREATE TABLE `counterables` (
  `id` int(10) UNSIGNED NOT NULL,
  `counterable_id` int(10) UNSIGNED NOT NULL,
  `counterable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_id` int(10) UNSIGNED NOT NULL,
  `value` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `counters`
--

CREATE TABLE `counters` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initial_value` double NOT NULL DEFAULT 0,
  `value` double NOT NULL DEFAULT 0,
  `step` double NOT NULL DEFAULT 1,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `forums`
--

CREATE TABLE `forums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `forums`
--

INSERT INTO `forums` (`id`, `user_id`, `title`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'require is not defined EDIT', 'require-is-not-defined-edit', '<p>require is not defined require is not defined require is not defined require is not defined</p>', '1626277573.jpg', '2021-07-14 08:09:42', '2021-07-17 03:54:17'),
(2, 1, 'promise promise', 'promise-promise', 'promise promise promise promise promise', NULL, '2021-07-14 08:19:39', '2021-07-14 08:19:39'),
(3, 1, 'routes routes', 'routes-routes', 'routesroutesroutes routesroutesroutesroutes', '1626278903.jpg', '2021-07-14 09:08:23', '2021-07-14 09:08:23'),
(6, 1, 'promise 123', 'promise-123', 'sasad dadada dadda', '1626405408.jpg', '2021-07-15 20:16:48', '2021-07-15 20:16:48'),
(7, 1, 'object', 'object', '<p>object&nbsp;object&nbsp;object</p>', '1626525582.jpg', '2021-07-17 05:38:19', '2021-07-17 05:39:42'),
(9, 2, 'Gambar untuk mengupload', 'gambar-untuk-mengupload', '<p><strong>Gambar</strong>&nbsp;untuk mengupload&nbsp;<strong>Gambar</strong>&nbsp;untuk mengupload&nbsp;<strong>Gambar</strong>&nbsp;untuk mengupload&nbsp;<strong>Gambar</strong>&nbsp;untuk mengupload&nbsp;</p>', NULL, '2021-07-21 23:26:09', '2021-07-21 23:26:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `forum_tag`
--

CREATE TABLE `forum_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `forum_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `forum_tag`
--

INSERT INTO `forum_tag` (`id`, `forum_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 5, 2, NULL, NULL),
(2, 6, 1, NULL, NULL),
(3, 6, 2, NULL, NULL),
(4, 5, 1, NULL, NULL),
(5, 1, 2, NULL, NULL),
(6, 7, 2, NULL, NULL),
(8, 9, 3, NULL, NULL),
(9, 9, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_07_14_101155_create_forums_table', 2),
(5, '2021_07_14_154907_create_tags_table', 3),
(6, '2021_07_14_155127_create_forum_tag_table', 3),
(7, '2021_07_20_151015_create_comments_table', 4),
(8, '2021_07_21_045555_create_views_table', 5),
(9, '0000_00_00_000000_create_counters_tables', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'JavaScript', 'javascript', NULL, '2021-07-21 08:48:58'),
(3, 'Css', 'css', '2021-07-21 08:17:37', '2021-07-21 08:17:37'),
(4, 'Laravel', 'laravel', '2021-07-21 08:34:03', '2021-07-21 08:34:03'),
(5, 'Php', 'php', '2021-07-21 08:58:05', '2021-07-21 08:58:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'lovre', 'lovre@gmail.com', NULL, '$2y$10$NY2NdR5rnYTxSkOYxs4zG.A7TEAYi2CMW9ZUrrryPMq3PSyumVny2', NULL, '2021-07-14 01:57:32', '2021-07-14 01:57:32'),
(2, 'skawan', 'skawan@gmail.com', NULL, '$2y$10$PzOuHU/D/ulvxDUxPOlAP.4gcaAVj5dlD4WbMqF1E7/JPIZNuZ9XW', NULL, '2021-07-21 06:24:56', '2021-07-21 06:24:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `views`
--

CREATE TABLE `views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `viewable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewable_id` bigint(20) UNSIGNED NOT NULL,
  `visitor` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `views`
--

INSERT INTO `views` (`id`, `viewable_type`, `viewable_id`, `visitor`, `collection`, `viewed_at`) VALUES
(1, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:06:18'),
(2, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:07:10'),
(3, 'App\\Models\\Forum', 2, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:07:31'),
(4, 'App\\Models\\Forum', 2, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:08:18'),
(5, 'App\\Models\\Forum', 3, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:08:28'),
(6, 'App\\Models\\Forum', 3, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:21:27'),
(7, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:27:49'),
(8, 'App\\Models\\Forum', 2, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:27:59'),
(9, 'App\\Models\\Forum', 6, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:28:07'),
(10, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:28:15'),
(11, 'App\\Models\\Forum', 3, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:30:07'),
(12, 'App\\Models\\Forum', 3, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:30:23'),
(13, 'App\\Models\\Forum', 7, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:30:34'),
(14, 'App\\Models\\Forum', 7, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:32:55'),
(15, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:41:24'),
(16, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 01:55:15'),
(17, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 02:00:16'),
(18, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 02:00:44'),
(19, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 02:02:12'),
(20, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 02:03:26'),
(21, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 02:04:27'),
(22, 'App\\Models\\Forum', 7, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 02:04:32'),
(23, 'App\\Models\\Forum', 3, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 02:04:35'),
(24, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 02:07:43'),
(25, 'App\\Models\\Forum', 3, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 02:41:58'),
(26, 'App\\Models\\Forum', 6, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 07:05:13'),
(28, 'App\\Models\\Forum', 7, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 07:48:58'),
(29, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 22:54:09'),
(30, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 22:54:47'),
(31, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 22:55:18'),
(32, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 22:58:13'),
(33, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 22:58:35'),
(34, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 22:58:45'),
(35, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 22:58:47'),
(36, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:00:58'),
(37, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:01:08'),
(38, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:02:27'),
(39, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:02:30'),
(40, 'App\\Models\\Forum', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:25:33'),
(41, 'App\\Models\\Forum', 9, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:26:20'),
(42, 'App\\Models\\Forum', 9, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:26:24'),
(43, 'App\\Models\\Forum', 9, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:26:27'),
(44, 'App\\Models\\Forum', 6, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:28:24'),
(45, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:29:11'),
(46, 'App\\Models\\Tag', 1, 'QQimhvg6bkAKctp3SEDSJ4bIQqRf7VAk4Uryz8ihftDe9nAFQ3NWyW5w7YhfE1gHmc3ZpTnaqIscxUCS', NULL, '2021-07-21 23:29:15');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `counterables`
--
ALTER TABLE `counterables`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `counters_key_unique` (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `forum_tag`
--
ALTER TABLE `forum_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views_viewable_type_viewable_id_index` (`viewable_type`,`viewable_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `counterables`
--
ALTER TABLE `counterables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `forums`
--
ALTER TABLE `forums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `forum_tag`
--
ALTER TABLE `forum_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
