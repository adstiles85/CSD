<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Module 7 - Project Part 2 (CREATE)
Date: 10/12/2025
File: addMovie.jsp
Purpose: Reads POSTed form values, builds a MovieBean, inserts into MySQL with JDBC,
         then queries and displays all records in an HTML table.
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
request.setCharacterEncoding("UTF-8");

String title       = request.getParameter("title");
String releaseYear = request.getParameter("releaseYear");
String genre       = request.getParameter("genre");
String director    = request.getParameter("director");
String ratingStr   = request.getParameter("rating");
String notes       = request.getParameter("notes");

String url  = "jdbc:mysql://localhost:3306/CSD430";
String user = "student1";
String pass = "pass";

String insertError = null;
List<MovieBean> movies = new ArrayList<>();

try {
    // Build a MovieBean from inputs
    int year = Integer.parseInt(releaseYear);
    double rating = (ratingStr == null || ratingStr.trim().isEmpty()) ? 0.0 : Double.parseDouble(ratingStr);
    MovieBean bean = new MovieBean(0, title, year, genre, director, rating, notes);

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, pass);

    // Insert the bean into the database
    String sql = "INSERT INTO andy_movies_data (title, release_year, genre, director, rating, notes) " +
                 "VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, bean.getTitle());
    ps.setInt(2, bean.getReleaseYear());
    ps.setString(3, bean.getGenre());
    ps.setString(4, bean.getDirector());
    if (ratingStr == null || ratingStr.trim().isEmpty()) {
        ps.setNull(5, java.sql.Types.DECIMAL);
    } else {
        ps.setDouble(5, bean.getRating());
    }
    ps.setString(6, bean.getNotes());
    ps.executeUpdate();
    ps.close();

    // Query all records to display
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(
        "SELECT id, title, release_year, genre, director, rating, notes " +
        "FROM andy_movies_data ORDER BY release_year, title"
    );

    while (rs.next()) {
        movies.add(new MovieBean(
            rs.getInt("id"),
            rs.getString("title"),
            rs.getInt("release_year"),
            rs.getString("genre"),
            rs.getString("director"),
            rs.getDouble("rating"),
            rs.getString("notes")
        ));
    }

    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    insertError = e.getMessage();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Movie Added</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
  <h1>Movies Database</h1>
  <p class="subtitle">New record processed. The table below shows all movies currently stored.</p>
</header>

<section class="desc">
  <h2>About this page</h2>
  <p>This page inserts your submitted record using a JavaBean and JDBC, then displays all records in a table with column headers.</p>
</section>

<section>
  <% if (insertError != null) { %>
    <p style="color:red;">Error while inserting: <%= esc(insertError) %></p>
    <p><a class="button" href="/moviesdb/addMovieForm.jsp">Back to form</a></p>
  <% } else { %>
    <p><a class="button" href="/moviesdb/addMovieForm.jsp">Add another movie</a></p>
  <% } %>
</section>

<section class="table-wrap">
  <h2>All Movies</h2>
  <table>
    <thead>
      <tr>
        <th>ID</th><th>Title</th><th>Year</th><th>Genre</th><th>Director</th><th>Rating</th><th>Notes</th>
      </tr>
    </thead>
    <tbody>
      <% for (MovieBean m : movies) { %>
        <tr>
          <td><%= m.getId() %></td>
          <td><%= esc(m.getTitle()) %></td>
          <td><%= m.getReleaseYear() %></td>
          <td><%= esc(m.getGenre()) %></td>
          <td><%= esc(m.getDirector()) %></td>
          <td><%= m.getRating() %></td>
          <td><%= esc(m.getNotes()) %></td>
        </tr>
      <% } %>
    </tbody>
    <tfoot>
      <tr><td colspan="7">Total Records: <%= movies.size() %></td></tr>
    </tfoot>
  </table>
</section>

<footer>
  <p>CSD-430 - Andy Stiles - Module 7 - CREATE</p>
</footer>
</body>
</html>
