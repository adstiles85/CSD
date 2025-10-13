<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Module 8 - Project Part 3 (UPDATE)
Date: 10/12/2025
File: updateForm.jsp
Purpose: Load a single record by id and present an editable form for all fields except the key (ID).
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*,edu.bu.csd430.beans.MovieBean" %>

<%! 
private String esc(String s){ if(s==null)return ""; return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;").replace("'","&#39;"); }
%>

<%
String idParam = request.getParameter("id");
MovieBean m = null; String error=null;
if(idParam!=null && idParam.matches("\\d+")){
    int id=Integer.parseInt(idParam);
    String url="jdbc:mysql://localhost:3306/CSD430"; String user="student1"; String pass="pass";
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn=DriverManager.getConnection(url,user,pass);
        PreparedStatement ps=conn.prepareStatement(
          "SELECT id, title, release_year, genre, director, rating, notes FROM andy_movies_data WHERE id=?");
        ps.setInt(1,id);
        ResultSet rs=ps.executeQuery();
        if(rs.next()){
            m=new MovieBean(
              rs.getInt("id"),
              rs.getString("title"),
              rs.getInt("release_year"),
              rs.getString("genre"),
              rs.getString("director"),
              rs.getDouble("rating"),
              rs.getString("notes")
            );
        } else { error="No record found for id="+id; }
        rs.close(); ps.close(); conn.close();
    }catch(Exception e){ error=e.getMessage(); }
}else{ error="Invalid or missing id parameter."; }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Edit Movie</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
  <h1>Edit Movie</h1>
  <p class="subtitle">Update fields below. ID is read-only.</p>
</header>

<section>
  <% if(error!=null){ %>
    <p style="color:red;"><%= esc(error) %></p>
    <p><a class="button" href="/moviesdb/updateSelect.jsp">Choose another</a></p>
  <% } else { %>
  <form class="card" action="updateProcess.jsp" method="post" style="max-width:640px;">
    <label>ID (read-only)
      <input type="text" name="id" value="<%= m.getId() %>" readonly />
    </label>

    <label>Title*
      <input type="text" name="title" value="<%= esc(m.getTitle()) %>" required />
    </label>

    <div class="grid">
      <label>Year*
        <input type="number" name="releaseYear" min="1888" max="2100" value="<%= m.getReleaseYear() %>" required />
      </label>
      <label>Genre*
        <input type="text" name="genre" value="<%= esc(m.getGenre()) %>" required />
      </label>
    </div>

    <label>Director*
      <input type="text" name="director" value="<%= esc(m.getDirector()) %>" required />
    </label>

    <label>Rating
      <input type="number" name="rating" step="0.1" min="0" max="10" value="<%= m.getRating() %>" />
    </label>

    <label>Notes
      <textarea name="notes" rows="3"><%= esc(m.getNotes()) %></textarea>
    </label>

    <div class="actions" style="margin-top:10px;">
      <button type="submit">Save Changes</button>
      <a class="button" href="/moviesdb/selectMovie.jsp">Cancel</a>
    </div>
  </form>
  <% } %>
</section>

<footer><p>CSD-430 - Andy Stiles - Module 8 - UPDATE</p></footer>
</body>
</html>
