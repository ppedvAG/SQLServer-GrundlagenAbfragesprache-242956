USE Northwind
-- Temp Table / Temporäre Tabellen

/*
	- SELECT INTO #TempTable => Ergebnisse in einer Temporären Tabelle gespeichert
	- Ergebnisse werden nur einmal generiert --> TempTable sehr schnell sind aber nicht aktuel
	- werden SystemDB -> tempDB angelegt
	- existiert nur innerhalb meiner Session (Skriptfenster / Query)
	- mit einem # = "lokal"
	- mit zwei ## = "global"
*/

/* Syntax: 
	SELECT [Spalten] 
	INTO #TempTable
	FROM [Tabelle]
*/

-- Erstellen
SELECT * 
INTO #TempTable
FROM Customers 
WHERE Country = 'Germany'

-- Aufrufen der Temp Table
SELECT * FROM #TempTable

-- globale Temp Tables
SELECT * 
INTO ##TempTableGlobal
FROM Customers 
WHERE Country = 'Germany'

