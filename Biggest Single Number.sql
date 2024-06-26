select max(num) num 
from (
select num,count(*) cnt
from
MyNumbers
group by 1
)x
where 
cnt = 1
