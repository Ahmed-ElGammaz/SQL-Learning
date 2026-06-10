USE SalesDB

SELECT 
	CustomerID,
	LastName,
	Score,
	AVG
	(
	CASE 
		WHEN Score IS NULL THEN 0
		ELSE Score
	END 
	) OVER () AvgVCustomerClean
FROM Sales.Customers

SELECT 
	*
FROM Sales.Orders
WHERE Sales > 30



SELECT 
	CustomerID,
	SUM(
	CASE 
		WHEN Sales > 30 THEN 1
		ELSE 0
	END ) TotalOrdersHighSales,
	COUNT(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerID



