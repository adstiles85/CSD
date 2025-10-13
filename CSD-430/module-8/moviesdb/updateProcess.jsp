<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Module 8 - Project Part 3 (UPDATE)
Date: 10/12/2025
File: updateProcess.jsp
Purpose: Apply updates via JDBC, then display the updated record in a table with header that includes field types.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*,edu.bu.csd430.beans.MovieBean" %>

<%! 
private String esc(String s){ if(s==null)return ""; return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;").replace("\"","&quot;").replace("'","&#39;"); }
%>

<%
request.setCharacterEncoding("UTF-8");
String idParam = request.getParameter("id");
String title   = request.getParameter("title");
String yearStr = request.getParameter("releaseYear");
String genre   = request.getParameter("genre");
String director= request.getParameter("director");
String ratingS = request.getParameter("rating");
String notes   = request.getParameter("notes");

String error=null; MovieBean m=null;

if(idParam!=null && idParam.matches("\\d+")){
    int id=Integer.parseInt(idParam);
    int year=Integer.parseInt(yearStr);
    Double rating = (ratingS==null || ratingS.trim().isEmpty()) ? null : Double.valueOf(ratingS);

    String url="jdbc:mysql://localhost:3306/CSD430"; String user="student1"; String pass="pass";
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn=DriverManager.getConnection(url,user,pass);

        String sql="UPDATE andy_movies_data SET title=?, release_year=?, genre=?, director=?, rating=?, notes=? WHERE id=?";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setString(1,title);
        ps.setInt(2,year);
        ps.setString(3,genre);
        ps.setString(4,director);
        if(rating==null){ ps.setNull(5, java.sql.Types.DECIMAL); } else { ps.setDouble(5, rating); }
        ps.setString(6,notes);
        ps.setInt(7,id);
        ps.executeUpdate();
        ps.close();

        PreparedStatement get=conn.prepareStatement(
          "SELECT id,title,release_year,genre,director,rating,notes FROM andy_movies_data WHERE id=?");
        get.setInt(1,id);
        ResultSet rs=get.executeQuery();
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
        } else {
            error="Record updated but could not be reloaded.";
        }
        rs.close(); get.close(); conn.close();
    }catch(Exception e){ error=e.getMessage(); }
}else{
    error="Invalid or missing id parameter.";
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Movie Updated</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
  <h1>Movie Updated</h1>
  <p class="subtitle">The updated record is shown below.</p>
</header>

<section class="desc">
  <h2>About this page</h2>
  <p>This page writes updated values to the database using JDBC and shows the updated record. Field types are indicated in the table header.</p>
</section>

<section class="table-wrap">
  <h2>Updated Record</h2>

  <% if(error!=null){ %>
    <p style="color:red;"><%= esc(error) %></p>
    <p><a class="button" href="/moviesdb/updateSelect.jsp">Try another</a></p>
  <% } else if(m!=null) { %>
    <table>
      <thead>
        <tr>
          <th>ID<br/><small>INT (PK)</small></th>
          <th>Title<br/><small>VARCHAR</small></th>
          <th>Year<br/><small>INT</small></th>
          <th>Genre<br/><small>VARCHAR</small></th>
          <th>Director<br/><small>VARCHAR</small></th>
          <th>Rating<br/><small>DECIMAL(2,1)</small></th>
          <th>Notes<br/><small>VARCHAR</small></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><%= m.getId() %></td>
          <td><%= esc(m.getTitle()) %></td>
          <td><%= m.getReleaseYear() %></td>
          <td><%= esc(m.getGenre()) %></td>
          <td><%= esc(m.getDirector()) %></td>
          <td><%= m.getRating() %></td>
          <td><%= esc(m.getNotes()) %></td>
        </tr>
      </tbody>
      <tfoot>
        <tr><td colspan="7">Source table: andy_movies_data</td></tr>
      </tfoot>
    </table>
    <p class="actions" style="margin-top:12px;">
      <a class="button" href="/moviesdb/updateSelect.jsp">Update another</a>
      <a class="button" href="/moviesdb/read.jsp">Back to full list</a>
    </p>
  <% } %>
</section>

<footer><p>CSD-430 - Andy Stiles - Module 8 - UPDATE</p></footer>
</body>
</html>
