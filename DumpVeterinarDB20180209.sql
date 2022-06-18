CREATE DATABASE  IF NOT EXISTS `veterinardb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `veterinardb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: veterinardb
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `pregled`
--

DROP TABLE IF EXISTS `pregled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregled` (
  `idPregled` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Usluga_idUsluga` int(10) unsigned NOT NULL,
  `Veterinar_idVeterinar` int(10) unsigned NOT NULL,
  `vremeOd` datetime NOT NULL,
  `vremeDo` datetime NOT NULL,
  `zauzet` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idPregled`),
  KEY `Pregled_FKIndex1` (`Veterinar_idVeterinar`),
  KEY `Pregled_FKIndex2` (`Usluga_idUsluga`),
  CONSTRAINT `pregled_ibfk_1` FOREIGN KEY (`Veterinar_idVeterinar`) REFERENCES `veterinar` (`idVeterinar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pregled_ibfk_2` FOREIGN KEY (`Usluga_idUsluga`) REFERENCES `usluga` (`idUsluga`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregled`
--

LOCK TABLES `pregled` WRITE;
/*!40000 ALTER TABLE `pregled` DISABLE KEYS */;
INSERT INTO `pregled` VALUES (1,1,1,'2018-03-13 11:00:00','2018-03-13 12:00:00',0),(2,2,2,'2018-03-13 11:00:00','2018-03-13 12:00:00',0),(3,3,3,'2018-03-13 11:00:00','2018-03-13 12:00:00',0),(4,1,4,'2018-03-13 12:00:00','2018-03-13 13:00:00',0),(5,2,1,'2018-03-13 12:00:00','2018-03-13 13:00:00',1),(6,3,2,'2018-03-13 12:00:00','2018-03-13 13:00:00',0),(7,1,3,'2018-03-13 13:00:00','2018-03-13 14:00:00',0),(8,2,4,'2018-03-13 13:00:00','2018-03-13 14:00:00',0);
/*!40000 ALTER TABLE `pregled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usluga`
--

DROP TABLE IF EXISTS `usluga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usluga` (
  `idUsluga` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) DEFAULT NULL,
  `cena` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idUsluga`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usluga`
--

LOCK TABLES `usluga` WRITE;
/*!40000 ALTER TABLE `usluga` DISABLE KEYS */;
INSERT INTO `usluga` VALUES (1,'lecenje',2000),(2,'cuvanje',2300),(3,'negovanje',2500);
/*!40000 ALTER TABLE `usluga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinar`
--

DROP TABLE IF EXISTS `veterinar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veterinar` (
  `idVeterinar` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `telefon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVeterinar`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinar`
--

LOCK TABLES `veterinar` WRITE;
/*!40000 ALTER TABLE `veterinar` DISABLE KEYS */;
INSERT INTO `veterinar` VALUES (1,'Vladica','Petkovic','0645677654'),(2,'Milica','Obradovic','0634560523'),(3,'Goran','Ilic','0645326234'),(4,'Mirko','Radovanovic','0642131451');
/*!40000 ALTER TABLE `veterinar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-09 22:47:10
