# All tickets with creation_time less than all start_attempt_times in TestAttempt.
SELECT *
FROM Ticket
WHERE creation_time < ALL (SELECT start_attempt_time
                           FROM TestAttempt);
