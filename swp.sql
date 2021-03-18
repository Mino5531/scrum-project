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
-- Host:                         192.168.56.2
-- Server version:               10.5.9-MariaDB-1:10.5.9+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table swp.Card
CREATE TABLE IF NOT EXISTS `Card` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Color` varchar(10) COLLATE utf8_bin NOT NULL,
  `Face` varchar(10) COLLATE utf8_bin NOT NULL,
  `Value` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table swp.Card: ~32 rows (approximately)
/*!40000 ALTER TABLE `Card` DISABLE KEYS */;
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

-- Dumping structure for table swp.Country
CREATE TABLE IF NOT EXISTS `Country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table swp.Country: ~18 rows (approximately)
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` (`id`, `iso`, `name`, `nicename`, `iso3`) VALUES
	(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG'),
	(2, 'AL', 'ALBANIA', 'Albania', 'ALB'),
	(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA'),
	(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM'),
	(5, 'AD', 'ANDORRA', 'Andorra', 'AND'),
	(6, 'AO', 'ANGOLA', 'Angola', 'AGO'),
	(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA'),
	(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL),
	(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG'),
	(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG'),
	(11, 'AM', 'ARMENIA', 'Armenia', 'ARM'),
	(12, 'AW', 'ARUBA', 'Aruba', 'ABW'),
	(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS'),
	(14, 'AT', 'AUSTRIA', 'Austria', 'AUT'),
	(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE'),
	(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS'),
	(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR'),
	(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD'),
	(19, 'BB', 'BARBADOS', 'Barbados', 'BRB'),
	(20, 'BY', 'BELARUS', 'Belarus', 'BLR'),
	(21, 'BE', 'BELGIUM', 'Belgium', 'BEL'),
	(22, 'BZ', 'BELIZE', 'Belize', 'BLZ'),
	(23, 'BJ', 'BENIN', 'Benin', 'BEN'),
	(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU'),
	(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN'),
	(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL'),
	(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH'),
	(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA'),
	(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL),
	(30, 'BR', 'BRAZIL', 'Brazil', 'BRA'),
	(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL),
	(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN'),
	(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR'),
	(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA'),
	(35, 'BI', 'BURUNDI', 'Burundi', 'BDI'),
	(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM'),
	(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR'),
	(38, 'CA', 'CANADA', 'Canada', 'CAN'),
	(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV'),
	(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM'),
	(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF'),
	(42, 'TD', 'CHAD', 'Chad', 'TCD'),
	(43, 'CL', 'CHILE', 'Chile', 'CHL'),
	(44, 'CN', 'CHINA', 'China', 'CHN'),
	(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL),
	(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL),
	(47, 'CO', 'COLOMBIA', 'Colombia', 'COL'),
	(48, 'KM', 'COMOROS', 'Comoros', 'COM'),
	(49, 'CG', 'CONGO', 'Congo', 'COG'),
	(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD'),
	(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK'),
	(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI'),
	(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV'),
	(54, 'HR', 'CROATIA', 'Croatia', 'HRV'),
	(55, 'CU', 'CUBA', 'Cuba', 'CUB'),
	(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP'),
	(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE'),
	(58, 'DK', 'DENMARK', 'Denmark', 'DNK'),
	(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI'),
	(60, 'DM', 'DOMINICA', 'Dominica', 'DMA'),
	(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM'),
	(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU'),
	(63, 'EG', 'EGYPT', 'Egypt', 'EGY'),
	(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV'),
	(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ'),
	(66, 'ER', 'ERITREA', 'Eritrea', 'ERI'),
	(67, 'EE', 'ESTONIA', 'Estonia', 'EST'),
	(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH'),
	(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK'),
	(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO'),
	(71, 'FJ', 'FIJI', 'Fiji', 'FJI'),
	(72, 'FI', 'FINLAND', 'Finland', 'FIN'),
	(73, 'FR', 'FRANCE', 'France', 'FRA'),
	(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF'),
	(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF'),
	(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL),
	(77, 'GA', 'GABON', 'Gabon', 'GAB'),
	(78, 'GM', 'GAMBIA', 'Gambia', 'GMB'),
	(79, 'GE', 'GEORGIA', 'Georgia', 'GEO'),
	(80, 'DE', 'GERMANY', 'Germany', 'DEU'),
	(81, 'GH', 'GHANA', 'Ghana', 'GHA'),
	(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB'),
	(83, 'GR', 'GREECE', 'Greece', 'GRC'),
	(84, 'GL', 'GREENLAND', 'Greenland', 'GRL'),
	(85, 'GD', 'GRENADA', 'Grenada', 'GRD'),
	(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP'),
	(87, 'GU', 'GUAM', 'Guam', 'GUM'),
	(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM'),
	(89, 'GN', 'GUINEA', 'Guinea', 'GIN'),
	(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB'),
	(91, 'GY', 'GUYANA', 'Guyana', 'GUY'),
	(92, 'HT', 'HAITI', 'Haiti', 'HTI'),
	(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL),
	(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT'),
	(95, 'HN', 'HONDURAS', 'Honduras', 'HND'),
	(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG'),
	(97, 'HU', 'HUNGARY', 'Hungary', 'HUN'),
	(98, 'IS', 'ICELAND', 'Iceland', 'ISL'),
	(99, 'IN', 'INDIA', 'India', 'IND'),
	(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN'),
	(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN'),
	(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ'),
	(103, 'IE', 'IRELAND', 'Ireland', 'IRL'),
	(104, 'IL', 'ISRAEL', 'Israel', 'ISR'),
	(105, 'IT', 'ITALY', 'Italy', 'ITA'),
	(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM'),
	(107, 'JP', 'JAPAN', 'Japan', 'JPN'),
	(108, 'JO', 'JORDAN', 'Jordan', 'JOR'),
	(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ'),
	(110, 'KE', 'KENYA', 'Kenya', 'KEN'),
	(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR'),
	(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK'),
	(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR'),
	(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT'),
	(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ'),
	(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO'),
	(117, 'LV', 'LATVIA', 'Latvia', 'LVA'),
	(118, 'LB', 'LEBANON', 'Lebanon', 'LBN'),
	(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO'),
	(120, 'LR', 'LIBERIA', 'Liberia', 'LBR'),
	(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY'),
	(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE'),
	(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU'),
	(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX'),
	(125, 'MO', 'MACAO', 'Macao', 'MAC'),
	(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD'),
	(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG'),
	(128, 'MW', 'MALAWI', 'Malawi', 'MWI'),
	(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS'),
	(130, 'MV', 'MALDIVES', 'Maldives', 'MDV'),
	(131, 'ML', 'MALI', 'Mali', 'MLI'),
	(132, 'MT', 'MALTA', 'Malta', 'MLT'),
	(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL'),
	(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ'),
	(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT'),
	(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS'),
	(137, 'YT', 'MAYOTTE', 'Mayotte', NULL),
	(138, 'MX', 'MEXICO', 'Mexico', 'MEX'),
	(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM'),
	(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA'),
	(141, 'MC', 'MONACO', 'Monaco', 'MCO'),
	(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG'),
	(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR'),
	(144, 'MA', 'MOROCCO', 'Morocco', 'MAR'),
	(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ'),
	(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR'),
	(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM'),
	(148, 'NR', 'NAURU', 'Nauru', 'NRU'),
	(149, 'NP', 'NEPAL', 'Nepal', 'NPL'),
	(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD'),
	(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT'),
	(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL'),
	(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL'),
	(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC'),
	(155, 'NE', 'NIGER', 'Niger', 'NER'),
	(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA'),
	(157, 'NU', 'NIUE', 'Niue', 'NIU'),
	(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK'),
	(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP'),
	(160, 'NO', 'NORWAY', 'Norway', 'NOR'),
	(161, 'OM', 'OMAN', 'Oman', 'OMN'),
	(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK'),
	(163, 'PW', 'PALAU', 'Palau', 'PLW'),
	(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL),
	(165, 'PA', 'PANAMA', 'Panama', 'PAN'),
	(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG'),
	(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY'),
	(168, 'PE', 'PERU', 'Peru', 'PER'),
	(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL'),
	(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN'),
	(171, 'PL', 'POLAND', 'Poland', 'POL'),
	(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT'),
	(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI'),
	(174, 'QA', 'QATAR', 'Qatar', 'QAT'),
	(175, 'RE', 'REUNION', 'Reunion', 'REU'),
	(176, 'RO', 'ROMANIA', 'Romania', 'ROM'),
	(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS'),
	(178, 'RW', 'RWANDA', 'Rwanda', 'RWA'),
	(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN'),
	(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA'),
	(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA'),
	(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM'),
	(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT'),
	(184, 'WS', 'SAMOA', 'Samoa', 'WSM'),
	(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR'),
	(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP'),
	(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU'),
	(188, 'SN', 'SENEGAL', 'Senegal', 'SEN'),
	(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL),
	(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC'),
	(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE'),
	(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP'),
	(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK'),
	(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN'),
	(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB'),
	(196, 'SO', 'SOMALIA', 'Somalia', 'SOM'),
	(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF'),
	(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL),
	(199, 'ES', 'SPAIN', 'Spain', 'ESP'),
	(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA'),
	(201, 'SD', 'SUDAN', 'Sudan', 'SDN'),
	(202, 'SR', 'SURINAME', 'Suriname', 'SUR'),
	(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM'),
	(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ'),
	(205, 'SE', 'SWEDEN', 'Sweden', 'SWE'),
	(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE'),
	(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR'),
	(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN'),
	(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK'),
	(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA'),
	(211, 'TH', 'THAILAND', 'Thailand', 'THA'),
	(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL),
	(213, 'TG', 'TOGO', 'Togo', 'TGO'),
	(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL'),
	(215, 'TO', 'TONGA', 'Tonga', 'TON'),
	(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO'),
	(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN'),
	(218, 'TR', 'TURKEY', 'Turkey', 'TUR'),
	(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM'),
	(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA'),
	(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV'),
	(222, 'UG', 'UGANDA', 'Uganda', 'UGA'),
	(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR'),
	(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE'),
	(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR'),
	(226, 'US', 'UNITED STATES', 'United States', 'USA'),
	(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL),
	(228, 'UY', 'URUGUAY', 'Uruguay', 'URY'),
	(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB'),
	(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT'),
	(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN'),
	(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM'),
	(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB'),
	(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR'),
	(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF'),
	(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH'),
	(237, 'YE', 'YEMEN', 'Yemen', 'YEM'),
	(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB'),
	(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;

-- Dumping structure for table swp.Game
CREATE TABLE IF NOT EXISTS `Game` (
  `GameID` int(11) NOT NULL,
  `Name` varchar(45) COLLATE utf8_bin NOT NULL,
  `URL` varchar(65) COLLATE utf8_bin NOT NULL,
  `Mindesteinsatz` float DEFAULT NULL,
  `Gewinn` float DEFAULT NULL,
  PRIMARY KEY(`GameID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table swp.Game: ~0 rows (approximately)
