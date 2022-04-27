CREATE TABLE Customer
(
    ID                 INT PRIMARY KEY AUTO_INCREMENT,
    full_name          VARCHAR(150) NOT NULL,
    phone_number       VARCHAR(11)  NOT NULL,
    current_package_ID INT DEFAULT 1,
    FOREIGN KEY (current_package_ID) REFERENCES Package (ID)
);