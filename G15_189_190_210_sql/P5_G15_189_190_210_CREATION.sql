CREATE DATABASE IF NOT EXISTS OccasionOrganize;
USE OccasionOrganize;
-- DROP DATABASE IF EXISTS OccasionOrganize;

-- --
-- Creation 
-- --

-- Creating the Attendee table
CREATE TABLE Attendee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    username VARCHAR(255),
    password VARCHAR(255)
);

-- Creating the Sponsor table
CREATE TABLE Sponsor (
    id INT PRIMARY KEY,
    sponsor_name VARCHAR(255),
    sponsor_detail TEXT,
    amount DECIMAL(10,2)
);

-- Creating the Location table
CREATE TABLE Location (
    id INT PRIMARY KEY,
    location_name VARCHAR(255),
    location_address VARCHAR(255)
);

-- Creating the Artist table
CREATE TABLE Artist (
    id INT PRIMARY KEY,
    full_name VARCHAR(255),
    genre VARCHAR(255),
    contact_details TEXT,
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES Location(id)
);

-- Creating the Equipment table
CREATE TABLE Equipment (
    id INT PRIMARY KEY,
    equipment_name VARCHAR(255),
    equipment_type VARCHAR(255),
    status VARCHAR(255),
	quantity DECIMAL(8,2),
    cost_planned DECIMAL(10,2),
    cost_actual DECIMAL(10,2)
);

-- Creating the Concert table
CREATE TABLE Concert (
    id INT PRIMARY KEY,
    concert_name VARCHAR(255),
    sponsor_id INT,
    location_id INT,
    equipment_id INT,
    artist_id INT,
    FOREIGN KEY (sponsor_id) REFERENCES Sponsor(id),
    FOREIGN KEY (location_id) REFERENCES Location(id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(id),
    FOREIGN KEY (artist_id) REFERENCES Artist(id)
);

-- Creating the Ticket table
CREATE TABLE Ticket (
    id INT PRIMARY KEY,
    serial_number VARCHAR(20),
    gate INT,
    zone VARCHAR(10),
    seat VARCHAR(10),
    price DECIMAL(10, 2),
    date DATE,
    start_time TIME,
    end_time TIME,
    attendee_id INT,
    concert_id INT,
    FOREIGN KEY (attendee_id) REFERENCES Attendee(id),
    FOREIGN KEY (concert_id) REFERENCES Concert(id)
);

-- Creating the Admin table
CREATE TABLE Admin (
    id INT PRIMARY KEY,
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    username VARCHAR(64),
    password VARCHAR(64),
    concert_id INT,
    FOREIGN KEY (concert_id) REFERENCES Concert(id)
);

-- Creating the Participate table (associative table for Artists and Concerts)
CREATE TABLE Participate (
    artist_id INT,
    concert_id INT,
    date DATE,
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (artist_id) REFERENCES Artist(id),
    FOREIGN KEY (concert_id) REFERENCES Concert(id)
);


