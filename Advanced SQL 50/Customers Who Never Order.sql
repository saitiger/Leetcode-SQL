
/*select c.name as Customers from Customers c left join Orders o on c.id = o.customerID where count(id) = 0 group by o.customerID;*/


SELECT Name AS Customers
FROM Customers C
LEFT JOIN Orders O
ON C.Id = O.CustomerId
WHERE O.CustomerId IS NULL
