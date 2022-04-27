CREATE TABLE Support
(
    ID          INT PRIMARY KEY AUTO_INCREMENT,
    full_name   VARCHAR(150) NOT NULL,
    national_ID VARCHAR(10)  NOT NULL,
    salary      INT DEFAULT 0,
    creator_ID  INT,
    FOREIGN KEY (creator_ID) REFERENCES Admin (ID)
);