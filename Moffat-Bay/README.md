# Moffat Bay Lodge & Marina – Reservation Web Application

## Overview
Moffat Bay Lodge & Marina is a full-stack Java web application that simulates a real-world lodging reservation system. The project was designed to demonstrate backend-driven workflows, database persistence, session management, and a complete user journey from browsing through booking, confirmation, lookup, and cancellation.

The application allows users to explore the lodge without logging in, but requires authentication to create and manage reservations. All reservation data is stored in a relational database and can be retrieved or modified later, mirroring how production reservation systems operate.

This project was built collaboratively and emphasizes clean user flow, consistent design, and practical data handling decisions.

---

## Technologies Used
- **Java**
- **Jakarta Servlets**
- **JSP (JavaServer Pages)**
- **JDBC**
- **MySQL**
- **Apache Tomcat 11**
- **HTML / CSS**
- **Session-based state management**

---

## Key Features
- User account creation and authentication
- Multi-step reservation workflow
- Session-backed reservation state
- Confirmation and summary screens
- Reservation lookup by confirmation number or customer details
- Soft cancellation system using status updates instead of record deletion
- Persistent database storage with relational integrity
- Responsive layout and consistent UI theming

---

## Reservation Workflow
1. Users browse the site without authentication
2. Login or account creation is required before confirming a reservation
3. Reservation details are collected across multiple steps
4. A confirmation page summarizes all selections before committing to the database
5. A reservation ID is generated and stored
6. Users may later:
   - Look up their reservation
   - Cancel it (status changes to `CANCELLED`, record is preserved)

---

## Database Design Notes
- Uses MySQL with normalized tables
- Reservation cancellations **do not delete records**
- Instead, `reservation_status` is updated from `CONFIRMED` to `CANCELLED`
- This preserves historical data and mirrors real-world systems
- JDBC prepared statements are used throughout for safety and clarity

---

## Project Structure
- `src/` – Java source files
- `WEB-INF/` – Compiled classes, configuration, and libraries
- `css/` – Shared stylesheet
- `images/` – Static assets
- `*.jsp` – View and controller interaction pages
- `ReservationController.java` – Core servlet coordinating the reservation workflow

---

## Setup Instructions
1. Install **Apache Tomcat 11**
2. Create a MySQL database using the provided SQL script
3. Configure `db.properties` with your database credentials
4. Deploy the WAR file or project folder to Tomcat’s `webapps` directory
5. Start Tomcat and access the application via browser

---

## Academic Context
This project was developed as part of a team-based software development course. The goal was to design and implement a realistic web application using Java and Jakarta technologies while coordinating development across multiple contributors.

---

## What This Project Demonstrates
- Understanding of full-stack Java web development
- Practical database design decisions
- Clean separation of concerns
- Session and state management
- Collaborative development and integration
- Real-world workflow modeling rather than toy examples

---

## Author
Andrew Stiles  
Software Development Student  
Bellevue University
