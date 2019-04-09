-- MySQL dump 10.13  Distrib 8.0.13, for osx10.13 (x86_64)
--
-- Host: localhost    Database: express_food_db
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresse_livraison`
--

DROP TABLE IF EXISTS `adresse_livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adresse_livraison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `numero_rue` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ville` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `code_postal` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `digicode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `etage` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_id` (`client_id`),
  CONSTRAINT `adresse_livraison_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse_livraison`
--

LOCK TABLES `adresse_livraison` WRITE;
/*!40000 ALTER TABLE `adresse_livraison` DISABLE KEYS */;
INSERT INTO `adresse_livraison` VALUES (5,1,'rue de la troupe','12','Nevez','29920','',''),(6,5,'rue du parc','21','Bordeaux','33000','',''),(7,7,'rue de truc','21','Bordeaux','33000','','');
/*!40000 ALTER TABLE `adresse_livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commande_produit_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `prix_total` decimal(4,2) NOT NULL,
  `statut_livraison` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_livraison` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client2_id` (`client_id`),
  KEY `fk_commande_produit_id` (`commande_produit_id`),
  CONSTRAINT `fk_client2_id` FOREIGN KEY (`client_id`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `fk_commande_produit_id` FOREIGN KEY (`commande_produit_id`) REFERENCES `commande_produit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,1,1,1,16.00,'livree','2018-07-08 22:00:00'),(2,2,1,1,10.00,'livree','2018-07-08 22:00:00'),(3,3,5,2,9.00,'livree','2018-04-12 22:00:00'),(4,4,5,2,8.00,'livree','2018-04-12 22:00:00'),(5,5,7,2,45.00,'livree','2018-11-18 23:00:00'),(6,6,7,2,20.00,'livree','2018-11-18 23:00:00'),(7,7,7,3,8.00,'livree','2018-11-20 23:00:00');
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande_produit`
--

DROP TABLE IF EXISTS `commande_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commande_produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produit_id` int(11) NOT NULL,
  `date_ajout` timestamp NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produit3_id` (`produit_id`),
  CONSTRAINT `fk_produit3_id` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_produit`
--

LOCK TABLES `commande_produit` WRITE;
/*!40000 ALTER TABLE `commande_produit` DISABLE KEYS */;
INSERT INTO `commande_produit` VALUES (1,2,'2018-04-04 22:00:00',2),(2,4,'2018-04-04 22:00:00',2),(3,3,'2018-04-12 22:00:00',1),(4,5,'2018-04-12 22:00:00',1),(5,3,'2018-11-18 23:00:00',5),(6,5,'2018-11-18 23:00:00',5),(7,5,'2018-11-20 23:00:00',2);
/*!40000 ALTER TABLE `commande_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `valeur_energetique` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`id`) REFERENCES `produit` (`id`),
  CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`id`) REFERENCES `produit` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (2,'tagliatelles','200Kcal'),(3,'lardons','100Kcal'),(4,'creme','100Kcal'),(5,'gruyere','100Kcal');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livreur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse_livraison_id` int(11) NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `statut` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `latitude` decimal(12,9) NOT NULL,
  `longitude` decimal(12,9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_adresse_livraison_id` (`adresse_livraison_id`),
  CONSTRAINT `fk_adresse_livraison_id` FOREIGN KEY (`adresse_livraison_id`) REFERENCES `adresse_livraison` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livreur`
--

LOCK TABLES `livreur` WRITE;
/*!40000 ALTER TABLE `livreur` DISABLE KEYS */;
INSERT INTO `livreur` VALUES (1,5,'tom','sawyer','0687677890','occupe',345.765987876,543.789678567),(2,6,'matt','brody','0687236534','occupe',398.765987809,309.789678511),(3,7,'eddy','zwang','0687236439','occupe',111.765987811,999.789678588);
/*!40000 ALTER TABLE `livreur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `descriptif` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `stock` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_ajout` timestamp NOT NULL,
  `date_suppression` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ingredient_id` (`ingredient_id`),
  CONSTRAINT `fk_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (2,NULL,'pates carbonara',8,'plat de pates','illimite','2017-12-31 23:00:00',NULL),(3,NULL,'pates bolognaise',9,'plat de pates','illimite','2017-12-31 23:00:00',NULL),(4,NULL,'tarte fraises',5,'tarte','illimite','2017-12-31 23:00:00',NULL),(5,NULL,'tarte pommes',4,'tarte','illimite','2017-12-31 23:00:00',NULL);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `adresse_facturation` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `date_creation_compte` timestamp NOT NULL,
  `date_suppression_compte` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'[\"role_user\"]','paul','trez','0678965654','paul.trez@gmail.com','madonna','12 rue de la troupe, 29920 Nevez','2018-01-31 23:00:00','2019-03-02 23:00:00'),(5,'[\"role_user\"]','Marc','Twain','0664534454','m.t@gmail.com','jhgjhfa','21 rue du parc, 33000 Bordeaux','2018-04-11 22:00:00',NULL),(6,'[\"role_admin\"]','Jean','Gure','06644567','jean.gure@gmail.com','jssjhfa','21 rue du bassin, 33000 Bordeaux','2018-04-11 22:00:00',NULL),(7,'[\"role_user\"]','Franck','Pouf','06644523','franck.pouf@gmail.com','jssjhdhd','21 rue de truc, 33000 Bordeaux','2018-04-06 22:00:00',NULL);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-06 15:58:43
