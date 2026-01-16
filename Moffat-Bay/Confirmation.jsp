<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.moffatbay.reservations.UserSession" %>
<%@ page import="com.moffatbay.reservations.ReservationData" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Confirm Reservation</title>
    <link rel="stylesheet" href="css/MoffatCss.css">
</head>

<body class="confirmation-body">

    <!-- Standard Header -->
    <header class="site-header">
        <div class="top-bar">
            <div class="logo-area">
                <a href="index.jsp">
                    <img src="images/logo2.png" alt="Moffat Bay Lodge & Marina logo">
                </a>
            </div>
            <nav class="main-nav">
                <a href="LoginPage.jsp">Login</a>
                <a href="CreateAccount.jsp">Create an Account</a>
                <a href="ReservationsPage.jsp">Make Your Reservation</a>
                <a href="LookupPage.jsp">Reservation Look-Up</a>
                <a href="AttractionsPage.jsp">Attractions</a>
                <a href="AboutPage.jsp">About Us</a>
            </nav>
        </div>
    </header>

<div class="white-strip"></div>
<div class="peach-strip"></div>

<%
    UserSession user = (UserSession) session.getAttribute("user");
    ReservationData reservation = (ReservationData) session.getAttribute("reservationData");

    Object errObj = request.getAttribute("confirmError");
    String confirmError = (errObj != null) ? errObj.toString() : null;

    if (user == null || reservation == null) {
        response.sendRedirect("ReservationLogin.jsp");
        return;
    }

    String roomImage = "images/Resort.jpg";

    if (reservation.getRoomTypeName() != null) {
        switch (reservation.getRoomTypeName()) {
            case "Single":
                roomImage = "https://raw.githubusercontent.com/Fraustika/Moffat-Bay/main/photos/QueenBed.jpeg";
                break;
            case "Double":
                roomImage = "https://raw.githubusercontent.com/Fraustika/Moffat-Bay/main/photos/DoubleQueen.jpg";
                break;
            case "Twin":
                roomImage = "https://raw.githubusercontent.com/Fraustika/Moffat-Bay/main/photos/DoubleTwin.jpg";
                break;
            case "Master":
                roomImage = "https://raw.githubusercontent.com/Fraustika/Moffat-Bay/main/photos/KingBed.jpg";
                break;
            case "Suite":
                roomImage = "images/Suite.png";
                break;
        }
    }
%>

<div class="confirm-wrapper">
    <section class="confirm-card">

        <h2>Confirm Your Reservation</h2>

        <% if (confirmError != null) { %>
            <div class="error-msg"><%= confirmError %></div>
        <% } %>

        <div class="section">
            <h3>Customer Information</h3>
            <p><strong>Name:</strong> <%= user.getFirstName() %> <%= user.getLastName() %></p>
            <p><strong>Email:</strong> <%= user.getEmail() %></p>
            <p><strong>Phone:</strong> <%= user.getPhoneNumber() %></p>
        </div>

        <div class="section">
            <h3>Special Occasion</h3>
            <p><strong>Occasion Type:</strong> <%= reservation.getOccasionType() %></p>
            <p><strong>Details:</strong> <%= reservation.getOccasionDetails() %></p>
        </div>

        <div class="section">
            <h3>Booking Details</h3>
            <p><strong>Arrival Date:</strong> <%= reservation.getCheckInDate() %> (Check-in after 3:00 PM)</p>
            <p><strong>Departure Date:</strong> <%= reservation.getCheckOutDate() %> (Check-out before 11:00 AM)</p>
            <p><strong>Number of Nights:</strong> <%= reservation.getNumberOfNights() %></p>
            <p><strong>Number of Rooms:</strong> <%= reservation.getNumberOfRooms() %></p>
            <p><strong>Number of Guests:</strong> <%= reservation.getNumberOfGuests() %></p>

            <div class="room-summary">
                <img src="<%= roomImage %>"
                     alt="<%= reservation.getRoomTypeName() %> room"
                     onerror="this.src='images/Resort.jpg';">

                <div>
                    <p><strong>Room Type:</strong> <%= reservation.getRoomTypeName() %></p>
                    <p><strong>Rate per Night:</strong> $<%= reservation.getRatePerNight() %></p>
                </div>
            </div>
        </div>

        <div class="section">
            <h3>Price Breakdown</h3>

            <div class="price-box">
                <p><strong>Rate per Night:</strong> $<%= reservation.getRatePerNight() %></p>
                <p><strong>Nights:</strong> <%= reservation.getNumberOfNights() %></p>
                <p><strong>Rooms:</strong> <%= reservation.getNumberOfRooms() %></p>

                <hr>

                <p>
                    <strong>Total Price Of Your Stay:</strong>
                    $<%= reservation.getTotalPrice() %>
                </p>
            </div>
        </div>

        <div class="notes-box">
            <p><strong>Cancellation Policy:</strong> Free cancellation up to 48 hours before arrival. Cancellations within 48 hours will be charged one night’s stay.</p>
            <p><strong>Payment and Incidentals:</strong> A credit or debit card will be required at check-in for incidentals.</p>
        </div>

        <div class="button-row">
            <a href="BookingDetails.jsp" class="back-btn">Back</a>

            <form method="post"
                  action="<%= request.getContextPath() %>/ReservationController?action=confirm"
                  style="flex:1;">
                <button type="submit" class="confirm-btn">Confirm Reservation</button>
            </form>
        </div>

    </section>
</div>

<footer>
    <div class="footer-wave"></div>
    <div class="footer-inner">
        <div class="footer-columns">
            <div class="footer-column">
                <h4>Moffat Bay Lodge</h4>
                <p>
                    1234 Bay Lodge, Joviedsa Island WA<br>
                    1-800-000
                </p>
            </div>

            <div class="footer-column">
                <h4>Hours</h4>
                <p>
                    Monday - Friday<br>
                    7:00 AM - 10:00 PM<br><br>
                    Saturday - Sunday<br>
                    9:00 AM - 4:00 PM
                </p>
            </div>

            <div class="footer-column">
                <h4>Connect</h4>
                <p>
                    &copy; 2035 by San Juan Islands<br>
                    Follow Us
                </p>
                <div class="footer-icons">
                    <span>🌊</span>
                    <span>📘</span>
                    <span>📸</span>
                </div>
            </div>
        </div>
    </div>
</footer>

</body>
</html>
