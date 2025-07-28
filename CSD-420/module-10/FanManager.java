/*
 * Name: Andrew Stiles
 * Course: CSD-420
 * Assignment: M10 - Fan Database Viewer/Updater
 * Description: Connects to a MySQL database to display and update fan information.
 */

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;

public class FanManager extends JFrame {
    private JTextField idField, firstNameField, lastNameField, teamField;
    private JButton displayButton, updateButton;

    public FanManager() {
        super("Fan Manager");

        // Labels and input fields
        JLabel idLabel = new JLabel("ID:");
        idField = new JTextField(5);

        JLabel firstNameLabel = new JLabel("First Name:");
        firstNameField = new JTextField(15);

        JLabel lastNameLabel = new JLabel("Last Name:");
        lastNameField = new JTextField(15);

        JLabel teamLabel = new JLabel("Favorite Team:");
        teamField = new JTextField(15);

        // Buttons
        displayButton = new JButton("Display");
        updateButton = new JButton("Update");

        // Layout
        setLayout(new GridLayout(5, 2, 5, 5));
        add(idLabel); add(idField);
        add(firstNameLabel); add(firstNameField);
        add(lastNameLabel); add(lastNameField);
        add(teamLabel); add(teamField);
        add(displayButton); add(updateButton);

        // Button listeners
        displayButton.addActionListener(e -> displayFan());
        updateButton.addActionListener(e -> updateFan());

        // Window settings
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(350, 250);
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void displayFan() {
        String id = idField.getText();

        try (Connection conn = getConnection()) {
            String query = "SELECT firstname, lastname, favoriteteam FROM fans WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(id));

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                firstNameField.setText(rs.getString("firstname"));
                lastNameField.setText(rs.getString("lastname"));
                teamField.setText(rs.getString("favoriteteam"));
            } else {
                JOptionPane.showMessageDialog(this, "No fan found with ID " + id);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
        }
    }

    private void updateFan() {
        String id = idField.getText();
        String firstname = firstNameField.getText();
        String lastname = lastNameField.getText();
        String team = teamField.getText();

        try (Connection conn = getConnection()) {
            String update = "UPDATE fans SET firstname=?, lastname=?, favoriteteam=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(update);
            stmt.setString(1, firstname);
            stmt.setString(2, lastname);
            stmt.setString(3, team);
            stmt.setInt(4, Integer.parseInt(id));

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                JOptionPane.showMessageDialog(this, "Record updated successfully.");
            } else {
                JOptionPane.showMessageDialog(this, "No record found to update.");
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Error: " + ex.getMessage());
        }
    }

    private Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/databasedb";
        String user = "student1";
        String password = "pass";
        return DriverManager.getConnection(url, user, password);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new FanManager());
    }
}
