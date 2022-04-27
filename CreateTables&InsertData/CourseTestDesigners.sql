# course - testDesigner
CREATE TABLE CourseTestDesigners
(
    ID              INT PRIMARY KEY AUTO_INCREMENT,
    testDesigner_ID INT,
    course_ID       INT,
    FOREIGN KEY (course_ID) REFERENCES Course (ID),
    FOREIGN KEY (testDesigner_ID) REFERENCES TestDesigner (ID)
);