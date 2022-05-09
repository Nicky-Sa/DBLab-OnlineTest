# QuestionAttempts with responders with passwords ending with A.
SELECT *
FROM QuestionAttempt
WHERE EXISTS(
              SELECT * FROM Responder WHERE Responder.ID = QuestionAttempt.responder_ID AND Responder.password LIKE '%A'
          );