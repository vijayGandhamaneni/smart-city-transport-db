his will be structured, ATS-friendly, and ready to push to GitHub.

# 🚍 Smart City Transport Database

A relational database system for managing **public bus transportation** in a smart city.  
This project simulates **buses, routes, drivers, conductors, tickets, and passengers** while also running analytical queries to derive insights like revenue, occupancy, and usage patterns.

---

## 📌 Tech Stack
- **PostgreSQL 15** – Database
- **Docker** – Containerized database environment
- **SQL** – Schema design, data insertion, analytical queries

---

## 📂 Project Structure


smart-city-transport-db/
│── schema.sql # Database schema (tables & relationships)
│── sample_data.sql # Insert sample data (drivers, buses, routes, tickets)
│── queries.sql # Analytical queries for insights
│── README.md # Project documentation


---

## ⚡ Features
- Manage buses, drivers, conductors, passengers, and routes
- Ticket booking system with fare and time tracking
- Analytical queries for:
  - Ticket sales per route
  - Total revenue by route
  - Occupancy percentage by bus
  - Driver and conductor workload
  - Peak travel hours
  - Passenger trip frequency

---

## ▶️ How to Run

### 1️⃣ Start PostgreSQL with Docker
```bash
docker run --name smartcitydb -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=smartcitydb -d postgres:15

2️⃣ Copy SQL files into the container
docker cp schema.sql smartcitydb:/tmp/schema.sql
docker cp sample_data.sql smartcitydb:/tmp/sample_data.sql
docker cp queries.sql smartcitydb:/tmp/queries.sql

3️⃣ Create tables and insert data
docker exec -it smartcitydb psql -U postgres -d smartcitydb -f /tmp/schema.sql
docker exec -it smartcitydb psql -U postgres -d smartcitydb -f /tmp/sample_data.sql

4️⃣ Run analytical queries
docker exec -it smartcitydb psql -U postgres -d smartcitydb -f /tmp/queries.sql

📊 Sample Outputs
🔹 Tickets sold per route
 route_name | total_tickets
------------+---------------
 Route 1    |             4
 Route 5    |             4
 Route 4    |             4
 Route 3    |             4
 Route 2    |             4

🔹 Revenue per route
 route_name | total_revenue
------------+---------------
 Route 5    |        180.00
 Route 3    |        140.00
 Route 1    |        120.00
 Route 4    |         80.00
 Route 2    |         50.00

🔹 Bus occupancy
 bus_number | occupancy_percent
------------+----------------------
 KA01AB1234 |  8.00
 KA02XY5678 | 10.00
 KA04LM1357 |  8.89
 KA03PQ2468 |  6.67
 KA05RS7890 |  7.27

🔹 Driver workload
   full_name   | total_trips
---------------+-------------
 Deepak Verma  |           2
 Vijay Kumar   |           2
 Suresh Yadav  |           2
 Rajesh Sharma |           2
 Mohammed Ali  |           2

🔹 Peak booking hours
 booking_hour | tickets_sold
--------------+--------------
            6 |           20

🔹 Frequent passengers
 full_name  | total_trips
------------+-------------
 Sneha Reddy |           2
 Rohan Mehta |           2
 Ravi Kumar  |           2
 Arjun Patel |           2
 Divya Iyer  |           2

📌 Use Cases

SQL portfolio project for Data Engineer / SQL Developer resumes

Demonstrates database schema design, data population, and analytics

Can be extended with real-time data pipelines for advanced data engineering

👨‍💻 Author

Vijay Kiran Chowdary Gandhamaneni