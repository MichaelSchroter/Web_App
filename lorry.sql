-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lorry_dumping
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~buster

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Deliveries_In`
--

DROP TABLE IF EXISTS `Deliveries_In`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Deliveries_In` (
  `TID` varchar(100) NOT NULL,
  `Lorry_Plate` varchar(100) NOT NULL,
  `In_Weight` int(11) NOT NULL,
  `In_Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PID` varchar(100) NOT NULL,
  PRIMARY KEY (`TID`,`Lorry_Plate`),
  KEY `Deliveries_In_FK` (`PID`),
  CONSTRAINT `Deliveries_In_FK` FOREIGN KEY (`PID`) REFERENCES `Prj_Details` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Details of soil deliveries to site';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deliveries_In`
--

LOCK TABLES `Deliveries_In` WRITE;
/*!40000 ALTER TABLE `Deliveries_In` DISABLE KEYS */;
/*!40000 ALTER TABLE `Deliveries_In` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Deliveries_Out`
--

DROP TABLE IF EXISTS `Deliveries_Out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Deliveries_Out` (
  `TID` varchar(100) NOT NULL,
  `Lorry_Plate` varchar(100) NOT NULL,
  `Out_Weight` varchar(100) NOT NULL,
  `Out_Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PID` varchar(100) NOT NULL,
  PRIMARY KEY (`TID`,`Lorry_Plate`),
  KEY `Deliveries_Out_FK` (`PID`),
  CONSTRAINT `Deliveries_Out_FK` FOREIGN KEY (`PID`) REFERENCES `Prj_Details` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weight of lorries leaving site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Deliveries_Out`
--

LOCK TABLES `Deliveries_Out` WRITE;
/*!40000 ALTER TABLE `Deliveries_Out` DISABLE KEYS */;
/*!40000 ALTER TABLE `Deliveries_Out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prj_Contact_Person`
--

DROP TABLE IF EXISTS `Prj_Contact_Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prj_Contact_Person` (
  `PID` varchar(100) NOT NULL,
  `C_Name` varchar(100) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`PID`,`C_Name`),
  KEY `Prj_Contact_Person_FK` (`UID`),
  CONSTRAINT `Prj_Contact_Person_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Name of the contact person for a specific project';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prj_Contact_Person`
--

LOCK TABLES `Prj_Contact_Person` WRITE;
/*!40000 ALTER TABLE `Prj_Contact_Person` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prj_Contact_Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prj_Details`
--

DROP TABLE IF EXISTS `Prj_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prj_Details` (
  `PID` varchar(100) NOT NULL,
  `Prj_Name` varchar(100) DEFAULT NULL,
  `Prj_Location` varchar(100) NOT NULL,
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`PID`),
  KEY `Prj_Details_FK` (`UID`),
  CONSTRAINT `Prj_Details_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Details of the project';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prj_Details`
--

LOCK TABLES `Prj_Details` WRITE;
/*!40000 ALTER TABLE `Prj_Details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prj_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prj_Mon_GE`
--

DROP TABLE IF EXISTS `Prj_Mon_GE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prj_Mon_GE` (
  `PID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Est_GE_PM` int(11) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`PID`,`Est_GE_PM`),
  KEY `Prj_Mon_GE_FK` (`UID`),
  CONSTRAINT `Prj_Mon_GE_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Monthly Estimated Good Earth Arrival Volume in Cubic Meters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prj_Mon_GE`
--

LOCK TABLES `Prj_Mon_GE` WRITE;
/*!40000 ALTER TABLE `Prj_Mon_GE` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prj_Mon_GE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prj_Mon_SC`
--

DROP TABLE IF EXISTS `Prj_Mon_SC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prj_Mon_SC` (
  `PID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Est_Mon_SC` int(11) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`PID`,`Est_Mon_SC`),
  KEY `Prj_SCPM_FK` (`UID`),
  CONSTRAINT `Prj_SCPM_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Estimated Soft Clay volume per month on cubic meters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prj_Mon_SC`
--

LOCK TABLES `Prj_Mon_SC` WRITE;
/*!40000 ALTER TABLE `Prj_Mon_SC` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prj_Mon_SC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prj_Tel`
--

DROP TABLE IF EXISTS `Prj_Tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prj_Tel` (
  `PID` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Telephone` int(11) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`PID`,`Telephone`),
  KEY `Prj_Tel_FK` (`UID`),
  CONSTRAINT `Prj_Tel_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Telephone number of contact person of project.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prj_Tel`
--

LOCK TABLES `Prj_Tel` WRITE;
/*!40000 ALTER TABLE `Prj_Tel` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prj_Tel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prj_Tot_GE`
--

DROP TABLE IF EXISTS `Prj_Tot_GE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prj_Tot_GE` (
  `PID` varchar(100) NOT NULL,
  `Est_Tot_GE` int(11) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`PID`,`Est_Tot_GE`),
  KEY `Prj_Tot_GE_FK` (`UID`),
  CONSTRAINT `Prj_Tot_GE_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Estimated Good Earth Total volume';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prj_Tot_GE`
--

LOCK TABLES `Prj_Tot_GE` WRITE;
/*!40000 ALTER TABLE `Prj_Tot_GE` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prj_Tot_GE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prj_Tot_SC`
--

DROP TABLE IF EXISTS `Prj_Tot_SC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prj_Tot_SC` (
  `PID` varchar(100) NOT NULL,
  `Est_Tot_SC` int(11) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`PID`,`Est_Tot_SC`),
  KEY `Prj_Tot_SC_FK` (`UID`),
  CONSTRAINT `Prj_Tot_SC_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Estimated Total Soft Clay Volume in Cubic Meters';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prj_Tot_SC`
--

LOCK TABLES `Prj_Tot_SC` WRITE;
/*!40000 ALTER TABLE `Prj_Tot_SC` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prj_Tot_SC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UID_PW`
--

DROP TABLE IF EXISTS `UID_PW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UID_PW` (
  `UID` int(11) NOT NULL,
  `PW` varchar(100) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`UID`,`PW`),
  CONSTRAINT `UID_PW_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Password storage of Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UID_PW`
--

LOCK TABLES `UID_PW` WRITE;
/*!40000 ALTER TABLE `UID_PW` DISABLE KEYS */;
/*!40000 ALTER TABLE `UID_PW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `U_ID`
--

DROP TABLE IF EXISTS `U_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `U_ID` (
  `UID` int(11) NOT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Connecting table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `U_ID`
--

LOCK TABLES `U_ID` WRITE;
/*!40000 ALTER TABLE `U_ID` DISABLE KEYS */;
/*!40000 ALTER TABLE `U_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Address`
--

DROP TABLE IF EXISTS `User_Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Address` (
  `UID` int(11) NOT NULL,
  `U_Addr` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`UID`,`U_Addr`),
  CONSTRAINT `User_Address_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Address of the company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Address`
--

LOCK TABLES `User_Address` WRITE;
/*!40000 ALTER TABLE `User_Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Email`
--

DROP TABLE IF EXISTS `User_Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Email` (
  `UID` int(11) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`UID`,`Email`),
  CONSTRAINT `User_Email_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email address of the company for correspondence';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Email`
--

LOCK TABLES `User_Email` WRITE;
/*!40000 ALTER TABLE `User_Email` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_FAX`
--

DROP TABLE IF EXISTS `User_FAX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_FAX` (
  `UID` int(11) NOT NULL,
  `FAX_Num` int(11) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`UID`,`FAX_Num`),
  CONSTRAINT `User_FAX_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Fax number of the company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_FAX`
--

LOCK TABLES `User_FAX` WRITE;
/*!40000 ALTER TABLE `User_FAX` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_FAX` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Login_Name`
--

DROP TABLE IF EXISTS `User_Login_Name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Login_Name` (
  `UID` int(11) NOT NULL,
  `U_Name` varchar(100) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`UID`,`U_Name`),
  CONSTRAINT `User_Login_Name_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='User logn name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Login_Name`
--

LOCK TABLES `User_Login_Name` WRITE;
/*!40000 ALTER TABLE `User_Login_Name` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Login_Name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Name`
--

DROP TABLE IF EXISTS `User_Name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Name` (
  `UID` int(11) NOT NULL,
  `U_Name` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `U_Code` varchar(100) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`UID`,`U_Name`),
  CONSTRAINT `User_Name_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table of the user names. They are names of companies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Name`
--

LOCK TABLES `User_Name` WRITE;
/*!40000 ALTER TABLE `User_Name` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_POB`
--

DROP TABLE IF EXISTS `User_POB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_POB` (
  `UID` int(11) NOT NULL,
  `PO_BOX` varchar(100) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`UID`,`PO_BOX`),
  CONSTRAINT `User_POB_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='P.O. Box Address of the User (Company)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_POB`
--

LOCK TABLES `User_POB` WRITE;
/*!40000 ALTER TABLE `User_POB` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_POB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Tel`
--

DROP TABLE IF EXISTS `User_Tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Tel` (
  `UID` int(11) NOT NULL,
  `Tel_Num` int(11) NOT NULL,
  `Time_Stamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`UID`,`Tel_Num`),
  CONSTRAINT `User_Tel_FK` FOREIGN KEY (`UID`) REFERENCES `U_ID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Telephone details of the company';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Tel`
--

LOCK TABLES `User_Tel` WRITE;
/*!40000 ALTER TABLE `User_Tel` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Tel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-13 15:14:47
