USE SalesDB

SELECT *
FROM Sales.Orders

SELECT *
FROM (
	SELECT
		ProductID,
		Price,
		AVG(Price) OVER() AvgPrice
	FROM Sales.Products
)t
WHERE Price > AvgPrice

SELECT 
	*,
	RANK () OVER(ORDER BY TotalSales DESC) CustomerRank
FROM (
	SELECT 
		CustomerID,
		SUM(Sales) TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID
)t

SELECT 
	ProductID,
	Product,
	Price,
	(SELECT COUNT(*) FROM Sales.Orders)  AS TotalOrders
FROM Sales.Products



SELECT 
	c.*,
	o.TotalOrders
FROM	Sales.Customers c

LEFT JOIN (

	SELECT
		CustomerID,
		COUNT(*) TotalOrders
	FROM Sales.Orders 
	GROUP BY CustomerID) o

ON c.CustomerID = o.CustomerID 



SELECT
	ProductID,
	Price
FROM Sales.Products
WHERE Price > (SELECT AVG(Price) FROM Sales.Products)


SELECT 
	*
FROM Sales.Orders
WHERE CustomerID IN 
				(SELECT 
					CustomerID
				FROM Sales.Customers
				WHERE Country = 'Germany');

SELECT 
	*
FROM Sales.Orders
WHERE CustomerID NOT IN 
				(SELECT 
					CustomerID
				FROM Sales.Customers
				WHERE Country = 'Germany');

SELECT 
	CustomerID
FROM Sales.Customers
WHERE Country = 'Germany';


SELECT
	EmployeeID,
	FirstName,
	Gender,
	Salary
FROM Sales.Employees
WHERE Gender = 'F'
AND  Salary > ANY (SELECT Salary FROM Sales.Employees WHERE Gender = 'M');

SELECT
	EmployeeID,
	FirstName,
	Gender,
	Salary
FROM Sales.Employees
WHERE Gender = 'F'
AND  Salary > ALL (SELECT Salary FROM Sales.Employees WHERE Gender = 'M');


SELECT 
	*,
	(SELECT COUNT(*) FROM Sales.Orders o WHERE c.CustomerID = o.CustomerID) TotalSales
FROM Sales.Customers c


SELECT 
	*
FROM Sales.Orders o
WHERE EXISTS (SELECT 1
				FROM Sales.Customers c
				WHERE Country = 'Germany'
				AND o.CustomerID = c.CustomerID);
SELECT 
	*
FROM Sales.Orders o
WHERE NOT EXISTS (SELECT 1
				FROM Sales.Customers c
				WHERE Country = 'Germany'
				AND o.CustomerID = c.CustomerID);