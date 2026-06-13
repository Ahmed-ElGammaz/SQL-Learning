/*
Class 07 - SQL Advanced Joins: Matching, Missing, and Cross-Referenced Data

Purpose:
Demonstrates advanced join techniques for identifying matched and
unmatched records between customers and orders, comparing equivalent
join patterns, and understanding Cartesian products using CROSS JOIN.
*/

-- Customers that do not have any associated orders.
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
    ON c.id = o.customer_id
WHERE o.customer_id IS NULL;


-- Orders that do not have a matching customer.
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
    ON c.id = o.customer_id
WHERE c.id IS NULL;


-- Alternative approach for finding orders without matching customers.
SELECT *
FROM orders AS o
LEFT JOIN customers AS c
    ON o.customer_id = c.id
WHERE c.id IS NULL;


-- Returns only records where a customer and order relationship exists.
SELECT *
FROM orders AS o
FULL JOIN customers AS c
    ON o.customer_id = c.id
WHERE c.id IS NOT NULL
  AND o.customer_id IS NOT NULL;


-- Standard inner join showing matched customer-order pairs.
SELECT *
FROM customers AS c
INNER JOIN orders AS o
    ON c.id = o.customer_id;


-- Equivalent result to an INNER JOIN using a LEFT JOIN and filtering.
SELECT *
FROM orders AS o
LEFT JOIN customers AS c
    ON o.customer_id = c.id
WHERE c.id IS NOT NULL;


-- Equivalent result to an INNER JOIN using a RIGHT JOIN and filtering.
SELECT *
FROM orders AS o
RIGHT JOIN customers AS c
    ON o.customer_id = c.id
WHERE o.customer_id IS NOT NULL;


-- Produces every possible customer-order combination.
SELECT *
FROM customers AS c
CROSS JOIN orders AS o;