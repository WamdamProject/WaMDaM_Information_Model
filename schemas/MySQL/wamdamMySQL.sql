CREATE DATABASE  IF NOT EXISTS `wamdam` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wamdam`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: wamdam
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
-- Table structure for table `attributecategory`
--

DROP TABLE IF EXISTS `attributecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributecategory` (
  `AttributeCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeCategoryName` varchar(255) NOT NULL,
  `CategoryDefinition` text,
  PRIMARY KEY (`AttributeCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributecategory`
--

LOCK TABLES `attributecategory` WRITE;
/*!40000 ALTER TABLE `attributecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `AttributeID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeName` varchar(255) NOT NULL,
  `AttributeNameCV` varchar(255) DEFAULT NULL,
  `ObjectTypeID` int(11) NOT NULL,
  `UnitName` varchar(255) NOT NULL,
  `UnitNameCV` varchar(255) DEFAULT NULL,
  `AttributeDataTypeCV` varchar(255) NOT NULL,
  `AttributeCategoryID` int(11) DEFAULT NULL,
  `ModelInputOrOutput` char(50) DEFAULT NULL,
  `AttributeDescription` text,
  PRIMARY KEY (`AttributeID`),
  KEY `fk_Attributes_CV_AttributeName` (`AttributeNameCV`),
  KEY `fk_Attributes_CV_AttributeType` (`AttributeDataTypeCV`),
  KEY `fk_Attributes_CV_Units` (`UnitNameCV`),
  KEY `fk_Attributes_ObjectTypes` (`ObjectTypeID`),
  KEY `fk_ObjectAttributes_AttributeCategory` (`AttributeCategoryID`),
  CONSTRAINT `fk_Attributes_CV_AttributeName` FOREIGN KEY (`AttributeNameCV`) REFERENCES `cv_attributename` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_CV_AttributeType` FOREIGN KEY (`AttributeDataTypeCV`) REFERENCES `cv_attributedatatype` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_CV_Units` FOREIGN KEY (`UnitNameCV`) REFERENCES `cv_units` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_ObjectTypes` FOREIGN KEY (`ObjectTypeID`) REFERENCES `objecttypes` (`ObjectTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectAttributes_AttributeCategory` FOREIGN KEY (`AttributeCategoryID`) REFERENCES `attributecategory` (`AttributeCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connections` (
  `ConnectivityID` int(11) NOT NULL AUTO_INCREMENT,
  `LinkInstanceID` int(11) NOT NULL,
  `StartNodeInstanceID` int(11) NOT NULL,
  `EndNodeInstanceID` int(11) NOT NULL,
  PRIMARY KEY (`ConnectivityID`),
  KEY `fk_Connections_Instances` (`EndNodeInstanceID`),
  KEY `fk_Connections_Instances_Link` (`LinkInstanceID`),
  KEY `fk_Connections_Instances_startNode` (`StartNodeInstanceID`),
  CONSTRAINT `fk_Connections_Instances` FOREIGN KEY (`EndNodeInstanceID`) REFERENCES `instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Connections_Instances_Link` FOREIGN KEY (`LinkInstanceID`) REFERENCES `instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Connections_Instances_startNode` FOREIGN KEY (`StartNodeInstanceID`) REFERENCES `instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_aggregationstatistic`
--

DROP TABLE IF EXISTS `cv_aggregationstatistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_aggregationstatistic` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_aggregationstatistic`
--

