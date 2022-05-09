# Questions with points greater than all grades in testAttempt.
SELECT *
FROM Question
WHERE point > ALL (SELECT grade
                   FROM TestAttempt);