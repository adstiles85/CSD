<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Special Occasion</title>
    <link rel="stylesheet" href="css/MoffatCss.css">
</head>

<body class="special-occasion-body">

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

<div class="occasion-wrapper">
    <section class="occasion-card">
        <h2>Special Occasion Details</h2>

        <form method="post"
              action="<%= request.getContextPath() %>/ReservationController?action=occasion"
              onsubmit="return validateOccasionForm();">

            <div class="occasion-options">
                <label><input type="radio" name="occasionType" value="Anniversary"> Anniversary</label>
                <label><input type="radio" name="occasionType" value="Birthday"> Birthday</label>
                <label><input type="radio" name="occasionType" value="Honeymoon"> Honeymoon</label>
                <label><input type="radio" name="occasionType" value="Celebration"> Celebration</label>
                <label><input type="radio" name="occasionType" value="Work Trip"> Work Trip</label>
                <label><input type="radio" name="occasionType" value="None" checked> No Special Occasion</label>
            </div>

            <div class="details-box">
                <label>Additional Details (Optional):</label>
                <textarea 
                    name="occasionDetails" 
                    id="occasionDetails"
                    maxlength="200"
                    placeholder="Enter any special information here..."></textarea>
            </div>

            <div class="submit-button">
                <button type="submit">Continue</button>
            </div>

        </form>
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


<!-- Working Validation -->
<script>
function validateOccasionForm() {
    const detailsEl = document.getElementById("occasionDetails");

    // safety fallback
    if (!detailsEl) return true;

    const text = detailsEl.value.trim();

    // empty is fine
    if (text.length === 0) return true;

    // must be at least 3 chars if not empty
    if (text.length < 3) {
        alert("If you add additional details, please enter at least 3 characters.");
        detailsEl.focus();
        return false;
    }

    // maxlength handles upper bound, but backup check included
    if (text.length > 200) {
        alert("Additional details must be 200 characters or fewer.");
        detailsEl.focus();
        return false;
    }

    return true;
}
</script>

</body>
</html>
