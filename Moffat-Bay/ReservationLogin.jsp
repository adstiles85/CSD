<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Reservation Login</title>

    <!-- Shared Moffat CSS -->
    <link rel="stylesheet" href="css/MoffatCss.css">
</head>

<body class="reservation-login-body">

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

<div class="reservation-login-wrapper">

    <section class="reservation-login-card">

        <h2>Reservation Login</h2>

        <%
            // Fix: request.getAttribute may return null after a redirect.
            Object loginErrorObj = request.getAttribute("loginError");
            String loginError = (loginErrorObj != null) ? loginErrorObj.toString() : null;

            if (loginError != null) {
        %>
            <div class="error-msg"><%= loginError %></div>
        <% } %>

        <form method="post"
              action="<%= request.getContextPath() %>/ReservationController?action=login"
              onsubmit="return validateLoginForm();">

            <div class="login-input">
                <label>Email</label>
                <input type="email" name="email"
                        required
                        pattern="^[^\s@]+@[^\s@]+\.[^\s@]+$">

            </div>

            <div class="login-input">
                <label>Password</label>
                <input type="password" name="password"
                       required minlength="6">
            </div>

            <div class="login-button">
                <button type="submit">Continue</button>
            </div>
        </form>

        <div class="create-link">
            <p>Need to create an account?</p>
            <a href="CreateAccount.jsp">Create Account</a>
        </div>

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

<script>
function validateLoginForm() {
    const email = document.querySelector("input[name='email']").value.trim();
    const password = document.querySelector("input[name='password']").value.trim();

    if (!email) {
        alert("Please enter your email.");
        return false;
    }

    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    if (password.length < 6) {
        alert("Password must be at least 6 characters.");
        return false;
    }

    return true;
}
</script>

</body>
</html>
