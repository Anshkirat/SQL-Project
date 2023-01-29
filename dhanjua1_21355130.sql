-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: world_cup
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `broadcasted_by`
--

DROP TABLE IF EXISTS `broadcasted_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcasted_by` (
  `match_number` int NOT NULL,
  `broadcaster_code` int NOT NULL,
  PRIMARY KEY (`match_number`,`broadcaster_code`),
  KEY `broadcaster_code` (`broadcaster_code`),
  CONSTRAINT `broadcasted_by_ibfk_1` FOREIGN KEY (`match_number`) REFERENCES `match_schedule` (`m_number`),
  CONSTRAINT `broadcasted_by_ibfk_2` FOREIGN KEY (`broadcaster_code`) REFERENCES `broadcaster` (`broadcaster_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcasted_by`
--

LOCK TABLES `broadcasted_by` WRITE;
/*!40000 ALTER TABLE `broadcasted_by` DISABLE KEYS */;
INSERT INTO `broadcasted_by` VALUES (1,1),(2,5),(4,5),(1,21),(7,78),(2,92),(11,92);
/*!40000 ALTER TABLE `broadcasted_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broadcaster`
--

DROP TABLE IF EXISTS `broadcaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broadcaster` (
  `broadcaster_code` int NOT NULL,
  `b_name` varchar(50) DEFAULT NULL,
  `b_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`broadcaster_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broadcaster`
--

LOCK TABLES `broadcaster` WRITE;
/*!40000 ALTER TABLE `broadcaster` DISABLE KEYS */;
INSERT INTO `broadcaster` VALUES (1,'Sky Sports','Cable TV'),(5,'Fox TV','Cable TV'),(21,'Tata Sky','Cable TV'),(78,'Disney Hotstar','OTT'),(92,'Sony Liv','OTT');
/*!40000 ALTER TABLE `broadcaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `broadcaster_match_details`
--

DROP TABLE IF EXISTS `broadcaster_match_details`;
/*!50001 DROP VIEW IF EXISTS `broadcaster_match_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `broadcaster_match_details` AS SELECT 
 1 AS `match_number`,
 1 AS `broadcaster_code`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `complete_match_details`
--

DROP TABLE IF EXISTS `complete_match_details`;
/*!50001 DROP VIEW IF EXISTS `complete_match_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `complete_match_details` AS SELECT 
 1 AS `m_number`,
 1 AS `m_type`,
 1 AS `stadium_id`,
 1 AS `broadcaster_code`,
 1 AS `b_name`,
 1 AS `b_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `continents_covered`
--

DROP TABLE IF EXISTS `continents_covered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `continents_covered` (
  `broadcaster_code` int NOT NULL,
  `continent` varchar(50) NOT NULL,
  PRIMARY KEY (`broadcaster_code`,`continent`),
  CONSTRAINT `continents_covered_ibfk_1` FOREIGN KEY (`broadcaster_code`) REFERENCES `broadcaster` (`broadcaster_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continents_covered`
--

LOCK TABLES `continents_covered` WRITE;
/*!40000 ALTER TABLE `continents_covered` DISABLE KEYS */;
INSERT INTO `continents_covered` VALUES (1,'Europe'),(5,'Africa'),(5,'Australia'),(21,'Asia'),(78,'America'),(92,'Europe');
/*!40000 ALTER TABLE `continents_covered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `m_id` int NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `no_of_members` int DEFAULT NULL,
  `coach_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (11,'Argentina',7,'Alejandro Garnacho'),(12,'Germany',7,'Hansi Flick'),(13,'Netherlands',8,'Louis Van Haal'),(34,'France',6,'Didier Deschamps'),(57,'Ireland',5,'Connor o Mcgregor');
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_schedule`
--

DROP TABLE IF EXISTS `match_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_schedule` (
  `m_number` int NOT NULL,
  `m_type` varchar(50) DEFAULT NULL,
  `stadium_id` int DEFAULT NULL,
  PRIMARY KEY (`m_number`),
  KEY `stadium_id` (`stadium_id`),
  CONSTRAINT `match_schedule_ibfk_1` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_schedule`
--

LOCK TABLES `match_schedule` WRITE;
/*!40000 ALTER TABLE `match_schedule` DISABLE KEYS */;
INSERT INTO `match_schedule` VALUES (1,'Play-off',2201),(2,'Play-off',17),(4,'Semi-Final',13),(5,'Play-off',20),(7,'Play-off',2201),(11,'Quater-Final',62);
/*!40000 ALTER TABLE `match_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `max_busy_stadium`
--

DROP TABLE IF EXISTS `max_busy_stadium`;
/*!50001 DROP VIEW IF EXISTS `max_busy_stadium`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `max_busy_stadium` AS SELECT 
 1 AS `stadium_id`,
 1 AS `s_name`,
 1 AS `location`,
 1 AS `capacity`,
 1 AS `no_of_gates`,
 1 AS `no_of_matches`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `officiate`
--

DROP TABLE IF EXISTS `officiate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officiate` (
  `ref_code` int NOT NULL,
  `m_number` int NOT NULL,
  PRIMARY KEY (`ref_code`,`m_number`),
  KEY `m_number` (`m_number`),
  CONSTRAINT `officiate_ibfk_1` FOREIGN KEY (`m_number`) REFERENCES `match_schedule` (`m_number`),
  CONSTRAINT `officiate_ibfk_2` FOREIGN KEY (`ref_code`) REFERENCES `referee` (`ref_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officiate`
--

LOCK TABLES `officiate` WRITE;
/*!40000 ALTER TABLE `officiate` DISABLE KEYS */;
INSERT INTO `officiate` VALUES (2291,1),(2212,2),(2213,2),(2212,4),(2268,4),(2268,7),(2291,7),(2212,11),(2234,11);
/*!40000 ALTER TABLE `officiate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referee` (
  `ref_code` int NOT NULL,
  `r_name` varchar(50) DEFAULT NULL,
  `country_from` varchar(100) DEFAULT NULL,
  `r_type` varchar(20) DEFAULT NULL,
  `no_of_matches` int DEFAULT NULL,
  PRIMARY KEY (`ref_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
INSERT INTO `referee` VALUES (2212,'Harvey Specter','America','VAR',5),(2213,'Mcbrady Singh','England','Linesman',10),(2234,'Riley Santos','Brazil','Linesman',6),(2250,'Anshkirat Singh Dhanju','India','Ground Referee',0),(2268,'Donovon Mitchell','Germany','Main Match',4),(2291,'Jessi Fernandez','Portugal','3rd Official',5);
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `new_entry` BEFORE INSERT ON `referee` FOR EACH ROW IF NEW.ref_code < 2200 OR NEW.ref_code > 2299 THEN
SIGNAL SQLSTATE '60000' SET MESSAGE_TEXT = 'Referee not FIFA recogonized.';
END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_referee` AFTER DELETE ON `referee` FOR EACH ROW BEGIN
DECLARE r_id INT;
SELECT DELETED.ref_code INTO r_id FROM DELETED;
UPDATE officiate SET ref_code = (SELECT ref_code from referee WHERE no_of_matches < 4) WHERE ref_code = r_id;
SIGNAL SQLSTATE '60001' SET MESSAGE_TEXT = 'New referee appointed.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `referee_2212`
--

DROP TABLE IF EXISTS `referee_2212`;
/*!50001 DROP VIEW IF EXISTS `referee_2212`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `referee_2212` AS SELECT 
 1 AS `ref_code`,
 1 AS `m_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor` (
  `sponsor_id` int NOT NULL,
  `sponsor_name` varchar(50) DEFAULT NULL,
  `industry_from` varchar(100) DEFAULT NULL,
  `s_country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sponsor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (10,'Three','Telecommunication','Ireland'),(11,'Chevrolet','Automobile','America'),(58,'Carlsberg','Bevarge and Drinks','Denmark'),(63,'Qatar Airways','Aviation','Qatar'),(72,'Etihad','Aviation','UAE');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsored_by`
--

DROP TABLE IF EXISTS `sponsored_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsored_by` (
  `team_id` int NOT NULL,
  `sponsor_id` int NOT NULL,
  PRIMARY KEY (`team_id`,`sponsor_id`),
  KEY `sponsor_id` (`sponsor_id`),
  CONSTRAINT `sponsored_by_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `sponsored_by_ibfk_2` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`sponsor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsored_by`
--

LOCK TABLES `sponsored_by` WRITE;
/*!40000 ALTER TABLE `sponsored_by` DISABLE KEYS */;
INSERT INTO `sponsored_by` VALUES (62,10),(17,11),(13,58),(13,63),(20,63);
/*!40000 ALTER TABLE `sponsored_by` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `stadium_id` int NOT NULL,
  `s_name` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `no_of_gates` int DEFAULT NULL,
  `no_of_matches` int DEFAULT NULL,
  PRIMARY KEY (`stadium_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES (13,'National Stadium','Wicklow',62000,4,4),(17,'Copera Flex','Dublin',66000,6,6),(20,'Anshkirat stadium','Galway',58777,6,4),(62,'Grand Docks Stadium','Limerick',85000,12,10),(2201,'Grand stad','Dublin',78000,8,8),(2217,'Vodafone Stadium','Dublin',42000,6,0);
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_stadium` AFTER DELETE ON `stadium` FOR EACH ROW BEGIN
DECLARE s_id INT;
SELECT DELETED.stadium_id INTO s_id FROM DELETED;
UPDATE match_schedule SET stadium_id = (SELECT stadium_id from stadium WHERE no_of_matches < 4) WHERE stadium_id = s_id;
SIGNAL SQLSTATE '60002' SET MESSAGE_TEXT = 'Stadium updated.';
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL,
  `country` varchar(50) DEFAULT NULL,
  `no_of_members` int DEFAULT NULL,
  `m_id` int DEFAULT NULL,
  `match_no` int DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `m_id` (`m_id`),
  KEY `match_no` (`match_no`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `management` (`m_id`),
  CONSTRAINT `team_ibfk_2` FOREIGN KEY (`match_no`) REFERENCES `match_schedule` (`m_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (10,'Argentina',16,11,1),(13,'Netherlands',13,13,4),(17,'France',18,34,2),(20,'Germany',20,12,7),(62,'Ireland',23,57,11);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'world_cup'
--

--
-- Dumping routines for database 'world_cup'
--
/*!50003 DROP FUNCTION IF EXISTS `attendadnce` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `attendadnce`(stadium_id int) RETURNS int
    DETERMINISTIC
BEGIN
  RETURN (select capacity from stadium where stadium_id = stadium_id) ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `broadcaster_match_details`
--

/*!50001 DROP VIEW IF EXISTS `broadcaster_match_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `broadcaster_match_details` AS select `broadcasted_by`.`match_number` AS `match_number`,`broadcasted_by`.`broadcaster_code` AS `broadcaster_code` from `broadcasted_by` where (`broadcasted_by`.`broadcaster_code` = 78) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `complete_match_details`
--

/*!50001 DROP VIEW IF EXISTS `complete_match_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `complete_match_details` AS select `match_schedule`.`m_number` AS `m_number`,`match_schedule`.`m_type` AS `m_type`,`match_schedule`.`stadium_id` AS `stadium_id`,`broadcaster`.`broadcaster_code` AS `broadcaster_code`,`broadcaster`.`b_name` AS `b_name`,`broadcaster`.`b_type` AS `b_type` from ((`broadcasted_by` join `match_schedule` on((`broadcasted_by`.`match_number` = `match_schedule`.`m_number`))) join `broadcaster` on((`broadcasted_by`.`broadcaster_code` = `broadcaster`.`broadcaster_code`))) order by `match_schedule`.`m_number` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `max_busy_stadium`
--

/*!50001 DROP VIEW IF EXISTS `max_busy_stadium`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `max_busy_stadium` AS select `stadium`.`stadium_id` AS `stadium_id`,`stadium`.`s_name` AS `s_name`,`stadium`.`location` AS `location`,`stadium`.`capacity` AS `capacity`,`stadium`.`no_of_gates` AS `no_of_gates`,`stadium`.`no_of_matches` AS `no_of_matches` from `stadium` where (`stadium`.`no_of_matches` = (select max(`stadium`.`no_of_matches`) from `stadium`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `referee_2212`
--

/*!50001 DROP VIEW IF EXISTS `referee_2212`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `referee_2212` AS select `officiate`.`ref_code` AS `ref_code`,`officiate`.`m_number` AS `m_number` from `officiate` where (`officiate`.`ref_code` = 2212) */;
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

-- Dump completed on 2022-11-18 22:28:26
