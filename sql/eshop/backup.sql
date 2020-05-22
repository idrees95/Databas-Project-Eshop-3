-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for CYGWIN (x86_64)
--
-- Host: 127.0.0.1    Database: eshop
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faktura` (
  `fakturanummer` int NOT NULL,
  `kundId` int NOT NULL,
  `pris` int NOT NULL,
  `datum` date DEFAULT NULL,
  `orderId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`fakturanummer`),
  KEY `kundId` (`kundId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `faktura_ibfk_1` FOREIGN KEY (`kundId`) REFERENCES `kund` (`id`),
  CONSTRAINT `faktura_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fakturarader`
--

DROP TABLE IF EXISTS `fakturarader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fakturarader` (
  `antprodukter1` int NOT NULL,
  `fakturanummer1` int NOT NULL,
  `produktId` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`fakturanummer1`,`produktId`),
  KEY `produktId` (`produktId`),
  CONSTRAINT `fakturarader_ibfk_1` FOREIGN KEY (`produktId`) REFERENCES `produkt` (`id`),
  CONSTRAINT `fakturarader_ibfk_2` FOREIGN KEY (`fakturanummer1`) REFERENCES `faktura` (`fakturanummer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fakturarader`
--

LOCK TABLES `fakturarader` WRITE;
/*!40000 ALTER TABLE `fakturarader` DISABLE KEYS */;
/*!40000 ALTER TABLE `fakturarader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id` varchar(40) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES ('kaffe'),('kaffebland'),('mugg'),('porslin'),('te');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kund`
--

DROP TABLE IF EXISTS `kund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kund` (
  `id` int NOT NULL,
  `fornamn` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `efternamn` varchar(30) COLLATE utf8_swedish_ci NOT NULL,
  `adress` varchar(80) COLLATE utf8_swedish_ci NOT NULL,
  `postnummer` int NOT NULL,
  `ort` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `land` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  `fodd` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund`
--

LOCK TABLES `kund` WRITE;
/*!40000 ALTER TABLE `kund` DISABLE KEYS */;
INSERT INTO `kund` VALUES (1,'Mikael ','Roos','Centrumgatan 1',11522,'Avesta','Sverige','070 42 42 42','0000-00-00'),(2,'John','Doe','Skogen 1',17443,'Sundbyberg','Sverige','070 555 555','0000-00-00'),(3,'Jane','Doe','Skogen 1',77551,'Syva','Norge','070 556 556','2001-01-00'),(4,'Mumintrollet','Mumin','skogen 3',25964,'huga','Danmark','070 111 111','2009-11-01');
/*!40000 ALTER TABLE `kund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lagerhylla`
--

DROP TABLE IF EXISTS `lagerhylla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lagerhylla` (
  `plats1` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`plats1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lagerhylla`
--

LOCK TABLES `lagerhylla` WRITE;
/*!40000 ALTER TABLE `lagerhylla` DISABLE KEYS */;
INSERT INTO `lagerhylla` VALUES ('A:101'),('B:101'),('C:101');
/*!40000 ALTER TABLE `lagerhylla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logg`
--

DROP TABLE IF EXISTS `logg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `when` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `what` varchar(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `produkt` char(20) COLLATE utf8_swedish_ci DEFAULT NULL,
  `prodnamn` varchar(40) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logg`
--

LOCK TABLES `logg` WRITE;
/*!40000 ALTER TABLE `logg` DISABLE KEYS */;
INSERT INTO `logg` VALUES (1,'2020-05-20 14:34:33','addera produkt','cappuccino5','Kaffemugg med dbwebb-tryck'),(2,'2020-05-20 14:34:33','ta bort produkt','cappuccino5','Kaffemugg med dbwebb-tryck'),(3,'2020-05-20 14:35:18','addera produkt','kaffe1','Kaffemugg med dbwebb-tryck '),(4,'2020-05-20 14:35:18','addera produkt','te1','Temugg med dbwebb-tryck '),(5,'2020-05-20 14:35:18','addera produkt','kaffemix1','Kaffeblandning med dbwebb-krydda '),(6,'2020-05-20 14:54:23','addera produkt','Greentee','Kaffemugg med dbwebb-tryck'),(7,'2020-05-20 14:56:06','ta bort produkt','Greentee','Kaffemugg med dbwebb-tryck'),(8,'2020-05-20 14:57:09','addera produkt','Greentee25','Kaffemugg med dbwebb-tryck'),(9,'2020-05-20 14:57:16','addera produkt','Greentee26','Kaffemugg med dbwebb-tryck'),(10,'2020-05-20 14:57:26','addera produkt','Greentee30','Kaffemugg med dbwebb-tryck'),(11,'2020-05-20 14:57:39','addera produkt','Blackcoffe','Kaffemugg med dbwebb-tryck'),(12,'2020-05-20 15:00:46','uppdatera','Blackcoffe','Kaffemugg med'),(13,'2020-05-20 15:01:02','addera produkt','Blacktea','Kaffemugg med dbwebb-tryck'),(14,'2020-05-20 15:01:15','addera produkt','Lemon tea','Kaffemugg med dbwebb-tryck'),(15,'2020-05-20 15:01:33','addera produkt','Mild coffee','Kaffemugg med dbwebb-tryck'),(16,'2020-05-20 15:03:03','uppdatera','Blacktea','Kaffemugg med'),(17,'2020-05-20 15:04:12','uppdatera','Greentee30','Kaffemugg med'),(18,'2020-05-20 15:04:26','uppdatera','kaffe1','Kaffemugg med'),(19,'2020-05-20 15:04:47','addera produkt','Strong coffe','Kaffemugg med dbwebb-tryck'),(20,'2020-05-20 15:06:29','uppdatera','kaffemix1','Kaffemugg med'),(21,'2020-05-20 15:14:20','ta bort produkt','Blackcoffe','Kaffemugg med'),(22,'2020-05-20 15:14:24','ta bort produkt','Blacktea','Kaffemugg med'),(23,'2020-05-20 15:14:29','ta bort produkt','Greentee25','Kaffemugg med dbwebb-tryck'),(24,'2020-05-20 15:14:33','ta bort produkt','Greentee26','Kaffemugg med dbwebb-tryck'),(25,'2020-05-20 15:14:39','ta bort produkt','Greentee30','Kaffemugg med'),(26,'2020-05-20 15:14:43','ta bort produkt','Lemon tea','Kaffemugg med dbwebb-tryck'),(27,'2020-05-20 15:14:47','ta bort produkt','Mild coffee','Kaffemugg med dbwebb-tryck'),(28,'2020-05-20 15:14:52','ta bort produkt','Strong coffe','Kaffemugg med dbwebb-tryck'),(29,'2020-05-20 15:25:54','uppdatera','kaffe1','Kaffemugg med'),(30,'2020-05-20 15:29:27','addera produkt','te2','Green tea'),(31,'2020-05-20 15:29:31','ta bort produkt','te2','Green tea'),(32,'2020-05-20 15:31:03','addera produkt','te2','Green tea'),(33,'2020-05-20 15:40:48','addera produkt','te3','Black tee'),(34,'2020-05-20 15:40:59','ta bort produkt','te3','Black tee');
/*!40000 ALTER TABLE `logg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kundId` int NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` timestamp NULL DEFAULT NULL,
  `orderd` datetime DEFAULT NULL,
  `delivered` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kundId` (`kundId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`kundId`) REFERENCES `kund` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (2,1,'2020-05-20 15:26:10','2020-05-20 15:41:56',NULL,'2020-05-20 17:41:56','2020-05-20 17:26:33'),(3,1,'2020-05-20 15:41:40','2020-05-20 15:42:24',NULL,NULL,'2020-05-20 17:42:24');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderrader`
--

DROP TABLE IF EXISTS `orderrader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderrader` (
  `antprodukter` int NOT NULL,
  `orderId` int NOT NULL,
  `produktId` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  KEY `orderId` (`orderId`),
  KEY `produktId` (`produktId`),
  CONSTRAINT `orderrader_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`),
  CONSTRAINT `orderrader_ibfk_2` FOREIGN KEY (`produktId`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderrader`
--

LOCK TABLES `orderrader` WRITE;
/*!40000 ALTER TABLE `orderrader` DISABLE KEYS */;
INSERT INTO `orderrader` VALUES (2,2,'kaffemix1'),(2,3,'kaffemix1');
/*!40000 ALTER TABLE `orderrader` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt` (
  `id` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `pris` int NOT NULL,
  `prodnamn` varchar(40) COLLATE utf8_swedish_ci NOT NULL,
  `bildlank` varchar(50) COLLATE utf8_swedish_ci DEFAULT NULL,
  `beskrivning` varchar(100) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES ('kaffe1',55,'Kaffemugg med','/img/eshop/kaffeko','Fin kaffemugg'),('kaffemix1',53,'Kaffemugg med','/img/eshop/kaffeko','Fin kaffemugg'),('te1',79,'Temugg med dbwebb-tryck ','/img/eshop/temugg.png','En stotlig matt helsvart temugg, extra stor, med gron dbwebb-logo.'),('te2',25,'Green tea',NULL,'Good tea');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `addera_produkt_logg` AFTER INSERT ON `produkt` FOR EACH ROW BEGIN
    INSERT INTO logg (`what`, `produkt`, `prodnamn`)
    VALUES ('addera produkt',  NEW.id, NEW.prodnamn);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `uppdatera_produkt_logg` AFTER UPDATE ON `produkt` FOR EACH ROW INSERT INTO logg (`what`, `produkt`, `prodnamn`)
        VALUES ('uppdatera', NEW.id, NEW.prodnamn) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tabort_produkt_logg` AFTER DELETE ON `produkt` FOR EACH ROW BEGIN
    INSERT INTO logg (`what`, `produkt`, `prodnamn`)
    VALUES ('ta bort produkt', OLD.id, OLD.prodnamn);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produkt2kategori`
--

DROP TABLE IF EXISTS `produkt2kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt2kategori` (
  `produkt_id` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `kategori_id` varchar(40) COLLATE utf8_swedish_ci NOT NULL,
  KEY `produkt_id` (`produkt_id`),
  KEY `kategori_id` (`kategori_id`),
  CONSTRAINT `produkt2kategori_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`),
  CONSTRAINT `produkt2kategori_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt2kategori`
--

LOCK TABLES `produkt2kategori` WRITE;
/*!40000 ALTER TABLE `produkt2kategori` DISABLE KEYS */;
INSERT INTO `produkt2kategori` VALUES ('kaffe1','kaffe'),('kaffe1','mugg'),('kaffe1','porslin'),('te1','te'),('kaffemix1','kaffebland'),('kaffemix1','kaffe'),('te1','mugg');
/*!40000 ALTER TABLE `produkt2kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt2lager`
--

DROP TABLE IF EXISTS `produkt2lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt2lager` (
  `produkt_id` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `plats` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  `antal` int DEFAULT NULL,
  KEY `produkt_id` (`produkt_id`),
  KEY `plats` (`plats`),
  CONSTRAINT `produkt2lager_ibfk_1` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`),
  CONSTRAINT `produkt2lager_ibfk_2` FOREIGN KEY (`plats`) REFERENCES `lagerhylla` (`plats1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt2lager`
--

LOCK TABLES `produkt2lager` WRITE;
/*!40000 ALTER TABLE `produkt2lager` DISABLE KEYS */;
INSERT INTO `produkt2lager` VALUES ('kaffe1','A:101',7),('te1','B:101',12),('kaffemix1','C:101',20),('kaffe1','A:101',100);
/*!40000 ALTER TABLE `produkt2lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `produkter_i_lagret`
--

DROP TABLE IF EXISTS `produkter_i_lagret`;
/*!50001 DROP VIEW IF EXISTS `produkter_i_lagret`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `produkter_i_lagret` (
  `id` tinyint NOT NULL,
  `namn` tinyint NOT NULL,
  `plats` tinyint NOT NULL,
  `antal` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `akronym` char(8) NOT NULL,
  `password` char(32) DEFAULT NULL,
  PRIMARY KEY (`akronym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('user1','a722c63db8ec8625af6cf71cb8c2d939'),('user2','c1572d05424d0ecb2a65ec6a82aeacbf');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `produkter_i_lagret`
--

/*!50001 DROP TABLE IF EXISTS `produkter_i_lagret`*/;
/*!50001 DROP VIEW IF EXISTS `produkter_i_lagret`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `produkter_i_lagret` AS select `p`.`id` AS `id`,`p`.`prodnamn` AS `namn`,`p_l`.`plats` AS `plats`,`p_l`.`antal` AS `antal` from (`produkt` `p` left join `produkt2lager` `p_l` on((`p`.`id` = `p_l`.`produkt_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-20 18:09:13
