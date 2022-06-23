SELECT COUNT(*), C.ID
FROM Ticket T
         JOIN Customer C on C.ID = T.creator_ID
WHERE status = 'WAITING'
GROUP BY C.ID
HAVING C.ID > 20;