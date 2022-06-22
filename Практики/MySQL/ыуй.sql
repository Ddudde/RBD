CREATE DATABASE  IF NOT EXISTS `bib` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bib`;
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

--
-- Table structure for table `автор_пользователь`
--

DROP TABLE IF EXISTS `автор_пользователь`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `автор_пользователь` (
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
INSERT INTO `автор_пользователь` VALUES (11,4,'robert80@yahoo.com'),(12,7,'jeteve@me.com'),(13,9,'jgwang@live.com');
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
INSERT INTO `администратор` VALUES (4,'2021-12-07','jeffcovey@yahoo.ca'),(10,'2021-12-07','bmidd@live.com');
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
INSERT INTO `библиотекарь` VALUES (5,'2021-12-07','carreras@me.com'),(6,'2021-12-07','kludge@outlook.com'),(7,'2021-12-07','vmalik@live.com');
/*!40000 ALTER TABLE `библиотекарь` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `читатель`
--

DROP TABLE IF EXISTS `читатель`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `читатель` (
  `Код_пользователя` int(11) NOT NULL,
  `Дата_регистрации` date DEFAULT NULL,
  PRIMARY KEY (`Код_пользователя`),
  CONSTRAINT `читатель_ibfk_1` FOREIGN KEY (`Код_пользователя`) REFERENCES `пользователь` (`Код_пользователя`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `читатель`
--

LOCK TABLES `читатель` WRITE;
/*!40000 ALTER TABLE `читатель` DISABLE KEYS */;
INSERT INTO `читатель` VALUES (1,'2021-12-08'),(2,'2021-12-08'),(3,'2021-12-08'),(8,'2021-12-08'),(9,'2021-12-08');
/*!40000 ALTER TABLE `читатель` ENABLE KEYS */;
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
  `Код_книги` int(11) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_заказа`),
  KEY `R_47` (`Код_абонемента`),
  KEY `R_53` (`Код_книги`),
  CONSTRAINT `заказ_ibfk_1` FOREIGN KEY (`Код_абонемента`) REFERENCES `абонемент` (`Код_абонемента`),
  CONSTRAINT `заказ_ibfk_2` FOREIGN KEY (`Код_книги`) REFERENCES `заказанная_книга` (`Код_книги`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказ`
--

LOCK TABLES `заказ` WRITE;
/*!40000 ALTER TABLE `заказ` DISABLE KEYS */;
INSERT INTO `заказ` VALUES (1,'2021-12-08',3,5,NULL),(2,NULL,NULL,7,1),(3,NULL,NULL,8,1);
/*!40000 ALTER TABLE `заказ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `заказанная_книга`
--

DROP TABLE IF EXISTS `заказанная_книга`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `заказанная_книга` (
  `Отметка_о_возврате` mediumtext,
  `Дата_возврата` date DEFAULT NULL,
  `Фактическая_дата_возврата` date DEFAULT NULL,
  `Код_пользователя` int(11) DEFAULT NULL,
  `Код_книги` int(11) NOT NULL,
  PRIMARY KEY (`Код_книги`),
  KEY `R_32` (`Код_пользователя`),
  CONSTRAINT `заказанная_книга_ibfk_1` FOREIGN KEY (`Код_пользователя`) REFERENCES `библиотекарь` (`Код_пользователя`),
  CONSTRAINT `заказанная_книга_ibfk_2` FOREIGN KEY (`Код_книги`) REFERENCES `книга` (`Код_книги`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `заказанная_книга`
--

LOCK TABLES `заказанная_книга` WRITE;
/*!40000 ALTER TABLE `заказанная_книга` DISABLE KEYS */;
INSERT INTO `заказанная_книга` VALUES ('Возвращена','2021-12-20','2021-12-08',5,5),(NULL,'2021-12-20',NULL,5,7),(NULL,'2021-12-20',NULL,5,8);
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
  `ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Код_книги`),
  KEY `R_17` (`Код_тематики`),
  KEY `R_19` (`Автор`),
  KEY `R_30` (`Администратор`),
  KEY `R_46` (`Код_автора`),
  CONSTRAINT `книга_ibfk_1` FOREIGN KEY (`Код_тематики`) REFERENCES `тематика` (`Код_тематики`),
  CONSTRAINT `книга_ibfk_2` FOREIGN KEY (`Автор`) REFERENCES `автор_пользователь` (`Код_пользователя`),
  CONSTRAINT `книга_ibfk_3` FOREIGN KEY (`Администратор`) REFERENCES `администратор` (`Код_пользователя`),
  CONSTRAINT `книга_ibfk_4` FOREIGN KEY (`Код_автора`) REFERENCES `автор_по_книгам` (`Код_автора`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `книга`
--

LOCK TABLES `книга` WRITE;
/*!40000 ALTER TABLE `книга` DISABLE KEYS */;
INSERT INTO `книга` VALUES (1,'Sapiens. Краткая история человечества','Dvir Publishing House Ltd.',2011,1,10,NULL,1,NULL),(2,'Эгоистичный ген','Издательство Оксфордского университета',1976,1,10,NULL,2,NULL),(3,'Вы, конечно, шутите, мистер Фейнман!','W. W. Norton',1985,4,10,NULL,3,NULL),(4,'Происхождение видов','Джон Мюррей',1859,1,10,11,4,NULL),(5,'1984','Secker and Warburg',1949,5,10,NULL,5,NULL),(6,'Гормоны счастья. Как приучить мозг вырабатывать серотонин, дофамин, эндорфин и окситоцин','Adams Media Corporation',2016,1,10,NULL,6,NULL),(7,'Мастер и Маргарита','Вече',1967,18,10,12,7,NULL),(8,'Дюна','Chilton Books',1965,19,4,NULL,8,NULL),(9,'Преступление и наказание','АСТ',1866,18,10,13,9,NULL),(10,'Капитанская дочка','Махаон',1836,18,10,NULL,10,NULL),(11,NULL,NULL,NULL,2,10,NULL,NULL,1),(12,NULL,NULL,NULL,2,10,NULL,NULL,2),(13,NULL,NULL,NULL,3,10,NULL,NULL,2),(14,NULL,NULL,NULL,5,10,NULL,NULL,4),(15,NULL,NULL,NULL,2,10,NULL,NULL,4),(16,NULL,NULL,NULL,6,10,NULL,NULL,4),(17,NULL,NULL,NULL,7,10,NULL,NULL,4),(18,NULL,NULL,NULL,8,10,NULL,NULL,5),(19,NULL,NULL,NULL,9,10,NULL,NULL,5),(20,NULL,NULL,NULL,10,10,NULL,NULL,5),(21,NULL,NULL,NULL,11,10,NULL,NULL,5),(22,NULL,NULL,NULL,12,10,NULL,NULL,5),(23,NULL,NULL,NULL,13,10,NULL,NULL,6),(24,NULL,NULL,NULL,14,10,NULL,NULL,6),(25,NULL,NULL,NULL,15,10,NULL,NULL,6),(26,NULL,NULL,NULL,16,10,NULL,NULL,6),(27,NULL,NULL,NULL,2,10,NULL,NULL,6);
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
INSERT INTO `паспортные_данные` VALUES (1,'Зубенко','Андрей','Михайлович',4605,729721,'2001-06-30'),(2,'Здрилюк','Сергей','Анатольевич',3914,935349,'1972-07-23'),(3,'Петрыкина','Юлия','Владимировна',4508,377639,'1973-04-18'),(4,'Коваленко','Андрей','Анатольевич',6707,738384,'1962-09-22'),(5,'Корнейчук','Семен','Дмитриевич',4218,127156,'1995-01-16'),(6,'Крыгин','Николай','Сергеевич',5814,185450,'1994-07-21'),(7,'Романенко','Геннадий','Васильевич',4514,731295,'1969-01-12'),(8,'Горохов','Сергей','Александрович',2017,29118,'1974-12-20'),(9,'Ланнистер','Тирион','Тайвинович',1104,777777,'1982-09-12'),(10,'Мурадов','Натик','Намигович',4605,738721,'2001-06-05'),(11,'Дарвин','Чарлз','Роберт',4511,532704,'1809-02-12'),(12,'Булгаков','Михаил','Афанасьевич',4115,675973,'1891-05-15'),(13,'Достоевский','Фёдор','Михайлович',500,92343,'1821-11-11');
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
  `Номер_иконки` int(11) NOT NULL,
  PRIMARY KEY (`Код_пользователя`),
  KEY `R_22` (`Код_паспорта`),
  CONSTRAINT `пользователь_ibfk_1` FOREIGN KEY (`Код_паспорта`) REFERENCES `паспортные_данные` (`Код_паспорта`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `пользователь`
--

LOCK TABLES `пользователь` WRITE;
/*!40000 ALTER TABLE `пользователь` DISABLE KEYS */;
INSERT INTO `пользователь` VALUES (1,1,'Zuani','IMO2qhRWipCSGHC','8(495)745-14-44',0),(2,2,'Romam','PiPoajsTZci5VIO','8(495)139-65-15',0),(3,3,'Zysta','mC0ghhmbsi8YbBn','8(495)769-06-92',0),(4,4,'Viell','sFUXdsZRzsn23sw','8(495)200-35-17',0),(5,5,'Qubed','8mprTOfpidGZGm6','8(495)523-07-74',0),(6,6,'Qudil','r5TsNwqvVta9TKz','8(495)145-65-19',0),(7,7,'Nanas','t5E6Kq6U4bnaxk8','8(495)883-57-59',0),(8,8,'Ianar','K4szpRcOHvztDgU','8(495)593-00-03',0),(9,9,'Inava','UwK3eYHHZuRvYMx','8(495)377-05-19',0),(10,10,'Malar','znTMNqYiUKphCI8','8(495)553-07-33',0),(11,11,'Xiamall','69bp8Lx99fwT0zZ','8(965)480-43-10',0),(12,12,'Letyliow','ynBx7yImWR4EKtR','8(965)178-14-80',0),(13,13,'Ckoallu','zRAGEZPX5i0U8No','8(965)272-23-45',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `тематика`
--

LOCK TABLES `тематика` WRITE;
/*!40000 ALTER TABLE `тематика` DISABLE KEYS */;
INSERT INTO `тематика` VALUES (1,'Научно-популярная литература','Литературные произведения о науке, научных достижениях и об учёных, предназначенные для широкого круга читателей.'),(2,'Зарубежная образовательная литература','Это издания по медицине, общению с детьми, здоровью и красоте, этикету, истории, географии, химии, астрологии и многому другому. Иностранные практики, реализуемые в разных сферах жизни, дают отличные результаты.'),(3,'Генетика','Раздел биологии, занимающийся изучением генов, генетических вариаций и наследственности в организмах.'),(4,'Автобиография','Последовательное описание человеком событий собственной жизни.'),(5,'Зарубежная классика','Зарубежная классика по праву считается одним из самых популярных жанров, оказавших влияние не только на читателей, но и на развитие мировой истории в целом.'),(6,'Общая биология','Раздел биологии, изучающий основные и общие для всех организмов закономерности жизненных явлений.'),(7,'Литература 19 века',''),(8,'Классика фантастики',''),(9,'Литература 20 века',''),(10,'Зарубежная фантастика',''),(11,'Историческая фантастика',''),(12,'Социальная фантастика',''),(13,'Зарубежная прикладная литература',''),(14,'Саморазвитие','Литература, содержащая советы по развитию способностей и навыков, достижению успеха в личной жизни и работе.'),(15,'Личностный рост','Процесс эффективного развития человека и роста как личности.'),(16,'Зарубежная психология','Изучение данного раздела – это уникальная возможность познакомиться с иностранным менталитетом и узнать мнение таких экспертов, как Ник Вуйчич, Брайан Вайсс, Марк Рейтер и других авторов, работающих в различных областях психологии и смежных наук.'),(17,'Роман','Литературный жанр, чаще прозаический, зародившийся в средние века у романских народов как рассказ на народном языке и ныне превратившийся в самый распространенный вид эпической литературы, изображающий жизнь человека с её волнующими страстями (на первом плане любовь), борьбой, социальными противоречиями и стремлениями к идеалу.'),(18,'Философский роман','Художественное произведение в романной форме, иллюстрирующее те или иные философские концепции.');
/*!40000 ALTER TABLE `тематика` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bib'
--

--
-- Dumping routines for database 'bib'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-18 23:15:35
