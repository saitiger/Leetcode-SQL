select s.seller_name
from 
seller s 
left join 
orders o 
on 
o.seller_id 
= 
s.seller_id
where 
extract(year from o.sale_date) = 2020
and 
o.order_id is null 
order by 1 

-- Solution Join Optimized 

select s.seller_name
from 
seller s 
left join 
(
  select order_id,seller_id
  from
  orders 
  where
  extract(year from sale_date) = 2020
)o
  on 
o.seller_id 
= 
s.seller_id
where 
o.order_id is null 
order by 1 
