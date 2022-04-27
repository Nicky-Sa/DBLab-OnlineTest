CREATE TABLE Package
(
    ID             INT PRIMARY KEY AUTO_INCREMENT,
    creation_time  TIMESTAMP               DEFAULT CURRENT_TIMESTAMP,
    package_name   VARCHAR(150)   NOT NULL DEFAULT 'Free' UNIQUE ,
    price          FLOAT UNSIGNED NOT NULL,
    specifications VARCHAR(500),
    creator_ID     INT,
    FOREIGN KEY (creator_ID) REFERENCES Admin (ID)
);
