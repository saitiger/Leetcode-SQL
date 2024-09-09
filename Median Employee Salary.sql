-- Solution 1
WITH cte AS (
SELECT *,ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary ASC) AS r_asc,
ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary DESC) AS r_desc,
FROM Employee
)
SELECT id,company,salary
FROM cte
WHERE abs(r_asc-r_desc)<=1;

-- Solution 2
WITH cte AS (
SELECT *,ROW_NUMBER() OVER (PARTITION BY company ORDER BY salary ASC) AS rnk,
COUNT(1) OVER (PARTITION BY company) AS cnt
FROM Employee
)
SELECT id,company,salary
FROM cte
WHERE rnk >= 1.0*cnt/2 AND rnk <= 1.0*cnt/2 + 1;
