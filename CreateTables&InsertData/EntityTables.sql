CREATE TABLE Admin
(
    ID          INT PRIMARY KEY AUTO_INCREMENT,
    full_name   VARCHAR(150) NOT NULL,
    national_ID VARCHAR(10)  NOT NULL,
    salary      INT DEFAULT 0
);

CREATE TABLE Support
(
    ID          INT PRIMARY KEY AUTO_INCREMENT,
    full_name   VARCHAR(150) NOT NULL,
    national_ID VARCHAR(10)  NOT NULL,
    salary      INT DEFAULT 0,
    creator_ID  INT,
    FOREIGN KEY (creator_ID) REFERENCES Admin (ID)
);

CREATE TABLE Tech
(
    ID          INT PRIMARY KEY AUTO_INCREMENT,
    full_name   VARCHAR(150) NOT NULL,
    national_ID VARCHAR(10)  NOT NULL,
    salary      INT DEFAULT 0,
    creator_ID  INT,
    FOREIGN KEY (creator_ID) REFERENCES Admin (ID)
);

# tech - support

CREATE TABLE Package
(
    ID             INT PRIMARY KEY AUTO_INCREMENT,
    creation_time  TIMESTAMP               DEFAULT CURRENT_TIMESTAMP,
    package_name   VARCHAR(150)   NOT NULL DEFAULT 'Free' UNIQUE,
    price          FLOAT UNSIGNED NOT NULL,
    specifications VARCHAR(500),
    creator_ID     INT,
    FOREIGN KEY (creator_ID) REFERENCES Admin (ID)
);


CREATE TABLE Customer
(
    ID                 INT PRIMARY KEY AUTO_INCREMENT,
    full_name          VARCHAR(150) NOT NULL,
    phone_number       VARCHAR(11)  NOT NULL,
    current_package_ID INT DEFAULT 1,
    FOREIGN KEY (current_package_ID) REFERENCES Package (ID)
);

# customer - admin

CREATE TABLE Ticket
(
    ID            INT PRIMARY KEY AUTO_INCREMENT,
    creation_time TIMESTAMP                                                 DEFAULT CURRENT_TIMESTAMP,
    end_time      TIMESTAMP,
    status        ENUM ('CREATED', 'WAITING','ANSWERED', 'CLOSED') NOT NULL DEFAULT 'CREATED',
    content       VARCHAR(500)                                     NOT NULL,
    creator_ID    INT,
    support_ID    INT,
    tech_ID       INT,
    FOREIGN KEY (creator_ID) REFERENCES Customer (ID),
    FOREIGN KEY (support_ID) REFERENCES Support (ID),
    FOREIGN KEY (tech_ID) REFERENCES Tech (ID)

);


CREATE TABLE TestDesigner
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    user_name  VARCHAR(100) NOT NULL,
    password   VARCHAR(20)  NOT NULL,
    creator_ID INT,
    FOREIGN KEY (creator_ID) REFERENCES Customer (ID)
);

CREATE TABLE Course
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(100) NOT NULL,
    creator_ID INT,
    FOREIGN KEY (creator_ID) REFERENCES Customer (ID)
);
# course - testDesigner

CREATE TABLE Test
(
    ID        INT PRIMARY KEY AUTO_INCREMENT,
    name      VARCHAR(100) NOT NULL,
    course_ID INT,
    FOREIGN KEY (course_ID) REFERENCES Course (ID)
);
# test - testDesigner

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
# question - test

CREATE TABLE Responder
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    user_name  VARCHAR(100) NOT NULL,
    password   VARCHAR(20)  NOT NULL,
    creator_ID INT,
    FOREIGN KEY (creator_ID) REFERENCES TestDesigner (ID)
);

# test - responder -> attempt(time, grade, ...)
# question - responder -> attempt(time, grade, ...)