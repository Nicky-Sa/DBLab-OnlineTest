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