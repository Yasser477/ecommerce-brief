-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2022 at 12:46 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestionmagasin`
--
CREATE DATABASE IF NOT EXISTS `gestionmagasin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestionmagasin`;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `idClient` varchar(254) NOT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `adresse` varchar(254) DEFAULT NULL,
  `telephone` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `pass` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `idCommande` varchar(254) NOT NULL,
  `date` datetime DEFAULT NULL,
  `adresseLivraison` varchar(254) DEFAULT NULL,
  `idClient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detailscommande`
--

CREATE TABLE `detailscommande` (
  `idCommande` varchar(254) NOT NULL,
  `idProduit` varchar(254) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `idProduit` varchar(254) NOT NULL,
  `libelle` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL,
  `prix` decimal(8,0) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `image` varchar(254) DEFAULT NULL,
  `Promo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`idProduit`, `libelle`, `description`, `prix`, `stock`, `image`, `Promo`) VALUES
('1', 'Mens Skin Care Set', 'Mens Skin Care Set, Organic Skin Care for Men with Natural Face Wash, Body Wash, Exfoliating Face Scrub and Anti Aging Face Moisturizer, Our Mens Grooming Kit Refreshes Skin, Hydrates and Fights Acne', '130', 10, 'products/pack1.png', 1),
('10', 'Deluxe Hand & Body Lotion', 'A lightweight scented hand and body lotion with Aloe Vera and Oatmeal.', '11', 9, 'products/product 5.png', 1),
('11', '“Ultimate Man” Body \r\nScrub Soap', 'An efficient exfoliating bar soap for men.', '12', 13, 'products/product 6.png', 1),
('12', 'Ultra Facial Oil-Free \r\nMoisturizer', 'A shine-reducing, cooling oil-free moisturizer gel for oily and normal skin types. Paraben-free & synthetic fragrance-free.', '44', 11, 'products/product 7.png', 1),
('2', 'Tiege Hanley Men’s\r\nSkin Care System', 'Tiege Hanley Men’s Skin Care System - Level 1 | Mens Routine Product Set: Face Wash, Morning Moisturizer, Exfoliating Face Scrub, Night Moisturizer | Cleanse, Tighten & Hydrate Your Best Looking Skin', '120', 8, 'products/613DBUcnt4L 1.png', 1),
('3', 'Jack Black Face Buff\r\n Energizing Scrub', 'Jack Black - Skin Saviors Set - $57 Value\r\n', '57', 0, 'products/81CgvU48-GL 1.png', 1),
('4', 'HOMMEFACE Daily Trio \r\nSkin Care Set for Men', 'HOMMEFACE Daily Trio Skin Care Set for Men, 3-Step Routine', '180', 2, 'products/71OgZCo4YZL 1.png', NULL),
('5', 'Ultra Facial Cream\r\n with Squalane', 'Discover our #1 hydrating moisturizer for all skin types, even sensitive, with Squalane and Glycerin. This ultra-moisturizing face cream strengthens the skin’s moisture barrier and provides 24-hour hydration for softer, smoother skin.', '120', 22, 'products/kiehls-face-cream-ultra-facial-cream-125ml-000-3605975028799-whip 1.png', 1),
('6', 'Powerful-Strength\r\n Vitamin C Serum', 'A potent Vitamin C serum formulated with 12.5% Vitamin C and Hyaluronic Acid that visibly diminishes fine lines in just 2 weeks. Paraben-Free. Alcohol-Free. Mineral oil-free. Dye-free.', '12', 4, 'products/product 2.png', 1),
('7', 'Ferulic Brew Antioxidant\r\n Facial Treatment\r\n with Lactic Acid', 'An antioxidant facial treatment fortified with Ferulic & Lactic Acids (AHA) to visibly boost glow, smooth skin\'s texture, & reduce fine lines in just seven days.*', '80', 12, 'products/product 3.png', 0),
('8', 'Facial Fuel Daily Energizing\r\n Moisture Treatment for Men', 'An energizing, non-greasy men’s face moisturizer. Paraben-free & sulfate-free.', '45', 23, 'products/biref-14-sigma.png', 1),
('9', 'Creme de Corps Body Lotion\r\n with Cocoa Butter', 'A rich, fast-absorbing, non-greasy lotion with Cocoa Butter and Shea Butter. Paraben-free and fragrance-free.', '22', 14, 'products/product 4.png', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`);

--
-- Indexes for table `detailscommande`
--
ALTER TABLE `detailscommande`
  ADD PRIMARY KEY (`idCommande`,`idProduit`),
  ADD KEY `idProduit` (`idProduit`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProduit`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailscommande`
--
ALTER TABLE `detailscommande`
  ADD CONSTRAINT `detailscommande_ibfk_1` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`),
  ADD CONSTRAINT `detailscommande_ibfk_2` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
