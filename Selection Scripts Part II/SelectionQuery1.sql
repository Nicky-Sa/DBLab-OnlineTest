SELECT *
FROM Package P
         JOIN Admin A on A.ID = P.creator_ID
WHERE A.ID > 10
ORDER BY creator_ID
LIMIT 30 OFFSET 5;