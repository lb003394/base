-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Jeu 13 Décembre 2012 à 18:34
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `basedispocar`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL,
  `numeroclient` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `raisonsociale` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numeroclient_UNIQUE` (`numeroclient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `formulairecontacts`
--

CREATE TABLE IF NOT EXISTS `formulairecontacts` (
  `id` int(11) NOT NULL,
  `departemnt` varchar(45) DEFAULT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `message` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) NOT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT NULL,
  `created` date DEFAULT NULL,
  `modified` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `parcs_id` int(11) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `password_UNIQUE` (`password`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_members_parcs1` (`parcs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `members`
--

INSERT INTO `members` (`id`, `email`, `password`, `nom`, `prenom`, `created`, `parcs_id`, `numero`, `ville`, `tel`) VALUES
(0, 'test@yahoo.fr', 'c440caddba8d3680493fe336661d0e9b28a9740a', '', '', '2012-12-09 01:59:17', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `nvehicules`
--

CREATE TABLE IF NOT EXISTS `nvehicules` (
  `id` int(11) NOT NULL,
  `numero` mediumint(9) DEFAULT NULL,
  `marque` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `carrosserie` varchar(45) DEFAULT NULL,
  `puissance` varchar(45) DEFAULT NULL,
  `couleur` varchar(45) DEFAULT NULL,
  `finission` varchar(45) DEFAULT NULL,
  `commentaire` text,
  `photo` tinyblob,
  `prix` varchar(45) DEFAULT NULL,
  `boite` varchar(45) DEFAULT NULL,
  `motorisation` varchar(45) DEFAULT NULL,
  `clients_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_UNIQUE` (`numero`),
  KEY `fk_nvehicules_clients1` (`clients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='véhicules neuf';

-- --------------------------------------------------------

--
-- Structure de la table `ovehicules`
--

CREATE TABLE IF NOT EXISTS `ovehicules` (
  `id` int(11) NOT NULL,
  `numero` mediumint(9) DEFAULT NULL,
  `marque` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `carrosserie` varchar(45) DEFAULT NULL,
  `puissance` varchar(45) DEFAULT NULL,
  `couleur` varchar(45) DEFAULT NULL,
  `finission` varchar(45) DEFAULT NULL,
  `commentaire` text,
  `photo` tinyblob,
  `prix` varchar(45) DEFAULT NULL,
  `boite` varchar(45) DEFAULT NULL,
  `motorisation` varchar(45) DEFAULT NULL,
  `kilometrage` varchar(100) DEFAULT NULL,
  `circulation` year(4) DEFAULT NULL,
  `clients_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_UNIQUE` (`numero`),
  KEY `fk_ovehicules_clients1` (`clients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='véhicules occasion';

-- --------------------------------------------------------

--
-- Structure de la table `parcs`
--

CREATE TABLE IF NOT EXISTS `parcs` (
  `id` int(11) NOT NULL,
  `numeroparc` mediumint(9) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `ovehicules_id` int(11) NOT NULL,
  `nvehicules_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numeroparc_UNIQUE` (`numeroparc`),
  KEY `fk_parcs_ovehicules1` (`ovehicules_id`),
  KEY `fk_parcs_nvehicules1` (`nvehicules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(20) NOT NULL,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `modified` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='La table users contiendra les administrateurs, identifiés pa';

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `created`, `modified`) VALUES
('', 'test', 'c440caddba8d3680493fe336661d0e9b28a9740a', '2012-12-09', '2012-12-09');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `fk_members_parcs1` FOREIGN KEY (`parcs_id`) REFERENCES `parcs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `nvehicules`
--
ALTER TABLE `nvehicules`
  ADD CONSTRAINT `fk_nvehicules_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ovehicules`
--
ALTER TABLE `ovehicules`
  ADD CONSTRAINT `fk_ovehicules_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `parcs`
--
ALTER TABLE `parcs`
  ADD CONSTRAINT `fk_parcs_nvehicules1` FOREIGN KEY (`nvehicules_id`) REFERENCES `nvehicules` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_parcs_ovehicules1` FOREIGN KEY (`ovehicules_id`) REFERENCES `ovehicules` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
