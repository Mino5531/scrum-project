-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 16. Mrz 2021 um 12:57
-- Server-Version: 10.4.14-MariaDB
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `swp`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Card`
--

CREATE TABLE `Card` (
  `Id` int(11) NOT NULL,
  `Color` varchar(10) COLLATE utf8_bin NOT NULL,
  `Face` varchar(10) COLLATE utf8_bin NOT NULL,
  `Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `Card`
--

INSERT INTO `Card` (`Id`, `Color`, `Face`, `Value`) VALUES
(1, 'Diamonds', '2', 2),
(2, 'Diamonds', '3', 3),
(3, 'Diamonds', '4', 4),
(4, 'Diamonds', '5', 5),
(5, 'Diamonds', '6', 6),
(6, 'Diamonds', '7', 7),
(7, 'Diamonds', '8', 8),
(8, 'Diamonds', '9', 9),
(9, 'Diamonds', '10', 10),
(10, 'Diamonds', 'Jack', 10),
(11, 'Diamonds', 'Queen', 10),
(12, 'Diamonds', 'King', 10),
(13, 'Diamonds', 'Ace', 11),
(14, 'Hearts', '2', 2),
(15, 'Hearts', '3', 3),
(16, 'Hearts', '4', 4),
(17, 'Hearts', '5', 5),
(18, 'Hearts', '6', 6),
(19, 'Hearts', '7', 7),
(20, 'Hearts', '8', 8),
(21, 'Hearts', '9', 9),
(22, 'Hearts', '10', 10),
(23, 'Hearts', 'Jack', 10),
(24, 'Hearts', 'Queen', 10),
(25, 'Hearts', 'King', 10),
(26, 'Hearts', 'Ace', 11),
(27, 'Spades', '2', 2),
(28, 'Spades', '3', 3),
(29, 'Spades', '4', 4),
(30, 'Spades', '5', 5),
(31, 'Spades', '6', 6),
(32, 'Spades', '7', 7),
(33, 'Spades', '8', 8),
(34, 'Spades', '9', 9),
(35, 'Spades', '10', 10),
(36, 'Spades', 'Jack', 10),
(37, 'Spades', 'Queen', 10),
(38, 'Spades', 'King', 10),
(39, 'Spades', 'Ace', 11),
(40, 'Clubs', '2', 2),
(41, 'Clubs', '3', 3),
(42, 'Clubs', '4', 4),
(43, 'Clubs', '5', 5),
(44, 'Clubs', '6', 6),
(45, 'Clubs', '7', 7),
(46, 'Clubs', '8', 8),
(47, 'Clubs', '9', 9),
(48, 'Clubs', '10', 10),
(49, 'Clubs', 'Jack', 10),
(50, 'Clubs', 'Queen', 10),
(51, 'Clubs', 'King', 10),
(52, 'Clubs', 'Ace', 11);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Game`
--

CREATE TABLE `Game` (
  `GameID` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_bin NOT NULL,
  `URL` varchar(65) COLLATE utf8_bin NOT NULL,
  `Mindesteinsatz` float NOT NULL,
  `Gewinn` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PaymentHistory`
--

