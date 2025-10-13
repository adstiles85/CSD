<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Module 8 - Project Part 3 (UPDATE)
Date: 10/12/2025
File: updateSelect.jsp
Purpose: Load all primary keys and titles into a dropdown so the user can choose a record to update.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*,java.util.*" %>

<%! 
private String esc(String s){ if(s==null)return ""; return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;").replace("'","&#39;"); }
%>

<%
List<Integer> ids = new ArrayList<>();
List<String> titles = new ArrayList<>();
String url="jdbc:mysql://localhost:3306/CSD430"; String user="student1"; String pass="pass";
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn=DriverManager.getConnection(url,user,pass);
    Statement st=conn.createStatement();
    ResultSet rs=st.executeQuery("SELECT id, title FROM andy_movies_data ORDER BY id");
    while(rs.next()){ ids.add(rs.getInt("id")); titles.add(rs.getString("title")); }
    rs.close(); st.close(); conn.close();
}catch(Exception e){ out.println("<p style='color:red;'>Error: "+esc(e.getMessage())+"</p>"); }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Update a Movie</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
  <h1>Update a Movie</h1>
  <p class="subtitle">Select a record by its primary key to edit its details.</p>
</header>

<section class="desc">
  <h2>Field descriptions</h2>
  <ul>
    <li><strong>ID</strong> is the primary key and cannot be changed.</li>
    <li><strong>Title, Year, Genre, Director, Rating, Notes</strong> can be updated.</li>
  </ul>
</section>

<section>
  <form action="updateForm.jsp" method="get" class="card" style="max-width:560px;">
    <label>Choose Movie (by ID):
      <select name="id" required>
        <option value="">Select one</option>
        <% for(int i=0;i<ids.size();i++){ %>
          <option value="<%= ids.get(i) %>"><%= ids.get(i) %> — <%= esc(titles.get(i)) %></option>
        <% } %>
      </select>
    </label>
    <div class="actions" style="margin-top:10px;">
      <button type="submit">Edit</button>
      <a class="button" href="/moviesdb/read.jsp">Back to Full List</a>
    </div>
  </form>
</section>

<footer><p>CSD-430 - Andy Stiles - Module 8 - UPDATE</p></footer>
</body>
</html>
