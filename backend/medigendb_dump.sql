-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: mysql-167a87d3-medigen.f.aivencloud.com    Database: medigenDB
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '42d72631-b6bc-11ef-9cf8-0afd9654d831:1-96';

--
-- Table structure for table `freq_ques`
--

DROP TABLE IF EXISTS `freq_ques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freq_ques` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salt_id` int DEFAULT NULL,
  `question` text,
  `answer` text,
  PRIMARY KEY (`id`),
  KEY `salt_id` (`salt_id`),
  CONSTRAINT `freq_ques_ibfk_1` FOREIGN KEY (`salt_id`) REFERENCES `salt_details` (`salt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freq_ques`
--

LOCK TABLES `freq_ques` WRITE;
/*!40000 ALTER TABLE `freq_ques` DISABLE KEYS */;
INSERT INTO `freq_ques` VALUES (1,1,'What if I vomit after taking A Mol 650mg Tablet?','If you vomit in less than 30 minutes after having a dose of A Mol 650mg Tablet tablets or syrup, retake the same dose again. If you vomit after 30 minutes of a dose, you do not need to take another one until the next standard dose.'),(2,1,'When will I feel better after taking the A Mol 650mg Tablet?','Usually, you will start feeling better after about half an hour of taking a A Mol 650mg Tablet.'),(3,1,'How often can I take the A Mol 650mg Tablet?','You should only take four doses of A Mol 650mg Tablet in 24 hours. There should be a gap of at least 4 hours between two doses. Do not take A Mol 650mg Tablet for more than 3 days without consulting a doctor first.'),(4,1,'Is A Mol 650mg Tablet an antibiotic?','No, A Mol 650mg Tablet is not an antibiotic. It works as a painkiller and fever-reducing medicine.'),(5,1,'Can I take A Mol 650mg Tablet and ibuprofen together?','Ibuprofen and A Mol 650mg Tablet are safe medicines, but both should not be used together. Consult your doctor if you are not sure.'),(6,1,'How long does a A Mol 650mg Tablet take to work?','A Mol 650mg Tablet takes around 30-45 min to start working and show its effects. It is advised to take this medicine for the duration suggested by the doctor. Consult your doctor if you experience any bothersome side effects.'),(7,1,'What are the serious side effects of taking an excess of the A Mol 650mg Tablet?','Overdose of A Mol 650mg Tablet may cause severe life-threatening liver injury. Taking more than the prescribed dose may also cause kidney injury, decreased platelet count, and even coma. Early symptoms of an overdose include nausea, vomiting, and general tiredness. Immediately consult a doctor or reach an emergency in case of a suspected overdose.');
/*!40000 ALTER TABLE `freq_ques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_content`
--

DROP TABLE IF EXISTS `product_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salt_id` int DEFAULT NULL,
  `p_name` varchar(50) DEFAULT NULL,
  `p_company` varchar(50) DEFAULT NULL,
  `generic_name` varchar(50) DEFAULT NULL,
  `avg_price` decimal(5,2) DEFAULT NULL,
  `p_price` decimal(5,2) DEFAULT NULL,
  `chemical_formation` varchar(50) DEFAULT NULL,
  `medicine_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salt_id` (`salt_id`),
  CONSTRAINT `product_content_ibfk_1` FOREIGN KEY (`salt_id`) REFERENCES `salt_details` (`salt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_content`
--

LOCK TABLES `product_content` WRITE;
/*!40000 ALTER TABLE `product_content` DISABLE KEYS */;
INSERT INTO `product_content` VALUES (1,1,'Paracetamol 500mg','XYZ Pharma','Acetaminophen',100.00,85.00,'C8H9NO2','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwfBfum_fPFt2AfX5L9XbzYs9mmFFBrk5odg&s'),(2,1,'Paracetamol 325mg','XYZ Pharma','Acetaminophen',75.00,65.00,'C8H9NO2','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwfBfum_fPFt2AfX5L9XbzYs9mmFFBrk5odg&s'),(3,1,'Paracetamol Extra Strength 650mg','XYZ Pharma','Acetaminophen',150.00,130.00,'C8H9NO2','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwfBfum_fPFt2AfX5L9XbzYs9mmFFBrk5odg&s'),(4,1,'Paracetamol Children 120mg/5ml','XYZ Pharma','Acetaminophen',50.00,45.00,'C8H9NO2','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwfBfum_fPFt2AfX5L9XbzYs9mmFFBrk5odg&s');
/*!40000 ALTER TABLE `product_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating_review`
--

DROP TABLE IF EXISTS `rating_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salt_id` int DEFAULT NULL,
  `rating_value` decimal(5,2) DEFAULT NULL,
  `reviews` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salt_id` (`salt_id`),
  CONSTRAINT `rating_review_ibfk_1` FOREIGN KEY (`salt_id`) REFERENCES `salt_details` (`salt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating_review`
--

LOCK TABLES `rating_review` WRITE;
/*!40000 ALTER TABLE `rating_review` DISABLE KEYS */;
INSERT INTO `rating_review` VALUES (1,1,4.50,'[\"Effective for treating liver issues. Great product!\", \"Helps in dissolving gallstones and improving liver function.\"]'),(2,1,3.80,'[\"Good for general liver health but causes mild side effects like nausea.\", \"Slight improvement in digestion.\"]'),(3,1,5.00,'[\"Excellent results for primary biliary cholangitis treatment. Highly recommend.\", \"No side effects and very effective.\"]'),(4,1,4.20,'[\"Useful for gallstone dissolution, but I experienced mild abdominal discomfort.\", \"Good results with consistent use.\"]');
/*!40000 ALTER TABLE `rating_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salt_details`
--

DROP TABLE IF EXISTS `salt_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salt_details` (
  `salt_id` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `uses_list` json DEFAULT NULL,
  `works` json DEFAULT NULL,
  `common_side_effect` json DEFAULT NULL,
  `salt_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`salt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salt_details`
--

LOCK TABLES `salt_details` WRITE;
/*!40000 ALTER TABLE `salt_details` DISABLE KEYS */;
INSERT INTO `salt_details` VALUES (1,'UDILIV 300MG TABLET 15\'S (UDCA) is a bile acid derived from bear bile and is also produced synthetically. It has been used for several decades as a therapeutic agent to manage various liver disorders. UDCA is primarily known for its hepatoprotective properties and is used in the treatment of gallstones, primary biliary cholangitis (PBC), and other cholestatic liver conditions. This bile acid works by reducing cholesterol absorption, improving bile flow, and exerting anti-inflammatory effects, thereby promoting liver health.','[\"Helps in dissolving gallstones.\", \"Is used in the treatment of primary biliary cholangitis (PBC).\", \"Aids in managing other cholestatic liver disorders.\", \"Can be used to prevent gallstone formation.\", \"Assists in improving liver function.\"]','[\"Dosage for children: The dosage depends on their body weight and the specific liver disorder being treated. It is typically prescribed by a pediatrician or gastroenterologist.\", \"Dosage for adults: The recommended dosage varies depending on the indication. For gallstone dissolution, the usual dose is 8-10 mg/kg body weight per day, divided into two to three doses. In the treatment of primary biliary cholangitis (PBC), the typical dose ranges from 13-15 mg/kg body weight per day, also divided into multiple doses. However, dosages may differ based on individual patient factors, and it is essential to follow the specific instructions provided by a healthcare professional.\"]','[\"Diarrhea\", \"Abdominal discomfort\", \"Nausea\", \"Vomiting\", \"Hair loss (rare)\"]','UDLIV 300MG TABLET 15\'S');
/*!40000 ALTER TABLE `salt_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salt_rating_review`
--

DROP TABLE IF EXISTS `salt_rating_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salt_rating_review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salt_id` int DEFAULT NULL,
  `salt_rating_value` decimal(5,2) DEFAULT NULL,
  `salt_reviews` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salt_id` (`salt_id`),
  CONSTRAINT `salt_rating_review_ibfk_1` FOREIGN KEY (`salt_id`) REFERENCES `salt_details` (`salt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salt_rating_review`
--

LOCK TABLES `salt_rating_review` WRITE;
/*!40000 ALTER TABLE `salt_rating_review` DISABLE KEYS */;
INSERT INTO `salt_rating_review` VALUES (1,1,4.50,'[\"This product worked well for me, I experienced relief within a few hours.\", \"Good results, but it took a little longer to show effects than expected.\"]'),(2,1,3.80,'[\"The product is decent, but the side effects were a bit troublesome.\", \"It helped with my condition, but I had mild stomach discomfort.\"]'),(3,1,4.00,'[\"Good product, worked as expected, but I experienced slight dizziness.\", \"I would recommend it for mild pain relief, but it may cause some minor side effects.\"]');
/*!40000 ALTER TABLE `salt_rating_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password_hashed` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'admin@medigne.com','scrypt:32768:8:1$ulsWlBmHKATl9mdo$6290289e16a0e2dad2327cc36e4d375a5008a802c0fa06307e4033722e1739ea8a15b206868f07f7eddea2b72c801bd73768a886dcf7c22e8d6f8520c9f8054d');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 13:17:02
