select name 
from 
SalesPerson 
where 
name not in (
select sp.name 
from 
SalesPerson s
join 
Orders o 
on s.sales_id = o.sales_id 
join
Company c 
on c.com_id = o.com_id  
where lower(c.name) like "%red%" group by s.name);

-- Solution 2 Optimized 
SELECT s.name
FROM SalesPerson s
LEFT JOIN Orders o
ON s.sales_id = o.sales_id
LEFT JOIN Company c
ON o.com_id = c.com_id
GROUP BY s.sales_id, s.name
HAVING SUM(IF(c.name='RED',1,0))=0;
