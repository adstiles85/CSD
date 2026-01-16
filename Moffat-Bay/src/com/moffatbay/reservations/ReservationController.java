package com.moffatbay.reservations;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Coordinate the multi step reservation flow and interact with the database.
 */
public class ReservationController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "login":
                handleLogin(request, response);
                break;
            case "occasion":
                handleOccasion(request, response);
                break;
            case "booking":
                handleBooking(request, response);
                break;
            case "selectRoom":
                handleSelectRoom(request, response);
                break;
            case "confirm":
                handleConfirm(request, response);
                break;
            case "cancel":
                handleCancel(request, response);
                break;
            default:
                response.sendRedirect("ReservationLogin.jsp");
        }
    }

    private void handleLogin(HttpServletRequest request,
                             HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "SELECT customer_id, first_name, last_name, email, phone_number " +
                         "FROM Customer WHERE email = ? AND password = ?";

            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, password);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {

                        UserSession user = new UserSession();
                        user.setCustomerId(rs.getInt("customer_id"));
                        user.setFirstName(rs.getString("first_name"));
                        user.setLastName(rs.getString("last_name"));
                        user.setEmail(rs.getString("email"));
                        user.setPhoneNumber(rs.getString("phone_number"));

                        session.setAttribute("user", user);
                        session.setAttribute("reservationData", new ReservationData());

                        request.getRequestDispatcher("SpecialOccasionPage.jsp")
                               .forward(request, response);
                    } else {
                        request.setAttribute("loginError", "Invalid email or password.");
                        request.getRequestDispatcher("ReservationLogin.jsp")
                               .forward(request, response);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    private void handleOccasion(HttpServletRequest request,
                                HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ReservationData reservation = getOrCreateReservation(session);

        reservation.setOccasionType(request.getParameter("occasionType"));
        reservation.setOccasionDetails(request.getParameter("occasionDetails"));

        List<RoomType> roomTypes = DBConnection.getAllRoomTypes();
        request.setAttribute("roomTypes", roomTypes);

        request.getRequestDispatcher("BookingDetails.jsp")
               .forward(request, response);
    }

    private void handleBooking(HttpServletRequest request,
                               HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ReservationData reservation = getOrCreateReservation(session);

        reservation.setCheckInDate(LocalDate.parse(request.getParameter("checkIn")));
        reservation.setCheckOutDate(LocalDate.parse(request.getParameter("checkOut")));
        reservation.setNumberOfRooms(Integer.parseInt(request.getParameter("numRooms")));
        reservation.setNumberOfGuests(Integer.parseInt(request.getParameter("numGuests")));
        reservation.setRoomTypeId(Integer.parseInt(request.getParameter("roomTypeID")));

        RoomType rt = DBConnection.getRoomTypeById(reservation.getRoomTypeId());

        if (rt != null) {
            reservation.setRoomTypeName(rt.getTypeName());
            reservation.setRatePerNight(Double.parseDouble(rt.getRate()));
            reservation.setGuestsMax(rt.getGuestsMax());
        }

        long nights = ChronoUnit.DAYS.between(
                reservation.getCheckInDate(),
                reservation.getCheckOutDate()
        );
        reservation.setNumberOfNights((int) nights);

        double total = reservation.getRatePerNight()
                     * reservation.getNumberOfRooms()
                     * reservation.getNumberOfNights();
        reservation.setTotalPrice(total);

        request.getRequestDispatcher("Confirmation.jsp")
               .forward(request, response);
    }

    private void handleSelectRoom(HttpServletRequest request,
                                  HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        ReservationData reservation = getOrCreateReservation(session);

        String roomIdStr = request.getParameter("roomId");
        if (roomIdStr != null && !roomIdStr.isEmpty()) {
            reservation.setSelectedRoomId(Integer.parseInt(roomIdStr));
        }

        request.getRequestDispatcher("Confirmation.jsp")
               .forward(request, response);
    }

    private void handleConfirm(HttpServletRequest request,
                               HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserSession user = (UserSession) session.getAttribute("user");
        ReservationData reservation = getOrCreateReservation(session);

        if (user == null || reservation == null) {
            response.sendRedirect("ReservationLogin.jsp");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            try {
                String insertSql =
                        "INSERT INTO Reservation " +
                        "(customer_id, room_id, guests, check_in, check_out, total_price, reservation_status, " +
                        " num_rooms, occasion_type, occasion_details) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                int newReservationId = 0;

                try (PreparedStatement ps =
                             conn.prepareStatement(insertSql, PreparedStatement.RETURN_GENERATED_KEYS)) {

                    ps.setInt(1, user.getCustomerId());

                    if (reservation.getSelectedRoomId() > 0) {
                        ps.setInt(2, reservation.getSelectedRoomId());
                    } else {
                        ps.setNull(2, java.sql.Types.INTEGER);
                    }

                    ps.setInt(3, reservation.getNumberOfGuests());
                    ps.setDate(4, java.sql.Date.valueOf(reservation.getCheckInDate()));
                    ps.setDate(5, java.sql.Date.valueOf(reservation.getCheckOutDate()));
                    ps.setBigDecimal(6, java.math.BigDecimal.valueOf(reservation.getTotalPrice()));
                    ps.setString(7, "CONFIRMED");

                    ps.setInt(8, reservation.getNumberOfRooms());
                    ps.setString(9, reservation.getOccasionType());
                    ps.setString(10, reservation.getOccasionDetails());

                    ps.executeUpdate();

                    try (ResultSet keys = ps.getGeneratedKeys()) {
                        if (keys.next()) {
                            newReservationId = keys.getInt(1);
                        }
                    }
                }

                conn.commit();

                if (newReservationId > 0) {
                    session.setAttribute("lastReservationId", newReservationId);
                    response.sendRedirect("Summary.jsp?reservationId=" + newReservationId);
                } else {
                    response.sendRedirect("Summary.jsp");
                }

            } catch (SQLException inner) {
                conn.rollback();
                throw inner;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("confirmError",
                    "Reservation could not be saved. Please try again.");
            request.getRequestDispatcher("Confirmation.jsp")
                   .forward(request, response);
        }
    }

    private void handleCancel(HttpServletRequest request,
                              HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UserSession user = (UserSession) session.getAttribute("user");

        String resIdStr = request.getParameter("reservationId");
        Integer resId = null;

        if (resIdStr != null && !resIdStr.isEmpty()) {
            resId = Integer.parseInt(resIdStr);
        } else {
            resId = (Integer) session.getAttribute("lastReservationId");
        }

        if (user == null || resId == null) {
            response.sendRedirect("ReservationLogin.jsp");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);

            try {
                // Update status instead of deleting record
                String cancelSql =
                    "UPDATE Reservation " +
                    "SET reservation_status = 'CANCELLED' " +
                    "WHERE reservation_id = ? AND customer_id = ? AND reservation_status = 'CONFIRMED'";

                int rowsUpdated;
                try (PreparedStatement ps = conn.prepareStatement(cancelSql)) {
                    ps.setInt(1, resId);
                    ps.setInt(2, user.getCustomerId());
                    rowsUpdated = ps.executeUpdate();
                }

                conn.commit();

                // If it was cancelled, clear the "lastReservationId" so the cancel button doesn't keep showing
                if (rowsUpdated > 0) {
                    session.removeAttribute("lastReservationId");
                }

                // Send user back to Lookup so they can see status changed to CANCELLED
                response.sendRedirect("LookupPage.jsp?reservation_id=" + resId + "&cancelled=true");

            } catch (SQLException inner) {
                conn.rollback();
                throw inner;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("cancelError",
                "Reservation could not be canceled. Please try again.");
            request.getRequestDispatcher("Summary.jsp")
                   .forward(request, response);
        }
    }

    private ReservationData getOrCreateReservation(HttpSession session) {
        ReservationData reservation =
                (ReservationData) session.getAttribute("reservationData");

        if (reservation == null) {
            reservation = new ReservationData();
            session.setAttribute("reservationData", reservation);
        }

        return reservation;
    }
}
