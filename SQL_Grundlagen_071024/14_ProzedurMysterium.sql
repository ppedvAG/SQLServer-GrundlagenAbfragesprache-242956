-- Varianten
USE Northwind
GO

-- Versuch Nr.1
CREATE PROCEDURE spNewCustomer_Test1
@CustomerID char(5) = '12345', @CompanyName varchar(40) = 'Hallo123',
@Country varchar(20) = 'GermanyGermanyGerman', @City varchar(30) = 'Berlin'
AS
INSERT INTO Customers(CustomerID, CompanyName, Country, City)
VALUES(@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer_Test1
SELECT * FROM Customers
GO

-- Versuch Nr.2
CREATE PROCEDURE spNewCustomer_Test2
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(20), @City varchar(30)
AS
INSERT INTO Customers(CustomerID, CompanyName, Country, City)
VALUES(@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer_Test2 '12345', 'ppedv Ag', 'GermanyGermanyGermany', 'Berlin'
SELECT * FROM Customers
GO

-- Versuch Nr.3
CREATE PROCEDURE spNewCustomer_Test3
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(10), @City varchar(30)
AS
INSERT INTO Customers(CustomerID, CompanyName, Country, City)
VALUES(@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer_Test3 '12345', 'ppedv Ag', 'GermanyGermanyGermany', 'Berlin'
SELECT * FROM Customers
GO

-- Versuch Nr.4
CREATE PROCEDURE spNewCustomer_Test4
@CustomerID char(5) = '67890', @CompanyName varchar(40) = 'Hallo123',
@Country varchar(10) = 'GermanyGermanyGerman', @City varchar(30) = 'Berlin'
AS
INSERT INTO Customers(CustomerID, CompanyName, Country, City)
VALUES(@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer_Test4
SELECT * FROM Customers