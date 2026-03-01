# Rental Car Database

A normalized relational database system for a car rental business, built with Microsoft SQL Server. Designed to manage customers, vehicles, rental transactions, payments, and locations with business logic implemented through triggers, stored procedures, and analytical queries.

## ER Diagram

The entity-relationship diagram is included in `ERD.docx`.

**Tables:** Customers, Cars, Rentals, Payments, Location

## Database Schema

| Table | Primary Key | Description |
|-------|-------------|-------------|
| **Locations** | LocationID | 10 rental center locations across the US |
| **Cars** | CarID | 20 vehicles with make, model, year, type, daily rate, and availability status |
| **Customers** | CustomerID | 10 customers with contact info and driver's license |
| **Rentals** | RentalID | 20 rental transactions linking customers to cars with date ranges |
| **Payments** | PaymentID | Payment records tied to rentals |

### Relationships
- Cars belong to a Location (FK: LocationID)
- Rentals reference a Car (FK: CarID) and a Customer (FK: CustomerID)
- Payments reference a Rental (FK: RentalID)

## Features

- **Trigger** (`calculate_total_cost`) -- Automatically calculates rental cost on insertion using the date range and the vehicle's daily rate
- **Stored Procedure** (`GetCarComparison`) -- Compares a car's daily rate against the average rate for available cars of the same type
- **Joins** -- INNER JOIN, LEFT OUTER JOIN, RIGHT OUTER JOIN across multiple tables
- **Aggregates** -- Revenue reporting with SUM, AVG, COUNT and GROUP BY / HAVING
- **Nested Queries** -- Subqueries for above-average cost analysis and dynamic payment amounts
- **Sample Data** -- 10 locations, 20 cars, 10 customers, 20 rentals with realistic data

## Files

| File | Description |
|------|-------------|
| `RentalCarDBQuery.sql` | Final version -- complete schema, data, queries, trigger, and stored procedure |
| `RentalCarDBver0.sql` | Earlier draft version |
| `ERD.docx` | Entity-Relationship Diagram |

## Tech Stack

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

## How to Run

1. Open SQL Server Management Studio and connect to your server
2. Open `RentalCarDBQuery.sql`
3. Execute the script in order:
   - Table creation (CREATE TABLE statements)
   - Data insertion (INSERT statements)
   - Queries (SELECT statements with joins, aggregates, nested queries)
   - Trigger creation (CREATE TRIGGER)
   - Stored procedure creation and execution (CREATE PROCEDURE / EXECUTE)

> **Note:** The trigger must be created before inserting new rentals for auto-cost calculation to work. The sample data inserts precede the trigger definition, so those rows use pre-set values.
