CREATE TABLE Question
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    type       ENUM ('essay','single_choice', 'multiple_choice') NOT NULL DEFAULT 'essay',
    text       VARCHAR(1000)                                     NOT NULL,
    answer     VARCHAR(1000),
    point      FLOAT UNSIGNED,
    creator_ID INT,
    FOREIGN KEY (creator_ID) REFERENCES TestDesigner (ID)
);