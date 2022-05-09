# Any test with at least 1 question assigned.
SELECT *
FROM TestTestDesigners
WHERE test_ID = ANY (SELECT test_ID
                     FROM TestQuestions);