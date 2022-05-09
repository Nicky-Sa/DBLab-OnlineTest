# All admins whose full_name is less than any customer full_name that starts with A.
SELECT *
FROM Admin
WHERE full_name < ANY (SELECT full_name
                       FROM Customer
                       WHERE Customer.full_name LIKE 'A%');
