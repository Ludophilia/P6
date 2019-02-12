-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: 6db
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse` (
  `id_adresse` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero_voie` int(10) unsigned NOT NULL,
  `nom_voie` varchar(150) NOT NULL,
  `code_postal` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_adresse`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,154,'Parc Du Douet Baron',90971),(2,148,'Place De L Entrepot',73802),(3,115,'Place Leon Kraenner',34167),(4,43,'Route Des Jardins',94415),(5,132,'Avenue Des Seigneurs',86123),(6,175,'Route Du Bailliage',49417),(7,143,'Parc De La Fillolie',1197),(8,135,'Place Aime Benoit Seilliere',22625),(9,61,'Boulevard Gutenberg',88352),(10,182,'Route Albert Garrigat',52495),(11,48,'Venelle De La Mue',48231),(12,189,'Cours De La Nuit Etoilee',91357),(13,65,'Cours De Saint Lo',47776),(14,129,'Route Du Tripot',29441),(15,7,'Square Jules Valles',17903),(16,102,'Route Du Falkenstein',62855),(17,24,'Voie Albert Claveille Prolonge',94972),(18,125,'Cours De Boisse',7114),(19,187,'Route Lucien Videau',18435),(20,64,'Rue Du Grand Moulin',76446);
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choix_client_livraison`
--