CREATE TABLE `PaymentHistory` (
  `PaymentID` int(11) NOT NULL,
  `Datum` datetime(6) NOT NULL,
  `Betrag` float NOT NULL,
  `Typ` varchar(11) COLLATE utf8_bin NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `PaymentHistory`
--

INSERT INTO `PaymentHistory` (`PaymentID`, `Datum`, `Betrag`, `Typ`, `UserID`) VALUES
(1, '2020-03-10 00:00:00.000000', -20, 'Blackjack', 1),
(2, '2021-03-12 09:20:54.000000', -2, 'Blackjack', 1),
(3, '2021-03-12 09:20:54.000000', -2, 'Blackjack', 1),
(4, '2021-03-12 09:21:12.000000', -2, 'Blackjack', 1),
(5, '2021-03-12 09:21:47.000000', -2, 'Blackjack', 1),
(6, '2021-03-12 09:22:38.000000', -2, 'Blackjack', 1),
(7, '2021-03-12 09:22:38.000000', -2, 'Blackjack', 1),
(8, '2021-03-12 09:23:38.000000', -2, 'Blackjack', 1),
(9, '2021-03-12 09:25:17.000000', -2, 'Blackjack', 1),
(10, '2021-03-12 09:25:26.000000', -3, 'Blackjack', 1),
(11, '2021-03-12 09:28:14.000000', -3, 'Blackjack', 1),
(12, '2021-03-15 21:50:21.000000', -100, 'Blackjack', 1),
(13, '2021-03-15 21:54:00.000000', -100, 'Blackjack', 1),
(14, '2021-03-15 21:54:16.000000', -100, 'Blackjack', 1),
(15, '2021-03-15 21:54:32.000000', -100, 'Blackjack', 1),
(16, '2021-03-15 21:54:42.000000', -100, 'Blackjack', 1),
(17, '2021-03-15 21:55:13.000000', -100, 'Blackjack', 1),
(18, '2021-03-15 21:55:21.000000', 100, 'Blackjack', 1),
(19, '2021-03-15 21:55:38.000000', -100, 'Blackjack', 1),
(20, '2021-03-15 21:55:59.000000', 100, 'Blackjack', 1),
(21, '2021-03-15 21:56:22.000000', -100, 'Blackjack', 1),
(22, '2021-03-15 22:02:55.000000', 100, 'Blackjack', 1),
(23, '2021-03-15 22:03:21.000000', 100, 'Blackjack', 1),
(24, '2021-03-15 22:03:36.000000', 100, 'Blackjack', 1),
(25, '2021-03-15 22:03:50.000000', 0, 'Blackjack', 1),
(26, '2021-03-15 22:03:56.000000', 100, 'Blackjack', 1),
(27, '2021-03-15 22:04:57.000000', -100, 'Blackjack', 1),
(28, '2021-03-15 22:05:08.000000', 100, 'Blackjack', 1),
(29, '2021-03-15 22:05:17.000000', -100, 'Blackjack', 1),
(30, '2021-03-15 22:06:56.000000', -100, 'Blackjack', 1),
(31, '2021-03-15 22:07:05.000000', -100, 'Blackjack', 1),
(32, '2021-03-15 22:07:17.000000', -100, 'Blackjack', 1),
(33, '2021-03-15 22:07:27.000000', -100, 'Blackjack', 1),
(34, '2021-03-15 22:07:39.000000', 100, 'Blackjack', 1),
(35, '2021-03-15 22:10:44.000000', 100, 'Blackjack', 1),
(36, '2021-03-15 22:11:21.000000', -100, 'Blackjack', 1),
(37, '2021-03-15 22:11:42.000000', 100, 'Blackjack', 1),
(38, '2021-03-15 22:13:27.000000', 50, 'Blackjack', 1),
(39, '2021-03-15 22:13:40.000000', -50, 'Blackjack', 1),
(40, '2021-03-15 22:13:54.000000', -100, 'Blackjack', 1),
(41, '2021-03-15 22:14:05.000000', 200, 'Blackjack', 1),
(42, '2021-03-15 22:14:23.000000', 100, 'Blackjack', 1),
(43, '2021-03-15 22:14:34.000000', 100, 'Blackjack', 1),
(44, '2021-03-15 22:14:44.000000', 100, 'Blackjack', 1),
(45, '2021-03-15 22:14:54.000000', 100, 'Blackjack', 1),
(46, '2021-03-15 22:15:05.000000', -200, 'Blackjack', 1),
(47, '2021-03-15 22:15:19.000000', -400, 'Blackjack', 1),
(48, '2021-03-15 22:15:30.000000', -526, 'Blackjack', 1),
(49, '2021-03-15 22:16:45.000000', -1, 'Blackjack', 1),
(50, '2021-03-15 22:16:58.000000', -100, 'Blackjack', 1),
(51, '2021-03-15 22:17:09.000000', 100, 'Blackjack', 1),
(52, '2021-03-15 22:17:42.000000', 100, 'Blackjack', 1),
(53, '2021-03-15 22:17:54.000000', 10000, 'Blackjack', 1),
(54, '2021-03-15 22:18:05.000000', 99, 'Blackjack', 1),
(55, '2021-03-15 22:18:15.000000', -198, 'Blackjack', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `PaymentMethod`
--

CREATE TABLE `PaymentMethod` (
  `KartenId` int(11) NOT NULL,
  `Kartennummer` int(11) NOT NULL,
  `Ablaufdatum` date NOT NULL,
  `CVV` int(11) NOT NULL,
  `Rechnungsadresse` varchar(45) COLLATE utf8_bin NOT NULL,
  `Rechnungsname` varchar(45) COLLATE utf8_bin NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `User`
--

CREATE TABLE `User` (
  `UserID` int(11) NOT NULL,
  `Vorname` varchar(45) COLLATE utf8_bin NOT NULL,
  `Nachname` varchar(45) COLLATE utf8_bin NOT NULL,
  `Username` varchar(45) COLLATE utf8_bin NOT NULL,
  `Kontostand` float NOT NULL,
  `Admin` tinyint(1) NOT NULL,
  `Email` varchar(45) COLLATE utf8_bin NOT NULL,
  `Passwort` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `User`
--

INSERT INTO `User` (`UserID`, `Vorname`, `Nachname`, `Username`, `Kontostand`, `Admin`, `Email`, `Passwort`) VALUES
(1, 'Jakob', 'Raupach', 'jraupach', 10000, 0, 'jakob.raupach@gmail.com', 'test');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Card`
--
ALTER TABLE `Card`
  ADD PRIMARY KEY (`Id`);

--
-- Indizes für die Tabelle `PaymentHistory`
--
ALTER TABLE `PaymentHistory`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indizes für die Tabelle `PaymentMethod`
--
ALTER TABLE `PaymentMethod`
  ADD PRIMARY KEY (`KartenId`),
  ADD KEY `UserID` (`UserID`);

--
-- Indizes für die Tabelle `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Card`
--
ALTER TABLE `Card`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT für Tabelle `PaymentHistory`
--
ALTER TABLE `PaymentHistory`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT für Tabelle `PaymentMethod`
--
ALTER TABLE `PaymentMethod`
  MODIFY `KartenId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `PaymentHistory`
--
ALTER TABLE `PaymentHistory`
  ADD CONSTRAINT `PaymentHistory_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`);

--
-- Constraints der Tabelle `PaymentMethod`
--
ALTER TABLE `PaymentMethod`
  ADD CONSTRAINT `PaymentMethod_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
