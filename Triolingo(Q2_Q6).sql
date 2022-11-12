-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 14 jan. 2021 à 17:41
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Triolingo`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idcli` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `naissance` date DEFAULT NULL,
  `tel` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idcli`, `nom`, `prenom`, `naissance`, `tel`) VALUES
(1, 'Chose', 'Machin', '1997-06-20', '01.02.04.08.16'),
(2, 'Bidule', 'Truc', '1992-03-12', '02.03.05.07.11'),
(3, 'Personne', 'Autre', '1901-01-01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `connaissance`
--

CREATE TABLE `connaissance` (
  `idpro` int(11) NOT NULL,
  `idlan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `connaissance`
--

INSERT INTO `connaissance` (`idpro`, `idlan`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `idcou` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `lieu` varchar(200) DEFAULT NULL,
  `niveau` varchar(2) DEFAULT NULL,
  `idlan` int(11) DEFAULT NULL,
  `idpro` int(11) DEFAULT NULL,
  `idcli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`idcou`, `date`, `lieu`, `niveau`, `idlan`, `idpro`, `idcli`) VALUES
(1, '2020-01-15', 'Londres', 'A2', 1, 1, 1),
(2, '2020-01-30', 'Londres', 'A2', 1, 1, 1),
(3, '2020-05-07', 'Paris', 'B2', 2, 2, 2),
(4, '2020-05-14', 'Paris', 'B2', 2, 2, 2),
(5, '2021-05-07', 'Londres', 'C1', 2, 1, 2),
(6, '2021-05-21', 'Londres', 'C1', 2, 1, 2),
(7, '2021-01-10', 'Londres', 'B2', 1, 3, 3),
(8, '2021-02-10', 'Paris', 'B2', 1, 1, 3),
(9, '2021-03-10', 'Rome', 'B2', 1, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `langue`
--

CREATE TABLE `langue` (
  `idlan` int(11) NOT NULL,
  `nomfr` varchar(40) NOT NULL,
  `nomen` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `langue`
--

INSERT INTO `langue` (`idlan`, `nomfr`, `nomen`) VALUES
(1, 'Anglais', 'English'),
(2, 'Français', 'French'),
(3, 'Runique', 'Runic');

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `idpro` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `naissance` date DEFAULT NULL,
  `tel` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`idpro`, `nom`, `prenom`, `naissance`, `tel`) VALUES
(1, 'Dumbledore', 'Albus', '1997-06-26', '+44 777777777'),
(2, 'Tournesol', 'Tryphon', '1943-09-23', '01.02.03.04.05'),
(3, 'Moriarty', 'James', '1893-12-01', '+44 666666666');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idcli`);

--
-- Index pour la table `connaissance`
--
ALTER TABLE `connaissance`
  ADD PRIMARY KEY (`idpro`,`idlan`),
  ADD KEY `fk_conlan` (`idlan`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`idcou`),
  ADD KEY `fk_coulan` (`idlan`),
  ADD KEY `fk_coupro` (`idpro`),
  ADD KEY `fk_coucli` (`idcli`);

--
-- Index pour la table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`idlan`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`idpro`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `connaissance`
--
ALTER TABLE `connaissance`
  ADD CONSTRAINT `fk_conlan` FOREIGN KEY (`idlan`) REFERENCES `langue` (`idlan`),
  ADD CONSTRAINT `fk_conpro` FOREIGN KEY (`idpro`) REFERENCES `professeur` (`idpro`);

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `fk_coucli` FOREIGN KEY (`idcli`) REFERENCES `client` (`idcli`),
  ADD CONSTRAINT `fk_coulan` FOREIGN KEY (`idlan`) REFERENCES `langue` (`idlan`),
  ADD CONSTRAINT `fk_coupro` FOREIGN KEY (`idpro`) REFERENCES `professeur` (`idpro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
