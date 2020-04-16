-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 10 Lut 2020, 23:51
-- Wersja serwera: 10.4.6-MariaDB
-- Wersja PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `takservice`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_02_10_174438_create_task_table', 1),
(2, '2020_02_10_180749_rename_table_task', 2),
(3, '2020_02_10_180917_rename_table_task', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_task` datetime NOT NULL,
  `end_task` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `tasks`
--

INSERT INTO `tasks` (`id`, `id_user`, `name`, `description`, `start_task`, `end_task`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Prof.', 'Et quam odio sed iste alias vel eligendi eum. Neque autem perferendis voluptatem illo. Non assumenda ut quo dolorum. Est velit sequi consectetur a fuga.', '2019-12-24 11:26:52', '2020-01-15 08:33:51', 1, '2020-02-10 17:09:47', '2020-02-10 17:09:47'),
(3, 1, 'Prof.', 'Itaque similique fuga cum voluptatem enim cumque. Fuga aperiam quod exercitationem. Fuga consequatur ullam est sit fugiat sint.', '2019-12-26 10:26:22', '2020-02-02 05:08:47', 1, '2020-02-10 17:09:47', '2020-02-10 17:09:47'),
(4, 1, 'Mr.', 'Perferendis aperiam et exercitationem at sunt. Est molestiae ipsam enim laboriosam. At quis corporis magni vel. Dolorum et sequi sed qui.', '2019-12-24 02:30:25', '2020-01-16 02:41:13', 1, '2020-02-10 17:09:47', '2020-02-10 17:09:47'),
(6, 1, 'Dr.', 'Vitae quis et pariatur. Mollitia nulla adipisci harum. Natus voluptatum ducimus excepturi optio sapiente. Error quia ratione ut natus vero aut. Voluptas commodi voluptas vel eos qui.', '2019-12-17 22:46:42', '2020-01-16 21:50:25', 1, '2020-02-10 17:09:47', '2020-02-10 17:09:47'),
(7, 1, 'Mr.', 'Sed rerum sed molestias quae consequatur qui autem. Ut temporibus blanditiis quia ipsum facilis.', '2019-12-13 09:05:55', '2020-02-03 07:09:21', 1, '2020-02-10 17:09:47', '2020-02-10 17:09:47'),
(8, 1, 'Dr.', 'Ipsam similique illo qui fugiat dolor. Non rerum dolores eos libero est harum quibusdam. Atque accusamus nam voluptatum ratione eligendi.', '2019-12-14 14:19:06', '2020-02-13 06:47:52', 1, '2020-02-10 17:09:47', '2020-02-10 17:09:47'),
(9, 1, 'Prof.', 'Perspiciatis eveniet consequatur ullam repellendus. Possimus aut nihil qui non. Omnis quo est debitis. Minus id et voluptatem ut aperiam.', '2019-12-20 08:18:45', '2020-01-14 07:06:22', 1, '2020-02-10 17:09:47', '2020-02-10 17:09:47'),
(10, 1, 'Dr.', 'Omnis tempora voluptates necessitatibus aut quisquam fuga. Et iure iste voluptatem quaerat nemo. Et veritatis cumque aut.', '2019-12-28 01:03:02', '2020-01-21 20:48:49', 1, '2020-02-10 17:09:47', '2020-02-10 17:09:47'),
(11, 1, 'Insurance Sales Agent', 'Blanditiis sapiente aspernatur nostrum sit et adipisci. Ut inventore velit numquam atque dolore voluptatem. Vel assumenda et eum quam quia. Libero odio ipsam architecto labore.', '2019-12-21 02:05:01', '2020-01-27 05:40:45', 1, '2020-02-10 17:11:16', '2020-02-10 17:11:16'),
(12, 1, 'Atmospheric and Space Scientist', 'Error repellendus at voluptas molestias nisi atque. Totam atque ut sed qui officia. Qui incidunt rerum ex dolorum quam. Animi non autem et voluptas. Et iure provident cum.', '2019-12-18 06:05:48', '2020-02-16 12:29:08', 1, '2020-02-10 17:11:16', '2020-02-10 17:11:16'),
(13, 1, 'Administrative Services Manager', 'Doloribus totam debitis labore esse nam voluptate a modi. Sint voluptatum doloremque recusandae ipsa optio. Atque odio voluptatum velit a qui error.', '2019-12-20 07:38:08', '2020-02-19 17:05:21', 1, '2020-02-10 17:11:16', '2020-02-10 17:11:16'),
(14, 1, 'Nuclear Power Reactor Operator', 'Dicta quidem dolor enim commodi. Repellat excepturi reprehenderit odit aut.', '2019-12-31 10:33:57', '2020-01-27 02:13:13', 1, '2020-02-10 17:11:16', '2020-02-10 17:11:16'),
(15, 1, 'Educational Psychologist', 'Et amet aspernatur ea quis illo et. Minus voluptatibus doloribus amet iusto rerum autem placeat. Eligendi in iste ipsam illum.', '2019-12-26 19:09:55', '2020-01-21 09:58:10', 1, '2020-02-10 17:11:16', '2020-02-10 17:11:16'),
(16, 1, 'Educational Psychologist test', 'Error repellendus at voluptas molestias nisi atque. Totam atque ut sed qui officia. Qui incidunt rerum ex dolorum quam. Animi non autem et voluptas. Et iure provident cum.', '2019-12-14 14:19:06', '2020-01-14 07:06:22', 1, '2020-02-10 18:06:11', '2020-02-10 18:06:11'),
(17, 3, 'Test raz dwa trzy', 'Test raz dwa trzy Test raz dwa trzy Test raz dwa trzy Test raz dwa trzy', '2019-12-26 10:26:22', '2020-02-26 10:26:22', 1, '2020-02-10 21:19:30', '2020-02-10 21:19:30'),
(18, 3, 'Test raz dwa trzy', 'Test raz dwa trzy Test raz dwa trzy Test raz dwa trzy Test raz dwa trzy', '2019-12-26 10:26:22', '2020-02-26 10:26:22', 1, '2020-02-10 21:48:54', '2020-02-10 21:48:54');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
