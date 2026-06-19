/*
Purpose:
Demonstrates SQL Server date/time formatting, data type conversion, casting,
date arithmetic, and date-based aggregation examples using the Sales.Orders table.
*/

USE SalesDB;

-- Examples of various date display formats for the order creation timestamp.
SELECT 
    OrderID,
    CreationTime,
    FORMAT(CreationTime, 'MM-dd-yyyy') AS USA_format,
    FORMAT(CreationTime, 'dd-MM-yyyy') AS EURO_format,
    FORMAT(CreationTime, 'dd') AS dd,
    FORMAT(CreationTime, 'ddd') AS ddd,
    FORMAT(CreationTime, 'dddd') AS dddd,
    FORMAT(CreationTime, 'MM') AS MM,
    FORMAT(CreationTime, 'MMM') AS MMM,
    FORMAT(CreationTime, 'MMMM') AS MMMM
FROM Sales.Orders;

-- Builds a custom display string combining day, month, quarter, and timestamp.
SELECT 
    OrderID,
    CreationTime,
    'DAY ' + FORMAT(CreationTime, 'ddd MMM') +
    ' Q' + DATENAME(quarter, CreationTime) + ' ' +
    FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS CustomFormat
FROM Sales.Orders;

-- Summarizes order volume by month and year using a formatted date label.
SELECT 
    FORMAT(OrderDate, 'MMM yy') AS OrderDate,
    COUNT(*) AS OrderCount
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy');

-- Demonstrates CONVERT for common string, date, and datetime transformations.
SELECT
    CONVERT(INT, '123') AS [Str to Int Convert],
    CONVERT(DATE, '2025-02-21') AS [Str to Date Convert],
    CreationTime,
    CONVERT(DATE, CreationTime) AS [DateTime to Date Convert],
    CONVERT(VARCHAR, CreationTime, 32) AS [DateTime to USA std. Style:32 Convert],
    CONVERT(VARCHAR, CreationTime, 34) AS [DateTime to EURO std. Style:34 Convert]
FROM Sales.Orders;

-- Demonstrates equivalent conversions using CAST.
SELECT
    CAST('123' AS INT) AS [Str to Int Cast],
    CAST(123 AS VARCHAR) AS [Int To Str Cast],
    CAST('2025-02-21' AS DATE) AS [Str to Date Cast],
    CAST('2025-02-21' AS DATETIME2) AS [Str to Datetime Cast],
    CreationTime,
    CAST(CreationTime AS DATE) AS [DateTime to Date Cast]
FROM Sales.Orders;

-- Calculates future dates relative to the order date.
SELECT
    OrderID,
    OrderDate,
    DATEADD(month, 3, OrderDate) AS ThreeMonthLater,
    DATEADD(year, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders;