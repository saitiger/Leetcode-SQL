SELECT T.team_id, T.team_name, SUM(T.points) AS num_points
FROM (
    SELECT *, 
        CASE 
            WHEN t.team_id = m.host_team AND m.host_goals > m.guest_goals THEN 3
            WHEN t.team_id = m.guest_team AND m.guest_goals > m.host_goals THEN 3
            WHEN ((t.team_id = m.host_team) OR (t.team_id = m.guest_team)) AND (m.host_goals = m.guest_goals) THEN 1
            ELSE 0 
        END AS points
    FROM Teams t
    LEFT JOIN Matches m
    ON t.team_id = m.host_team OR t.team_id = m.guest_team
) T
GROUP BY T.team_id, T.team_name
ORDER BY num_points DESC, T.team_id;

-- Solution 2 
WITH cte AS (
    SELECT host_team AS team_id, (CASE
        WHEN host_goals > guest_goals THEN '3'
        WHEN host_goals = guest_goals THEN '1'
        ELSE '0' END) AS points
    FROM Matches
    UNION ALL
    SELECT guest_team AS team_id, (CASE
        WHEN guest_goals > host_goals THEN '3'
        WHEN guest_goals = host_goals THEN '1'
        ELSE '0' END) AS points
    FROM Matches
)
SELECT Teams.team_id, Teams.team_name, IFNULL(SUM(points), 0) AS num_points
FROM cte
RIGHT JOIN Teams
ON cte.team_id = Teams.team_id
GROUP BY Teams.team_id
ORDER BY 3 DESC, 1 ASC
