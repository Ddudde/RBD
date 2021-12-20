-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: bib
-- ------------------------------------------------------
-- Server version	5.7.36-log

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
  `Код_абонемента` int(11) NOT NULL,
  `Код_заказа` int(11) NOT NULL,
  `Читателя` int(11) DEFAULT NULL,
  `Библиотекаря` int(11) DEFAULT NULL,
  `Выговоры` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_абонемента`),
  KEY `R_20` (`Код_заказа`),
  CONSTRAINT `абонемент_ibfk_1` FOREIGN KEY (`Код_заказа`) REFERENCES `заказанная_книга` (`Код_заказа`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `абонемент`
--

LOCK TABLES `абонемент` WRITE;
/*!40000 ALTER TABLE `абонемент` DISABLE KEYS */;
/*!40000 ALTER TABLE `абонемент` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `автор_пользователь`
--

DROP TABLE IF EXISTS `автор_пользователь`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `автор_пользователь` (
  `Инициалы` text,
  `Код_пользователя` int(11) NOT NULL,
  `Код_автора` int(11) DEFAULT NULL,
  `Почтовый_адрес` text,
  PRIMARY KEY (`Код_пользователя`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `автор_пользователь`
--

LOCK TABLES `автор_пользователь` WRITE;
/*!40000 ALTER TABLE `автор_пользователь` DISABLE KEYS */;
/*!40000 ALTER TABLE `автор_пользователь` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `автор_по_книгам`
--

DROP TABLE IF EXISTS `автор_по_книгам`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `автор_по_книгам` (
  `Код_автора` int(11) NOT NULL,
  `Фамилия` text,
  `Имя` text,
  `Отчество` text,
  `Дата_рождения` date DEFAULT NULL,
  `Инициалы` text,
  PRIMARY KEY (`Код_автора`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `автор_по_книгам`
--

LOCK TABLES `автор_по_книгам` WRITE;
/*!40000 ALTER TABLE `автор_по_книгам` DISABLE KEYS */;
/*!40000 ALTER TABLE `автор_по_книгам` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `администратор`
--

DROP TABLE IF EXISTS `администратор`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `администратор` (
  `Код_пользователя` int(11) NOT NULL,
  `Дата_регистрации` date DEFAULT NULL,
  `Почтовый_адрес` text,
  PRIMARY KEY (`Код_пользователя`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `администратор`
--

LOCK TABLES `администратор` WRITE;
/*!40000 ALTER TABLE `администратор` DISABLE KEYS */;
/*!40000 ALTER TABLE `администратор` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `библиотекарь`
--

DROP TABLE IF EXISTS `библиотекарь`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `библиотекарь` (
  `Код_пользователя` int(11) NOT NULL,
  `Дата_регистрации` date DEFAULT NULL,
  `Почтовый_адрес` text,
  PRIMARY KEY (`Код_пользователя`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `библиотекарь`
--

LOCK TABLES `библиотекарь` WRITE;
/*!40000 ALTER TABLE `библиотекарь` DISABLE KEYS */;
/*!40000 ALTER TABLE `библиотекарь` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `читатели`
--

DROP TABLE IF EXISTS `читатели`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `читатели` (
  `Код_пользователя` int(11) NOT NULL,
  `Дата_регистрации` date DEFAULT NULL,
  PRIMARY KEY (`Код_пользователя`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `читатели`
--

LOCK TABLES `читатели` WRITE;
/*!40000 ALTER TABLE `читатели` DISABLE KEYS */;
/*!40000 ALTER TABLE `читатели` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `заказ`
--

DROP TABLE IF EXISTS `заказ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заказ` (
  `Код_заказа` int(11) NOT NULL,
  `Дата_заказа` date DEFAULT NULL,
  `Код_абонемента` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_заказа`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказ`
--

LOCK TABLES `заказ` WRITE;
/*!40000 ALTER TABLE `заказ` DISABLE KEYS */;
/*!40000 ALTER TABLE `заказ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `заказанная_книга`
--

DROP TABLE IF EXISTS `заказанная_книга`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заказанная_книга` (
  `Код_заказа` int(11) NOT NULL,
  `Отметка_о_возврате` text,
  `Дата_возврата` date DEFAULT NULL,
  `Фактическая_дата_возврата` date DEFAULT NULL,
  `Код_пользователя` int(11) DEFAULT NULL,
  `Код_книги` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_заказа`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказанная_книга`
--

LOCK TABLES `заказанная_книга` WRITE;
/*!40000 ALTER TABLE `заказанная_книга` DISABLE KEYS */;
/*!40000 ALTER TABLE `заказанная_книга` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `книга`
--

DROP TABLE IF EXISTS `книга`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `книга` (
  `Код_книги` int(11) NOT NULL,
  `Название` text,
  `Издательство` text,
  `Год_издания` int(11) DEFAULT NULL,
  `Код_тематики` int(11) DEFAULT NULL,
  `Администратор` int(11) DEFAULT NULL,
  `Автор` int(11) DEFAULT NULL,
  `Код_автора` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_книги`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `книга`
--

LOCK TABLES `книга` WRITE;
/*!40000 ALTER TABLE `книга` DISABLE KEYS */;
/*!40000 ALTER TABLE `книга` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `паспортные_данные`
--

DROP TABLE IF EXISTS `паспортные_данные`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `паспортные_данные` (
  `Код_паспорта` int(11) NOT NULL,
  `Фамилия` text,
  `Имя` text,
  `Отчество` text,
  `Серия` int(11) DEFAULT NULL,
  `Номер` int(11) DEFAULT NULL,
  `Дата_рождения` date DEFAULT NULL,
  PRIMARY KEY (`Код_паспорта`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `паспортные_данные`
--

LOCK TABLES `паспортные_данные` WRITE;
/*!40000 ALTER TABLE `паспортные_данные` DISABLE KEYS */;
/*!40000 ALTER TABLE `паспортные_данные` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `пользователь`
--

DROP TABLE IF EXISTS `пользователь`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `пользователь` (
  `Код_пользователя` int(11) NOT NULL,
  `Код_паспорта` int(11) NOT NULL,
  `Имя_пользователя` text,
  `Пароль` text,
  `Телефон` text,
  PRIMARY KEY (`Код_пользователя`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `пользователь`
--

LOCK TABLES `пользователь` WRITE;
/*!40000 ALTER TABLE `пользователь` DISABLE KEYS */;
/*!40000 ALTER TABLE `пользователь` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `тематика`
--

DROP TABLE IF EXISTS `тематика`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `тематика` (
  `Код_тематики` int(11) NOT NULL,
  `Название` text,
  `Примечание` text,
  PRIMARY KEY (`Код_тематики`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `тематика`
--

LOCK TABLES `тематика` WRITE;
/*!40000 ALTER TABLE `тематика` DISABLE KEYS */;
/*!40000 ALTER TABLE `тематика` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07  7:57:42
