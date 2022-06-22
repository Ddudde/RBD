-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bib
-- ------------------------------------------------------
-- Server version	5.7.37-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `абонемент`
--

DROP TABLE IF EXISTS `абонемент`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `абонемент` (
  `Код_абонемента` int(11) NOT NULL AUTO_INCREMENT,
  `Читателя` int(11) DEFAULT NULL,
  `Библиотекаря` int(11) DEFAULT NULL,
  `Выговоры` int(11) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_абонемента`),
  KEY `R_18` (`Читателя`),
  KEY `R_34` (`Библиотекаря`),
  CONSTRAINT `абонемент_ibfk_1` FOREIGN KEY (`Читателя`) REFERENCES `читатель` (`Код_пользователя`),
  CONSTRAINT `абонемент_ibfk_2` FOREIGN KEY (`Библиотекаря`) REFERENCES `библиотекарь` (`Код_пользователя`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `абонемент`
--

LOCK TABLES `абонемент` WRITE;
/*!40000 ALTER TABLE `абонемент` DISABLE KEYS */;
INSERT INTO `абонемент` VALUES (1,1,5,0,NULL),(2,2,5,0,NULL),(3,3,7,0,NULL),(4,8,5,0,NULL),(5,9,6,0,NULL);
/*!40000 ALTER TABLE `абонемент` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-18 23:13:28
