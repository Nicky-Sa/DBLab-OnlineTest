# All TicketRefers with a customer with ID = 10.
SELECT *
FROM TicketRefer
WHERE EXISTS(
              SELECT * FROM Ticket WHERE TicketRefer.ticket_ID = Ticket.ID AND creator_ID = 10
          );