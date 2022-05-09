# Responders who have been added by a testDesigner who has designed at least 1 test.
SELECT *
FROM Responder
WHERE creator_ID = ANY (SELECT creator_ID
                        FROM TestDesigner);
