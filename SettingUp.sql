-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = N'KoreAssignment_Ravirajsinh_Jadeja')
BEGIN
    CREATE DATABASE [KoreAssignment_Ravirajsinh_Jadeja];
END
GO

USE [KoreAssignment_Ravirajsinh_Jadeja]
GO

-- Create Staging Schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'stg')
BEGIN
    EXEC('CREATE SCHEMA stg');
END
GO

-- Create Production Schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'prod')
BEGIN
    EXEC('CREATE SCHEMA prod');
END
GO

-- Create Staging Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'stg.Users') AND type in (N'U'))
BEGIN
    CREATE TABLE stg.Users (
        StgID INT IDENTITY(1,1) PRIMARY KEY,
        UserID INT,
        FullName NVARCHAR(255),
        Age INT,
        Email NVARCHAR(255),
        RegistrationDate DATE,
        LastLoginDate DATE,
        PurchaseTotal FLOAT
    );
END
GO

-- Create Production Table
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'prod.Users') AND type in (N'U'))
BEGIN
    CREATE TABLE prod.Users (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        UserID INT,
        FullName NVARCHAR(255),
        Age INT,
        Email NVARCHAR(255),
        RegistrationDate DATE,
        LastLoginDate DATE,
        PurchaseTotal FLOAT,
        RecordLastUpdated DATETIME DEFAULT GETDATE()
    );
END
GO
