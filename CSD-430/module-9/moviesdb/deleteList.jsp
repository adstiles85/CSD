<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Module 9 – Project Part 4 (DELETE)
Date: 10/12/2025
File: deleteList.jsp
Purpose: Displays all movie records in a table and provides a dropdown of IDs to delete.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*,java.util.*,edu.bu.csd430.beans.MovieBean" %>

<%! 
private String esc(String s){
    if(s==null) return "";
    return s.replace("&","&amp;").replace("<","&lt;")
            .replace(">","&gt;").replace("\"","&quot;")
            .replace("'","&#39;");
}
%>

<%
List<MovieBean> movies = new ArrayList<>();
List<Integer> ids = new ArrayList<>();
String url = "jdbc:mysql://localhost:3306/CSD430";
String user = "student1";
String pass = "pass";
String error = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, pass);

    Statement st = conn.createStatement();
    ResultSet rs = st.executeQuery(
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
        ids.add(rs.getInt("id"));
    }
    rs.close(); st.close(); conn.close();
} catch (Exception e) {
    error = e.getMessage();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Delete Movies</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
  <h1>Movies Database – Delete</h1>
  <p class="subtitle">Select a record by primary key and delete it. The table and dropdown update after each deletion.</p>
</header>

<section class="desc">
  <h2>About this page</h2>
  <p>This page lists all movies and provides a dropdown of IDs. Deletion uses JDBC and the existing JavaBean model.</p>
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
      <% if (movies.isEmpty()) { %>
        <!-- Empty tbody on purpose; header still shows per requirement -->
      <% } else { 
           for (MovieBean m : movies) { %>
        <tr>
          <td><%= m.getId() %></td>
          <td><%= esc(m.getTitle()) %></td>
          <td><%= m.getReleaseYear() %></td>
          <td><%= esc(m.getGenre()) %></td>
          <td><%= esc(m.getDirector()) %></td>
          <td><%= m.getRating() %></td>
          <td><%= esc(m.getNotes()) %></td>
        </tr>
      <% } } %>
    </tbody>
    <tfoot>
      <tr><td colspan="7">Total Records: <%= movies.size() %></td></tr>
    </tfoot>
  </table>

  <% if (error != null) { %>
    <p style="color:red; margin-top:10px;">Error: <%= esc(error) %></p>
  <% } %>
</section>

<section style="margin-top:16px;">
  <form class="card" action="deleteProcess.jsp" method="post" style="max-width:560px;">
    <label>Choose Movie ID to delete:
      <select name="id" <%= ids.isEmpty() ? "disabled" : "" %> required>
        <option value="">Select one</option>
        <% for (Integer id : ids) { %>
          <option value="<%= id %>"><%= id %></option>
        <% } %>
      </select>
    </label>
    <div class="actions" style="margin-top:10px;">
      <button type="submit" <%= ids.isEmpty() ? "disabled" : "" %>>Delete Selected</button>
      <a class="button" href="/moviesdb/read.jsp">Back to Full List</a>
    </div>
  </form>
</section>

<footer>
  <p>CSD-430 - Andy Stiles - Module 9 - JDBC DELETE</p>
</footer>
</body>
</html>
