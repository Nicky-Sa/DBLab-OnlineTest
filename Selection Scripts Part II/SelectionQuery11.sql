SELECT DISTINCT T.ID, TR.support_ID
FROM Ticket T
         LEFT JOIN TicketRefer TR on T.ID = TR.ticket_ID;