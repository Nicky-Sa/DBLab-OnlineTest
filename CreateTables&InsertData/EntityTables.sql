CREATE TABLE Admin
(
    ID          VARCHAR(10) PRIMARY KEY,
    full_name   VARCHAR(150) NOT NULL,
    national_ID VARCHAR(10)  NOT NULL,
    salary      INT DEFAULT 0
);

CREATE TABLE Support
(
    ID          VARCHAR(10) PRIMARY KEY,
    full_name   VARCHAR(150) NOT NULL,
    national_ID VARCHAR(10)  NOT NULL,
    salary      INT DEFAULT 0,
    creator_ID  VARCHAR(10),
    FOREIGN KEY (creator_ID) REFERENCES Admin (ID)
);

CREATE TABLE Tech
(
    ID          VARCHAR(10) PRIMARY KEY,
    full_name   VARCHAR(150) NOT NULL,
    national_ID VARCHAR(10)  NOT NULL,
    salary      INT DEFAULT 0,
    creator_ID  VARCHAR(10),
    FOREIGN KEY (creator_ID) REFERENCES Admin (ID)
);
