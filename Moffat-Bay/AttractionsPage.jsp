<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reservation Summary</title>
    <link rel="stylesheet" type="text/css" href="css/MoffatCss.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500;600&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
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

<div class="white-strip"></div>


<!-- Attractions Page -->
<div class="attractions-page">

    <!-- Page Title -->
    <div class="attractions-header"></div>
    <div class="attractions-title-wrapper">
        <div class="attractions-title">Moffat Bay Attractions</div>
    </div>
    <div class="gallery">

        <div class="gallery-item">
            <img src="images/Hiking.jpg" alt="Hiking">
            <div class="info">
                <h4>Hiking - Inclusive</h4>
                <p>Climb, explore, and pretend you’re starring in your own adventure documentary.</p>
            </div>
        </div>
    
        <div class="gallery-item">
            <img src="images/Kayaking.jpg" alt="Kayaking">
            <div class="info">
                <h4>Kayaking - $25 Per Hour</h4>
                <p>Glide across the water like a peaceful explorer—until a splash battle breaks out.</p>
            </div>
        </div>
    
        <div class="gallery-item">
            <img src="images/WhaleWatching.jpg" alt="Whale Watching">
            <div class="info">
                <h4>Whale Watching - $80 Per Hour</h4>
                <p>Keep your eyes peeled for ocean giants making surprise guest appearances.</p>
            </div>
        </div>
    
        <div class="gallery-item">
            <img src="images/ScubaDiving.jpg" alt="Scuba Diving">
            <div class="info">
                <h4>Scuba Diving - $100 Per Hour</h4>

                <p>Dive into a hidden world where the fish are colorful and the selfies are legendary.</p>
            </div>
        </div>
    
        <div class="gallery-item">
            <img src="images/Surfing.jpg" alt="Surfing">
            <div class="info">
                <h4>Surfing - $15 Per Hour</h4>
                <p>Catch a wave, ride the thrill, and try not to smile too hard for the camera.</p>
            </div>
        </div>
    
        <div class="gallery-item">
            <img src="images/IslandTours.jpg" alt="Island Tours">
            <div class="info">
                <h4>Island Tours - Starting at $95</h4>
                <p>Hop from paradise to paradise, each one more jaw-dropping than the last.</p>
            </div>
        </div>
    
    </div>

<!-- Testimonials Section -->

    <section class="testimonial-section">
        <div class="testimonial-content">
      
            <h2>What Our Guests Say</h2>
      
            <p class="quote"></p>
            <div class="quote-author"></div>
      
        </div>
      </section>
      
      <script>
        const testimonials = [
          { quote: "This was the best vacation we ever had!", author: "— The Johnson Family" },
          { quote: "Amazing food, beautiful views. We'll be back!", author: "— Alexa & Mark" },
          { quote: "The perfect getaway. Everything was flawless.", author: "— Thomas R." },
          { quote: "Staff was incredibly kind and helpful.", author: "— Maria L." },
          { quote: "Our kids loved every minute of it!", author: "— The Ramirez Family" },
          { quote: "The rooms were so clean and cozy.", author: "— Olivia & Ben" },
          { quote: "A magical experience from start to finish.", author: "— Hannah K." },
          { quote: "Five stars. Worth every penny!", author: "— George T." }
        ];
      
        let index = 0;
        const quoteEl = document.querySelector('.quote');
        const authorEl = document.querySelector('.quote-author');
      
        function showTestimonial(i) {
          quoteEl.style.opacity = 0;
          authorEl.style.opacity = 0;
      
          setTimeout(() => {
            quoteEl.textContent = testimonials[i].quote;
            authorEl.textContent = testimonials[i].author;
      
            quoteEl.style.opacity = 1;
            authorEl.style.opacity = 1;
          }, 500);
        }
      
        showTestimonial(index);
      
        setInterval(() => {
          index = (index + 1) % testimonials.length;
          showTestimonial(index);
        }, 5000);
      </script>

<!-- Second Gallery -->
<div class="gallery">

    <div class="gallery-item">
        <img src="images/Zipline.jpg" alt="Ziplining">
        <div class="info">
            <h4>Ziplining - $85 Per Hour</h4>
            <p>Feel the rush as you soar through the treetops like a tropical superhero.</p>
        </div>
    </div>

    <div class="gallery-item">
        <img src="images/Sports.jpg" alt="Beach Volleyball">
        <div class="info">
            <h4>Beach Volleyball - Inclusive</h4>
            <p>A sun-soaked showdown where bragging rights matter almost as much as sunscreen.</p>
        </div>
    </div>

    <div class="gallery-item">
        <img src="images/Hammock.jpg" alt="Beach Hammocks">
        <div class="info">
            <h4>Beach Hammocks - Inclusive</h4>
            <p>The ultimate nap arena where relaxation reigns supreme.</p>
        </div>
    </div>

    <div class="gallery-item">
        <img src="images/Bonfire.jpg" alt="Bonfire">
        <div class="info">
            <h4>Bonfire - Inclusive</h4>
            <p>Crackling flames, good vibes, and stories that get wilder as the night goes on.</p>
        </div>
    </div>

    <div class="gallery-item">
        <img src="images/MovieNights.jpg" alt="Movie Nights">
        <div class="info">
            <h4>Movie Nights - Inclusive</h4>
            <p>Big screen, salty breeze, and the perfect excuse for extra snacks.</p>
        </div>
    </div>

    <div class="gallery-item">
        <img src="images/HorseBack.jpg" alt="Horseback Riding">
        <div class="info">
            <h4>Horseback Riding - $55 Per Hour</h4>
            <p>Explore the shoreline with your four-legged adventure partner.</p>
        </div>
    </div>

</div>

<!-- Footer -->
<footer>
    <div class="footer-wave">
        <img src="https://raw.githubusercontent.com/Fraustika/Moffat-Bay/910afe61bd1f07912b9c4b3818c1af340118a2b6/moffatdesignshape.png" alt="Footer Wave">
    </div>
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
