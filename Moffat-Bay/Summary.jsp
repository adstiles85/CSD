<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.moffatbay.reservations.DBConnection" %>
<%@ page import="com.moffatbay.reservations.UserSession" %>
<%@ page import="com.moffatbay.reservations.ReservationData" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Reservation Summary</title>
    <link rel="stylesheet" href="css/MoffatCss.css">
</head>

<body class="summary-body">

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
    ReservationData resData = (ReservationData) session.getAttribute("reservationData");

    String reservationIdParam = request.getParameter("reservationId");

    // Values we will show
    int reservationId = 0;
    String firstName = "";
    String lastName = "";
    String email = "";
    String phone = "";

    String roomTypeName = (resData != null) ? resData.getRoomTypeName() : "";
    double ratePerNight = (resData != null) ? resData.getRatePerNight() : 0;

    int numRooms = (resData != null) ? resData.getNumberOfRooms() : 0;
    int numGuests = (resData != null) ? resData.getNumberOfGuests() : 0;
    int nights = (resData != null) ? resData.getNumberOfNights() : 0;

    java.time.LocalDate checkIn = (resData != null) ? resData.getCheckInDate() : null;
    java.time.LocalDate checkOut = (resData != null) ? resData.getCheckOutDate() : null;

    String occasionType = (resData != null) ? resData.getOccasionType() : "";
    String occasionDetails = (resData != null) ? resData.getOccasionDetails() : "";

    double totalPrice = (resData != null) ? resData.getTotalPrice() : 0;

    // Pull customer info from session, fallback to DB if needed.
    if (user != null) {
        firstName = user.getFirstName();
        lastName = user.getLastName();
        email = user.getEmail();
        phone = user.getPhoneNumber();
    }

    // If reservationData is missing, try DB lookup by id.
    if (resData == null && reservationIdParam != null && !reservationIdParam.trim().isEmpty()) {

        try {
            reservationId = Integer.parseInt(reservationIdParam.trim());

            String sql =
                "SELECT r.reservation_id, r.guests, r.check_in, r.check_out, r.total_price, r.num_rooms, " +
                "       r.occasion_type, r.occasion_details, " +
                "       c.first_name, c.last_name, c.email, c.phone_number " +
                "FROM Reservation r " +
                "JOIN Customer c ON r.customer_id = c.customer_id " +
                "WHERE r.reservation_id = ?";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setInt(1, reservationId);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        numGuests = rs.getInt("guests");
                        numRooms = rs.getInt("num_rooms");

                        Date inDate = rs.getDate("check_in");
                        Date outDate = rs.getDate("check_out");
                        if (inDate != null) checkIn = inDate.toLocalDate();
                        if (outDate != null) checkOut = outDate.toLocalDate();

                        totalPrice = rs.getDouble("total_price");
                        occasionType = rs.getString("occasion_type");
                        occasionDetails = rs.getString("occasion_details");

                        firstName = rs.getString("first_name");
                        lastName = rs.getString("last_name");
                        email = rs.getString("email");
                        phone = rs.getString("phone_number");
                    }
                }
            }

        } catch (NumberFormatException nfe) {
            // bad reservation id, just leave defaults
        } catch (SQLException sqle) {
            // DB issue, leave defaults
        }
    }

    String checkInDisplay = (checkIn != null) ? checkIn.toString() : "N/A";
    String checkOutDisplay = (checkOut != null) ? checkOut.toString() : "N/A";
%>

<div class="summary-wrapper">
    <section class="summary-card">
        <h2>Reservation Summary</h2>

        <div class="summary-section">
            <h3>Guest Information</h3>
            <div class="summary-grid">
                <div class="summary-line"><strong>Name:</strong> <%= firstName %> <%= lastName %></div>
                <div class="summary-line"><strong>Email:</strong> <%= email %></div>
                <div class="summary-line"><strong>Phone:</strong> <%= phone %></div>
                <% if (reservationIdParam != null) { %>
                    <div class="summary-line"><strong>Reservation ID:</strong> <%= reservationIdParam %></div>
                <% } %>
            </div>
        </div>

        <div class="summary-section">
            <h3>Booking Details</h3>
            <div class="summary-grid">
                <div class="summary-line"><strong>Check In:</strong> <%= checkInDisplay %> (4:00 PM)</div>
                <div class="summary-line"><strong>Check Out:</strong> <%= checkOutDisplay %> (11:00 AM)</div>
                <div class="summary-line"><strong>Room Type:</strong> <%= roomTypeName %></div>
                <div class="summary-line"><strong>Guests:</strong> <%= numGuests %></div>
                <div class="summary-line"><strong>Rooms:</strong> <%= numRooms %></div>
                <div class="summary-line"><strong>Nights:</strong> <%= nights %></div>
            </div>
        </div>

        <div class="summary-section">
            <h3>Special Occasion</h3>
            <div class="summary-grid">
                <div class="summary-line"><strong>Occasion Type:</strong> <%= occasionType %></div>
                <div class="summary-line"><strong>Details:</strong> <%= occasionDetails %></div>
            </div>
        </div>

        <div class="summary-section">
            <h3>Cost Breakdown</h3>
            <div class="summary-grid">
                <div class="summary-line"><strong>Nightly Rate:</strong> $<%= ratePerNight %></div>
                <div class="summary-line"><strong>Math:</strong>
                    $<%= ratePerNight %> x <%= numRooms %> rooms x <%= nights %> nights
                </div>
            </div>
            <div class="total-box">
                Total Amount Paid: $<%= totalPrice %>
            </div>
        </div>

        <div class="summary-section">
            <h3>Policies</h3>
            <p><strong>Cancellation:</strong> Free cancellation up to 48 hours before arrival. After that, the first night is non-refundable.</p>
            <p><strong>Incidentals:</strong> A credit or debit card is required at check-in for incidentals and potential damages.</p>
        </div>

        <div class="summary-buttons">
            <a href="LandingPage.jsp">Return Home</a>
            <a href="LookupPage.jsp">Look Up Reservation</a>
        </div>

        <%
            Integer lastId = (Integer) session.getAttribute("lastReservationId");
            if (lastId != null) {
        %>

        <form method="post"
              action="<%= request.getContextPath() %>/ReservationController?action=cancel"
              style="margin-top: 20px; text-align:center;">
            <input type="hidden" name="reservationId" value="<%= lastId %>">

            <button type="submit"
                    style="background:#b33; color:white; padding:10px 18px; border:none; border-radius:5px; cursor:pointer;">
                Cancel Reservation
            </button>
        </form>

        <%
            }
            // Clear wizard data so refresh doesn't reuse it.
            session.removeAttribute("reservationData");
        %>

    </section>
</div>

<!-- Standard Footer -->
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
