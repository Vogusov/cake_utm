-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: utmdb
-- ------------------------------------------------------
-- Server version	5.7.44

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
-- Table structure for table `utm_data`
--

DROP TABLE IF EXISTS `utm_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utm_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(190) NOT NULL,
  `medium` varchar(190) NOT NULL,
  `campaign` varchar(190) NOT NULL,
  `content` varchar(190) DEFAULT NULL,
  `term` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_source` (`source`),
  KEY `idx_source_medium` (`source`,`medium`),
  KEY `idx_source_medium_campaign` (`source`,`medium`,`campaign`),
  KEY `idx_source_medium_campaign_content` (`source`,`medium`,`campaign`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utm_data`
--

LOCK TABLES `utm_data` WRITE;
/*!40000 ALTER TABLE `utm_data` DISABLE KEYS */;
INSERT INTO `utm_data` VALUES (1,'google','cpc','summer','banner','video'),(2,'google','cpc','winter','delta',NULL),(3,'google','cpc','summer',NULL,NULL),(4,'source1','medium1','summer','delta','video'),(5,'source1','medium2','summer','banner','video'),(6,'source1','medium3','summer','banner',NULL),(7,'source1','medium1','spring','delta','video'),(8,'source1','medium2','spring','banner','video'),(9,'source2','medium1','summer','delta','video'),(10,'source2','medium1','summer',NULL,NULL),(11,'source2','medium3','spring','delta','video'),(12,'source3','cpc','summer','banner','video'),(13,'source3','medium1','spring','banner','video'),(14,'source3','cpc','winter','banner','video'),(15,'source3','medium1','spring','delta','video'),(16,'google','cpc','summer','banner','video'),(17,'google','cpc','winter','delta',NULL),(18,'google','cpc','summer',NULL,NULL),(19,'source1','medium1','summer','delta','video'),(20,'source1','medium2','summer','banner','video'),(21,'source1','medium3','summer','banner',NULL),(22,'source1','medium1','spring','delta','video'),(23,'source1','medium2','spring','banner','video'),(24,'source2','medium1','summer','delta','video'),(25,'source2','medium1','summer',NULL,NULL),(26,'source2','medium3','spring','delta','video'),(27,'source3','cpc','summer','banner','video'),(28,'source4','medium1','spring','banner','video'),(29,'source5','cpc','winter','banner','video'),(30,'source6','medium1','spring','delta','video'),(31,'source7','medium1','spring','delta','video'),(32,'source8','medium1','spring','delta','video'),(33,'source9','medium1','spring','delta','video'),(34,'source10','medium1','spring','delta','video'),(35,'source11','medium1','spring','delta','video'),(36,'source12','medium1','spring','delta','video'),(37,'source13','medium1','spring','delta','video'),(38,'source14','medium1','spring','delta','video'),(39,'source15','medium1','spring','delta','video'),(40,'source16','medium1','spring','delta','video'),(41,'source17','medium1','spring','delta','video'),(42,'source18','medium1','spring','delta','video'),(43,'source19','medium1','spring','delta','video'),(44,'source20','medium1','spring','delta','video'),(45,'source21','medium1','spring','delta','video'),(46,'source22','medium1','spring','delta','video'),(47,'source23','medium1','spring','delta','video'),(48,'source24','medium1','spring','delta','video'),(49,'source25','medium1','spring','delta','video'),(50,'source26','medium1','spring','delta','video'),(51,'source27','medium1','spring','delta','video'),(52,'source28','medium1','spring','delta','video'),(53,'source29','medium1','spring','delta','video'),(54,'source30','medium1','spring','delta','video'),(55,'google','cpc','summer','banner','video'),(56,'google','cpc','winter','delta',NULL),(57,'google','cpc','summer',NULL,NULL),(58,'source1','medium1','summer','delta','video'),(59,'source1','medium2','summer','banner','video'),(60,'source1','medium3','summer','banner',NULL),(61,'source1','medium1','spring','delta','video'),(62,'source1','medium2','spring','banner','video'),(63,'source2','medium1','summer','delta','video'),(64,'source2','medium1','summer',NULL,NULL),(65,'source2','medium3','spring','delta','video'),(66,'source3','cpc','summer','banner','video'),(67,'source4','medium1','spring','banner','video'),(68,'source5','cpc','winter','banner','video'),(69,'source6','medium1','spring','delta','video'),(70,'source7','medium1','spring','delta','video'),(71,'source8','medium1','spring','delta','video'),(72,'source9','medium1','spring','delta','video'),(73,'source10','medium1','spring','delta','video'),(74,'source11','medium1','spring','delta','video'),(75,'source12','medium1','spring','delta','video'),(76,'source13','medium1','spring','delta','video'),(77,'source14','medium1','spring','delta','video'),(78,'source15','medium1','spring','delta','video'),(79,'source16','medium1','spring','delta','video'),(80,'source17','medium1','spring','delta','video'),(81,'source18','medium1','spring','delta','video'),(82,'source19','medium1','spring','delta','video'),(83,'source20','medium1','spring','delta','video'),(84,'source21','medium1','spring','delta','video'),(85,'source22','medium1','spring','delta','video'),(86,'source23','medium1','spring','delta','video'),(87,'source24','medium1','spring','delta','video'),(88,'source25','medium1','spring','delta','video'),(89,'source26','medium1','spring','delta','video'),(90,'source27','medium1','spring','delta','video'),(91,'source28','medium1','spring','delta','video'),(92,'source29','medium1','spring','delta','video'),(93,'source30','medium1','spring','delta','video'),(94,'source211','medium1','spring','delta','video'),(95,'source222','medium1','spring','delta','video'),(96,'source212','medium1','spring','delta','video'),(97,'source213','medium1','spring','delta','video');
/*!40000 ALTER TABLE `utm_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-26 16:02:24
