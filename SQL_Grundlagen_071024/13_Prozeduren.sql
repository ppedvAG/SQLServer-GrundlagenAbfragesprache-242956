USE Northwind
GO

/*******************************************/

-- Stored Procedures / gespeicherte Prozeduren

/*******************************************/

/*
	- Sind gespeicherte SQL Anweisungen (nicht nur SELECT, sondern auch alles andere)
	- Arbeiten mit Variablen 
	- Praktisch zum "automatisieren" von Code
	- Prozeduren verwenden ihren Abfrageplan jedes mal wieder
*/

CREATE PROCEDURE spRechnungsByOrderID @orderid INT
AS
SELECT * FROM Orders
WHERE OrderID = @orderid
GO

-- Prozedur ausführen
EXEC spRechnungsByOrderID 10250
go

-- Default Werte (Standard Werte)
CREATE PROCEDURE OrderIDDefault @orderid INT = 10250
AS 
SELECT * FROM Orders
WHERE OrderID = @orderid
GO

EXEC OrderIDDefault 
GO

-- Insert
CREATE PROCEDURE spNewCustomer
@CustomerID char(5), @CompanyName varchar(40),
@Country varchar(30), @City varchar(30)
AS
INSERT INTO Customers(CustomerID, CompanyName, Country, City)
VALUES(@CustomerID, @CompanyName, @Country, @City)
GO

EXEC spNewCustomer 'ALDIS', 'ppedv AG', 'Germany', 'Burghausen'
EXEC spNewCustomer LILDL, LidlGmbH, Germany, Burghausen

SELECT * FROM Customers
