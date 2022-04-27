# test - question
CREATE TABLE TestQuestions
(
    ID          INT PRIMARY KEY AUTO_INCREMENT,
    test_ID     INT,
    question_ID INT,
    FOREIGN KEY (test_ID) REFERENCES Test (ID),
    FOREIGN KEY (question_ID) REFERENCES TestDesigner (ID)
);