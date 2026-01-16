<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge</title>
    <link rel="stylesheet" href="css/MoffatCss.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
</head>

<body class="lookup-page">

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
    <div class="white-strip"></div>
    <div class="peach-strip"></div>
    <div class="hero-image about-hero"></div>
</header>

<%
boolean found = false;
boolean searched = false;   // only used for showing "No reservation found."
ResultSet rs = null;

String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String conf = request.getParameter("reservation_id");

String deleteID = request.getParameter("delete_id");

// success message flag after redirect
String cancelledFlag = request.getParameter("cancelled");
boolean showCancelledMsg = "true".equalsIgnoreCase(cancelledFlag);

/* =========================
   CANCEL RESERVATION (POST)
   ========================= */
if ("POST".equalsIgnoreCase(request.getMethod()) && deleteID != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        java.util.Properties props = new java.util.Properties();
        String propPath = application.getRealPath("/WEB-INF/classes/db.properties");
        props.load(new java.io.FileInputStream(propPath));

        String url  = props.getProperty("db.url");
        String user = props.getProperty("db.user");
        String pass = props.getProperty("db.password");

        try (Connection con = DriverManager.getConnection(url, user, pass);
             PreparedStatement cancelStmt = con.prepareStatement(
                 "UPDATE Reservation " +
                 "SET reservation_status = 'CANCELLED' " +
                 "WHERE reservation_id = ? AND reservation_status = 'CONFIRMED'"
             )) {

            cancelStmt.setInt(1, Integer.parseInt(deleteID));
            int rows = cancelStmt.executeUpdate();

            if (rows > 0) {
                // Redirect so refresh doesn't re-post the cancel request
                response.sendRedirect("LookupPage.jsp?cancelled=true");
                return;
            } else {
                // If it didn't update (already cancelled or bad id), still redirect with a flag if you want
                response.sendRedirect("LookupPage.jsp?cancelled=true");
                return;
            }
        }

    } catch (Exception e) {
        out.println("<p class='no-result'>Error cancelling reservation: " + e.getMessage() + "</p>");
    }
}

/* =========================
   LOOKUP RESERVATION (POST)
   ========================= */
if ("POST".equalsIgnoreCase(request.getMethod()) && deleteID == null) {
    searched = true;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        java.util.Properties props = new java.util.Properties();
        String propPath = application.getRealPath("/WEB-INF/classes/db.properties");
        props.load(new java.io.FileInputStream(propPath));

        String url  = props.getProperty("db.url");
        String user = props.getProperty("db.user");
        String pass = props.getProperty("db.password");

        Connection con = DriverManager.getConnection(url, user, pass);

        PreparedStatement stmt = null;

        if (conf != null && !conf.trim().isEmpty()) {
            stmt = con.prepareStatement("SELECT * FROM Reservation WHERE reservation_id = ?");
            stmt.setInt(1, Integer.parseInt(conf.trim()));
        } else if (fname != null && lname != null && email != null &&
                   !fname.trim().isEmpty() && !lname.trim().isEmpty() && !email.trim().isEmpty()) {

            stmt = con.prepareStatement(
                "SELECT * FROM Reservation WHERE customer_id IN " +
                "(SELECT customer_id FROM Customer WHERE first_name = ? AND last_name = ? AND email = ?)"
            );
            stmt.setString(1, fname.trim());
            stmt.setString(2, lname.trim());
            stmt.setString(3, email.trim());
        }

        if (stmt != null) {
            rs = stmt.executeQuery();
            if (rs.next()) {
                found = true;
            }
        }
        
    } catch (Exception e) {
        out.println("<p class='no-result'>Database error: " + e.getMessage() + "</p>");
    }
}

/* =========================
   LOAD CUSTOMER NAME
   ========================= */
String firstName = "";
String lastName = "";

if (found && rs != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        java.util.Properties props = new java.util.Properties();
        String propPath = application.getRealPath("/WEB-INF/classes/db.properties");
        props.load(new java.io.FileInputStream(propPath));

        String url  = props.getProperty("db.url");
        String user = props.getProperty("db.user");
        String pass = props.getProperty("db.password");

        try (Connection con = DriverManager.getConnection(url, user, pass);
             PreparedStatement custStmt = con.prepareStatement(
                 "SELECT first_name, last_name FROM Customer WHERE customer_id = ?"
             )) {

            custStmt.setInt(1, rs.getInt("customer_id"));

            try (ResultSet custRs = custStmt.executeQuery()) {
                if (custRs.next()) {
                    firstName = custRs.getString("first_name");
                    lastName = custRs.getString("last_name");
                }
            }
        }

    } catch (Exception e) {
        out.println("<p class='no-result'>Error loading customer info: " + e.getMessage() + "</p>");
    }
}
%>

