<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Modules 5 & 6 - CRUD-READ, JDBC, & JavaBeans
Date: 10/12/2025
File: index.jsp
Purpose: Central index linking all module deliverables. Update links as modules progress.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>CSD-430 Deliverables Index</title>
  <style>
    body{font-family:Segoe UI,Roboto,Arial,sans-serif;margin:24px}
    h1{margin:0 0 6px} .muted{color:#555;margin:0 0 16px}
    ul{line-height:1.8}
    a{color:#0b6efd;text-decoration:none}
    a:hover{text-decoration:underline}
  </style>
</head>
<body>
  <h1>CSD-430 Deliverables</h1>
  <p class="muted">Links to each module's pages.</p>

  <h2>Modules</h2>
  <ul>
    <li><a href="/books/books.jsp">Module 2: Scriptlets Data Display (Books)</a></li>
    <li><a href="/feedback/feedbackForm.jsp">Module 3: JSP Forms</a></li>
    <li><a href="/booksbean/booksBean.jsp">Module 4: JavaBean Display</a></li>
    <li><a href="/moviesdb/read.jsp">Modules 5 & 6: JDBC READ (Movies)</a></li>
    <li><a href="/moviesdb/selectMovie.jsp">Modules 5 & 6: Project Part 1: Select Movie</a></li>
    <li><a href="/moviesdb/addMovieForm.jsp">Module 7: Project Part 2: Add Movie (CREATE)</a></li>
    <li><a href="/moviesdb/updateSelect.jsp">Module 8: Project Part 3: Update Movie (by ID)</a></li>
  </ul>
</body>
</html>
