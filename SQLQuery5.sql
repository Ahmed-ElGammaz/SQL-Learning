
SELECT * FROM Sales.Customers
SELECT * FROM Sales.Employees


SELECT
	Sales.Customers.FirstName,
	Sales.Customers.LastName
FROM 
	Sales.Customers

UNION

SELECT
	Sales.Employees.FirstName,
	Sales.Employees.LastName
FROM 
	Sales.Employees


SELECT
	Sales.Customers.FirstName,
	Sales.Customers.LastName
FROM 
	Sales.Customers

UNION ALL

SELECT
	Sales.Employees.FirstName,
	Sales.Employees.LastName
FROM 
	Sales.Employees


	
SELECT
	Sales.Customers.FirstName,
	Sales.Customers.LastName
FROM 
	Sales.Customers

UNION

SELECT
	Sales.Employees.FirstName,
	Sales.Employees.LastName
FROM 
	Sales.Employees

SELECT
	Sales.Customers.FirstName,
	Sales.Customers.LastName
FROM 
	Sales.Customers

INTERSECT

SELECT
	Sales.Employees.FirstName,
	Sales.Employees.LastName
FROM 
	Sales.Employees

SELECT
	Sales.Customers.FirstName,
	Sales.Customers.LastName
FROM 
	Sales.Customers
EXCEPT
SELECT
	Sales.Employees.FirstName,
	Sales.Employees.LastName
FROM 
	Sales.Employees


SELECT
	'Orders' AS Sourcetable
	,[OrderID]
    ,[ProductID]
    ,[CustomerID]
    ,[SalesPersonID]
    ,[OrderDate]
    ,[ShipDate]
	,[OrderStatus]
	,[ShipAddress]
	,[BillAddress]
	,[Quantity]
	,[Sales]
	,[CreationTime]
FROM Sales.Orders
UNION
SELECT
	'OrdersArchive' AS Sourcetable
	,[OrderID]
	,[ProductID]
	,[CustomerID]
	,[SalesPersonID]
	,[OrderDate]
	,[ShipDate]
	,[OrderStatus]
	,[ShipAddress]
	,[BillAddress]
	,[Quantity]
	,[Sales]
	,[CreationTime]
FROM Sales.OrdersArchive
ORDER BY OrderID
