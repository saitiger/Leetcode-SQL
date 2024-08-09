SELECT e.*,
    CASE 
        WHEN operator = '>' THEN IF((v1.value > v2.value)=0, 'false', 'true')
        WHEN operator = '<' THEN IF((v1.value < v2.value)=0, 'false', 'true')
        WHEN operator = '=' THEN IF((v1.value = v2.value)=0, 'false', 'true')
        ELSE NULL 
    END AS value
FROM Expressions e
LEFT JOIN Variables v1 ON e.left_operand = v1.name
LEFT JOIN Variables v2 ON e.right_operand = v2.name;
