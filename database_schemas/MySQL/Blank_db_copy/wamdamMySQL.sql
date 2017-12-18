-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: WaMDaM
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
-- Table structure for table `AttributeCategories`
--

DROP TABLE IF EXISTS `AttributeCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AttributeCategories` (
  `AttributeCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeCategoryName` varchar(255) NOT NULL,
  `CategoryDefinition` text,
  PRIMARY KEY (`AttributeCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AttributeCategories`
--

LOCK TABLES `AttributeCategories` WRITE;
/*!40000 ALTER TABLE `AttributeCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `AttributeCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attributes`
--

DROP TABLE IF EXISTS `Attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attributes` (
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
  CONSTRAINT `fk_Attributes_CV_AttributeName` FOREIGN KEY (`AttributeNameCV`) REFERENCES `CV_AttributeName` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_CV_AttributeType` FOREIGN KEY (`AttributeDataTypeCV`) REFERENCES `CV_AttributeDataType` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_CV_Units` FOREIGN KEY (`UnitNameCV`) REFERENCES `CV_Units` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attributes_ObjectTypes` FOREIGN KEY (`ObjectTypeID`) REFERENCES `ObjectTypes` (`ObjectTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectAttributes_AttributeCategory` FOREIGN KEY (`AttributeCategoryID`) REFERENCES `AttributeCategories` (`AttributeCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attributes`
--

LOCK TABLES `Attributes` WRITE;
/*!40000 ALTER TABLE `Attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_AggregationStatistic`
--

DROP TABLE IF EXISTS `CV_AggregationStatistic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_AggregationStatistic` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_AggregationStatistic`
--

LOCK TABLES `CV_AggregationStatistic` WRITE;
/*!40000 ALTER TABLE `CV_AggregationStatistic` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_AggregationStatistic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_AttributeDataType`
--

DROP TABLE IF EXISTS `CV_AttributeDataType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_AttributeDataType` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_AttributeDataType`
--

LOCK TABLES `CV_AttributeDataType` WRITE;
/*!40000 ALTER TABLE `CV_AttributeDataType` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_AttributeDataType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_AttributeName`
--

DROP TABLE IF EXISTS `CV_AttributeName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_AttributeName` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_AttributeName`
--

LOCK TABLES `CV_AttributeName` WRITE;
/*!40000 ALTER TABLE `CV_AttributeName` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_AttributeName` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_DescriptorValues`
--

DROP TABLE IF EXISTS `CV_DescriptorValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_DescriptorValues` (
  `Term` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `AttributeName` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_DescriptorValues`
--

LOCK TABLES `CV_DescriptorValues` WRITE;
/*!40000 ALTER TABLE `CV_DescriptorValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_DescriptorValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_DualValueMeaning`
--

DROP TABLE IF EXISTS `CV_DualValueMeaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_DualValueMeaning` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `BooleanValue` tinyint(1) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_DualValueMeaning`
--

LOCK TABLES `CV_DualValueMeaning` WRITE;
/*!40000 ALTER TABLE `CV_DualValueMeaning` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_DualValueMeaning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_ElectronicFileFormat`
--

DROP TABLE IF EXISTS `CV_ElectronicFileFormat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_ElectronicFileFormat` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_ElectronicFileFormat`
--

LOCK TABLES `CV_ElectronicFileFormat` WRITE;
/*!40000 ALTER TABLE `CV_ElectronicFileFormat` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_ElectronicFileFormat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_ElevationDatum`
--

DROP TABLE IF EXISTS `CV_ElevationDatum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_ElevationDatum` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_ElevationDatum`
--

LOCK TABLES `CV_ElevationDatum` WRITE;
/*!40000 ALTER TABLE `CV_ElevationDatum` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_ElevationDatum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_InstanceName`
--

DROP TABLE IF EXISTS `CV_InstanceName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_InstanceName` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_InstanceName`
--

LOCK TABLES `CV_InstanceName` WRITE;
/*!40000 ALTER TABLE `CV_InstanceName` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_InstanceName` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_MethodType`
--

DROP TABLE IF EXISTS `CV_MethodType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_MethodType` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_MethodType`
--

LOCK TABLES `CV_MethodType` WRITE;
/*!40000 ALTER TABLE `CV_MethodType` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_MethodType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_ObjectType`
--

DROP TABLE IF EXISTS `CV_ObjectType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_ObjectType` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_ObjectType`
--

LOCK TABLES `CV_ObjectType` WRITE;
/*!40000 ALTER TABLE `CV_ObjectType` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_ObjectType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_ObjectTypology`
--

DROP TABLE IF EXISTS `CV_ObjectTypology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_ObjectTypology` (
  `Name` varchar(50) NOT NULL,
  `Term` varchar(50) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_ObjectTypology`
--

LOCK TABLES `CV_ObjectTypology` WRITE;
/*!40000 ALTER TABLE `CV_ObjectTypology` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_ObjectTypology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_SeasonName`
--

DROP TABLE IF EXISTS `CV_SeasonName`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_SeasonName` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_SeasonName`
--

LOCK TABLES `CV_SeasonName` WRITE;
/*!40000 ALTER TABLE `CV_SeasonName` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_SeasonName` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_SpatialReference`
--

DROP TABLE IF EXISTS `CV_SpatialReference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_SpatialReference` (
  `Name` varchar(255) NOT NULL,
  `Term` varchar(255) NOT NULL,
  `Definition` varchar(5000) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `SourceVocabularyURI` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CV_SpatialReference`
--

LOCK TABLES `CV_SpatialReference` WRITE;
/*!40000 ALTER TABLE `CV_SpatialReference` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_SpatialReference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CV_Units`
--

DROP TABLE IF EXISTS `CV_Units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CV_Units` (
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
-- Dumping data for table `CV_Units`
--

LOCK TABLES `CV_Units` WRITE;
/*!40000 ALTER TABLE `CV_Units` DISABLE KEYS */;
/*!40000 ALTER TABLE `CV_Units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Connections`
--

DROP TABLE IF EXISTS `Connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Connections` (
  `ConnectivityID` int(11) NOT NULL AUTO_INCREMENT,
  `LinkInstanceID` int(11) NOT NULL,
  `StartNodeInstanceID` int(11) NOT NULL,
  `EndNodeInstanceID` int(11) NOT NULL,
  PRIMARY KEY (`ConnectivityID`),
  KEY `fk_Connections_Instances` (`EndNodeInstanceID`),
  KEY `fk_Connections_Instances_Link` (`LinkInstanceID`),
  KEY `fk_Connections_Instances_startNode` (`StartNodeInstanceID`),
  CONSTRAINT `fk_Connections_Instances` FOREIGN KEY (`EndNodeInstanceID`) REFERENCES `Instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Connections_Instances_Link` FOREIGN KEY (`LinkInstanceID`) REFERENCES `Instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Connections_Instances_startNode` FOREIGN KEY (`StartNodeInstanceID`) REFERENCES `Instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Connections`
--

LOCK TABLES `Connections` WRITE;
/*!40000 ALTER TABLE `Connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `Connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DataValuesMapper`
--

DROP TABLE IF EXISTS `DataValuesMapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DataValuesMapper` (
  `DataValuesMapperID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`DataValuesMapperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DataValuesMapper`
--

LOCK TABLES `DataValuesMapper` WRITE;
/*!40000 ALTER TABLE `DataValuesMapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `DataValuesMapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Datasets`
--

DROP TABLE IF EXISTS `Datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Datasets` (
  `DatasetID` int(11) NOT NULL AUTO_INCREMENT,
  `DatasetName` varchar(255) NOT NULL,
  `DatasetAcronym` varchar(255) NOT NULL,
  `SourceID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`DatasetID`),
  KEY `fk_Datasets_Sources` (`SourceID`),
  CONSTRAINT `fk_Datasets_Sources` FOREIGN KEY (`SourceID`) REFERENCES `Sources` (`SourceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Datasets`
--

LOCK TABLES `Datasets` WRITE;
/*!40000 ALTER TABLE `Datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `Datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DescriptorValues`
--

DROP TABLE IF EXISTS `DescriptorValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DescriptorValues` (
  `DescriptorValueID` int(11) NOT NULL AUTO_INCREMENT,
  `DescriptorValue` varchar(500) NOT NULL,
  `DescriptorValueCV` varchar(255) DEFAULT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`DescriptorValueID`),
  KEY `fk_DescriptorValues_CV_DescriptorValues` (`DescriptorValueCV`),
  KEY `fk_DescriptorValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_DescriptorValues_CV_DescriptorValues` FOREIGN KEY (`DescriptorValueCV`) REFERENCES `CV_DescriptorValues` (`Term`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DescriptorValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DescriptorValues`
--

LOCK TABLES `DescriptorValues` WRITE;
/*!40000 ALTER TABLE `DescriptorValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `DescriptorValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DualValues`
--

DROP TABLE IF EXISTS `DualValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DualValues` (
  `DualValueID` int(11) NOT NULL AUTO_INCREMENT,
  `DualValue` tinyint(1) NOT NULL,
  `DualValueMeaningCV` varchar(255) NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`DualValueID`),
  KEY `fk_BooleanValues_CV_BooleanValueMeaning` (`DualValueMeaningCV`),
  KEY `fk_DualValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_BooleanValues_CV_BooleanValueMeaning` FOREIGN KEY (`DualValueMeaningCV`) REFERENCES `CV_DualValueMeaning` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DualValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DualValues`
--

LOCK TABLES `DualValues` WRITE;
/*!40000 ALTER TABLE `DualValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `DualValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ElectronicFiles`
--

DROP TABLE IF EXISTS `ElectronicFiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ElectronicFiles` (
  `ElectronicFileID` int(11) NOT NULL AUTO_INCREMENT,
  `ElectronicFileName` varchar(255) NOT NULL,
  `ElectronicFile` blob NOT NULL,
  `ElectronicFileFormatCV` varchar(255) NOT NULL,
  `Description` text,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`ElectronicFileID`),
  KEY `fk_ElectronicFiles_DataValuesMapper` (`DataValuesMapperID`),
  KEY `fk_Files_CV_FileFormat` (`ElectronicFileFormatCV`),
  CONSTRAINT `fk_ElectronicFiles_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Files_CV_FileFormat` FOREIGN KEY (`ElectronicFileFormatCV`) REFERENCES `CV_ElectronicFileFormat` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ElectronicFiles`
--

LOCK TABLES `ElectronicFiles` WRITE;
/*!40000 ALTER TABLE `ElectronicFiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ElectronicFiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InstanceCategories`
--

DROP TABLE IF EXISTS `InstanceCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InstanceCategories` (
  `InstanceCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `InstanceCategory` varchar(255) NOT NULL,
  `CategoryDefinition` text,
  PRIMARY KEY (`InstanceCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InstanceCategories`
--

LOCK TABLES `InstanceCategories` WRITE;
/*!40000 ALTER TABLE `InstanceCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `InstanceCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instances`
--

DROP TABLE IF EXISTS `Instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instances` (
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
  CONSTRAINT `fk_Instances_CV_InstanceName` FOREIGN KEY (`InstanceNameCV`) REFERENCES `CV_InstanceName` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instances_InstanceCategory` FOREIGN KEY (`InstanceCategoryID`) REFERENCES `InstanceCategories` (`InstanceCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instances`
--

LOCK TABLES `Instances` WRITE;
/*!40000 ALTER TABLE `Instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `Instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mappings`
--

DROP TABLE IF EXISTS `Mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mappings` (
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
  CONSTRAINT `fk_Mapping_Attributes` FOREIGN KEY (`AttributeID`) REFERENCES `Attributes` (`AttributeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_Instances` FOREIGN KEY (`InstanceID`) REFERENCES `Instances` (`InstanceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_Methods` FOREIGN KEY (`MethodID`) REFERENCES `Methods` (`MethodID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mapping_Sources` FOREIGN KEY (`SourceID`) REFERENCES `Sources` (`SourceID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mappings`
--

LOCK TABLES `Mappings` WRITE;
/*!40000 ALTER TABLE `Mappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MasterNetworks`
--

DROP TABLE IF EXISTS `MasterNetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MasterNetworks` (
  `MasterNetworkID` int(11) NOT NULL AUTO_INCREMENT,
  `MasterNetworkName` varchar(255) NOT NULL,
  `SpatialReferenceNameCV` varchar(255) NOT NULL,
  `VerticalDatumCV` varchar(255) NOT NULL,
  `Description` text,
  PRIMARY KEY (`MasterNetworkID`),
  KEY `fk_MasterNetworks_CV_SpatialReference` (`SpatialReferenceNameCV`),
  KEY `fk_MasterNetworks_CV_VerticalDatum` (`VerticalDatumCV`),
  CONSTRAINT `fk_MasterNetworks_CV_SpatialReference` FOREIGN KEY (`SpatialReferenceNameCV`) REFERENCES `CV_SpatialReference` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MasterNetworks_CV_VerticalDatum` FOREIGN KEY (`VerticalDatumCV`) REFERENCES `CV_ElevationDatum` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MasterNetworks`
--

LOCK TABLES `MasterNetworks` WRITE;
/*!40000 ALTER TABLE `MasterNetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `MasterNetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Methods`
--

DROP TABLE IF EXISTS `Methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Methods` (
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
  CONSTRAINT `fk_Methods_CV_MethodType` FOREIGN KEY (`MethodTypeCV`) REFERENCES `CV_MethodType` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Methods_People` FOREIGN KEY (`PersonID`) REFERENCES `People` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Methods`
--

LOCK TABLES `Methods` WRITE;
/*!40000 ALTER TABLE `Methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `Methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MultiAttributeSeries`
--

DROP TABLE IF EXISTS `MultiAttributeSeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MultiAttributeSeries` (
  `MultiAttributeSeriesID` int(11) NOT NULL AUTO_INCREMENT,
  `AttributeNameID` int(11) NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`MultiAttributeSeriesID`),
  KEY `fk_MultiAttributeSeries_DataValuesMapper` (`DataValuesMapperID`),
  KEY `fk_MultiColumnArray_DataValuesMapper` (`AttributeNameID`),
  CONSTRAINT `fk_MultiAttributeSeries_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MultiColumnArray_DataValuesMapper` FOREIGN KEY (`AttributeNameID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MultiAttributeSeries`
--

LOCK TABLES `MultiAttributeSeries` WRITE;
/*!40000 ALTER TABLE `MultiAttributeSeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `MultiAttributeSeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MultiAttributeSeriesValues`
--

DROP TABLE IF EXISTS `MultiAttributeSeriesValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MultiAttributeSeriesValues` (
  `MultiAttributeSeriesValueID` int(11) NOT NULL AUTO_INCREMENT,
  `MultiAttributeSeriesID` int(11) NOT NULL,
  `Value` varchar(255) NOT NULL,
  `ValueOrder` int(11) NOT NULL,
  PRIMARY KEY (`MultiAttributeSeriesValueID`),
  KEY `fk_MultiAttributeSeriesValues_MultiAttributeSeries` (`MultiAttributeSeriesID`),
  CONSTRAINT `fk_MultiAttributeSeriesValues_MultiAttributeSeries` FOREIGN KEY (`MultiAttributeSeriesID`) REFERENCES `MultiAttributeSeries` (`MultiAttributeSeriesID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MultiAttributeSeriesValues`
--

LOCK TABLES `MultiAttributeSeriesValues` WRITE;
/*!40000 ALTER TABLE `MultiAttributeSeriesValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `MultiAttributeSeriesValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NumericValues`
--

DROP TABLE IF EXISTS `NumericValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NumericValues` (
  `NumericValueID` int(11) NOT NULL AUTO_INCREMENT,
  `NumericValue` float NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`NumericValueID`),
  KEY `fk_NumericValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_NumericValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NumericValues`
--

LOCK TABLES `NumericValues` WRITE;
/*!40000 ALTER TABLE `NumericValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `NumericValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObjectCategories`
--

DROP TABLE IF EXISTS `ObjectCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObjectCategories` (
  `ObjectCategoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectCategoryName` varchar(255) NOT NULL,
  `CategoryDefinition` text,
  PRIMARY KEY (`ObjectCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObjectCategories`
--

LOCK TABLES `ObjectCategories` WRITE;
/*!40000 ALTER TABLE `ObjectCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObjectCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObjectTypes`
--

DROP TABLE IF EXISTS `ObjectTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ObjectTypes` (
  `ObjectTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectType` varchar(255) NOT NULL,
  `ObjectTypeCV` varchar(255) DEFAULT NULL,
  `ObjectTypologyCV` varchar(50) NOT NULL,
  `Icon` blob,
  `Description` text,
  `ObjectCategoryID` int(11) DEFAULT NULL,
  `DatasetID` int(11) NOT NULL,
  PRIMARY KEY (`ObjectTypeID`),
  KEY `fk_ObjectTypes_CV_ObjectTopology` (`ObjectTypologyCV`),
  KEY `fk_ObjectTypes_CV_ObjectTypes` (`ObjectTypeCV`),
  KEY `fk_ObjectTypes_Datasets` (`DatasetID`),
  KEY `fk_ObjectTypes_ObjectCategory` (`ObjectCategoryID`),
  CONSTRAINT `fk_ObjectTypes_CV_ObjectTopology` FOREIGN KEY (`ObjectTypologyCV`) REFERENCES `CV_ObjectTypology` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectTypes_CV_ObjectTypes` FOREIGN KEY (`ObjectTypeCV`) REFERENCES `CV_ObjectType` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectTypes_Datasets` FOREIGN KEY (`DatasetID`) REFERENCES `Datasets` (`DatasetID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ObjectTypes_ObjectCategory` FOREIGN KEY (`ObjectCategoryID`) REFERENCES `ObjectCategories` (`ObjectCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObjectTypes`
--

LOCK TABLES `ObjectTypes` WRITE;
/*!40000 ALTER TABLE `ObjectTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ObjectTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organizations`
--

DROP TABLE IF EXISTS `Organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organizations` (
  `OrganizationID` int(11) NOT NULL AUTO_INCREMENT,
  `OrganizationName` varchar(255) NOT NULL,
  `OrganizationType` varchar(255) DEFAULT NULL,
  `OrganizationWebpage` varchar(255) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`OrganizationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organizations`
--

LOCK TABLES `Organizations` WRITE;
/*!40000 ALTER TABLE `Organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `People`
--

DROP TABLE IF EXISTS `People`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `People` (
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
  CONSTRAINT `fk_People_Organizations` FOREIGN KEY (`OrganizationID`) REFERENCES `Organizations` (`OrganizationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `People`
--

LOCK TABLES `People` WRITE;
/*!40000 ALTER TABLE `People` DISABLE KEYS */;
/*!40000 ALTER TABLE `People` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScenarioMappings`
--

DROP TABLE IF EXISTS `ScenarioMappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScenarioMappings` (
  `ScenarioMappingID` int(11) NOT NULL AUTO_INCREMENT,
  `ScenarioID` int(11) NOT NULL,
  `MappingID` int(11) NOT NULL,
  PRIMARY KEY (`ScenarioMappingID`),
  KEY `fk_ScenarioMapping_Mapping` (`MappingID`),
  KEY `fk_ScenarioMapping_Scenarios` (`ScenarioID`),
  CONSTRAINT `fk_ScenarioMapping_Mapping` FOREIGN KEY (`MappingID`) REFERENCES `Mappings` (`MappingID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ScenarioMapping_Scenarios` FOREIGN KEY (`ScenarioID`) REFERENCES `Scenarios` (`ScenarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScenarioMappings`
--

LOCK TABLES `ScenarioMappings` WRITE;
/*!40000 ALTER TABLE `ScenarioMappings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScenarioMappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Scenarios`
--

DROP TABLE IF EXISTS `Scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Scenarios` (
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
  CONSTRAINT `fk_Scenarios_CV_Units` FOREIGN KEY (`TimeStepUnitCV`) REFERENCES `CV_Units` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Scenarios_MasterNetworks` FOREIGN KEY (`MasterNetworkID`) REFERENCES `MasterNetworks` (`MasterNetworkID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Scenarios`
--

LOCK TABLES `Scenarios` WRITE;
/*!40000 ALTER TABLE `Scenarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Scenarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeasonalNumericValues`
--

DROP TABLE IF EXISTS `SeasonalNumericValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeasonalNumericValues` (
  `SeasonalNumericValueID` int(11) NOT NULL AUTO_INCREMENT,
  `SeasonName` varchar(255) NOT NULL,
  `SeasonOrder` int(11) NOT NULL,
  `SeasonNameCV` varchar(255) DEFAULT NULL,
  `SeasonNumericValue` float NOT NULL,
  `DataValuesMapperID` int(11) NOT NULL,
  PRIMARY KEY (`SeasonalNumericValueID`),
  KEY `fk_SeasonalNumericValues_CV_SeasonName` (`SeasonNameCV`),
  KEY `fk_SeasonalNumericValues_DataValuesMapper` (`DataValuesMapperID`),
  CONSTRAINT `fk_SeasonalNumericValues_CV_SeasonName` FOREIGN KEY (`SeasonNameCV`) REFERENCES `CV_SeasonName` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SeasonalNumericValues_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeasonalNumericValues`
--

LOCK TABLES `SeasonalNumericValues` WRITE;
/*!40000 ALTER TABLE `SeasonalNumericValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeasonalNumericValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sources`
--

DROP TABLE IF EXISTS `Sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sources` (
  `SourceID` int(11) NOT NULL AUTO_INCREMENT,
  `SourceName` varchar(500) NOT NULL,
  `SourceWebpage` varchar(500) DEFAULT NULL,
  `SourceCitation` varchar(500) DEFAULT NULL,
  `PersonID` int(11) NOT NULL,
  `Description` text,
  PRIMARY KEY (`SourceID`),
  KEY `fk_Sources_People` (`PersonID`),
  CONSTRAINT `fk_Sources_People` FOREIGN KEY (`PersonID`) REFERENCES `People` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sources`
--

LOCK TABLES `Sources` WRITE;
/*!40000 ALTER TABLE `Sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeSeries`
--

DROP TABLE IF EXISTS `TimeSeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeSeries` (
  `TimeSeriesID` int(11) NOT NULL AUTO_INCREMENT,
  `YearType` varchar(50) NOT NULL,
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
  CONSTRAINT `fk_TimeSeries_CV_AggregationStatistic` FOREIGN KEY (`AggregationStatistiCV`) REFERENCES `CV_AggregationStatistic` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeSeries_CV_Units` FOREIGN KEY (`IntervalTimeUnitCV`) REFERENCES `CV_Units` (`Name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TimeSeries_DataValuesMapper` FOREIGN KEY (`DataValuesMapperID`) REFERENCES `DataValuesMapper` (`DataValuesMapperID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSeries`
--

LOCK TABLES `TimeSeries` WRITE;
/*!40000 ALTER TABLE `TimeSeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeSeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeSeriesValues`
--

DROP TABLE IF EXISTS `TimeSeriesValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeSeriesValues` (
  `TimeSeriesValueID` int(11) NOT NULL AUTO_INCREMENT,
  `TimeSeriesID` int(11) NOT NULL,
  `DateTimeStamp` datetime NOT NULL,
  `Value` float NOT NULL,
  PRIMARY KEY (`TimeSeriesValueID`),
  KEY `fk_TimeSeriesValues_TimeSeries` (`TimeSeriesID`),
  CONSTRAINT `fk_TimeSeriesValues_TimeSeries` FOREIGN KEY (`TimeSeriesID`) REFERENCES `TimeSeries` (`TimeSeriesID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSeriesValues`
--

LOCK TABLES `TimeSeriesValues` WRITE;
/*!40000 ALTER TABLE `TimeSeriesValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `TimeSeriesValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WaMDaMVersion`
--

DROP TABLE IF EXISTS `WaMDaMVersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WaMDaMVersion` (
  `VersionNumber` decimal(2,0) NOT NULL,
  PRIMARY KEY (`VersionNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WaMDaMVersion`
--

LOCK TABLES `WaMDaMVersion` WRITE;
/*!40000 ALTER TABLE `WaMDaMVersion` DISABLE KEYS */;
/*!40000 ALTER TABLE `WaMDaMVersion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-18 13:39:35
