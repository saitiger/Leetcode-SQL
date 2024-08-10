WITH cte AS (
    SELECT from_id, to_id, duration
    FROM Calls
    WHERE from_id < to_id
    UNION ALL
    SELECT to_id, from_id, duration
    FROM Calls
    WHERE to_id < from_id
)

SELECT from_id AS person1,
       to_id AS person2,
       COUNT(*) AS call_count,
       SUM(duration) AS total_duration
FROM cte
GROUP BY 1, 2;

-- Solution 2 Using in built functions ( Credit : EverydayDataScience)
SELECT LEAST(from_id, to_id) AS person1,
       GREATEST(from_id, to_id) AS person2,
       COUNT(*) AS call_count,
       SUM(duration) AS total_duration
FROM Calls
GROUP BY LEAST(from_id, to_id),
         GREATEST(from_id, to_id);
