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