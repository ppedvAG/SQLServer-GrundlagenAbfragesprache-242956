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

-- Beziehung zwischen PurchasingOrders und Products anlegen über ProductID
ALTER TABLE PurchasingOrders
ADD FOREIGN KEY (ProductID) REFERENCES Products (ProductID)

-- Neue Spalte hinzufügen zur bestehenden Table:
ALTER TABLE PurchasingOrders
ADD NeueSpalte INT

-- Spalte aus der bestehenden Table löschen:
ALTER TABLE PurchasingOrders
DROP COLUMN NeueSpalte

-- Spalte "TestDaten" Datentyp ändern zum Float
ALTER TABLE PurchasingOrders
ALTER COLUMN TestDaten INT NULL

/*************************************/

-- INSERT - Hinzufügen von Datensätzen in bestehender Table

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

-- DELETE - Löschen von Datensätzen in einem bestehendem Table

/*************************************/

-- Aufpassen! Ohne WHERE Filter werden ALLE Datensaetze gelöscht
DELETE FROM PurchasingOrders
WHERE ID = 16

-- Primär-/Fremdschlüsselbeziehung verhinder das loeschen von Datensätzen, wenn andere Datensätze
-- sonst "ins Leere laufen würden"
DELETE FROM Customers
WHERE CustomerID = 'ALFKI'

-- Löscht im Endeffekt alle Datensätze (kein Where filter möglich)
-- TRUNCATE TABLE PurchasingOrders


/*************************************/

-- UPDATE - Ändern von Spaltenwerten in einem vorhandenden Datensatz

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
VALUES ('Libowicz', 'Philipp', 'Alpharudelführer', 'Germany')

SELECT * FROM Employees

-- Transactions

BEGIN TRANSACTION

UPDATE PurchasingOrders
SET TestDaten = 5

COMMIT
ROLLBACK


SELECT * FROM PurchasingOrders