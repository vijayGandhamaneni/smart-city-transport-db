-- ==============================
-- Analytical Queries
-- ==============================

-- 1. Busiest routes (most tickets booked)
SELECT r.route_name, COUNT(t.ticket_id) AS total_tickets
FROM Routes r
JOIN Schedules s ON r.route_id = s.route_id
JOIN Tickets t ON s.schedule_id = t.schedule_id
GROUP BY r.route_name
ORDER BY total_tickets DESC;

-- 2. Total revenue per route
SELECT r.route_name, SUM(p.amount) AS total_revenue
FROM Routes r
JOIN Schedules s ON r.route_id = s.route_id
JOIN Tickets t ON s.schedule_id = t.schedule_id
JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'success'
GROUP BY r.route_name
ORDER BY total_revenue DESC;

-- 3. Average bus occupancy (tickets booked vs capacity)
SELECT b.bus_number, COUNT(t.ticket_id)::DECIMAL / b.capacity * 100 AS occupancy_percent
FROM Buses b
JOIN Schedules s ON b.bus_id = s.bus_id
LEFT JOIN Tickets t ON s.schedule_id = t.schedule_id
GROUP BY b.bus_number, b.capacity;

-- 4. Top drivers by trips handled
SELECT d.full_name, COUNT(s.schedule_id) AS total_trips
FROM Drivers d
JOIN Schedules s ON d.driver_id = s.driver_id
GROUP BY d.full_name
ORDER BY total_trips DESC;

-- 5. Peak-hour ticket sales
SELECT DATE_PART('hour', booking_time) AS booking_hour, COUNT(ticket_id) AS tickets_sold
FROM Tickets
GROUP BY booking_hour
ORDER BY tickets_sold DESC;

-- 6. Frequent passengers (top 5 by bookings)
SELECT p.full_name, COUNT(t.ticket_id) AS total_trips
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
GROUP BY p.full_name
ORDER BY total_trips DESC
LIMIT 5;
