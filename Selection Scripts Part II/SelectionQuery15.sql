SELECT A.full_name, P.ID
FROM Promote P
         LEFT JOIN Admin A on P.admin_ID = A.ID
UNION
SELECT A.full_name, P.ID
FROM Promote P
         RIGHT JOIN Admin A on P.admin_ID = A.ID