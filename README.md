# ITCS413-Organizer-EventDB
Database design project for a fictional concert and event management system, developed for ITCS413-Database Design

## Project Overview

**OccasionOrganizer** is a fictional event management company specializing in concerts. This project aims to address key challenges in event logistics, ticketing, artist-sponsor coordination, and system scalability through proper database design and implementation.

## Project Phase Summary

- **P1 – Requirement Analysis**  
  Identified major issues such as manual ticketing, scattered data sources, lack of communication tools, and poor scalability.

- **P2 – Conceptual Design**  
  Designed a high-level ER diagram covering all essential entities like concerts, tickets, attendees, sponsors, artists, and equipment.

- **P3 – Logical Design**  
  Mapped the ER model to normalized relational schemas (3NF) with defined primary/foreign keys and constraints.

- **P4 – Implementation**  
  Implemented the schema using SQL Server and loaded large-scale sample data (e.g., 200,000+ ticket records) from CSV files.

- **P5 – Tuning & Optimization**  
  Improved performance of key queries using indexes and analyzed execution time before and after tuning.

## Dataset

The `/dataset/` folder contains sample data in CSV format for all key tables:

| Table         | Description                            |
|---------------|----------------------------------------|
| `Admin.csv`     | System administrators and credentials  |
| `Artist.csv`    | Performing artists and related info    |
| `Attendees.csv` | Users who purchased tickets            |
| `Concert.csv`   | Event details such as date and venue   |
| `Equipment.csv` | Equipment used in each concert         |
| `Location.csv`  | Concert venue data                     |
| `Participate.csv` | Artist participation records         |
| `Sponsor.csv`   | Sponsorship information                |
| `Ticket.csv`    | Ticket purchase records                |

These datasets can be imported into SQL Server using `BULK INSERT` or database import tools.

## SQL Scripts

Located in the `/sql/` folder:

- `creation.sql` — Defines tables, primary keys, and constraints  
- `loading.sql` — Loads the CSV datasets into the database  
- `count_records.sql` — Verifies the number of records per table  
- `selected_transactions.sql` — Optimized queries used in Phase 5

## Contributors

**Group 15 — ITCS413: Database Design**  
- Chommakorn Sontesadisai — 6488189  
- Nattanicha Sinsawet — 6488190  
- Ravikarn Jarungjitvittawas — 6488210

**Instructor:** Asst. Prof. Dr. Charnyote Pluempitiwiriyawej  
Faculty of Information and Communication Technology  
Mahidol University

## License

This project is for academic and educational purposes only. Please give appropriate credit if referenced or reused.
