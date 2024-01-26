--

Create Database AIRRESERVE;
use AIRRESERVE;



create Table Admin_log(admin_name VARCHAR(10) Primary Key, admin_pass VARCHAR(10));
Insert into Admin_log(admin_name , admin_pass)
VALUES('admin','admin');
Insert into Admin_log(admin_name , admin_pass)
VALUES('Tanmoy','admin');

create table flight_details(flight_id VARCHAR(14) Primary Key, flight_no VARCHAR(14), flight_name VARCHAR(20), from_city VARCHAR(70), to_city VARCHAR(70), date_of_flight VARCHAR(10), flight_arrival_time VARCHAR(20), flight_reach_time VARCHAR(20), duration VARCHAR(20), first_class_seat INT(5), first_class_seat_booked INT(5), first_class_seat_aval INT(5), buss_class_seat INT(5), buss_class_seat_booked INT(5), buss_class_seat_aval INT(5), eco_class_seat INT(5), eco_class_seat_booked INT(5), eco_class_seat_aval INT(5),first_class_price INT(10), buss_class_price INT(10), eco_class_price INT(10))ENGINE=INNODB;

create table user_details(fullname VARCHAR(20), username VARCHAR(20) Primary Key, password VARCHAR(20), mobileno VARCHAR(15), email_address VARCHAR(40), city VARCHAR(30), state VARCHAR(30), pincode INT(10))ENGINE=INNODB;

create table booking_details(username VARCHAR(14), flight_no VARCHAR(14), date_of_flight VARCHAR(10), no_of_seats INT(10), ticket_type VARCHAR(20), adults INT(5), child INT(5), PNR VARCHAR(10) Primary Key)ENGINE=INNODB;

create table payment_details(PNR VARCHAR(10) Primary Key, transaction_id VARCHAR(20), address VARCHAR(100), payment_gateway VARCHAR(20), payment_id VARCHAR(45), fair INT(10), coupon VARCHAR(15), discount INT(10), actual_fair INT(10))ENGINE=INNODB;

create table coupon_table(cname VARCHAR(10) Primary Key, discoutnpercentage INT(5))ENGINE=INNODB;

create table contact_table(name VARCHAR(40), email VARCHAR(50), subject VARCHAR(120), message VARCHAR(250))ENGINE=INNODB;

CREATE TABLE Newsletter ( id int NOT NULL AUTO_INCREMENT, emails varchar(169) NOT NULL, PRIMARY KEY (id))ENGINE=INNODB;


-- Create Database AIRRESERVE;
CREATE DATABASE ethiopian_air_line2;

-- Connect to the AIRRESERVE database;
\c ethiopian_air_line2;

-- Create Table Admin_log
CREATE TABLE Admin_log (
                           admin_name VARCHAR(10) PRIMARY KEY,
                           admin_pass VARCHAR(10)
);

-- Insert data into Admin_log
INSERT INTO Admin_log (admin_name, admin_pass) VALUES ('admin', 'admin');
INSERT INTO Admin_log (admin_name, admin_pass) VALUES ('Tanmoy', 'admin');

-- Create table flight_details
CREATE TABLE flight_details (
                                flight_id VARCHAR(14) PRIMARY KEY,
                                flight_no VARCHAR(14),
                                flight_name VARCHAR(20),
                                from_city VARCHAR(70),
                                to_city VARCHAR(70),
                                date_of_flight DATE,
                                flight_arrival_time VARCHAR(20),
                                flight_reach_time VARCHAR(20),
                                duration VARCHAR(20),
                                first_class_seat INT,
                                first_class_seat_booked INT,
                                first_class_seat_aval INT,
                                buss_class_seat INT,
                                buss_class_seat_booked INT,
                                buss_class_seat_aval INT,
                                eco_class_seat INT,
                                eco_class_seat_booked INT,
                                eco_class_seat_aval INT,
                                first_class_price INT,
                                buss_class_price INT,
                                eco_class_price INT
);

-- Create table user_details
CREATE TABLE user_details (
                              fullname VARCHAR(20),
                              username VARCHAR(20) PRIMARY KEY,
                              password VARCHAR(20),
                              mobileno VARCHAR(15),
                              email_address VARCHAR(40),
                              city VARCHAR(30),
                              state VARCHAR(30),
                              pincode VARCHAR(30)
);

-- Create table booking_details
CREATE TABLE booking_details (
                                 username VARCHAR(14),
                                 flight_no VARCHAR(14),
                                 date_of_flight DATE,
                                 no_of_seats INT,
                                 ticket_type VARCHAR(20),
                                 adults INT,
                                 child INT,
                                 PNR VARCHAR(10) PRIMARY KEY
);

-- Create table payment_details
CREATE TABLE payment_details (
                                 PNR VARCHAR(10) PRIMARY KEY,
                                 transaction_id VARCHAR(20),
                                 address VARCHAR(100),
                                 payment_gateway VARCHAR(20),
                                 payment_id VARCHAR(45),
                                 fair INT,
                                 coupon VARCHAR(15),
                                 discount INT,
                                 actual_fair INT
);

-- Create table coupon_table
CREATE TABLE coupon_table (
                              cname VARCHAR(10) PRIMARY KEY,
                              discount_percentage INT
);

-- Create table contact_table
CREATE TABLE contact_table (
                               name VARCHAR(40),
                               email VARCHAR(50),
                               subject VARCHAR(120),
                               message VARCHAR(250)
);

-- Create table Newsletter
CREATE TABLE Newsletter (
                            id SERIAL PRIMARY KEY,
                            emails VARCHAR(169) NOT NULL
);
