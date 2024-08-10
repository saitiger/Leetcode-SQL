WITH prod_volume AS (
    SELECT product_id,
           width * length * height AS volume
    FROM Products
)
SELECT w.name AS warehouse_name,
       SUM(pv.volume * w.units) AS volume
FROM Warehouse w
JOIN prod_volume pv ON w.product_id = pv.product_id
GROUP BY w.name
