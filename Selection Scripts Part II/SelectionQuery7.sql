SELECT AVG(QA.point), QA.responder_ID, Q.type
FROM QuestionAttempt QA
         JOIN Question Q on Q.ID = QA.question_ID
GROUP BY Q.type, QA.responder_ID;