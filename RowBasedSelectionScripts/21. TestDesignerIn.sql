# All testDesigners whose creator has been promoted.
SELECT *
FROM TestDesigner
WHERE creator_ID IN (SELECT customer_ID
                     FROM Promote);