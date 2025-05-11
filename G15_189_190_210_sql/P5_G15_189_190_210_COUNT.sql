USE OccasionOrganize;

-- --
-- After placing the data files in the required location, use the `P4_G15_189_190_210_LOADING.sql` file to load the data into the database.
-- Once the database structure is set and the data is loaded, run the `P4_G15_189_190_210_COUNT.sql` file to report the number of records in each table.
-- --

-- Table Attendee
SELECT * FROM Attendee;
-- Number of record table Attendee
SELECT COUNT(*) FROM Attendee;

-- Table Ticket
SELECT * FROM Ticket;
-- Number of record table Ticket
SELECT COUNT(*) FROM Ticket;

-- Table Sponsor
SELECT * FROM Sponsor;
-- Number of record table Sponsor
SELECT COUNT(*) FROM Sponsor;

-- Table Location
SELECT * FROM Location;
-- Number of record table Location
SELECT COUNT(*) FROM Location;

-- Table Concert
SELECT * FROM Concert;
-- Number of record table Concert
SELECT COUNT(*) FROM Concert;

-- Table Admin
SELECT * FROM Admin;
-- Number of record table Admin
SELECT COUNT(*) FROM Admin;

-- Table Artist
SELECT * FROM Artist;
-- Number of record table Artist
SELECT COUNT(*) FROM Artist;

-- Table Equipment
SELECT * FROM Equipment;
-- Number of record table Equipment
SELECT COUNT(*) FROM Equipment;

-- Table Participate
SELECT * FROM Participate;
-- Number of record table Participate
SELECT COUNT(*) FROM Participate;

