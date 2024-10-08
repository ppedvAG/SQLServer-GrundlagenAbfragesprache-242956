USE Northwind
-- Aggregatfunktionen: Führt eine Berechnung auf einer Menge von Werten durch und gbt einen einzigen Wert zurück
-- Ausnahme: COUNT(*) ignoriert keine NULL Werte, Aggregatfunktionen

-- SUM, MIN, MAX, AVG, COUNT, COUNT(*)

SELECT COUNT(Fax), COUNT(*) FROM Customers

SELECT 
SUM(Freight) AS Summe,
MIN(Freight) AS Minimum,
MAX(Freight) AS Maximum,
AVG(Freight) AS Durchschnitt,
COUNT(ShippedDate) as ZähleSpalte, COUNT(*) as ZähleAlles
FROM Orders

-- AVG selber berechnen
SELECT SUM(Freight) / COUNT(*) FROM Orders

SELECT CustomerID, SUM(Freight) FROM Orders

SELECT CustomerID, Freight FROM Orders
ORDER BY CustomerID

-- Lösung über Group By
SELECT CustomerID, SUM(Freight) FROM Orders
GROUP BY CustomerID

-- Quantity Summe pro ProductName für Produkte der Kategorien 1-4:
SELECT ProductName, SUM(Quantity) AS SummeStueckZahl FROM [Order Details]
JOIN Products on Products.ProductID = [Order Details].ProductID
--WHERE CategoryID IN (1,2,3,4)
GROUP BY ProductName
ORDER BY SummeStueckZahl

-- Verkaufte Stueckzahlen pro Produkt, nur über 1000 sind
SELECT ProductName, SUM(Quantity) AS SummeStueckZahl FROM [Order Details]
JOIN Products on Products.ProductID = [Order Details].ProductID
--WHERE SUM(Quantity) > 1000
GROUP BY ProductName
HAVING SUM(Quantity) > 1000
ORDER BY 2 DESC

-- Having funktioniert 1zu1 wie WHERE, kann aber gruppierte/aggregierte Werte nachträglich zu filtern