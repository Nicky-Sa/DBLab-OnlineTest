# All customers with at least 1 ticket.
SELECT *
FROM Customer
WHERE ID IN (SELECT creator_ID
             FROM Ticket);