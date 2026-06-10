USE SalesDB

SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) AS TotalSalesByProducts
FROM Sales.Orders



SELECT
	OrderID,
	OrderDate,
	SUM(Sales) OVER() AS TotalSales
FROM Sales.Orders

SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM(Sales) OVER() AS TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) AS SalesByProducts,
	SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) AS SalesByProductAndStatus,
	RANK() OVER(PARTITION BY ProductID ORDER BY Sales)
FROM Sales.Orders

SELECT
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) RankSales
FROM Sales.Orders

SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
	ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS TotalSales
FROM Sales.Orders

SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
	ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS TotalSales2Preceding,
	SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate 
	ROWS 2 PRECEDING) AS TotalSales2Preceding
FROM Sales.Orders


SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus) TotalSalesStatus
FROM Sales.Orders
ORDER BY SUM(Sales) OVER(PARTITION BY OrderStatus) DESC



SELECT
	OrderID,
	OrderDate,
	ProductID,
	OrderStatus,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus) TotalSalesStatus
FROM Sales.Orders
WHERE ProductID IN (101,102)


SELECT
	CustomerID,
	SUM(Sales) TotalSales,
	RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID
