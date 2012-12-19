-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 19 Décembre 2012 à 22:25
-- Version du serveur: 5.5.16-log
-- Version de PHP: 5.3.13

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `raisonsociale` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `nvehicules_id` int(11) NOT NULL,
  `nego` tinyint(1) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenom`, `raisonsociale`, `ville`, `tel`, `nvehicules_id`, `nego`, `note`) VALUES
(3, 'Ali', 'Paul', '', 'Toulouse', '0618513009', 26, 0, '');

-- --------------------------------------------------------

--
-- Structure de la table `clientvos`
--

CREATE TABLE IF NOT EXISTS `clientvos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `raisonsociale` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `ovehicules_id` int(11) NOT NULL,
  `nego` tinyint(1) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu la table `clientvos`
--

INSERT INTO `clientvos` (`id`, `nom`, `prenom`, `raisonsociale`, `ville`, `tel`, `ovehicules_id`, `nego`, `note`) VALUES
(1, 'Dupond', 'Arni', '', 'Toulouse', '000000', 5, 0, ''),
(2, 'Dupond', '', '', '', '', 6, 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `formulairecontacts`
--

CREATE TABLE IF NOT EXISTS `formulairecontacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departemnt` varchar(45) DEFAULT NULL,
  `titre` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `message` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned DEFAULT NULL,
  `created` date DEFAULT NULL,
  `modified` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `members`
--

INSERT INTO `members` (`id`, `email`, `password`, `nom`, `prenom`, `created`, `parcs_id`, `numero`, `ville`, `tel`) VALUES
(3, 'concessionnaire@yahoo.fr', '5a7aa802f3e617a147be7fcc9ea0609a06cec255', 'Panda', 'LOUI', '2012-12-14 23:33:02', 1, '00002', 'Marseille', '0618513010'),
(4, 'test@yahoo.fr', 'c440caddba8d3680493fe336661d0e9b28a9740a', 'Bas', 'françois', '2012-12-18 20:14:02', 2, '0002', 'Marseille', '0518513007');

-- --------------------------------------------------------

--
-- Structure de la table `nvehicules`
--

CREATE TABLE IF NOT EXISTS `nvehicules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marque` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `carrosserie` varchar(45) DEFAULT NULL,
  `puissance` varchar(45) DEFAULT NULL,
  `couleur` varchar(45) DEFAULT NULL,
  `finission` varchar(45) DEFAULT NULL,
  `commentaire` text,
  `filename` varchar(45) DEFAULT NULL,
  `prix` varchar(45) DEFAULT NULL,
  `boite` varchar(45) DEFAULT NULL,
  `motorisation` varchar(45) DEFAULT NULL,
  `parcs_id` int(11) NOT NULL,
  `dir` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `envente` tinyint(1) NOT NULL DEFAULT '0',
  `entransfert` tinyint(1) NOT NULL DEFAULT '0',
  `vendu` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_nvehicules_clients1` (`parcs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='véhicules neuf' AUTO_INCREMENT=30 ;

--
-- Contenu de la table `nvehicules`
--

INSERT INTO `nvehicules` (`id`, `marque`, `model`, `carrosserie`, `puissance`, `couleur`, `finission`, `commentaire`, `filename`, `prix`, `boite`, `motorisation`, `parcs_id`, `dir`, `mimetype`, `filesize`, `envente`, `entransfert`, `vendu`) VALUES
(26, 'Mercedes', 'Classe CLS', 'Break, SW', '15ch', 'Jaune', '', '', '20121206102408_img_1.jpg', '15000€', '5ch', 'Essence', 1, 'img\\lesimages\\nvehicules', 'image/jpeg', 10491, 1, 1, 1),
(27, 'Fiat', 'SPORT', 'Coupé', '15ch', 'Rouge', '', '', '19198_1.jpg', '8700€', '5ch', 'Essence', 2, 'img\\lesimages\\nvehicules', 'image/jpeg', 142630, 0, 0, 0),
(28, 'Porsche', 'SPORT', 'Break, SW', '15ch', 'Blanche', '', '', 'porsche.jpg', '23000€', 'Manuelle', 'Essence', 1, 'img\\lesimages\\nvehicules', 'image/jpeg', 92657, 1, 0, 1),
(29, 'Peugeot', '206', '', '', '', '', '', 'vehicule1.jpg', '', '', '', 2, 'img\\lesimages\\nvehicules', 'image/jpeg', 9040, 1, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ovehicules`
--

CREATE TABLE IF NOT EXISTS `ovehicules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marque` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `carrosserie` varchar(45) DEFAULT NULL,
  `puissance` varchar(45) DEFAULT NULL,
  `couleur` varchar(45) DEFAULT NULL,
  `finission` varchar(45) DEFAULT NULL,
  `commentaire` text,
  `filename` varchar(45) DEFAULT NULL,
  `prix` varchar(45) DEFAULT NULL,
  `boite` varchar(45) DEFAULT NULL,
  `motorisation` varchar(45) DEFAULT NULL,
  `kilometrage` varchar(100) DEFAULT NULL,
  `circulation` varchar(255) DEFAULT NULL,
  `parcs_id` int(11) NOT NULL,
  `infoptions` longtext NOT NULL,
  `annee` varchar(255) NOT NULL,
  `envente` tinyint(1) NOT NULL DEFAULT '0',
  `entransfert` tinyint(1) NOT NULL DEFAULT '0',
  `vendu` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ovehicules_clients1` (`parcs_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='véhicules occasion' AUTO_INCREMENT=7 ;

--
-- Contenu de la table `ovehicules`
--

INSERT INTO `ovehicules` (`id`, `marque`, `model`, `carrosserie`, `puissance`, `couleur`, `finission`, `commentaire`, `filename`, `prix`, `boite`, `motorisation`, `kilometrage`, `circulation`, `parcs_id`, `infoptions`, `annee`, `envente`, `entransfert`, `vendu`) VALUES
(5, 'Porsche', 'BLOO', '', '5ch', 'Blanche', '', '', 'porsche.jpg', '120000€', '', 'Essence', '1798766 km', '2010', 1, '', '2008', 0, 0, 0),
(6, 'Mercedes', 'BLOO', '', '', 'Jaune', '', '', '20121206102408_img_1.jpg', '120000€', '', 'Diesel', '9798766 km', '', 2, '', '2008', 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `parcs`
--

CREATE TABLE IF NOT EXISTS `parcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroparc` mediumint(9) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numeroparc_UNIQUE` (`numeroparc`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `parcs`
--

INSERT INTO `parcs` (`id`, `numeroparc`, `ville`, `tel`) VALUES
(1, 31000, 'Toulouse', '0618513008'),
(2, 92000, 'Paris', '0618513008');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `modified` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='La table users contiendra les administrateurs, identifiés pa' AUTO_INCREMENT=2 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `created`, `modified`) VALUES
(1, 'test', 'c440caddba8d3680493fe336661d0e9b28a9740a', '2012-12-14', '2012-12-14');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_ibfk_1` FOREIGN KEY (`parcs_id`) REFERENCES `parcs` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
