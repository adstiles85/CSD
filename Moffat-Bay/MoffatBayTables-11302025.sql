-- Reset the database so this script can be run multiple times cleanly
DROP DATABASE IF EXISTS moffat_bay;

-- Create a fresh database and switch to it
CREATE DATABASE IF NOT EXISTS moffat_bay;
USE moffat_bay;

-- Customer table: stores login credentials and contact information
CREATE TABLE Customer (
    customer_id   INT          NOT NULL AUTO_INCREMENT,
    first_name    VARCHAR(15)  NOT NULL,
    last_name     VARCHAR(15)  NOT NULL,
    email         VARCHAR(75)  NOT NULL,
    phone_number  BIGINT       NOT NULL,
    password      VARCHAR(15)  NOT NULL,
    PRIMARY KEY (customer_id)
);

-- Room type lookup: one row per type (Queen, Double Queen, etc.)
-- Includes description, max guests, and nightly rate
CREATE TABLE room_type (
    room_typeID  INT           NOT NULL,
    typeName     VARCHAR(15)   NOT NULL,
    description  TEXT          NOT NULL,
    rate         DECIMAL(10,2) NOT NULL,
    guests_max   INT           NOT NULL,
    PRIMARY KEY (room_typeID)
);

-- Physical rooms in the lodge: each room belongs to a room_type
-- guest_capacity and availability are used for inventory control
CREATE TABLE Rooms (
    room_id        INT          NOT NULL,
    room_typeID    INT          NOT NULL,
    room_number    INT          NOT NULL UNIQUE,
    guest_capacity INT          NOT NULL,
    availability   VARCHAR(15)  NOT NULL DEFAULT 'Available',
    PRIMARY KEY (room_id)
);

-- Reservation table: one row per booking made by a customer
-- Includes dates, status, total price, number of rooms, and optional occasion info
CREATE TABLE Reservation (
    reservation_id     INT           NOT NULL AUTO_INCREMENT,
    customer_id        INT           NOT NULL,
    room_id            INT,
    guests             INT           NOT NULL,
    check_in           DATE          NOT NULL,
    check_out          DATE          NOT NULL,
    total_price        DECIMAL(10,2),
    reservation_status VARCHAR(15)   NOT NULL,
    num_rooms          INT           NOT NULL,
    occasion_type      VARCHAR(20),
    occasion_details   TEXT,
    PRIMARY KEY (reservation_id)
);

-- Seed the room_type table with the five room categories and 5% adjusted rates
INSERT INTO room_type (room_typeID, typeName, description, rate, guests_max) VALUES
(1, 'Queen',
 'A queen sized bed offering more space than a double. It''s ideal for couples seeking extra comfort or for sole travelers to appreciate a large sleeping area.',
 141.75, 2),

(2, 'Double Queen',
 'A double queen room features two queen size beds designed to comfortably sleep up to four people a deal for families or groups. It offers ample sleeping space and is a popular choice in hotels and resorts.',
 157.50, 4),

(3, 'Double Bed',
 'A double full room typically includes two full sized bed designed to comfortly accommodate two people. It''s a standard choice suitable for couples or solo travelers. Desiring a bit more room.',
 126.00, 4),

(4, 'King',
 'Spacious room featuring a luxurious king size bed, perfect for ultimate comfort and relaxation.',
 168.00, 2),

(5, 'Suite',
 'One-bedroom suite with living area and ocean view.',
 336.00, 4);

-- Seed the Rooms table with individual physical rooms tied to room_typeID
-- room_id and room_number match for clarity (101, 102, ... 316)
INSERT INTO Rooms (room_id, room_typeID, room_number, guest_capacity, availability) VALUES
(101, 1, 101, 2, 'Available'),
(102, 1, 102, 2, 'Available'),
(103, 1, 103, 2, 'Available'),
(104, 1, 104, 2, 'Available'),
(105, 1, 105, 2, 'Available'),
(106, 2, 106, 4, 'Available'),
(107, 2, 107, 4, 'Available'),
(108, 2, 108, 4, 'Available'),
(109, 2, 109, 4, 'Available'),
(110, 3, 110, 2, 'Available'),
(111, 3, 111, 2, 'Available'),
(112, 3, 112, 2, 'Available'),
(113, 3, 113, 2, 'Available'),
(114, 4, 114, 2, 'Available'),
(115, 4, 115, 2, 'Available'),
(116, 5, 116, 4, 'Available'),

(201, 1, 201, 2, 'Available'),
(202, 1, 202, 2, 'Available'),
(203, 1, 203, 2, 'Available'),
(204, 1, 204, 2, 'Available'),
(205, 1, 205, 2, 'Available'),
(206, 2, 206, 4, 'Available'),
(207, 2, 207, 4, 'Available'),
(208, 2, 208, 4, 'Available'),
(209, 2, 209, 4, 'Available'),
(210, 3, 210, 2, 'Available'),
(211, 3, 211, 2, 'Available'),
(212, 3, 212, 2, 'Available'),
(213, 3, 213, 2, 'Available'),
(214, 4, 214, 2, 'Available'),
(215, 4, 215, 2, 'Available'),
(216, 5, 216, 4, 'Available'),

(301, 1, 301, 2, 'Available'),
(302, 1, 302, 2, 'Available'),
(303, 1, 303, 2, 'Available'),
(304, 1, 304, 2, 'Available'),
(305, 1, 305, 2, 'Available'),
(306, 2, 306, 4, 'Available'),
(307, 2, 307, 4, 'Available'),
(308, 2, 308, 4, 'Available'),
(309, 2, 309, 4, 'Available'),
(310, 3, 310, 2, 'Available'),
(311, 3, 311, 2, 'Available'),
(312, 3, 312, 2, 'Available'),
(313, 3, 313, 2, 'Available'),
(314, 4, 314, 2, 'Available'),
(315, 4, 315, 2, 'Available'),
(316, 5, 316, 4, 'Available');

-- Simple verification queries for debugging and inspection
SELECT * FROM Rooms;
SELECT * FROM room_type;
SELECT * FROM Customer;
SELECT * FROM Reservation;