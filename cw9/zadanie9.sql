USE AdventureWorks2022;

--Zad 1
BEGIN TRANSACTION 

UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680 

COMMIT;

SELECT * FROM Production.Product WHERE PRODUCTid = 680;


--Zad 2
BEGIN TRANSACTION 

DELETE FROM Production.Product 
WHERE ProductID = 707
ROLLBACK;

SELECT * FROM Production.Product WHERE ProductID=707;


--Zad 3
SET IDENTITY_INSERT Production.Product ON

BEGIN TRANSACTION 

INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, ModifiedDate)
VALUES(11, 'test', 'CO-0001', 1, 100, 100, 0.00, 0.00, 0.00, '2024-01-10 00:00:00.000', '2024-01-11 10:33:33.333');
COMMIT;

SELECT * FROM Production.Product;


--Zad 4
BEGIN TRANSACTION 

UPDATE Production.Product
SET StandardCost = StandardCost * 1.1

IF (SELECT SUM(StandardCost) FROM Production.Product) > 50000
	BEGIN
		ROLLBACK;
	END
	ELSE
	BEGIN
		COMMIT;
	END;

SELECT * FROM Production.Product;


--Zad 5
BEGIN TRANSACTION 

IF EXISTS (SELECT * FROM Production.Product WHERE ProductNumber='CO-0002')
	BEGIN
		PRINT 'Taki ProductNumber juz istnieje'
		ROLLBACK;
	END;
	ELSE
	BEGIN
		INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, ModifiedDate)
		VALUES(12, 'test2', 'CO-0002', 0, 100, 100, 0.00, 0.00, 0.00, '2024-01-10 00:00:00.000', '2024-01-11 10:33:33.333');
		COMMIT;
	END;

SELECT * FROM Production.Product;


--Zad 6
BEGIN TRANSACTION

UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 3;

IF EXISTS (SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
	BEGIN
    	ROLLBACK;
	END
	ELSE
	BEGIN
    	COMMIT;
	END;

SELECT * FROM Sales.SalesOrderDetail;


--Zad 7
BEGIN TRANSACTION 

DELETE FROM Production.Product
WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);
IF @@ROWCOUNT > 10
	BEGIN
		PRINT 'Wiêcej ni¿ 10 produktów do usuniecia';
		ROLLBACK;
	END;
	ELSE
	BEGIN
		PRINT 'Transakcja wykonana poprawnie';
		COMMIT;
	END;
	
SELECT * FROM Production.Product;
