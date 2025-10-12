<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Modules 5 & 6 - CRUD-READ, JDBC, & JavaBeans
Date: 10/12/2025
File: read.jsp
Purpose: Uses JDBC to connect to MySQL, read all movie records from andy_movies_data,
populate MovieBean objects, and display them in an HTML table.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*,java.util.*,edu.bu.csd430.beans.MovieBean" %>

<%! 
private String esc(String s) {
    if (s == null) return "";
    return s.replace("&","&amp;").replace("<","&lt;")
            .replace(">","&gt;").replace("\"","&quot;")
            .replace("'","&#39;");
}
%>

<%
List<MovieBean> movies = new ArrayList<>();
String url = "jdbc:mysql://localhost:3306/CSD430";
String user = "student1";
String pass = "pass";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, pass);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM andy_movies_data ORDER BY release_year, title");

    while (rs.next()) {
        MovieBean movie = new MovieBean(
            rs.getInt("id"),
            rs.getString("title"),
            rs.getInt("release_year"),
            rs.getString("genre"),
            rs.getString("director"),
            rs.getDouble("rating"),
            rs.getString("notes")
        );
        movies.add(movie);
    }
    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Movies Data - JDBC READ</title>
    <link rel="stylesheet" href="assets/styles.css">
</head>
<body>
<header>
    <h1>Movies Database - JDBC READ</h1>
    <p class="subtitle">Records loaded from MySQL using JavaBean objects.</p>
</header>

<section class="table-wrap">
    <h2>Movie Records</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th><th>Title</th><th>Year</th>
                <th>Genre</th><th>Director</th><th>Rating</th><th>Notes</th>
            </tr>
        </thead>
        <tbody>
        <%
        for (MovieBean m : movies) {
        %>
            <tr>
                <td><%= m.getId() %></td>
                <td><%= esc(m.getTitle()) %></td>
                <td><%= m.getReleaseYear() %></td>
                <td><%= esc(m.getGenre()) %></td>
                <td><%= esc(m.getDirector()) %></td>
                <td><%= m.getRating() %></td>
                <td><%= esc(m.getNotes()) %></td>
            </tr>
        <%
        }
        %>
        </tbody>
        <tfoot>
            <tr><td colspan="7">Total Records: <%= movies.size() %></td></tr>
        </tfoot>
    </table>
</section>

<footer>
    <p>CSD-430 - Andy Stiles - Modules 5 & 6 - JDBC READ & JavaBeans</p>
</footer>
</body>
</html>
