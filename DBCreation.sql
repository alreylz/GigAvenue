-- DB CREATION SCRIPT
DROP DATABASE IF EXISTS `GigAvenueDB`;
CREATE DATABASE IF NOT EXISTS `GigAvenueDB`;
USE GigAvenueDB;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS tickets ;
DROP TABLE IF EXISTS galleries ;
DROP TABLE IF EXISTS events ;
DROP TABLE IF EXISTS state ;
DROP TABLE IF EXISTS users ;
COMMIT;
-- CHECK THE ONLY DATABASE ACCESSIBLE IS THE ONE WE GRANTED PRIVILEGES TO
-- SHOW DATABASES;
-- Set as default database the GigAvenueDB

CREATE TABLE users (
idusers int PRIMARY KEY AUTO_INCREMENT,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
email varchar(50) NOT NULL UNIQUE ,
passwd varchar(50) NOT NULL,
profile_picture BOOLEAN NOT NULL,
reg_date DATETIME NOT NULL,
tickets_bought INT NOT NULL,
events_published INT NOT NULL,
is_Admin BOOLEAN NOT NULL);


CREATE TABLE events (
 idevents int PRIMARY KEY auto_increment,
 event_title varchar(50) NOT NULL,
 artist varchar(50) NOT NULL,
 price DOUBLE NOT NULL,
 total_tickets BIGINT NOT NULL,
 sold_tickets BIGINT NOT NULL,
 event_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 event_owner int NOT NULL,
 event_place varchar(50) NOT NULL,
 event_category varchar(50) NOT NULL,
 state varchar(15) NOT NULL ,
 description VARCHAR(20000) NOT NULL,
 FOREIGN KEY (event_owner) REFERENCES users(idusers)
 );
 
CREATE TABLE galleries (
idgalleries int PRIMARY KEY auto_increment,
event_id INT NOT NULL,
picPath varchar(100) ,
order_img INT NOT NULL, 
FOREIGN KEY (event_id) REFERENCES events(idevents)
);

CREATE TABLE tickets (
idtickets int PRIMARY KEY auto_increment,
event_id INT,
user_id INT,
price DOUBLE NOT NULL,
purchase_date DATETIME NOT NULL,
FOREIGN KEY (event_id) REFERENCES events(idevents),
FOREIGN KEY (user_id) REFERENCES users(idusers)
);
CREATE TABLE messages(
idmessages int PRIMARY KEY auto_increment,
event_id INT NOT NULL,
direction INT NOT NULL,
message varchar(1000) NOT NULL,
FOREIGN KEY (event_id) REFERENCES events(idevents)
);

COMMIT;

