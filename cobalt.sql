-- MySQL dump 10.13  Distrib 5.1.41, for Win32 (ia32)
--
-- Host: localhost    Database: cobalt
-- ------------------------------------------------------
-- Server version	5.1.41

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
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `p_dmg_take` smallint(6) NOT NULL DEFAULT '0',
  `p_dmg_give` smallint(6) NOT NULL DEFAULT '0',
  `m_dmg_take` smallint(6) NOT NULL DEFAULT '0',
  `m_dmg_give` smallint(6) NOT NULL DEFAULT '0',
  `hp_mod_z` int(11) NOT NULL DEFAULT '0',
  `mp_mod_z` int(11) NOT NULL DEFAULT '0',
  `str_mod_z` int(11) NOT NULL DEFAULT '0',
  `vit_mod_z` int(11) NOT NULL DEFAULT '0',
  `agi_mod_z` int(11) NOT NULL DEFAULT '0',
  `wis_mod_z` int(11) NOT NULL DEFAULT '0',
  `int_mod_z` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` VALUES (1,'Silver Armband',0,0,0,0,100,20,2,1,1,2,1,'Stolen from every RPG in existence... HP+100, MP+20, VIT+1, AGI+1, WIS+2, INT+2',0),(2,'Gold Armband',0,0,0,0,150,30,2,2,3,2,2,'Upgraded silver',0);
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatars`
--

DROP TABLE IF EXISTS `avatars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatars`
--

