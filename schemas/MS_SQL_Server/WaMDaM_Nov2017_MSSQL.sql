-- Adel Abdallah, PhD Candidate, Utah State University, Nov 2017

--This is a Data Definition Language (DDL) script that
--generates a blank schema of the Water Management Data Model (WaMDaM)
-- for Microsoft SQL Server database.

-- Generated by Adel Abdallah Nov, 2017 based on WaMDaM XML design named WaMDaM_DBWrench_Schema.xml generated by DbWrench V4.04 @ http://www.dbwrench.com/
-- WaMDaM All rights reserved. See BSD 3-Clause Licence @ https://github.com/WamdamProject/WaMDaM-software-ecosystem 

-- To create a blank WaMDaM database in SQL Server,
-- Open SQL Server, Click File >> New >> Query with Current Condition
-- Simply copy all this script and paste into the new window of "create query"
-- Then click "execute". The script should run successfully and create the 41 empty tables of WaMDaM

----------------------------------------------------------------------------------------
-- Drop the database called 'WaMDaM' if it exists and then create a new database called 'WaMDaM'
USE master;
GO

IF DB_ID(N'WaMDaM') IS NOT NULL
DROP DATABASE WaMDaM;
GO

CREATE DATABASE WaMDaM;
GO

USE WaMDaM;
GO

CREATE SCHEMA WaMDaM;
GO

/***************************************************************************/
/******************************* CREATE CVS ********************************/
/***************************************************************************/

CREATE TABLE WaMDaM.CV_AggregationStatistic (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_AttributeDataType (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_AttributeName (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Category varchar (255)  NULL,
	Definition varchar (5000)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_DescriptorValues (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	AttributeName varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_DualValueMeaning (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	BooleanValue binary (1)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_ElectronicFileFormat (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_ElevationDatum (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_InstanceName (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_MethodType (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_ObjectType (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_ObjectTypology (
	Name varchar (50)  NOT NULL,
	Term varchar (50)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_SeasonName (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (255)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_SpatialReference (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NULL,
	SourceVocabularyURI varchar (5000)  NULL,
	PRIMARY KEY (Name)
)
CREATE TABLE WaMDaM.CV_Units (
	Name varchar (255)  NOT NULL,
	Term varchar (255)  NOT NULL,
	Definition varchar (5000)  NULL,
	Category varchar (255)  NOT NULL,
	UnitSystem varchar (255)  NULL,
	UnitAbbreviation char (50)  NOT NULL,
	SourceVocabularyURI varchar (5000)  NULL,
	PRIMARY KEY (Name)
)
/***************************************************************************/
/************************* CREATE DATASETSTRUCTURE *************************/
/***************************************************************************/

CREATE TABLE WaMDaM.AttributeCategory (
	AttributeCategoryID int  IDENTITY (1,1) NOT NULL,
	AttributeCategoryName varchar (255)  NOT NULL,
	CategoryDefinition text   NULL,
	PRIMARY KEY (AttributeCategoryID)
)
CREATE TABLE WaMDaM.Attributes (
	AttributeID int  IDENTITY (1,1) NOT NULL,
	AttributeName varchar (255)  NOT NULL,
	AttributeNameCV varchar (255)  NULL,
	ObjectTypeID int   NOT NULL,
	UnitName varchar (255)  NOT NULL,
	UnitNameCV varchar (255)  NULL,
	AttributeDataTypeCV varchar (255)  NOT NULL,
	AttributeCategoryID int   NULL,
	ModelInputOrOutput char (50)  NULL,
	AttributeDescription text   NULL,
	PRIMARY KEY (AttributeID)
)
CREATE TABLE WaMDaM.Datasets (
	DatasetID int  IDENTITY (1,1) NOT NULL,
	DatasetName varchar (255)  NOT NULL,
	DatasetAcronym  varchar (255)  NOT NULL,
	SourceID int   NOT NULL,
	Description text   NULL,
	PRIMARY KEY (DatasetID)
)
CREATE TABLE WaMDaM.ObjectCategory (
	ObjectCategoryID int  IDENTITY (1,1) NOT NULL,
	ObjectCategoryName varchar (255)  NOT NULL,
	CategoryDefinition text   NULL,
	PRIMARY KEY (ObjectCategoryID)
)
CREATE TABLE WaMDaM.ObjectTypes (
	ObjectTypeID int  IDENTITY (1,1) NOT NULL,
	ObjectType varchar (255)  NOT NULL,
	ObjectTypeCV varchar (255)  NULL,
	ObjectTypologyCV varchar (50)  NOT NULL,
	Icons binary   NULL,
	Description text   NULL,
	ObjectCategoryID int   NULL,
	DatasetID int   NOT NULL,
	PRIMARY KEY (ObjectTypeID)
)
CREATE TABLE WaMDaM.WaMDaMVersion (
	VersionNumber decimal (2)  NOT NULL,
	PRIMARY KEY (VersionNumber)
)
/***************************************************************************/
/**************************** CREATE DATAVALUES ****************************/
/***************************************************************************/

CREATE TABLE WaMDaM.DataValuesMapper (
	DataValuesMapperID int  IDENTITY (1,1) NOT NULL,
	PRIMARY KEY (DataValuesMapperID)
)
CREATE TABLE WaMDaM.DescriptorValues (
	DescriptorValueID int  IDENTITY (1,1) NOT NULL,
	DescriptorValue varchar (500)  NOT NULL,
	DescriptorValueCV varchar (255)  NULL,
	DataValuesMapperID int   NOT NULL,
	PRIMARY KEY (DescriptorValueID)
)
CREATE TABLE WaMDaM.DualValues (
	DualValueID int  IDENTITY (1,1) NOT NULL,
	DualValueMeaningCV varchar (255)  NOT NULL,
	DataValuesMapperID int   NOT NULL,
	PRIMARY KEY (DualValueID)
)
CREATE TABLE WaMDaM.ElectronicFiles (
	ElectronicFileID int  IDENTITY (1,1) NOT NULL,
	ElectronicFileName varchar (255)  NOT NULL,
	ElectronicFile binary   NOT NULL,
	ElectronicFileFormatCV varchar (255)  NOT NULL,
	Description text   NULL,
	DataValuesMapperID int   NOT NULL,
	PRIMARY KEY (ElectronicFileID)
)
CREATE TABLE WaMDaM.MultiAttributeSeries (
	MultiAttributeSeriesID int  IDENTITY (1,1) NOT NULL,
	AttributeNameID int   NOT NULL,
	DataValuesMapperID int   NOT NULL,
	PRIMARY KEY (MultiAttributeSeriesID)
)
CREATE TABLE WaMDaM.MultiAttributeSeriesValues (
	MultiAttributeSeriesValueID int  IDENTITY (1,1) NOT NULL,
	MultiAttributeSeriesID int   NOT NULL,
	Value varchar (255)  NOT NULL,
	ValueOrder int   NOT NULL,
	PRIMARY KEY (MultiAttributeSeriesValueID)
)
CREATE TABLE WaMDaM.NumericValues (
	NumericValueID int  IDENTITY (1,1) NOT NULL,
	NumericValue float   NOT NULL,
	DataValuesMapperID int   NOT NULL,
	PRIMARY KEY (NumericValueID)
)
CREATE TABLE WaMDaM.SeasonalNumericValues (
	SeasonalNumericValueID int  IDENTITY (1,1) NOT NULL,
	SeasonName varchar (255)  NOT NULL,
	SeasonOrder int   NOT NULL,
	SeasonNameCV varchar (255)  NULL,
	SeasonNumericValue float   NOT NULL,
	DataValuesMapperID int   NOT NULL,
	PRIMARY KEY (SeasonalNumericValueID)
)
CREATE TABLE WaMDaM.TimeSeries (
	TimeSeriesID int  IDENTITY (1,1) NOT NULL,
	WaterOrCalendarYear varchar (50)  NOT NULL,
	AggregationStatistiCV varchar (255)  NOT NULL,
	AggregationInterval float   NOT NULL,
	IntervalTimeUnitCV varchar (255)  NOT NULL,
	BeginDateTime datetime   NULL,
	EndDateTime datetime   NULL,
	IsRegular bit   NULL,
	NoDataValue varchar (50)  NULL,
	Description text   NULL,
	DataValuesMapperID int   NOT NULL,
	PRIMARY KEY (TimeSeriesID)
)
CREATE TABLE WaMDaM.TimeSeriesValues (
	TimeSeriesValueID int  IDENTITY (1,1) NOT NULL,
	TimeSeriesID int   NOT NULL,
	DateTimeStamp datetime   NOT NULL,
	Value float   NOT NULL,
	PRIMARY KEY (TimeSeriesValueID)
)
/***************************************************************************/
/***************************** CREATE METADATA *****************************/
/***************************************************************************/

CREATE TABLE WaMDaM.Methods (
	MethodID int  IDENTITY (1,1) NOT NULL,
	MethodName varchar (255)  NOT NULL,
	MethodWebpage varchar (255)  NULL,
	MethodCitation varchar (500)  NULL,
	MethodTypeCV varchar (255)  NOT NULL,
	PersonID int   NOT NULL,
	Description text   NULL,
	PRIMARY KEY (MethodID)
)
CREATE TABLE WaMDaM.Organizations (
	OrganizationID int  IDENTITY (1,1) NOT NULL,
	OrganizationName varchar (255)  NOT NULL,
	OrganizationType varchar (255)  NULL,
	OrganizationWebpage varchar (255)  NULL,
	Description text   NULL,
	PRIMARY KEY (OrganizationID)
)
CREATE TABLE WaMDaM.People (
	PersonID int  IDENTITY (1,1) NOT NULL,
	PersonName varchar (255)  NOT NULL,
	Address varchar (255)  NULL,
	Email varchar (255)  NULL,
	Phone varchar (50)  NULL,
	PersonWebpage varchar (255)  NULL,
	Position varchar (255)  NULL,
	OrganizationID int   NOT NULL,
	PRIMARY KEY (PersonID)
)
CREATE TABLE WaMDaM.Sources (
	SourceID int  IDENTITY (1,1) NOT NULL,
	SourceName varchar (500)  NOT NULL,
	SourceWebpage varchar (500)  NULL,
	SourceCitation varchar (500)  NULL,
	PersonID int   NOT NULL,
	Description text   NULL,
	PRIMARY KEY (SourceID)
)
/***************************************************************************/
/***************************** CREATE NETWORKS *****************************/
/***************************************************************************/

CREATE TABLE WaMDaM.Connections (
	ConnectivityID int  IDENTITY (1,1) NOT NULL,
	LinkInstanceID int   NOT NULL,
	StartNodeInstanceID int   NOT NULL,
	EndNodeInstanceID int   NOT NULL,
	PRIMARY KEY (ConnectivityID)
)
CREATE TABLE WaMDaM.InstanceCategory (
	InstanceCategoryID int  IDENTITY (1,1) NOT NULL,
	InstanceCategory varchar (255)  NOT NULL,
	CategoryDefinition text   NULL,
	PRIMARY KEY (InstanceCategoryID)
)
CREATE TABLE WaMDaM.Instances (
	InstanceID int  IDENTITY (1,1) NOT NULL,
	InstanceName varchar (255)  NOT NULL,
	InstanceNameCV varchar (255)  NULL,
	Longitude_x float   NULL,
	Latitude_y float   NULL,
	Description text   NULL,
	InstanceCategoryID int   NULL,
	PRIMARY KEY (InstanceID)
)
CREATE TABLE WaMDaM.Mapping (
	MappingID int  IDENTITY (1,1) NOT NULL,
	AttributeID int   NOT NULL,
	InstanceID int   NOT NULL,
	SourceID int   NOT NULL,
	MethodID int   NOT NULL,
	DataValuesMapperID int   NULL,
	PRIMARY KEY (MappingID)
)
CREATE TABLE WaMDaM.MasterNetworks (
	MasterNetworkID int  IDENTITY (1,1) NOT NULL,
	MasterNetworkName varchar (255)  NOT NULL,
	SpatialReferenceNameCV varchar (255)  NOT NULL,
	VerticalDatumCV varchar (255)  NOT NULL,
	Description text   NULL,
	PRIMARY KEY (MasterNetworkID)
)
CREATE TABLE WaMDaM.ScenarioMapping (
	ScenarioMappingID int  IDENTITY (1,1) NOT NULL,
	ScenarioID int   NOT NULL,
	MappingID int   NOT NULL,
	PRIMARY KEY (ScenarioMappingID)
)
CREATE TABLE WaMDaM.Scenarios (
	ScenarioID int  IDENTITY (1,1) NOT NULL,
	ScenarioName varchar (255)  NOT NULL,
	ScenarioStartDate varchar (255)  NULL,
	ScenarioEndDate datetime   NULL,
	TimeStepValue int   NULL,
	TimeStepUnitCV varchar (255)  NULL,
	MasterNetworkID int   NOT NULL,
	Description text   NULL,
	PRIMARY KEY (ScenarioID)
)

ALTER TABLE WaMDaM.Attributes ADD CONSTRAINT fk_Attributes_CV_AttributeName
FOREIGN KEY (AttributeNameCV) REFERENCES WaMDaM.CV_AttributeName (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Attributes ADD CONSTRAINT fk_Attributes_CV_AttributeType
FOREIGN KEY (AttributeDataTypeCV) REFERENCES WaMDaM.CV_AttributeDataType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Attributes ADD CONSTRAINT fk_Attributes_CV_Units
FOREIGN KEY (UnitNameCV) REFERENCES WaMDaM.CV_Units (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Attributes ADD CONSTRAINT fk_Attributes_ObjectTypes
FOREIGN KEY (ObjectTypeID) REFERENCES WaMDaM.ObjectTypes (ObjectTypeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Attributes ADD CONSTRAINT fk_ObjectAttributes_AttributeCategory
FOREIGN KEY (AttributeCategoryID) REFERENCES WaMDaM.AttributeCategory (AttributeCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Datasets ADD CONSTRAINT fk_Datasets_Sources
FOREIGN KEY (SourceID) REFERENCES WaMDaM.Sources (SourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectTypes ADD CONSTRAINT fk_ObjectTypes_CV_ObjectTopology
FOREIGN KEY (ObjectTypologyCV) REFERENCES WaMDaM.CV_ObjectTypology (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectTypes ADD CONSTRAINT fk_ObjectTypes_CV_ObjectTypes
FOREIGN KEY (ObjectTypeCV) REFERENCES WaMDaM.CV_ObjectType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectTypes ADD CONSTRAINT fk_ObjectTypes_Datasets
FOREIGN KEY (DatasetID) REFERENCES WaMDaM.Datasets (DatasetID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ObjectTypes ADD CONSTRAINT fk_ObjectTypes_ObjectCategory
FOREIGN KEY (ObjectCategoryID) REFERENCES WaMDaM.ObjectCategory (ObjectCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.DescriptorValues ADD CONSTRAINT fk_DescriptorValues_DataValuesMapper
FOREIGN KEY (DataValuesMapperID) REFERENCES WaMDaM.DataValuesMapper (DataValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.DescriptorValues ADD CONSTRAINT fk_TextControlled_CV_TextControlledValue
FOREIGN KEY (DescriptorValueCV) REFERENCES WaMDaM.CV_DescriptorValues (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.DualValues ADD CONSTRAINT fk_BooleanValues_CV_BooleanValueMeaning
FOREIGN KEY (DualValueMeaningCV) REFERENCES WaMDaM.CV_DualValueMeaning (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.DualValues ADD CONSTRAINT fk_DualValues_DataValuesMapper
FOREIGN KEY (DataValuesMapperID) REFERENCES WaMDaM.DataValuesMapper (DataValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ElectronicFiles ADD CONSTRAINT fk_ElectronicFiles_DataValuesMapper
FOREIGN KEY (DataValuesMapperID) REFERENCES WaMDaM.DataValuesMapper (DataValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ElectronicFiles ADD CONSTRAINT fk_Files_CV_FileFormat
FOREIGN KEY (ElectronicFileFormatCV) REFERENCES WaMDaM.CV_ElectronicFileFormat (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MultiAttributeSeries ADD CONSTRAINT fk_MultiAttributeSeries_DataValuesMapper
FOREIGN KEY (DataValuesMapperID) REFERENCES WaMDaM.DataValuesMapper (DataValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MultiAttributeSeries ADD CONSTRAINT fk_MultiColumnArray_DataValuesMapper
FOREIGN KEY (AttributeNameID) REFERENCES WaMDaM.DataValuesMapper (DataValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MultiAttributeSeriesValues ADD CONSTRAINT fk_MultiAttributeSeriesValues_MultiAttributeSeries
FOREIGN KEY (MultiAttributeSeriesID) REFERENCES WaMDaM.MultiAttributeSeries (MultiAttributeSeriesID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.NumericValues ADD CONSTRAINT fk_NumericValues_DataValuesMapper
FOREIGN KEY (DataValuesMapperID) REFERENCES WaMDaM.DataValuesMapper (DataValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.SeasonalNumericValues ADD CONSTRAINT fk_SeasonalNumericValues_CV_SeasonName
FOREIGN KEY (SeasonNameCV) REFERENCES WaMDaM.CV_SeasonName (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.SeasonalNumericValues ADD CONSTRAINT fk_SeasonalNumericValues_DataValuesMapper
FOREIGN KEY (DataValuesMapperID) REFERENCES WaMDaM.DataValuesMapper (DataValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TimeSeries ADD CONSTRAINT fk_TimeSeries_CV_AggregationStatistic
FOREIGN KEY (AggregationStatistiCV) REFERENCES WaMDaM.CV_AggregationStatistic (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TimeSeries ADD CONSTRAINT fk_TimeSeries_CV_Units
FOREIGN KEY (IntervalTimeUnitCV) REFERENCES WaMDaM.CV_Units (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TimeSeries ADD CONSTRAINT fk_TimeSeries_DataValuesMapper
FOREIGN KEY (DataValuesMapperID) REFERENCES WaMDaM.DataValuesMapper (DataValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.TimeSeriesValues ADD CONSTRAINT fk_TimeSeriesValues_TimeSeries
FOREIGN KEY (TimeSeriesID) REFERENCES WaMDaM.TimeSeries (TimeSeriesID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Methods ADD CONSTRAINT fk_Methods_CV_MethodType
FOREIGN KEY (MethodTypeCV) REFERENCES WaMDaM.CV_MethodType (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Methods ADD CONSTRAINT fk_Methods_People
FOREIGN KEY (PersonID) REFERENCES WaMDaM.People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.People ADD CONSTRAINT fk_People_Organizations
FOREIGN KEY (OrganizationID) REFERENCES WaMDaM.Organizations (OrganizationID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Sources ADD CONSTRAINT fk_Sources_People
FOREIGN KEY (PersonID) REFERENCES WaMDaM.People (PersonID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Connections ADD CONSTRAINT fk_Connections_Instances
FOREIGN KEY (EndNodeInstanceID) REFERENCES WaMDaM.Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Connections ADD CONSTRAINT fk_Connections_Instances_Link
FOREIGN KEY (LinkInstanceID) REFERENCES WaMDaM.Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Connections ADD CONSTRAINT fk_Connections_Instances_startNode
FOREIGN KEY (StartNodeInstanceID) REFERENCES WaMDaM.Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Instances ADD CONSTRAINT fk_Instances_CV_InstanceName
FOREIGN KEY (InstanceNameCV) REFERENCES WaMDaM.CV_InstanceName (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Instances ADD CONSTRAINT fk_Instances_InstanceCategory
FOREIGN KEY (InstanceCategoryID) REFERENCES WaMDaM.InstanceCategory (InstanceCategoryID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_Mapping_Attributes
FOREIGN KEY (AttributeID) REFERENCES WaMDaM.Attributes (AttributeID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_Mapping_DataValuesMapper
FOREIGN KEY (DataValuesMapperID) REFERENCES WaMDaM.DataValuesMapper (DataValuesMapperID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_Mapping_Instances
FOREIGN KEY (InstanceID) REFERENCES WaMDaM.Instances (InstanceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_Mapping_Methods
FOREIGN KEY (MethodID) REFERENCES WaMDaM.Methods (MethodID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Mapping ADD CONSTRAINT fk_Mapping_Sources
FOREIGN KEY (SourceID) REFERENCES WaMDaM.Sources (SourceID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MasterNetworks ADD CONSTRAINT fk_MasterNetworks_CV_SpatialReference
FOREIGN KEY (SpatialReferenceNameCV) REFERENCES WaMDaM.CV_SpatialReference (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.MasterNetworks ADD CONSTRAINT fk_MasterNetworks_CV_VerticalDatum
FOREIGN KEY (VerticalDatumCV) REFERENCES WaMDaM.CV_ElevationDatum (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ScenarioMapping ADD CONSTRAINT fk_ScenarioMapping_Mapping
FOREIGN KEY (MappingID) REFERENCES WaMDaM.Mapping (MappingID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.ScenarioMapping ADD CONSTRAINT fk_ScenarioMapping_Scenarios
FOREIGN KEY (ScenarioID) REFERENCES WaMDaM.Scenarios (ScenarioID)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Scenarios ADD CONSTRAINT fk_Scenarios_CV_Units
FOREIGN KEY (TimeStepUnitCV) REFERENCES WaMDaM.CV_Units (Name)
ON UPDATE NO ACTION ON DELETE NO ACTION

ALTER TABLE WaMDaM.Scenarios ADD CONSTRAINT fk_Scenarios_MasterNetworks
FOREIGN KEY (MasterNetworkID) REFERENCES WaMDaM.MasterNetworks (MasterNetworkID)
ON UPDATE NO ACTION ON DELETE NO ACTION