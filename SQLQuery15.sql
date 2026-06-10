USE SalesDB

SELECT *
FROM Sales.Orders

SELECT 
	*,
	CurrentMonthSales - PreviousSales AS MOM_Change,
	ROUND(CAST((CurrentMonthSales - PreviousSales) AS FLOAT) / PreviousSales * 100 , 1) MOM_Perc
	
FROM(
	SELECT 
		MONTH(OrderDate) OrderMonth,
		SUM(Sales) CurrentMonthSales,
		LAG(SUM(Sales)) OVER(ORDER BY MONTH(OrderDate)) PreviousSales
	FROM Sales.Orders
	GROUP BY MONTH(OrderDate)
)t

SELECT *
FROM Sales.Orders


SELECT
	CustomerID,
	AVG(DaysUntilNxtOrder) AVGDays,
	RANK() OVER(ORDER BY COALESCE(AVG(DaysUntilNxtOrder),999999)) RANKAvg
FROM (
	SELECT
		OrderID,
		CustomerID,
		OrderDate CurrentOrder,
		LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY CustomerID) NextOrder,
		DATEDIFF(day, OrderDate , LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY CustomerID)) DaysUntilNxtOrder
	FROM Sales.Orders
)t
GROUP BY CustomerID

SELECT
	OrderID,
	OrderDate,
	Sales,
	FIRST_VALUE(Sales) OVER(ORDER BY OrderID) AS FirstSales,
	LAST_VALUE(Sales) OVER(ORDER BY OrderID ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS LastSales
FROM Sales.Orders


SELECT
	OrderID,
	ProductID,
	Sales,
	FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales) AS LowestSales,
	LAST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS HightestSales,
	FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales DESC) AS HightestSales2,
	Sales - FIRST_VALUE(Sales) OVER(PARTITION BY ProductID ORDER BY Sales) AS SalesDiff
FROM Sales.Orders 


SELECT *
FROM INFORMATION_SCHEMA.COLUMNS