LOCK TABLES `avatars` WRITE;
/*!40000 ALTER TABLE `avatars` DISABLE KEYS */;
INSERT INTO `avatars` VALUES (2,'Raccoon','This is the raccoon from Links Awakening.'),(4,'Zombie Stalfos','Stalfos is the name of the zombies in the Zelda series. I believe this guy is from A Link to the Past.'),(5,'Baby Dragon','Baby Dragon PC from Final Fantasy Legends II.'),(6,'Human Female','Human Female PC from Final Fantasy Legends II.'),(7,'Human Male','Human Male PC from Final Fantasy Legends II.'),(8,'Imp','Imp PC from Final Fantasy Legends II.'),(9,'Mutant Female','Mutant Female PC from Final Fantasy Legends II.'),(10,'Mutant Male','Mutant Male PC from Final Fantasy Legends II.'),(11,'Zombie','Just your typical Zombie. If you know him tell me where he\'s from.'),(12,'Arthur','Arthur from Final Fantasy Legends III.'),(13,'Curtis','Curtis from Final Fantasy Legends III.'),(14,'Gloria','Gloria from Final Fantasy Legends III.'),(15,'Sharon','Sharon from Final Fantasy Legends III.'),(16,'Myron','Myron from Final Fantasy Legends III (small part).'),(17,'Zombie','Zombie PC from Final Fantasy Legend.'),(18,'Human Black','This is a black guy I made.');
/*!40000 ALTER TABLE `avatars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_name` varchar(40) NOT NULL DEFAULT 'nameless',
  `class_id` int(11) NOT NULL DEFAULT '1',
  `race_id` int(11) NOT NULL DEFAULT '1',
  `current_hp` int(11) NOT NULL DEFAULT '0',
  `hp` int(11) NOT NULL DEFAULT '0',
  `current_mp` int(11) NOT NULL DEFAULT '0',
  `mp` int(11) NOT NULL DEFAULT '0',
  `weapon_id` int(11) NOT NULL DEFAULT '0',
  `shield_id` int(11) NOT NULL DEFAULT '0',
  `accessory_id` int(11) NOT NULL DEFAULT '0',
  `exp` int(11) NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `isadmin` tinyint(4) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `current_login` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `money` int(11) NOT NULL DEFAULT '0',
  `avatar_id` int(11) NOT NULL DEFAULT '0',
  `joined` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `guild_id` int(11) NOT NULL DEFAULT '0',
  `kills` int(11) NOT NULL DEFAULT '0',
  `hp_mod_z` int(11) NOT NULL DEFAULT '0',
  `mp_mod_z` int(11) NOT NULL DEFAULT '0',
  `str_mod_z` int(11) NOT NULL DEFAULT '0',
  `vit_mod_z` int(11) NOT NULL DEFAULT '0',
  `agi_mod_z` int(11) NOT NULL DEFAULT '0',
  `wis_mod_z` int(11) NOT NULL DEFAULT '0',
  `int_mod_z` int(11) NOT NULL DEFAULT '0',
  `str` int(11) NOT NULL DEFAULT '0',
  `vit` int(11) NOT NULL DEFAULT '0',
  `agi` int(11) NOT NULL DEFAULT '0',
  `wis` int(11) NOT NULL DEFAULT '0',
  `int` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Nucleocide',1,1,100,544,100,80,1,1,1,12800,'nucleo','286755fad04869ca523320acce0dc6a4',1,'2006-09-06 23:37:46','2006-09-06 16:34:55',5000,12,'2006-08-28 16:02:55',1,0,100,10,10,8,6,1,1,21,18,11,5,5,'My name is Thanis and I kick your face in.'),(31,'new clio cyde',1,4,0,105,0,68,0,0,0,8600,'nucleocide','286755fad04869ca523320acce0dc6a4',0,'2006-09-09 01:29:34','0000-00-00 00:00:00',1000,6,'2006-09-09 01:29:34',0,0,0,0,0,0,0,0,0,5,5,8,7,14,':D'),(11,'Plastic Raccoon',1,1,0,244,0,50,0,0,0,12800,'plasticraccoon','286755fad04869ca523320acce0dc6a4',1,'2006-09-06 23:38:03','0000-00-00 00:00:00',0,2,'0000-00-00 00:00:00',1,0,0,0,0,0,0,0,0,9,8,5,2,3,'I\'m a raccoon niggas.'),(12,'trixx',3,1,0,0,0,0,0,0,0,12800,'trixievip','286755fad04869ca523320acce0dc6a4',0,'2006-09-04 00:43:22','0000-00-00 00:00:00',0,4,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(13,'alea',0,1,0,0,0,0,0,0,0,12800,'alea','286755fad04869ca523320acce0dc6a4',0,'2006-09-04 20:56:25','0000-00-00 00:00:00',0,9,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(14,'master-pswd',1,2,0,0,0,0,0,0,0,12800,'unique','286755fad04869ca523320acce0dc6a4',0,'2006-09-04 21:16:15','0000-00-00 00:00:00',0,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'This guy is cool! He has the intensity of a turtle and the speed of a snail. Hows that for eating your wheaties.'),(15,'JoGaAtW',0,3,0,115,0,57,0,0,0,12800,'JoGaAtW','286755fad04869ca523320acce0dc6a4',0,'2006-09-04 21:18:31','0000-00-00 00:00:00',0,5,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,5,4,2,'Herpes herpes Herpes'),(16,'Matt',1,1,0,0,0,0,0,0,0,12800,'fedorovexpress','286755fad04869ca523320acce0dc6a4',0,'2006-09-05 18:07:57','0000-00-00 00:00:00',0,18,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Peyote dealer'),(17,'Slick',1,1,0,0,0,0,0,0,0,12800,'slick','286755fad04869ca523320acce0dc6a4',0,'2006-09-05 21:01:57','0000-00-00 00:00:00',0,2,'0000-00-00 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,0,0,''),(32,'Greg',1,3,0,99,0,49,0,0,0,8600,'Revanant04','286755fad04869ca523320acce0dc6a4',0,'2006-09-25 13:46:18','0000-00-00 00:00:00',1000,12,'2006-09-25 13:46:18',0,0,0,0,0,0,0,0,0,5,5,4,2,2,''),(33,'test',1,1,0,124,0,30,0,0,0,8600,'test','286755fad04869ca523320acce0dc6a4',0,'2006-11-06 09:53:42','0000-00-00 00:00:00',1000,11,'2006-11-06 09:53:42',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(34,'nate',1,1,0,124,0,30,0,0,0,8600,'nate','286755fad04869ca523320acce0dc6a4',0,'2006-11-08 21:57:04','0000-00-00 00:00:00',1000,12,'2006-11-08 21:57:04',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(35,'Dosinuyasha',1,3,0,99,0,49,0,0,0,8600,'Dosinuyasha','286755fad04869ca523320acce0dc6a4',0,'2006-11-08 22:03:19','0000-00-00 00:00:00',1000,5,'2006-11-08 22:03:19',0,0,0,0,0,0,0,0,0,5,5,4,2,2,''),(36,'Andy',1,1,0,124,0,30,0,0,0,8600,'Andy','286755fad04869ca523320acce0dc6a4',0,'2006-11-10 04:59:02','0000-00-00 00:00:00',1000,12,'2006-11-10 04:59:02',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(37,'Redliner',1,1,0,124,0,30,0,0,0,8600,'Redliner','286755fad04869ca523320acce0dc6a4',0,'2006-11-19 02:34:58','0000-00-00 00:00:00',1000,5,'2006-11-19 02:34:58',0,0,0,0,0,0,0,0,0,5,5,3,1,2,'Fucking killer'),(38,'planel',3,1,0,120,0,38,0,0,0,8600,'planel','286755fad04869ca523320acce0dc6a4',0,'2006-11-22 14:11:29','0000-00-00 00:00:00',1000,18,'2006-11-22 14:11:29',0,0,0,0,0,0,0,0,0,3,4,6,3,2,''),(39,'Cody',1,3,0,99,0,49,0,0,0,8600,'codyfisher','286755fad04869ca523320acce0dc6a4',0,'2006-12-03 15:59:27','0000-00-00 00:00:00',1000,2,'2006-12-03 15:59:27',0,0,0,0,0,0,0,0,0,5,5,4,2,2,''),(40,'LightByte',1,1,0,124,0,30,0,0,0,8600,'LightByte','286755fad04869ca523320acce0dc6a4',0,'2006-12-07 02:11:51','0000-00-00 00:00:00',1000,17,'2006-12-07 02:11:51',0,0,0,0,0,0,0,0,0,5,5,3,1,2,'He is sexy.'),(41,'cutless',1,3,0,99,0,49,0,0,0,8600,'cutless','286755fad04869ca523320acce0dc6a4',0,'2006-12-11 18:41:41','0000-00-00 00:00:00',1000,11,'2006-12-11 18:41:41',0,0,0,0,0,0,0,0,0,5,5,4,2,2,''),(42,'monkey',1,1,0,124,0,30,0,0,0,8600,'monkey','286755fad04869ca523320acce0dc6a4',0,'2006-12-12 19:46:20','0000-00-00 00:00:00',1000,11,'2006-12-12 19:46:20',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(43,'Deschain',1,1,0,124,0,30,0,0,0,8600,'Deschain','286755fad04869ca523320acce0dc6a4',0,'2007-01-06 22:19:46','0000-00-00 00:00:00',1000,2,'2007-01-06 22:19:46',0,0,0,0,0,0,0,0,0,5,5,3,1,2,'Ummm...'),(44,'asdfgh',1,2,0,124,0,24,0,0,0,8600,'asdfgh','286755fad04869ca523320acce0dc6a4',0,'2007-01-07 20:46:22','0000-00-00 00:00:00',1000,10,'2007-01-07 20:46:22',0,0,0,0,0,0,0,0,0,6,5,2,1,1,''),(45,'esminis',1,1,0,124,0,30,0,0,0,8600,'esminis','286755fad04869ca523320acce0dc6a4',0,'2007-01-13 08:09:11','0000-00-00 00:00:00',1000,2,'2007-01-13 08:09:11',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(46,'razzle346',3,4,0,101,0,76,0,0,0,8600,'razzle346','286755fad04869ca523320acce0dc6a4',0,'2007-01-24 21:39:14','0000-00-00 00:00:00',1000,2,'2007-01-24 21:39:14',0,0,0,0,0,0,0,0,0,3,4,12,8,14,''),(47,'pawitp',1,1,0,124,0,30,0,0,0,8600,'pawitp','286755fad04869ca523320acce0dc6a4',0,'2007-02-14 21:32:03','0000-00-00 00:00:00',1000,8,'2007-02-14 21:32:03',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(48,'Naslt',1,2,0,124,0,24,0,0,0,8600,'fugitivedread','286755fad04869ca523320acce0dc6a4',0,'2007-02-21 16:14:28','0000-00-00 00:00:00',1000,2,'2007-02-21 16:14:28',0,0,0,0,0,0,0,0,0,6,5,2,1,1,'1337 DESTROYER'),(49,'Wiseman',3,3,0,95,0,57,0,0,0,8600,'wiseman','286755fad04869ca523320acce0dc6a4',0,'2007-03-21 17:46:10','0000-00-00 00:00:00',1000,7,'2007-03-21 17:46:10',0,0,0,0,0,0,0,0,0,3,4,8,4,2,'Elves rule.'),(50,'Fozzie',3,4,0,101,0,76,0,0,0,8600,'Fozzie','286755fad04869ca523320acce0dc6a4',0,'2007-03-30 15:34:53','0000-00-00 00:00:00',1000,18,'2007-03-30 15:34:53',0,0,0,0,0,0,0,0,0,3,4,12,8,14,''),(51,'Krystian',1,3,0,99,0,49,0,0,0,8600,'krystian','286755fad04869ca523320acce0dc6a4',0,'2007-03-30 19:56:43','0000-00-00 00:00:00',1000,15,'2007-03-30 19:56:43',0,0,0,0,0,0,0,0,0,5,5,4,2,2,''),(52,'biza',1,4,0,105,0,68,0,0,0,8600,'balla1088','286755fad04869ca523320acce0dc6a4',0,'2007-04-01 21:14:12','0000-00-00 00:00:00',1000,8,'2007-04-01 21:14:12',0,0,0,0,0,0,0,0,0,5,5,8,7,14,'fdsfsd'),(53,'Matt',1,1,0,124,0,30,0,0,0,8600,'spacemd','286755fad04869ca523320acce0dc6a4',0,'2007-04-13 20:43:39','0000-00-00 00:00:00',1000,11,'2007-04-13 20:43:39',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(54,'Emperor',1,3,0,99,0,49,0,0,0,8600,'andrewwilson','286755fad04869ca523320acce0dc6a4',0,'2007-04-15 15:47:20','0000-00-00 00:00:00',1000,16,'2007-04-15 15:47:20',0,0,0,0,0,0,0,0,0,5,5,4,2,2,'The lord of the universe\r\n'),(55,'fffff',1,1,0,124,0,30,0,0,0,8600,'razzy','286755fad04869ca523320acce0dc6a4',0,'2007-04-27 13:30:39','0000-00-00 00:00:00',1000,4,'2007-04-27 13:30:39',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(56,'magnus',1,1,0,124,0,30,0,0,0,8600,'magnus','286755fad04869ca523320acce0dc6a4',0,'2007-05-24 13:33:05','0000-00-00 00:00:00',1000,2,'2007-05-24 13:33:05',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(57,'Rare',1,1,0,124,0,30,0,0,0,8600,'Rare','286755fad04869ca523320acce0dc6a4',0,'2007-05-25 05:33:29','0000-00-00 00:00:00',1000,16,'2007-05-25 05:33:29',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(58,'asdflkjh',1,1,0,124,0,30,0,0,0,8600,'asdflkjh','286755fad04869ca523320acce0dc6a4',0,'2007-06-11 17:13:18','0000-00-00 00:00:00',1000,18,'2007-06-11 17:13:18',0,0,0,0,0,0,0,0,0,5,5,3,1,2,'asdflkjh'),(59,'kgl',1,1,0,124,0,30,0,0,0,8600,'kgl','286755fad04869ca523320acce0dc6a4',0,'2007-06-25 15:59:34','0000-00-00 00:00:00',1000,2,'2007-06-25 15:59:34',0,0,0,0,0,0,0,0,0,5,5,3,1,2,''),(60,'Guest',1,1,0,124,0,30,0,0,0,8600,'guest','286755fad04869ca523320acce0dc6a4',0,'2007-07-16 13:19:13','0000-00-00 00:00:00',1000,14,'2007-07-16 13:19:13',0,0,0,0,0,0,0,0,0,5,5,3,1,2,'Guest Account');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `hp_mod_y` float NOT NULL DEFAULT '0',
  `mp_mod_y` float NOT NULL DEFAULT '0',
  `str_mod_y` float NOT NULL DEFAULT '0',
  `vit_mod_y` float NOT NULL DEFAULT '0',
  `agi_mod_y` float NOT NULL DEFAULT '0',
  `wis_mod_y` float NOT NULL DEFAULT '0',
  `int_mod_y` float NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  UNIQUE KEY `id` (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Fighter',6,3,0.7,0.6,0.3,0.1,0.2,'Fighters are good at kicking ass, not so much at thinking.'),(3,'Rogue',5.5,4,0.4,0.5,0.7,0.3,0.2,'Rogues are good at... stealing stuff?');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `pro_id` int(11) NOT NULL DEFAULT '0',
  `con_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,'Fire',2,3,'Pyro is latin for Fire.'),(2,'Ice',3,1,'Cryo is latin for ice.'),(3,'Water',1,2,'Hydro is latin for water.'),(4,'Electric',2,0,''),(5,'Air',0,0,'Aero is latin for air.'),(6,'Holy',0,0,'Heiro is latin for holy.'),(7,'Evil',0,0,'Caco is latin for evil.');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '1',
  `thing_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='types 1=item, 2=weapon, 3=shields, 4=accessories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,1),(6,3,2),(7,4,1),(8,4,2);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_inventory`
--

DROP TABLE IF EXISTS `entity_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_inventory` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  KEY `item_id` (`entity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_inventory`
--

LOCK TABLES `entity_inventory` WRITE;
/*!40000 ALTER TABLE `entity_inventory` DISABLE KEYS */;
INSERT INTO `entity_inventory` VALUES (1,8,1),(1,7,2),(1,6,9),(1,5,3),(1,4,7),(1,3,6),(1,2,6),(1,1,5);
/*!40000 ALTER TABLE `entity_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guilds`
--

DROP TABLE IF EXISTS `guilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `race_id_requirement` int(11) NOT NULL DEFAULT '0',
  `class_id_requirement` int(11) NOT NULL DEFAULT '0',
  `level_requirement` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`name`),
  KEY `owner_id` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guilds`
--

LOCK TABLES `guilds` WRITE;
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
INSERT INTO `guilds` VALUES (1,1,'Nucleocide','286755fad04869ca523320acce0dc6a4','This group is only for friends of nucleo.',0,0,5);
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `hp_increase` int(11) NOT NULL DEFAULT '0',
  `mp_increase` int(11) NOT NULL DEFAULT '0',
  `raise_dead` tinyint(4) NOT NULL DEFAULT '0',
  `full_health` tinyint(4) NOT NULL DEFAULT '0',
  `full_magic` tinyint(4) NOT NULL DEFAULT '0',
  `enemy_damage` int(11) NOT NULL DEFAULT '0',
  `hp_mod_z` int(11) NOT NULL DEFAULT '0',
  `mp_mod_z` int(11) NOT NULL DEFAULT '0',
  `str_mod_z` int(11) NOT NULL DEFAULT '0',
  `vit_mod_z` int(11) NOT NULL DEFAULT '0',
  `agi_mod_z` int(11) NOT NULL DEFAULT '0',
  `wis_mod_z` int(11) NOT NULL DEFAULT '0',
  `int_mod_z` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  UNIQUE KEY `id` (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Health Potion',50,0,0,0,0,0,0,0,0,0,0,0,0,''),(2,'Full Health',0,0,0,1,0,0,0,0,0,0,0,0,0,''),(3,'Magic Potion',0,20,0,0,0,0,0,0,0,0,0,0,0,''),(4,'Full Magic',0,0,0,0,1,0,0,0,0,0,0,0,0,''),(5,'Resurrect',100,0,1,0,0,0,0,0,0,0,0,0,0,''),(6,'Full Resurrect',0,0,1,1,0,0,0,0,0,0,0,0,0,''),(7,'Death Potion',0,0,0,0,0,120,0,0,0,0,0,0,0,'');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_locations`
--

DROP TABLE IF EXISTS `map_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_locations` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL DEFAULT '0',
  `x_pos` int(11) NOT NULL DEFAULT '0',
  `y_pos` int(11) NOT NULL DEFAULT '0',
  `map_id` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `x_pos` (`x_pos`),
  KEY `y_pos` (`y_pos`),
  KEY `map_id` (`map_id`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_locations`
--

LOCK TABLES `map_locations` WRITE;
/*!40000 ALTER TABLE `map_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_locations_perm`
--

DROP TABLE IF EXISTS `map_locations_perm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_locations_perm` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL DEFAULT '0',
  `x_pos` int(11) NOT NULL DEFAULT '0',
  `y_pos` int(11) NOT NULL DEFAULT '0',
  `map_id` int(11) NOT NULL DEFAULT '0',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `x_pos` (`x_pos`),
  KEY `y_pos` (`y_pos`),
  KEY `map_id` (`map_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_locations_perm`
--

LOCK TABLES `map_locations_perm` WRITE;
/*!40000 ALTER TABLE `map_locations_perm` DISABLE KEYS */;
INSERT INTO `map_locations_perm` VALUES (1,0,6,4,1,'2008-08-17 14:12:20'),(11,0,14,14,6,'2006-09-06 23:44:02'),(12,0,5,6,10,'2006-09-04 00:44:08'),(13,0,6,5,2,'2006-09-04 21:04:11'),(14,0,5,5,2,'2006-09-04 21:41:19'),(15,0,14,8,6,'2006-09-05 20:41:32'),(16,0,9,5,2,'2006-09-05 18:10:43'),(17,0,7,2,4,'2006-11-05 19:52:31'),(32,0,8,13,8,'2006-09-25 13:49:23'),(31,0,6,7,7,'2006-09-09 01:30:27'),(33,0,9,2,2,'2006-11-06 09:54:07'),(34,0,18,1,1,'2006-11-09 15:33:58'),(35,0,5,7,9,'2006-11-08 22:07:16'),(36,0,3,3,2,'2006-11-10 05:00:31'),(37,0,8,13,11,'2006-11-19 02:37:34'),(38,0,10,3,2,'2006-11-22 14:12:11'),(39,0,11,5,10,'2006-12-03 16:02:02'),(40,0,4,4,10,'2006-12-07 02:14:01'),(41,0,6,1,4,'2006-12-11 18:43:04'),(42,0,6,3,2,'2006-12-12 19:46:20'),(43,0,3,3,2,'2007-01-06 22:24:05'),(44,0,4,4,6,'2007-01-07 20:51:55'),(45,0,14,6,2,'2007-01-13 08:12:26'),(46,0,8,2,10,'2007-01-26 22:03:54'),(47,0,4,5,2,'2007-02-15 03:46:00'),(48,0,4,10,6,'2007-03-28 15:22:22'),(49,0,11,5,10,'2007-03-21 17:48:37'),(50,0,6,7,7,'2007-03-30 15:37:43'),(51,0,9,5,2,'2007-03-30 20:02:44'),(52,0,14,6,2,'2007-04-01 21:15:35'),(53,0,5,12,9,'2007-04-18 12:52:09'),(54,0,11,5,10,'2007-04-15 15:57:52'),(55,0,15,6,4,'2007-04-27 13:33:44'),(56,0,11,5,10,'2007-05-24 13:34:48'),(57,0,8,8,10,'2007-05-25 05:34:52'),(58,0,10,4,1,'2007-06-11 17:13:56'),(59,0,4,4,3,'2007-06-25 16:00:42'),(60,0,6,3,10,'2007-07-16 13:26:48');
/*!40000 ALTER TABLE `map_locations_perm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_tiles`
--

DROP TABLE IF EXISTS `map_tiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_tiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `solid` tinyint(4) NOT NULL DEFAULT '0',
  `teleport_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`),
  KEY `solid` (`solid`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_tiles`
--

LOCK TABLES `map_tiles` WRITE;
/*!40000 ALTER TABLE `map_tiles` DISABLE KEYS */;
INSERT INTO `map_tiles` VALUES (1,'Grass',0,0),(2,'Rock',1,0),(3,'Tree',1,0),(4,'Forest',0,0),(5,'Town of Midland',0,1),(6,'Town of Bay City',0,2),(7,'Midland to Tri-Cities',0,3),(8,'Bay City to Tri-Cities',0,4),(9,'Water',2,0),(10,'Town of Saginaw',0,5),(11,'Saginaw to Tri-Cities',0,6),(12,'Nameless City',0,0),(13,'Tree',1,0),(14,'Bridge',0,0),(15,'Palm Tree',1,0),(16,'Tri-CIties to Central Heiria',0,7),(17,'Central Heiria to Tri-CIties',0,8),(18,'Central Heiria to West Heiria',0,9),(19,'West Heiria to Central Heiria',0,10),(20,'Central Heiria to North Heiria',0,11),(21,'North Heiria to Central Heiria',0,12),(22,'Central Heiria to East Heiria',0,13),(23,'East Heiria to Central Heiria',0,14),(24,'Central Heiria to South Heiria',0,15),(25,'South Heiria to Central Heiria',0,16),(26,'South Heiria to Southwest Heiria',0,17),(27,'Southwest Heiria to South Heiria',0,18),(28,'Southwest Heiria to West Heiria',0,19),(29,'West Heiria to Southwest Heiria',0,20),(30,'West Heiria to Northwest Heiria',0,21),(31,'Northwest Heiria to West Heiria',0,22),(32,'Northwest Heiria to North Heiria',0,23),(33,'North Heiriia to Northwest Heiria',0,24),(34,'North Heiria to Northeast Heiria',0,25),(35,'Northeast Heiria to North Heiria',0,26),(36,'Northeast Heiria to East Heiria',0,27),(37,'East Heiria to Northeast Heiria',0,28),(38,'East Heiria to Southeast Heiria',0,29),(39,'Southeast Heiria to East Heiria',0,30),(40,'Southeast Heiria to South Heiria',0,31),(41,'South Heiria to Southeast Heiria',0,32);
/*!40000 ALTER TABLE `map_tiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maps`
--

DROP TABLE IF EXISTS `maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `hostile` tinyint(4) NOT NULL DEFAULT '0',
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maps`
--

LOCK TABLES `maps` WRITE;
/*!40000 ALTER TABLE `maps` DISABLE KEYS */;
INSERT INTO `maps` VALUES (1,'Tri-Cities','2,2,2,2,9,2,2,2,2,9,9,9,9,9,2,2,2,2,2,2,2,4,4,4,9,4,4,4,1,1,9,15,9,1,1,4,4,4,4,2,2,4,4,4,14,4,4,1,1,1,9,16,9,1,1,1,4,4,4,9,2,4,4,4,9,3,1,3,1,1,9,14,9,1,1,3,1,9,14,9,2,4,4,4,5,1,1,1,1,1,1,1,1,1,1,1,6,9,1,9,2,4,4,4,9,1,1,3,1,3,1,1,3,3,1,3,1,9,14,9,2,4,4,4,9,1,1,1,1,1,1,1,1,1,1,1,4,4,4,9,2,4,4,4,14,4,4,3,1,3,1,1,3,3,1,3,4,4,4,2,2,4,4,4,9,4,4,4,1,1,1,1,1,4,4,4,4,4,4,2,2,2,2,2,9,2,2,2,2,13,10,10,13,2,2,2,2,2,2,2',1,20,10),(2,'Midland','3,3,3,3,3,3,3,3,3,3,3,3,9,3,3,3,3,4,4,4,4,4,4,4,4,4,15,15,9,15,4,2,3,4,4,4,1,1,1,1,4,1,1,15,9,4,4,2,3,4,4,4,1,1,1,1,1,1,1,1,14,1,1,2,3,4,4,1,1,1,1,1,1,1,1,1,14,1,1,7,3,4,4,1,1,1,1,1,1,1,1,15,9,4,4,2,3,4,1,1,1,4,4,4,4,1,15,15,9,15,4,2,3,3,3,3,3,3,3,3,3,3,3,3,9,3,3,3',0,16,8),(3,'Bay City','3,3,3,3,3,3,3,3,3,3,3,3,3,9,9,9,3,1,1,1,1,1,1,1,1,1,1,1,15,9,9,9,3,1,1,1,1,1,1,1,1,1,1,1,1,14,14,9,3,1,15,1,15,1,15,1,15,1,15,1,15,9,9,9,8,1,1,1,1,1,1,1,1,1,1,1,1,14,14,9,3,1,15,1,15,1,15,1,15,1,15,1,15,9,9,9,3,1,1,1,1,1,1,1,1,1,1,1,1,14,14,9,3,3,3,3,3,3,3,3,3,3,3,3,3,9,9,9',0,16,8),(4,'Saginaw','2,2,2,2,2,2,2,2,2,11,11,2,2,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,13,1,1,13,1,1,1,1,1,1,1,2,2,1,9,9,9,9,9,1,1,1,1,1,1,9,9,9,9,9,1,2,2,1,9,1,12,1,9,9,9,14,14,9,9,9,2,12,2,9,1,2,2,1,9,1,1,1,9,9,9,14,14,9,9,9,1,1,1,9,1,2,2,1,9,9,9,9,9,1,1,1,1,1,1,9,9,9,9,9,1,2,2,1,9,1,1,1,1,1,13,1,1,13,1,1,1,1,1,1,1,2,2,13,9,13,1,13,13,13,13,1,1,13,13,13,13,1,13,13,13,2,2,1,9,1,1,1,1,1,13,1,1,13,1,1,1,1,1,1,1,2,2,1,9,4,4,4,4,1,13,1,1,13,1,9,9,9,9,9,1,2,2,1,9,4,4,4,4,1,1,1,1,1,1,9,4,4,4,9,1,2,2,1,9,4,4,4,4,1,1,1,1,1,1,9,4,4,4,9,1,2,2,1,9,4,4,4,4,1,13,1,1,13,1,9,9,9,9,9,1,2,2,1,9,1,1,1,1,1,13,1,1,13,1,1,1,1,1,1,1,2,2,13,9,13,1,13,13,13,13,1,1,13,13,13,13,1,13,13,13,2,2,1,9,1,1,1,1,1,13,1,1,13,1,1,1,1,1,1,1,2,2,1,9,4,4,4,4,1,1,1,1,1,1,4,4,4,4,4,1,2,2,1,9,4,4,4,4,1,1,1,1,1,1,4,4,4,4,4,1,2,2,1,9,1,1,1,1,1,13,1,1,13,1,1,1,1,1,1,1,2,2,2,9,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2',0,20,20),(6,'Heiria Northwest','2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,9,9,9,9,9,9,9,9,9,9,15,15,15,15,2,2,9,9,15,1,15,9,9,9,9,9,15,15,15,15,2,2,9,9,15,12,15,9,9,9,9,9,9,9,9,9,9,2,9,9,1,1,1,9,9,9,9,9,15,4,4,15,2,2,9,9,9,14,9,9,9,9,9,9,1,1,4,4,2,2,9,9,9,14,9,9,9,9,9,9,15,1,1,4,2,2,9,9,9,14,9,9,9,9,9,9,1,1,1,1,2,2,9,9,9,14,9,9,9,9,9,9,15,1,1,1,32,2,3,4,1,1,3,9,3,4,4,3,1,1,1,4,2,2,4,4,4,4,1,14,1,1,1,1,1,1,4,4,2,2,3,4,4,4,1,9,3,1,4,3,1,4,4,4,2,2,4,4,4,4,1,9,9,14,9,9,4,4,4,4,2,2,3,4,4,1,1,1,1,1,1,9,4,4,4,4,2,2,4,4,1,1,1,1,1,1,1,9,4,4,4,4,2,2,2,2,2,2,2,2,2,31,2,9,2,2,2,2,2',1,16,16),(7,'Heiria North','2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4,4,4,4,4,2,2,4,4,1,1,1,1,1,1,1,1,1,4,3,4,2,9,9,9,14,9,9,9,9,9,9,9,9,14,9,9,9,2,4,4,1,4,13,13,13,9,4,4,1,1,4,4,2,2,3,4,1,4,4,3,13,9,4,4,4,1,4,4,2,2,3,4,1,4,4,4,4,9,4,1,1,1,1,4,2,2,4,4,1,1,1,1,1,14,1,1,1,1,1,1,2,33,1,1,1,4,4,4,1,9,9,4,3,1,1,1,34,2,4,4,1,4,3,4,1,3,9,1,1,1,1,1,2,2,4,4,1,4,4,4,1,1,14,1,1,4,4,4,2,2,3,13,1,1,1,1,1,1,9,9,4,4,3,4,2,2,13,3,4,1,1,4,4,1,4,9,4,3,4,4,2,2,3,13,4,4,1,1,1,1,4,9,4,4,3,4,2,2,13,13,13,4,4,4,1,1,4,9,4,4,4,4,2,2,2,2,2,2,2,2,2,21,2,9,2,2,2,2,2',1,16,16),(8,'Heiria Northeast','2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4,4,4,4,4,2,2,4,4,4,9,9,9,9,9,9,9,9,4,4,4,2,9,9,9,9,9,4,4,4,4,4,4,9,9,4,4,2,2,4,4,4,4,4,4,1,1,1,4,4,9,9,4,2,2,4,4,4,4,1,1,1,1,1,1,4,4,9,4,2,2,4,4,1,1,1,1,1,1,1,1,1,4,9,4,2,2,1,1,1,1,1,1,13,13,13,1,1,1,9,4,2,35,1,1,1,1,13,13,13,13,13,13,1,1,9,4,2,2,4,4,4,13,13,13,13,2,13,13,1,1,9,4,2,13,13,13,13,13,13,13,13,13,13,1,1,1,9,4,2,13,13,13,13,13,13,13,13,13,1,1,1,1,9,4,2,13,13,13,13,13,13,13,4,1,1,1,1,4,9,4,2,13,13,13,13,13,13,4,1,1,1,1,4,4,9,4,2,13,13,13,13,13,13,4,1,1,1,4,9,9,9,4,2,13,13,13,13,2,2,2,2,36,2,2,9,2,2,2,2',1,16,16),(9,'Heiria West','2,2,2,2,2,2,2,2,30,2,9,2,2,2,2,2,2,4,4,3,4,4,4,4,1,15,9,1,1,1,1,2,2,4,4,4,4,4,4,1,1,15,9,1,1,1,1,2,13,4,4,4,4,4,1,1,1,15,9,9,1,1,1,2,13,13,4,4,4,1,1,4,1,1,1,14,1,1,1,2,13,13,13,4,4,1,4,4,1,15,15,9,1,1,1,2,13,13,13,13,4,1,4,4,1,9,9,9,9,9,9,9,13,13,13,13,13,1,4,4,1,9,15,15,1,1,1,2,13,13,13,13,13,1,1,1,1,14,1,1,1,1,1,19,13,12,9,9,9,14,9,9,14,9,1,1,1,1,1,2,13,13,13,13,4,1,9,15,1,1,4,1,1,1,1,2,13,13,13,13,13,1,9,15,1,1,1,1,1,1,4,2,13,4,4,4,4,1,9,1,1,1,4,1,1,4,4,2,2,13,4,4,4,1,14,1,1,1,1,4,4,4,4,2,2,4,4,4,4,4,9,1,1,1,4,4,4,4,4,2,2,2,2,2,2,2,9,2,29,2,2,2,2,2,2,2',1,16,16),(10,'Heiria Central','2,2,2,2,2,2,2,2,20,2,9,13,13,13,13,13,2,1,1,1,1,1,1,1,1,15,9,15,1,1,1,13,2,1,1,1,1,1,1,1,1,9,9,9,1,1,1,13,2,1,1,1,1,1,1,1,15,9,15,9,9,1,1,13,2,1,1,1,1,1,1,1,1,14,1,1,14,1,1,13,2,1,15,1,1,1,1,1,15,9,1,1,9,9,9,9,9,14,9,9,9,14,9,9,9,9,1,1,1,1,1,2,2,1,15,1,1,1,15,9,17,1,1,1,15,1,15,2,18,1,1,1,1,1,1,14,1,1,1,1,1,1,1,22,2,1,1,1,1,1,1,9,15,1,15,4,15,4,15,2,2,1,1,1,1,1,1,9,4,1,4,4,4,4,4,2,2,1,1,1,1,1,1,9,15,1,13,4,13,3,4,2,2,1,1,1,1,1,1,14,4,1,4,3,4,4,4,2,2,1,1,1,15,9,9,9,15,1,13,4,4,3,3,2,2,1,1,1,1,14,1,1,1,1,3,4,4,4,4,2,2,2,2,2,2,9,2,2,24,2,2,2,2,2,2,2',1,16,16),(11,'Heiria East','13,13,13,13,13,2,2,2,37,2,2,9,2,2,2,2,13,13,13,4,4,4,1,1,1,1,1,9,4,4,3,2,13,13,13,4,1,1,1,1,1,1,1,9,1,4,4,2,13,13,4,1,1,1,1,1,1,1,1,9,1,1,4,2,13,13,15,1,15,1,15,1,1,1,9,9,9,9,15,2,9,9,9,9,9,9,9,14,14,14,9,3,3,9,9,9,2,1,15,1,15,1,15,1,1,1,9,9,9,9,15,2,2,1,1,1,1,1,1,1,1,1,4,9,4,4,4,2,23,1,4,1,4,4,4,4,1,1,1,14,4,4,4,2,2,1,4,1,4,3,3,4,1,4,4,9,4,4,4,2,2,1,1,1,4,3,3,4,1,4,3,9,4,4,4,2,2,1,4,1,4,4,4,4,1,4,4,9,4,4,4,2,2,1,1,1,1,1,1,1,1,1,1,14,4,4,4,2,2,1,4,1,4,4,4,4,1,1,4,9,9,9,4,2,2,1,4,1,4,3,3,4,1,4,3,3,3,9,4,2,2,2,2,2,2,2,2,2,38,2,2,2,2,9,2,2',1,16,16),(12,'Heiria Southwest','2,2,2,2,2,2,9,2,28,2,2,2,2,2,2,2,2,13,13,4,4,4,9,1,1,13,4,4,4,4,4,2,2,13,13,4,4,4,9,1,1,4,13,13,4,4,4,2,2,13,4,4,1,1,14,1,1,1,4,4,13,4,4,2,2,4,4,1,1,4,9,1,1,1,4,4,4,13,4,2,2,4,4,1,4,4,9,1,1,1,1,4,4,13,4,2,9,9,9,14,9,9,9,1,1,1,1,1,1,4,13,2,2,4,4,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,4,4,4,4,4,4,4,4,1,1,1,1,1,27,2,2,2,4,4,4,4,4,4,4,4,4,4,4,2,2,2,13,2,2,4,4,4,2,2,2,2,2,2,2,2,2,2,13,13,2,2,4,2,2,2,13,2,2,2,2,4,2,2,13,13,13,2,4,2,13,13,13,13,13,2,13,4,2,2,13,13,13,4,4,4,4,4,4,4,4,4,4,4,2,2,13,13,13,13,4,4,13,13,13,13,13,13,13,13,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2',1,16,16),(13,'Heiria South','2,2,2,2,2,9,2,2,25,2,2,2,2,2,2,2,2,4,4,4,4,9,1,1,1,1,1,4,4,4,4,2,2,4,4,4,4,9,1,1,1,1,1,1,4,4,4,2,2,4,4,4,4,9,1,1,1,1,1,1,1,4,4,2,2,4,4,1,1,14,1,1,1,1,1,1,1,4,4,2,2,4,1,1,1,9,1,1,2,2,1,1,1,1,4,2,2,4,1,1,1,9,1,2,2,2,2,1,1,1,1,2,2,1,1,1,1,9,1,2,2,2,2,1,1,1,1,2,26,1,1,1,1,14,1,1,2,2,2,1,1,1,1,41,2,1,1,1,1,9,1,1,2,2,2,1,1,1,1,2,2,1,1,1,1,9,1,1,1,1,1,1,1,1,1,2,2,1,1,1,1,9,1,1,1,1,1,1,1,4,4,2,2,1,1,1,1,14,1,1,1,1,1,1,4,4,4,2,2,1,1,1,2,9,2,1,1,1,4,4,4,4,4,2,2,1,1,2,2,9,2,2,4,4,4,4,4,4,4,2,2,2,2,2,2,9,2,2,2,2,2,2,2,2,2,2',1,16,16),(14,'Heiria Southeast','2,2,2,2,2,2,2,2,39,2,2,2,2,9,2,2,2,4,4,4,4,4,4,3,1,1,4,4,4,9,12,2,2,13,4,13,4,13,4,4,1,1,1,4,4,9,1,2,2,4,4,4,4,4,4,3,1,1,1,1,1,9,2,2,2,13,13,4,4,13,4,4,1,1,1,1,1,14,4,2,2,4,13,4,13,4,4,3,1,1,1,1,4,9,4,2,2,4,4,4,4,13,4,4,1,1,1,1,4,9,4,2,2,3,4,3,4,3,4,3,1,1,4,1,4,9,4,2,40,1,1,1,1,1,1,1,1,1,4,1,4,9,4,2,2,1,15,1,15,1,15,1,15,1,15,1,15,9,15,2,2,1,1,1,1,1,1,1,1,1,1,1,1,9,1,2,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9',1,16,16);
/*!40000 ALTER TABLE `maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `races` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `hp_mod_x` float NOT NULL DEFAULT '0',
  `mp_mod_x` float NOT NULL DEFAULT '0',
  `str_mod_x` float NOT NULL DEFAULT '0',
  `vit_mod_x` float NOT NULL DEFAULT '0',
  `agi_mod_x` float NOT NULL DEFAULT '0',
  `int_mod_x` float NOT NULL DEFAULT '0',
  `wis_mod_x` float NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES (1,'Human',1.2,0.1,0.005,0.009,0.012,0.011,0.01,'Humans aren\'t good at anything but they don\'t suck at anything.'),(2,'Dwarf',1.2,0.01,0.007,0.006,0.007,0.005,0.005,'Dwarfs are stronger and dumber. And short. Stinky...'),(3,'Elf',0.8,0.4,0.003,0.006,0.04,0.02,0.03,'Elves are good with magic and thinking and grace.'),(4,'Faerie',0.9,0.7,0.004,0.004,0.1,0.2,0.1,'They fly and do magic stuff.');
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shields`
--

DROP TABLE IF EXISTS `shields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `level_requirement` int(11) NOT NULL DEFAULT '0',
  `class_id_requirement` int(11) NOT NULL DEFAULT '0',
  `race_id_requirement` int(11) NOT NULL DEFAULT '0',
  `base_defense` int(11) NOT NULL DEFAULT '0',
  `base_evasion` int(11) NOT NULL DEFAULT '0',
  `hp_mod_z` int(11) NOT NULL DEFAULT '0',
  `mp_mod_z` int(11) NOT NULL DEFAULT '0',
  `str_mod_z` int(11) NOT NULL DEFAULT '0',
  `vit_mod_z` int(11) NOT NULL DEFAULT '0',
  `agi_mod_z` int(11) NOT NULL DEFAULT '0',
  `wis_mod_z` int(11) NOT NULL DEFAULT '0',
  `int_mod_z` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shields`
--

LOCK TABLES `shields` WRITE;
/*!40000 ALTER TABLE `shields` DISABLE KEYS */;
INSERT INTO `shields` VALUES (1,'Iron Shield',0,0,0,10,10,100,0,0,1,-1,0,0,'Shield Made of Iron. HP+100, VIT+1, AGI-1',0),(2,'Studded Shield',3,0,0,15,9,120,0,0,1,-1,0,0,'Shield made of studded metal. HP+120, VIT+1, AGI-1',0),(3,'Studded Iron Shield',5,0,0,20,8,150,0,0,2,-2,0,0,'Shield made of studded iron. HP+150, VIT+2, AGI-2',0),(4,'Dragon Shield',30,0,0,30,15,320,0,1,8,0,5,0,'Shield for dragon combat. HP+320, STR+1, VIT+8, WIS+5',0);
/*!40000 ALTER TABLE `shields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_inventory`
--

DROP TABLE IF EXISTS `spell_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_inventory` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `spell_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `spell_id` (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_inventory`
--

LOCK TABLES `spell_inventory` WRITE;
/*!40000 ALTER TABLE `spell_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spells`
--

DROP TABLE IF EXISTS `spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spells` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `element_id` int(11) NOT NULL DEFAULT '0',
  `mp_cost` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `target_enemy` tinyint(4) NOT NULL DEFAULT '0',
  `base_hp` int(11) NOT NULL DEFAULT '0',
  `effect_id` int(11) NOT NULL DEFAULT '0',
  `effect_amount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spells`
--

LOCK TABLES `spells` WRITE;
/*!40000 ALTER TABLE `spells` DISABLE KEYS */;
INSERT INTO `spells` VALUES (1,'Pyrostatic',1,5,1,1,20,0,0),(2,'Pyrodynamic',1,16,2,1,50,0,0),(3,'Pyromega',1,28,3,1,120,0,0);
/*!40000 ALTER TABLE `spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teleports`
--

DROP TABLE IF EXISTS `teleports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teleports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `map_id` int(11) NOT NULL DEFAULT '0',
  `x_pos` int(11) NOT NULL DEFAULT '0',
  `y_pos` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teleports`
--

LOCK TABLES `teleports` WRITE;
/*!40000 ALTER TABLE `teleports` DISABLE KEYS */;
INSERT INTO `teleports` VALUES (1,2,14,4),(2,3,1,4),(3,1,5,4),(4,1,15,4),(5,4,10,1),(6,1,10,8),(7,10,8,8),(8,1,11,3),(9,9,14,8),(10,10,1,8),(11,7,8,14),(12,10,8,1),(13,11,1,8),(14,10,14,8),(15,13,8,1),(16,10,8,14),(17,12,14,8),(18,13,1,8),(19,9,8,14),(20,12,8,1),(21,6,8,14),(22,9,8,1),(23,7,1,8),(24,6,14,8),(25,8,1,8),(26,7,14,8),(27,11,8,1),(28,8,8,14),(29,14,8,1),(30,11,8,14),(31,13,14,8),(32,14,1,8);
/*!40000 ALTER TABLE `teleports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `level_requirement` int(11) NOT NULL DEFAULT '1',
  `class_id_requirement` int(11) NOT NULL DEFAULT '0',
  `race_id_requirement` int(11) NOT NULL DEFAULT '0',
  `element_id` int(11) NOT NULL DEFAULT '0',
  `base_damage` int(11) NOT NULL DEFAULT '0',
  `base_accuracy` int(11) NOT NULL DEFAULT '0',
  `hp_mod_z` int(11) NOT NULL DEFAULT '0',
  `mp_mod_z` int(11) NOT NULL DEFAULT '0',
  `str_mod_z` int(11) NOT NULL DEFAULT '0',
  `vit_mod_z` int(11) NOT NULL DEFAULT '0',
  `agi_mod_z` int(11) NOT NULL DEFAULT '0',
  `wis_mod_z` int(11) NOT NULL DEFAULT '0',
  `int_mod_z` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES (1,'Dagger',0,0,0,0,10,90,0,0,0,0,0,0,0,'Dagger',0),(2,'Long Sword',1,0,0,0,15,91,0,0,0,0,0,0,0,'',0),(3,'Two Handed Sword',5,0,0,0,20,92,0,0,2,0,-2,0,0,'Takes two hands to hold. STR+2, AGI-2.',0);
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-02 18:26:54
