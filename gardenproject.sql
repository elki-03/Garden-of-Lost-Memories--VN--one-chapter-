-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 17. Mrz 2025 um 19:37
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `gardenproject`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `charaktere`
--

CREATE TABLE `charaktere` (
  `charaktere_id` int(11) NOT NULL,
  `bildpfad` varchar(255) DEFAULT NULL,
  `bildname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `charaktere`
--

INSERT INTO `charaktere` (`charaktere_id`, `bildpfad`, `bildname`) VALUES
(1, 'charaktere\\kate_surprised.png', 'kate_surprised'),
(2, 'charaktere\\karrotina_side_toright_sepia.png', 'karrotina_side_toright_sepia'),
(3, 'charaktere\\skelett_goofy_sepia.png', 'skelett_goofy_sepia'),
(4, 'charaktere\\dummy.png', 'dummy'),
(5, 'charaktere\\littlekate_happy_sepia.png', 'littlekate_happy_sepia'),
(6, 'charaktere\\maus.png', 'maus'),
(7, 'charaktere\\mausright.png', 'maus'),
(8, 'charaktere\\hasi2right.png', 'hasi2right'),
(9, 'charaktere\\hasi2.png', 'hasi2'),
(10, 'charaktere\\hasimaus.png', 'hasimaus'),
(11, 'charaktere\\kate_aengstlich.png', 'kate_aengstlich'),
(12, 'charaktere\\kate_entsetzt.png', 'kate_entsetzt'),
(13, 'charaktere\\kate_nachdenklich.png', 'kate_nachdenklich'),
(14, 'charaktere\\kate_sauer.png', 'kate_sauer'),
(15, 'charaktere\\kate_sauer.png', 'kate_sauer'),
(16, 'charaktere\\kate_warmsmile.png', 'kate_warmsmile'),
(17, 'charaktere\\maeusekoenig_angreifend.png', 'maeusekoenig_angreifend'),
(18, 'charaktere\\maeusekoenig_after.png', 'maeusekoenig_after'),
(19, 'charaktere\\karrotina_sad.png', 'karrotina_sad'),
(20, 'charaktere\\karrotina_side_toleft.png', 'karrotina_side_toleft'),
(21, 'charaktere\\karrotina_side_toright.png', 'karrotina_side_toright'),
(22, 'charaktere\\karrotina_vornleft.png', 'karrotina_vornleft'),
(23, 'charaktere\\Kate-kaempfend.png', 'Kate-kaempfend'),
(24, 'charaktere\\hasimausright.png', 'hasimausright.\r\n                                                    '),
(25, 'charaktere\\katetakeshand.png', 'katetakeshand');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hg`
--

CREATE TABLE `hg` (
  `hg_id` int(11) NOT NULL,
  `hg_pfad` varchar(255) DEFAULT NULL,
  `hg_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `hg`
--

INSERT INTO `hg` (`hg_id`, `hg_pfad`, `hg_name`) VALUES
(1, 'hg/eingang.jpg', 'eingang'),
(2, 'hg/eingang_sepia.jpg', 'eingang_sepia'),
(3, 'hg/violetta.jpg', 'violetta'),
(4, 'hg/tor_kap1.jpg', 'eingang'),
(5, 'hg/bubblybluelightkate.jpg', 'bubblybluelightkate'),
(6, 'hg/bubblybluelight.jpg', 'bubblybluelight'),
(7, 'hg/roter_splitter.jpg', 'roter_splitter'),
(8, 'hg/katepfote.jpg', 'katepfote'),
(9, 'hg/lightning_violett.jpg', 'lightning_violett');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hgmusik`
--

CREATE TABLE `hgmusik` (
  `hgmusik_id` int(11) NOT NULL,
  `hgmusikpfad` varchar(255) DEFAULT NULL,
  `hgmusikname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `hgmusik`
--

INSERT INTO `hgmusik` (`hgmusik_id`, `hgmusikpfad`, `hgmusikname`) VALUES
(1, 'hgmusik\\Myuu-Daydream.mp3', 'Myuu-Daydream'),
(2, 'hgmusik\\JonnyEaston-Lovers.mp3', 'JonnyEaston-Lovers'),
(3, 'hgmusik\\Myuu-Hold-On.mp3', 'Myuu-Hold-On'),
(4, 'hgmusik\\Myuu-Final-Showdown.mp3', 'Myuu-Final-Showdown'),
(5, 'hgmusik\\JonnyEaston-Fantasy.mp3', 'JonnyEaston-Fantasy');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kapitel`
--

CREATE TABLE `kapitel` (
  `kapitel_id` int(11) NOT NULL,
  `kapitel` int(11) NOT NULL,
  `abschnitt` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kapitel`
--

INSERT INTO `kapitel` (`kapitel_id`, `kapitel`, `abschnitt`, `content`) VALUES
(1, 1, 1, 'Kapitel 1: Die Rückkehr in den Geheimen Garten'),
(2, 1, 2, 'Ein blühender Garten, Lichtung mit Wildblumen, eine alte Parkbank, hohe Bäume und dichte Büsche. KATE steht inmitten der Wildblumen, verwirrt und überrascht.'),
(3, 1, 3, 'KATE: (blickt sich um) Wo bin ich hier? Das ist doch... (erinnert sich) Das ist mein geheimer Garten... aber wie kann das sein?'),
(4, 1, 4, 'Sie geht langsam zur Parkbank und bleibt stehen, als Erinnerungen zurückkehren, die sie schon längst vergessen hatte.'),
(5, 1, 5, 'KATE: (lächelt) Herr Skelett, du hast immer so verrückte Geschichten erzählt. Und Karrotina... du hast mich immer zum Lachen gebracht.'),
(6, 1, 6, 'Ein leises Lachen und kindliche Stimmen sind in der Ferne zu hören.'),
(7, 1, 7, 'JUNGE KATE: (aus der Erinnerung) Herr Skelett, schau mal, ich habe ein neues Versteck gefunden!\r\nHERR SKELETT: (aus der Erinnerung) Großartig, kleine Kate! Lass es uns zusammen erkunden.'),
(8, 1, 8, 'KATE lächelt und schließt die Augen, um die Erinnerungen zu genießen.\r\nPlötzlich ertönt ein lauter Schrei.'),
(9, 1, 9, 'STIMME 1: Verräterin! Die Verräterin ist zurück!'),
(10, 1, 10, 'Kleine Kaninchen und Mäuse hatten sich zuvor auf KATE gestürzt, wütend und bedrohlich.'),
(11, 1, 11, 'KATE: (springt auf) Was... was wollt ihr von mir?'),
(12, 1, 12, 'Die kleinen Tiere greifen an, und KATE versucht, sich zu verteidigen. Plötzlich spürt sie eine Energie in ihren Händen. Mit einem konzentrierten Blick lässt sie eine schwache magische Aura entstehen, die die kleinen Angreifer zurückstößt.'),
(13, 1, 13, 'KATE: (überrascht) Was... was ist das?'),
(14, 1, 14, 'KATE erkennt, dass sie Magie besitzt, die nicht sehr stark, aber stark genug ist, um die Nager abzuwehren. Sie rennt die Wege entlang, immer weiter weg von der Parkbank, während sie immer wieder gegen die Angreifer kämpft.'),
(15, 1, 15, 'KATE: (keuchend) Ich muss weg von hier... aber wie komme ich zurück?'),
(16, 1, 16, 'Ein kleines Rudel Kaninchen und Mäuse umzingelt sie. KATE wehrt sich verzweifelt, nutzt ihre Magie, um die Tiere in Schach zu halten. Mit einem Stoß ihrer Hand schickt sie eine Gruppe Kaninchen zurück, doch die Mäuse greifen an und zwicken sie an den Beinen.'),
(17, 1, 17, 'KATE: (wütend) Lasst mich in Ruhe!'),
(18, 1, 18, 'Sie sammelt ihre Kraft und erzeugt eine magische Welle, die die Mäuse zurückwirft. Trotz ihrer Erschöpfung kämpft sie weiter, bis die Tiere schließlich zurückweichen.\r\nWährend sie tiefer in den Garten flieht, taucht plötzlich ein riesiger, schrecklicher Mäusekönig auf, wütend und bedrohlich'),
(19, 1, 19, 'MÄUSEKÖNIG: (zornig) Du wagst es, in unseren Garten zurückzukehren, Verräterin!\r\nKATE: (angsterfüllt) Ich... ich weiß nicht, wovon ihr redet!'),
(20, 1, 20, 'Der MÄUSEKÖNIG greift an, und ein heftiger Kampf entbrennt. KATE setzt all ihre magischen Kräfte ein, kämpft mit aller Kraft und schafft es schließlich mit größter Anstrengung, den Mäusekönig knapp zu besiegen. Während des Kampfes fällt ein großer Splitter eines roten Edelsteins aus dem Mäusekönig heraus.\r\nDer Mäusekönig stoppt plötzlich, als der Edelsteinsplitter den Boden berührt. Seine Augen werden klar, und er wirkt wieder bei Sinnen.'),
(21, 1, 21, 'MÄUSEKÖNIG: (verwirrt und erschöpft) Was... was ist geschehen? Der Zorn... er hat mich überwältigt.'),
(22, 1, 22, 'KATE beobachtet, wie sich der Mäusekönig beruhigt und seine Haltung verändert. Er richtet sich auf, blickt KATE tief in die Augen, in denen Enttäuschung und Schmerz zu sehen sind. Ohne ein Wort dreht er sich um und geht langsam davon, lässt KATE stehen.'),
(23, 1, 23, 'KATE: (leise und verwirrt) Was... was ist hier passiert?'),
(24, 1, 24, 'Ein Hasenmädchen erscheint.\r\nKATE: (keuchend) Wer bist du?'),
(25, 1, 25, 'KARROTINA: (sanft, aber entschlossen) Mein Name ist Karrotina. Komm, wir müssen reden.'),
(26, 1, 26, 'KATE ist verwirrt, aber sie fühlt eine Vertrautheit in Karrotinas sanfter Stimme und entschlossenen Blick.\r\nKATE: (verwirrt) Karrotina? Bist du es wirklich?'),
(27, 1, 27, 'KARROTINA: Ja, Kate. Viel hat sich verändert, seit du weg warst. Wir müssen reden. (reicht ihr eine Hand)'),
(28, 1, 28, 'KATE nimmt KARROTINAS Hand und steht auf.'),
(29, 1, 29, 'KATE: Was ist hier passiert?'),
(30, 1, 30, 'KARROTINA: (seufzt) Es ist eine lange Geschichte. Viele Dinge haben sich verändert, und nicht zum Guten. Aber der alte weise Baum, die Weide, kann dir alles erzählen. Komm, wir müssen zu ihr gehen.'),
(31, 1, 31, 'KARROTINA führt KATE zu einer Tür am Ende eines verschlungenen Pfades.'),
(32, 1, 32, 'KATE: (neugierig) Diese Tür... ich erinnere mich nicht daran.\r\nKARROTINA: (mit einem Lächeln) Es gibt viele Dinge, an die du dich nicht mehr erinnerst. Diese Tür führt zu den ältesten Teilen des Gartens. Dort finden wir die Weide.'),
(33, 1, 33, 'Sie erreichen die Tür, die in eine alte, mit Efeu bewachsene Mauer eingelassen ist. KARROTINA öffnet sie langsam.'),
(34, 1, 34, 'KARROTINA: (blickt zu KATE) Bist du bereit? KATE: (nickt) Ja, ich muss wissen, was geschehen ist.'),
(35, 1, 35, 'Sie treten gemeinsam durch die Tür, die sich hinter ihnen leise schließt.'),
(36, 1, 36, '~ Ende Kapitel 1 ~');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kapitel_charaktere`
--

CREATE TABLE `kapitel_charaktere` (
  `kapitel_charaktere_id` int(11) NOT NULL,
  `abschnitt` int(11) DEFAULT NULL,
  `charaktereID` int(11) DEFAULT NULL,
  `kapitelID` int(11) DEFAULT NULL,
  `kapitel` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kapitel_charaktere`
--

INSERT INTO `kapitel_charaktere` (`kapitel_charaktere_id`, `abschnitt`, `charaktereID`, `kapitelID`, `kapitel`) VALUES
(2, NULL, 1, 3, NULL),
(3, NULL, 2, 5, NULL),
(4, NULL, 5, 7, NULL),
(5, NULL, 4, 9, NULL),
(6, NULL, 11, 11, NULL),
(7, NULL, 4, 13, NULL),
(8, NULL, 11, 15, NULL),
(9, NULL, 24, 16, NULL),
(10, NULL, 15, 17, NULL),
(11, NULL, 11, 19, NULL),
(12, NULL, 4, 21, NULL),
(13, NULL, 13, 22, NULL),
(14, NULL, 13, 23, NULL),
(15, NULL, 12, 24, NULL),
(16, NULL, 4, 25, NULL),
(17, NULL, 1, 26, NULL),
(18, NULL, 4, 27, NULL),
(19, NULL, 25, 28, NULL),
(20, NULL, 1, 29, NULL),
(21, NULL, 4, 30, NULL),
(23, NULL, 25, 31, NULL),
(24, NULL, 13, 32, NULL),
(25, NULL, 13, 34, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kapitel_charaktere2`
--

CREATE TABLE `kapitel_charaktere2` (
  `kapitel_charaktere2_id` int(11) NOT NULL,
  `charaktereID` int(11) DEFAULT NULL,
  `kapitelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kapitel_charaktere2`
--

INSERT INTO `kapitel_charaktere2` (`kapitel_charaktere2_id`, `charaktereID`, `kapitelID`) VALUES
(1, 3, 5),
(4, 4, 3),
(5, 3, 7),
(6, 6, 9),
(7, 10, 11),
(8, 1, 13),
(9, 9, 15),
(12, 10, 16),
(13, 4, 17),
(14, 17, 19),
(15, 18, 21),
(16, 18, 22),
(17, 4, 23),
(18, 4, 24),
(19, 22, 25),
(20, 4, 26),
(21, 4, 26),
(22, 22, 27),
(23, 4, 28),
(24, 4, 29),
(25, 19, 30),
(26, 21, 31),
(27, 22, 32),
(28, 22, 34);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kapitel_hg`
--

CREATE TABLE `kapitel_hg` (
  `kapitel_hg_id` int(11) NOT NULL,
  `hgID` int(11) DEFAULT NULL,
  `kapitelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kapitel_hg`
--

INSERT INTO `kapitel_hg` (`kapitel_hg_id`, `hgID`, `kapitelID`) VALUES
(1, 1, 3),
(2, 2, 5),
(3, 2, 7),
(4, 2, 8),
(5, 1, 9),
(6, 1, 10),
(7, 1, 11),
(8, 3, 14),
(9, 3, 14),
(10, 3, 14),
(11, 3, 15),
(12, 3, 17),
(13, 9, 19),
(14, 3, 21),
(15, 3, 22),
(16, 3, 23),
(17, 3, 24),
(18, 3, 25),
(19, 3, 26),
(20, 3, 29),
(21, 3, 30),
(22, 4, 31),
(23, 4, 32),
(24, 4, 33),
(25, 4, 34),
(26, 4, 35),
(27, 5, 12),
(28, 6, 13),
(29, 7, 20),
(30, 1, 4),
(31, 9, 18),
(32, 2, 6),
(33, 8, 27),
(34, 8, 28);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kapitel_hgmusik`
--

CREATE TABLE `kapitel_hgmusik` (
  `kapitel_hgmusik_id` int(11) NOT NULL,
  `hgmusikID` int(11) DEFAULT NULL,
  `kapitelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `kapitel_hgmusik`
--

INSERT INTO `kapitel_hgmusik` (`kapitel_hgmusik_id`, `hgmusikID`, `kapitelID`) VALUES
(1, 2, 5),
(2, 2, 6),
(3, 2, 7),
(4, 2, 8),
(5, 3, 9),
(6, 3, 10),
(7, 3, 11),
(8, 3, 12),
(9, 3, 13),
(10, 3, 14),
(11, 3, 15),
(12, 3, 16),
(13, 3, 17),
(14, 4, 18),
(15, 4, 19),
(16, 4, 20),
(17, 5, 24),
(18, 5, 25),
(19, 5, 26),
(20, 5, 27),
(21, 5, 28),
(22, 5, 29),
(23, 5, 30),
(24, 5, 31),
(25, 5, 32),
(26, 5, 33),
(27, 5, 34),
(28, 5, 35);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `progress`
--

CREATE TABLE `progress` (
  `progress_id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `kapitel` int(255) NOT NULL,
  `abschnitt` int(255) NOT NULL,
  `aktuelle_textstelle` varchar(10) NOT NULL,
  `kapitelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `spielzeit`
--

CREATE TABLE `spielzeit` (
  `spielzeit_id` int(11) NOT NULL,
  `datumzeit_ein` datetime NOT NULL,
  `datumzeit_aus` datetime NOT NULL,
  `spieldauer` int(255) NOT NULL,
  `gesamtspieldauer` int(255) NOT NULL DEFAULT 0,
  `user_progressID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `spielzeit`
--

INSERT INTO `spielzeit` (`spielzeit_id`, `datumzeit_ein`, `datumzeit_aus`, `spieldauer`, `gesamtspieldauer`, `user_progressID`) VALUES
(12, '2024-07-15 13:43:53', '2024-07-15 16:01:40', 8267, 8267, 21),
(13, '2024-07-15 13:43:53', '2024-07-15 16:01:58', 8285, 16552, 21),
(14, '2024-07-15 13:43:53', '2024-07-15 16:29:37', 9944, 26496, 21),
(15, '2024-07-15 13:43:53', '2024-07-15 16:29:46', 9953, 36449, 21),
(16, '2024-07-15 18:33:46', '2024-07-15 18:34:20', 34, 36483, 21),
(17, '2024-07-15 18:33:46', '2024-07-15 18:34:28', 42, 36525, 21),
(18, '2024-07-15 18:33:46', '2024-07-15 18:34:46', 60, 36585, 21),
(19, '2024-07-15 18:33:46', '2024-07-15 18:34:50', 64, 36649, 21),
(20, '2024-07-15 18:33:46', '2024-07-15 18:35:12', 86, 36735, 21),
(21, '2024-07-15 18:33:46', '2024-07-15 18:35:15', 89, 36824, 21),
(22, '2024-07-15 18:33:46', '2024-07-15 18:35:26', 100, 36924, 21),
(23, '2024-07-15 18:33:46', '2024-07-15 18:35:28', 102, 37026, 21),
(27, '2024-07-16 12:02:51', '2024-07-16 12:02:53', 2, 2, 26),
(28, '2024-07-16 12:02:51', '2024-07-16 12:03:03', 12, 14, 26),
(29, '2024-07-16 12:09:49', '2024-07-16 12:09:51', 2, 2, 27),
(30, '2024-07-16 12:09:49', '2024-07-16 12:09:53', 4, 6, 27),
(31, '2024-07-16 12:34:24', '2024-07-16 12:34:29', 5, 5, 28),
(32, '2024-07-16 12:34:54', '2024-07-16 12:34:56', 2, 7, 28),
(33, '2024-07-16 12:34:54', '2024-07-16 12:41:06', 372, 379, 28),
(34, '2024-07-16 12:42:25', '2024-07-16 12:42:27', 2, 381, 28),
(35, '2024-07-16 15:29:10', '2024-07-16 15:29:14', 4, 4, 29),
(36, '2024-07-16 15:29:10', '2024-07-16 15:29:49', 39, 43, 29),
(37, '2024-07-16 19:55:44', '2024-07-16 19:57:33', 109, 123, 26),
(38, '2024-07-16 19:55:44', '2024-07-16 19:57:37', 113, 236, 26),
(39, '2024-07-16 19:55:44', '2024-07-16 19:57:39', 115, 351, 26),
(40, '2024-07-16 20:57:41', '2024-07-16 21:09:18', 697, 1048, 26),
(41, '2024-07-16 20:57:41', '2024-07-16 21:09:22', 701, 1749, 26),
(42, '2024-07-16 22:48:01', '2024-07-16 22:48:03', 2, 1751, 26),
(43, '2024-07-16 22:48:01', '2024-07-16 22:48:12', 11, 1762, 26),
(44, '2024-07-16 23:17:20', '2024-07-16 23:17:23', 3, 1765, 26),
(45, '2024-07-16 23:17:20', '2024-07-16 23:17:26', 6, 1771, 26),
(46, '2024-07-17 09:49:09', '2024-07-17 09:49:19', 10, 1781, 26),
(47, '2024-07-17 09:49:09', '2024-07-17 09:49:22', 13, 1794, 26),
(48, '2024-07-17 10:13:54', '2024-07-17 10:14:01', 7, 1801, 26),
(49, '2024-07-17 10:13:54', '2024-07-17 10:14:02', 8, 1809, 26),
(50, '2024-07-17 10:13:54', '2024-07-17 10:14:04', 10, 1819, 26),
(51, '2024-07-17 10:34:38', '2024-07-17 10:34:43', 5, 1824, 26),
(52, '2024-07-17 10:34:38', '2024-07-17 10:34:44', 6, 1830, 26),
(53, '2024-07-17 10:35:40', '2024-07-17 10:36:28', 48, 1878, 26),
(54, '2024-07-17 10:35:40', '2024-07-17 10:36:30', 50, 1928, 26),
(55, '2024-07-17 10:40:20', '2024-07-17 10:40:22', 2, 1930, 26),
(56, '2024-07-17 10:40:20', '2024-07-17 10:40:24', 4, 1934, 26),
(57, '2024-07-17 10:48:06', '2024-07-17 10:48:08', 2, 1936, 26),
(58, '2024-07-17 10:48:06', '2024-07-17 10:48:09', 3, 1939, 26),
(59, '2024-07-17 10:48:24', '2024-07-17 10:48:25', 1, 1940, 26),
(60, '2024-07-17 10:48:24', '2024-07-17 10:48:47', 23, 1963, 26),
(61, '2024-07-17 10:48:55', '2024-07-17 10:48:57', 2, 1965, 26),
(62, '2024-07-17 10:48:55', '2024-07-17 10:48:59', 4, 1969, 26),
(63, '2024-07-17 10:49:55', '2024-07-17 10:49:56', 1, 1970, 26),
(64, '2024-07-17 10:49:55', '2024-07-17 10:49:59', 4, 1974, 26),
(65, '2024-07-17 10:50:09', '2024-07-17 10:50:14', 5, 1979, 26),
(66, '2024-07-17 10:50:09', '2024-07-17 10:50:16', 7, 1986, 26),
(67, '2024-07-17 10:50:28', '2024-07-17 10:50:30', 2, 1988, 26),
(68, '2024-07-17 10:50:28', '2024-07-17 10:50:34', 6, 1994, 26),
(69, '2024-07-17 10:50:46', '2024-07-17 10:52:01', 75, 2069, 26),
(70, '2024-07-17 10:50:46', '2024-07-17 10:52:04', 78, 2147, 26),
(71, '2024-07-17 10:58:44', '2024-07-17 10:58:46', 2, 2149, 26),
(72, '2024-07-17 10:58:44', '2024-07-17 10:58:47', 3, 2152, 26),
(73, '2024-07-17 10:59:02', '2024-07-17 10:59:19', 17, 2169, 26),
(74, '2024-07-17 10:59:02', '2024-07-17 10:59:20', 18, 2187, 26),
(75, '2024-07-17 10:59:27', '2024-07-17 10:59:30', 3, 2190, 26),
(76, '2024-07-17 10:59:27', '2024-07-17 10:59:31', 4, 2194, 26),
(77, '2024-07-17 11:39:27', '2024-07-17 11:43:04', 217, 2411, 26),
(78, '2024-07-17 11:39:27', '2024-07-17 11:43:05', 218, 2629, 26),
(79, '2024-07-17 11:43:48', '2024-07-17 11:43:51', 3, 2632, 26),
(80, '2024-07-17 11:43:48', '2024-07-17 11:43:53', 5, 2637, 26),
(81, '2024-07-17 11:44:33', '2024-07-17 11:44:35', 2, 2639, 26),
(82, '2024-07-17 11:44:33', '2024-07-17 11:44:36', 3, 2642, 26),
(83, '2024-07-17 11:49:38', '2024-07-17 11:49:44', 6, 2648, 26),
(84, '2024-07-17 11:50:18', '2024-07-17 11:50:19', 1, 2649, 26),
(85, '2024-07-17 11:57:05', '2024-07-17 11:57:10', 5, 2654, 26),
(86, '2024-07-17 11:57:05', '2024-07-17 11:57:11', 6, 2660, 26),
(87, '2024-07-17 12:14:17', '2024-07-17 12:14:21', 4, 2664, 26),
(88, '2024-07-17 12:14:17', '2024-07-17 12:14:23', 6, 2670, 26),
(89, '2024-07-17 12:15:49', '2024-07-17 12:15:51', 2, 2672, 26),
(90, '2024-07-17 12:16:27', '2024-07-17 12:16:29', 2, 2674, 26),
(91, '2024-07-17 12:37:58', '2024-07-17 12:37:59', 1, 2675, 26),
(92, '2024-07-17 12:38:34', '2024-07-17 12:38:36', 2, 2677, 26),
(93, '2024-07-17 12:40:06', '2024-07-17 12:40:08', 2, 2679, 26),
(94, '2024-07-17 12:41:41', '2024-07-17 12:41:43', 2, 2681, 26),
(95, '2024-07-17 13:03:14', '2024-07-17 13:03:15', 1, 2682, 26),
(96, '2024-07-17 13:03:14', '2024-07-17 13:03:24', 10, 2692, 26),
(97, '2024-07-17 13:03:14', '2024-07-17 13:03:26', 12, 2704, 26),
(98, '2024-07-17 13:08:45', '2024-07-17 13:08:47', 2, 2706, 26),
(99, '2024-07-17 13:08:55', '2024-07-17 13:09:39', 44, 2750, 26),
(100, '2024-07-17 13:09:50', '2024-07-17 13:40:16', 1826, 4576, 26),
(101, '2024-07-17 13:42:25', '2024-07-17 13:43:11', 46, 4622, 26),
(102, '2024-07-17 13:43:16', '2024-07-17 13:44:25', 69, 4691, 26),
(103, '2024-07-17 13:45:43', '2024-07-17 13:45:51', 8, 4699, 26),
(104, '2024-07-17 13:48:23', '2024-07-17 13:50:38', 135, 4834, 26),
(105, '2024-07-17 13:50:48', '2024-07-17 13:51:48', 60, 4894, 26),
(106, '2024-07-17 17:04:46', '2024-07-17 17:04:56', 10, 4904, 26),
(107, '2024-07-17 17:36:29', '2024-07-17 17:37:46', 77, 4981, 26),
(108, '2024-07-17 17:40:03', '2024-07-17 17:40:24', 21, 5002, 26),
(109, '2024-07-17 17:41:01', '2024-07-17 17:41:59', 58, 5060, 26),
(110, '2024-07-18 09:19:35', '2024-07-18 09:19:37', 2, 5062, 26),
(111, '2024-07-18 09:20:17', '2024-07-18 09:20:47', 30, 5092, 26),
(112, '2024-07-18 09:23:25', '2024-07-18 09:30:40', 435, 5527, 26),
(113, '2024-07-18 09:30:56', '2024-07-18 09:30:57', 1, 5528, 26),
(114, '2024-07-18 09:31:08', '2024-07-18 09:31:14', 6, 5534, 26),
(115, '2024-07-18 09:32:55', '2024-07-18 09:32:58', 3, 37029, 21),
(116, '2024-07-18 10:00:49', '2024-07-18 10:00:50', 1, 5535, 26),
(117, '2024-07-18 10:00:55', '2024-07-18 10:00:57', 2, 5537, 26),
(118, '2024-07-18 10:07:12', '2024-07-18 10:07:14', 2, 5539, 26),
(119, '2024-07-18 10:08:29', '2024-07-18 10:08:56', 27, 5566, 26),
(120, '2024-07-18 10:09:16', '2024-07-18 10:09:18', 2, 37031, 21),
(121, '2024-07-18 10:16:26', '2024-07-18 10:16:28', 2, 5568, 26),
(122, '2024-07-18 10:24:33', '2024-07-18 10:24:34', 1, 5569, 26),
(123, '2024-07-18 10:34:30', '2024-07-18 10:34:32', 2, 5571, 26),
(124, '2024-07-18 10:34:48', '2024-07-18 10:38:08', 200, 5771, 26),
(125, '2024-07-18 10:40:00', '2024-07-18 10:40:01', 1, 5772, 26),
(126, '2024-07-18 10:40:05', '2024-07-18 10:40:07', 2, 5774, 26),
(127, '2024-07-18 10:47:20', '2024-07-18 10:47:28', 8, 5782, 26),
(128, '2024-07-18 10:50:05', '2024-07-18 10:50:15', 10, 5792, 26),
(129, '2024-07-18 10:50:35', '2024-07-18 10:50:49', 14, 5806, 26),
(130, '2024-07-18 10:59:01', '2024-07-18 10:59:24', 23, 37054, 21),
(131, '2024-07-18 11:24:54', '2024-07-18 11:24:56', 2, 5808, 26),
(132, '2024-07-18 11:28:52', '2024-07-18 11:28:53', 1, 37055, 21),
(133, '2024-07-18 11:32:52', '2024-07-18 11:32:53', 1, 1, 24),
(134, '2024-07-18 11:47:25', '2024-07-18 11:47:27', 2, 5810, 26),
(135, '2024-07-18 12:10:26', '2024-07-18 12:10:29', 3, 5813, 26),
(136, '2024-07-18 12:52:20', '2024-07-18 12:52:25', 5, 5818, 26),
(137, '2024-07-18 13:05:22', '2024-07-18 13:06:49', 87, 93, 27),
(138, '2024-07-18 13:06:54', '2024-07-18 13:06:58', 4, 97, 27),
(139, '2024-07-18 13:08:42', '2024-07-18 13:09:52', 70, 5888, 26),
(140, '2024-07-18 13:13:41', '2024-07-18 13:13:42', 1, 5889, 26),
(141, '2024-07-18 13:15:17', '2024-07-18 13:15:19', 2, 5891, 26),
(142, '2024-07-18 13:15:25', '2024-07-18 13:15:33', 8, 5899, 26),
(143, '2024-07-18 13:37:59', '2024-07-18 13:38:32', 33, 37088, 21),
(144, '2024-07-18 13:51:26', '2024-07-18 13:54:10', 164, 6063, 26),
(145, '2024-07-18 15:28:27', '2024-07-18 15:29:20', 53, 6116, 26),
(146, '2024-07-18 15:29:24', '2024-07-18 15:29:38', 14, 6130, 26),
(147, '2024-07-18 15:45:40', '2024-07-18 15:45:42', 2, 2, 30),
(148, '2024-07-18 15:45:57', '2024-07-18 15:46:13', 16, 18, 30),
(149, '2024-07-18 15:46:29', '2024-07-18 15:48:11', 102, 120, 30),
(150, '2024-07-18 15:48:22', '2024-07-18 15:49:09', 47, 167, 30),
(151, '2024-07-18 15:50:25', '2024-07-18 15:50:26', 1, 168, 30),
(152, '2024-07-18 15:56:55', '2024-07-18 15:57:00', 5, 6135, 26),
(153, '2024-07-18 15:56:55', '2024-07-18 15:57:01', 6, 6141, 26),
(154, '2024-07-18 15:56:55', '2024-07-18 15:57:03', 8, 6149, 26),
(155, '2024-07-18 15:59:41', '2024-07-18 15:59:42', 1, 6150, 26),
(156, '2024-07-18 16:13:00', '2024-07-18 16:13:02', 2, 6152, 26),
(157, '2024-07-18 16:13:09', '2024-07-18 16:17:37', 268, 6420, 26),
(158, '2024-07-18 21:52:06', '2024-07-18 22:02:39', 633, 7053, 26),
(159, '2024-07-18 22:03:45', '2024-07-18 22:06:05', 140, 7193, 26),
(160, '2024-07-18 22:08:19', '2024-07-18 22:10:53', 154, 7347, 26),
(161, '2024-07-18 22:11:50', '2024-07-18 22:11:57', 7, 7354, 26),
(162, '2024-07-18 22:11:50', '2024-07-18 22:11:58', 8, 7362, 26),
(163, '2024-07-18 22:11:50', '2024-07-18 22:12:00', 10, 7372, 26),
(164, '2024-07-18 22:15:05', '2024-07-18 22:19:11', 246, 7618, 26),
(165, '2024-07-18 22:19:40', '2024-07-18 22:20:36', 56, 7674, 26),
(166, '2024-07-18 22:22:50', '2024-07-18 22:22:53', 3, 7677, 26),
(167, '2024-07-18 22:24:55', '2024-07-18 22:27:56', 181, 7858, 26),
(168, '2024-07-18 22:37:20', '2024-07-18 22:40:12', 172, 8030, 26),
(169, '2024-07-18 22:41:38', '2024-07-18 22:41:41', 3, 8033, 26),
(170, '2024-07-18 22:41:45', '2024-07-18 22:41:47', 2, 8035, 26),
(171, '2024-07-18 22:42:07', '2024-07-18 22:42:44', 37, 8072, 26),
(172, '2024-07-18 22:42:55', '2024-07-18 22:42:55', 0, 8072, 26),
(173, '2024-07-18 22:43:29', '2024-07-18 22:43:50', 21, 8093, 26),
(174, '2024-07-18 22:47:27', '2024-07-18 22:48:16', 49, 8142, 26),
(175, '2024-07-18 22:52:04', '2024-07-18 22:54:09', 125, 8267, 26),
(176, '2024-07-18 23:01:23', '2024-07-18 23:28:48', 1645, 9912, 26),
(177, '2024-07-18 23:40:18', '2024-07-18 23:40:20', 2, 9914, 26),
(178, '2024-07-18 23:40:25', '2024-07-18 23:40:26', 1, 9915, 26),
(179, '2024-07-19 00:48:11', '2024-07-19 00:48:13', 2, 9917, 26),
(180, '2024-07-19 01:17:45', '2024-07-19 01:22:06', 261, 10178, 26),
(181, '2024-07-19 01:23:17', '2024-07-19 01:23:20', 3, 10181, 26),
(182, '2024-07-19 02:20:37', '2024-07-19 02:20:39', 2, 10183, 26),
(183, '2024-07-19 02:21:49', '2024-07-19 02:22:49', 60, 10243, 26),
(184, '2024-07-19 02:23:07', '2024-07-19 02:23:47', 40, 10283, 26),
(185, '2024-07-19 02:24:54', '2024-07-19 02:24:55', 1, 10284, 26),
(186, '2024-07-19 02:26:12', '2024-07-19 02:26:13', 1, 10285, 26),
(187, '2024-07-19 03:00:29', '2024-07-19 03:17:49', 1040, 11325, 26),
(188, '2024-07-19 03:22:01', '2024-07-19 03:23:38', 97, 11422, 26),
(189, '2024-07-19 03:58:35', '2024-07-19 03:58:41', 6, 11428, 26),
(190, '2024-07-19 04:02:42', '2024-07-19 04:02:48', 6, 11434, 26),
(191, '2024-07-19 04:02:58', '2024-07-19 04:04:04', 66, 11500, 26),
(192, '2024-07-19 04:52:56', '2024-07-19 04:52:57', 1, 37089, 21),
(193, '2024-07-19 04:53:00', '2024-07-19 04:53:08', 8, 37097, 21),
(194, '2024-07-19 06:02:52', '2024-07-19 06:02:53', 1, 11501, 26),
(195, '2024-07-19 06:07:13', '2024-07-19 06:07:15', 2, 11503, 26),
(196, '2024-07-19 06:07:13', '2024-07-19 06:07:29', 16, 11519, 26),
(197, '2024-07-19 06:12:57', '2024-07-19 06:13:00', 3, 11522, 26),
(198, '2024-07-19 06:12:57', '2024-07-19 06:13:04', 7, 11529, 26),
(199, '2024-07-19 06:18:40', '2024-07-19 06:18:44', 4, 11533, 26),
(200, '2024-07-19 06:18:40', '2024-07-19 06:18:58', 18, 11551, 26),
(201, '2024-07-19 06:21:15', '2024-07-19 06:21:18', 3, 11554, 26),
(202, '2024-07-19 06:21:15', '2024-07-19 06:21:21', 6, 11560, 26),
(203, '2024-07-19 06:21:32', '2024-07-19 06:21:36', 4, 11564, 26),
(204, '2024-07-19 08:41:43', '2024-07-19 08:41:50', 7, 7, 31),
(205, '2024-07-19 08:41:43', '2024-07-19 08:42:00', 17, 24, 31),
(206, '2024-07-19 09:08:30', '2024-07-19 09:08:33', 3, 37100, 21),
(207, '2024-07-19 09:08:30', '2024-07-19 09:08:35', 5, 37105, 21),
(208, '2024-07-19 11:45:32', '2024-07-19 11:46:22', 50, 50, 32),
(209, '2024-07-19 11:45:32', '2024-07-19 11:46:29', 57, 107, 32),
(210, '2024-07-19 14:58:48', '2024-07-19 14:58:51', 3, 3, 33),
(211, '2024-07-19 14:58:58', '2024-07-19 14:58:59', 1, 4, 33),
(212, '2024-07-19 15:04:05', '2024-07-19 15:04:11', 6, 10, 33),
(213, '2024-07-19 15:04:05', '2024-07-19 15:05:20', 75, 85, 33),
(214, '2024-07-20 07:49:21', '2024-07-20 07:49:26', 5, 11569, 26),
(215, '2024-07-20 07:49:21', '2024-07-20 07:49:35', 14, 11583, 26),
(216, '2024-07-20 07:50:27', '2024-07-20 07:54:48', 261, 11844, 26),
(217, '2024-07-20 07:57:30', '2024-07-20 07:57:33', 3, 4, 24),
(218, '2024-07-20 07:57:30', '2024-07-20 07:57:35', 5, 9, 24),
(219, '2024-07-20 07:59:37', '2024-07-20 07:59:49', 12, 21, 24),
(220, '2024-07-20 07:59:37', '2024-07-20 07:59:56', 19, 40, 24),
(221, '2024-07-20 08:00:02', '2024-07-20 08:00:04', 2, 42, 24),
(222, '2024-07-20 08:00:02', '2024-07-20 08:00:06', 4, 46, 24),
(223, '2024-07-25 23:58:23', '2024-07-25 23:58:30', 7, 11851, 26),
(224, '2024-07-26 00:15:26', '2024-07-26 00:15:29', 3, 11854, 26),
(225, '2024-07-26 00:15:26', '2024-07-26 00:16:18', 52, 11906, 26),
(226, '2024-07-26 00:21:20', '2024-07-26 00:21:22', 2, 11908, 26),
(227, '2024-07-26 00:21:53', '2024-07-26 00:21:56', 3, 11911, 26),
(228, '2024-07-26 00:21:53', '2024-07-26 00:21:58', 5, 11916, 26),
(229, '2024-07-26 00:25:36', '2024-07-26 00:25:38', 2, 11918, 26),
(230, '2024-07-26 00:27:03', '2024-07-26 00:27:05', 2, 11920, 26),
(231, '2024-07-26 00:28:46', '2024-07-26 00:28:48', 2, 11922, 26),
(232, '2024-07-26 00:29:18', '2024-07-26 00:29:20', 2, 11924, 26),
(233, '2024-07-26 00:29:58', '2024-07-26 00:30:00', 2, 11926, 26),
(234, '2024-07-26 01:00:13', '2024-07-26 01:00:15', 2, 37107, 21),
(235, '2024-07-26 01:09:02', '2024-07-26 01:09:04', 2, 37109, 21),
(236, '2024-07-26 01:09:02', '2024-07-26 01:09:07', 5, 37114, 21),
(237, '2024-07-26 01:42:02', '2024-07-26 01:42:06', 4, 11930, 26),
(238, '2024-07-26 01:42:02', '2024-07-26 01:42:36', 34, 11964, 26),
(239, '2024-07-26 10:24:24', '2024-07-26 10:24:52', 28, 28, 34),
(240, '2024-07-26 10:24:24', '2024-07-26 10:25:04', 40, 68, 34),
(241, '2024-07-27 16:58:21', '2024-07-27 16:58:24', 3, 3, 35),
(242, '2024-07-27 16:58:21', '2024-07-27 16:58:41', 20, 23, 35),
(243, '2024-07-27 17:00:37', '2024-07-27 17:00:39', 2, 25, 35),
(244, '2024-08-01 18:13:30', '2024-08-01 18:13:33', 3, 3, 36),
(245, '2024-08-01 18:13:30', '2024-08-01 18:13:43', 13, 16, 36),
(246, '2024-08-04 16:50:14', '2024-08-04 16:50:22', 8, 8, 37),
(247, '2024-08-04 16:50:14', '2024-08-04 16:50:50', 36, 44, 37),
(248, '2024-11-26 19:07:19', '2024-11-26 19:07:22', 3, 11967, 26),
(249, '2024-11-26 19:07:19', '2024-11-26 19:07:25', 6, 11973, 26),
(250, '2024-12-11 18:01:25', '2024-12-11 18:01:26', 1, 11974, 26),
(251, '2024-12-11 18:01:25', '2024-12-11 18:01:28', 3, 11977, 26),
(252, '2024-12-11 18:08:32', '2024-12-11 18:08:34', 2, 2, 38),
(253, '2024-12-18 15:28:36', '2024-12-18 15:28:40', 4, 101, 27),
(254, '2024-12-18 15:28:36', '2024-12-18 15:28:41', 5, 106, 27),
(255, '2024-12-18 15:28:47', '2024-12-18 15:28:49', 2, 108, 27),
(256, '2025-01-16 15:11:31', '2025-01-16 15:11:32', 1, 11978, 26),
(257, '2025-01-16 15:11:31', '2025-01-16 15:11:37', 6, 11984, 26),
(258, '2025-01-16 15:12:38', '2025-01-16 15:12:41', 3, 11987, 26),
(259, '2025-01-21 08:43:50', '2025-01-21 08:43:53', 3, 3, 39),
(260, '2025-01-21 08:43:50', '2025-01-21 08:43:54', 4, 7, 39),
(261, '2025-01-21 08:44:09', '2025-01-21 08:44:11', 2, 9, 39),
(262, '2025-02-14 10:52:15', '2025-02-14 10:52:34', 19, 12006, 26),
(263, '2025-02-14 10:56:34', '2025-02-14 10:56:37', 3, 12009, 26),
(264, '2025-02-14 10:56:50', '2025-02-14 10:56:52', 2, 12011, 26),
(265, '2025-02-14 10:56:58', '2025-02-14 10:56:59', 1, 12012, 26),
(266, '2025-02-14 10:56:58', '2025-02-14 10:57:05', 7, 12019, 26);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `passwort` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `username`, `passwort`) VALUES
(4, 'felidae', '$2y$10$goK0OQuM53Fxqe4vBzUuRellT0mu/1KXPuLUdFU0sDOR4GwXrjmba'),
(5, 'xyz', '$2y$10$dAoSwaKSwGiIrN2YrrjRo.vdRLF9SJcOjajHRaw3AWuW4DogIOdjW'),
(6, 'hi', '$2y$10$YADltsrBTkV6cgPRF5wZ4OlkCn.QBBE8bz4hnj9JxzIzS0yHbXpny'),
(8, 'qwe', '$2y$10$krfcM5cA5dznCem1YrdN0e1IxCUx0cro9xu3Cg8DBjlzExZftlyZ.'),
(9, 'a', '$2y$10$q1oRCekXro/cmznUvXbWBe01kMnr.S35drGULbkIuU1.q2FG/ag1q'),
(10, 'b', '$2y$10$YiIiL/pdHvGrYXQaQo2kLelKz8bHnbQZLvyk3GaH00tWnCms1B/Yy'),
(11, 'c', '$2y$10$JdgLOlkINs54eMjGN3ebP.HwMSXXx4lXbOqVDbc4ppgJBqhEr8xK2'),
(13, 'd', '$2y$10$PtoCNYXwIYGKsCWiOW4d9eQVmX4zDPRP5uQ7Sz7ZwhW6JlPnyRGxy'),
(15, 'e', '$2y$10$v.zscEE0.vy2BdyIpn2aGOM/AK.QRA5L.Qee2lyyB/QuCC0H.FDfS'),
(16, 'f', '$2y$10$UE3QAskC.8YSJ1udN/XzIemA0LPhnpOeAt4Y9wI5oVybedexOleOK'),
(17, 'h', '$2y$10$zJ7dCUAwxVmgcqhKypqjQee/ofo.RnvLiWu.upjORqnhQOUJEb3pC'),
(18, 'm', '$2y$10$9cx66Z9Afpg5xCg4hVaqsujTivcU2DFrDXDhFpkld4s/AP67WLcTC'),
(19, 'marco', '$2y$10$JHGcEj/o0kiz7CoIJjC2Gu/OrbX/uow9K0IB8tf4tEMuumA0Ddsp.'),
(20, 'u', '$2y$10$3QaJ0.8GQdULKzU.vGBxkOLkJkBQEe/TqjSNCTV1VSrf5r1muzaAW'),
(22, 'n', '$2y$10$3I1Dfo93aHyiQnv9gpWyA.prGIrqqeo7gvQxpEfby21V/.f7mAsoG'),
(24, 'Bülent', '$2y$10$Ebn2sqclO63QQubZm1YQsuK.TvjiOjBpDOX3Rj5zmru23ROkH7iXW'),
(25, 'lars', '$2y$10$rcevma9shEYSAyqtMaVk6ehfUXPuxGdAWEtwjuXmH6NBG5h85XhVK'),
(26, 'elk', '$2y$10$GOsON8y4jv8QT1eBLb1ReOAT5.iFFa92DEzDyFl4BYJSi0CppliKO'),
(27, 'jamal', '$2y$10$D4LlrsH6720NY.wJ16m09um6werscZef50wnY3SWO58/Dg/qmtm5y'),
(28, 'Clara', '$2y$10$ceqHfekQwAJesc3dwc/da.ce8rVpINA97m.TcGLitp1n6CwOz3U5K'),
(29, 'abcdefg', '$2y$10$ZbtHHv5VTmNRgEpT9yEEAOziWXVHHstBb1GqMdCbNEK1NVIRmEhSO'),
(30, 'taxido', '$2y$10$D5fW3a9nt.T9vfzgzUYisuPg5YuCEtzF9ikrhNNFniuJcXlesTsN2'),
(31, 'MatthiasMai', '$2y$10$KKu5UWwZi.dUBVplfb0RneH7Q/cKV5AZO98s.4R4JCb7bUBE3iX/i'),
(32, 'Gaby', '$2y$10$IPK0ISkTa5WfcwX3ME7NcOJ1MefurZ082nlMATNwRPsVBxp7KzWk.'),
(33, 'Aline Leng', '$2y$10$WU8QnZaOMYTw2bwCwVn9mesX1DX7SlsEkqGIehvVU55KdwUWm4/P2'),
(34, 'Ach', '$2y$10$MlL2rfGKSBwnotrW3sqy6.fXrmfIooqvTgHDIIHfrs23FyuKIawl6'),
(35, 'Mapa', '$2y$10$2m08Bsuya37pz36WHpom6ehKaXK2aa5I/4t41ERA04jsaDv6iDBbG'),
(36, 'Sascha', '$2y$10$ShZ6NzA5/Hc9lHl29buCHOTg1HqkCJ2GxZzSwBLD.8YCtaYpsDDWC'),
(37, 'Rumpelstielzchen', '$2y$10$xHlbJr5UVz9Om4/Vf8Tbt./Q7AqEWLIYvWlT1wQga1xxDaEhoEUzu'),
(38, 'blah', '$2y$10$kW5h8/R32hRDU9QBOx4XY.4I/XIhqWQPt5zTQzB5N5PiTepOlRL7W'),
(39, 'fcf', '$2y$10$O3hqhqo83rLeu5ScHo1tDuL1lVG7i5dFM3nYTum69/k0VeIl1fvE.');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_progress`
--

CREATE TABLE `user_progress` (
  `user_progress_id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `gespeicherte_textstelle` varchar(255) NOT NULL,
  `kapitelID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `user_progress`
--

INSERT INTO `user_progress` (`user_progress_id`, `userID`, `gespeicherte_textstelle`, `kapitelID`) VALUES
(21, 8, '1_32', 32),
(24, 9, '1_19', 19),
(25, 25, '1_16', 16),
(26, 26, '1_1', 1),
(27, 4, '1_32', 32),
(28, 27, '1_5', 5),
(29, 28, '1_12', 12),
(30, 18, '1_1', NULL),
(31, 30, '1_19', 19),
(32, 31, '1_10', 10),
(33, 19, '1_15', 15),
(34, 32, '1_20', 20),
(35, 33, '1_4', 4),
(36, 34, '1_34', 34),
(37, 35, '1_8', 8),
(38, 38, '1_35', NULL),
(39, 39, '1_19', 19);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `charaktere`
--
ALTER TABLE `charaktere`
  ADD PRIMARY KEY (`charaktere_id`);

--
-- Indizes für die Tabelle `hg`
--
ALTER TABLE `hg`
  ADD PRIMARY KEY (`hg_id`);

--
-- Indizes für die Tabelle `hgmusik`
--
ALTER TABLE `hgmusik`
  ADD PRIMARY KEY (`hgmusik_id`);

--
-- Indizes für die Tabelle `kapitel`
--
ALTER TABLE `kapitel`
  ADD PRIMARY KEY (`kapitel_id`);

--
-- Indizes für die Tabelle `kapitel_charaktere`
--
ALTER TABLE `kapitel_charaktere`
  ADD PRIMARY KEY (`kapitel_charaktere_id`),
  ADD KEY `charaktereID` (`charaktereID`),
  ADD KEY `kapitelID` (`kapitelID`);

--
-- Indizes für die Tabelle `kapitel_charaktere2`
--
ALTER TABLE `kapitel_charaktere2`
  ADD PRIMARY KEY (`kapitel_charaktere2_id`),
  ADD KEY `charaktereID` (`charaktereID`),
  ADD KEY `kapitelID` (`kapitelID`);

--
-- Indizes für die Tabelle `kapitel_hg`
--
ALTER TABLE `kapitel_hg`
  ADD PRIMARY KEY (`kapitel_hg_id`),
  ADD KEY `hgID` (`hgID`),
  ADD KEY `kapitelID` (`kapitelID`);

--
-- Indizes für die Tabelle `kapitel_hgmusik`
--
ALTER TABLE `kapitel_hgmusik`
  ADD PRIMARY KEY (`kapitel_hgmusik_id`),
  ADD KEY `hgmusikID` (`hgmusikID`),
  ADD KEY `kapitelID` (`kapitelID`);

--
-- Indizes für die Tabelle `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`progress_id`),
  ADD UNIQUE KEY `progress_id` (`progress_id`),
  ADD UNIQUE KEY `userID` (`userID`),
  ADD KEY `FK_kapitelprogress` (`kapitelID`);

--
-- Indizes für die Tabelle `spielzeit`
--
ALTER TABLE `spielzeit`
  ADD PRIMARY KEY (`spielzeit_id`),
  ADD UNIQUE KEY `spielzeit_id` (`spielzeit_id`),
  ADD KEY `FK_spielzeituser_progress` (`user_progressID`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indizes für die Tabelle `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`user_progress_id`),
  ADD KEY `kapitelID` (`kapitelID`),
  ADD KEY `FK_useruserprogress` (`userID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `charaktere`
--
ALTER TABLE `charaktere`
  MODIFY `charaktere_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT für Tabelle `hg`
--
ALTER TABLE `hg`
  MODIFY `hg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `hgmusik`
--
ALTER TABLE `hgmusik`
  MODIFY `hgmusik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `kapitel`
--
ALTER TABLE `kapitel`
  MODIFY `kapitel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT für Tabelle `kapitel_charaktere`
--
ALTER TABLE `kapitel_charaktere`
  MODIFY `kapitel_charaktere_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT für Tabelle `kapitel_charaktere2`
--
ALTER TABLE `kapitel_charaktere2`
  MODIFY `kapitel_charaktere2_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT für Tabelle `kapitel_hg`
--
ALTER TABLE `kapitel_hg`
  MODIFY `kapitel_hg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT für Tabelle `kapitel_hgmusik`
--
ALTER TABLE `kapitel_hgmusik`
  MODIFY `kapitel_hgmusik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT für Tabelle `progress`
--
ALTER TABLE `progress`
  MODIFY `progress_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `spielzeit`
--
ALTER TABLE `spielzeit`
  MODIFY `spielzeit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT für Tabelle `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `user_progress_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `kapitel_charaktere`
--
ALTER TABLE `kapitel_charaktere`
  ADD CONSTRAINT `kapitel_charaktere_ibfk_1` FOREIGN KEY (`charaktereID`) REFERENCES `charaktere` (`charaktere_id`),
  ADD CONSTRAINT `kapitel_charaktere_ibfk_2` FOREIGN KEY (`kapitelID`) REFERENCES `kapitel` (`kapitel_id`);

--
-- Constraints der Tabelle `kapitel_charaktere2`
--
ALTER TABLE `kapitel_charaktere2`
  ADD CONSTRAINT `kapitel_charaktere2_ibfk_1` FOREIGN KEY (`charaktereID`) REFERENCES `charaktere` (`charaktere_id`),
  ADD CONSTRAINT `kapitel_charaktere2_ibfk_2` FOREIGN KEY (`kapitelID`) REFERENCES `kapitel` (`kapitel_id`);

--
-- Constraints der Tabelle `kapitel_hg`
--
ALTER TABLE `kapitel_hg`
  ADD CONSTRAINT `kapitel_hg_ibfk_1` FOREIGN KEY (`hgID`) REFERENCES `hg` (`hg_id`),
  ADD CONSTRAINT `kapitel_hg_ibfk_2` FOREIGN KEY (`kapitelID`) REFERENCES `kapitel` (`kapitel_id`);

--
-- Constraints der Tabelle `kapitel_hgmusik`
--
ALTER TABLE `kapitel_hgmusik`
  ADD CONSTRAINT `kapitel_hgmusik_ibfk_1` FOREIGN KEY (`hgmusikID`) REFERENCES `hgmusik` (`hgmusik_id`),
  ADD CONSTRAINT `kapitel_hgmusik_ibfk_2` FOREIGN KEY (`kapitelID`) REFERENCES `kapitel` (`kapitel_id`);

--
-- Constraints der Tabelle `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `FK_kapitelprogress` FOREIGN KEY (`kapitelID`) REFERENCES `kapitel` (`kapitel_id`),
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`user_id`);

--
-- Constraints der Tabelle `spielzeit`
--
ALTER TABLE `spielzeit`
  ADD CONSTRAINT `FK_spielzeituser_progress` FOREIGN KEY (`user_progressID`) REFERENCES `user_progress` (`user_progress_id`);

--
-- Constraints der Tabelle `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `FK_useruserprogress` FOREIGN KEY (`userID`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`kapitelID`) REFERENCES `kapitel` (`kapitel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
