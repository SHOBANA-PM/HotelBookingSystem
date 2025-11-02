-- STEP 1: Create the database
CREATE DATABASE hotel_booking_db;
USE hotel_booking_db;

-- STEP 2: Create tables
CREATE TABLE hotels (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    rating DECIMAL(2,1)
);

CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    room_type VARCHAR(50),
    price_per_night DECIMAL(10,2),
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id)
);

CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    room_id INT,
    customer_name VARCHAR(100),
    check_in DATE,
    check_out DATE,
    total_price DECIMAL(10,2),
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- STEP 3: Insert sample hotels and rooms
INSERT INTO hotels (hotel_name, location, rating) VALUES
('The Grand Palace', 'Mumbai', 4.5),
('Ocean View Resort', 'Goa', 4.2),
('Mountain Stay', 'Manali', 4.0);

INSERT INTO rooms (hotel_id, room_type, price_per_night, is_available) VALUES
(1, 'Deluxe', 5000, TRUE),
(1, 'Suite', 7500, TRUE),
(2, 'Standard', 4000, TRUE),
(3, 'Cottage', 3500, TRUE);
