/*
Purpose:
Demonstrates the results of different SQL Server join types between the
customers and orders tables, allowing comparison of how matching and
non-matching records are returned.
*/

USE MyDatabase;

SELECT *
FROM customers;

SELECT *
FROM orders;

-- Returns only customers that have matching orders.
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
INNER JOIN orders AS o
    ON c.id = o.customer_id;

-- Returns all customers, including those without orders.
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
    ON c.id = o.customer_id;

-- Returns all orders, including those without matching customers.
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.id = o.customer_id;

-- Equivalent result to the previous RIGHT JOIN example,
-- expressed using a LEFT JOIN with the tables reversed.
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM orders AS o
LEFT JOIN customers AS c
    ON c.id = o.customer_id;

-- Returns all customers and all orders, whether matched or unmatched.
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
FULL JOIN orders AS o
    ON c.id = o.customer_id;

-- Repeated LEFT JOIN example.
SELECT
    c.id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
    ON c.id = o.customer_id;