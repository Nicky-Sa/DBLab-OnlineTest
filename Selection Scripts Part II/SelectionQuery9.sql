SELECT COUNT(*), P.package_name
FROM Customer C
         JOIN Package P on C.current_package_ID = P.ID
GROUP BY C.current_package_ID;