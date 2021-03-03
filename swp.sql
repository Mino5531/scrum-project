-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 03. Mrz 2021 um 10:43
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
  `Admin` tinyint(1) NOT NULL,
  `Email` varchar(45) COLLATE utf8_bin NOT NULL,
  `Passwort` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indizes der exportierten Tabellen
--

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
