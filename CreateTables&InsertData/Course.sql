CREATE TABLE Course
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(100) NOT NULL,
    creator_ID INT,
    FOREIGN KEY (creator_ID) REFERENCES Customer (ID)
);