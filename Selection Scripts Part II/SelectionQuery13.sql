SELECT Q.ID
FROM TestQuestions TQ
         RIGHT JOIN Question Q ON TQ.question_ID = Q.ID
WHERE TQ.ID IS NULL;