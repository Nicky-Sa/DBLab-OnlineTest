# Any customer who has been promoted.
SELECT *
FROM Customer
WHERE EXISTS(
              SELECT * FROM Promote WHERE Customer.ID = Promote.customer_ID
          );
