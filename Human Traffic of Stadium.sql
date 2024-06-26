with grp as (
select *, row_number() over(order by visit_date) as rn,
id-row_number() over(order by visit_date) as grp_number
from stadium 
where people>=100
)
select id,visit_date,people from grp where grp_number in 
(select grp_number from grp group by grp_number having count(*) >=3 )  ;
