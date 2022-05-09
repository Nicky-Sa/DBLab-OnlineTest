# All tests without an attempt for at least 1 of its questions.
SELECT *
FROM TestQuestions
WHERE NOT EXISTS(
        SELECT * FROM QuestionAttempt WHERE QuestionAttempt.question_ID = TestQuestions.question_ID
    );