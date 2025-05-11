USE OccasionOrganize;

-- --
-- After placing the data files in the required location, use the `P5_G15_189_190_210_LOADING.sql` file to load the data into the database.
-- Once the database structure is set and the data is loaded, run the `P5_G15_189_190_210_SELECTED-TRANSACTIONS.sql` file to report selected transactions (or queries) and the number records in the table and the record sizes.
-- --

-- Choose at least three transactions (or queries)
-- Data queries 
-- (a) List the details of the ticket by the attendee who owned the ticket 
SELECT
    Attendee.name,
    Attendee.email,
    Ticket.serial_number,
    Ticket.gate,
    Ticket.zone,
    Ticket.seat,
    Ticket.price,
    Ticket.date,
    Ticket.start_time,
    Ticket.end_time
FROM
    Ticket
JOIN
    Attendee ON Ticket.attendee_id = Attendee.id;

-- Create index
CREATE INDEX idx_ticket_attendee_id ON Ticket (attendee_id);
CREATE INDEX idx_attendee_id ON Attendee (id);
CREATE UNIQUE INDEX idx_ticket_serial_number ON Ticket (serial_number);

-- The number records in the table
SELECT COUNT(*)
FROM Ticket
JOIN Attendee ON Ticket.attendee_id = Attendee.id;

-- The record sizes
SELECT
    SUM(
        LENGTH(Attendee.name) +
        LENGTH(Attendee.email) +
        LENGTH(Ticket.serial_number) +
        LENGTH(Ticket.gate) +
        LENGTH(Ticket.zone) +
        LENGTH(Ticket.seat) +
        LENGTH(CAST(Ticket.price AS CHAR)) +
        LENGTH(CAST(Ticket.date AS CHAR)) +
        LENGTH(CAST(Ticket.start_time AS CHAR)) +
        LENGTH(CAST(Ticket.end_time AS CHAR))
    ) AS total_record_size
FROM Ticket
JOIN Attendee ON Ticket.attendee_id = Attendee.id;

-- ----------------------------------------------------------------------------------------------- --
-- (b) List the details of the concert ascending by ticket ID.
SELECT 
    Ticket.id AS TicketID,
    Ticket.serial_number AS SerialNumber,
    Ticket.gate AS Gate,
    Ticket.zone AS Zone,
    Ticket.seat AS Seat,
    Ticket.price AS Price,
    Ticket.date AS Date,
    Ticket.start_time AS StartTime,
    Ticket.end_time AS EndTime,
    Concert.concert_name AS ConcertName
FROM 
    Ticket
INNER JOIN 
    Concert 
ON 
    Ticket.concert_id = Concert.id
ORDER BY 
    TicketID ASC;

-- Create index
CREATE INDEX idx_ticket_concert_id ON Ticket(concert_id);
CREATE INDEX idx_ticket_id_concert ON Ticket(id, concert_id);

-- The number records in the table
SELECT COUNT(*)
FROM Ticket
INNER JOIN Concert ON Ticket.concert_id = Concert.id;

-- The record sizes
SELECT 
    SUM(
        LENGTH(CAST(Ticket.id AS CHAR)) +
        LENGTH(Ticket.serial_number) +
        LENGTH(Ticket.gate) +
        LENGTH(Ticket.zone) +
        LENGTH(Ticket.seat) +
        LENGTH(CAST(Ticket.price AS CHAR)) +
        LENGTH(CAST(Ticket.date AS CHAR)) +
        LENGTH(CAST(Ticket.start_time AS CHAR)) +
        LENGTH(CAST(Ticket.end_time AS CHAR)) +
        LENGTH(Concert.concert_name)
    ) AS total_record_size
FROM Ticket
INNER JOIN Concert ON Ticket.concert_id = Concert.id;

-- ----------------------------------------------------------------------------------------------- --
-- (e) List the details of the sponsor who supported the concert.
ALTER TABLE Ticket
ADD COLUMN sponsor_id INT;

UPDATE Ticket
SET sponsor_id = 5001 + MOD(CEIL((id - 300300000) / 200), 110)
WHERE id BETWEEN 300300000 AND 300527132;

SELECT 
    A.name, 
    T.price, 
    T.zone, 
    T.seat, 
    C.concert_name, 
    S.sponsor_name,
    S.sponsor_detail
FROM 
    Attendee A
JOIN 
    Ticket T ON A.id = T.attendee_id
JOIN 
    Concert C ON T.concert_id = C.id
JOIN 
    Sponsor S ON T.sponsor_id = S.id
ORDER BY RAND()
LIMIT 50000;

-- Create index
CREATE INDEX idx_concert_id ON Ticket(concert_id);
CREATE INDEX idx_sponsor_id ON Ticket(sponsor_id);

-- The number records in the table
SELECT COUNT(*)
FROM Attendee A
JOIN Ticket T ON A.id = T.attendee_id
JOIN Concert C ON T.concert_id = C.id
JOIN Sponsor S ON T.sponsor_id = S.id;

-- The record sizes
SELECT 
    SUM(
        LENGTH(A.name) +
        LENGTH(CAST(T.price AS CHAR)) +
        LENGTH(T.zone) +
        LENGTH(T.seat) +
        LENGTH(C.concert_name) +
        LENGTH(S.sponsor_name) +
        LENGTH(S.sponsor_detail)
    ) AS total_record_size
FROM Attendee A
JOIN Ticket T ON A.id = T.attendee_id
JOIN Concert C ON T.concert_id = C.id
JOIN Sponsor S ON T.sponsor_id = S.id;




