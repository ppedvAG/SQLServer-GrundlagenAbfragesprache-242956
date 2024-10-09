USE Northwind

-- CREATE / ALTER/ DROP (Data Definition Language)
-- Immer wenn wir Datenbankobjekte "bearbeiten" gelten diese Befehle

CREATE TABLE PurchasingOrders
(
	ID INT IDENTITY(1, 1) PRIMARY KEY,
	OrderDate DATE NOT NULL,
	ProductID INT NOT NULL
)

SELECT * FROM PurchasingOrders

-- Beziehung zwischen PurchasingOrders und Products anlegen �ber ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzuf�gen zur bestehenden Table:
ALTER TABLE PurchasingOrders
ADD NeueSpalte INT

-- Spalte aus der bestehenden Table l�schen:
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

-- Spalte "TestDaten" Datentyp �ndern zum Float
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten INT NULL

/*************************************/

-- INSERT - Hinzuf�gen von Datens�tzen in bestehender Table

/*************************************/

-- Alle Spalten befuellen:
INSERT INTO PurchasingOrders
VALUES('20241009', 10, 20),
	  ('20241009', 10, 20)

SELECT * FROM PurchasingOrders

-- Explizit einzelne Spalten befuellen
INSERT INTO PurchasingOrders (OrderDate, ProductID)
VALUES('20241009', 30)

-- Ergebnis einer SELECT-Abfrage direkt Inserten 
-- (Wenn Spaltenanzahl passt & Datentypen kompatibel sind)
INSERT INTO PurchasingOrders
SELECT GETDATE(), 50, 25.32


/*************************************/

-- DELETE - L�schen von Datens�tzen in einem bestehendem Table

/*************************************/

-- Aufpassen! Ohne WHERE Filter werden ALLE Datensaetze gel�scht
DELETE FROM PurchasingOrders
WHERE ID = 16

-- Prim�r-/Fremdschl�sselbeziehung verhinder das loeschen von Datens�tzen, wenn andere Datens�tze
-- sonst "ins Leere laufen w�rden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- L�scht im Endeffekt alle Datens�tze (kein Where filter m�glich)
-- TRUNCATE TABLE PurchasingOrders


/*************************************/

-- UPDATE - �ndern von Spaltenwerten in einem vorhandenden Datensatz

/*************************************/

SELECT * FROM PurchasingOrders

UPDATE PurchasingOrders
SET TestDaten = 1000
WHERE ID = 5

-- "Loeschen" von Werten: SET = NULL
UPDATE PurchasingOrders
SET TestDaten = NULL
WHERE ID = 8

-- Trage dich selber in die Tabelle ein (Employees). Bei folgenden Spalten
-- LastName, FirstName, Title, Country
INSERT INTO Employees (LastName, FirstName, Title, Country)
VALUES ('Libowicz', 'Philipp', 'Alpharudelf�hrer', 'Germany')

SELECT * FROM Employees

-- Transactions

BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = 5

COMMIT
ROLLBACK


SELECT * FROM PurchasingOrders