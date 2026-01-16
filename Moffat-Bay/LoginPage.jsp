<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <!-- Main site CSS -->
    <link rel="stylesheet" href="css/MoffatCss.css">

    <!-- Fonts (keep) -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

    <script>
        function togglePassword() {
            let pw = document.getElementById("password");
            pw.type = pw.type === "password" ? "text" : "password";
        }
    </script>
</head>

<body class="login-body">

    <!-- Standard Header -->
<header class="site-header">
    <div class="top-bar">
        <div class="logo-area">
            <a href="index.jsp">
                <img src="images/logo2.png" alt="Moffat Bay Lodge &amp; Marina logo">
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

    <!-- accent strips -->
    <div class="white-strip"></div>
    <div class="peach-strip"></div>

    <!-- hero image -->
    <div class="hero-image about-hero"></div>

<div class="outer-box">
    <div class="inner-box">
	<!-- login -->
        <h1>Login</h1>

        <form action="LoginVerify.jsp" method="post">

            <!-- email and password -->
            <div class="two-column">
                <div class="field">
                    <label>Email *</label>
                    <input type="email" name="email" required>
                </div>

                <div class="field">
                    <label>Password *</label>
                    <input type="password" name="password" id="password" required>
                </div>
            </div>

            <!-- show password button -->
            <div class="toggle-box">
                <input type="checkbox" onclick="togglePassword()"> Show Password
            </div>

            <!-- forgot password -->
            <div class="forgot">
                <a href="ComingSoon.jsp">Forgot your password?</a>
            </div>

            <!-- submit button -->
        <button type="submit" class="italic-button">Submit</button>
        </form>

        <!-- create account button -->
        <form action="CreateAccount.jsp">
            <button type="submit" class="create-btn">Create an Account</button>
        </form>

        <!-- terms and privacy false link -->
        <div class="footer-text">
            By signing in you are agreeing to our 
            <a href="ComingSoon.jsp">Terms of Use</a> and our <a href="ComingSoon.jsp">Privacy Policy</a>
        </div>

    </div>
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