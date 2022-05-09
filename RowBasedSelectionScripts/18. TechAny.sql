# Tech guys who have been created by an admin with at least 1 promotion.
SELECT *
FROM Tech
WHERE creator_ID = ANY (SELECT admin_ID
                        FROM Promote);