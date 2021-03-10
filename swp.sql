-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 05. Mrz 2021 um 08:01
-- Server-Version: 10.3.27-MariaDB-0+deb10u1
-- PHP-Version: 7.3.27-1~deb10u1

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
(1, 'Diamonds', '7', 7),
(2, 'Diamonds', '8', 8),
(3, 'Diamonds', '9', 9),
(4, 'Diamonds', '10', 10),
(5, 'Diamonds', 'Jack', 10),
(6, 'Diamonds', 'Queen', 10),
(7, 'Diamonds', 'King', 10),
(8, 'Diamonds', 'Ace', 11),
(9, 'Hearts', '7', 7),
(10, 'Hearts', '8', 8),
(11, 'Hearts', '9', 9),
(12, 'Hearts', '10', 10),
(13, 'Hearts', 'Jack', 10),
(14, 'Hearts', 'Queen', 10),
(15, 'Hearts', 'King', 10),
(16, 'Hearts', 'Ace', 11),
(17, 'Spades', '7', 7),
(18, 'Spades', '8', 8),
(19, 'Spades', '9', 9),
(20, 'Spades', '10', 10),
(21, 'Spades', 'Jack', 10),
(22, 'Spades', 'Queen', 10),
(23, 'Spades', 'King', 10),
(24, 'Spades', 'Ace', 11),
(25, 'Clubs', '7', 7),
(26, 'Clubs', '8', 8),
(27, 'Clubs', '9', 9),
(28, 'Clubs', '10', 10),
(29, 'Clubs', 'Jack', 10),
(30, 'Clubs', 'Queen', 10),
(31, 'Clubs', 'King', 10),
(32, 'Clubs', 'Ace', 11);

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
  `Typ` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT für Tabelle `PaymentHistory`
--
ALTER TABLE `PaymentHistory`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `PaymentMethod`
--
ALTER TABLE `PaymentMethod`
  MODIFY `KartenId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

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
