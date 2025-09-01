<%-- 
    Name: Andrew Stiles
    Class: CSD-430 Server Side Development
    Assignment: Module 2 - Java Scriptlet Data Display
    Date: 8/31/2025
    File: books.jsp
    Explanation: This JSP file uses scriptlets to create and display
                 a table of five favorite books. It demonstrates
                 Java + HTML integration, grouping records by genre,
                 and linking to an external CSS stylesheet for style.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Favorite Books — Data Display</title>
    <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
    <h1>Favorite Books</h1>
    <p class="subtitle">Dynamic table built with JSP scriptlets and external CSS.</p>
</header>

<section class="desc">
    <h2>About this page</h2>
    <p>
        This page renders a list of books I enjoyed. Data is stored in Java objects,
        grouped by genre, and displayed in an HTML table.
    </p>

    <h3>Field descriptions</h3>
    <ul>
        <li><strong>Title</strong>: Book name</li>
        <li><strong>Author</strong>: Primary author</li>
        <li><strong>Year</strong>: Publication year</li>
        <li><strong>Notes</strong>: Short descriptor</li>
    </ul>
</section>

<%-- 
  Intention: Define a simple Book class and seed five records.
  Keep all HTML tags outside scriptlets. Use scriptlets only for data and control flow.
--%>
<%
    // Intention: model for each book record
    class Book {
        String title;
        String author;
        String genre;
        int year;
        String note;

        Book(String title, String author, String genre, int year, String note) {
            this.title = title;
            this.author = author;
            this.genre = genre;
            this.year = year;
            this.note = note;
        }
    }

    // Intention: create data records
    java.util.List<Book> books = new java.util.ArrayList<>();
    books.add(new Book("Project Hail Mary", "Andy Weir", "Science Fiction", 2021, "Inventive first contact"));
    books.add(new Book("Tress of the Emerald Sea", "Brandon Sanderson", "Fantasy", 2023, "Fairy tale voice, high charm"));
    books.add(new Book("The Midnight Library", "Matt Haig", "Contemporary", 2020, "What-if life paths"));
    books.add(new Book("The Fellowship of the Ring", "J. R. R. Tolkien", "Fantasy", 1954, "Classic quest opener"));
    books.add(new Book("Wind and Truth", "Brandon Sanderson", "Fantasy", 2024, "Stormlight epic milestone"));

    // Intention: sort by genre, then title
    books.sort(
        java.util.Comparator
            .comparing((Book b) -> b.genre)
            .thenComparing(b -> b.title)
    );

    // Intention: track current genre for group headers
    String currentGenre = null;
%>

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
        <%-- Intention: loop through books and insert a group row on genre change --%>
        <%
            for (Book b : books) {
                if (currentGenre == null || !currentGenre.equals(b.genre)) {
                    currentGenre = b.genre;
        %>
            <tr class="group-row">
                <td colspan="4" class="group-cell"><%= currentGenre %></td>
            </tr>
        <%
                }
        %>
            <tr>
                <td><%= b.title %></td>
                <td><%= b.author %></td>
                <td class="nowrap"><%= b.year %></td>
                <td><%= b.note %></td>
            </tr>
        <%
            } // end for
        %>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" class="foot-note">
                    Total records: <%= books.size() %>
                </td>
            </tr>
        </tfoot>
    </table>
</section>

<footer>
    <p>CSD-430 - Module 2 - Scriptlets with external CSS</p>
</footer>
</body>
</html>
