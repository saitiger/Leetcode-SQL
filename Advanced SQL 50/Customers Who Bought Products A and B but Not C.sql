SELECT customer_id, customer_name
FROM (
    SELECT 
        c.customer_id,
        c.customer_name,
        SUM(CASE WHEN o.product_name = 'A' THEN 1 ELSE 0 END) AS count_A,
        SUM(CASE WHEN o.product_name = 'B' THEN 1 ELSE 0 END) AS count_B,
        SUM(CASE WHEN o.product_name = 'C' THEN 1 ELSE 0 END) AS count_C
    FROM
        Customers c
        JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY 
        c.customer_id, c.customer_name
) x
WHERE count_A > 0 AND count_B > 0 AND count_C = 0
ORDER BY customer_id;

-- Solution 2 Using Group Concat 
SELECT o.customer_id, c.customer_name
FROM Orders o
LEFT JOIN Customers c
ON o.customer_id = c.customer_id
GROUP BY o.customer_id, c.customer_name
HAVING GROUP_CONCAT(DISTINCT product_name ORDER BY product_name) LIKE "A,B%"
AND GROUP_CONCAT(DISTINCT product_name ORDER BY product_name) NOT LIKE "%C%";
