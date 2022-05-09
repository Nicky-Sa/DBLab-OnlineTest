 Support guys with salaries less than all Tech guys.
SELECT *
FROM Support
WHERE salary < ALL (SELECT salary
                    FROM Tech);