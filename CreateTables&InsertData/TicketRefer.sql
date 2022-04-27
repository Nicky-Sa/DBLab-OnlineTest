# tech - support
CREATE TABLE TicketRefer
(
    ID         INT PRIMARY KEY AUTO_INCREMENT,
    end_time   TIMESTAMP,
    ticket_ID  INT,
    support_ID INT,
    tech_ID    INT,
    FOREIGN KEY (ticket_ID) REFERENCES Ticket (ID),
    FOREIGN KEY (support_ID) REFERENCES Support (ID),
    FOREIGN KEY (tech_ID) REFERENCES Tech (ID)
);
