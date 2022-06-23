SELECT MIN(TA.grade), MAX(TA.grade)
FROM TestAttempt TA
         JOIN Responder R on R.ID = TA.responder_ID
WHERE R.creator_ID > 55
GROUP BY R.creator_ID;