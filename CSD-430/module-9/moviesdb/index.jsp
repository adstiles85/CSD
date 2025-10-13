<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: Course Index (updated for Modules 2–9)
Date: 10/12/2025
File: index.jsp
Purpose: Central index linking all module deliverables with shared CSS layout.
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>CSD-430 Deliverables</title>
  <link rel="stylesheet" href="assets/styles.css" />
</head>
<body class="index-page">
<header>
  <h1>CSD-430 Deliverables</h1>
  <p class="subtitle">Links to each module's pages.</p>
</header>

<main>
  <section>
    <h2>Modules</h2>
    <ul>
      <li><a href="/books/books.jsp">Module 2: Scriptlets Data Display (Books)</a></li>
      <li><a href="/feedback/feedbackForm.jsp">Module 3: JSP Forms</a></li>
      <li><a href="/booksbean/booksBean.jsp">Module 4: JavaBean Display</a></li>
      <li><a href="/moviesdb/read.jsp">Modules 5 &amp; 6: JDBC READ (Movies)</a></li>
      <li><a href="/moviesdb/selectMovie.jsp">Modules 5 &amp; 6: Project Part 1: Select Movie</a></li>
      <li><a href="/moviesdb/addMovieForm.jsp">Module 7: Project Part 2: Add Movie (CREATE)</a></li>
      <li><a href="/moviesdb/updateSelect.jsp">Module 8: Project Part 3: Update Movie (by ID)</a></li>
      <li><a href="/moviesdb/deleteList.jsp">Module 9: Project Part 4: Delete Movie (by ID)</a></li>
    </ul>
  </section>
</main>

<footer>
  <p>CSD-430 – Andy Stiles – JDBC Project – Index Page</p>
</footer>
</body>
</html>