DROP TABLE IF EXISTS `choix_client_livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `choix_client_livraison` (
  `id_choix_livraison` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_client` int(10) unsigned NOT NULL,
  `id_adresse` int(10) unsigned NOT NULL,
  `option_livraison` varchar(100) NOT NULL,
  `paiement_livraison` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id_choix_livraison`),
  KEY `fk_id_adresse_idx` (`id_adresse`),
  KEY `fk_id_client_choix_client_livraison` (`id_client`),
  CONSTRAINT `fk_id_adresse_choix_client_livraison` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_client_choix_client_livraison` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choix_client_livraison`
--

LOCK TABLES `choix_client_livraison` WRITE;
/*!40000 ALTER TABLE `choix_client_livraison` DISABLE KEYS */;
INSERT INTO `choix_client_livraison` VALUES (1,1,17,'livraison_domicile',1);
/*!40000 ALTER TABLE `choix_client_livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id_client` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `civilite` varchar(12) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse_mail` varchar(150) NOT NULL,
  `numero_telephone` varchar(12) NOT NULL,
  `mot_de_passe` varchar(48) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `adresse_mail_UNIQUE` (`adresse_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Monsieur','Wilson','Abel','subopercle2026@orange.fr','0795151280','9924e3c28df23c39aafa712fb7307ee3'),(2,'Madame','St-Jean','Marie','volvas1906@gmail.com','0674501616','8e692502b6613500b301e35d9ea021ff'),(3,'Monsieur','Loiseau','Anthony','ambarella2047@yahoo.fr','0769441528','32b7f2feb030d6a8352250d7d685c463'),(4,'Monsieur','Lallement','Octave','husk1993@orange.fr','0770437863','41045eb387433a6d49f0df8e92ea7274'),(5,'Monsieur','Bruneau','Moussa','upseek1850@yahoo.fr','0700638864','b46c004e4e930b4da2bd97c1ba9cab3c'),(6,'Monsieur','Marteau','Imran','cense1958@openclassrooms.com','0788730007','1d4cb61b08fbd66f0cb9a243a7befdd6'),(7,'Madame','Grenon','Jessica','batule1888@hotmail.fr','0652607651','62f9fc50c0a3a23369769a21289baf81'),(8,'Monsieur','Manseau','Amiens','contraptious1977@orange.fr','0755868055','b8dc3337ef1d81e4917f7dbed873e126'),(9,'Madame','Guérard','Gabriella','hubristic1891@laposte.net','0608660559','47b9f34064b6e3e8f85e1a9fca465f22'),(10,'Madame','Charland','Harriet','bagging1801@hotmail.fr','0648240480','7fdd2a83a22017409b684ecac7c159b0');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `numero_commande` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_client` int(10) unsigned NOT NULL,
  `montant` decimal(9,2) unsigned NOT NULL,
  `date_creation` datetime NOT NULL,
  `choix_livraison` int(10) unsigned NOT NULL,
  `id_facture` int(10) unsigned NOT NULL,
  `id_pizzeria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`numero_commande`),
  KEY `fk_ref_client_idx` (`ref_client`),
  KEY `fk_choix_livraison_idx` (`choix_livraison`),
  KEY `fk_commande_facture1_idx` (`id_facture`),
  KEY `fk_pizzeria_id_idx` (`id_pizzeria`),
  CONSTRAINT `fk_choix_livraison_commande` FOREIGN KEY (`choix_livraison`) REFERENCES `choix_client_livraison` (`id_choix_livraison`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_facture_id_commande` FOREIGN KEY (`id_facture`) REFERENCES `facture` (`id_facture`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizzeria_id_commande` FOREIGN KEY (`id_pizzeria`) REFERENCES `pizzeria` (`id_pizzeria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ref_client_commande` FOREIGN KEY (`ref_client`) REFERENCES `client` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,1,12.95,'2019-02-11 07:43:07',1,1,4);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composition_produit`
--

DROP TABLE IF EXISTS `composition_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composition_produit` (
  `id_produit` int(10) unsigned NOT NULL,
  `id_ingredient` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_produit`,`id_ingredient`),
  KEY `fk_id_produit_idx` (`id_produit`),
  KEY `fk_id_ingredient_composition_produit` (`id_ingredient`),
  CONSTRAINT `fk_id_ingredient_composition_produit` FOREIGN KEY (`id_ingredient`) REFERENCES `stock` (`id_stock`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_produit_composition_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composition_produit`
--

LOCK TABLES `composition_produit` WRITE;
/*!40000 ALTER TABLE `composition_produit` DISABLE KEYS */;
INSERT INTO `composition_produit` VALUES (1,1),(1,3),(1,5),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(2,1),(2,3),(2,4),(2,5),(2,6),(2,10),(2,15),(2,16),(3,17),(4,18),(5,19);
/*!40000 ALTER TABLE `composition_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenu_commande`
--

DROP TABLE IF EXISTS `contenu_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenu_commande` (
  `id_commande` int(10) unsigned NOT NULL,
  `id_produit` int(10) unsigned NOT NULL,
  `quantite_produit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_commande`,`id_produit`),
  KEY `fk_id_produit_idx` (`id_produit`),
  CONSTRAINT `fk_id_commande_contenu_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`numero_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_produit_contenu_commande` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenu_commande`
--

LOCK TABLES `contenu_commande` WRITE;
/*!40000 ALTER TABLE `contenu_commande` DISABLE KEYS */;
INSERT INTO `contenu_commande` VALUES (1,1,1),(1,4,2);
/*!40000 ALTER TABLE `contenu_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe`
--

DROP TABLE IF EXISTS `employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employe` (
  `id_employe` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `civilite` varchar(12) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `fonction` varchar(100) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `commande_en_traitement` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_employe`),
  KEY `fk_commande_traitement_idx` (`commande_en_traitement`),
  CONSTRAINT `fk_commande_traitement_employe` FOREIGN KEY (`commande_en_traitement`) REFERENCES `commande` (`numero_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe`
--

LOCK TABLES `employe` WRITE;
/*!40000 ALTER TABLE `employe` DISABLE KEYS */;
INSERT INTO `employe` VALUES (1,'Monsieur','Barbeau','Dabney','Livreur',-85.228,116.353,NULL),(2,'Madame','Dumortier','Lisette','Preparateur de Commande',1.7423,46.8142,NULL),(3,'Monsieur','St-Hilaire','Mahdi','Preparateur de Commande',82.2629,-38.2675,NULL),(4,'Madame','Lecuyer','Noémie','Preparateur de Commande',-42.0326,152.888,NULL),(5,'Madame','Flamand','Kahina','Livreur',-29.2968,-58.9732,NULL),(6,'Madame','Savage','Raphaëlle','Preparateur de Commande',-28.5918,37.5438,NULL),(7,'Madame','Piché','Amélie','Preparateur de Commande',-47.2568,-34.8969,NULL),(8,'Madame','Pinard','Lyla','Preparateur de Commande',-68.7636,110.113,NULL),(9,'Madame','Bossé','Lilly','Livreur',56.0195,-123.693,NULL),(10,'Madame','Bayle','Léa','Preparateur de Commande',-41.2387,57.8013,NULL);
/*!40000 ALTER TABLE `employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etat_paiement`
--

DROP TABLE IF EXISTS `etat_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etat_paiement` (
  `id_etat_paiement` int(11) NOT NULL AUTO_INCREMENT,
  `ref_commande` int(10) unsigned NOT NULL,
  `etat_paiement` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_etat_paiement`),
  KEY `fk_ref_commande_idx` (`ref_commande`),
  CONSTRAINT `fk_ref_commande_etat_paiement` FOREIGN KEY (`ref_commande`) REFERENCES `commande` (`numero_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat_paiement`
--

LOCK TABLES `etat_paiement` WRITE;
/*!40000 ALTER TABLE `etat_paiement` DISABLE KEYS */;
INSERT INTO `etat_paiement` VALUES (1,1,'en attente','2019-02-11 07:43:07');
/*!40000 ALTER TABLE `etat_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etat_preparation`
--

DROP TABLE IF EXISTS `etat_preparation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etat_preparation` (
  `id_etat_preparation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_commande` int(10) unsigned NOT NULL,
  `etat_preparation` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_etat_preparation`),
  KEY `fk_ref_commande_idx` (`ref_commande`),
  CONSTRAINT `fk_ref_commande_etat_preparation` FOREIGN KEY (`ref_commande`) REFERENCES `commande` (`numero_commande`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat_preparation`
--

LOCK TABLES `etat_preparation` WRITE;
/*!40000 ALTER TABLE `etat_preparation` DISABLE KEYS */;
INSERT INTO `etat_preparation` VALUES (1,1,'en attente','2019-02-11 07:43:07');
/*!40000 ALTER TABLE `etat_preparation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facture` (
  `id_facture` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chemin_facture` varchar(200) NOT NULL,
  PRIMARY KEY (`id_facture`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
INSERT INTO `facture` VALUES (1,'/folder/invoice_folder/00001.pdf');
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illustration_produit`
--

DROP TABLE IF EXISTS `illustration_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `illustration_produit` (
  `id_illustration_produit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_produit` int(10) unsigned NOT NULL,
  `ref_media` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_illustration_produit`),
  KEY `fk_ref_produit_idx` (`ref_produit`),
  KEY `fk_ref_media_idx` (`ref_media`),
  CONSTRAINT `fk_ref_media_illustration_produit` FOREIGN KEY (`ref_media`) REFERENCES `media` (`id_media`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ref_produit_illustration_produit` FOREIGN KEY (`ref_produit`) REFERENCES `produit` (`id_produit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illustration_produit`
--

LOCK TABLES `illustration_produit` WRITE;
/*!40000 ALTER TABLE `illustration_produit` DISABLE KEYS */;
INSERT INTO `illustration_produit` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,5),(6,3,6),(7,4,7),(8,4,8),(9,5,9),(10,5,10);
/*!40000 ALTER TABLE `illustration_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illustration_recette`
--

DROP TABLE IF EXISTS `illustration_recette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `illustration_recette` (
  `id_illustration_recette` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ref_recette` int(10) unsigned NOT NULL,
  `ref_media` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_illustration_recette`),
  KEY `fk_ref_recette_idx` (`ref_recette`),
  KEY `fk_ref_media_idx` (`ref_media`),
  CONSTRAINT `fk_ref_media_illustration_recette` FOREIGN KEY (`ref_media`) REFERENCES `media` (`id_media`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ref_recette_illustration_recette` FOREIGN KEY (`ref_recette`) REFERENCES `recette` (`id_recette`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illustration_recette`
--

LOCK TABLES `illustration_recette` WRITE;
/*!40000 ALTER TABLE `illustration_recette` DISABLE KEYS */;
INSERT INTO `illustration_recette` VALUES (1,1,11),(2,1,12),(3,1,13),(4,1,14),(5,1,15),(6,2,16),(7,2,17),(8,2,18),(9,2,19);
/*!40000 ALTER TABLE `illustration_recette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id_media` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `type_media` varchar(50) NOT NULL,
  `chemin_media` varchar(200) NOT NULL,
  PRIMARY KEY (`id_media`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'pizza_royale_storefront','img/jpeg','/folder/media_folder/royale_storefront.jpg'),(2,'pizza_royale_details','img/jpeg','/folder/media_folder/royale_details.jpg'),(3,'pizza_3fromages_storefront','img/jpeg','/folder/media_folder/3fromages_storefront.jpg'),(4,'pizza_3fromages_details','img/jpeg','/folder/media_folder/3fromages_details.jpg'),(5,'vittel_50cl_storefront','img/jpeg','/folder/media_folder/vittel_50cl_storefront.jpg'),(6,'vittel_50cl_details','img/jpeg','/folder/media_folder/vittel_50cl_details.jpg'),(7,'coca_zero_50cl_storefront','img/jpeg','/folder/media_folder/coca_zero_50cl_storefront.jpg'),(8,'coca_zero_50cl_details','img/jpeg','/folder/media_folder/coca_zero_50cl_details.jpg'),(9,'minute_maid_33cl_storefront','img/jpeg','/folder/media_folder/minute_maid_33cl_storefront.jpg'),(10,'minute_maid_33cl_details','img/jpeg','/folder/media_folder/minute_maid_33cl_details.jpg'),(11,'pizza_royale_step1','img/jpeg','/folder/media_folder/royale_step1.jpg'),(12,'pizza_royale_step2','img/jpeg','/folder/media_folder/royale_step2.jpg'),(13,'pizza_royale_step3','img/jpeg','/folder/media_folder/royale_step3.jpg'),(14,'pizza_royale_step4','img/jpeg','/folder/media_folder/royale_step4.jpg'),(15,'pizza_royale_step5','img/jpeg','/folder/media_folder/royale_step5.jpg'),(16,'pizza_3fromages_step1','img/jpeg','/folder/media_folder/3fromages_step1.jpg'),(17,'pizza_3fromages_step2','img/jpeg','/folder/media_folder/3fromages_step2.jpg'),(18,'pizza_3fromages_step3','img/jpeg','/folder/media_folder/3fromages_step3.jpg'),(19,'pizza_3fromages_step4','img/jpeg','/folder/media_folder/3fromages_step4.jpg');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzeria`
--

DROP TABLE IF EXISTS `pizzeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizzeria` (
  `id_pizzeria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom_pizzeria` varchar(100) NOT NULL,
  `id_adresse` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_pizzeria`),
  KEY `fk_id_adresse_idx` (`id_adresse`),
  CONSTRAINT `fk_id_adresse_pizzeria` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzeria`
--

LOCK TABLES `pizzeria` WRITE;
/*!40000 ALTER TABLE `pizzeria` DISABLE KEYS */;
INSERT INTO `pizzeria` VALUES (1,'OC Pizza - Parc Du Douet Baron',1),(2,'OC Pizza - Place De L\'Entrepot',2),(3,'OC Pizza - Place Leon Kraenner',3),(4,'OC Pizza - Route Des Jardins',4),(5,'OC Pizza - Avenue Des Seigneurs',5);
/*!40000 ALTER TABLE `pizzeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `id_produit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `categorie` varchar(100) NOT NULL,
  `prix_ttc` decimal(6,2) unsigned NOT NULL,
  PRIMARY KEY (`id_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'Pizza Royale L','Le classique qui réveillera vos sens (et vos souvenirs) !','Pizzas',9.95),(2,'Pizza 3 Fromages L','Chèvre roquefort et mozarella','Pizzas',9.95),(3,'Vittel 50cl',' ','Boissons',1.00),(4,'Coca cola Zero 50cl',' ','Boissons',1.50),(5,'Minute Maid Orange Sans Pulpe 33cl',' ','Boissons',1.50);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recette`
--

DROP TABLE IF EXISTS `recette`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recette` (
  `id_recette` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reference_produit` int(10) unsigned NOT NULL,
  `recette` varchar(2000) NOT NULL,
  PRIMARY KEY (`id_recette`),
  KEY `fk_reference_produit_idx` (`reference_produit`),
  CONSTRAINT `fk_reference_produit_recette` FOREIGN KEY (`reference_produit`) REFERENCES `produit` (`id_produit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recette`
--

LOCK TABLES `recette` WRITE;
/*!40000 ALTER TABLE `recette` DISABLE KEYS */;
INSERT INTO `recette` VALUES (1,1,'/folder/recipe_folder/pizza_royale.htm'),(2,2,'/folder/recipe_folder/pizza_3_fromages.htm');
/*!40000 ALTER TABLE `recette` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `id_stock` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `categorie` varchar(45) DEFAULT NULL,
  `quantite_restante` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_stock`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'Pâte à Pizza L','Ingrédients pour Pizzas',180),(2,'Levure unité pour 1 Pizza L','Ingrédients pour Pizzas',669),(3,'Mozarella lot pour 1 Pizza L','Ingrédients pour Pizzas',102),(4,'Fromage de Chèvre lot pour 1 Pizza L','Ingrédients pour Pizzas',134),(5,'Gruyère lot pour 1 Pizza L','Ingrédients pour Pizzas',170),(6,'Roquefort lot poour 1 Pizza L','Ingrédients pour Pizzas',185),(7,'Lardons pour 1 Pizza L','Ingrédients pour Pizzas',200),(8,'Morceaux Jambon lot pour 1 Pizza L','Ingrédients pour Pizzas',217),(9,'Tomates Fraîches lot 1 Pizza L','Ingrédients pour Pizzas',170),(10,'Sauce tomate lot 1 Pizza L','Ingrédients pour Pizzas',300),(11,'Olives noires lot 1 Pizza L','Ingrédients pour Pizzas',147),(12,'Oignons lot pour 1 Pizza L','Ingrédients pour Pizzas',245),(13,'Huile d\'olive dose pour 1 Pizza L','Ingrédients pour Pizzas',234),(14,'Champignons de paris lot 1 Pizza L','Ingrédients pour Pizzas',350),(15,'Sel unité pour 1 Pizza L','Ingrédients pour Pizzas',534),(16,'Poivre unité pour 1 Pizza L','Ingrédients pour Pizzas',534),(17,'Vittel 50cl','Boissons',111),(18,'Coca Cola Zero 50cl','Boissons',95),(19,'Minute Maid Orange Sans Pulpe 33cl','Boissons',55);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-12 10:35:04
