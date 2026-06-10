

SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id IS NULL



SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id IS NULL


SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id IS NULL



SELECT *
FROM orders AS o
FULL JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id IS NOT NULL AND o.customer_id IS NOT NULL


SELECT *
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id



SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id IS NOT NULL


SELECT *
FROM orders AS o
RIGHT JOIN customers AS c
ON o.customer_id = c.id
WHERE o.customer_id IS NOT NULL


SELECT *
FROM customers AS c
CROSS JOIN orders AS o