LOCK TABLES `cv_aggregationstatistic` WRITE;
/*!40000 ALTER TABLE `cv_aggregationstatistic` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_aggregationstatistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_attributedatatype`
--

DROP TABLE IF EXISTS `cv_attributedatatype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_attributedatatype` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_attributedatatype`
--

LOCK TABLES `cv_attributedatatype` WRITE;
/*!40000 ALTER TABLE `cv_attributedatatype` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_attributedatatype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_attributename`
--

DROP TABLE IF EXISTS `cv_attributename`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_attributename` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_attributename`
--

LOCK TABLES `cv_attributename` WRITE;
/*!40000 ALTER TABLE `cv_attributename` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_attributename` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_descriptorvalues`
--

DROP TABLE IF EXISTS `cv_descriptorvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_descriptorvalues` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `AttributeName` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_descriptorvalues`
--

LOCK TABLES `cv_descriptorvalues` WRITE;
/*!40000 ALTER TABLE `cv_descriptorvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_descriptorvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_dualvaluemeaning`
--

DROP TABLE IF EXISTS `cv_dualvaluemeaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_dualvaluemeaning` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `BooleanValue` binary(1) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_dualvaluemeaning`
--

LOCK TABLES `cv_dualvaluemeaning` WRITE;
/*!40000 ALTER TABLE `cv_dualvaluemeaning` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_dualvaluemeaning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_electronicfileformat`
--

DROP TABLE IF EXISTS `cv_electronicfileformat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_electronicfileformat` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_electronicfileformat`
--

LOCK TABLES `cv_electronicfileformat` WRITE;
/*!40000 ALTER TABLE `cv_electronicfileformat` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_electronicfileformat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_elevationdatum`
--

DROP TABLE IF EXISTS `cv_elevationdatum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_elevationdatum` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_elevationdatum`
--

LOCK TABLES `cv_elevationdatum` WRITE;
/*!40000 ALTER TABLE `cv_elevationdatum` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_elevationdatum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_instancename`
--

DROP TABLE IF EXISTS `cv_instancename`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_instancename` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_instancename`
--

LOCK TABLES `cv_instancename` WRITE;
/*!40000 ALTER TABLE `cv_instancename` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_instancename` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_methodtype`
--

DROP TABLE IF EXISTS `cv_methodtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_methodtype` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_methodtype`
--

LOCK TABLES `cv_methodtype` WRITE;
/*!40000 ALTER TABLE `cv_methodtype` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_methodtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_objecttype`
--

DROP TABLE IF EXISTS `cv_objecttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_objecttype` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_objecttype`
--

LOCK TABLES `cv_objecttype` WRITE;
/*!40000 ALTER TABLE `cv_objecttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_objecttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_objecttypology`
--

DROP TABLE IF EXISTS `cv_objecttypology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_objecttypology` (
  `Name` varchar(50) NOT NULL,
  `Term` varchar(50) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_objecttypology`
--

LOCK TABLES `cv_objecttypology` WRITE;
/*!40000 ALTER TABLE `cv_objecttypology` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_objecttypology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_seasonname`
--

DROP TABLE IF EXISTS `cv_seasonname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_seasonname` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_seasonname`
--

LOCK TABLES `cv_seasonname` WRITE;
/*!40000 ALTER TABLE `cv_seasonname` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_seasonname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_spatialreference`
--

DROP TABLE IF EXISTS `cv_spatialreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_spatialreference` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_spatialreference`
--

LOCK TABLES `cv_spatialreference` WRITE;
/*!40000 ALTER TABLE `cv_spatialreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_spatialreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_units`
--

DROP TABLE IF EXISTS `cv_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cv_units` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) NOT NULL,
  `UnitSystem` varchar(255) DEFAULT NULL,
  `UnitAbbreviation` char(50) NOT NULL,
  `SourceVocabularyURI` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_units`
--

LOCK TABLES `cv_units` WRITE;
/*!40000 ALTER TABLE `cv_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `cv_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datasets`
--

DROP TABLE IF EXISTS `datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datasets` (
  `DatasetID` int(11) NOT NULL AUTO_INCREMENT,
  `DatasetName` varchar(255) NOT NULL,
  `DatasetAcronym` varchar(255) NOT NULL,
  `SourceID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`DatasetID`),
  KEY `fk_Datasets_Sources` (`SourceID`),
  CONSTRAINT `fk_Datasets_Sources` FOREIGN KEY (`SourceID`) REFERENCES `sources` (`SourceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datasets`
--

LOCK TABLES `datasets` WRITE;
/*!40000 ALTER TABLE `datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datavaluesmapper`
--

DROP TABLE IF EXISTS `datavaluesmapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datavaluesmapper` (
  `DataValuesMapperID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`DataValuesMapperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datavaluesmapper`
--

LOCK TABLES `datavaluesmapper` WRITE;
/*!40000 ALTER TABLE `datavaluesmapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `datavaluesmapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descriptorvalues`
--

DROP TABLE IF EXISTS `descriptorvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `descriptorvalues` (
  `DescriptorValueID` int(11) NOT NULL AUTO_INCREMENT,
  `DescriptorValue` varchar(500) NOT NULL,
  `DescriptorValueCV` varchar(255) DEFAULT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`DescriptorValueID`),
  KEY `fk_DescriptorValues_DataValuesMapper` (`DataValuesMapperID`),
  KEY `fk_TextControlled_CV_TextControlledValue` (`DescriptorValueCV`),
  CONSTRAINT `fk_DescriptorValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `datavaluesmapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TextControlled_CV_TextControlledValue` FOREIGN KEY (`DescriptorValueCV`) REFERENCES `cv_descriptorvalues` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptorvalues`
--

LOCK TABLES `descriptorvalues` WRITE;
/*!40000 ALTER TABLE `descriptorvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `descriptorvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dualvalues`
--

DROP TABLE IF EXISTS `dualvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dualvalues` (
  `DualValueID` int(11) NOT NULL AUTO_INCREMENT,
  `DualValueMeaningCV` varchar(255) NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`DualValueID`),
  KEY `fk_BooleanValues_CV_BooleanValueMeaning` (`DualValueMeaningCV`),
  KEY `fk_DualValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_BooleanValues_CV_BooleanValueMeaning` FOREIGN KEY (`DualValueMeaningCV`) REFERENCES `cv_dualvaluemeaning` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DualValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `datavaluesmapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dualvalues`
--

LOCK TABLES `dualvalues` WRITE;
/*!40000 ALTER TABLE `dualvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `dualvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electronicfiles`
--

DROP TABLE IF EXISTS `electronicfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electronicfiles` (
  `ElectronicFileID` int(11) NOT NULL AUTO_INCREMENT,
  `ElectronicFileName` varchar(255) NOT NULL,
  `ElectronicFile` blob NOT NULL,
  `ElectronicFileFormatCV` varchar(255) NOT NULL,
  `Description` text,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`ElectronicFileID`),
  KEY `fk_ElectronicFiles_DataValuesMapper` (`DataValuesMapperID`),
  KEY `fk_Files_CV_FileFormat` (`ElectronicFileFormatCV`),
  CONSTRAINT `fk_ElectronicFiles_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `datavaluesmapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Files_CV_FileFormat` FOREIGN KEY (`ElectronicFileFormatCV`) REFERENCES `cv_electronicfileformat` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronicfiles`
--

LOCK TABLES `electronicfiles` WRITE;
/*!40000 ALTER TABLE `electronicfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `electronicfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instancecategory`
--

DROP TABLE IF EXISTS `instancecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instancecategory` (
  `InstanceCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `InstanceCategory` varchar(255) NOT NULL,
  `CategoryDefinition` text,
  PRIMARY KEY (`InstanceCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instancecategory`
--

LOCK TABLES `instancecategory` WRITE;
/*!40000 ALTER TABLE `instancecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `instancecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instances`
--

DROP TABLE IF EXISTS `instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instances` (
  `InstanceID` int(11) NOT NULL AUTO_INCREMENT,
  `InstanceName` varchar(255) NOT NULL,
  `InstanceNameCV` varchar(255) DEFAULT NULL,
  `Longitude_x` float DEFAULT NULL,
  `Latitude_y` float DEFAULT NULL,
  `Description` text,
  `InstanceCategoryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`InstanceID`),
  KEY `fk_Instances_CV_InstanceName` (`InstanceNameCV`),
  KEY `fk_Instances_InstanceCategory` (`InstanceCategoryID`),
  CONSTRAINT `fk_Instances_CV_InstanceName` FOREIGN KEY (`InstanceNameCV`) REFERENCES `cv_instancename` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instances_InstanceCategory` FOREIGN KEY (`InstanceCategoryID`) REFERENCES `instancecategory` (`InstanceCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instances`
--

LOCK TABLES `instances` WRITE;
/*!40000 ALTER TABLE `instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapping`
--

DROP TABLE IF EXISTS `mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapping` (
  `MappingID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeID` int(11) NOT NULL,
  `InstanceID` int(11) NOT NULL,
  `SourceID` int(11) NOT NULL,
  `MethodID` int(11) NOT NULL,
  `DataValuesMapperID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MappingID`),
  KEY `fk_Mapping_Attributes` (`AttributeID`),
  KEY `fk_Mapping_DataValuesMapper` (`DataValuesMapperID`),
  KEY `fk_Mapping_Instances` (`InstanceID`),
  KEY `fk_Mapping_Methods` (`MethodID`),
  KEY `fk_Mapping_Sources` (`SourceID`),
  CONSTRAINT `fk_Mapping_Attributes` FOREIGN KEY (`AttributeID`) REFERENCES `attributes` (`AttributeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `datavaluesmapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_Instances` FOREIGN KEY (`InstanceID`) REFERENCES `instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_Methods` FOREIGN KEY (`MethodID`) REFERENCES `methods` (`MethodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_Sources` FOREIGN KEY (`SourceID`) REFERENCES `sources` (`SourceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapping`
--

LOCK TABLES `mapping` WRITE;
/*!40000 ALTER TABLE `mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `masternetworks`
--

DROP TABLE IF EXISTS `masternetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masternetworks` (
  `MasterNetworkID` int(11) NOT NULL AUTO_INCREMENT,
  `MasterNetworkName` varchar(255) NOT NULL,
  `SpatialReferenceNameCV` varchar(255) NOT NULL,
  `VerticalDatumCV` varchar(255) NOT NULL,
  `Description` text,
  PRIMARY KEY (`MasterNetworkID`),
  KEY `fk_MasterNetworks_CV_SpatialReference` (`SpatialReferenceNameCV`),
  KEY `fk_MasterNetworks_CV_VerticalDatum` (`VerticalDatumCV`),
  CONSTRAINT `fk_MasterNetworks_CV_SpatialReference` FOREIGN KEY (`SpatialReferenceNameCV`) REFERENCES `cv_spatialreference` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MasterNetworks_CV_VerticalDatum` FOREIGN KEY (`VerticalDatumCV`) REFERENCES `cv_elevationdatum` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `masternetworks`
--

LOCK TABLES `masternetworks` WRITE;
/*!40000 ALTER TABLE `masternetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `masternetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `methods`
--

DROP TABLE IF EXISTS `methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `methods` (
  `MethodID` int(11) NOT NULL AUTO_INCREMENT,
  `MethodName` varchar(255) NOT NULL,
  `MethodWebpage` varchar(255) DEFAULT NULL,
  `MethodCitation` varchar(500) DEFAULT NULL,
  `MethodTypeCV` varchar(255) NOT NULL,
  `PersonID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`MethodID`),
  KEY `fk_Methods_CV_MethodType` (`MethodTypeCV`),
  KEY `fk_Methods_People` (`PersonID`),
  CONSTRAINT `fk_Methods_CV_MethodType` FOREIGN KEY (`MethodTypeCV`) REFERENCES `cv_methodtype` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Methods_People` FOREIGN KEY (`PersonID`) REFERENCES `people` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `methods`
--

LOCK TABLES `methods` WRITE;
/*!40000 ALTER TABLE `methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiattributeseries`
--

DROP TABLE IF EXISTS `multiattributeseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multiattributeseries` (
  `MultiAttributeSeriesID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeNameID` int(11) NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`MultiAttributeSeriesID`),
  KEY `fk_MultiAttributeSeries_DataValuesMapper` (`DataValuesMapperID`),
  KEY `fk_MultiColumnArray_DataValuesMapper` (`AttributeNameID`),
  CONSTRAINT `fk_MultiAttributeSeries_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `datavaluesmapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MultiColumnArray_DataValuesMapper` FOREIGN KEY (`AttributeNameID`) REFERENCES `datavaluesmapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiattributeseries`
--

LOCK TABLES `multiattributeseries` WRITE;
/*!40000 ALTER TABLE `multiattributeseries` DISABLE KEYS */;
/*!40000 ALTER TABLE `multiattributeseries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiattributeseriesvalues`
--

DROP TABLE IF EXISTS `multiattributeseriesvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multiattributeseriesvalues` (
  `MultiAttributeSeriesValueID` int(11) NOT NULL AUTO_INCREMENT,
  `MultiAttributeSeriesID` int(11) NOT NULL,
  `Value` varchar(255) NOT NULL,
  `ValueOrder` int(11) NOT NULL,
  PRIMARY KEY (`MultiAttributeSeriesValueID`),
  KEY `fk_MultiAttributeSeriesValues_MultiAttributeSeries` (`MultiAttributeSeriesID`),
  CONSTRAINT `fk_MultiAttributeSeriesValues_MultiAttributeSeries` FOREIGN KEY (`MultiAttributeSeriesID`) REFERENCES `multiattributeseries` (`MultiAttributeSeriesID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiattributeseriesvalues`
--

LOCK TABLES `multiattributeseriesvalues` WRITE;
/*!40000 ALTER TABLE `multiattributeseriesvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `multiattributeseriesvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numericvalues`
--

DROP TABLE IF EXISTS `numericvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numericvalues` (
  `NumericValueID` int(11) NOT NULL AUTO_INCREMENT,
  `NumericValue` float NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`NumericValueID`),
  KEY `fk_NumericValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_NumericValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `datavaluesmapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numericvalues`
--

LOCK TABLES `numericvalues` WRITE;
/*!40000 ALTER TABLE `numericvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `numericvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcategory`
--

DROP TABLE IF EXISTS `objectcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectcategory` (
  `ObjectCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectCategoryName` varchar(255) NOT NULL,
  `CategoryDefinition` text,
  PRIMARY KEY (`ObjectCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectcategory`
--

LOCK TABLES `objectcategory` WRITE;
/*!40000 ALTER TABLE `objectcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `objectcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objecttypes`
--

DROP TABLE IF EXISTS `objecttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objecttypes` (
  `ObjectTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectType` varchar(255) NOT NULL,
  `ObjectTypeCV` varchar(255) DEFAULT NULL,
  `ObjectTypologyCV` varchar(50) NOT NULL,
  `Icons` blob,
  `Description` text,
  `ObjectCategoryID` int(11) DEFAULT NULL,
  `DatasetID` int(11) NOT NULL,
  PRIMARY KEY (`ObjectTypeID`),
  KEY `fk_ObjectTypes_CV_ObjectTopology` (`ObjectTypologyCV`),
  KEY `fk_ObjectTypes_CV_ObjectTypes` (`ObjectTypeCV`),
  KEY `fk_ObjectTypes_Datasets` (`DatasetID`),
  KEY `fk_ObjectTypes_ObjectCategory` (`ObjectCategoryID`),
  CONSTRAINT `fk_ObjectTypes_CV_ObjectTopology` FOREIGN KEY (`ObjectTypologyCV`) REFERENCES `cv_objecttypology` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectTypes_CV_ObjectTypes` FOREIGN KEY (`ObjectTypeCV`) REFERENCES `cv_objecttype` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectTypes_Datasets` FOREIGN KEY (`DatasetID`) REFERENCES `datasets` (`DatasetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectTypes_ObjectCategory` FOREIGN KEY (`ObjectCategoryID`) REFERENCES `objectcategory` (`ObjectCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objecttypes`
--

LOCK TABLES `objecttypes` WRITE;
/*!40000 ALTER TABLE `objecttypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `objecttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `OrganizationID` int(11) NOT NULL AUTO_INCREMENT,
  `OrganizationName` varchar(255) NOT NULL,
  `OrganizationType` varchar(255) DEFAULT NULL,
  `OrganizationWebpage` varchar(255) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`OrganizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `PersonID` int(11) NOT NULL AUTO_INCREMENT,
  `PersonName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `PersonWebpage` varchar(255) DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `OrganizationID` int(11) NOT NULL,
  PRIMARY KEY (`PersonID`),
  KEY `fk_People_Organizations` (`OrganizationID`),
  CONSTRAINT `fk_People_Organizations` FOREIGN KEY (`OrganizationID`) REFERENCES `organizations` (`OrganizationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenariomapping`
--

DROP TABLE IF EXISTS `scenariomapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenariomapping` (
  `ScenarioMappingID` int(11) NOT NULL AUTO_INCREMENT,
  `ScenarioID` int(11) NOT NULL,
  `MappingID` int(11) NOT NULL,
  PRIMARY KEY (`ScenarioMappingID`),
  KEY `fk_ScenarioMapping_Mapping` (`MappingID`),
  KEY `fk_ScenarioMapping_Scenarios` (`ScenarioID`),
  CONSTRAINT `fk_ScenarioMapping_Mapping` FOREIGN KEY (`MappingID`) REFERENCES `mapping` (`MappingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ScenarioMapping_Scenarios` FOREIGN KEY (`ScenarioID`) REFERENCES `scenarios` (`ScenarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenariomapping`
--

LOCK TABLES `scenariomapping` WRITE;
/*!40000 ALTER TABLE `scenariomapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `scenariomapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenarios`
--

DROP TABLE IF EXISTS `scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenarios` (
  `ScenarioID` int(11) NOT NULL AUTO_INCREMENT,
  `ScenarioName` varchar(255) NOT NULL,
  `ScenarioStartDate` varchar(255) DEFAULT NULL,
  `ScenarioEndDate` datetime DEFAULT NULL,
  `TimeStepValue` int(11) DEFAULT NULL,
  `TimeStepUnitCV` varchar(255) DEFAULT NULL,
  `MasterNetworkID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`ScenarioID`),
  KEY `fk_Scenarios_CV_Units` (`TimeStepUnitCV`),
  KEY `fk_Scenarios_MasterNetworks` (`MasterNetworkID`),
  CONSTRAINT `fk_Scenarios_CV_Units` FOREIGN KEY (`TimeStepUnitCV`) REFERENCES `cv_units` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Scenarios_MasterNetworks` FOREIGN KEY (`MasterNetworkID`) REFERENCES `masternetworks` (`MasterNetworkID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenarios`
--

LOCK TABLES `scenarios` WRITE;
/*!40000 ALTER TABLE `scenarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `scenarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasonalnumericvalues`
--

DROP TABLE IF EXISTS `seasonalnumericvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasonalnumericvalues` (
  `SeasonalNumericValueID` int(11) NOT NULL AUTO_INCREMENT,
  `SeasonName` varchar(255) NOT NULL,
  `SeasonOrder` int(11) NOT NULL,
  `SeasonNameCV` varchar(255) DEFAULT NULL,
  `SeasonNumericValue` float NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`SeasonalNumericValueID`),
  KEY `fk_SeasonalNumericValues_CV_SeasonName` (`SeasonNameCV`),
  KEY `fk_SeasonalNumericValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_SeasonalNumericValues_CV_SeasonName` FOREIGN KEY (`SeasonNameCV`) REFERENCES `cv_seasonname` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SeasonalNumericValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `datavaluesmapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasonalnumericvalues`
--

LOCK TABLES `seasonalnumericvalues` WRITE;
/*!40000 ALTER TABLE `seasonalnumericvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `seasonalnumericvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `SourceID` int(11) NOT NULL AUTO_INCREMENT,
  `SourceName` varchar(500) NOT NULL,
  `SourceWebpage` varchar(500) DEFAULT NULL,
  `SourceCitation` varchar(500) DEFAULT NULL,
  `PersonID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`SourceID`),
  KEY `fk_Sources_People` (`PersonID`),
  CONSTRAINT `fk_Sources_People` FOREIGN KEY (`PersonID`) REFERENCES `people` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sources`
--

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeseries`
--

DROP TABLE IF EXISTS `timeseries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeseries` (
  `TimeSeriesID` int(11) NOT NULL AUTO_INCREMENT,
  `WaterOrCalendarYear` varchar(50) NOT NULL,
  `AggregationStatistiCV` varchar(255) NOT NULL,
  `AggregationInterval` double NOT NULL,
  `IntervalTimeUnitCV` varchar(255) NOT NULL,
  `BeginDateTime` datetime DEFAULT NULL,
  `EndDateTime` datetime DEFAULT NULL,
  `IsRegular` tinyint(1) DEFAULT NULL,
  `NoDataValue` varchar(50) DEFAULT NULL,
  `Description` text,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`TimeSeriesID`),
  KEY `fk_TimeSeries_CV_AggregationStatistic` (`AggregationStatistiCV`),
  KEY `fk_TimeSeries_CV_Units` (`IntervalTimeUnitCV`),
  KEY `fk_TimeSeries_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_TimeSeries_CV_AggregationStatistic` FOREIGN KEY (`AggregationStatistiCV`) REFERENCES `cv_aggregationstatistic` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeSeries_CV_Units` FOREIGN KEY (`IntervalTimeUnitCV`) REFERENCES `cv_units` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeSeries_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `datavaluesmapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeseries`
--

LOCK TABLES `timeseries` WRITE;
/*!40000 ALTER TABLE `timeseries` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeseries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeseriesvalues`
--

DROP TABLE IF EXISTS `timeseriesvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timeseriesvalues` (
  `TimeSeriesValueID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeSeriesID` int(11) NOT NULL,
  `DateTimeStamp` datetime NOT NULL,
  `Value` float NOT NULL,
  PRIMARY KEY (`TimeSeriesValueID`),
  KEY `fk_TimeSeriesValues_TimeSeries` (`TimeSeriesID`),
  CONSTRAINT `fk_TimeSeriesValues_TimeSeries` FOREIGN KEY (`TimeSeriesID`) REFERENCES `timeseries` (`TimeSeriesID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeseriesvalues`
--

LOCK TABLES `timeseriesvalues` WRITE;
/*!40000 ALTER TABLE `timeseriesvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeseriesvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wamdamversion`
--

DROP TABLE IF EXISTS `wamdamversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wamdamversion` (
  `VersionNumber` decimal(2,0) NOT NULL,
  PRIMARY KEY (`VersionNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wamdamversion`
--

LOCK TABLES `wamdamversion` WRITE;
/*!40000 ALTER TABLE `wamdamversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `wamdamversion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-06 12:54:35
