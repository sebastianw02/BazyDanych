USE AdventureWorks2022;

WITH TempEmployeeInfo AS
(
	SELECT pp.BusinessEntityID, pp.FirstName, pp.LastName, he.Rate
	FROM Person.Person pp JOIN HumanResources.EmployeePayHistory he ON pp.BusinessEntityID = he.BusinessEntityID 
	 
)
SELECT * FROM TempEmployeeInfo 
ORDER BY BusinessEntityID;


USE AdventureWorksLT2022;

WITH Revenues AS
(
	SELECT sc.CompanyName + ' (' + sc.FirstName + ' ' + sc.LastName + ')' AS CompanyContact, SUM(h.TotalDue) AS Revenue
	FROM SalesLT.Customer sc 
	JOIN SalesLT.SalesOrderHeader h ON sc.CustomerID = h.CustomerID
	GROUP BY sc.CompanyName, sc.FirstName, sc.LastName
)
SELECT * FROM Revenues
ORDER BY CompanyContact;


WITH Incomes AS
(
	SELECT spc.Name AS Category, FORMAT(SUM(sod.LineTotal), '0.00') AS SalesValue 
	FROM SalesLT.ProductCategory spc
	JOIN SalesLT.Product sp ON spc.ProductCategoryID = sp.ProductCategoryID
	JOIN SalesLT.SalesOrderDetail sod ON sp.ProductID = sod.ProductID
	GROUP BY spc.Name
)
SELECT * FROM Incomes
ORDER BY Category;