/*!40000 ALTER TABLE `Game` DISABLE KEYS */;
/*!40000 ALTER TABLE `Game` ENABLE KEYS */;

-- Dumping structure for table swp.PaymentHistory
CREATE TABLE IF NOT EXISTS `PaymentHistory` (
  `PaymentID` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` datetime(6) NOT NULL,
  `Betrag` float NOT NULL,
  `Typ` varchar(11) COLLATE utf8_bin NOT NULL,
  `UserID` int(11) NOT NULL,
  PRIMARY KEY(`PaymentID`),
  KEY `User` (`UserID`),
  CONSTRAINT `User` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`)
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

-- Dumping structure for table swp.PaymentMethod
CREATE TABLE IF NOT EXISTS `PaymentMethod` (
  `KartenId` int(11) NOT NULL AUTO_INCREMENT,
  `Kartennummer` int(11) NOT NULL,
  `Ablaufdatum` date NOT NULL,
  `CVV` int(11) NOT NULL,
  `Rechnungsadresse` varchar(45) COLLATE utf8_bin NOT NULL,
  `Rechnungsname` varchar(45) COLLATE utf8_bin NOT NULL,
  `Hinzufügedatum` date NOT NULL DEFAULT current_timestamp(),
  `UserID` int(11) NOT NULL,
  PRIMARY KEY (`KartenId`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `PaymentMethod_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table swp.PaymentMethod: ~0 rows (approximately)
/*!40000 ALTER TABLE `PaymentMethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `PaymentMethod` ENABLE KEYS */;

-- Dumping structure for table swp.User
CREATE TABLE IF NOT EXISTS `User` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `Vorname` varchar(45) COLLATE utf8_bin NOT NULL,
  `Nachname` varchar(45) COLLATE utf8_bin NOT NULL,
  `Username` varchar(45) COLLATE utf8_bin NOT NULL,
  `Kontostand` float NOT NULL,
  `Admin` tinyint(1) NOT NULL,
  `Email` varchar(45) COLLATE utf8_bin NOT NULL,
  `Passwort` varchar(45) COLLATE utf8_bin NOT NULL,
  `Addresse` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Stadt` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Land` int(11) DEFAULT NULL,
  `Gesperrt` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`UserID`),
  KEY `country` (`Land`),
  CONSTRAINT `country` FOREIGN KEY (`Land`) REFERENCES `Country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Dumping data for table swp.User: ~0 rows (approximately)
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` (`UserID`, `Vorname`, `Nachname`, `Username`, `Kontostand`, `Admin`, `Email`, `Passwort`, `Addresse`, `Stadt`, `Land`, `Gesperrt`) VALUES
	(1, 'safa', 'asdgasdg', 'Runda', 0, 1, 'tera@gmail.com', '1234', NULL, NULL, NULL, 0),
	(2, 'Max', 'Mustermann', 'AGER', 0, 0, 'test@gmail.com', '4567', 'Beskidenstrasse 2', 'Berlin', 80, 0),
	(3, 'Marie', 'Musterfrau', 'Maranne', 0, 0, 'test@test.com', '9345687', 'Beskidensrasse 1', 'Berlin', 80, 0),
	(5, 'huilsdfg', 'ysertuiop', 'GYHJK', 0, 0, 'shsdfgh', '9345687', NULL, NULL, NULL, 0),
	(6, 'asdfasf', 'qagerg', 'AGER', 0, 0, 'drghjkhjk', '4567', NULL, NULL, NULL, 0),
	(7, 'asdfasf', 'qagerg', 'AGER', 0, 0, 'drghjkhjk', '4567', NULL, NULL, NULL, 0),
	(8, 'huilsdfg', 'ysertuiop', 'GYHJK', 0, 0, 'shsdfgh', '9345687', NULL, NULL, NULL, 0),
	(9, 'asdfasf', 'qagerg', 'AGER', 0, 0, 'drghjkhjk', '4567', NULL, NULL, NULL, 0),
	(10, 'huilsdfg', 'ysertuiop', 'GYHJK', 0, 0, 'shsdfgh', '9345687', NULL, NULL, NULL, 0),
	(11, 'asdfasf', 'qagerg', 'AGER', 0, 0, 'drghjkhjk', '4567', NULL, NULL, NULL, 0),
	(12, 'asdfasf', 'qagerg', 'AGER', 0, 0, 'drghjkhjk', '4567', NULL, NULL, NULL, 0),
	(14, 'Deniz', 'Kaplan', 'denizk', 500, 1, 'denizkaplan@web.de', '1234pass', 'Coole StraÃŸe', 'Berlin', 80, 0);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
