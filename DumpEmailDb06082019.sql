CREATE DATABASE  IF NOT EXISTS `emaildb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `emaildb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: emaildb
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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id_account` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_data_id_user` int(10) unsigned NOT NULL,
  `smtp_address` varchar(255) DEFAULT NULL,
  `smtp_port` int(10) unsigned DEFAULT NULL,
  `in_server_type` int(10) unsigned DEFAULT '0',
  `in_server_address` varchar(255) DEFAULT NULL,
  `in_server_port` int(10) unsigned DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_account`,`user_data_id_user`),
  UNIQUE KEY `UK_53sct5fxh1r8vv5ygcfbebh22` (`id_account`,`user_data_id_user`),
  KEY `account_FKIndex1` (`user_data_id_user`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`user_data_id_user`) REFERENCES `user_data` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,1,'smtp.gmail.com',465,0,'/',0,'driving.school.test.email@gmail.com','drivingschooltestemail','drivingschool'),(2,1,'smtp.gmail.com',465,0,'/',0,'testacc@gmail.com','pass','testacc');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `id_attachment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id_message` int(10) unsigned NOT NULL,
  `data_2` blob,
  `mime_type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_attachment`),
  KEY `attachment_FKIndex1` (`message_id_message`),
  CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`message_id_message`) REFERENCES `message` (`id_message`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id_contact` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_data_id_user` int(10) unsigned NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_contact`),
  KEY `contact_FKIndex1` (`user_data_id_user`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`user_data_id_user`) REFERENCES `user_data` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id_folder` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_user_data_id_user` int(10) unsigned NOT NULL,
  `account_id_account` int(10) unsigned NOT NULL,
  `folder_id_folder` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_folder`),
  KEY `folder_FKIndex1` (`folder_id_folder`),
  KEY `folder_FKIndex2` (`account_id_account`,`account_user_data_id_user`),
  CONSTRAINT `folder_ibfk_1` FOREIGN KEY (`folder_id_folder`) REFERENCES `folder` (`id_folder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `folder_ibfk_2` FOREIGN KEY (`account_id_account`, `account_user_data_id_user`) REFERENCES `account` (`id_account`, `user_data_id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (1,1,1,NULL,'default'),(3,1,2,NULL,'default'),(4,1,1,NULL,'foldername'),(5,1,1,1,'foldernamewithparent');
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id_folder` int(10) unsigned NOT NULL,
  `account_user_data_id_user` int(10) unsigned NOT NULL,
  `account_id_account` int(10) unsigned NOT NULL,
  `from_email` varchar(255) DEFAULT NULL,
  `to_email` varchar(255) DEFAULT NULL,
  `cc_email` varchar(255) DEFAULT NULL,
  `bcc_email` varchar(255) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `unread` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id_message`),
  KEY `message_FKIndex1` (`account_id_account`,`account_user_data_id_user`),
  KEY `message_FKIndex2` (`folder_id_folder`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`account_id_account`, `account_user_data_id_user`) REFERENCES `account` (`id_account`, `user_data_id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`folder_id_folder`) REFERENCES `folder` (`id_folder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,4,1,1,'driving.school.test.email@gmail.com','celeron015@gmail.com','','','2019-08-06 19:42:57','test subject','Test ep',1),(2,1,1,1,'driving.school.test.email@gmail.com','celeron015@gmail.com,vuk.jeremic@simple-task.com','testacc@gmail.com','','2019-08-06 19:44:24','test subject','Test ep',0),(3,1,1,1,'driving.school.test.email@gmail.com','celeron015@gmail.com,vuk.jeremic@simple-task.com','','testacc@gmail.com','2019-08-06 19:48:10','test subject','Test ep',1);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_has_tag`
--

DROP TABLE IF EXISTS `message_has_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_has_tag` (
  `message_id_message` int(10) unsigned NOT NULL,
  `tag_user_data_id_user` int(10) unsigned NOT NULL,
  `tag_id_tag` int(10) unsigned NOT NULL,
  PRIMARY KEY (`message_id_message`,`tag_user_data_id_user`,`tag_id_tag`),
  KEY `message_has_tag_FKIndex1` (`message_id_message`),
  KEY `message_has_tag_FKIndex2` (`tag_id_tag`,`tag_user_data_id_user`),
  CONSTRAINT `message_has_tag_ibfk_1` FOREIGN KEY (`message_id_message`) REFERENCES `message` (`id_message`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `message_has_tag_ibfk_2` FOREIGN KEY (`tag_id_tag`, `tag_user_data_id_user`) REFERENCES `tag` (`id_tag`, `user_data_id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_has_tag`
--

LOCK TABLES `message_has_tag` WRITE;
/*!40000 ALTER TABLE `message_has_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_has_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id_photo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_id_contact` int(10) unsigned NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `photo_FKIndex1` (`contact_id_contact`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`contact_id_contact`) REFERENCES `contact` (`id_contact`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `id_rule` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id_folder` int(10) unsigned NOT NULL,
  `condition_rule` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `operation` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_rule`),
  KEY `rule_FKIndex1` (`folder_id_folder`),
  CONSTRAINT `rule_ibfk_1` FOREIGN KEY (`folder_id_folder`) REFERENCES `folder` (`id_folder`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id_tag` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_data_id_user` int(10) unsigned NOT NULL,
  `name` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_tag`,`user_data_id_user`),
  KEY `tag_FKIndex1` (`user_data_id_user`),
  CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`user_data_id_user`) REFERENCES `user_data` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_data` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data`
--

LOCK TABLES `user_data` WRITE;
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
INSERT INTO `user_data` VALUES (1,'admin','admin','admin','admin');
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-06 23:20:18
