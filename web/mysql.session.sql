CREATE TABLE bikes (
    bike_id INT PRIMARY KEY,
    bike_name VARCHAR(50),
    bike_type VARCHAR(50),
    bike_model VARCHAR(50),
    available BOOLEAN,
    price_per_hour DECIMAL(10, 2)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    phone_number VARCHAR(15),
    aadhar_number VARCHAR(15),
    license_number VARCHAR(20),
);
CREATE TABLE rentals (
    rental_id INT PRIMARY KEY,
    customer_id INT,
    bike_id INT,
    rental_start DATETIME,
    rental_end DATETIME,
    rental_status VARCHAR(20), -- E.g., 'active', 'completed', 'cancelled'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (bike_id) REFERENCES bikes(bike_id)
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    rental_id INT,
    payment_date DATETIME,
    amount DECIMAL(10, 2),
    FOREIGN KEY (rental_id) REFERENCES rentals(rental_id)
);
SELECT bike_id, bike_name, bike_type, bike_model, available
FROM bikes
WHERE available = TRUE;
-- Update bike availability
UPDATE bikes
SET available = FALSE
WHERE bike_id = ?;

-- Insert a rental record
INSERT INTO rentals (customer_id, bike_id, rental_start, rental_status)
VALUES (?, ?, NOW(), 'active');
-- Update the rental record
UPDATE rentals
SET rental_end = NOW(), rental_status = 'completed'
WHERE rental_id = ?;

-- Update bike availability
UPDATE bikes
SET available = TRUE
WHERE bike_id = ?;
-- Insert a payment record
INSERT INTO payments (rental_id, payment_date, amount)
VALUES (?, NOW(), ?);
SELECT SUM(amount) AS total_paid
FROM payments
WHERE rental_id = ?;
SELECT r.rental_id, r.bike_id, r.rental_start, b.bike_type
FROM rentals r
JOIN bikes b ON r.bike_id = b.bike_id
WHERE r.customer_id = ? AND r.rental_status = 'active';
SELECT r.rental_id, r.bike_id, r.rental_start, r.rental_end, b.bike_type
FROM rentals r
JOIN bikes b ON r.bike_id = b.bike_id
WHERE r.rental_start >= NOW() - INTERVAL 7 DAY;
SELECT COUNT(*) AS total_rentals
FROM rentals
WHERE bike_id = ?;
SELECT b.bike_id, b.bike_type, COUNT(r.rental_id) AS rental_count
FROM bikes b
LEFT JOIN rentals r ON b.bike_id = r.bike_id
GROUP BY b.bike_id
ORDER BY rental_count DESC
LIMIT 5;
SELECT r.rental_id, b.bike_type, r.rental_start, r.rental_end, r.rental_status
FROM rentals r
JOIN bikes b ON r.bike_id = b.bike_id
WHERE r.customer_id = ?
ORDER BY r.rental_start DESC;
SELECT bike_id, bike_name, bike_type, bike_model, available, price_per_hour
FROM bikes
WHERE bike_type LIKE '%mountain%';  -- Example for searching mountain bikes
SELECT SUM(amount) AS total_revenue
FROM payments
WHERE payment_date BETWEEN '2025-03-01' AND '2025-03-31';
SELECT c.customer_id, c.name, c.email, r.rental_id, b.bike_type
FROM customers c
JOIN rentals r ON c.customer_id = r.customer_id
JOIN bikes b ON r.bike_id = b.bike_id
WHERE r.rental_status = 'active';
