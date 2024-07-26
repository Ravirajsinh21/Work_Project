# Work_Project
**SSIS ETL Project (Ravirajsinh Jadeja)**

## 1) Overview
This project involves processing data from a CSV file into a SQL database using SSIS. It includes setup scripts for the database, initial data loading, and an SSIS package for the ETL process.

## 2) Setup and Execution

### A) Install Software:
- **Visual Studio with SSIS**
- **Microsoft SQL Server Management Studio (SSMS)**

### B) Database Setup:
1. **Run `SettingUp.sql`** to create the SQL database and tables.
2. **Load Initial Data**: Execute `InitialData.sql` to populate the `prod.user` table.
3. **Run SSIS Package**:
   - Open `KoreAssignment_Ravirajsinh_Jadeja.dtsx` in Visual Studio.
   - Execute the package to process the CSV data:
     - Load data from the CSV file.
     - Clean and transform data using the Script Component.
     - Load data into the staging table.
     - Transfer new records from the staging table to the production table.

## 3) Approach and Methodologies

### Data Flow Tasks
The SSIS package includes two main data flow tasks:

### a) CSV to Staging Table:
**Goal**: Load raw data from the CSV file into a staging table for initial processing.
- **Transformations**:
  - **Script Component**: Cleans and transforms the data, handling null and invalid values.
  - **Conditional Split**: Filters out rows with a null `UserID`.
  - **Derived Column**: Converts and standardizes data types.
  - **Load Data**: Cleaned data is then loaded into the staging table for further processing.

### b) Staging to Production Table:
**Goal**: Move processed data from the staging table to the production table.
- **Transformations**:
  - **Sort and Remove Duplicates**: Sorts data by `UserID` and removes duplicates.
  - **Lookup Transformation**: Checks for existing `UserID` values in the production table and identifies new records.
  - **Load Data**: Inserts new records into the production table, updating it with the latest data.

**Note**: Depending on business needs, various transformations can be added to handle data as required. For now:
- **Null** and larger `PurchaseTotal` values have been set to **0**.
- **Invalid** or null dates have been given a default date of **`01/01/2001`**.
- **Null `UserID`** records have been removed.
- **Invalid** or null `Age` values have been set to **0** (could be adjusted to average if needed).
- Removed data is not stored to avoid unnecessary storage but can be stored separately if required.
