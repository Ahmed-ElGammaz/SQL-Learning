USE SalesDB

SELECT 
	*
FROM Sales.Orders

SELECT 
	OrderID,
	OrderDate,
	CustomerID,
	COUNT(*) OVER() TotalOrders,
	COUNT(*) OVER(PARTITION BY CustomerID) OrderByCustomer
FROM Sales.Orders

SELECT
	*,
	COUNT(*) OVER() TotalCustomers,
	COUNT(ISNULL(Score,0)) OVER() TotalCustomers
FROM Sales.Customers

SELECT 
	OrderID,
	OrderDate,
	CustomerID,
	COUNT(*) OVER(PARTITION BY OrderID) CheckPK
FROM Sales.Orders

SELECT
	OrderID,
	COUNT(*) OVER(PARTITION BY OrderID) CheckPK
FROM Sales.OrdersArchive

SELECT *
FROM (
	SELECT
		OrderID,
		COUNT(*) OVER(PARTITION BY OrderID) CheckPK
	FROM Sales.OrdersArchive
	)T 
WHERE CheckPK > 1
	
SELECT 
	OrderID,
	OrderDate,
	Sales,
	SUM(SALES) OVER() TotalSales,
	SUM(SALES) OVER(PARTITION BY ProductID) SalesByProduct
FROM Sales.Orders

SELECT 
	OrderID,
	OrderDate,
	Sales,
	SUM(SALES) OVER() TotalSales,
	SUM(SALES) OVER(PARTITION BY ProductID) SalesByProduct,
	ROUND (CAST(Sales AS FLOAT) / SUM(SALES) OVER() * 100, 2) AS PercentageOfTotal
FROM Sales.Orders

SELECT 
	OrderID,
	OrderDate,
	Sales,
	AVG(SALES) OVER() AvgSales,
	AVG(SALES) OVER(PARTITION BY ProductID) AvgSalesByProduct
FROM Sales.Orders

SELECT 
	*,
	AVG(Score) OVER() AvgScore,
	COALESCE(Score, 0) NullToZero,
	AVG(COALESCE(Score, 0)) OVER() AvgScoreWithoutNull
FROM Sales.Customers

SELECT *
FROM(
	SELECT 
		OrderID,
		ProductID,
		Sales,
		Avg(Sales) OVER() AvgSales
	FROM Sales.Orders)t
WHERE Sales > AvgSales


SELECT
	OrderID,
	ProductID,
	OrderDate,
	Sales,
	AVG(Sales) OVER() AvgSales,
	AVG(Sales) OVER(PARTITION BY ProductID) AvgByProduct,
	AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) MovingAvg,
	AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) RollingAvg	
FROM Sales.Orders














