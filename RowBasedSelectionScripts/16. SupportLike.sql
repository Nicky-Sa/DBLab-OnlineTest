# Support guys with full_name not ending with W.
SELECT *
FROM Support
WHERE full_name NOT LIKE '%W';