<!-- SUCCESS MESSAGE AFTER CANCEL REDIRECT -->
<% if (showCancelledMsg) { %>
<div class="results">
    <h3 style="text-align:center; color:#b33;">Reservation Successfully Cancelled</h3>
    <p style="text-align:center; margin-top:10px;">
        Your reservation has been cancelled and is now marked as <strong>CANCELLED</strong>.
    </p>
</div>
<% } %>

<!-- LOOKUP FORM -->
<% if (!found) { %>
<div class="peach-box">
    <div class="white-box">
        <h1>Look-Up Reservation</h1>

        <form method="post" class="lookup-form">
            <div class="form-row">
                <div class="form-col">
                    <label>First Name *</label>
                    <input type="text" name="fname">
                </div>
                <div class="form-col">
                    <label>Last Name *</label>
                    <input type="text" name="lname">
                </div>
            </div>

            <label>Email *</label>
            <input type="email" name="email">

            <p style="text-align:center; font-size:20px; margin:10px 0;">or</p>

            <label>Confirmation Number *</label>
            <input type="text" name="reservation_id">

            <input type="submit" value="Submit">
        </form>

        <% if (searched && !found) { %>
            <p class="no-result">No reservation found.</p>
        <% } %>

    </div>
</div>
<% } %>

<!-- RESULTS -->
<% if (found && rs != null) { %>
<div class="results">
    <h3 style="text-align:center;">Reservation Summary</h3>

    <table>
        <tr><td><b>Reservation ID:</b></td><td><%= rs.getInt("reservation_id") %></td></tr>
        <tr><td><b>First Name:</b></td><td><%= firstName %></td></tr>
        <tr><td><b>Last Name:</b></td><td><%= lastName %></td></tr>
        <tr><td><b>Guests:</b></td><td><%= rs.getInt("guests") %></td></tr>
        <tr><td><b>Check-In:</b></td><td><%= rs.getDate("check_in") %></td></tr>
        <tr><td><b>Check-Out:</b></td><td><%= rs.getDate("check_out") %></td></tr>
        <tr><td><b>Total Price:</b></td><td>$<%= rs.getBigDecimal("total_price") %></td></tr>
        <tr><td><b>Status:</b></td><td><%= rs.getString("reservation_status") %></td></tr>
        <tr><td><b>Rooms Booked:</b></td><td><%= rs.getInt("num_rooms") %></td></tr>
        <tr><td><b>Occasion Type:</b></td><td><%= rs.getString("occasion_type") %></td></tr>
        <tr>
            <td><b>Occasion Details:</b></td>
            <td><%= (rs.getString("occasion_details") == null || rs.getString("occasion_details").trim().isEmpty())
                    ? "None Provided" : rs.getString("occasion_details") %></td>
        </tr>
    </table>

    <% if ("CONFIRMED".equalsIgnoreCase(rs.getString("reservation_status"))) { %>
    <form method="post" style="display:flex; justify-content:center; margin-top:30px;">
        <input type="hidden" name="delete_id" value="<%= rs.getInt("reservation_id") %>">
        <input type="submit"
               value="Cancel Reservation"
               class="cancel-btn"
               onclick="return confirm('Are you sure you want to CANCEL this reservation?');">
    </form>
    <% } %>

</div>
<% } %>

<!-- FOOTER -->
<footer>
    <div class="footer-wave"></div>
    <div class="footer-inner">
        <div class="footer-columns">
            <div class="footer-column">
                <h4>Moffat Bay Lodge</h4>
                <p>1234 Bay Lodge, Joviedsa Island WA<br>1-800-000</p>
            </div>
            <div class="footer-column">
                <h4>Hours</h4>
                <p>Mon–Fri 7AM–10PM<br><br>Sat–Sun 9AM–4PM</p>
            </div>
            <div class="footer-column">
                <h4>Connect</h4>
                <p>&copy; 2035 by San Juan Islands<br>Follow Us</p>
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
