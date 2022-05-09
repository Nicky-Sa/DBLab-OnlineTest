# Packages with prices less than any tech guy salary.
SELECT *
FROM Package
WHERE price < ALL (SELECT salary
                   FROM Tech);