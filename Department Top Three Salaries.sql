with dept_highest_sal as (
select e.name as Employee,e.salary as Salary,d.name as Department, 
dense_rank() over (partition by d.name order by e.salary desc) as rnk
from employee e join department d on e.departmentId = d.id
)
select Department,Employee,Salary from dept_highest_sal 
where rnk<=3;
