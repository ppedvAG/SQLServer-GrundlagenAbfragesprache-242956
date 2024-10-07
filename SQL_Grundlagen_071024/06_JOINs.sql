USE Northwind

-- Beziehung zwischen Fremd- & Primärschlüssel suchen

SELECT * FROM Customers
SELECT * FROM Orders

/*
	Join syntax:
	SELECT * FROM TabelleA
	INNER JOIN TabelleB on A.Schlüssel = B.Schlüssel
*/

SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- Schlüssel: OrderID
-- join zwischen Orders und Order Details
SELECT * FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID


-- Aliasen
SELECT * FROM Customers as cus
JOIN Orders as o ON cus.CustomerID = o.CustomerID

SELECT Customers.CustomerID FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID

-- Reihenfolge
-- Verknüpfung zwischen Customers - Orders - Order Details - Products
SELECT * FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID

-- Bestellungen die Herr King bearbeitet hat
SELECT * FROM Orders 
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'King'

-- Übungen:
-- 1. Welche Produkte (ProductName) hat "Leverling" bisher verkauft?
SELECT * FROM Products 
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
WHERE LastName = 'Leverling'

-- 2. Wieviele Bestellungen haben Kunden aus Argentinien aufgegeben? (Anzahl OrderIDs bzw.
-- Anzahl Ergebniszeilen)
SELECT * FROM Orders
JOIN Customers 
ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'Argentina'

-- 3. Was war die größte Bestellmenge (Quantity) von Chai Tee (ProductName = 'Chai')?
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Chai'
ORDER BY Quantity DESC

-- 4. Alle Produkte (ProductNames) aus den Kategorien "Beverages" und "Produce"
-- (CategoryName in Categories)
SELECT * FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName IN ('Beverages', 'Produce')

-- 5. Alle Bestellungen (Orders) bei denen ein Produkt verkauft wurde, das nicht mehr gefuehrt wird
-- (Discontinued = 1 in Products)
SELECT * FROM Orders
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE Discontinued = 1

-- OUTER JOINs : LEFT/RIGHT und FULL OUTER

-- RIGHT: Z.189 & Z.502
-- Kunden ohne Bestellungen
SELECT * FROM Orders as o
RIGHT JOIN Customers as c ON o.CustomerID = c.CustomerID

-- Alle Bestellungen wo keine Kunden hinterlegt sind (optional)
SELECT * FROM Orders as o
LEFT JOIN Customers as c ON o.CustomerID = c.CustomerID

-- FULL OUTER
SELECT * FROM Orders as o
FULL OUTER JOIN Customers as c ON o.CustomerID = c.CustomerID

-- JOIN "invertieren", d.h keine Schnittmenge anzeigen, durch filtern nach NULL:
SELECT * FROM Orders as o
RIGHT JOIN Customers as c ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL

-- FULL OUTER JOIN invertieren
SELECT * FROM Orders as o
FULL OUTER JOIN Customers as c ON o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL OR c.CustomerID IS NULL

-- CROSS JOIN: Erstellt karthesisches Produkt zweier Tabellen (A x B)
SELECT * FROM Orders CROSS JOIN Customers -- (91 x 830)

-- SELF JOIN:
/*
	VorgesetztenID,   VorgesetztenLastName,   AngestelltenID,  AngestellenLastName
*/

SELECT E1.EmployeeID, E1.LastName as Vorgesetzter, E2.EmployeeID, E2.LastName as Angestellter
FROM Employees as E1
JOIN Employees as E2 ON E1.EmployeeID = E2.ReportsTo

