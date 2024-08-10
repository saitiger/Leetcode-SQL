select 
sale_date,
sum(case when fruit = 'oranges' then num_sold*-1 else num_sold end) as diff
from 
Sale 
group by 1
