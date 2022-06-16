-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 05 Cze 2022, 19:09
-- Wersja serwera: 8.0.29
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `zameldowania`
--
CREATE DATABASE IF NOT EXISTS `zameldowania` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `zameldowania`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `budynek`
--

CREATE TABLE `budynek` (
  `ID_Budynku` int NOT NULL,
  `numer` int NOT NULL,
  `ulica` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `dzielnica` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `kod_pocztowy` varchar(6) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `budynek`
--

INSERT INTO `budynek` (`ID_Budynku`, `numer`, `ulica`, `dzielnica`, `kod_pocztowy`) VALUES
(1, 6, 'Sosnowskiego', 'Nadrzecze', '30-295'),
(2, 10, 'Witosa', 'Nadrzecze', '30-852'),
(3, 31, 'Witosa', 'Elektryk', '30-174'),
(4, 39, 'Opolska', 'Krowodrza', '30-674'),
(5, 4, 'Przymierza', 'Wilda', '30-225'),
(6, 4, '3-go Maja', 'Bronowice', '30-124'),
(7, 36, 'Przymierza', 'Metalhem', '30-545'),
(8, 46, 'Pawia', 'Krowodrza', '30-156'),
(9, 2, 'Bielska', 'Bronowice', '30-198'),
(10, 9, 'Ozimska', 'Elektryk', '30-260'),
(11, 6, 'Opolska', 'Metalhem', '30-670'),
(12, 30, 'Tokarskiego', 'Nadrzecze', '30-206'),
(13, 30, 'Katowicka', 'Bronowice', '30-581'),
(14, 41, 'Mickiewicza', 'Wilda', '30-789'),
(15, 25, '3-go Maja', 'Nadrzecze', '30-780'),
(16, 15, 'Witosa', 'Huta', '30-285'),
(17, 3, 'Katowicka', 'Elektryk', '30-238'),
(18, 1, 'Mickiewicza', 'Elektryk', '30-149'),
(19, 12, 'Degaulla', 'Krowodrza', '30-163'),
(20, 48, 'Rzeczna', 'Elektryk', '30-590'),
(21, 1, 'Pawia', 'Huta', '30-684'),
(22, 28, 'Reymonta', 'Elektryk', '30-219'),
(23, 31, 'Degaulla', 'Nadrzecze', '30-364'),
(24, 39, 'Ozimska', 'Malinka', '30-404'),
(25, 9, 'Koryncka', 'Malinka', '30-623'),
(26, 6, 'Witosa', 'Krowodrza', '30-607'),
(27, 14, 'Rzeczna', 'Elektryk', '30-225'),
(28, 11, 'Koryncka', 'Wilda', '30-389'),
(29, 49, 'Opolska', 'Malinka', '30-221'),
(30, 30, 'Fabryczna', 'Malinka', '30-631');

--
-- Wyzwalacze `budynek`
--
DELIMITER $$
CREATE TRIGGER `After_budynek_delete` AFTER DELETE ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Usunięto rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `After_budynek_insert` AFTER INSERT ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Dodano nowy rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `After_budynek_update` AFTER UPDATE ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Zaktualizowano rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_budynek_delete` BEFORE DELETE ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Próba usunięcia rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_budynek_insert` BEFORE INSERT ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Próba dodania rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_budynek_update` BEFORE UPDATE ON `budynek` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('budynek','Próba zaktualizowania rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_postal_insert` BEFORE INSERT ON `budynek` FOR EACH ROW BEGIN
	CALL validate_postal_code(NEW.kod_pocztowy);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_postal_update` BEFORE UPDATE ON `budynek` FOR EACH ROW BEGIN
	CALL validate_postal_code(NEW.kod_pocztowy);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logi`
--

CREATE TABLE `logi` (
  `ID` int UNSIGNED NOT NULL,
  `tabela` varchar(30) DEFAULT NULL,
  `operacja` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `czas` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `logi`
--

INSERT INTO `logi` (`ID`, `tabela`, `operacja`, `czas`) VALUES
(1, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 17:21:55'),
(2, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 17:21:55'),
(3, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(4, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(5, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(6, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(7, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(8, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(9, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(10, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(11, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(12, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(13, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(14, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(15, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(16, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(17, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(18, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(19, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(20, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(21, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(22, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(23, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(24, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(25, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(26, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(27, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(28, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(29, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(30, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(31, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(32, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(33, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(34, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(35, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(36, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(37, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(38, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(39, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(40, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(41, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(42, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(43, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(44, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(45, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(46, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(47, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(48, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(49, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(50, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(51, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:07:20'),
(52, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:07:20'),
(53, 'zameldowanie', 'Próba usunięcia rekordu', '2022-06-05 18:07:55'),
(54, 'zameldowanie', 'Usunięto rekord', '2022-06-05 18:07:55'),
(55, 'zameldowanie', 'Próba utworzenia nowego rekordu', '2022-06-05 18:08:48'),
(56, 'zameldowanie', 'Utworzono nowy rekord', '2022-06-05 18:08:48');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lokal`
--

CREATE TABLE `lokal` (
  `ID_lokalu` int NOT NULL,
  `ID_budynku` int NOT NULL,
  `powierzchnia` int NOT NULL,
  `typ_lokalu` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `numer_lokalu` int NOT NULL,
  `wlasciciel` varchar(70) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `lokal`
--

INSERT INTO `lokal` (`ID_lokalu`, `ID_budynku`, `powierzchnia`, `typ_lokalu`, `numer_lokalu`, `wlasciciel`) VALUES
(1, 14, 97, 'Kawalerka', 18, 'Urzad miasta'),
(2, 28, 97, 'Apartamentowiec', 10, 'Spoldzielnia'),
(3, 11, 29, 'Mieszkanie', 12, 'Urzad miasta'),
(4, 10, 65, 'Dom rodzinny', 9, 'Deweloper'),
(5, 28, 20, 'Dom rodzinny', 13, 'Firma'),
(6, 27, 45, 'Dom rodzinny', 4, 'Spoldzielnia'),
(7, 19, 54, 'Dom rodzinny', 18, 'Spoldzielnia'),
(8, 10, 26, 'Kawalerka', 2, 'Firma'),
(9, 1, 79, 'Mieszkanie', 17, 'Firma'),
(10, 8, 74, 'Kawalerka', 1, 'Firma'),
(11, 22, 65, 'Mieszkanie', 11, 'Deweloper'),
(12, 12, 26, 'Kawalerka', 4, 'Osoba prywatna'),
(13, 16, 82, 'Gospodarstwo', 4, 'Spoldzielnia'),
(14, 4, 100, 'Mieszkanie', 19, 'Deweloper'),
(15, 30, 53, 'Kawalerka', 5, 'Urzad miasta'),
(16, 4, 98, 'Dom rodzinny', 12, 'Deweloper'),
(17, 18, 51, 'Gospodarstwo', 1, 'Spoldzielnia'),
(18, 26, 84, 'Dom rodzinny', 13, 'Urzad miasta'),
(19, 20, 56, 'Gospodarstwo', 20, 'Spoldzielnia'),
(20, 14, 31, 'Mieszkanie', 16, 'Osoba prywatna'),
(21, 19, 43, 'Apartamentowiec', 1, 'Spoldzielnia'),
(22, 7, 91, 'Gospodarstwo', 13, 'Urzad miasta'),
(23, 27, 84, 'Mieszkanie', 2, 'Urzad miasta'),
(24, 18, 66, 'Gospodarstwo', 12, 'Osoba prywatna'),
(25, 30, 34, 'Kawalerka', 20, 'Firma'),
(26, 8, 52, 'Apartamentowiec', 12, 'Deweloper'),
(27, 6, 44, 'Dom rodzinny', 18, 'Osoba prywatna'),
(28, 30, 99, 'Gospodarstwo', 19, 'Firma'),
(29, 30, 54, 'Mieszkanie', 20, 'Urzad miasta'),
(30, 16, 63, 'Dom rodzinny', 8, 'Spoldzielnia'),
(31, 20, 49, 'Apartamentowiec', 16, 'Spoldzielnia'),
(32, 26, 65, 'Mieszkanie', 18, 'Deweloper'),
(33, 23, 90, 'Apartamentowiec', 18, 'Osoba prywatna'),
(34, 10, 30, 'Dom rodzinny', 3, 'Firma'),
(35, 30, 50, 'Apartamentowiec', 10, 'Deweloper'),
(36, 28, 88, 'Apartamentowiec', 5, 'Spoldzielnia'),
(37, 18, 95, 'Kawalerka', 7, 'Deweloper'),
(38, 13, 70, 'Apartamentowiec', 3, 'Spoldzielnia'),
(39, 15, 94, 'Gospodarstwo', 19, 'Urzad miasta'),
(40, 14, 92, 'Gospodarstwo', 15, 'Deweloper'),
(41, 14, 28, 'Kawalerka', 2, 'Deweloper'),
(42, 29, 34, 'Gospodarstwo', 19, 'Urzad miasta'),
(43, 12, 55, 'Dom rodzinny', 17, 'Osoba prywatna'),
(44, 8, 60, 'Dom rodzinny', 15, 'Deweloper'),
(45, 8, 44, 'Apartamentowiec', 8, 'Spoldzielnia'),
(46, 19, 85, 'Dom rodzinny', 7, 'Osoba prywatna'),
(47, 28, 74, 'Apartamentowiec', 6, 'Firma'),
(48, 15, 62, 'Dom rodzinny', 20, 'Osoba prywatna'),
(49, 20, 98, 'Kawalerka', 16, 'Firma'),
(50, 12, 49, 'Mieszkanie', 7, 'Firma'),
(51, 12, 75, 'Gospodarstwo', 2, 'Urzad miasta'),
(52, 13, 21, 'Gospodarstwo', 18, 'Deweloper'),
(53, 2, 86, 'Apartamentowiec', 5, 'Osoba prywatna'),
(54, 12, 27, 'Mieszkanie', 19, 'Firma'),
(55, 6, 26, 'Kawalerka', 17, 'Urzad miasta'),
(56, 29, 72, 'Kawalerka', 10, 'Firma'),
(57, 4, 98, 'Mieszkanie', 15, 'Urzad miasta'),
(58, 2, 74, 'Dom rodzinny', 4, 'Spoldzielnia'),
(59, 20, 33, 'Kawalerka', 11, 'Osoba prywatna'),
(60, 24, 34, 'Gospodarstwo', 10, 'Spoldzielnia'),
(61, 16, 74, 'Kawalerka', 4, 'Deweloper'),
(62, 16, 20, 'Mieszkanie', 7, 'Deweloper'),
(63, 2, 94, 'Mieszkanie', 6, 'Deweloper'),
(64, 12, 28, 'Dom rodzinny', 13, 'Firma'),
(65, 3, 27, 'Kawalerka', 5, 'Osoba prywatna'),
(66, 28, 79, 'Dom rodzinny', 8, 'Deweloper'),
(67, 23, 47, 'Dom rodzinny', 8, 'Firma'),
(68, 22, 27, 'Dom rodzinny', 5, 'Urzad miasta'),
(69, 2, 33, 'Kawalerka', 20, 'Spoldzielnia'),
(70, 23, 78, 'Apartamentowiec', 4, 'Urzad miasta');

--
-- Wyzwalacze `lokal`
--
DELIMITER $$
CREATE TRIGGER `After_lokal_delete` AFTER DELETE ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Usunięto rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `After_lokal_insert` AFTER INSERT ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Dodano nowy rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `After_lokal_update` AFTER UPDATE ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Zaktualizowano rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_lokal_delete` BEFORE DELETE ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba usunięcia rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_lokal_insert` BEFORE INSERT ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba dodania rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_lokal_update` BEFORE UPDATE ON `lokal` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba aktualizacji rekordu',NOW()); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `mieszkaniec`
--

CREATE TABLE `mieszkaniec` (
  `PESEL` varchar(11) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `stan_cywilny` varchar(20) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL,
  `zatrudniony` tinyint(1) DEFAULT NULL,
  `numer_telefonu` varchar(12) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `mieszkaniec`
--

INSERT INTO `mieszkaniec` (`PESEL`, `stan_cywilny`, `zatrudniony`, `numer_telefonu`) VALUES
('03080852736', 'Kawaler/Panna', 1, '+48246428742'),
('04122211849', 'Wdowa/Wdowiec', 1, '+48853640617'),
('05080833612', 'Wdowa/Wdowiec', 1, '+48177060546'),
('07261267498', 'Nieustalony', 1, '+48592835735'),
('08092067893', 'Kawaler/Panna', 1, '+48191209853'),
('12020457876', 'Woln(y)/(a)', 0, '+48105735571'),
('17122253478', 'Separacja', 1, '+48959472620'),
('21061138059', 'Woln(y)/(a)', 0, '+48721721148'),
('31010217825', 'Kawaler/Panna', 1, '+48891722713'),
('36061423001', 'Wdowa/Wdowiec', 0, '+48966377881'),
('37052265860', 'Woln(y)/(a)', 1, '+48034797712'),
('40112257585', 'Zonat(y)/(a)', 1, '+48745401461'),
('41051089185', 'Wdowa/Wdowiec', 0, '+48023706971'),
('51071973685', 'Woln(y)/(a)', 1, '+48618195224'),
('58022290651', 'Kawaler/Panna', 1, '+48071253754'),
('62041486078', 'Woln(y)/(a)', 0, '+48872597635'),
('63010734916', 'Wdowa/Wdowiec', 1, '+48041590521'),
('65101958564', 'Rozwiedzion(y)/(a)', 0, '+48021699624'),
('66112316084', 'Zonat(y)/(a)', 0, '+48704704569'),
('68062729930', 'Nieustalony', 0, '+48033660008'),
('74071033931', 'Nieustalony', 1, '+48441702995'),
('75091342384', 'Separacja', 1, '+48164515557'),
('77012482135', 'Wdowa/Wdowiec', 1, '+48039354706'),
('78121667444', 'Zonat(y)/(a)', 1, '+48696267658'),
('83120612500', 'Separacja', 0, '+48958198549'),
('85021886448', 'Kawaler/Panna', 1, '+48716917258'),
('92102428916', 'Rozwiedzion(y)/(a)', 0, '+48623322469'),
('93071637761', 'Kawaler/Panna', 0, '+48027710172'),
('96042327610', 'Rozwiedzion(y)/(a)', 1, '+48780822753'),
('97101278173', 'Zonat(y)/(a)', 1, '+48115815061');

--
-- Wyzwalacze `mieszkaniec`
--
DELIMITER $$
CREATE TRIGGER `After_delete_mieszkaniec` AFTER DELETE ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Usunięto rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `After_insert_mieszkaniec` AFTER INSERT ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Dodano nowy rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `After_update_mieszkaniec` AFTER UPDATE ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Rekord został zaktualizowany',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_delete_mieszkaniec` BEFORE DELETE ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Próba usunięcia rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_insert_mieszkaniec` BEFORE INSERT ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Próba dodania nowego rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_update_mieszkaniec` BEFORE UPDATE ON `mieszkaniec` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('mieszkaniec','Próba aktualizacji rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_number_insert` BEFORE INSERT ON `mieszkaniec` FOR EACH ROW BEGIN 
	CALL validate_phone_number(NEW.numer_telefonu);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_number_update` BEFORE UPDATE ON `mieszkaniec` FOR EACH ROW BEGIN 
	CALL validate_phone_number(NEW.numer_telefonu);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `osoba`
--

CREATE TABLE `osoba` (
  `PESEL` varchar(11) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `imie` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(30) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data_urodzenia` date NOT NULL,
  `dodatkowe_informacje` varchar(250) CHARACTER SET utf8 COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `osoba`
--

INSERT INTO `osoba` (`PESEL`, `imie`, `nazwisko`, `data_urodzenia`, `dodatkowe_informacje`) VALUES
('01210929514', 'Anna', 'Krzywiasta', '2001-01-09', 'Brak informacji'),
('03080852736', 'Ewelina', 'Strasburger', '1903-08-08', 'Brak informacji'),
('04122211849', 'Maciek', 'Shmidt', '1904-12-22', 'Brak informacji'),
('04282459903', 'Katarzyna', 'Kartezjan', '2004-08-24', 'Brak informacji'),
('05080833612', 'Magdalena', 'Dagmarowicz', '1905-08-08', 'Brak informacji'),
('06010834378', 'Magdalena', 'Kononowicz', '1906-01-08', 'Brak informacji'),
('06253060831', 'Bartosz', 'Parowin', '2006-05-30', 'Brak informacji'),
('07261267498', 'Filip', 'Eldoran', '2007-06-12', 'Brak informacji'),
('07262863211', 'Maciek', 'Parowin', '2007-06-28', 'Brak informacji'),
('08092067893', 'Mateusz', 'Hajzer', '1908-09-20', 'Brak informacji'),
('12020457876', 'Julian', 'Socha', '1912-02-04', 'Brak informacji'),
('15092468296', 'Zofia', 'Kartezjan', '1915-09-24', 'Brak informacji'),
('17122253478', 'Szymon', 'Radowicz', '1917-12-22', 'Brak informacji'),
('21061138059', 'Marek', 'Krzywiasta', '1921-06-11', 'Brak informacji'),
('31010217825', 'Maciek', 'Hajzer', '1931-01-02', 'Brak informacji'),
('32100431743', 'Daniel', 'Parowin', '1932-10-04', 'Brak informacji'),
('36061423001', 'Robert', 'Majkut', '1936-06-14', 'Brak informacji'),
('36111476526', 'Maciek', 'Eldoran', '1936-11-14', 'Brak informacji'),
('37052265860', 'Robert', 'Gessler', '1937-05-22', 'Brak informacji'),
('40112257585', 'Aleksander', 'Dagmarowicz', '1940-11-22', 'Brak informacji'),
('41051089185', 'Krzysztof', 'Zwierzynski', '1941-05-10', 'Brak informacji'),
('41112449066', 'Bartosz', 'Kowal', '1941-11-24', 'Brak informacji'),
('45033147021', 'Mateusz', 'Landmar', '1945-03-31', 'Brak informacji'),
('51071973685', 'Paulina', 'Parowin', '1951-07-19', 'Brak informacji'),
('54011471539', 'Marek', 'Dagmarowicz', '1954-01-14', 'Brak informacji'),
('58022290651', 'Marek', 'Nowak', '1958-02-22', 'Brak informacji'),
('59012985474', 'Adam', 'Landmar', '1959-01-29', 'Brak informacji'),
('62041486078', 'Paulina', 'Weldman', '1962-04-14', 'Brak informacji'),
('63010734916', 'Katarzyna', 'Majkut', '1963-01-07', 'Brak informacji'),
('65101958564', 'Szymon', 'Krzywiasta', '1965-10-19', 'Brak informacji'),
('66112316084', 'Wojciech', 'Lakon', '1966-11-23', 'Brak informacji'),
('68062729930', 'Marcin', 'Lakon', '1968-06-27', 'Brak informacji'),
('68092326000', 'Zofia', 'Zwierzynski', '1968-09-23', 'Brak informacji'),
('74071033931', 'Zofia', 'Weldman', '1974-07-10', 'Brak informacji'),
('75040622590', 'Ewelina', 'Majkut', '1975-04-06', 'Brak informacji'),
('75091342384', 'Filip', 'Hajzer', '1975-09-13', 'Brak informacji'),
('77012482135', 'Anna', 'Socha', '1977-01-24', 'Brak informacji'),
('78121667444', 'Bartosz', 'Shmidt', '1978-12-16', 'Brak informacji'),
('79010833111', 'Anna', 'Dostojewski', '1979-01-08', 'Brak informacji'),
('79042740573', 'Paulina', 'Hajzer', '1979-04-27', 'Brak informacji'),
('79090859197', 'Marcin', 'Majkut', '1979-09-08', 'Brak informacji'),
('83120612500', 'Krzysztof', 'Strasburger', '1983-12-06', 'Brak informacji'),
('85021886448', 'Zofia', 'Majkut', '1985-02-18', 'Brak informacji'),
('90120861032', 'Bartosz', 'Rakowicz', '1990-12-08', 'Brak informacji'),
('91022735292', 'Adam', 'Dagmarowicz', '1991-02-27', 'Brak informacji'),
('92102428916', 'Marek', 'Eldoran', '1992-10-24', 'Brak informacji'),
('93071637761', 'Ewa', 'Kartezjan', '1993-07-16', 'Brak informacji'),
('93092968886', 'Sylwia', 'Landmar', '1993-09-29', 'Brak informacji'),
('96042327610', 'Sebastian', 'Eldoran', '1996-04-23', 'Brak informacji'),
('97101278173', 'Filip', 'Hajzer', '1997-10-12', 'Brak informacji');

--
-- Wyzwalacze `osoba`
--
DELIMITER $$
CREATE TRIGGER `After_osoba_delete` AFTER DELETE ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Usunięto rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `After_osoba_insert` AFTER INSERT ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Dodano nowy rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `After_osoba_update` AFTER UPDATE ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Zaktualizowano rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_osoba_delete` BEFORE DELETE ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba usunięcia rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_osoba_insert` BEFORE INSERT ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba dodania rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_osoba_update` BEFORE UPDATE ON `osoba` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('lokal','Próba aktualizacji rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_osoba_insert` BEFORE INSERT ON `osoba` FOR EACH ROW BEGIN 
	CALL validate_PESEL(NEW.PESEL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_osoba_update` BEFORE UPDATE ON `osoba` FOR EACH ROW BEGIN CALL validate_PESEL(NEW.PESEL); 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zameldowanie`
--

CREATE TABLE `zameldowanie` (
  `ID_zameldowania` int NOT NULL,
  `Lokal` int NOT NULL,
  `PESEL` varchar(11) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `data_zameldowania` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Zrzut danych tabeli `zameldowanie`
--

INSERT INTO `zameldowanie` (`ID_zameldowania`, `Lokal`, `PESEL`, `data_zameldowania`) VALUES
(1, 33, '03080852736', '1950-06-01'),
(2, 29, '93071637761', '1996-05-14'),
(3, 33, '04122211849', '1977-03-26'),
(4, 44, '05080833612', '1984-08-16'),
(5, 28, '07261267498', '1985-10-10'),
(6, 59, '08092067893', '2002-03-04'),
(7, 18, '12020457876', '1960-05-04'),
(8, 63, '17122253478', '2005-01-04'),
(9, 7, '21061138059', '1960-04-12'),
(10, 7, '31010217825', '1960-04-12'),
(11, 26, '36061423001', '2000-01-10'),
(12, 48, '37052265860', '2003-07-19'),
(13, 64, '40112257585', '2012-06-14'),
(14, 19, '41051089185', '1999-09-09'),
(15, 30, '51071973685', '2022-06-06'),
(16, 26, '58022290651', '2013-04-02'),
(17, 7, '62041486078', '2004-06-15'),
(18, 10, '63010734916', '2011-06-22'),
(19, 10, '65101958564', '2011-06-22'),
(20, 1, '66112316084', '2003-11-11'),
(21, 56, '68062729930', '2002-03-16'),
(22, 13, '74071033931', '1996-02-06'),
(23, 37, '75091342384', '2014-11-13'),
(24, 40, '77012482135', '2008-04-02'),
(25, 65, '78121667444', '2014-06-02'),
(26, 58, '83120612500', '2009-07-16');

--
-- Wyzwalacze `zameldowanie`
--
DELIMITER $$
CREATE TRIGGER `After_delete_zameldowanie` AFTER DELETE ON `zameldowanie` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('zameldowanie','Usunięto rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `After_insert_zameldowanie` AFTER INSERT ON `zameldowanie` FOR EACH ROW BEGIN INSERT INTO logi(tabela,operacja,czas) VALUES ('zameldowanie','Utworzono nowy rekord',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_delete_zameldowanie` BEFORE DELETE ON `zameldowanie` FOR EACH ROW BEGIN 
INSERT INTO logi(tabela,operacja,czas) VALUES ('zameldowanie','Próba usunięcia rekordu',NOW()); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Before_insert_zameldowanie` BEFORE INSERT ON `zameldowanie` FOR EACH ROW BEGIN INSERT INTO logi(tabela,operacja,czas) VALUES ('zameldowanie','Próba utworzenia nowego rekordu',NOW());
END
$$
DELIMITER ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `budynek`
--
ALTER TABLE `budynek`
  ADD PRIMARY KEY (`ID_Budynku`),
  ADD KEY `Caly_adres` (`ulica`,`numer`,`kod_pocztowy`) USING BTREE,
  ADD KEY `Nazwa_ulicy` (`ulica`) USING BTREE;

--
-- Indeksy dla tabeli `logi`
--
ALTER TABLE `logi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Wydarzenie` (`operacja`,`czas`);

--
-- Indeksy dla tabeli `lokal`
--
ALTER TABLE `lokal`
  ADD PRIMARY KEY (`ID_lokalu`),
  ADD KEY `Detale_lokalu` (`powierzchnia`,`typ_lokalu`,`wlasciciel`),
  ADD KEY `ID_budynku` (`ID_budynku`) USING BTREE,
  ADD KEY `Numer_lokalu` (`numer_lokalu`);

--
-- Indeksy dla tabeli `mieszkaniec`
--
ALTER TABLE `mieszkaniec`
  ADD PRIMARY KEY (`PESEL`),
  ADD KEY `Kontakt` (`PESEL`,`numer_telefonu`);

--
-- Indeksy dla tabeli `osoba`
--
ALTER TABLE `osoba`
  ADD PRIMARY KEY (`PESEL`),
  ADD KEY `Dane_Osobowe` (`PESEL`,`imie`,`nazwisko`);

--
-- Indeksy dla tabeli `zameldowanie`
--
ALTER TABLE `zameldowanie`
  ADD PRIMARY KEY (`ID_zameldowania`),
  ADD KEY `FOREIGN2` (`Lokal`),
  ADD KEY `FOREIGN` (`PESEL`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `budynek`
--
ALTER TABLE `budynek`
  MODIFY `ID_Budynku` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT dla tabeli `logi`
--
ALTER TABLE `logi`
  MODIFY `ID` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT dla tabeli `lokal`
--
ALTER TABLE `lokal`
  MODIFY `ID_lokalu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT dla tabeli `zameldowanie`
--
ALTER TABLE `zameldowanie`
  MODIFY `ID_zameldowania` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `lokal`
--
ALTER TABLE `lokal`
  ADD CONSTRAINT `lokal_ibfk_1` FOREIGN KEY (`ID_budynku`) REFERENCES `budynek` (`ID_Budynku`);

--
-- Ograniczenia dla tabeli `mieszkaniec`
--
ALTER TABLE `mieszkaniec`
  ADD CONSTRAINT `mieszkaniec_ibfk_1` FOREIGN KEY (`PESEL`) REFERENCES `osoba` (`PESEL`);

--
-- Ograniczenia dla tabeli `zameldowanie`
--
ALTER TABLE `zameldowanie`
  ADD CONSTRAINT `zameldowanie_ibfk_1` FOREIGN KEY (`Lokal`) REFERENCES `lokal` (`ID_lokalu`),
  ADD CONSTRAINT `zameldowanie_ibfk_2` FOREIGN KEY (`PESEL`) REFERENCES `mieszkaniec` (`PESEL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
