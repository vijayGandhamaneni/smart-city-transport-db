-- ==============================
-- Smart City Transport DB Schema
-- ==============================

-- Passengers
CREATE TABLE Passengers (
    passenger_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    age INT,
    gender VARCHAR(10)
);

-- Drivers
CREATE TABLE Drivers (
    driver_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    license_no VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    experience_years INT
);

-- Buses
CREATE TABLE Buses (
    bus_id SERIAL PRIMARY KEY,
    bus_number VARCHAR(20) UNIQUE NOT NULL,
    capacity INT NOT NULL,
    type VARCHAR(20) CHECK (type IN ('AC','Non-AC','Electric'))
);

-- Routes
CREATE TABLE Routes (
    route_id SERIAL PRIMARY KEY,
    route_name VARCHAR(100) NOT NULL,
    source VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    distance_km DECIMAL(5,2) NOT NULL
);

-- Schedules
CREATE TABLE Schedules (
    schedule_id SERIAL PRIMARY KEY,
    bus_id INT REFERENCES Buses(bus_id) ON DELETE CASCADE,
    route_id INT REFERENCES Routes(route_id) ON DELETE CASCADE,
    driver_id INT REFERENCES Drivers(driver_id) ON DELETE CASCADE,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL
);

-- Tickets
CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    passenger_id INT REFERENCES Passengers(passenger_id) ON DELETE CASCADE,
    schedule_id INT REFERENCES Schedules(schedule_id) ON DELETE CASCADE,
    seat_no VARCHAR(10),
    fare DECIMAL(8,2) NOT NULL,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payments
CREATE TABLE Payments (
    payment_id SERIAL PRIMARY KEY,
    ticket_id INT REFERENCES Tickets(ticket_id) ON DELETE CASCADE,
    payment_method VARCHAR(20) CHECK (payment_method IN ('UPI','Card','Cash','Wallet')),
    payment_status VARCHAR(20) CHECK (payment_status IN ('success','failed','pending')),
    txn_reference VARCHAR(50),
    amount DECIMAL(8,2) NOT NULL
);
