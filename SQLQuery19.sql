USE SalesDB

IF OBJECT_ID('Sales.MonthlyOrders', 'U') IS NOT NULL
	DROP TABLE Sales.MonthlyOrders;
GO
SELECT
	DATENAME(month, OrderDate) OrderMonth,
	COUNT(OrderID) TotalOrders
INTO Sales.MonthlyOrders 
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate)


SELECT *
FROM Sales.MonthlyOrders

SELECT 
	*
INTO #Orders
FROM Sales.Orders


SELECT 
	*
FROM #Orders


DELETE FROM #Orders
WHERE OrderStatus = 'Delivered'


SELECT 
	*
FROM #Orders


SELECT 
	*
INTO Sales.OrdersTest
FROM #Orders

SELECT 
	*
FROM Sales.OrdersTest



