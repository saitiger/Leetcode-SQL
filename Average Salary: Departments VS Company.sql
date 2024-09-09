WITH SUMMARY AS (
SELECT
e.department_id,
s.pay_date pay_month,
AVG(amount) OVER(PARTITION BY s.pay_date) Company_AVG,
AVG(amount) OVER(PARTITION BY s.pay_date,e.department_id) Department_AVG
FROM 
Employees e
JOIN 
Salary s 
ON e.employee_id = s.employee_id
)
SELECT 
pay_month,department_id,
case when Department_AVG>COMPANY_AVG then 'higher' when  Department_AVG<Company_AVG then 'lower' else 'same' end Comparison
FROM SUMMARY
GROUP BY 1,2
ORDER BY 1 DESC, 2 

-- Optimized Query with Better Readability 
WITH department_averages AS (
  SELECT 
    e.department_id,
    s.pay_date AS pay_month,
    AVG(s.amount) AS department_avg
  FROM 
    Employees e
    JOIN Salary s ON e.employee_id = s.employee_id
  GROUP BY 
    e.department_id, s.pay_date
),
company_averages AS (
  SELECT 
    pay_date AS pay_month,
    AVG(amount) AS company_avg
  FROM 
    Salary
  GROUP BY 
    pay_date
)
SELECT 
  da.pay_month,
  da.department_id,
  CASE 
    WHEN da.department_avg > ca.company_avg THEN 'higher'
    WHEN da.department_avg < ca.company_avg THEN 'lower'
    ELSE 'same'
  END AS comparison
FROM 
  department_averages da
  JOIN company_averages ca ON da.pay_month = ca.pay_month
ORDER BY 
  da.pay_month DESC, 
  da.department_id
