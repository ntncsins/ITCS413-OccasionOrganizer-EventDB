USE OccasionOrganize;

-- --
-- Loading 
-- Run the `P5_G15_189_190_210_CREATION.sql` file first to establish the database structure.
-- Before running the data loading script, ensure all data files are placed in `C:\ProgramData\MySQL\MySQL Server 8.0\Uploads` so that MySQL can access them.
-- --
-- DROP TABLE XX;

-- Attendees
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Attendees.csv'
INTO TABLE Attendee
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Sponsor
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Sponsor.csv'
INTO TABLE Sponsor
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, sponsor_name, sponsor_detail, amount);

-- Location
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Location.csv'
INTO TABLE Location
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, location_name, location_address);

-- Artist
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Artist.csv'
INTO TABLE Artist
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, full_name, genre, contact_details, location_id);

-- Equipment
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Equipment.csv'
INTO TABLE Equipment
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, equipment_name, equipment_type, status, quantity, cost_planned, cost_actual);

-- Concert
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Concert.csv'
INTO TABLE Concert
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, concert_name, sponsor_id, location_id, equipment_id, artist_id);

-- Ticket
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Ticket.csv'
INTO TABLE Ticket
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID, Serial_Number, Gate, Zone, Seat, Price, Date, Start_Time, End_Time, attendee_id, concert_id);

-- Admins
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Admin.csv'
INTO TABLE Admin
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, first_name, last_name, username, password, concert_id);

-- Participate
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Participate.csv'
INTO TABLE Participate
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(artist_id, concert_id, date, start_time, end_time);

