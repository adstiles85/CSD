<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: M4 JavaBean
Date: 9/8/2025
File: booksBean.jsp
Explanation: Uses a Serializable JavaBean (BookBean) and scriptlets to build and 
display five book records (from Module 2) in an HTML table with grouping and notes.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.util.*, edu.bu.csd430.beans.BookBean" %>

<%! 
    // Intention: helper to escape HTML for safe output
    private String esc(String s) {
        if (s == null) return "";
        return s.replace("&","&amp;").replace("<","&lt;")
                .replace(">","&gt;").replace("\"","&quot;")
                .replace("'","&#39;");
    }
%>

<%
    // Intention: seed data using the JavaBean (Module 2 titles)
    List<BookBean> books = new ArrayList<>();
    books.add(new BookBean("Project Hail Mary", "Andy Weir", "Science Fiction", 2021, "Inventive first contact"));
    books.add(new BookBean("Tress of the Emerald Sea", "Brandon Sanderson", "Fantasy", 2023, "Fairy tale voice, high charm"));
    books.add(new BookBean("The Midnight Library", "Matt Haig", "Contemporary", 2020, "What-if life paths"));
    books.add(new BookBean("The Fellowship of the Ring", "J. R. R. Tolkien", "Fantasy", 1954, "Classic quest opener"));
    books.add(new BookBean("Wind and Truth", "Brandon Sanderson", "Fantasy", 2024, "Stormlight epic milestone"));

    // Intention: sort by genre then title for grouped display
    books.sort(Comparator.comparing(BookBean::getGenre).thenComparing(BookBean::getTitle));

    String currentGenre = null; // Intention: track genre breaks
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Favorite Books — JavaBean Display</title>
    <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
    <h1>Favorite Books</h1>
    <p class="subtitle">JavaBean + JSP scriptlets. HTML outside scriptlets. External CSS.</p>
</header>

<section class="desc">
    <h2>About this page</h2>
    <p>This page creates <code>BookBean</code> instances in a scriptlet, groups them by genre, and renders them in a clean HTML table.</p>

    <h3>Field descriptions</h3>
    <ul>
        <li><strong>Title</strong>: Book name</li>
        <li><strong>Author</strong>: Primary author</li>
        <li><strong>Year</strong>: Publication year</li>
        <li><strong>Notes</strong>: Short descriptor</li>
    </ul>
</section>

<section class="table-wrap">
    <h2>Books Table</h2>
    <table>
        <thead>
            <tr>
                <th scope="col">Title</th>
                <th scope="col">Author</th>
                <th scope="col" class="nowrap">Year</th>
                <th scope="col">Notes</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (BookBean b : books) {
                if (currentGenre == null || !currentGenre.equals(b.getGenre())) {
                    currentGenre = b.getGenre();
        %>
            <tr class="group-row">
                <td colspan="4" class="group-cell"><%= esc(currentGenre) %></td>
            </tr>
        <%
                }
        %>
            <tr>
                <td><%= esc(b.getTitle()) %></td>
                <td><%= esc(b.getAuthor()) %></td>
                <td class="nowrap"><%= b.getYear() %></td>
                <td><%= esc(b.getNote()) %></td>
            </tr>
        <%
            } // end for
        %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" class="foot-note">Total records: <%= books.size() %></td>
            </tr>
        </tfoot>
    </table>
</section>

<footer>
    <p>Andy Stiles - CSD-430 - Module 4 - JavaBean with Serializable + JSP scriptlets</p>
</footer>
</body>
</html>
