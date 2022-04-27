CREATE TABLE Responder
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    user_name  VARCHAR(100) NOT NULL,
    password   VARCHAR(20)  NOT NULL,
    creator_ID INT,
    FOREIGN KEY (creator_ID) REFERENCES TestDesigner (ID)
);