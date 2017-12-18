## WaMDaM for SQLite

## Two options to create a blank WaMDaM schema for SQLite (choose one) 

**1. Use query window to create a new db using script**   
To create a blank WaMDaM SQLite database, 
Use the SQLite Manager Add-on to Mozilla Firefox
Create a new empty database. Click on the Execute SQL button and delete the text "SELECT * FROM tablename"
Simply copy all this [script](/schemas/SQLite/WaMDaM_Nov2017_SQLite.sql) and paste into this Execute SQL window
Then click Run SQL. The script should run successfully and create the 41 empty tables of WaMDaM

**2. Use the "Connect to" option**    
Alternativily, you could connect to a [copy](/schemas/SQLite/Blank_db_copy) of WaMDaM SQLite database
