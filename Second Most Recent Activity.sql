with cte as (
select *,
count(*) as tot_act,
rank() over (partition by username order by startdate desc) as rnk
from UserActivity
)
select username,startdate,enddate,activity 
from 
cte
where rnk=2 or tot_act = 1
