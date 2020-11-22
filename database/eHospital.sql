-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: ehospital
-- ------------------------------------------------------
-- Server version	8.0.21

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
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Table structure for table `administer`
--

-- DROP TABLE IF EXISTS `administer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administer` (
  `DrID` varchar(45) NOT NULL,
  `PatientID` varchar(45) NOT NULL,
  `AdminDtTm` date NOT NULL,
  `Is_LabTest_Required` char(1) NOT NULL,
  PRIMARY KEY (`PatientID`,`DrID`),
  KEY `DrID_Admin_FK_idx` (`DrID`) /*!80000 INVISIBLE */,
  CONSTRAINT `DrID_Admin_FK` FOREIGN KEY (`DrID`) REFERENCES `doctor` (`DrID`) ON UPDATE CASCADE,
  CONSTRAINT `PatientID_Admin_FK` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administer`
--

-- LOCK TABLES `administer` WRITE;
/*!40000 ALTER TABLE `administer` DISABLE KEYS */;
INSERT INTO `administer` VALUES ('dr001','ac51036','2018-07-12','Y'),('dr001','ar18032','2020-06-25','Y'),('dr003','ar18032','2011-09-13','Y'),('dr002','aw60188','2007-04-13','N'),('dr004','bw19427','2014-07-19','N'),('dr003','cc18020','2013-01-14','Y'),('dr005','dl79745','2020-07-10','Y'),('dr002','eb77548','2016-02-16','N'),('dr005','jw87624','2019-09-18','Y'),('dr001','kc88145','2019-02-15','Y'),('dr001','sw28991','2019-03-18','Y'),('dr004','wj06469','2019-09-08','Y');
/*!40000 ALTER TABLE `administer` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `admit`
--

-- DROP TABLE IF EXISTS `admit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admit` (
  `RoomNum` int NOT NULL,
  `BuildimgID` varchar(45) NOT NULL,
  `PatientID` varchar(45) NOT NULL,
  PRIMARY KEY (`BuildimgID`,`RoomNum`),
  KEY `PatientID_Admit_FK_idx` (`PatientID`),
  KEY `RoomNum_Admit_FK_idx` (`RoomNum`),
  CONSTRAINT `BuildingID_Admit_FK` FOREIGN KEY (`BuildimgID`) REFERENCES `building` (`BuildingID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PatientID_Admit_FK` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RoomNum_Admit_FK` FOREIGN KEY (`RoomNum`) REFERENCES `room` (`RoomNum`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admit`
--

-- LOCK TABLES `admit` WRITE;
/*!40000 ALTER TABLE `admit` DISABLE KEYS */;
INSERT INTO `admit` VALUES (101,'BaseNoth002','ac51036'),(101,'BaseSouth004','ar18032'),(103,'BaseWest001','ar18032'),(202,'BaseWest001','cc18020'),(203,'BaseWest001','dl79745'),(102,'BaseEast003','jw87624'),(101,'BaseWest001','kc88145'),(301,'BaseEast003','sw28991'),(201,'BaseEast003','wj06469');
/*!40000 ALTER TABLE `admit` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `admitdetails`
--

-- DROP TABLE IF EXISTS `admitdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admitdetails` (
  `PatientID` varchar(45) NOT NULL,
  `AdmitDtTm` date NOT NULL,
  PRIMARY KEY (`PatientID`),
  CONSTRAINT `PatientID_AdmitDetls_FK` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitdetails`
--

-- LOCK TABLES `admitdetails` WRITE;
/*!40000 ALTER TABLE `admitdetails` DISABLE KEYS */;
INSERT INTO `admitdetails` VALUES ('ac51036','2018-07-12'),('ar18032','2020-06-27'),('cc18020','2013-01-14'),('dl79745','2020-07-10'),('jw87624','2019-09-18'),('kc88145','2019-02-15'),('sw28991','2019-03-19'),('wj06469','2019-09-10');
/*!40000 ALTER TABLE `admitdetails` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `building`
--

-- DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `BuildingID` varchar(45) NOT NULL,
  `BuildingName` varchar(45) NOT NULL,
  `NumberOfRooms` int NOT NULL,
  `Location` varchar(45) NOT NULL,
  PRIMARY KEY (`BuildingID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

-- LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('BaseEast003','Baseline East',5,'East'),('BaseNoth002','Baseline North',4,'Noth'),('BaseSouth004','Baseline South',2,'South'),('BaseWest001','Baseline West',6,'West');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

-- DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `DrID` varchar(45) NOT NULL,
  `EmpID` varchar(45) NOT NULL,
  `BuildingID` varchar(45) NOT NULL,
  `Specialization` varchar(45) NOT NULL,
  `Is_Surgeon` char(1) NOT NULL,
  PRIMARY KEY (`DrID`),
  KEY `EmpID_idx` (`EmpID`),
  KEY `BuildingID_Dr_FK_idx` (`BuildingID`),
  CONSTRAINT `BuildingID_Dr_FK` FOREIGN KEY (`BuildingID`) REFERENCES `building` (`BuildingID`) ON UPDATE CASCADE,
  CONSTRAINT `EmpID_Dr_FK` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

-- LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('dr001','ar09541','BaseWest001','Critical care medicine','Y'),('dr002','ld78453','BaseSouth004','Pediatric dermatology','N'),('dr003','dg39989','BaseNoth002','Oncology','Y'),('dr004','ul26005','BaseEast003','Pediatric anesthesiology','N'),('dr005','bk70465','BaseWest001','Rheumatology','N');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `employee`
--

-- DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmpID` varchar(45) NOT NULL,
  `SSN` varchar(45) NOT NULL,
  PRIMARY KEY (`EmpID`),
  KEY `SSN_Employee_FK_idx` (`SSN`),
  CONSTRAINT `SSN_Employee_FK` FOREIGN KEY (`SSN`) REFERENCES `employee_details` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

-- LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('mc95414','135-29-5414'),('tb81007','148-88-1007'),('ld78453','171-27-8453'),('ar09541','369-50-9541'),('dg39989','466-63-9989'),('ul26005','561-02-6005'),('zk73430','742-37-3430'),('hp01706','757-90-1706'),('aj03034','781-80-3034'),('bk70465','927-37-0465');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `employee_details`
--

-- DROP TABLE IF EXISTS `employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_details` (
  `SSN` varchar(45) NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Job_role` varchar(45) DEFAULT NULL,
  `PhNr` decimal(10,0) NOT NULL,
  `Address` longtext NOT NULL,
  `Zipcode` int NOT NULL,
  `City` varchar(45) NOT NULL,
  `Salary` float NOT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_details`
--

-- LOCK TABLES `employee_details` WRITE;
/*!40000 ALTER TABLE `employee_details` DISABLE KEYS */;
INSERT INTO `employee_details` VALUES ('135-29-5414','Marvin','Cooper','1981-11-20','Female','Nurse practitioner',7850926196,'352 SW. Sierra Drive Miami',33155,'Florida',54197),('148-88-1007','Tanya','Bennett','1978-01-14','Female','Registered nurse',7853253680,'941 Lancaster Dr. Sacramento',95828,'California',93298),('171-27-8453','Leonardo','Dunn','1982-05-07','Male','Physician',7854159968,'7347 South Garden Dr. Brooklyn',11204,'New York',143261),('369-50-9541','Aiden','Russell','1977-01-08','Male','Surgeon',7858116286,'7069 Lower River Lane Camp Hill',17011,'California',180627),('466-63-9989','Dewey','Gibson','1985-09-11','Male','Pediatrician',7855909063,'785 Beaver Ridge Lane Oklahoma City',73179,'Oklahoma',129594),('561-02-6005','Umar','Lopez','1977-12-14','Male','Physician',7859669207,'4250  Pride Avenue, Jamaica',11432,'Jamaica',104856),('742-37-3430','Zack','Kennedy','1985-04-10','Female','Medical-surgical nurse',7855721802,'343 Wild Rose Dr. Arvada',80003,'Colorado',78373),('757-90-1706','Herman','Patton','1981-08-31','Female','Licensed practical nurse',7854069249,'8401 Maiden Dr. Killeen',76543,'Texas',55585),('781-80-3034','Alfred','Jordan','1983-09-05','Female','Nurse practitioner',7856581261,'9690 Courtland Rd. Harlingen',77489,'Texas',79347),('927-37-0465','Bernard','King','1976-01-30','Male','Physician',7852039726,'8573 E. Golf Ave. Carrollton',30117,'Georgia',111195);
/*!40000 ALTER TABLE `employee_details` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `encounter`
--

-- DROP TABLE IF EXISTS `encounter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encounter` (
  `EncntrID` varchar(45) NOT NULL,
  `PatientID` varchar(45) NOT NULL,
  `DrID` varchar(45) NOT NULL,
  `NurseID` varchar(45) NOT NULL,
  `EncntrType` varchar(45) NOT NULL,
  PRIMARY KEY (`EncntrID`),
  KEY `PatientID_Encntr_FK_idx` (`PatientID`),
  KEY `DrID_Encntr_FK_idx` (`DrID`),
  KEY `NurseID_Encntr_FK_idx` (`NurseID`),
  CONSTRAINT `DrID_Encntr_FK` FOREIGN KEY (`DrID`) REFERENCES `doctor` (`DrID`) ON UPDATE CASCADE,
  CONSTRAINT `NurseID_Encntr_FK` FOREIGN KEY (`NurseID`) REFERENCES `nurse` (`NurseID`) ON UPDATE CASCADE,
  CONSTRAINT `PatientID_Encntr_FK` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter`
--

-- LOCK TABLES `encounter` WRITE;
/*!40000 ALTER TABLE `encounter` DISABLE KEYS */;
INSERT INTO `encounter` VALUES ('Encntr001','ar18032','dr001','nur001','In-Patient'),('Encntr002','eb77548','dr002','nur002','Out-Patient'),('Encntr003','wj06469','dr004','nur004','In-Patient'),('Encntr004','sw28991','dr001','nur001','In-Patient'),('Encntr005','cc18020','dr003','nur003','In-Patient'),('Encntr006','ac51036','dr001','nur001','In-Patient'),('Encntr007','jw87624','dr005','nur005','In-Patient'),('Encntr008','aw60188','dr002','nur002','Out-Patient'),('Encntr009','bw19427','dr004','nur004','Out-Patient'),('Encntr010','kc88145','dr001','nur001','In-Patient'),('Encntr011','dl79745','dr005','nur005','In-Patient'),('Encntr012','ar18032','dr003','nur003','In-Patient');
/*!40000 ALTER TABLE `encounter` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `lab_report`
--

-- DROP TABLE IF EXISTS `lab_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_report` (
  `ReportID` varchar(45) NOT NULL,
  `PatientID` varchar(45) NOT NULL,
  `DrID` varchar(45) NOT NULL,
  `NurseID` varchar(45) NOT NULL,
  `LabResults` longtext NOT NULL,
  `ReportDtTm` date NOT NULL,
  PRIMARY KEY (`ReportID`),
  KEY `PatientID_idx` (`PatientID`),
  KEY `DrID_idx` (`DrID`),
  KEY `NurseID_idx` (`NurseID`),
  CONSTRAINT `DrID_LabRep_FK` FOREIGN KEY (`DrID`) REFERENCES `doctor` (`DrID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `NurseID_LabRep_FK` FOREIGN KEY (`NurseID`) REFERENCES `nurse` (`NurseID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PatientID_LabRep` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_report`
--

-- LOCK TABLES `lab_report` WRITE;
/*!40000 ALTER TABLE `lab_report` DISABLE KEYS */;
INSERT INTO `lab_report` VALUES ('Lab001','ar18032','dr001','nur001','All tests normal','2020-06-26'),('Lab002','wj06469','dr004','nur004','Positive','2019-09-10'),('Lab003','sw28991','dr001','nur001','Negative','2019-03-18'),('Lab004','cc18020','dr003','nur003','Positive','2013-01-14'),('Lab005','ac51036','dr001','nur001','Positive','2018-07-12'),('Lab006','jw87624','dr005','nur005','Negative','2019-09-18'),('Lab007','aw60188','dr002','nur002','Positive','2019-02-16'),('Lab008','bw19427','dr004','nur004','Negative','2020-07-11'),('Lab009','kc88145','dr001','nur001','Positive','2011-09-14');
/*!40000 ALTER TABLE `lab_report` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `medical_record`
--

-- DROP TABLE IF EXISTS `medical_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_record` (
  `RecordID` varchar(45) NOT NULL,
  `EncntrID` varchar(45) NOT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `EncntrID_MedRec_FK_idx` (`EncntrID`),
  CONSTRAINT `EncntrID_MedRec_FK` FOREIGN KEY (`EncntrID`) REFERENCES `encounter` (`EncntrID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record`
--

-- LOCK TABLES `medical_record` WRITE;
/*!40000 ALTER TABLE `medical_record` DISABLE KEYS */;
INSERT INTO `medical_record` VALUES ('MRN001','Encntr001'),('MRN002','Encntr002'),('MRN003','Encntr003'),('MRN004','Encntr004'),('MRN005','Encntr005'),('MRN006','Encntr006'),('MRN007','Encntr007'),('MRN008','Encntr008'),('MRN009','Encntr009'),('MRN010','Encntr010'),('MRN011','Encntr011'),('MRN012','Encntr012');
/*!40000 ALTER TABLE `medical_record` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `medication`
--

-- DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication` (
  `MedicationID` varchar(45) NOT NULL,
  `MedName` varchar(45) NOT NULL,
  `MedPurpose` longtext NOT NULL,
  `Company` varchar(45) NOT NULL,
  `UnitPrice` float NOT NULL,
  PRIMARY KEY (`MedicationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

-- LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES ('Abra006','Abravate','Dietiary Suppliment','Pfizer',45),('Adyn001','Adynonate','Headache','Akorn',34),('Albu017','Albudocet Edetadine','Cough','AstraZeneca',70),('Algl002','Alglutrana','Fever','Biogen',36),('Aspa009','Asparapentin','Allergies','Bayer',76),('Biot005','Biotrisin Zicotoin','Headache','Abbott',29),('Caff014','Caffeicetam','Vitamin D','Akorn',69),('Chor003','Choriotrisin','Muscle Pain','Bayer',63),('Croc008','Crocin Minorelin','Fever','Sanofi',39),('Docd007','Docdipine','Common cold','Merck&co',64),('Hepa016','Hepanine Azelabrate','Common cold','Biogen',42),('Invi015','Invitasol Adalaporin','Fever','AstraZeneca',32),('Mono004','Monosyn Neunuma','Multi-Vitamin','Pfizer',48),('Silv012','Silvapryl','Iron Suppliment','Pfizer',54),('Stel013','Stelavirase Kiocaine','Calcium Suppliment','Roche',74),('Tams011','Tamsufenac Bexxetine','Immuity Booster','Abbvie',47),('Tazo010','Tazonex Benesol','Pain Relief','Johnson & Johnson',58);
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `medication_schedule`
--

-- DROP TABLE IF EXISTS `medication_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication_schedule` (
  `PrescID` varchar(45) NOT NULL,
  `MedicationID` varchar(45) NOT NULL,
  `Dosage` varchar(45) NOT NULL,
  `Frequency` varchar(10) NOT NULL,
  `StartDtTm` date NOT NULL,
  `EndDtTm` date NOT NULL,
  PRIMARY KEY (`PrescID`,`MedicationID`),
  KEY `MedicationID_MedSchdl_FK_idx` (`MedicationID`),
  CONSTRAINT `MedicationID_MedSchdl_FK` FOREIGN KEY (`MedicationID`) REFERENCES `medication` (`MedicationID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PrescID_MedSchdl_FK` FOREIGN KEY (`PrescID`) REFERENCES `prescription` (`PrescID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_schedule`
--

-- LOCK TABLES `medication_schedule` WRITE;
/*!40000 ALTER TABLE `medication_schedule` DISABLE KEYS */;
INSERT INTO `medication_schedule` VALUES ('Presc001','Adyn001','40 mg','TID','2020-06-27','2020-07-02'),('Presc001','Albu017','10 mg','TID','2020-06-27','2020-07-03'),('Presc002','Abra006','3mg','QID','2016-02-17','2016-02-20'),('Presc002','Hepa016','15mg','QD','2016-02-17','2016-02-25'),('Presc002','Invi015','10mg','TID','2016-02-17','2016-02-22'),('Presc002','Tams011','5mg','QD','2016-02-17','2016-02-22'),('Presc003','Caff014','25mg','QD','2019-09-11','2019-09-16'),('Presc003','Croc008','10mg','TID','2019-09-11','2019-09-16'),('Presc004','Docd007','25mg','QID','2019-03-19','2019-03-24'),('Presc005','Croc008','10mg','QD','2013-01-15','2013-01-20'),('Presc006','Invi015','5mg','QID','2018-07-13','2018-07-16'),('Presc007','Chor003','40mg','TID','2019-09-19','2019-09-29'),('Presc008','Abra006','15mg','QD','2007-04-13','2007-04-16'),('Presc008','Adyn001','10mg','TID','2007-04-13','2007-04-18'),('Presc008','Stel013','25mg','QID','2007-04-13','2007-04-20'),('Presc008','Tazo010','10mg','QID','2007-04-13','2007-04-20'),('Presc009','Chor003','10mg','TID','2014-07-19','2014-07-24'),('Presc009','Hepa016','25mg','QD','2014-07-19','2014-07-24'),('Presc010','Mono004','5mg','QD','2019-02-15','2019-02-20'),('Presc011','Biot005','40mg','TID','2020-07-10','2020-07-15'),('Presc012','Aspa009','40 mg','TID','2011-09-13','2011-09-18'),('Presc012','Invi015','5mg','QID','2011-09-13','2011-09-20'),('Presc012','Silv012','10 mg','QD','2011-09-13','2011-09-16');
/*!40000 ALTER TABLE `medication_schedule` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

-- DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `NurseID` varchar(45) NOT NULL,
  `EmpID` varchar(45) NOT NULL,
  `BuildingID` varchar(45) NOT NULL,
  PRIMARY KEY (`NurseID`),
  KEY `EmpID_Nr_FK_idx` (`EmpID`),
  KEY `BuildingID_Nr_FK_idx` (`BuildingID`),
  CONSTRAINT `BuildingID_Nr_FK` FOREIGN KEY (`BuildingID`) REFERENCES `building` (`BuildingID`) ON UPDATE CASCADE,
  CONSTRAINT `EmpID_Nr_FK` FOREIGN KEY (`EmpID`) REFERENCES `employee` (`EmpID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

-- LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES ('nur001','tb81007','BaseWest001'),('nur002','mc95414','BaseSouth004'),('nur003','aj03034','BaseNoth002'),('nur004','hp01706','BaseEast003'),('nur005','zk73430','BaseWest001');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `patient`
--

-- DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `PatientID` varchar(45) NOT NULL,
  `SSN` varchar(45) NOT NULL,
  PRIMARY KEY (`PatientID`),
  KEY `SSN_Pat_FK_idx` (`SSN`),
  CONSTRAINT `SSN_Pat_FK` FOREIGN KEY (`SSN`) REFERENCES `patient_details` (`SSN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

-- LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('bw19427','286-11-9427'),('wj06469','337-70-6469'),('eb77548','369-27-7548'),('ar18032','383-21-8032'),('er08093','464-40-8093'),('kc88145','505-48-8145'),('aw60188','539-86-0188'),('sw28991','561-72-8991'),('jw87624','571-18-7624'),('dl79745','597-07-9745'),('ac51036','637-25-1036'),('cc18020','669-01-8020');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `patient_details`
--

-- DROP TABLE IF EXISTS `patient_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_details` (
  `SSN` varchar(45) NOT NULL,
  `Fname` varchar(45) DEFAULT NULL,
  `Lname` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `Sex` varchar(45) NOT NULL,
  `PhNum` decimal(10,0) NOT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_details`
--

-- LOCK TABLES `patient_details` WRITE;
/*!40000 ALTER TABLE `patient_details` DISABLE KEYS */;
INSERT INTO `patient_details` VALUES ('286-11-9427','Byron','Wells','1999-09-21','Male',7850565766),('337-70-6469','William','Johnston','1995-11-11','Male',7852878084),('369-27-7548','Edgar','Barnes','2002-07-08','Male',7854011907),('383-21-8032','Adele','Ross','1985-02-14','Female',7855064787),('464-40-8093','Elise','Riley','1991-06-17','Female',7859205967),('505-48-8145','Kristian','Crawford','1992-10-06','Male',7853070854),('539-86-0188','Alina','Warren','1985-09-28','Female',7859915220),('561-72-8991','Sophia','West','1977-03-24','Female',7858342557),('571-18-7624','Jared','Williams','1996-07-06','Male',7855486045),('597-07-9745','Darcy','Lloyd','1999-08-23','Female',7859773424),('637-25-1036','Arianna','Cameron','1982-06-20','Female',7859408035),('669-01-8020','Camila','Carroll','1977-07-16','Female',7853308435);
/*!40000 ALTER TABLE `patient_details` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `patient_record_details`
--

-- DROP TABLE IF EXISTS `patient_record_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_record_details` (
  `EncntrID` varchar(45) NOT NULL,
  `PatientID` varchar(45) NOT NULL,
  `ReportID` varchar(45) DEFAULT NULL,
  `Height` varchar(10) DEFAULT NULL,
  `Weight` decimal(10,0) DEFAULT NULL,
  `Allergies` longtext,
  `Pulse` int DEFAULT NULL,
  `Sys_BP` int DEFAULT NULL,
  `Dia_BP` int DEFAULT NULL,
  PRIMARY KEY (`EncntrID`),
  KEY `PatientID_PatRecDtls_FK_idx` (`PatientID`),
  CONSTRAINT `EncntrID_PatRecDtls_FK` FOREIGN KEY (`EncntrID`) REFERENCES `encounter` (`EncntrID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PatientID_PatRecDtls_FK` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_record_details`
--

-- LOCK TABLES `patient_record_details` WRITE;
/*!40000 ALTER TABLE `patient_record_details` DISABLE KEYS */;
INSERT INTO `patient_record_details` VALUES ('Encntr001','ar18032','Lab001','5\'5',160,'None',79,135,84),('Encntr002','eb77548','','5\'3',152,'Gluten ',72,118,80),('Encntr003','wj06469','Lab002','5\'10',175,'Lactoce',75,129,78),('Encntr004','sw28991','Lab003','5\'5',179,'None',72,120,78),('Encntr005','cc18020','Lab004','5\'6',179,'Peanuts',75,125,83),('Encntr006','ac51036','Lab005','5\'11',185,'None',72,138,75),('Encntr007','jw87624','Lab006','5\'8',146,'Gluten ',79,143,90),('Encntr008','aw60188','','5\'5',152,'None',72,132,82),('Encntr009','bw19427','','5\'11',160,'None',75,129,80),('Encntr010','kc88145','Lab007','6\'1',172,'Gelletin',79,137,74),('Encntr011','dl79745','Lab008','5\'2',175,'Gluten ',81,128,80),('Encntr012','ar18032','Lab009','5\'9',179,'Peanuts',75,120,90);
/*!40000 ALTER TABLE `patient_record_details` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

-- DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `PrescID` varchar(45) NOT NULL,
  `DrID` varchar(45) NOT NULL,
  `PatientID` varchar(45) NOT NULL,
  PRIMARY KEY (`PrescID`),
  KEY `DrID_idx` (`DrID`),
  KEY `PatientID_idx` (`PatientID`),
  CONSTRAINT `DrID_Presc_FK` FOREIGN KEY (`DrID`) REFERENCES `doctor` (`DrID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PatientID_Presc_FK` FOREIGN KEY (`PatientID`) REFERENCES `patient` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

-- LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES ('Presc001','dr001','ar18032'),('Presc002','dr002','eb77548'),('Presc003','dr004','wj06469'),('Presc004','dr001','sw28991'),('Presc005','dr003','cc18020'),('Presc006','dr001','ac51036'),('Presc007','dr005','jw87624'),('Presc008','dr002','aw60188'),('Presc009','dr004','bw19427'),('Presc010','dr001','kc88145'),('Presc011','dr005','dl79745'),('Presc012','dr003','ar18032');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `room`
--

-- DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `RoomNum` int NOT NULL,
  `BuildingID` varchar(45) NOT NULL,
  `RoomType` varchar(45) NOT NULL,
  `IsAvailable` char(1) NOT NULL,
  PRIMARY KEY (`RoomNum`,`BuildingID`),
  KEY `BuildingID_idx` (`BuildingID`),
  CONSTRAINT `BuildingID_Room_FK` FOREIGN KEY (`BuildingID`) REFERENCES `building` (`BuildingID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

-- LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (101,'BaseEast003','General','Y'),(101,'BaseNoth002','General','N'),(101,'BaseSouth004','Special','N'),(101,'BaseWest001','Special','N'),(102,'BaseEast003','Normal','N'),(102,'BaseNoth002','General','Y'),(102,'BaseSouth004','Special','Y'),(102,'BaseWest001','Normal','Y'),(103,'BaseNoth002','General','Y'),(103,'BaseWest001','General','N'),(201,'BaseEast003','General','N'),(201,'BaseWest001','Special','Y'),(202,'BaseEast003','Normal','Y'),(202,'BaseWest001','Normal','N'),(203,'BaseWest001','General','N'),(301,'BaseEast003','General','N'),(302,'BaseEast003','Normal','Y');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
-- UNLOCK TABLES;

--
-- Table structure for table `visiting_hours`
--

-- DROP TABLE IF EXISTS `visiting_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visiting_hours` (
  `DrID` varchar(45) NOT NULL,
  `VisitingDays` varchar(45) NOT NULL,
  `VisitingHrs_From` time NOT NULL,
  `VisitingHrs_To` time NOT NULL,
  PRIMARY KEY (`DrID`,`VisitingDays`),
  CONSTRAINT `DrID_VisitingHrs_FK` FOREIGN KEY (`DrID`) REFERENCES `doctor` (`DrID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visiting_hours`
--

-- LOCK TABLES `visiting_hours` WRITE;
/*!40000 ALTER TABLE `visiting_hours` DISABLE KEYS */;
INSERT INTO `visiting_hours` VALUES ('dr001','Mon-Fri','10:00:00','14:00:00'),('dr002','Mon-Wed','14:00:00','19:00:00'),('dr002','Thurs-Sat','08:00:00','12:00:00'),('dr003','Mon-Fri','08:00:00','12:00:00'),('dr004','Thurs-Sat','14:00:00','19:00:00'),('dr005','Mon-Tue','10:00:00','14:00:00'),('dr005','Sat','12:00:00','18:00:00'),('dr005','Wed-Thurs','15:00:00','19:00:00');
/*!40000 ALTER TABLE `visiting_hours` ENABLE KEYS */;
-- UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `tblcontactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
  
--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;



COMMIT;
-- Dump completed on 2020-11-21 18:21:29
