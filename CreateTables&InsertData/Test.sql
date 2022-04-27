CREATE TABLE Test
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(100) NOT NULL,
    course_ID  INT,
    FOREIGN KEY (course_ID) REFERENCES Course (ID)
);