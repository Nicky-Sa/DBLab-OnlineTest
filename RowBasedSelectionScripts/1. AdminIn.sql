# All admins whose salary is equal to any package price.
SELECT *
FROM Admin
WHERE salary IN (SELECT price
                 FROM Package);