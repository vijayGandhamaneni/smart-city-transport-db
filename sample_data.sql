-- ==============================
-- Insert Sample Data
-- ==============================

-- Passengers
INSERT INTO Passengers (full_name, email, phone, age, gender) VALUES
('Ravi Kumar', 'ravi.kumar@example.com', '987650001', 28, 'Male'),
('Ananya Sharma', 'ananya.sharma@example.com', '987650002', 24, 'Female'),
('Vikram Singh', 'vikram.singh@example.com', '987650003', 32, 'Male'),
('Meera Nair', 'meera.nair@example.com', '987650004', 27, 'Female'),
('Arjun Patel', 'arjun.patel@example.com', '987650005', 30, 'Male'),
('Sneha Reddy', 'sneha.reddy@example.com', '987650006', 22, 'Female'),
('Karthik Rao', 'karthik.rao@example.com', '987650007', 35, 'Male'),
('Divya Iyer', 'divya.iyer@example.com', '987650008', 26, 'Female'),
('Rohan Mehta', 'rohan.mehta@example.com', '987650009', 29, 'Male'),
('Priya Das', 'priya.das@example.com', '987650010', 23, 'Female');

-- Drivers
INSERT INTO Drivers (full_name, license_no, phone, experience_years) VALUES
('Suresh Yadav', 'DL12345', '999110001', 5),
('Rajesh Sharma', 'DL12346', '999110002', 8),
('Mohammed Ali', 'DL12347', '999110003', 10),
('Deepak Verma', 'DL12348', '999110004', 3),
('Vijay Kumar', 'DL12349', '999110005', 7);

-- Buses
INSERT INTO Buses (bus_number, capacity, type) VALUES
('KA01AB1234', 50, 'AC'),
('KA02XY5678', 40, 'Non-AC'),
('KA03PQ2468', 60, 'Electric'),
('KA04LM1357', 45, 'AC'),
('KA05RS7890', 55, 'Non-AC');

-- Routes
INSERT INTO Routes (route_name, source, destination, distance_km) VALUES
('Route 1', 'MG Road', 'Electronic City', 20.5),
('Route 2', 'Whitefield', 'Majestic', 18.0),
('Route 3', 'Hebbal', 'Silk Board', 22.3),
('Route 4', 'Yeshwanthpur', 'BTM Layout', 15.2),
('Route 5', 'Kengeri', 'KR Puram', 25.0);

-- Schedules
INSERT INTO Schedules (bus_id, route_id, driver_id, departure_time, arrival_time) VALUES
(1, 1, 1, NOW() - INTERVAL '2 HOUR', NOW() - INTERVAL '1 HOUR 30 MINUTE'),
(2, 2, 2, NOW() - INTERVAL '1 HOUR', NOW() - INTERVAL '30 MINUTE'),
(3, 3, 3, NOW(), NOW() + INTERVAL '40 MINUTE'),
(4, 4, 4, NOW() + INTERVAL '1 HOUR', NOW() + INTERVAL '1 HOUR 30 MINUTE'),
(5, 5, 5, NOW() + INTERVAL '2 HOUR', NOW() + INTERVAL '2 HOUR 30 MINUTE');

-- Tickets
INSERT INTO Tickets (passenger_id, schedule_id, seat_no, fare) VALUES
(1, 1, 'A1', 30.00),
(2, 1, 'A2', 30.00),
(3, 2, 'B1', 25.00),
(4, 2, 'B2', 25.00),
(5, 3, 'C1', 35.00),
(6, 3, 'C2', 35.00),
(7, 4, 'D1', 40.00),
(8, 4, 'D2', 40.00),
(9, 5, 'E1', 45.00),
(10, 5, 'E2', 45.00);

-- Payments
INSERT INTO Payments (ticket_id, payment_method, payment_status, txn_reference, amount) VALUES
(1, 'UPI', 'success', 'TXN2001', 30.00),
(2, 'Card', 'success', 'TXN2002', 30.00),
(3, 'UPI', 'failed', 'TXN2003', 25.00),
(4, 'Wallet', 'success', 'TXN2004', 25.00),
(5, 'UPI', 'success', 'TXN2005', 35.00),
(6, 'Card', 'success', 'TXN2006', 35.00),
(7, 'Cash', 'success', 'TXN2007', 40.00),
(8, 'UPI', 'pending', 'TXN2008', 40.00),
(9, 'Wallet', 'success', 'TXN2009', 45.00),
(10, 'UPI', 'success', 'TXN2010', 45.00);
