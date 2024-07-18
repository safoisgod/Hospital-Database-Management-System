DROP DATABASE IF EXISTS `fict_md_water_services`;
CREATE DATABASE IF NOT EXISTS `fict_md_water_services` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fict_md_water_services`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: md_water_services
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `data_dictionary`
--

DROP TABLE IF EXISTS `data_dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_dictionary` (
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `description` text,
  `datatype` varchar(50) DEFAULT NULL,
  `related_to` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_dictionary`
--

LOCK TABLES `data_dictionary` WRITE;
/*!40000 ALTER TABLE `data_dictionary` DISABLE KEYS */;
INSERT INTO `data_dictionary` VALUES ('employee','assigned_employee_id','Unique ID assigned to each employee','INT','visits'),('employee','employee_name','Name of the employee','VARCHAR(255)',''),('employee','phone_number','Contact number of the employee','VARCHAR(15)',''),('employee','email','Email address of the employee','VARCHAR(255)',''),('employee','address','Residential address of the employee','VARCHAR(255)',''),('employee','town_name','Name of the town where the employee resides','VARCHAR(255)',''),('employee','province_name','Name of the province where the employee resides','VARCHAR(255)',''),('employee','position','Position or job title of the employee','VARCHAR(255)',''),('visits','record_id','Unique ID assigned to each visit','int','water_quality, water_source'),('visits','location_id','ID of the location visited','varchar(255)','location'),('visits','source_id','ID of the water source visited','varchar(510)','well_pollution'),('visits','time_of_record','Date and time of the visit','datetime',''),('visits','visit_count','Number of visits made to this location','int',''),('visits','time_in_queue','Time spent by people waiting for water in a queue at the location','int',''),('visits','assigned_employee_id','ID of the employee who visited the location','int','employee'),('water_quality','record_id','Unique ID assigned to each record','int',''),('water_quality','subjective_quality_score','Score representing the subjective quality of the water source','int',''),('water_quality','visit_count','Number of visits made for data collection','int',''),('water_source','source_id','Unique ID assigned to each water source','VARCHAR(510)','visits'),('water_source','type_of_water_source','Type or category of the water source. Can be : tap_in_home, tap_in_home_broken, well, shared_tap, river','VARCHAR(255)',''),('water_source','number_of_people_served','Number of people served by this water source','INT',''),('well_pollution','source_id','ID of the water source being tested for pollution','varchar(258)','visits'),('well_pollution','date','Date of the pollution test','datetime',''),('well_pollution','description','Description of the pollution test','varchar(255)',''),('well_pollution','pollutant_ppm','Result of the pollution test in parts per million','float',''),('well_pollution','biological','Biological contamination level','float',''),('well_pollution','results','Result of the pollution test. Can be \'dirty\', \'biologically contaminated\', or \'clean\'','varchar(255)',''),('location','location_id','Unique ID assigned to each location','varchar(255)','visits'),('location','address','Address of the location','varchar(255)',''),('location','province_name','Name of the province where the location is situated','varchar(255)',''),('location','town_name','Name of the town where the location is situated','varchar(255)',''),('location','location_type','Type or category of the location','varchar(255)',''),('global_water_access','name','The country or area name','varchar(255)',''),('global_water_access','region','Geographical region','varchar(255)',''),('global_water_access','year','Year of the data record','int',''),('global_water_access','pop_n','The national population size estimate in thousands','float',''),('global_water_access','pop_u','The urban population share estimate in percentage points (%)','float',''),('global_water_access','wat_bas_n','The estimated national share of people with at least basic service (%)','float',''),('global_water_access','wat_lim_n','The estimated national share of people with limited service (%)','float',''),('global_water_access','wat_unimp_n','The estimated national share of people with unimproved service (%)','float',''),('global_water_access','wat_sur_n','The estimated national share of people with surface service (%)','float',''),('global_water_access','wat_bas_r','The estimated rural share of people with at least basic service (%)','float',''),('global_water_access','wat_lim_r','The estimated rural share of people with limited service (%)','float',''),('global_water_access','wat_unimp_r','The estimated rural share of people with unimproved service (%)','float',''),('global_water_access','wat_sur_r','The estimated rural share of people with surface service (%)','float',''),('global_water_access','wat_bas_u','The estimated urban share of people with at least basic service (%)','float',''),('global_water_access','wat_lim_u','The estimated urban share of people with limited service (%)','float',''),('global_water_access','wat_unimp_u','The estimated urban share of people with unimproved service (%)','float',''),('global_water_access','wat_sur_u','The estimated urban share of people with surface service (%)','float','');
/*!40000 ALTER TABLE `data_dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `assigned_employee_id` int NOT NULL,
  `employee_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  `town_name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`assigned_employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (0,'Amara Jengo','+99637993287 ',NULL,'36 Pwani Mchangani Road','Sokoto','Ilanga','Field Surveyor'),(1,'Bello Azibo','+99643864786 ',NULL,'129 Ziwa La Kioo Road','Kilimani','Rural','Field Surveyor'),(2,'Bakari Iniko','+99222599041 ',NULL,'18 Mlima Tazama Avenue','Hawassa','Rural','Field Surveyor'),(3,'Malachi Mavuso','+99945849900 ',NULL,'100 Mogadishu Road','Akatsi','Lusaka','Field Surveyor'),(4,'Cheche Buhle','+99381679640 ',NULL,'1 Savanna Street','Akatsi','Rural','Field Surveyor'),(5,'Zuriel Matembo','+99034075111 ',NULL,'26 Bahari Ya Faraja Road','Kilimani','Rural','Field Surveyor'),(6,'Deka Osumare','+99379364631 ',NULL,'104 Kenyatta Street','Akatsi','Rural','Field Surveyor'),(7,'Lalitha Kaburi','+99681623240 ',NULL,'145 Sungura Amanpour Road','Kilimani','Rural','Field Surveyor'),(8,'Enitan Zuri','+99248509202 ',NULL,'117 Kampala Road','Hawassa','Zanzibar','Field Surveyor'),(10,'Farai Nia','+99570082739 ',NULL,'33 Angélique Kidjo Avenue','Amanzi','Dahabu','Field Surveyor'),(12,'Gamba Shani','+99438283153 ',NULL,'38 Mlima Tazama Avenue','Hawassa','Rural','Field Surveyor'),(14,'Harith Nyota','+99917230124 ',NULL,'42 Malabo Drive','Kilimani','Rural','Field Surveyor'),(16,'Isoke Amani','+99313603182 ',NULL,'55 Fennec Way','Sokoto','Rural','Field Surveyor'),(18,'Jengo Tumaini','+99820596465 ',NULL,'17 Port Harcourt Boulevard','Akatsi','Kintampo','Field Surveyor'),(20,'Kunto Asha','+99176320477 ',NULL,'30 Nyoka Achebe Street','Amanzi','Dahabu','Field Surveyor'),(22,'Lesedi Kofi','+99611183730 ',NULL,'52 Moroni Avenue','Sokoto','Rural','Field Surveyor'),(24,'Makena Thabo','+99690308755 ',NULL,'81 Rhodes Street','Hawassa','Rural','Field Surveyor'),(26,'Nia Furaha','+99522694997 ',NULL,'51 Addis Ababa Road','Akatsi','Harare','Field Surveyor'),(28,'Ona Sefu','+99797494944 ',NULL,'67 Wimbi Dira Avenue','Akatsi','Harare','Field Surveyor'),(30,'Pili Zola','+99822478933 ',NULL,'46 Stone Town Street','Hawassa','Zanzibar','Field Surveyor'),(32,'Quibilah Akua','+99533195846 ',NULL,'77 Kinshasa Boulevard','Sokoto','Rural','Field Surveyor'),(34,'Rudo Imani','+99046972648 ',NULL,'15 Lake Malawi Avenue','Kilimani','Ilanga','Field Surveyor'),(36,'Sanaa Tendaji','+99477692836 ',NULL,'88 Elephantine Boulevard','Amanzi','Dahabu','Field Surveyor'),(38,'Thandiwe Kito','+99895654233 ',NULL,'106 Dakar Road','Hawassa','Zanzibar','Field Surveyor'),(40,'Usafi Ayo','+99613194771 ',NULL,'76 Kenyatta Street','Sokoto','Rural','Field Surveyor'),(42,'Vuyisile Kwame','+99489752164 ',NULL,'1 Zambezi Way','Kilimani','Rural','Field Surveyor'),(44,'Wambui Jabali','+99269319001 ',NULL,'31 Mandela Road','Hawassa','Rural','Field Surveyor'),(46,'Xola Uzuri','+99239172440 ',NULL,'50 Enkare Narok Avenue','Amanzi','Dahabu','Field Surveyor'),(48,'Yewande Ebele','+99239164858 ',NULL,'119 Moroni Avenue','Hawassa','Rural','Field Surveyor'),(49,'Nadia Zalika','+99578401238 ',NULL,'26 Bahari Ya Faraja Road','Kilimani','Rural','Project Manager'),(50,'Ayo Deka','+99345162378 ',NULL,'18 Mlima Tazama Avenue','Hawassa','Rural','UI/UX Designer'),(52,'Bahira Jamila','+99239271483 ',NULL,'30 Nyoka Achebe Street','Amanzi','Dahabu','Front-end Developer'),(53,'Chidi Kunto','+99738251476 ',NULL,'146 Okapi Road','Hawassa','Yaounde','Data Analyst'),(54,'Dalila Lesedi','+99471523698 ',NULL,'18 Casablanca Road','Sokoto','Rural','Data Analyst'),(56,'Eshe Makena','+99381254763 ',NULL,'45 Umqombothi Avenue','Hawassa','Serowe','Human Resources Specialist'),(58,'Faridah Khalida','+99142537684 ',NULL,'176 Port Said Street','Kilimani','Harare','Pioneer'),(62,'Gavivi Ona','+99924513876 ',NULL,'51 Addis Ababa Road','Akatsi','Harare','Financial Analyst'),(64,'Hasani Pili','+99568247135 ',NULL,'33 Afro Beat Road','Hawassa','Serowe','Deputy Project Manager'),(68,'Iniko Quibilah','+99735681472 ',NULL,'93 Afro Beat Road','Hawassa','Serowe','Financial Manager'),(71,'Jengo Rudo','+99317854629 ',NULL,'33 Angélique Kidjo Avenue','Amanzi','Dahabu','Civil Engineer'),(73,'Kofi Sanaa','+99874512369 ',NULL,'42 Malabo Drive','Kilimani','Rural','Creative Designer'),(75,'Lulu Thandiwe','+99127436598 ',NULL,'117 Kampala Road','Hawassa','Zanzibar','Team Leader'),(79,'Makena Usafi','+99583124796 ',NULL,'55 Fennec Way','Sokoto','Rural','Quality Assurance Analyst'),(81,'Nia Vuyisile','+99273841596 ',NULL,'52 Moroni Avenue','Sokoto','Rural','Civil Engineer'),(83,'Ona Wambui','+99968217435 ',NULL,'81 Rhodes Street','Hawassa','Rural','Public Relations Specialist'),(87,'Pili Xola','+99682314579 ',NULL,'31 Samora Machel Road','Kilimani','Harare','Civil Engineer'),(89,'Quibilah Yewande','+99721534698 ',NULL,'110 Nyerere Road','Kilimani','Rural','Supervisor'),(93,'Rudo Zalika','+99578123469 ',NULL,'7 Dakar Drive','Akatsi','Lusaka','Field Engineer'),(94,'Sanaa Ayo','+99375418692 ',NULL,'172 Fisi Nkrumah Street','Akatsi','Rural','Data Scientist'),(96,'Thabo Akida','+99178325649 ',NULL,'24 Okonjo-Iweala Street','Akatsi','Lusaka','Engineering Department Head'),(98,'Usafi Bahir','+99234156789 ',NULL,'1 Savanna Street','Akatsi','Rural','Analytical Chemist'),(102,'Vuyisile Ghadir','+99712584936 ',NULL,'104 Kenyatta Street','Akatsi','Rural','Micro Biologist'),(104,'Wambui Hadiya','+99634157892 ',NULL,'145 Sungura Amanpour Road','Kilimani','Rural','Compliance Officer'),(105,'Xola Inaya','+99231569847 ',NULL,'100 Mogadishu Road','Akatsi','Lusaka','Field Engineer'),(108,'Yewande Jengo','+99123456978 ',NULL,'25 Selassie Drive','Amanzi','Rural','Construction Manager'),(110,'Zuri Kofi','+99412356789 ',NULL,'36 Pwani Mchangani Road','Sokoto','Ilanga','Graphic Designer');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_water_access`
--

DROP TABLE IF EXISTS `global_water_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_water_access` (
  `name` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `pop_n` float DEFAULT NULL,
  `pop_u` float DEFAULT NULL,
  `wat_bas_n` float DEFAULT NULL,
  `wat_lim_n` float DEFAULT NULL,
  `wat_unimp_n` float DEFAULT NULL,
  `wat_sur_n` float DEFAULT NULL,
  `wat_bas_r` float DEFAULT NULL,
  `wat_lim_r` float DEFAULT NULL,
  `wat_unimp_r` float DEFAULT NULL,
  `wat_sur_r` float DEFAULT NULL,
  `wat_bas_u` float DEFAULT NULL,
  `wat_lim_u` float DEFAULT NULL,
  `wat_unimp_u` float DEFAULT NULL,
  `wat_sur_u` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
