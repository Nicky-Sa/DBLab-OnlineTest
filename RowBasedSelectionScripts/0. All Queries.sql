# All admins whose salary is equal to any package price.
SELECT *
FROM Admin
WHERE salary IN (SELECT price
                 FROM Package);


# All admins whose full_name is less than any customer full_name that starts with A.
SELECT *
FROM Admin
WHERE full_name < ANY (SELECT full_name
                       FROM Customer
                       WHERE Customer.full_name LIKE 'A%');


# All courses that their creator_IDs are between 5 and 67.
SELECT *
FROM Course
WHERE creator_ID BETWEEN 5 AND 67;


# All courses in which their customer package_ID is less than 30.
SELECT *
FROM Course
WHERE EXISTS(
              SELECT * FROM Customer WHERE Course.creator_ID = Customer.ID AND Customer.current_package_ID < 30
          );


# All testDesigners with at least 1 test.
SELECT *
FROM CourseTestDesigners
WHERE testDesigner_ID = ALL (SELECT testDesigner_ID
                             FROM TestTestDesigners);


# All customers with at least 1 ticket.
SELECT *
FROM Customer
WHERE ID IN (SELECT creator_ID
             FROM Ticket);


# Any customer who has been promoted.
SELECT *
FROM Customer
WHERE EXISTS(
              SELECT * FROM Promote WHERE Customer.ID = Promote.customer_ID
          );


# Packages with prices less than any tech guy salary.
SELECT *
FROM Package
WHERE price < ALL (SELECT salary
                   FROM Tech);


# Promotes with admins who have created at least 1 support guy.
SELECT *
FROM Promote
WHERE EXISTS(
              SELECT * FROM Support WHERE Support.creator_ID = Promote.admin_ID
          );


# Questions with points greater than all grades in testAttempt.
SELECT *
FROM Question
WHERE point > ALL (SELECT grade
                   FROM TestAttempt);


# Questions without a test.
SELECT *
FROM Question
WHERE ID NOT IN (SELECT question_ID
                 FROM TestQuestions);


# QuestionAttempts with responders with passwords ending with A.
SELECT *
FROM QuestionAttempt
WHERE EXISTS(
              SELECT * FROM Responder WHERE Responder.ID = QuestionAttempt.responder_ID AND Responder.password LIKE '%A'
          );


# Responders who have been added by a testDesigner who has designed at least 1 test.
SELECT *
FROM Responder
WHERE creator_ID = ANY (SELECT creator_ID
                        FROM TestDesigner);


# Responders with passwords containing 4.
SELECT *
FROM Responder
WHERE password LIKE '%4%';


# Support guys with salaries less than all Tech guys.
SELECT *
FROM Support
WHERE salary < ALL (SELECT salary
                    FROM Tech);


# Support guys with full_name not ending with W.
SELECT *
FROM Support
WHERE full_name NOT LIKE '%W';



# support guys with at least 1 ticket referred to.
SELECT *
FROM Tech
WHERE ID IN (SELECT tech_ID
             FROM TicketRefer);


# Tech guys who have been created by an admin with at least 1 promotion.
SELECT *
FROM Tech
WHERE creator_ID = ANY (SELECT admin_ID
                        FROM Promote);


# Tests that their course_ID has at least 1 designer and the id is less than 40.
SELECT *
FROM Test
WHERE EXISTS(
              SELECT *
              FROM CourseTestDesigners
              WHERE CourseTestDesigners.course_ID = Test.course_ID
                AND CourseTestDesigners.course_ID < 40
          );


# All testAttempts before at least 1 ticket.
SELECT *
FROM TestAttempt
WHERE start_attempt_time < ANY (SELECT creation_time
                                FROM Ticket);



# All testDesigners whose creator has been promoted.
SELECT *
FROM TestDesigner
WHERE creator_ID IN (SELECT customer_ID
                     FROM Promote);



# All testDesigners without a test.
SELECT *
FROM TestDesigner
WHERE ID != ALL (SELECT test_designer_ID
                 FROM TestTestDesigners);



# All tests without an attempt for at least 1 of its questions.
SELECT *
FROM TestQuestions
WHERE NOT EXISTS(
        SELECT * FROM QuestionAttempt WHERE QuestionAttempt.question_ID = TestQuestions.question_ID
    );


# Any test with at least 1 question assigned.
SELECT *
FROM TestTestDesigners
WHERE test_ID = ANY (SELECT test_ID
                     FROM TestQuestions);



# All tickets with creation_time less than all start_attempt_times in TestAttempt.
SELECT *
FROM Ticket
WHERE creation_time < ALL (SELECT start_attempt_time
                           FROM TestAttempt);



# All tickets with a status of not ANSWERED or WAITING.
SELECT *
FROM Ticket
WHERE status NOT IN ('ANSWERED', 'WAITING');



# All TicketRefers with a customer with ID = 10.
SELECT *
FROM TicketRefer
WHERE EXISTS(
              SELECT * FROM Ticket WHERE TicketRefer.ticket_ID = Ticket.ID AND creator_ID = 10
          );

