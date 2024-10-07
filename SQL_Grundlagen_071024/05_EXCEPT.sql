USE Northwind

-- INTERSECT / EXCEPT = Vergleicht Abfrageergebnisse von mehr als einer ABfrage

-- INTERSECT = Schnittmenge zweier Abfragen (gleichen Datens�tze)
SELECT * FROM Customers -- => 91 Rows
INTERSECT
SELECT * FROM Customers -- => 11 Rows
WHERE Country = 'Germany'

-- EXCEPT = "Zeige mir alle Datens�tze aus Abfrage 1, die NIHCT ebenfalls in
--			 Abfrage 2 auftauchen"

SELECT * FROM Customers
EXCEPT
SELECT * FROM Customers -- => 11 Rows
WHERE Country = 'Germany'