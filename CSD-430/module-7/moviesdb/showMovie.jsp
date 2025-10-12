<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Modules 5 & 6 - Project Part 1
Date: 10/12/2025
File: showMovie.jsp
Purpose: Reads ?id= from request, loads that record, and displays all fields in a table using HTML outside scriptlets.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*,edu.bu.csd430.beans.MovieBean" %>

<%! 
private String esc(String s) {
    if (s == null) return "";
    return s.replace("&","&amp;").replace("<","&lt;")
            .replace(">","&gt;").replace("\"","&quot;")
            .replace("'","&#39;");
}
%>

<%
String idParam = request.getParameter("id");
MovieBean movie = null;
String error = null;

if (idParam != null && idParam.matches("\\d+")) {
    int id = Integer.parseInt(idParam);
    String url = "jdbc:mysql://localhost:3306/CSD430";
    String user = "student1";
    String pass = "pass";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, pass);
        PreparedStatement ps = conn.prepareStatement(
            "SELECT id, title, release_year, genre, director, rating, notes " +
            "FROM andy_movies_data WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            movie = new MovieBean(
                rs.getInt("id"),
                rs.getString("title"),
                rs.getInt("release_year"),
                rs.getString("genre"),
                rs.getString("director"),
                rs.getDouble("rating"),
                rs.getString("notes")
            );
        } else {
            error = "No record found for id=" + id;
        }
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        error = e.getMessage();
    }
} else {
    error = "Invalid or missing id parameter.";
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Movie Details</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
  <h1>Movie Details</h1>
  <p class="subtitle">Displaying the selected record from the database.</p>
</header>

<section class="desc">
  <h2>About this page</h2>
  <p>This page queries a single record by primary key and displays all fields in a table. The data is retrieved via JDBC and represented as a JavaBean.</p>
</section>

<section class="table-wrap">
  <h2>Record</h2>

  <% if (error != null) { %>
    <p style="color: red;"><%= esc(error) %></p>
  <% } else if (movie != null) { %>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Title</th>
          <th>Year</th>
          <th>Genre</th>
          <th>Director</th>
          <th>Rating</th>
          <th>Notes</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><%= movie.getId() %></td>
          <td><%= esc(movie.getTitle()) %></td>
          <td><%= movie.getReleaseYear() %></td>
          <td><%= esc(movie.getGenre()) %></td>
          <td><%= esc(movie.getDirector()) %></td>
          <td><%= movie.getRating() %></td>
          <td><%= esc(movie.getNotes()) %></td>
        </tr>
      </tbody>
      <tfoot>
        <tr><td colspan="7">Source table: andy_movies_data</td></tr>
      </tfoot>
    </table>
  <% } %>

  <p class="actions" style="margin-top: 12px;">
    <a class="button" href="/moviesdb/selectMovie.jsp">Choose another</a>
    <a class="button" href="/moviesdb/read.jsp">Back to full list</a>
  </p>
</section>

<footer>
  <p>CSD-430 - Andy Stiles - Modules 5 & 6 - Project Part 1</p>
</footer>
</body>
</html>
