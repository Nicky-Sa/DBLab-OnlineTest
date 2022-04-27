# customer - admin
CREATE TABLE Promote
(
    ID           INT PRIMARY KEY AUTO_INCREMENT,
    promote_time TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    comment      VARCHAR(500) DEFAULT 'No comment!',
    package_ID   INT,
    admin_ID     INT,
    customer_ID  INT,
    FOREIGN KEY (admin_ID) REFERENCES Admin (ID),
    FOREIGN KEY (customer_ID) REFERENCES Customer (ID),
    FOREIGN KEY (package_ID) REFERENCES Package (ID)
);