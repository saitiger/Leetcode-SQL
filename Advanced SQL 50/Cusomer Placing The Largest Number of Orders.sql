select 
customer_number 
from orders 
group by customer_number 
order by count(*) desc limit 1;

-- Solution 2 
SELECT DISTINCT customer_number
FROM (SELECT *, DENSE_RANK() OVER(ORDER BY cnt DESC)
      AS rnk
      FROM (SELECT *, COUNT(order_number)
            OVER(PARTITION BY customer_number) AS cnt
            FROM Orders) counts) ranks
WHERE rnk = 1;
