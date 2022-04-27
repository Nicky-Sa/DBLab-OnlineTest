# test - testDesigner
CREATE TABLE TestTestDesigners
(
    ID               INT PRIMARY KEY AUTO_INCREMENT,
    test_ID          INT,
    test_designer_ID INT,
    FOREIGN KEY (test_ID) REFERENCES Test (ID),
    FOREIGN KEY (test_designer_ID) REFERENCES TestDesigner (ID)
);