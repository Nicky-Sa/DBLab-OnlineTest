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
