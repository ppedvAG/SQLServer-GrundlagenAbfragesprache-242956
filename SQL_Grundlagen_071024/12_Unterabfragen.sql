USE Northwind

/*******************************************/

-- Subqueries / Unterabfragen / nested queries

/*******************************************/

/*
	- Muessen eigenstaendig fehlerfrei ausfuehrbar sein!
	- Koennen prinzipiell ueberall in eine Abfrage eingebaut werden (wenn es Sinn macht)
	- Abfragen werden "von innen nach au�en" der Reihe nach ausgefuehrt
*/

-- Zeige mir alle Order, deren Freight Wert �ber dem Durchschnitt liegt

SELECT * FROM Orders
WHERE Freight > (SELECT AVG(Freight) FROM Orders)
