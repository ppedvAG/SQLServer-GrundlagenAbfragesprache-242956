-- einzeiliger Kommentar

/*
	Mehrzeiliger
	Kommentar
*/

-- USE Datenbankname wechselt angesprochene Datenbank
-- Alternativ "oben links" im Drop-Down Men� richtige DB ausw�hlen
USE Northwind

/*
	SELECT: w�hlt Spalten aus, die im Ergebnisfenster
	angezeigt werden sollen
*/

SELECT * FROM Customers -- * = alle Spalten in der Tabelle

-- "Custom" Werte und mathematische Operationen ebenfalls m�glich
SELECT 100

SELECT 'Hallo!'

SELECT 100 + 5, 7 * 8

-- CompanyName, Country von Customers-Tabelle
SELECT CompanyName, Country FROM Customers

-- SQL ist NICHT case-sensitive, Formatierung spielt keine Rolle, keine Semikolons n�tigs
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

-- Auch mehrere Spalten gleichzeitig m�glich
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

-- Die 20 gr��ten Frachtkosten haben
SELECT TOP 20 * FROM Orders
ORDER BY Freight DESC

/*
	WICHTIG!: "BOTTOM" X existiert nicht, Ergebnisse m�ssen dann umgedreht werden mit 
	ORDER BY
*/

-- Duplikate "filtern" mit SELECT DISTINCT
-- Filtert alle Ergebnisse/Datens�tze deren Werte exakt gleich sind

SELECT Country FROM Customers

SELECT DISTINCT Country FROM Customers

SELECT DISTINCT City, Country FROM Customers

-- UNION f�hrt mehrere Ergebistabllen vertikal in eine Tabelle zusammen
-- UNION macht automatisch ein DISTINCT mit
-- Spaltenanzahl muss gleich sein, Datentypen m�ssen kompatibel sein

SELECT * FROM Customers
UNION
SELECT * FROM Customers

SELECT * FROM Customers
UNION ALL
SELECT * FROM Customers

-- Geht nicht wegen Datentypen
SELECT 100, 'Hallo'
UNION
SELECT 'Tsch�ss', 5

-- Geht wiederrum
SELECT 100, 'Hallo'
UNION
SELECT 5, 'Tsch�ss'

-- Spalten "umbennen" �ber Aliase "as"
SELECT 100 as Zahl, 'Hallo' as Begr��ung

SELECT City as Stadt FROM Customers

-- Aliase k�nnen auch f�r Tabellenname vergeben werden
SELECT * FROM Customers as cus