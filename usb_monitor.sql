-- MySQL dump 10.13  Distrib 9.4.0, for Win64 (x86_64)
--
-- Host: localhost    Database: usb_monitor
-- ------------------------------------------------------
-- Server version	9.4.0

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

--
-- Table structure for table `access_policy`
--

DROP TABLE IF EXISTS `access_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_code` varchar(30) DEFAULT NULL,
  `policy` enum('ALLOW','BLOCK','ASK_ADMIN') DEFAULT 'ASK_ADMIN',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_code` (`device_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_policy`
--

LOCK TABLES `access_policy` WRITE;
/*!40000 ALTER TABLE `access_policy` DISABLE KEYS */;
INSERT INTO `access_policy` VALUES (7,'DEV001','ALLOW','2026-07-07 08:36:36','2026-07-07 08:36:36');
/*!40000 ALTER TABLE `access_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_history`
--

DROP TABLE IF EXISTS `approval_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_id` int DEFAULT NULL,
  `device_code` varchar(30) DEFAULT NULL,
  `admin_name` varchar(100) DEFAULT NULL,
  `action` enum('ALLOW','BLOCK','ALLOW_10_MIN','ALLOW_30_MIN','ALLOW_1_HOUR') DEFAULT NULL,
  `action_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_history`
--

LOCK TABLES `approval_history` WRITE;
/*!40000 ALTER TABLE `approval_history` DISABLE KEYS */;
INSERT INTO `approval_history` VALUES (5,5,'DEV001','Admin','ALLOW','2026-07-07 08:36:36','Always Trust');
/*!40000 ALTER TABLE `approval_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blocked_devices`
--

DROP TABLE IF EXISTS `blocked_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocked_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_code` varchar(30) DEFAULT NULL,
  `serial_number` varchar(200) DEFAULT NULL,
  `blocked_by` varchar(100) DEFAULT NULL,
  `blocked_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `reason` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocked_devices`
--

LOCK TABLES `blocked_devices` WRITE;
/*!40000 ALTER TABLE `blocked_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `blocked_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_registry`
--

DROP TABLE IF EXISTS `device_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_registry` (
  `device_code` varchar(20) NOT NULL,
  `device_id` text,
  PRIMARY KEY (`device_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_registry`
--

LOCK TABLES `device_registry` WRITE;
/*!40000 ALTER TABLE `device_registry` DISABLE KEYS */;
INSERT INTO `device_registry` VALUES ('DEV001','USBSTOR\\DISK&VEN_SANDISK&PROD_ULTRA_USB_3.0&REV_1.00\\0401B4A8252090557789A3BFE7957918C0082D075C918C1C7DF61725B1B0955');
/*!40000 ALTER TABLE `device_registry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_transfer_hash`
--

DROP TABLE IF EXISTS `file_transfer_hash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_transfer_hash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_time` datetime DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `device_code` varchar(50) DEFAULT NULL,
  `direction` varchar(20) DEFAULT NULL,
  `file_name` text,
  `file_size_mb` float DEFAULT NULL,
  `sha256` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_transfer_hash`
--

LOCK TABLES `file_transfer_hash` WRITE;
/*!40000 ALTER TABLE `file_transfer_hash` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_transfer_hash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_logs`
--

DROP TABLE IF EXISTS `transfer_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_time` datetime DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `device_code` varchar(50) DEFAULT NULL,
  `direction` varchar(20) DEFAULT NULL,
  `file_name` text,
  `file_size_mb` float DEFAULT NULL,
  `sha256` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_logs`
--

LOCK TABLES `transfer_logs` WRITE;
/*!40000 ALTER TABLE `transfer_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trusted_devices`
--

DROP TABLE IF EXISTS `trusted_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trusted_devices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_code` varchar(30) DEFAULT NULL,
  `serial_number` varchar(200) DEFAULT NULL,
  `device_name` varchar(150) DEFAULT NULL,
  `approved_by` varchar(100) DEFAULT NULL,
  `approved_on` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted_devices`
--

LOCK TABLES `trusted_devices` WRITE;
/*!40000 ALTER TABLE `trusted_devices` DISABLE KEYS */;
INSERT INTO `trusted_devices` VALUES (4,'DEV001','USBSTOR\\DISK&VEN_SANDISK&PROD_ULTRA_USB_3.0&REV_1.00\\0401B4A8252090557789A3BFE7957918C0082D075C918C1C7DF61725B1B0955','SanDisk Ultra USB 3.0 USB Device','Admin','2026-07-07 08:36:36');
/*!40000 ALTER TABLE `trusted_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usb_access_requests`
--

DROP TABLE IF EXISTS `usb_access_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usb_access_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_code` varchar(30) DEFAULT NULL,
  `serial_number` varchar(200) DEFAULT NULL,
  `device_name` varchar(150) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `drive_letter` varchar(10) DEFAULT NULL,
  `filesystem` varchar(20) DEFAULT NULL,
  `request_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('PENDING','APPROVED','BLOCKED','EXPIRED') DEFAULT 'PENDING',
  `approved_by` varchar(100) DEFAULT NULL,
  `approval_time` datetime DEFAULT NULL,
  `approved_until` datetime DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usb_access_requests`
--

LOCK TABLES `usb_access_requests` WRITE;
/*!40000 ALTER TABLE `usb_access_requests` DISABLE KEYS */;
INSERT INTO `usb_access_requests` VALUES (5,'DEV001','USBSTOR\\DISK&VEN_SANDISK&PROD_ULTRA_USB_3.0&REV_1.00\\0401B4A8252090557789A3BFE7957918C0082D075C918C1C7DF61725B1B0955','SanDisk Ultra USB 3.0 USB Device','SHREYANSH','LAPTOP-6G9V41RT','E:\\','FAT32','2026-07-07 08:36:29','APPROVED','Admin','2026-07-07 08:36:36',NULL,NULL);
/*!40000 ALTER TABLE `usb_access_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usb_logs`
--

DROP TABLE IF EXISTS `usb_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usb_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_time` datetime DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `system_name` varchar(100) DEFAULT NULL,
  `drive_letter` varchar(20) DEFAULT NULL,
  `usb_name` varchar(255) DEFAULT NULL,
  `device_id` text,
  `event_type` varchar(30) DEFAULT NULL,
  `device_code` varchar(20) DEFAULT NULL,
  `mac_address` varchar(50) DEFAULT NULL,
  `duration_seconds` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usb_logs`
--

LOCK TABLES `usb_logs` WRITE;
/*!40000 ALTER TABLE `usb_logs` DISABLE KEYS */;
INSERT INTO `usb_logs` VALUES (28,'2026-07-07 08:37:08','SHREYANSH','LAPTOP-6G9V41RT','E:\\','SanDisk Ultra USB 3.0 USB Device','USBSTOR\\DISK&VEN_SANDISK&PROD_ULTRA_USB_3.0&REV_1.00\\0401B4A8252090557789A3BFE7957918C0082D075C918C1C7DF61725B1B0955','CONNECTED','DEV001','00:50:56:C0:00:08',NULL),(29,'2026-07-07 08:37:38','SHREYANSH','LAPTOP-6G9V41RT','E:\\','SanDisk Ultra USB 3.0 USB Device','USBSTOR\\DISK&VEN_SANDISK&PROD_ULTRA_USB_3.0&REV_1.00\\0401B4A8252090557789A3BFE7957918C0082D075C918C1C7DF61725B1B0955','REMOVED','DEV001','00:50:56:C0:00:08',30);
/*!40000 ALTER TABLE `usb_logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-07  9:05:00
