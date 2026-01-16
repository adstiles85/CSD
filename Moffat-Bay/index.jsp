<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moffat Bay Lodge | Welcome</title>
    <link rel="stylesheet" type="text/css" href="css/MoffatCss.css">
</head>
<body class="landing-body">

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

    <main class="landing-hero">

        <!-- Top: Lodge image + slanted title only -->
        <section class="landing-hero__top">
            <div class="landing-title">
                <h1>Moffat Bay Lodge &amp; Marina</h1>
            </div>
        </section>

        <!-- Bottom: Ocean + Welcome message + 3 cards -->
        <section class="landing-ocean">
            <div class="landing-welcome">
                <h2>Welcome to the Moffat Lodge!</h2>
                <div class="landing-tagline">
                    Get ready to unwind in cozy comfort and make unforgettable memories<br>
                    surrounded by nature's beauty.
                </div>
            </div>

            <div class="landing-cta">
                <div class="landing-cta__card">
                    <h3>Book a Stay</h3>
                    <p>Looking to getaway? Let's begin the booking process!</p>
                    <a href="ReservationsPage.jsp" class="btn">Let's Go</a>
                        <!-- Salmon GIF -->
                    <img src="images/SalishSalmonGif.gif" alt="Salmon Art" class="cta-gif">
                </div>
                <div class="landing-cta__card">
                    <h3>Attractions</h3>
                    <p>Interested in staying? Come and check out what we have to offer to make this stay memorable!</p>
                    <a href="AttractionsPage.jsp" class="btn">Show Me</a>
                </div>
                <div class="landing-cta__card">
                    <h3>Contact Us</h3>
                    <p>Have any questions? Feel free to reach out to our expert team</p>
                    <a href="AboutPage.jsp" class="btn">Take Me There</a>
                        <!-- Salmon GIF -->
                    <img src="images/SalishSalmonGif.gif" alt="Salmon Art" class="cta-gif">
                </div>
            </div>
        </section>
    </main>

    <!-- Standard Footer -->
    <footer>
        <div class="footer-inner">
            <div class="footer-wave"></div>
            <div class="footer-columns">
                <div class="footer-column">
                    <h4>Moffat Bay Lodge</h4>
                    <p>1234 Bay Lodge, Joviedsa Island WA<br>1-800-000</p>
                </div>
                <div class="footer-column">
                    <h4>Hours</h4>
                    <p>Monday - Friday<br>7:00 AM - 10:00 PM<br><br>
                       Saturday - Sunday<br>9:00 AM - 4:00 PM</p>
                </div>
                <div class="footer-column">
                    <h4>Connect</h4>
                    <p>© 2035 by San Juan Islands<br>Follow Us</p>
                    <div class="footer-icons">
                        <span>Wave</span><span>Book</span><span>Camera</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>
