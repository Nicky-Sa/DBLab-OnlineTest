SELECT SUM(S.salary), S.creator_ID, T.status, S.full_name
FROM Support S
         JOIN Ticket T on S.ID = T.support_ID
WHERE T.status = 'ANSWERED'
GROUP BY S.creator_ID
HAVING S.creator_ID > 30
ORDER BY SUM(S.salary) DESC;