# All testAttempts before at least 1 ticket.
SELECT *
FROM TestAttempt
WHERE start_attempt_time < ANY (SELECT creation_time
                                FROM Ticket);
