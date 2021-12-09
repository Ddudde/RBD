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
  `Код_абонемента` int(11) NOT NULL AUTO_INCREMENT,
  `Код_заказа` int(11) NOT NULL,
  `Читателя` int(11) DEFAULT NULL,
  `Библиотекаря` int(11) DEFAULT NULL,
  `Выговоры` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_абонемента`),
  KEY `R_18` (`Читателя`),
  KEY `R_34` (`Библиотекаря`),
  KEY `абонемент_ibfk_3` (`Код_заказа`),
  CONSTRAINT `абонемент_ibfk_1` FOREIGN KEY (`Читателя`) REFERENCES `читатели` (`Код_пользователя`),
  CONSTRAINT `абонемент_ibfk_2` FOREIGN KEY (`Библиотекаря`) REFERENCES `библиотекарь` (`Код_пользователя`),
  CONSTRAINT `абонемент_ibfk_3` FOREIGN KEY (`Код_заказа`) REFERENCES `заказанная_книга` (`Код_заказа`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `Инициалы` mediumtext,
  `Код_пользователя` int(11) NOT NULL,
  `Код_автора` int(11) DEFAULT NULL,
  `Почтовый_адрес` mediumtext,
  PRIMARY KEY (`Код_пользователя`),
  KEY `R_44` (`Код_автора`),
  CONSTRAINT `автор_пользователь_ibfk_1` FOREIGN KEY (`Код_пользователя`) REFERENCES `пользователь` (`Код_пользователя`) ON DELETE CASCADE,
  CONSTRAINT `автор_пользователь_ibfk_2` FOREIGN KEY (`Код_автора`) REFERENCES `автор_по_книгам` (`Код_автора`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `Код_автора` int(11) NOT NULL AUTO_INCREMENT,
  `Фамилия` mediumtext,
  `Имя` mediumtext,
  `Отчество` mediumtext,
  `Дата_рождения` date DEFAULT NULL,
  `Инициалы` mediumtext,
  PRIMARY KEY (`Код_автора`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `автор_по_книгам`
--

LOCK TABLES `автор_по_книгам` WRITE;
/*!40000 ALTER TABLE `автор_по_книгам` DISABLE KEYS */;
INSERT INTO `автор_по_книгам` VALUES (1,'Харари','Юваль','Ной','1976-02-24','Ю.Н.'),(2,'Клинтон','Ричард','Докинз','1941-03-26','Р.Д.'),(3,'Фейнман','Ричард','Филлипс','1918-05-11','Р.Ф.'),(4,'Дарвин','Чарлз','Роберт','1809-02-12','Ч.Р.'),(5,'Блэр','Эрик','Артур','1903-06-25','Э.А.'),(6,'Бройнинг','Лоретта','Грациано','1953-10-30','Л.Г.'),(7,'Булгаков','Михаил','Афанасьевич','1891-05-15','М.А.'),(8,'Герберт-младший','Франклин','Патрик','1920-10-08','Ф.П.'),(9,'Достоевский','Фёдор','Михайлович','1821-11-11','Ф.М.'),(10,'Пушкин','Александр','Сергеевич','1837-02-10','А.С.');
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
  `Почтовый_адрес` mediumtext,
  PRIMARY KEY (`Код_пользователя`),
  CONSTRAINT `администратор_ibfk_1` FOREIGN KEY (`Код_пользователя`) REFERENCES `пользователь` (`Код_пользователя`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `Почтовый_адрес` mediumtext,
  PRIMARY KEY (`Код_пользователя`),
  CONSTRAINT `библиотекарь_ibfk_1` FOREIGN KEY (`Код_пользователя`) REFERENCES `пользователь` (`Код_пользователя`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`Код_пользователя`),
  CONSTRAINT `читатели_ibfk_1` FOREIGN KEY (`Код_пользователя`) REFERENCES `пользователь` (`Код_пользователя`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `Код_заказа` int(11) NOT NULL AUTO_INCREMENT,
  `Дата_заказа` date DEFAULT NULL,
  `Код_абонемента` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_заказа`),
  KEY `R_47` (`Код_абонемента`),
  CONSTRAINT `заказ_ibfk_1` FOREIGN KEY (`Код_абонемента`) REFERENCES `абонемент` (`Код_абонемента`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `Отметка_о_возврате` mediumtext,
  `Дата_возврата` date DEFAULT NULL,
  `Фактическая_дата_возврата` date DEFAULT NULL,
  `Код_пользователя` int(11) DEFAULT NULL,
  `Код_книги` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_заказа`),
  KEY `R_32` (`Код_пользователя`),
  KEY `R_48` (`Код_книги`),
  CONSTRAINT `заказанная_книга_ibfk_1` FOREIGN KEY (`Код_заказа`) REFERENCES `заказ` (`Код_заказа`),
  CONSTRAINT `заказанная_книга_ibfk_2` FOREIGN KEY (`Код_пользователя`) REFERENCES `библиотекарь` (`Код_пользователя`),
  CONSTRAINT `заказанная_книга_ibfk_3` FOREIGN KEY (`Код_книги`) REFERENCES `книга` (`Код_книги`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `Код_книги` int(11) NOT NULL AUTO_INCREMENT,
  `Название` mediumtext,
  `Издательство` mediumtext,
  `Год_издания` int(11) DEFAULT NULL,
  `Код_тематики` int(11) DEFAULT NULL,
  `Администратор` int(11) DEFAULT NULL,
  `Автор` int(11) DEFAULT NULL,
  `Код_автора` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_книги`),
  KEY `R_17` (`Код_тематики`),
  KEY `R_19` (`Автор`),
  KEY `R_30` (`Администратор`),
  KEY `R_46` (`Код_автора`),
  CONSTRAINT `книга_ibfk_1` FOREIGN KEY (`Код_тематики`) REFERENCES `тематика` (`Код_тематики`),
  CONSTRAINT `книга_ibfk_2` FOREIGN KEY (`Автор`) REFERENCES `автор_пользователь` (`Код_пользователя`),
  CONSTRAINT `книга_ibfk_3` FOREIGN KEY (`Администратор`) REFERENCES `администратор` (`Код_пользователя`),
  CONSTRAINT `книга_ibfk_4` FOREIGN KEY (`Код_автора`) REFERENCES `автор_по_книгам` (`Код_автора`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `Код_паспорта` int(11) NOT NULL AUTO_INCREMENT,
  `Фамилия` mediumtext,
  `Имя` mediumtext,
  `Отчество` mediumtext,
  `Серия` int(11) DEFAULT NULL,
  `Номер` int(11) DEFAULT NULL,
  `Дата_рождения` date DEFAULT NULL,
  PRIMARY KEY (`Код_паспорта`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `паспортные_данные`
--

LOCK TABLES `паспортные_данные` WRITE;
/*!40000 ALTER TABLE `паспортные_данные` DISABLE KEYS */;
INSERT INTO `паспортные_данные` VALUES (4,'Зубенко','Андрей','Михайлович',4605,729721,'2001-06-30'),(5,'Здрилюк','Сергей','Анатольевич',3914,935349,'1972-07-23'),(6,'Петрыкина','Юлия','Владимировна',4508,377639,'1973-04-18'),(7,'Коваленко','Андрей','Анатольевич',6707,738384,'1962-09-22'),(8,'Корнейчук','Семен','Дмитриевич',4218,127156,'1995-01-16'),(9,'Крыгин','Николай','Сергеевич',5814,185450,'1994-07-21'),(10,'Романенко','Геннадий','Васильевич',4514,731295,'1969-01-12'),(11,'Горохов','Сергей','Александрович',2017,29118,'1974-12-20'),(12,'Ланнистер','Тирион','Тайвинович',1104,777777,'1982-09-12'),(13,'Мурадов','Натик','Намигович',4605,738721,'2001-06-05');
/*!40000 ALTER TABLE `паспортные_данные` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `пользователь`
--

DROP TABLE IF EXISTS `пользователь`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `пользователь` (
  `Код_пользователя` int(11) NOT NULL AUTO_INCREMENT,
  `Код_паспорта` int(11) NOT NULL,
  `Имя_пользователя` mediumtext,
  `Пароль` mediumtext,
  `Телефон` mediumtext,
  PRIMARY KEY (`Код_пользователя`),
  KEY `R_22` (`Код_паспорта`),
  CONSTRAINT `пользователь_ibfk_1` FOREIGN KEY (`Код_паспорта`) REFERENCES `паспортные_данные` (`Код_паспорта`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `пользователь`
--

LOCK TABLES `пользователь` WRITE;
/*!40000 ALTER TABLE `пользователь` DISABLE KEYS */;
INSERT INTO `пользователь` VALUES (1,4,'Zuani','IMO2qhRWipCSGHC','8(495)745-14-44'),(2,5,'Romam','PiPoajsTZci5VIO','8(495)139-65-15'),(3,6,'Zysta','mC0ghhmbsi8YbBn','8(495)769-06-92'),(4,7,'Viell','sFUXdsZRzsn23sw','8(495)200-35-17'),(5,8,'Qubed','8mprTOfpidGZGm6','8(495)523-07-74'),(6,9,'Qudil','r5TsNwqvVta9TKz','8(495)145-65-19'),(7,10,'Nanas','t5E6Kq6U4bnaxk8','8(495)883-57-59'),(8,11,'Ianar','K4szpRcOHvztDgU','8(495)593-00-03'),(9,12,'Inava','UwK3eYHHZuRvYMx','8(495)377-05-19'),(10,13,'Malar','znTMNqYiUKphCI8','8(495)553-07-33');
/*!40000 ALTER TABLE `пользователь` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `тематика`
--

DROP TABLE IF EXISTS `тематика`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `тематика` (
  `Код_тематики` int(11) NOT NULL AUTO_INCREMENT,
  `Название` mediumtext,
  `Примечание` mediumtext,
  PRIMARY KEY (`Код_тематики`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

-- Dump completed on 2021-12-07 18:06:47
