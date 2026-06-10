USE SalesDB

SELECT *
FROM Sales.Customers

SELECT
	CustomerID,
	Score,
	COALESCE(Score, 0) AS Score2,
	AVG(Score) OVER() AS AvgScores,
	AVG(COALESCE(Score, 0)) OVER() AS AvgScores2
FROM Sales.Customers

SELECT 
	CustomerID,
	FirstName,
	LastName,
	COALESCE(FirstName, '') + ' '   + COALESCE(LastName,'') AS FullName
FROM Sales.Customers

SELECT
	CustomerID,
	FirstName,
	LastName,
	CONCAT(FirstName ,' ' ,LastName) AS FullName,
	Score,
	COALESCE(Score, 0) + 10 AS ScoreWithB
From Sales.Customers

SELECT
	CustomerID,
	Score,
	COALESCE(Score, 0) AS ScoreASC
From Sales.Customers
ORDER BY COALESCE(Score, 0) ASC


SELECT
	CustomerID,
	Score,
	CASE WHEN Score IS NULL THEN 1 ELSE 0 END AS Flag
From Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score

SELECT 
	OrderID,
	Sales,
	Quantity,
	Sales / NULLIF(Quantity,0)   AS Price
FROM Sales.Orders

SELECT *
FROM Sales.Customers
WHERE Score IS NULL

SELECT *
FROM Sales.Customers
WHERE Score IS NOT NULL
