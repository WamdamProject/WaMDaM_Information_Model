# WaMDaM for Microsoft SQL Server

## Two options to create a blank WaMDaM schema for Microsoft SQL Server (choose one)
**1. Use query window to create a new db using script**
To create a blank WaMDaM database in MS SQL Server, 
Open SQL Server, Click File >> New >> Query with Current Condition 
Simply copy all this [script](https://github.com/WamdamProject/WaMDaM_Information_Model/blob/master/schemas/MS_SQL_Server/WaMDaM_Nov2017_MSSQL.sql) and paste into the new window of "create query"  
Then click "execute". The script should run successfully and create the 41 empty tables of WaMDaM 

**2. Attach a blank copy to MS SQL Server database**
Use this WaMDaM [copy](/schemas/MS_SQL_Server/blank_db_copy) and attach it to the MS SQL Server database
