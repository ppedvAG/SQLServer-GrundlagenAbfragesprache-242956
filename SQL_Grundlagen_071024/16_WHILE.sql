USE Northwind
/*******************************************/

-- Variablen allgemein

/*******************************************/

DECLARE @OrderID int = 10250

SELECT * FROM Orders
WHERE OrderID = @OrderID

SET @OrderID = 10251

SELECT * FROM Orders
WHERE OrderID = @OrderID


/*******************************************/

-- WHILE - leitet eine Schleifenanweisung ein

/*******************************************/

DECLARE @Counter INT = 1

WHILE @Counter <= 5
BEGIN
SELECT 'Hallo'
SET @Counter = @Counter + 1 
END

-- Endlosschleife, aufpassen auf den Computer
WHILE 1=1
Begin 
SELECT 'Hallo'
END
GO

-- Zus�tzliche IF Pr�fung innerhlab der WHILE Schleife

DECLARE @CounterTwo INT = 0

WHILE @CounterTwo <= 5
BEGIN

IF @CounterTwo = 2 
BEGIN
SELECT 'Bin bei 2' 
END
ELSE BEGIN SELECT @CounterTwo END

SET @CounterTwo = @CounterTwo + 1

END
