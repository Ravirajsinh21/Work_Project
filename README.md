# Work_Project
SSIS ETL Project (Ravirajsinh Jadeja)

##1) Overview:
This project involves processing data from a CSV file into a SQL database using SSIS. It includes setup scripts for the database, initial data loading, and an SSIS package for the ETL process.


##2) Setup and Execution
#A) Install Software:

Visual Studio with SSIS
Microsoft SQL Server Management Studio (SSMS)

#b) Database Setup: Run SettingUp.sql to create the SQL database and tables.
Load Initial Data: Execute InitialData.sql to populate the prod.user table.
Run SSIS Package: Open KoreAssignment_Ravirajsinh_Jadeja.dtsx in Visual Studio.
Execute the package to process the CSV data:
	Load data from the CSV file.
	Clean and transform data using the Script Component.
	Load data into the staging table.
	Transfer new records from the staging table to the production table.


##3) Approach and Methodologies
Data Flow Tasks
The SSIS package includes two main data flow tasks:

#a) CSV to Staging Table:

Goal: Load raw data from the CSV file into a staging table for initial processing.
Transformations:
	Script Component: Cleans and transforms the data. Dealing with null and invalid values.
	Conditional Split: Filters out rows with a null UserID and removes it.
	Derived Column: Converts and standardizes data types.
	Load Data: Cleaned data is then loaded into the staging table for further processing.

#b) Staging to Production Table:

Goal: Move processed data from the staging table to the production table.
Transformations:
	Sort and Remove Duplicates: Sorts data by UserID and removes any duplicates.
	Lookup Transformation: Checks for existing UserID values in the production table and identifies new 		records.
	Load Data: Inserts new records into the production table, updating it with the latest data. 

##NOTE: Depending on business needs, various transformations can be added to handle data as required. For now:
	Null and larger Purchase Total has been made 0.
	Invalid or null dates have been given a defualt date of 01/01/2001
	Null User ID records have been removed.
	Invalid or null Age has been made 0, However could be made average if needed.
	Removed data is not stored to avoid unnecessary storage. However, Can be stored separately.
