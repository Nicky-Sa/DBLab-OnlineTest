SELECT SUM(Q.point)
FROM Question Q
         JOIN QuestionAttempt QA on Q.ID = QA.question_ID
WHERE QA.responder_ID = 15
GROUP BY Q.creator_ID
HAVING Q.creator_ID > 12;