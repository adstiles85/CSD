<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Modules 5 & 6 - Project Part 1
Date: 10/12/2025
File: selectMovie.jsp
Purpose: Connects to MySQL, loads all primary keys and titles, and renders a dropdown form.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*,java.util.*" %>

<%! 
private String esc(String s) {
    if (s == null) return "";
    return s.replace("&","&amp;").replace("<","&lt;")
            .replace(">","&gt;").replace("\"","&quot;")
            .replace("'","&#39;");
}
%>

<%
List<Integer> ids = new ArrayList<>();
List<String> labels = new ArrayList<>();

String url = "jdbc:mysql://localhost:3306/CSD430";
String user = "student1";
String pass = "pass";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, user, pass);
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT id, title FROM andy_movies_data ORDER BY id");

    while (rs.next()) {
        ids.add(rs.getInt("id"));
        labels.add(rs.getString("title"));
    }
    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    out.println("<p style='color:red;'>Error: " + esc(e.getMessage()) + "</p>");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Select a Movie</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
  <h1>Movies Database</h1>
  <p class="subtitle">Select a record by its primary key to view details.</p>
</header>

<section class="desc">
  <h2>Field descriptions</h2>
  <ul>
    <li><strong>ID</strong>: Primary key</li>
    <li><strong>Title, Year, Genre, Director, Rating, Notes</strong>: Movie details stored in the database</li>
  </ul>
</section>

<section>
  <form action="showMovie.jsp" method="get" class="card" style="max-width:560px;">
    <label>
      Choose Movie (by ID):
      <select name="id" required>
        <option value="">Select one</option>
        <% for (int i = 0; i < ids.size(); i++) { %>
          <option value="<%= ids.get(i) %>">
            <%= ids.get(i) %> — <%= esc(labels.get(i)) %>
          </option>
        <% } %>
      </select>
    </label>
    <div class="actions" style="margin-top:10px;">
      <button type="submit">View Record</button>
      <a class="button" href="/moviesdb/read.jsp">Back to Full List</a>
    </div>
  </form>
</section>

<footer>
  <p>CSD-430 - Andy Stiles - Modules 5 & 6 - Project Part 1</p>
</footer>
</body>
</html>
