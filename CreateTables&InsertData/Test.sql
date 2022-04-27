CREATE TABLE Test
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(100) NOT NULL,
    creator_ID INT,
    course_ID  INT,
    FOREIGN KEY (creator_ID) REFERENCES TestDesigner (ID),
    FOREIGN KEY (course_ID) REFERENCES Course (ID)
);