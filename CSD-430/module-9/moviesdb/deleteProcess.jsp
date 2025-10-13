<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Module 9 - Project Part 4 (DELETE)
Date: 10/12/2025
File: deleteProcess.jsp
Purpose: Deletes the selected record by ID, then redisplays all remaining rows in a table and a refreshed dropdown.
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
request.setCharacterEncoding("UTF-8");
String idParam = request.getParameter("id");
String url = "jdbc:mysql://localhost:3306/CSD430";
String user = "student1";
String pass = "pass";

String resultMsg = null;
String error = null;

// Delete the selected row if ID is valid
if (idParam != null && idParam.matches("\\d+")) {
    int id = Integer.parseInt(idParam);
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url, user, pass);
        PreparedStatement ps = conn.prepareStatement("DELETE FROM andy_movies_data WHERE id=?");
        ps.setInt(1, id);
        int affected = ps.executeUpdate();
        ps.close();
        conn.close();
        resultMsg = (affected == 1) ? ("Deleted record id=" + id) : ("No record deleted for id=" + id);
    } catch (Exception e) {
        error = e.getMessage();
    }
} else {
    error = "Invalid or missing id parameter.";
}

// Re-query remaining rows and IDs for display + dropdown
List<MovieBean> movies = new ArrayList<>();
List<Integer> ids = new ArrayList<>();

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
    error = (error == null) ? e.getMessage() : error + " | " + e.getMessage();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Delete Movies – Result</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
  <h1>Movies Database – Delete Result</h1>
  <p class="subtitle">Below is the current state of the table after your action.</p>
</header>

<section class="desc">
  <h2>About this page</h2>
  <p>This page deletes the selected record using JDBC, then shows the remaining records. If all records are deleted, the table still displays the header row.</p>
</section>

<section>
  <% if (resultMsg != null) { %>
    <p style="color:green;"><%= esc(resultMsg) %></p>
  <% } %>
  <% if (error != null) { %>
    <p style="color:red;">Error: <%= esc(error) %></p>
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
      <% if (movies.isEmpty()) { %>
        <!-- Empty tbody to satisfy requirement; header remains visible -->
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
      <a class="button" href="/moviesdb/deleteList.jsp">Back to Delete List</a>
    </div>
  </form>
</section>

<footer>
  <p>CSD-430 - Andy Stiles - Module 9 - JDBC DELETE</p>
</footer>
</body>
</html>