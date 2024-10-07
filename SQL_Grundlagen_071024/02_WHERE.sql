USE Northwind

-- WHERE: filtert Ergebniszeilen
SELECT * FROM Customers
WHERE Country = 'Germany'

-- = sucht nach exakten Treffern
SELECT * FROM Customers
WHERE Country = 'Germany'

-- alle boolschen Vergleichsoperatoren verwenden
-- (>, < >=, != bzw <>, <=)

SELECT * FROM Orders
WHERE Freight > 500

SELECT * FROM Orders
WHERE Freight < 500

SELECT * FROM Customers
WHERE Country != 'Germany'

-- Kombinieren von WHERE Ausdrücken mit AND oder OR
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin'

SELECT * FROM Customers
WHERE Country = 'Germany' OR City = 'Paris'

-- AND = "Beide Bedingungen" müssen wahr sein
-- OR = muss nur eine Bedingung wahr sein
-- Können beliebig oft kombinieren

-- "Vorsicht" bei Kombination aus AND und OR
SELECT * FROM Customers
WHERE (City = 'Paris' OR City = 'Berlin') AND Country = 'Germany'
-- AND "ist stärker bindent" als OR; Notfalls klammern setzen

SELECT * FROM Orders
WHERE Freight >= 100 AND Freight <= 500

-- Alternative mit Between, Randwerte mit inbegriffen
SELECT * FROM Orders
WHERE Freight BETWEEN 100 AND 500

SELECT * FROM Customers
WHERE Country = 'Brazil' OR Country = 'Germany' OR Country = 'France'

-- Alternative IN (Wert1, Wert2)
SELECT * FROM Customers
WHERE Country IN ('Brazil', 'Germany', 'France')
-- IN verbindet mehrere OR Bedingungen die sich auf die selbe Spalte beziehen

-- Übungen:
-- 1. Alle ContactNames die als Title "Owner" haben
SELECT * FROM Customers
WHERE ContactTitle = 'Owner'

-- 2. Alle Order Details die ProductID 43 bestellt haben
SELECT * FROM [Order Details]
WHERE ProductID = 43

-- 3. Alle Kunden aus Paris, Berlin, Madrid oder Brasilien
SELECT * FROM Customers
WHERE City IN('Paris', 'Berlin', 'Madrid') OR Country = 'Brazil'

-- 4. Alle Kunden die eine Fax Nummer haben (Fax mit NULL rausfiltern)
SELECT * FROM Customers
WHERE Fax IS NOT NULL