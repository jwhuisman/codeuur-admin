-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Gegenereerd op: 24 okt 2017 om 20:29
-- Serverversie: 5.6.35
-- PHP-versie: 7.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeuur`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `profiles`
--

INSERT INTO `profiles` (`id`, `name`) VALUES
(1, 'Administrator'),
(2, 'Medewerker');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rights`
--

CREATE TABLE IF NOT EXISTS `rights` (
  `id` int(11) NOT NULL,
  `icon` varchar(25) NOT NULL DEFAULT '0',
  `hasSub` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(5) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `internal_name` varchar(50) DEFAULT NULL,
  `priority` int(5) NOT NULL,
  `link` varchar(150) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `rights`
--

INSERT INTO `rights` (`id`, `icon`, `hasSub`, `parent_id`, `name`, `internal_name`, `priority`, `link`) VALUES
(1, 'dashboard', 0, 0, 'Dashboard', 'dashboard', 1, '/dashboard'),
(2, 'cogs', 1, 0, 'Configuratie', 'config', 80, '/config'),
(3, '0', 0, 2, 'Gebruikers', 'users', 81, '/config/users'),
(4, '0', 0, 2, 'Rechten', 'rights', 81, '/config/rights'),
(5, 'users', 0, 0, 'Teams', 'teams', 2, '/teams'),
(7, 'graduation-cap', 0, 0, 'Scholen', 'schools', 3, '/schools'),
(8, 'calendar', 0, 0, 'Planning', '/schedule', 5, '/schedule');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rights_tree`
--

CREATE TABLE IF NOT EXISTS `rights_tree` (
  `id` int(5) NOT NULL,
  `profile_id` int(6) NOT NULL,
  `rights_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `rights_tree`
--

INSERT INTO `rights_tree` (`id`, `profile_id`, `rights_id`) VALUES
(10, 1, 2),
(11, 1, 1),
(12, 1, 8),
(13, 1, 7),
(14, 1, 5),
(15, 2, 1),
(16, 2, 8),
(17, 2, 7),
(18, 2, 5);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `schools`
--

CREATE TABLE IF NOT EXISTS `schools` (
  `school_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zip` varchar(8) NOT NULL,
  `city` varchar(50) NOT NULL,
  `goup_info` text NOT NULL,
  `contact_first_name` varchar(100) NOT NULL,
  `contact_last_name` varchar(100) NOT NULL,
  `contact_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `picture` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `about` text NOT NULL,
  `study` text NOT NULL,
  `contact_to_school` tinyint(1) NOT NULL,
  `team_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `students`
--

INSERT INTO `students` (`student_id`, `first_name`, `last_name`, `picture`, `phone`, `email`, `about`, `study`, `contact_to_school`, `team_id`) VALUES
(0, 'Johan', 'ter Wolde', '', '1234567890', 'TetstASDFsdf@asdfn.nl', 'asdf', 'asdf', 1, 2),
(12345, 'BenV', 'Vreemdeling', '', '0655251114', 'ben@vreemdeling.nl', 'asdf', 'asdf', 1, 2),
(92081305, 'Daniëlla', 'Sienders', '', '0611411114', 'd.sienders@gmail.com', 'Dit gaat over mij', 'Dit over mijn opleiding', 1, 1),
(99041305, 'Jan-Willem ', 'Huisman', '', '0655968254', 'jhuisman@davinci.nl', 'Dit is ene test', 'Dit is mijn opleiding', 1, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `team_id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `teams`
--

INSERT INTO `teams` (`team_id`, `school_id`) VALUES
(1, NULL),
(2, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `email` varchar(60) NOT NULL,
  `profile_image` varchar(200) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `menu_state` varchar(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `start_page` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `slogan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8453416 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `profile_image`, `profile_id`, `division_id`, `menu_state`, `active`, `start_page`, `date_created`, `slogan`) VALUES
(8453414, 'Jan-Willem Huisman', 'hjw', 'a76f21eda63a3cfd3b8ab1282f24a053717882db', 'jhuisman@davinci.nl', NULL, 1, 0, NULL, 1, '/dashboard', '2017-10-24 20:53:32', NULL),
(8453415, 'Hans van der Grind', 'hans', '3ef979080032bc766a3aa04edc0e60475fe00188', 'h.vandergrind2@inholland.nl', NULL, 2, 0, NULL, 1, '/dashboard', '2017-10-24 21:06:09', 'Education is not limited to just classrooms and textbooks');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_activities`
--

CREATE TABLE IF NOT EXISTS `user_activities` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checksum` varchar(25) NOT NULL,
  `date_modify` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `user_activities`
--

INSERT INTO `user_activities` (`id`, `user_id`, `checksum`, `date_modify`) VALUES
(1, 8453414, 'f1749c9e85dc0c68e87586e12', '2017-10-24 21:28:36'),
(2, 8453415, '0a74dc2d294bb7f8eedd8d30c', '2017-10-24 21:26:54');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexen voor tabel `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `rights_tree`
--
ALTER TABLE `rights_tree`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`school_id`);

--
-- Indexen voor tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexen voor tabel `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`);

--
-- Indexen voor tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `user_activities`
--
ALTER TABLE `user_activities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT voor een tabel `rights_tree`
--
ALTER TABLE `rights_tree`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT voor een tabel `schools`
--
ALTER TABLE `schools`
  MODIFY `school_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8453416;
--
-- AUTO_INCREMENT voor een tabel `user_activities`
--
ALTER TABLE `user_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
