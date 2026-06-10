SELECT TOP (1000) [id]
      ,[first_name]
      ,[country]
      ,[score]
  FROM [MyDatabase].[dbo].[customers]


SELECT
    first_name,
    country,
    CONCAT (first_name,'-',country) AS name_country,
    UPPER (first_name) AS upper_name,
    LOWER (first_name) AS low_name
FROM customers

SELECT
    first_name
FROM customers
WHERE first_name != TRIM (first_name)

SELECT
    first_name,
    LEN (first_name) AS len_name,
    LEN(TRIM(first_name)) AS trim_name,
    LEN (first_name) - LEN(TRIM(first_name)) AS flag
FROM customers
WHERE LEN (first_name) != LEN(TRIM(first_name))

SELECT
    first_name
FROM customers
WHERE LEN (first_name) != LEN(TRIM(first_name))

SELECT 
    '123-456-7890' AS phone,
    REPLACE ('123-456-7890', '-', '/') AS clean_phone

SELECT 
    'report.txt' AS old_filename,
    REPLACE ('report.txt', '.txt', '.csv') AS new_filename


SELECT
    first_name,
    LEN(first_name) AS len_name
FROM customers

SELECT
    first_name,
    LEFT(TRIM(first_name), 2) AS first_2_char
FROM customers

SELECT
    first_name,
    RIGHT(first_name, 2) AS last_2_char
FROM customers

SELECT
    first_name,
    SUBSTRING(TRIM(first_name), 3, 2) AS sub_3_char
FROM customers

SELECT
    first_name,
    SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS sub_name
FROM customers


SELECT
3.516,
ROUND(3.516,2) AS round_2,
ROUND(3.516,1) AS round_1,
ROUND(3.516,0) AS round_0


















