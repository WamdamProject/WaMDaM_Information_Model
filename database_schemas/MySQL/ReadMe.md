# WaMDaM for MySQL

## Two options to create a blank WaMDaM schema for MySQL (choose one)
**1. Use query window to create a new db using script**  
Open MySQL Workbench, create a new server connection. Remember the user name for use later.  
Create a New SQL Tab for Executing queries
Simply copy all this [script](/database_schemas/MySQL/WaMDaM_MySQL.sql) and paste into the new window of "create query"
Then click execute. The script should run successfully and create the 41 empty tables of WaMDaM  

Attention: MySQL Workbench is configured by default to create lower case tables. See [direction here][1] on how to configure it to create upper case table names

[1]:https://stackoverflow.com/questions/28540573/lower-case-table-names-set-to-2-workbench-still-does-not-allow-lowercase-databa


**2. Use a "Restore" option**    
Alternatively, you could restore a [copy](/database_schemas/MySQL/Blank_db_copy) of WaMDaM MySQL database

