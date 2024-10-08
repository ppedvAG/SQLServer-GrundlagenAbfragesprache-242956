-- 1. Alle Bestellungen (Orders) aus Q2 in 1997
SELECT * FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1997 AND DATEPART(QUARTER, OrderDate) = 2

-- 2. Alle Produkte (ProductName) die um Weihnachten (24) herum (+- 10 Tage) in 1996 verkauft wurden
SELECT ProductName FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE OrderDate BETWEEN '19961214' AND '19970103'

-- 3. Alle Bestellungen aus den USA die im Jahr 1997 aufgegeben wurden
SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND OrderDate BETWEEN '19970101' AND '19971231'

SELECT * FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Country = 'USA' AND DATEPART(YEAR, OrderDate) = 1997

-- 4. Welches Produkt (ProductName) hatte die groeßte Bestellmenge (Quantity in OD) im Februar 1998?
SELECT TOP 1 ProductName, Quantity FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON [Order Details].OrderID = Orders.OrderID
where DATEPART(YEAR, OrderDate) = 1998 AND DATEPART(MONTH, OrderDate) = 2
ORDER BY Quantity DESC

-- 5. Wieviele Bestellungen kamen aus Spain (Customers) in Q2 1997
--	  Sind es mehr oder weniger als aus Frankreich (2. Abfrage)

-- Espaniola
SELECT * FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'Spain' AND DATEPART(QUARTER, OrderDate) = 2 AND
DATEPART(YEAR, OrderDate) = 1997
UNION
-- France
SELECT * FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'France' AND DATEPART(QUARTER, OrderDate) = 2 AND
DATEPART(YEAR, OrderDate) = 1997

-- 6. Gab es Bestellungen (OrderID) an Wochenendtagen (OrderDate)?
SELECT OrderID, DATEPART(WEEKDAY, OrderDate) AS Wochentag FROM Orders
WHERE DATEPART(WEEKDAY, OrderDate) IN(6,7)

-- 8. Verkaufte Stueckzahlen (Quantity) pro ProduktKategorie (CategoryName) (8 Ergebniszeilen)
SELECT CategoryName, SUM(Quantity) as VerkaufteStueckzahlen FROM Categories
JOIN Products ON Products.CategoryID = Categories.CategoryID
JOIN [Order Details] ON [Order Details].ProductID = Products.ProductID
GROUP BY CategoryName

-- 9. Wieviele Bestellungen hat jeder Mitarbeiter bearbeitet? (9 Ergebniszeilen)
SELECT LastName, COUNT(Orders.OrderID) as Bestellugen FROM Orders
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName
ORDER BY Bestellugen DESC

--10. Was war das meistverkaufte Produkt im Jahr 1998 (Productname)? Wieviel Stück (Quantity)?
SELECT TOP 1 ProductName, SUM(Quantity) as Verkaufsmenge FROM Products
JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
WHERE DATEPART(YEAR, OrderDate) = 1998
GROUP BY ProductName
ORDER BY Verkaufsmenge DESC

--11. In welcher Stadt (City) waren „Wimmers gute Semmelknödel“ am beliebtesten (Quantity)?
SELECT TOP 1 City, SUM(Quantity) as Beliebteste FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
JOIN Products ON Products.ProductID = [Order Details].ProductID
WHERE ProductName = 'Wimmers gute Semmelknödel'
GROUP BY City
ORDER BY Beliebteste DESC

--12. Welcher Spediteur (Shippers) war durchschnittlich am günstigsten? (Freight)
SELECT TOP 1 CompanyName, AVG(Freight) as AvgFreight FROM Orders
JOIN Shippers ON Shippers.ShipperID = Orders.ShipVia
GROUP BY CompanyName
ORDER BY AvgFreight

-- 13. Hatten wir Bestellungen, die wir zu spaet ausgeliefert haben? Wenn 
-- ja, welche OrderIDs waren das und wieviele Tage
-- waren wir zu spaet dran? (Verzoegerung = Unterschied zwischen Shipped 
-- & Required Date in Orders) Tipp: DATEDIFF & ISNULL
-- ISNULL prueft auf Null Werte und ersetzt diese wenn gewuenscht
-- Wenn kein ShippedDate drinnen ist, dann muss er mit dem Heutigen Ersetzt werden!!
-- SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers
/* 37
OrderID, "TageZuSpaet"
OrderID, "TageZuSpaet"
OrderID, "TageZuSpaet"
usw...
*/
SELECT OrderID, DATEDIFF(DAY, RequiredDate, ISNULL(ShippedDate, GETDATE())) as TageVerzoegerung
FROM Orders
WHERE DATEDIFF(DAY, RequiredDate, ISNULL(ShippedDate, GETDATE())) > 0
ORDER BY TageVerzoegerung DESC


-- 14. Jahrweiser Vergleich unserer 3. Spediteure: (Shippers Tabelle): 
-- Lieferkosten (Freight) gesamt, Durchschnitt (freight)
-- pro Lieferung und Anzahl an Lieferungen
-- Tables: Orders - Shippers
-- Aggregate: SUM, AVG, COUNT
-- DATEPART() benoetigt
/*
	Ergebnis in etwa so:
	SpediteurName, Geschäftsjahr, FreightGesamt, FreightAvg, AnzBestellungen
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	Sped 1		 ,1996			, xy		   , xy		   , xy
	usw....
*/
SELECT CompanyName as SpediteurName,
DATEPART(YEAR, OrderDate) as Geschäftsjahr,
SUM(Freight) as FreightGesamt,
AVG(Freight) as FreightAvg,
COUNT(*) as AnzBestellungen
FROM Shippers
JOIN Orders ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName, DATEPART(YEAR, OrderDate)
ORDER BY Geschäftsjahr, SpediteurName