# support guys with at least 1 ticket referred to.
SELECT *
FROM Tech
WHERE ID IN (SELECT tech_ID
             FROM TicketRefer);