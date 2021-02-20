/*
This script is gotten from https://docs.microsoft.com/en-us/sql/azure-data-studio/quickstart-sql-server?view=sql-server-2017
Just a quick demo on the features on Azure Data Studio
*/

-- Create TutorialDB database
USE master
GO
IF NOT EXISTS (
 SELECT name
 FROM sys.databases
 WHERE name = 'TutorialDB'
)
 CREATE DATABASE [TutorialDB];
GO
IF SERVERPROPERTY('ProductVersion') > '12'
 ALTER DATABASE [TutorialDB] SET QUERY_STORE=ON;
GO

-- Create table
-- Create a new table called 'Customers' in schema 'dbo'
-- Drop the table if it already exists
USE TutorialDB
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
 DROP TABLE dbo.Customers;
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Customers
(
 CustomerId int NOT NULL PRIMARY KEY, -- primary key column
 Name nvarchar(50) NOT NULL,
 Location nvarchar(50) NOT NULL,
 Email nvarchar(50) NOT NULL
);
GO


--Insert data into Customers
-- Insert rows into table 'Customers'
USE TutorialDB
INSERT INTO dbo.Customers
 ([CustomerId], [Name], [Location], [Email])
VALUES
 ( 1, N'Orlando', N'Australia', N''),
 ( 2, N'Keith', N'India', N'keith0@adventure-works.com'),
 ( 3, N'Donna', N'Germany', N'donna0@adventure-works.com'),
 ( 4, N'Janet', N'United States', N'janet1@adventure-works.com')
GO

--Query table
-- Select rows from table 'Customers'
USE TutorialDB
SELECT * FROM dbo.Customers;