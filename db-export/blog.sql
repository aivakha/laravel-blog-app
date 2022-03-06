-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 06 2022 г., 13:18
-- Версия сервера: 10.4.19-MariaDB
-- Версия PHP: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `title`, `slug`) VALUES
(1, '2021-10-28 14:23:16', '2021-10-28 14:23:16', 'est', 'est'),
(2, '2021-10-28 14:23:16', '2021-10-28 14:23:16', 'nobis', 'nobis'),
(3, '2021-10-28 14:23:16', '2021-10-28 14:23:16', 'iste', 'iste'),
(4, '2021-10-28 14:23:16', '2021-10-28 14:23:16', 'sequi', 'sequi'),
(5, '2021-10-28 14:23:16', '2021-10-28 14:23:16', 'pariatur', 'pariatur');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `created_at`, `updated_at`, `text`, `user_id`, `post_id`, `status`) VALUES
(1, '2021-11-03 16:56:57', '2021-11-19 06:44:30', 'eqweqweq', 1, 13, 0),
(3, '2021-11-05 09:37:18', '2021-11-19 06:44:28', 'sdfsdf', 1, 13, 0),
(4, '2021-11-19 06:44:06', '2021-11-19 06:44:22', 'New comment', 14, 13, 1),
(5, '2021-11-19 07:43:33', '2021-11-19 07:43:33', 'Тест', 14, 16, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(42, '2014_10_12_000000_create_users_table', 1),
(43, '2014_10_12_100000_create_password_resets_table', 1),
(44, '2019_08_19_000000_create_failed_jobs_table', 1),
(45, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(46, '2021_10_18_170913_create_categories_table', 1),
(47, '2021_10_18_171450_create_tags_table', 1),
(48, '2021_10_18_171642_create_comments_table', 1),
(49, '2021_10_18_171755_create_posts_table', 1),
(50, '2021_10_18_171815_create_subscriptions_table', 1),
(51, '2021_10_18_173302_create_posts_tags_table', 1),
(52, '2021_11_28_152040_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `is_featured` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `title`, `slug`, `content`, `description`, `date`, `image`, `category_id`, `user_id`, `status`, `views`, `is_featured`) VALUES
(1, '2021-11-03 12:54:11', '2021-11-19 07:44:58', 'Пост 1', 'post-1', '<p>цукуцкцук</p>', '<p>1213</p>', '2021-10-13', NULL, 3, 1, 0, 0, 1),
(13, '2021-11-03 13:00:52', '2021-11-03 17:19:22', 'At quam earum quo excepturi eligendi molestiae.', 'at-quam-earum-quo-excepturi-eligendi-molestiae', '<p>Atque ad consequuntur veritatis sed dolores sit eos blanditiis.</p>', '<p>Est autem iure possimus laboriosam deleniti molestiae iusto dolor.</p>', '2021-11-03', '../img/photo1.png', 1, 1, 1, 662, 0),
(14, '2021-11-03 13:00:52', '2021-11-03 13:00:52', 'Soluta aut dolore est non ut reiciendis tempora.', 'soluta-aut-dolore-est-non-ut-reiciendis-tempora', 'Aut vitae velit doloribus culpa dolorem.', 'Id velit qui itaque voluptates cum.', '2021-11-03', '../img/photo1.png', 5, 1, 1, 2499, 0),
(15, '2021-11-03 13:00:52', '2021-11-03 13:00:52', 'Et temporibus sint praesentium ducimus.', 'et-temporibus-sint-praesentium-ducimus', 'Molestias nobis et eum.', 'Nihil enim placeat voluptatem ex.', '2021-11-03', '../img/photo1.png', 6, 1, 1, 1190, 0),
(16, '2021-11-03 13:00:52', '2021-11-03 13:00:52', 'Autem omnis incidunt fuga quas aut sit.', 'autem-omnis-incidunt-fuga-quas-aut-sit', 'Amet et eos iste alias omnis rerum.', 'Accusantium accusantium et minima facere.', '2021-11-03', '../img/photo1.png', 5, 1, 1, 2126, 0),
(17, '2021-11-03 13:00:52', '2021-11-03 13:00:52', 'Quaerat error iusto saepe qui eum.', 'quaerat-error-iusto-saepe-qui-eum', 'Vel repellat sunt dignissimos et aliquam.', 'Quis assumenda doloribus provident fugit.', '2021-11-03', '../img/photo1.png', 5, 1, 1, 2872, 0),
(18, '2021-11-03 13:00:52', '2021-11-03 13:00:52', 'Culpa sed quam accusamus.', 'culpa-sed-quam-accusamus', 'Cupiditate harum et praesentium sed alias eum.', 'Praesentium nostrum atque ut.', '2021-11-03', '../img/photo1.png', 5, 1, 1, 4572, 0),
(19, '2021-11-03 13:00:52', '2021-11-03 13:00:52', 'Aliquid quo aut occaecati numquam dolorem doloremque.', 'aliquid-quo-aut-occaecati-numquam-dolorem-doloremque', 'Et ab quo corrupti aspernatur saepe distinctio.', 'Aut odit magni sit similique omnis vitae eveniet.', '2021-11-03', '../img/photo1.png', 5, 1, 1, 861, 0),
(20, '2021-11-03 13:00:52', '2021-11-03 13:00:52', 'Excepturi quod facere veniam quo cupiditate et facilis.', 'excepturi-quod-facere-veniam-quo-cupiditate-et-facilis', 'Debitis quo nisi cum dignissimos et omnis illum.', 'Aut neque impedit minus qui nesciunt accusamus.', '2021-11-03', '../img/photo1.png', 6, 1, 1, 2085, 0),
(22, '2021-11-03 13:00:52', '2021-11-03 13:00:52', 'Molestiae deleniti deleniti atque.', 'molestiae-deleniti-deleniti-atque', 'Voluptatem repellat non corrupti.', 'Ipsam sit in blanditiis minus ut iste rerum.', '2021-11-03', '../img/photo1.png', 6, 1, 1, 4849, 0),
(24, '2021-11-19 07:45:30', '2021-11-19 07:45:30', 'Тест 1', 'test-1', '<p>12313</p>', '<p>1231</p>', '2021-11-27', NULL, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_tags`
--

INSERT INTO `post_tags` (`id`, `created_at`, `updated_at`, `post_id`, `tag_id`) VALUES
(1, NULL, NULL, 11, 2),
(2, NULL, NULL, 6, 2),
(3, NULL, NULL, 6, 4),
(4, NULL, NULL, 6, 5),
(5, NULL, NULL, 7, 3),
(6, NULL, NULL, 7, 4),
(7, NULL, NULL, 12, 1),
(8, NULL, NULL, 23, 2),
(9, NULL, NULL, 23, 3),
(10, NULL, NULL, 23, 4),
(11, NULL, NULL, 23, 5),
(12, NULL, NULL, 24, 2),
(13, NULL, NULL, 24, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `created_at`, `updated_at`, `email`, `token`) VALUES
(1, '2021-11-05 16:15:56', '2021-11-05 16:15:56', 'alexivakha@gmail.com', 'DnaVJdhVTizbYORXiIqxhiSGe0Mf6kPuXrYjNQDIFYiNIER0gtqV16PHmiNZVFCLzWmUHZULAiLc4h9sH7tZxXv43AJfqdbRcSHx'),
(17, '2021-11-06 06:49:19', '2021-11-06 06:49:19', 'alexivakssdsdha@gmail.com', 'yZzoI8ycKmfw4qEwTuKlHhVz6SvawJsBuumVV5rdtQkQxEEO5Z2po0RjqF7wgtjJHedEQ3ALBeeg8smjnHRXQhhz7yGST26uzK00'),
(21, '2021-11-06 08:06:30', '2021-11-06 08:06:58', 'testqwerty@gmail.com', NULL),
(23, '2021-11-19 06:39:26', '2021-11-19 06:40:28', '12shopdocs@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `created_at`, `updated_at`, `title`, `slug`) VALUES
(1, '2021-10-28 14:23:03', '2021-10-28 14:23:03', 'soluta', 'soluta'),
(2, '2021-10-28 14:23:03', '2021-10-28 14:23:03', 'deleniti', 'deleniti'),
(3, '2021-10-28 14:23:03', '2021-10-28 14:23:03', 'sed', 'sed'),
(4, '2021-10-28 14:23:03', '2021-10-28 14:23:03', 'unde', 'unde'),
(5, '2021-10-28 14:23:03', '2021-10-28 14:23:03', 'deleniti', 'deleniti-1');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`, `status`, `avatar`) VALUES
(1, 'Oleksandr', 'alexivakha@gmail.com', NULL, '$2y$10$yWbtbe/hlp7YaBbfDbrdruML2GcEHQOY5sWWOlg/fK7sfZXPAYKa.', NULL, '2021-11-03 04:30:15', '2021-11-03 10:36:14', 1, 0, 'TlAxwpbfV5.jpg'),
(14, 'Admin', 'ivakha@gmail.com', NULL, '$2y$10$our/tzJJlaLHxgHNecK77O5.mrByEZbBuciGbYdVuR50t1fasXJCW', NULL, '2021-11-19 05:34:53', '2021-11-19 05:34:53', 1, 0, NULL),
(15, 'Paki Bowen', 'pumivazuv@mailinator.com', NULL, '$2y$10$00hi4eT7J7MFZ9dH9M8w6O1fc3G2bXUyTFEvAv35Xv4uAyX2n4vda', NULL, '2021-11-28 13:19:52', '2021-11-28 13:19:52', 1, 0, NULL),
(16, 'Ramona Dillard', 'nidewef@mailinator.com', NULL, '$2y$10$lXn5sQzdWCKTSeAskOjtmulSne/AoeS0rDeACfuAY3Zpk6ssGKpaS', NULL, '2021-11-28 13:29:48', '2021-11-28 13:29:48', 1, 0, NULL),
(17, 'Lyle Johnson', 'kogoze@mailinator.com', NULL, '$2y$10$kzBTFQTSVfh1DWrvsDe2F.IG1nukkGn41IHxVCfLR4dqOgXfYR6tu', NULL, '2021-11-28 13:30:13', '2021-11-28 13:30:13', 1, 0, NULL),
(18, 'Harlan Barr', 'cosos@mailinator.com', NULL, '$2y$10$jGmw9jSR8/i514p8Z1Ru1u2hPkgcmfzCvBH8M2k5jipanTKntBmqe', NULL, '2021-11-28 13:54:26', '2021-11-28 13:54:26', 1, 0, NULL),
(19, 'Kibo Mitchell', 'bixalohy@mailinator.com', NULL, '$2y$10$pk/PEQM3pQ3NwiZKQWdmOejOjy8RSlyzOPoct2LDuJaGAy5PT5dxu', NULL, '2021-11-28 13:57:03', '2021-11-28 13:57:03', 1, 0, NULL),
(20, 'Lewis Heath', 'mimog@mailinator.com', NULL, '$2y$10$DWpOdE2lVk1gsen.dloOCOF0C0OtpaSa6DzEsOwAvozyPtQCGx7EG', NULL, '2021-11-28 13:58:26', '2021-11-28 13:58:26', 1, 0, NULL),
(21, 'Damon Snow', 'kuhonas@mailinator.com', NULL, '$2y$10$1PqksjgiDOwUB5AaZZhatO3UAiT4mDyKqPIhexf/PuKaVIYyLMIby', NULL, '2021-11-28 14:06:57', '2021-11-28 14:06:57', 1, 0, NULL),
(22, 'Ayanna Parks', 'forotuw@mailinator.com', NULL, '$2y$10$ym.eCwhL3Hh.xwXW.boXL.WFvppgrVLep2H6C39gJ7hOlHIChS1k.', NULL, '2021-11-28 14:11:17', '2021-11-28 14:11:17', 1, 0, NULL),
(23, 'Wallace Floyd', 'hekod@mailinator.com', NULL, '$2y$10$Je1g80vVZzlrhbDyvHQMeOmYVZ35qFGoU72kPKIkqIYWotqVGDSUy', NULL, '2021-11-28 14:11:52', '2021-11-28 14:11:52', 0, 0, NULL),
(24, 'Steel Garza', 'kikilyxe@mailinator.com', NULL, '$2y$10$LhX6Gi9ToIh.wwst1Pit6u/iJPvhSP.OXXt3EH7d/7W0ohpuDKwJG', NULL, '2021-11-28 14:12:23', '2021-11-28 14:12:23', 0, 0, NULL),
(25, 'Taylor Robles', 'pasu@mailinator.com', NULL, '$2y$10$aFBfBLtVuGSreUKC7OtwF.YB8tH4TPc.b0DG.vQf/nZXZS7wp3Khy', NULL, '2021-11-28 14:17:21', '2021-11-28 14:17:21', 0, 0, NULL),
(26, 'Jenna Lambert', 'zonos@mailinator.com', NULL, '$2y$10$PPYzwARHQ5U7HGjHEUNAmeIiKpYnxq7piZ93J.2U9ezFPSmqdAMKO', NULL, '2021-11-28 14:19:16', '2021-11-28 14:19:16', 0, 0, NULL),
(27, 'Baker Maxwell', 'cimev@mailinator.com', NULL, '$2y$10$k/kXroU/bALNmVBY0thj8.TgOao2JQq4pmjSvFn9.Z5eYJScvpz9e', NULL, '2021-11-28 14:57:24', '2021-11-28 14:57:24', 0, 0, NULL),
(28, 'Joelle Mccormick', 'jygune@mailinator.com', NULL, '$2y$10$zB6us8idtgWiT6GH3f/oXuMDepJCWT73VYTCvAWKAIxGDxuIyls/a', NULL, '2021-11-28 15:01:20', '2021-11-28 15:01:20', 0, 0, NULL),
(29, 'MacKensie Doyle', 'notigarage@mailinator.com', NULL, '$2y$10$/KnY0JNRgcZZwje1v9Y4cOyEnxuDtyPhKY.avAAN4ssF6ShGwasBS', NULL, '2021-12-02 17:57:57', '2021-12-02 17:57:57', 0, 0, NULL),
(30, 'Stone Morrison', 'vuzy@mailinator.com', NULL, '$2y$10$Uuvj3820AeNnnY2nQNs8AOFa81yLEjbJ5.j8OjxQJ1KWyrm/jYPRa', NULL, '2021-12-03 06:41:21', '2021-12-03 06:41:21', 0, 0, NULL),
(31, 'Hannah Gonzalez', 'poxy@mailinator.com', NULL, '$2y$10$A8jtDI72pe3l4ELLSQ6dLOS0M0Bdj/zsFqreu781Z5GatqXCRCm..', NULL, '2021-12-03 07:38:46', '2021-12-03 07:38:46', 0, 0, NULL),
(32, 'Graiden Underwood', 'gepeqapyxy@mailinator.com', NULL, '$2y$10$Q6.dw6kS9RnLaW1TM/GBZ.Ylj8H5jwu3P0muz9ZxFhKq2MzcVVvkK', NULL, '2021-12-03 07:50:54', '2021-12-03 07:50:54', 0, 0, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
