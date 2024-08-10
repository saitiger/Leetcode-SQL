with cnt as (
select email, count(*) as rep from Person group by email
)
select email from cnt where rep >1

-- Without CTE
select email from Person group by email
having with count(*)>1
