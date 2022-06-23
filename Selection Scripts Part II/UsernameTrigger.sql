CREATE TABLE UsernameChanges
(
    ID              INT PRIMARY KEY AUTO_INCREMENT,
    testDesigner_ID INT,
    change_date     TIMESTAMP NOT NULL,
    FOREIGN KEY (testDesigner_ID) REFERENCES TestDesigner (ID)
)



DELIMITER $$
CREATE TRIGGER BeforeUsernameChanges
    BEFORE UPDATE
    ON TestDesigner
    FOR EACH ROW
BEGIN
    Declare total_changes INT;
    SET total_changes = (SELECT count(testDesigner_ID)
                         FROM UsernameChanges
                         WHERE testDesigner_ID = NEW.ID
                           AND TIMESTAMPDIFF(DAY, change_date, CURRENT_TIMESTAMP) = 0);
    IF (total_changes < 2) THEN
        INSERT INTO UsernameChanges(testDesigner_ID, change_date) VALUES (OLD.ID, CURRENT_TIMESTAMP);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NOT MORE THAN 2 USERNAME CHANGE A DAY ALLOWED!';
    END IF;
END $$
DELIMITER ;
