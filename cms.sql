-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 22 2020 г., 16:30
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cms`
--

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`id`, `name`) VALUES
(1, 'header menu'),
(2, 'footer menu'),
(5, 'new menu');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_item`
--

CREATE TABLE `menu_item` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `parent` tinyint(1) NOT NULL DEFAULT 0,
  `position` int(11) NOT NULL DEFAULT 999,
  `link` varchar(255) NOT NULL DEFAULT '#'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu_item`
--

INSERT INTO `menu_item` (`id`, `menu_id`, `name`, `parent`, `position`, `link`) VALUES
(1, 1, 'Home', 0, 0, '#'),
(2, 1, 'About', 0, 2, '#'),
(4, 1, 'Contact', 0, 1, '#'),
(8, 2, 'New item 1', 0, 0, '#'),
(13, 5, 'New item 2', 0, 999, '#'),
(14, 5, 'New item 3', 0, 0, '#'),
(17, 1, 'New item', 0, 3, '#'),
(19, 10, 'New item', 0, 999, '#'),
(20, 10, 'New item', 0, 999, '#');

-- --------------------------------------------------------

--
-- Структура таблицы `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'publish',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `page`
--

INSERT INTO `page` (`id`, `title`, `content`, `status`, `date`) VALUES
(1, 'Hello world', '<p>​hello im cms</p>', 'publish', '2017-07-10 10:28:18'),
(2, 'Test page', '<p>The eduard code fo PHP</p>', 'publish', '2017-07-10 10:29:13'),
(19, 'I note will live', '<p>finish​</p>', 'publish', '2020-10-16 21:36:48'),
(20, 'Will I live', '<p>​Я буду жить</p>', 'publish', '2020-10-16 21:53:35'),
(21, 'I lived', '<p>Я жил​</p>', 'publish', '2020-10-16 21:54:13'),
(22, 'Anton programmer and python', '<p>​Good&nbsp;telegram channel news</p>', 'publish', '2020-10-18 15:35:35'),
(23, 'Я уволняюсь', '<p><del data-verified=\"redactor\" data-redactor-tag=\"del\">​</del>​Мы так давно этого ждали</p>', 'publish', '2020-11-22 13:24:50');

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'publish',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `status`, `date`) VALUES
(6, 'xcccxc', '<p>​xcxcxcxc</p>', 'publish', '2017-07-21 16:15:32'),
(7, 'впавоава 222', '<p>​dddddddddddddd</p>', 'publish', '2017-07-21 16:35:47'),
(8, 'Робот собака HappyCow Smart Dog', '<p>​xxxx</p>', 'publish', '2020-10-18 19:25:28');

-- --------------------------------------------------------

--
-- Структура таблицы `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `key_field` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  `section` varchar(155) NOT NULL DEFAULT 'general'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`id`, `name`, `key_field`, `value`, `section`) VALUES
(1, 'Name site', 'name_site', 'InKognito', 'general'),
(2, 'Description', 'description', 'Example description Cms', 'general'),
(3, 'Admin email', 'admin_email', 'admin@admin.com', 'general'),
(4, 'Language', 'language', 'english', 'general'),
(5, 'Active theme', 'active_theme', 'default', 'theme');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role` enum('admin','moderator','user','') NOT NULL,
  `hash` varchar(32) NOT NULL,
  `date_reg` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role`, `hash`, `date_reg`) VALUES
(1, 'admin@admin.com', 'b59c67bf196a4758191e42f76670ceba', 'admin', '9e3f515244e13c851619b994dd4213d1', '2017-06-18 17:20:59'),
(2, 'test@admin.com', '45c48cce2e2d7fbdea1afc51c7c6ad26', 'user', 'new', '2017-07-01 19:44:51'),
(3, 'test@admin.com', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 'user', 'new', '2017-07-04 20:45:16'),
(4, 'test@admin.com', '8f14e45fceea167a5a36dedd4bea2543', 'user', 'new', '2017-07-04 20:45:26'),
(5, 'user@account.com', '1111', 'admin', '3rrece5g1111', '2020-11-04 21:53:41');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu_item`
--
ALTER TABLE `menu_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `key` (`key_field`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `menu_item`
--
ALTER TABLE `menu_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
