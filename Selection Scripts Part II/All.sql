# 1:
SELECT *
FROM Package P
         JOIN Admin A on A.ID = P.creator_ID
WHERE A.ID > 10
ORDER BY creator_ID
LIMIT 30 OFFSET 5;

# 2:
SELECT MIN(TA.grade), MAX(TA.grade)
FROM TestAttempt TA
         JOIN Responder R on R.ID = TA.responder_ID
WHERE R.creator_ID > 55
GROUP BY R.creator_ID;

# 3: AVG(salary) OF TECHS CREATED BY AN ADMIN WITH AT LEAST 1 PACKAGE
SELECT AVG(T.salary), T.creator_ID
FROM Tech T
         JOIN Package P on T.creator_ID = P.creator_ID
WHERE T.salary > 1000
GROUP BY T.creator_ID
HAVING T.creator_ID > 32;

# 4:
SELECT COUNT(*), C.ID
FROM Ticket T
         JOIN Customer C on C.ID = T.creator_ID
WHERE status = 'WAITING'
GROUP BY C.ID
HAVING C.ID > 20;

# 5:
SELECT SUM(Q.point)
FROM Question Q
         JOIN QuestionAttempt QA on Q.ID = QA.question_ID
WHERE QA.responder_ID = 15
GROUP BY Q.creator_ID
HAVING Q.creator_ID > 12;

# 6: کسایی که این پکیجو دارن چندتا کورس دارن
SELECT COUNT(C2.ID), C1.current_package_ID
FROM Customer C1
         JOIN Course C2 on C1.ID = C2.creator_ID
GROUP BY C1.current_package_ID
ORDER BY COUNT(C1.ID) DESC;

# 7:
SELECT AVG(QA.point), QA.responder_ID, Q.type
FROM QuestionAttempt QA
         JOIN Question Q on Q.ID = QA.question_ID
GROUP BY Q.type, QA.responder_ID;

# 8:
SELECT SUM(S.salary), S.creator_ID, T.status, S.full_name
FROM Support S
         JOIN Ticket T on S.ID = T.support_ID
WHERE T.status = 'ANSWERED'
GROUP BY S.creator_ID
HAVING S.creator_ID > 30
ORDER BY SUM(S.salary) DESC;

# 9:
SELECT COUNT(*), P.package_name
FROM Customer C
         JOIN Package P on C.current_package_ID = P.ID
GROUP BY C.current_package_ID;

# 10:
SELECT DISTINCT TD.user_name
FROM CourseTestDesigners CTD
         JOIN TestDesigner TD on CTD.testDesigner_ID = TD.ID;

# 11: TO GET THE SUPPORT ID FROM TR
SELECT DISTINCT T.ID, TR.support_ID
FROM Ticket T
         LEFT JOIN TicketRefer TR on T.ID = TR.ticket_ID;

# 12: TO GET THE COURSE NAME
SELECT T.ID, C.name
FROM Test T
         LEFT JOIN Course C on C.ID = T.course_ID
ORDER BY T.ID;

# 13: TO GET NEVER-USED QUESTIONS
SELECT Q.ID
FROM TestQuestions TQ
         RIGHT JOIN Question Q ON TQ.question_ID = Q.ID
WHERE TQ.ID IS NULL;

# 14: TO GET EACH TEST DESIGNER OF A TEST, ITS CUSTOMER
SELECT TTD.test_ID, TD.creator_ID
FROM TestTestDesigners TTD
         RIGHT JOIN TestDesigner TD on TTD.test_designer_ID = TD.ID;

# 15: TO GET CORRESPONDING ADMIN NAME AND PACKAGE ID - FULL OUTER JOIN
SELECT A.full_name, P.ID
FROM Promote P
         LEFT JOIN Admin A on P.admin_ID = A.ID
UNION
SELECT A.full_name, P.ID
FROM Promote P
         RIGHT JOIN Admin A on P.admin_ID = A.ID





