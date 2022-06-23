DELIMITER $$
CREATE TRIGGER BeforeCourseDelete
    BEFORE DELETE
    ON Course
    FOR EACH ROW
BEGIN
    DELETE FROM CourseTestDesigners WHERE course_ID = OLD.ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER BeforeTestDesignerDelete
    BEFORE DELETE
    ON TestDesigner
    FOR EACH ROW
BEGIN
    DELETE FROM CourseTestDesigners WHERE CourseTestDesigners.testDesigner_ID = OLD.ID;
    DELETE FROM TestTestDesigners WHERE TestTestDesigners.test_designer_ID = OLD.ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER BeforeCustomerDelete
    BEFORE DELETE
    ON Customer
    FOR EACH ROW
BEGIN
    DELETE FROM Promote WHERE Promote.customer_ID = OLD.ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER BeforeQuestionDelete
    BEFORE DELETE
    ON Question
    FOR EACH ROW
BEGIN
    DELETE FROM QuestionAttempt WHERE QuestionAttempt.question_ID = OLD.ID;
    DELETE FROM TestQuestions WHERE TestQuestions.question_ID = OLD.ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER BeforeResponderDelete
    BEFORE DELETE
    ON Responder
    FOR EACH ROW
BEGIN
    DELETE FROM QuestionAttempt WHERE QuestionAttempt.responder_ID = OLD.ID;
    DELETE FROM TestAttempt WHERE TestAttempt.responder_ID = OLD.ID;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER BeforeTestDelete
    BEFORE DELETE
    ON Test
    FOR EACH ROW
BEGIN
    DELETE FROM TestAttempt WHERE TestAttempt.test_ID = OLD.ID;
    DELETE FROM TestQuestions WHERE TestQuestions.test_ID = OLD.ID;
    DELETE FROM TestTestDesigners WHERE TestTestDesigners.test_ID = OLD.ID;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER BeforeSupportDelete
    BEFORE DELETE
    ON Support
    FOR EACH ROW
BEGIN
    DELETE FROM TicketRefer WHERE TicketRefer.support_ID = OLD.ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER BeforeTechDelete
    BEFORE DELETE
    ON Tech
    FOR EACH ROW
BEGIN
    DELETE FROM TicketRefer WHERE TicketRefer.tech_ID = OLD.ID;
END$$
DELIMITER ;
