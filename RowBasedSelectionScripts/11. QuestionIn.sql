# Questions without a test.
SELECT *
FROM Question
WHERE ID NOT IN (SELECT question_ID
                 FROM TestQuestions);