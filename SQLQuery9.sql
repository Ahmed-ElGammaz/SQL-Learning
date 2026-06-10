USE SalesDB


SELECT *
FROM Sales.Employees

SELECT
	EmployeeID,
	BirthDate,
	DATEDIFF(year, BirthDate, GETDATE()) AS Age
FROM Sales.Employees

SELECT *
FROM Sales.Orders

SELECT 
	OrderID,
	OrderDate,
	ShipDate,
	DATEDIFF(day, OrderDate, ShipDate) AS Day2Ship
FROM Sales.Orders

SELECT
	DATENAME(MONTH, OrderDate) AS Month,
	AVG(DATEDIFF(day, OrderDate, ShipDate)) AS Avg_order_shiped
FROM Sales.Orders
GROUP BY DATENAME(MONTH, OrderDate)

SELECT 
	OrderID,
	OrderDate AS CurrentOrderDate,
	LAG(OrderDate) OVER(ORDER BY (OrderDate)) AS PreviousOrderDate,
	DATEDIFF(day, LAG(OrderDate) OVER(ORDER BY (OrderDate)), OrderDate) AS NrOfDays
FROM Sales.Orders


SELECT 
	ISDATE('123') DateCheck1,
	ISDATE('2025-02-21') DateCheck2,
	ISDATE('21-02-2025') DateCheck3,
	ISDATE('2025') DateCheck4,
	ISDATE('08') DateCheck5



