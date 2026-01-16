<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.moffatbay.reservations.RoomType" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking Details</title>
    <link rel="stylesheet" href="css/MoffatCss.css">
</head>

<body class="booking-details-body">

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

<div class="booking-wrapper">
    <section class="booking-card">
        <h2>Booking Details</h2>

        <!-- Booking form posts to controller -->
        <form method="post"
              action="<%= request.getContextPath() %>/ReservationController?action=booking"
              onsubmit="return validateBookingForm();">

            <!-- Arrival and Departure -->
            <div class="row-2">
                <div class="form-group">
                    <label for="checkIn">Arrival Date</label>
                    <input type="date" id="checkIn" name="checkIn" required>
                </div>

                <div class="form-group">
                    <label for="checkOut">Departure Date</label>
                    <input type="date" id="checkOut" name="checkOut" required>
                </div>
            </div>

            <!-- Number of Rooms -->
            <div class="form-group">
                <label for="numRooms">Number of Rooms (max 4)</label>
                <input type="number" id="numRooms" name="numRooms" min="1" max="4" required>
            </div>

            <!-- Number of Guests -->
            <div class="form-group">
                <label for="numGuests">Number of Guests</label>
                <input type="number" id="numGuests" name="numGuests" min="1" max="10" required>
                <div class="capacity-hint" id="capacityHint">
                    Select a room type to see total capacity.
                </div>
            </div>

            <!-- Room Type Cards -->
            <div class="room-type-section">
                <h3>Select a Room Type</h3>

                <div class="room-grid">

                    <%
                        List<RoomType> roomTypes = (List<RoomType>) request.getAttribute("roomTypes");

                        if (roomTypes != null) {
                            for (RoomType rt : roomTypes) {

                                String roomImage = "images/Resort.jpg";

                                if (rt.getTypeName() != null) {
                                    switch (rt.getTypeName()) {
                                        case "Queen":
                                            roomImage = "images/QueenBed.jpeg";
                                            break;
                                        case "Double Queen":
                                            roomImage = "images/DoubleQueen.jpg";
                                            break;
                                        case "Double Bed":
                                            roomImage = "images/DoubleTwin.jpg";
                                            break;
                                        case "King":
                                            roomImage = "images/KingBed.jpg";
                                            break;
                                        case "Suite":
                                            roomImage = "images/Suite.png";
                                            break;
                                    }
                                }
                    %>

                    <div class="room-card">

                        <img
                            src="<%= roomImage %>"
                            alt="<%= rt.getTypeName() %> room"
                            class="room-image-real"
                            onerror="this.src='images/rooms/default.jpg';"
                        >

                        <div class="room-info">
                            <h4><%= rt.getTypeName() %></h4>
                            <p><%= rt.getDescription() %></p>

                            <div class="room-meta">
                                <strong>Rate:</strong> $<%= rt.getRate() %> per night<br>
                                <strong>Max Guests per Room:</strong> <%= rt.getGuestsMax() %>
                            </div>

                            <div class="room-select">
                                <label>
                                    <input type="radio"
                                           class="roomTypeRadio"
                                           name="roomTypeID"
                                           value="<%= rt.getRoomTypeID() %>"
                                           data-max="<%= rt.getGuestsMax() %>"
                                           required>
                                    Choose this room
                                </label>
                            </div>
                        </div>

                    </div>

                    <%
                            }
                        } else {
                    %>

                    <p>No room types found in database.</p>

                    <%
                        }
                    %>

                </div>
            </div>

            <!-- Continue button -->
            <div class="submit-button">
                <button type="submit">Continue</button>
            </div>

        </form>
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

<!-- Data Validations -->
<script>
    const checkInEl = document.getElementById("checkIn");
    const checkOutEl = document.getElementById("checkOut");
    const numRoomsEl = document.getElementById("numRooms");
    const numGuestsEl = document.getElementById("numGuests");
    const capacityHintEl = document.getElementById("capacityHint");
    const roomRadios = document.querySelectorAll(".roomTypeRadio");

    function selectedRoomMax() {
        const selected = document.querySelector(".roomTypeRadio:checked");
        if (!selected) return null;
        const max = parseInt(selected.dataset.max, 10);
        return isNaN(max) ? null : max;
    }

    function updateCheckoutMin() {
        if (!checkInEl.value) return;

        const inDate = new Date(checkInEl.value);
        inDate.setDate(inDate.getDate() + 1);

        const yyyy = inDate.getFullYear();
        const mm = String(inDate.getMonth() + 1).padStart(2, "0");
        const dd = String(inDate.getDate()).padStart(2, "0");
        const minOut = `${yyyy}-${mm}-${dd}`;

        checkOutEl.min = minOut;

        if (checkOutEl.value && checkOutEl.value < minOut) {
            checkOutEl.value = minOut;
        }
    }

    function updateCapacityHintAndMaxGuests() {
        const maxPerRoom = selectedRoomMax();
        const rooms = parseInt(numRoomsEl.value, 10);

        if (!maxPerRoom || isNaN(rooms) || rooms < 1) {
            capacityHintEl.textContent = "Select a room type and number of rooms to see total capacity.";
            numGuestsEl.max = "10";
            return;
        }

        const totalCap = maxPerRoom * rooms;
        capacityHintEl.textContent = `Capacity for this selection: ${totalCap} guests total.`;

        // Cap guests input dynamically so they can't even pick higher
        numGuestsEl.max = String(totalCap);

        if (numGuestsEl.value) {
            const guests = parseInt(numGuestsEl.value, 10);
            if (!isNaN(guests) && guests > totalCap) {
                numGuestsEl.value = totalCap;
            }
        }
    }

    function validateBookingForm() {
        // Date sanity
        const inVal = checkInEl.value;
        const outVal = checkOutEl.value;

        if (!inVal || !outVal) {
            alert("Please select both arrival and departure dates.");
            return false;
        }

        if (outVal <= inVal) {
            alert("Departure date must be after arrival date.");
            checkOutEl.focus();
            return false;
        }

        // Rooms limit
        const rooms = parseInt(numRoomsEl.value, 10);
        if (isNaN(rooms) || rooms < 1 || rooms > 4) {
            alert("Please choose between 1 and 4 rooms.");
            numRoomsEl.focus();
            return false;
        }

        // Room type selected (required already, but nice message)
        const maxPerRoom = selectedRoomMax();
        if (!maxPerRoom) {
            alert("Please select a room type.");
            return false;
        }

        // Guests vs capacity
        const guests = parseInt(numGuestsEl.value, 10);
        const totalCap = maxPerRoom * rooms;

        if (isNaN(guests) || guests < 1) {
            alert("Please enter a valid number of guests.");
            numGuestsEl.focus();
            return false;
        }

        if (guests > totalCap) {
            alert(`Too many guests for this selection. Max allowed: ${totalCap}.`);
            numGuestsEl.focus();
            return false;
        }

        return true;
    }

    // Wire up live validation
    checkInEl.addEventListener("change", () => {
        updateCheckoutMin();
        updateCapacityHintAndMaxGuests();
    });

    checkOutEl.addEventListener("change", updateCapacityHintAndMaxGuests);
    numRoomsEl.addEventListener("input", updateCapacityHintAndMaxGuests);
    numGuestsEl.addEventListener("input", updateCapacityHintAndMaxGuests);

    roomRadios.forEach(r => r.addEventListener("change", updateCapacityHintAndMaxGuests));

    // Initial setup
    updateCheckoutMin();
    updateCapacityHintAndMaxGuests();
</script>

</body>
</html>
