CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
RETURN (
select max(salary) as getNthHighestSalary
from (select salary,dense_rank() over (order by salary desc) rnk from Employee)A
where rnk = N
);
END
