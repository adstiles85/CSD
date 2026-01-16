<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Moffat Bay Lodge | Reservations Page</title>
    <link rel="stylesheet" type="text/css" href="css/MoffatCss.css">

</head>
<body>

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

<!-- Header Break -->

    <!-- Full-width accent strips -->
    <div class="white-strip"></div>
    <div class="peach-strip"></div>

<!-- Centered page content -->
<div class="page-wrapper">

<!-- Main Body -->

    <main class="reservation-main">

        <!-- Hero band with left image, center text, right image -->
        <section class="reservation-hero">

            <!-- Left placeholder image panel -->
            <div class="reservation-hero-side reservation-hero-side-left">
                <!-- background handled in CSS -->
            </div>

            <!-- Center content panel -->
            <div class="reservation-hero-center">

                <h1 class="reservation-title">Make Your Lodge Reservation</h1>

                <hr class="reservation-divider" />

                <p class="reservation-subtitle">
                    Submit this form, and we can present you with your dream stay!
                </p>

                <!-- Button that goes to the guest info page -->
                <a href="ReservationLogin.jsp" class="reservation-button">
                    Start Booking Request &rarr;
                </a>
            </div>

            <!-- Right placeholder image panel -->
            <div class="reservation-hero-side reservation-hero-side-right">
                <!-- background handled in CSS -->
            </div>

        </section>

        <!-- Optional simple "wave" bar under the hero -->
        <div class="reservation-waves"></div>

    </main>


</div> <!-- /page-wrapper -->

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