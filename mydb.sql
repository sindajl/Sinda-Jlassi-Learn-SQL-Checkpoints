-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 27 août 2021 à 01:51
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mydb`
--

-- --------------------------------------------------------

--
-- Structure de la table `harvest`
--

CREATE TABLE `harvest` (
  `wine_number` int(11) NOT NULL,
  `producer_number` int(11) NOT NULL,
  `harvest_quantity` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `harvest`
--

INSERT INTO `harvest` (`wine_number`, `producer_number`, `harvest_quantity`) VALUES
(1, 21, 200),
(5, 1, 150),
(1, 5, 200),
(1, 24, 300),
(4, 27, 400),
(6, 27, 150),
(1, 27, 500),
(2, 24, 800),
(2, 5, 170),
(5, 21, 150),
(1, 1, 190),
(6, 24, 600);

-- --------------------------------------------------------

--
-- Structure de la table `producer`
--

CREATE TABLE `producer` (
  `producer_number` int(11) NOT NULL,
  `producer_first_name` varchar(45) DEFAULT NULL,
  `producer_last_name` varchar(45) DEFAULT NULL,
  `producer_region` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `producer`
--

INSERT INTO `producer` (`producer_number`, `producer_first_name`, `producer_last_name`, `producer_region`) VALUES
(1, 'EL HADJ', 'DE COMMERCE', 'JENDOUBA'),
(5, 'ACHOUR', 'DE COMMERCE ET DISTRIBUTION', 'Tunis'),
(21, 'ARFAOUI', 'DE COMMERCE', 'Sousse'),
(24, 'ANFEL', 'DE COMMERCE', 'Monastir'),
(27, 'AZIZA', 'DE COMMERCE', 'Bizerte');

-- --------------------------------------------------------

--
-- Structure de la table `wine`
--

CREATE TABLE `wine` (
  `wine_number` int(11) NOT NULL,
  `wine_category` varchar(45) DEFAULT NULL,
  `wine_year` year(4) DEFAULT NULL,
  `wine_degree` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `wine`
--

INSERT INTO `wine` (`wine_number`, `wine_category`, `wine_year`, `wine_degree`) VALUES
(1, 'Red Wine', 1970, 5),
(2, 'White Wine', 1975, 7),
(4, 'Sparkling Wine', 1990, 12),
(5, 'Dessert Wine', 1995, 15),
(6, 'Rosé Wine', 1980, 14);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `harvest`
--
ALTER TABLE `harvest`
  ADD KEY `wineproduce` (`wine_number`),
  ADD KEY `producewine` (`producer_number`);

--
-- Index pour la table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`producer_number`);

--
-- Index pour la table `wine`
--
ALTER TABLE `wine`
  ADD PRIMARY KEY (`wine_number`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `harvest`
--
ALTER TABLE `harvest`
  ADD CONSTRAINT `producewine` FOREIGN KEY (`producer_number`) REFERENCES `producer` (`producer_number`),
  ADD CONSTRAINT `wineproduce` FOREIGN KEY (`wine_number`) REFERENCES `wine` (`wine_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
