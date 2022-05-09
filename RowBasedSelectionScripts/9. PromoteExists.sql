# Promotes with admins who have created at least 1 support guy.
SELECT *
FROM Promote
WHERE EXISTS(
              SELECT * FROM Support WHERE Support.creator_ID = Promote.admin_ID
          );
