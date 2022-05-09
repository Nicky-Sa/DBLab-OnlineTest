# All tickets with a status of not ANSWERED or WAITING.
SELECT *
FROM Ticket
WHERE status NOT IN ('ANSWERED', 'WAITING');