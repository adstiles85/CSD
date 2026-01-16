package com.moffatbay.reservations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.io.InputStream;

/**
 * Centralize all database connection logic and queries
 * used across the reservation system.
 */
public class DBConnection {

    // Load MySQL JDBC driver so Tomcat finds it inside WEB-INF/lib
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL Driver Loaded Successfully.");
        } catch (ClassNotFoundException e) {
            System.out.println("FAILED TO LOAD MYSQL DRIVER.");
            e.printStackTrace();
        }
    }

    // Connection settings pulled from db.properties in WEB-INF/classes
    private static final String URL;
    private static final String USER;
    private static final String PASSWORD;

    static {
        String urlTmp = "jdbc:mysql://localhost:3306/moffat_bay";
        String userTmp = "root";
        String passTmp = "pass";

        try {
            Properties props = new Properties();
            InputStream in = DBConnection.class.getClassLoader().getResourceAsStream("db.properties");
            if (in != null) {
                props.load(in);
                urlTmp  = props.getProperty("db.url", urlTmp);
                userTmp = props.getProperty("db.user", userTmp);
                passTmp = props.getProperty("db.password", passTmp);
                in.close();
            } else {
                System.out.println("db.properties not found, using defaults.");
            }
        } catch (Exception ex) {
            System.out.println("Error loading db.properties, using defaults.");
            ex.printStackTrace();
        }

        URL = urlTmp;
        USER = userTmp;
        PASSWORD = passTmp;
    }

    /**
     * Provide a new JDBC connection to the moffat_bay database.
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    /**
     * Pull all room types for BookingDetails.jsp.
     */
    public static List<RoomType> getAllRoomTypes() {
        List<RoomType> roomTypes = new ArrayList<>();

        String sql = "SELECT room_typeID, typeName, description, rate, guests_max FROM room_type";

        try (
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
        ) {
            while (rs.next()) {
                RoomType rt = new RoomType(
                    rs.getInt("room_typeID"),
                    rs.getString("typeName"),
                    rs.getString("description"),
                    rs.getString("rate"),
                    rs.getInt("guests_max")
                );
                roomTypes.add(rt);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roomTypes;
    }

    /**
     * Pull a single room type for confirmation calculations.
     */
    public static RoomType getRoomTypeById(int roomTypeId) {

        String sql = "SELECT room_typeID, typeName, description, rate, guests_max " +
                     "FROM room_type WHERE room_typeID = ?";

        try (
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
        ) {
            stmt.setInt(1, roomTypeId);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new RoomType(
                        rs.getInt("room_typeID"),
                        rs.getString("typeName"),
                        rs.getString("description"),
                        rs.getString("rate"),
                        rs.getInt("guests_max")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
}
