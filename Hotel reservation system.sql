CREATE DATABASE IF NOT EXISTS hotel_reservation_system;
USE hotel_reservation_system;
CREATE TABLE IF NOT EXISTS guests (
    guest_id INT PRIMARY KEY,
    guest_name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone_number VARCHAR(15)
);
CREATE TABLE IF NOT EXISTS rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(30),
    occupancy INT,
    price DECIMAL(10, 2)
);
CREATE TABLE IF NOT EXISTS reservations (
    reservation_id INT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);
INSERT INTO guests(guest_id,guest_name,email,phone_number) VALUES 
				  (1, 'raja', 'raja@gmail.com', '123-456-7890'),
                  (2, 'sriram', 'sriram@gmail.com', '987-654-3210'),
                  (3, 'sri', 'sri@gmail.com', '187-214-1310'),
				  (4, 'ram', 'ram@gmail.com', '287-224-1210'),
				  (5, 'senba', 'senba@gmail.com', '387-114-3210'),
				  (6, 'depika', 'depika@gmail.com', '487-104-3230'),
				  (7, 'vino', 'vino@gmail.com', '587-954-3240'),
				  (8, 'karthika', 'karthika@gmail.com', '687-854-3250'),
				  (9, 'bhavani', 'bhavani@gmail.com', '787-754-3260'),
				  (10, 'anu', 'anu@gmail.com', '887-654-3270'),
                  (11, 'sorna', 'sorna@gmail.com', '987-554-3280'),
				  (12, 'abi', 'abi@gmail.com', '107-654-4290'),
				  (13, 'muthu', 'muthu@gmail.com', '117-354-3300'),
                  (14, 'kavin', 'kavin@gmail.com', '127-254-3310'),
				  (15, 'kutti', 'kutti@gmail.com', '137-154-3320');

INSERT INTO rooms(room_id,room_type,occupancy,price) VALUES 
				(101, 'Single', 1, 8000.00),
				(102, 'Double', 2, 12000.00),
				(103, 'Triple', 3, 18000.00),
				(104, 'Double', 2, 12000.00),
				(105, 'Single', 1, 8000.00),
				(106, 'Triple', 3, 20000.00),
				(107, 'Double', 2, 16000.00),
				(108, 'Triple', 3, 21000.00),
				(109, 'Single', 1, 10000.00),
				(110, 'Double', 2, 14000.00),
				(111, 'Triple', 3, 19000.00),
				(112, 'Double', 2, 13000.00),
				(113, 'Single', 1, 11000.00),
				(114, 'Triple', 3, 21000.00),
				(115, 'Double', 2, 14000.00);
INSERT INTO reservations(reservation_id,guest_id,room_id,check_in_date,check_out_date) VALUES
             (201, 1, 101, '2023-01-10', '2023-01-15'),
             (202, 2, 102, '2023-02-15', '2023-02-20'),
             (203, 3, 103, '2023-03-16', '2023-03-21'),
             (204, 4, 104, '2023-04-17', '2023-04-22'),
             (205, 5, 105, '2023-05-18', '2023-05-23'),
             (206, 6, 106, '2023-06-18', '2023-06-24'),
             (207, 7, 107, '2023-07-19', '2023-07-25'),
             (208, 8, 108, '2023-08-20', '2023-08-26'),
             (209, 9, 109, '2023-09-21', '2023-09-27'),
             (210, 10, 110, '2023-02-16', '2023-02-23'),
             (211, 11, 111, '2023-03-19', '2023-03-26'),
             (212, 12, 112, '2023-04-17', '2023-04-29'),
             (213, 13, 113, '2023-05-16', '2023-05-21'),
             (214, 14, 114, '2023-06-19', '2023-06-24'),
             (215, 15, 115, '2023-07-17', '2023-07-22');
SELECT * FROM guests;
SELECT * FROM rooms;
SELECT * FROM reservations;

-- Update Data
UPDATE rooms SET price = 100.00 WHERE room_id = 101;

-- Joins
SELECT reservations.reservation_id, guests.guest_name, rooms.room_type
FROM reservations
JOIN guests ON reservations.guest_id = guests.guest_id
JOIN rooms ON reservations.room_id = rooms.room_id;

-- Aggregation
SELECT room_type, AVG(price) AS avg_price
FROM rooms
GROUP BY room_type
HAVING avg_price > 90;

-- Subquery
SELECT guest_name
FROM guests
WHERE guest_id IN (
    SELECT guest_id
    FROM reservations
    WHERE check_in_date BETWEEN '2023-02-01' AND '2023-02-28'
);

-- LIKE and Wildcards
SELECT * FROM guests WHERE email LIKE '%gmail.com%';

-- Order By
SELECT * FROM rooms ORDER BY price DESC;

-- EXISTS
SELECT room_type
FROM rooms r
WHERE EXISTS (
    SELECT 1
    FROM reservations re
    WHERE re.room_id = r.room_id
);

-- UNION
SELECT room_type FROM rooms WHERE occupancy = 1
UNION
SELECT room_type FROM rooms WHERE occupancy = 2;

-- ALTER TABLE
ALTER TABLE guests ADD COLUMN nationality VARCHAR(20);

-- DROP TABLE
DROP TABLE IF EXISTS guests;

-- DROP DATABASE
DROP DATABASE IF EXISTS hotel_reservation_system;
             

             




















                  



