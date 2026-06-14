/*
    Purpose: Retrieve enriched sales order details by combining order data with related customer,
    product, and employee information for reporting and analysis.
*/

USE SalesDB;

-- Reference data queries for validation or exploratory inspection of source tables
SELECT * FROM Sales.Customers;
SELECT * FROM Sales.Employees;
SELECT * FROM Sales.Orders;
SELECT * FROM Sales.OrdersArchive;
SELECT * FROM Sales.Products;

-- Main enriched order report combining transactional and dimension data
SELECT
    o.OrderID,
    o.Sales,
    c.FirstName AS CustomerFirstName,
    c.LastName AS CustomerLastName,
    p.Product AS ProductName,
    p.Price,
    e.FirstName AS SalesFirstName,
    e.LastName AS SalesLastName
FROM Sales.Orders AS o
LEFT JOIN Sales.Customers AS c
    ON o.CustomerID = c.CustomerID
LEFT JOIN Sales.Products AS p
    ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees AS e
    ON o.SalesPersonID = e.EmployeeID;  -- Maps each order to the assigned sales representative