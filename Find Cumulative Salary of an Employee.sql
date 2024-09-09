WITH CTE AS (
SELECT id,month,
SUM(salary) OVER (PARTITION BY id ORDER BY month RANGE 2 PRECEDING) AS salary, -- Using Range Preceding instead of Row Preceding since there might be some missing values. Row Preceding will take even ignore missing values and calculate based on the last row.
RANK() OVER (PARTITION BY id ORDER BY month DESC) AS rnk -- Used for finding the most recent row               
FROM Employee
)
SELECT id, month, salary
FROM CTE
WHERE rnk > 1 -- Excluding the most frequent month/last month from the calculation
ORDER BY 1, 2 DESC; 
