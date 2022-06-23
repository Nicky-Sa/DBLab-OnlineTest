SELECT AVG(T.salary), T.creator_ID
FROM Tech T
         JOIN Package P on T.creator_ID = P.creator_ID
WHERE T.salary > 1000
GROUP BY T.creator_ID
HAVING T.creator_ID > 32;