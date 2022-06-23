SELECT T.ID, C.name
FROM Test T
         LEFT JOIN Course C on C.ID = T.course_ID
ORDER BY T.ID;