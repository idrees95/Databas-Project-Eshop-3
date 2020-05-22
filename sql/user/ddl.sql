--
-- Created By idrees Safi(idsa18)
-- Database course BTH 2020

USE eshop;

--
-- User table
--
DROP TABLE IF EXISTS user;
CREATE TABLE user
(
    akronym CHAR(8),
    password CHAR(32),

    PRIMARY KEY (akronym)
);

-- Users are created with the following username and passwords.
INSERT INTO user VALUES
	("user1", MD5("pass1")),
	("user2", MD5("pass2"))
;


--
-- SP to login
--
DROP PROCEDURE IF EXISTS loginUser;
DELIMITER //
CREATE PROCEDURE loginUser(
	aUsername CHAR(8),
    aPassword CHAR(32)
)
BEGIN
    SELECT
		akronym AS acronym
    FROM user
    WHERE
		akronym = aUsername
        AND password = MD5(aPassword)
    ;
END
//
DELIMITER ;

CALL loginUser("user1", "pass1");
