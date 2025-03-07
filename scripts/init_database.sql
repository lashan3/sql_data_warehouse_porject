-- Database Maintenance Script

/*
This script manages the `DataWarehouse` database by:

1. Checking and Dropping Existing Database: It checks if the `DataWarehouse` database exists. If it does, the script switches the database to single-user mode, rolls back any active transactions, and drops the database.
2. Creating New Database and Schemas: It creates a new `DataWarehouse` database and three schemas (bronze, silver, gold).

Warnings:
- Data Loss: This script will delete all data in the existing `DataWarehouse` database.
- Service Disruption: It will terminate all active connections to the database.

Prerequisites:
- Administrative privileges in SQL Server.

*/

USE master;
GO

-- Check if the database already exists or not
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN    
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create new database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
