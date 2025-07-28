/*
 * Name: Andrew Stiles
 * Course: CSD-420
 * Assignment: M9 – Java-MySQL Test Connection
 * Description: A JDBC connection test to databasedb using student1/pass.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLConnectionTest {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/databasedb";
        String user = "student1";
        String password = "pass";

        try {
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("✅ Connected to MySQL database successfully!");
            conn.close();
        } catch (SQLException e) {
            System.out.println("❌ Connection failed.");
            e.printStackTrace();
        }
    }
}
