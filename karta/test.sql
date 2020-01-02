-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Gru 2019, 22:24
-- Wersja serwera: 10.4.10-MariaDB
-- Wersja PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `test`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buyer`
--

CREATE TABLE `buyer` (
  `id` int(11) NOT NULL,
  `buyer_code` varchar(60) NOT NULL,
  `buyer_name` varchar(60) NOT NULL,
  `buyer_addres` tinytext NOT NULL,
  `buyer_number` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `buyer`
--

INSERT INTO `buyer` (`id`, `buyer_code`, `buyer_name`, `buyer_addres`, `buyer_number`) VALUES
(1, 'b1', 'Rafal S', 'Jana 3 sobieskiego 12 Sulejówek 05-070', '444123123');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categories_code` varchar(60) NOT NULL,
  `categories_name` varchar(60) NOT NULL,
  `categories_desc` tinytext NOT NULL,
  `categories_img_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id`, `categories_code`, `categories_name`, `categories_desc`, `categories_img_name`) VALUES
(1, 'obiad1', 'Obiady', 'Domowe obiady', 'obiad.jpg'),
(2, 'napoje1', 'Napoje', 'Rze?kie napoje', 'napoje.jpg'),
(3, 'dodatki1', 'Dodatki', 'Smaczne dodatki', 'dodatki.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `order_code` varchar(60) NOT NULL,
  `order_cost` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `order`
--

INSERT INTO `order` (`id`, `order_code`, `order_cost`) VALUES
(1, 'order1', '50'),
(2, 'order2', '30 PLN');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_code` varchar(60) NOT NULL,
  `product_name` varchar(60) NOT NULL,
  `product_desc` tinytext NOT NULL,
  `product_img_name` varchar(60) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_desc`, `product_img_name`, `price`) VALUES
(1, 'a1', 'Kotlet panierowany', 'ze schabu (z ko?ci? lub bez) przypominaj?cy sznycel ... Historia polskich kotletów schabowych si?ga XIX', 'kotlet.jpg', '12.00'),
(2, 'a2', 'Hamburger', 'Typowe danie typu fast food, kanapka (sandwicz) z kotletem z mi?sa wo?owego (patty)', 'hamburger.jpg', '28.00'),
(3, 'a3', 'Frytki', 'Rozdrobnione, pokrojone w kszta?t s?upków, najcz??ciej ziemniaki sma?one w g??bokim t?uszczu', 'frytki.jpg', '8.00'),
(4, 'a4', 'Sok marchewkowy', '?wie?y sok marchewkowy. Sok marchewkowy ?wie?o wyci?ni?ty. 100% soku w soku', 'sokMarchewka.jpg', '8.00'),
(5, 'a5', 'Sok owocowy', 'Niesfermentowany sok owocowy otrzymany przez wyci?ni?cie mi??szu dojrza?ych pomara?czy Citrus sinensis', 'sokPomaranczowy.jpg', '8.00'),
(6, 'a6', 'Cola', 'S?odki napój gazowany, pocz?tkowo wytwarzany z soku z owoców drzewa koli i krzewu koki, zmieszanych z wod? sodow?.', 'cola.jpg', '5.00'),
(7, 'a7', 'Salatka', 'Potrawa sporz?dzana g?ównie ze ?wie?ych warzyw, cz?sto z dodatkiem innych sk?adników, tak?e poddanych uprzednio obróbce cieplnej, oraz przypraw, z dodatkiem sosu na bazie majonezu, oliwy, ?mietany czy specjalnych sosów ', 'salatka.jpg', '13.00'),
(8, 'a8', 'Bagietka', 'Bagietki czosnkowe wykonane u nas z naturalnych sk?adników s? po prostu pyszne. Chrupi?ca bagietka, domowe mase?ko, ?wie?y czosnek..', 'bagieta.jpg', '7.00'),
(9, 'a9', 'Warzywa', 'Ro?liny warzywne, jarzyny – ro?liny jednoroczne, dwuletnie lub wieloletnie, które w ca?o?ci lub w cz??c', 'warzywa.jpg', '10.00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`buyer_code`);

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`categories_code`);

--
-- Indeksy dla tabeli `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`order_code`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`product_code`);

--
-- AUTO_INCREMENT dla tabel zrzutów
--

--
-- AUTO_INCREMENT dla tabeli `buyer`
--
ALTER TABLE `buyer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
