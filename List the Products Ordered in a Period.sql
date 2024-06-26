with cte as (
select  
product_id,
sum(unit) unit
from
Orders 
where to_char(order_date,'MM-YYYY') = '02-2020'
group by product_id
having sum(unit)>=100
)
select p.product_name,
c.unit
from cte c
join
products p
on c.product_id = p.product_id 
