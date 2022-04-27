# tech - support
CREATE TABLE TicketRefer
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    end_time   TIMESTAMP,
    ticket_ID  INT,
    support_ID INT,
    tech_ID    INT,
    FOREIGN KEY (ticket_ID) REFERENCES Ticket (ID),
    FOREIGN KEY (support_ID) REFERENCES Support (ID),
    FOREIGN KEY (tech_ID) REFERENCES Tech (ID)
);

# customer - admin
CREATE TABLE Promote
(
    ID           INT PRIMARY KEY AUTO_INCREMENT,
    promote_time TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    comment      VARCHAR(500) DEFAULT 'No comment!',
    package_ID   INT,
    admin_ID     INT,
    customer_ID  INT,
    FOREIGN KEY (admin_ID) REFERENCES Admin (ID),
    FOREIGN KEY (customer_ID) REFERENCES Customer (ID),
    FOREIGN KEY (package_ID) REFERENCES Package (ID)
);

# course - testDesigner
CREATE TABLE CourseTestDesigners
(
    ID              INT PRIMARY KEY AUTO_INCREMENT,
    testDesigner_ID INT,
    course_ID       INT,
    FOREIGN KEY (course_ID) REFERENCES Course (ID),
    FOREIGN KEY (testDesigner_ID) REFERENCES TestDesigner (ID)
);

# test - testDesigner
CREATE TABLE TestTestDesigners
(
    ID               INT PRIMARY KEY AUTO_INCREMENT,
    test_ID          INT,
    test_designer_ID INT,
    FOREIGN KEY (test_ID) REFERENCES Test (ID),
    FOREIGN KEY (test_designer_ID) REFERENCES TestDesigner (ID)
);

# test - question
CREATE TABLE TestQuestions
(
    ID          INT PRIMARY KEY AUTO_INCREMENT,
    test_ID     INT,
    question_ID INT,
    FOREIGN KEY (test_ID) REFERENCES Test (ID),
    FOREIGN KEY (question_ID) REFERENCES TestDesigner (ID)
);

# test - responder -> attempt(time, grade, ...)
CREATE TABLE TestAttempt
(
    ID                  INT PRIMARY KEY AUTO_INCREMENT,
    start_attempt_time  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    finish_attempt_time TIMESTAMP,
    grade               FLOAT,
    test_ID             INT,
    responder_ID        INT,
    FOREIGN KEY (test_ID) REFERENCES Test (ID),
    FOREIGN KEY (responder_ID) REFERENCES Responder (ID)
);

# question - responder -> attempt(time, grade, ...)
CREATE TABLE QuestionAttempt
(
    ID           INT PRIMARY KEY AUTO_INCREMENT,
    point        FLOAT,
    question_ID  INT,
    responder_ID INT,
    FOREIGN KEY (question_ID) REFERENCES Question (ID),
    FOREIGN KEY (responder_ID) REFERENCES Responder (ID)
);