-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Machine: 127.0.0.1
-- Gegenereerd op: 15 jan 2016 om 16:43
-- Serverversie: 5.5.39
-- PHP-versie: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;


CREATE TABLE IF NOT EXISTS `ci_sessions` (
        `id` varchar(128) NOT NULL,
        `ip_address` varchar(45) NOT NULL,
        `timestamp` int(10) unsigned DEFAULT 0 NOT NULL,
        `data` blob NOT NULL,
        KEY `ci_sessions_timestamp` (`timestamp`)
);


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
`id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
  `icon` varchar(12) NOT NULL DEFAULT '0',
  `hasSub` bit(1) NOT NULL DEFAULT b'0',
  `parent_id` int(5) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `internal_name` varchar(50) DEFAULT NULL,
  `priority` int(5) NOT NULL,
  `link` varchar(150) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Gegevens worden geëxporteerd voor tabel `rights`
--

INSERT INTO `rights` (`id`, `icon`, `hasSub`, `parent_id`, `name`, `internal_name`, `priority`, `link`) VALUES
(1, 'dashboard', b'0', 0, 'Dashboard', 'dashboard', 1, '/dashboard'),
(2, 'cogs', b'1', 0, 'Configuratie', 'config', 80, '/config'),
(3, '0', b'0', 2, 'Gebruikers', 'users', 81, '/config/users'),
(4, '0', b'0', 2, 'Rechten', 'rights', 81, '/config/rights');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rights_tree`
--

CREATE TABLE IF NOT EXISTS `rights_tree` (
`id` int(5) NOT NULL,
  `profile_id` int(6) NOT NULL,
  `rights_id` int(6) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Gegevens worden geëxporteerd voor tabel `rights_tree`
--

INSERT INTO `rights_tree` (`id`, `profile_id`, `rights_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1);

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
  `active` bit(1) NOT NULL,
  `start_page` varchar(50) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `slogan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8453414 ;


-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user_activities`
--

CREATE TABLE IF NOT EXISTS `user_activities` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `checksum` varchar(25) NOT NULL,
  `date_modify` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;


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

ALTER TABLE `profiles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT voor een tabel `rights`
--
ALTER TABLE `rights`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT voor een tabel `rights_tree`
--
ALTER TABLE `rights_tree`
MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8453414;
--
-- AUTO_INCREMENT voor een tabel `user_activities`
--
ALTER TABLE `user_activities`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;