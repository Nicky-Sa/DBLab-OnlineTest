SELECT COUNT(C2.ID), C1.current_package_ID
FROM Customer C1
         JOIN Course C2 on C1.ID = C2.creator_ID
GROUP BY C1.current_package_ID
ORDER BY COUNT(C1.ID) DESC;