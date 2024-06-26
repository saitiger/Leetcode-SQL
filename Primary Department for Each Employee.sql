-- SELECT 
--   employee_id, 
--   department_id 
-- FROM 
--   Employee 
-- WHERE 
--   primary_flag = 'Y' 
-- UNION 
-- SELECT 
--   employee_id, 
--   department_id 
-- FROM 
--   Employee 
-- GROUP BY 
--   employee_id 
-- HAVING 
--   COUNT(employee_id) = 1;
-- The above solution should work, but the test case 22/23 is buggy, which breaks the above code. Test Case 5/23 is also wrong based on the description.

SELECT 
  employee_id, 
  department_id 
FROM 
  Employee 
WHERE 
  primary_flag = 'Y' 
UNION 
SELECT 
  employee_id, 
  department_id 
FROM 
  Employee 
GROUP BY 
  employee_id 
HAVING 
  COUNT(employee_id) = 1;
