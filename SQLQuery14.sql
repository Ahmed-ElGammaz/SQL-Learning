USE SalesDB

SELECT 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) As SalesRank_Row,
	RANK() OVER(ORDER BY Sales DESC) As SalesRank_Rank,
	DENSE_RANK() OVER(ORDER BY Sales DESC) As SalesRank_Densce
FROM Sales.Orders

SELECT *
FROM(
	SELECT 
		OrderID,
		ProductID,
		Sales,
		ROW_NUMBER() OVER(PARTITION BY ProductID ORDER BY Sales DESC) As RankByProduct
	FROM Sales.Orders)t

WHERE RankByProduct = 1

SELECT *
FROM(
	SELECT 
		CustomerID,
		SUM(Sales) TotalSales,
		ROW_NUMBER() OVER(ORDER BY SUM(Sales)) RankCustomers
	FROM Sales.Orders
	GROUP BY CustomerID)t
WHERE RankCustomers <= 2

SELECT *
FROM(
	SELECT 
		ROW_NUMBER() OVER(PARTITION BY OrderID ORDER BY CreationTime) AS RN,
		*
	FROM Sales.OrdersArchive)t
WHERE RN = 1

SELECT 
	OrderID,
	Sales,
	NTILE(1) OVER(ORDER BY Sales) OneBucket,
	NTILE(2) OVER(ORDER BY Sales) TwoBucket,
	NTILE(3) OVER(ORDER BY Sales) ThreeBucket,
	NTILE(4) OVER(ORDER BY Sales) FourBucket
FROM Sales.Orders

SELECT *,
CASE
	WHEN Buckets = 1 THEN 'High'
	WHEN Buckets = 2 THEN 'Medium'
	ELSE 'Low'
END SalesSegmentation
FROM (
	SELECT 
		OrderID,
		Sales,
		NTILE(3) OVER(ORDER BY Sales DESC) Buckets
	FROM Sales.Orders
)t


SELECT 
	NTILE(4) OVER(ORDER BY OrderID) Buckets,
	*
FROM Sales.Orders

SELECT *
FROM (
	SELECT
		Product,
		Price,
		CUME_DIST() OVER(ORDER BY Price DESC) DistRank
	FROM Sales.Products
	)T
WHERE DistRank <= 0.4

