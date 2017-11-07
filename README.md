# WaMDaM_Information_Model

The Water Management Data Model (WaMDaM) is information model to organize water management data with contextual metadata and controlled vocabulary for multiple datasets and models. WaMDaM is implemented in a relational model and works for SQLite, MySQL, PostgreSQL, and Microsoft SQL Server. 

## 1. Information Model Concepts and their description

abc 

![](Documentation/WaMDaM_Conceptual.jpg)


**1. Dataset Structure**


**2. Networks**


**3. Metadata**


**4. Data Values**


**5. Controlled Vocabulary**



## 2. Entity Relationship diagrams for WaMDaM schema 1.0

WaMDaM schema or entity relationship diagram is available at this interactive site. 
![](https://wamdamproject.github.io/WaMDaM_Information_Model/diagrams/01_WaMDaM.html)


## 3. Script to create blank WaMDaM databases OR copies of db to restore 
* [Microsoft SQL Server](schemas/MS_SQL_Server)
* [MySQL](schemas/MySQL)
* [PostgreSQL](/schemas/PostgreSQL)
* [SQLite](/schemas/SQLite)



## 4. WaMDaM Wizard to load water management data from Excel and other sources into WaMDaM SQLite database 
The WaMDaM Wizard is an open-source, cross-platform, Python-based graphical user software to interact with WaMDaM database. By using the Wizard, users are not expected to understand the underlying WaMDaM database of schema

[Download the Wizard GUI ](https://github.com/WamdamProject/WaMDaM_Wizard#download-the-wizard-gui-for-windows-7-and-10-64-bit-operating-systems)


## 5. Data Use Cases to demonstrate WaMDaM capabilities 

Demonstrate how WaMDaM enables systematic data query and comparisons across multiple different models and datasets.

[use cases and application](https://github.com/WamdamProject/WaMDaM_UseCases)


## 6. Controlled Vocabularies
View and the online moderated registry which aims to promote consistent terminology (i.e., Controlled Vocabularies-(CVs)) to describe water system components and their attributes across datasets, models, and users, while still retaining the native terms. Registering your model's native terms against these CVs will allow you to relate, query, and compare all of your water management data within a single database. Submit new terms to support your data and expand the registery.  

[Controlled Vocabularies](http://vocabulary.wamdam.org/)


## 7. Publications throughout the development of WaMDaM
List of all the presentations and publications on WaMDaM products since inspection Edit
[Publications](https://github.com/WamdamProject/WaMDaM_Publications)



### Licensing  
WaMDaM and materials in this GitHub repository are disturbed under a BSD 3-Clause [LICENSE](/LICENSE). 
For alternative licensing arrangements, contact Adel M. Abdallah or David E. Rosenberg directly.    


### Sponsors and Credit  
WaMDaM and related software development have been developed under funding from several different sources. It was primarily supported by the National Science Foundation <a href="http://www.nsf.gov/awardsearch/showAward?AWD_ID=1135482" target="_blank">CI-Water Project</a> and later from the <a href="https://www.nsf.gov/awardsearch/showAward?AWD_ID=1208732" target="_blank">iUtah Project</a>. 
Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.    

WaMDaM has been developed at and also additionally funded by the Utah Water Research Lab at Utah State University, Logan Utah during the period of August, 2012-2017. Thanks to Dr. Steven Burian at the Unviversity of Utah, Salt Lake City Utah for hosting Adel Abdallah as a visiting scholar 2014-2017.  

