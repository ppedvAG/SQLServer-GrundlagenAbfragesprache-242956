USE Northwind

-- String Funktionen bzw. Text-Datentypen manipulieren

-- LEN gibt die laenge des Strigs zurück (Anzahl Symbole) als int
SELECT CompanyName, LEN(CompanyName) FROM Customers

-- LEFT/RIGHT geben die "linken" bzw. "rechten" x Zeichen eines Strings zurück
SELECT CompanyName, LEFT(CompanyName, 5) FROM Customers
SELECT CompanyName, RIGHT(CompanyName, 5) FROM Customers

-- SUBSTRING(Spalte, x, y) springt zu Position x in einem String und gibt y Zeichen aus
SELECT SUBSTRING(CompanyName, 5, 5), CompanyName FROM Customers

-- STUFF(Spalte, x, y, replace) ersetzt y Zeichen eines Strings ab Position x
-- mit "replace Wert" (optional)
SELECT STUFF(Phone, LEN(Phone) - 4, 5, 'XXXXX') FROM Customers

-- PATINDEX sucht nach "Schema" (wie Like) in einem String und gibt die Position aus,
-- an der das Schema das erste mal gefunden wurde
SELECT PATINDEX('%m%', CompanyName), CompanyName FROM Customers

-- CONCAT fügt mehrere Strings in die selbe Spalte zusammen
SELECT CONCAT(FirstName, ' ', LastName) as GanzerName FROM Employees
SELECT FirstName + ' ' + LastName as GanzerName FROM Employees

-----------------------------------------
-- Datumsfunktionen
SELECT GETDATE() --akutelle Systemzeit
SELECT CURRENT_TIMESTAMP -- auch akutelle Systemzeit

SELECT * FROM Orders

SELECT YEAR(OrderDate) as Jahr, MONTH(OrderDate) as Monat, DAY(OrderDate) as Tag,
OrderDate FROM Orders


-- "Zieht" ein gewünschtes Intervall aus einem Datum
SELECT
DATEPART(YEAR, OrderDate) as Jahr,
DATEPART(QUARTER, OrderDate) as Quartal,
DATEPART(WEEK, OrderDate) as KW,
DATEPART(WEEKDAY, OrderDate) as Wochentag,
DATEPART(HOUR, OrderDate) as Stunde
FROM Orders

-- Zieht den IntervallNamen aus einem Datum = DateName
SELECT DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDate),
DATEPART(WEEKDAY, OrderDate), OrderDate from Orders

-- Intervall zu einem Datum addieren/subtrahieren
SELECT DATEADD(DAY, 14, GETDATE())
SELECT DATEADD(DAY, -14, GETDATE())

-- Differenz in Intervall zwischen 2 Datums
-- YYYYMMDD Oder DD.MM.YYYY oder DD-MM-YYYY oder DD/MM/YYYY
SELECT DATEDIFF(DAY, '13/02/2005', GETDATE())
SELECT DATEDIFF(YEAR, OrderDate, GETDATE()) FROM Orders

------------------------------------------------------
-- CAST und CONVERT, wandeln Datentypen in der Ausgabe um
-- konvertierung von datetime -> date
SELECT CAST(OrderDate as date) FROM Orders
SELECT CONVERT(date, OrderDate) FROM Orders

-- ISNULL prüft auf NULL Werte und ersetzt diese wenn gewünscht
SELECT ISNULL(Fax, 'Nicht vorhanden!') as KeineFax, Fax FROM Customers

-- Komplexere Datumskonvertierung mit Formatierung kombinieren!
SELECT FORMAT((SELECT CONVERT(date, '20050213')), 'D', 'zh-us')

SELECT TOP 5 Freight,
	FORMAT(Freight, 'N', 'de-de'),
	FORMAT(Freight, 'G', 'de-de'),
	FORMAT(Freight, 'C', 'de-de')
FROM Orders

-- REPLACE(x, y, z) => "y" sucht "x" will mit "z" ersetzen
SELECT REPLACE('Hallo Welt!', 'Welt!', 'und Willkommen!')

-- REPLICATE(x, y) => Setze "y" mal die "x" vor einer Spalte z.B "Phone"
SELECT REPLICATE('0', 3) + Phone from Customers

-- Reverse(Spaltenname) => z.B "Hallo" wird zu "ollaH"
SELECT CompanyName, REVERSE(CompanyName) FROM Customers

-- UPPER(Spaltenname) => alles in Großbuchstaben
SELECT CompanyName, UPPER(CompanyName) FROM Customers

-- LOWER(Spaltenname) => alles in Kleinbuchstaben
SELECT CompanyName, LOWER(CompanyName) FROM Customers

-- TRANSLATE(inputString, chars, replace)
-- => Gebe deinen InputString an, wähle die "chars" as die im InputString ersetzt werden sollen
-- mit replace Wert
SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()')
