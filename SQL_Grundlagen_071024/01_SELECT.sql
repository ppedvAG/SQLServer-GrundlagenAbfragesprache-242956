-- einzeiliger Kommentar

/*
	Mehrzeiliger
	Kommentar
*/

-- USE Datenbankname wechselt angesprochene Datenbank
-- Alternativ "oben links" im Drop-Down Menü richtige DB auswählen
USE Northwind

/*
	SELECT: wählt Spalten aus, die im Ergebnisfenster
	angezeigt werden sollen
*/

SELECT * FROM Customers -- * = alle Spalten in der Tabelle

-- "Custom" Werte und mathematische Operationen ebenfalls möglich
SELECT 100

SELECT 'Hallo!'

SELECT 100 + 5, 7 * 8

-- CompanyName, Country von Customers-Tabelle
SELECT CompanyName, Country FROM Customers

-- SQL ist NICHT case-sensitive, Formatierung spielt keine Rolle, keine Semikolons nötigs
sElEcT				cOuNtry
			,CompANyName
FrOm Customers

-- Order By = Sortieren von Tabellen
-- A-z = aufsteigend
SELECT * FROM Customers
ORDER BY City ASC

-- Z-A = absteigend 
SELECT * FROM Customers
ORDER BY City DESC

-- Order By ist syntaktisch IMMER AM ENDE
-- DESC = descending = absteigend
-- ASC = ascending = aufsteigend

-- Auch mehrere Spalten gleichzeitig möglich
SELECT City, Country FROM Customers
ORDER BY City DESC, Country ASC

SELECT * FROM Customers

-- TOP X gibt nur ersten X Zeilen aus
SELECT TOP 10 * FROM Customers
SELECT TOP 100 * FROM Customers

-- Geht auch mit %-Angaben
-- Top X percent
SELECT TOP 10 Percent * FROM Customers

-- Tabelle Orders: Spalte Freight
-- Die 20 kleinsten Frachtkosten haben
SELECT TOP 20 * FROM Orders
ORDER BY Freight ASC

-- Die 20 größten Frachtkosten haben
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

/*
	WICHTIG!: "BOTTOM" X existiert nicht, Ergebnisse müssen dann umgedreht werden mit 
	ORDER BY
*/

-- Duplikate "filtern" mit SELECT DISTINCT
-- Filtert alle Ergebnisse/Datensätze deren Werte exakt gleich sind

SELECT Country FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT City, Country FROM Customers

-- UNION führt mehrere Ergebistabllen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT mit
-- Spaltenanzahl muss gleich sein, Datentypen müssen kompatibel sein

SELECT * FROM Customers
UNION
SELECT * FROM Customers

SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers

-- Geht nicht wegen Datentypen
SELECT 100, 'Hallo'
UNION
SELECT 'Tschüss', 5

-- Geht wiederrum
SELECT 100, 'Hallo'
UNION
SELECT 5, 'Tschüss'

-- Spalten "umbennen" über Aliase "as"
SELECT 100 as Zahl, 'Hallo' as Begrüßung

SELECT City as Stadt FROM Customers

-- Aliase können auch für Tabellenname vergeben werden
SELECT * FROM Customers as cus