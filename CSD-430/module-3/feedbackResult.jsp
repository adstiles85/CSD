<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: M3 - Working with JSP Forms
Date: 9/8/2025
File: feedbackResult.jsp
Explanation: Receives POST from feedbackForm.jsp, reads parameters using 
scriptlets, and displays the submitted data in an HTML table.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%! 
    // Intention: escape HTML special characters for safe display
    private String esc(String s) {
        if (s == null) return "";
        return s.replace("&","&amp;")
                .replace("<","&lt;")
                .replace(">","&gt;")
                .replace("\"","&quot;")
                .replace("'","&#39;");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Feedback Submitted</title>
    <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
    <h1>Thank you for your feedback</h1>
    <p class="subtitle">Here is a copy of what you submitted.</p>
</header>

<%
    // Intention: read parameters from the request and normalize
    String name          = request.getParameter("name");
    String email         = request.getParameter("email");
    String restaurant    = request.getParameter("restaurant");
    String visitDate     = request.getParameter("visitDate");
    String partySize     = request.getParameter("partySize");
    String mealType      = request.getParameter("mealType");
    String foodRating    = request.getParameter("foodRating");
    String serviceRating = request.getParameter("serviceRating");
    String recommend     = request.getParameter("recommend");
    String comments      = request.getParameter("comments");
    recommend = (recommend != null && recommend.equals("yes")) ? "Yes" : "No";
%>

<section class="desc">
    <h2>Data description</h2>
    <p>This table echoes your submitted fields for confirmation. Ratings use a 1 to 5 scale where 5 is excellent.</p>
</section>

<section class="table-wrap">
    <h2>Your Submission</h2>
    <table>
        <tbody>
            <tr><th scope="row">Full Name</th><td><%= esc(name) %></td></tr>
            <tr><th scope="row">Email</th><td><%= esc(email) %></td></tr>
            <tr><th scope="row">Restaurant Name</th><td><%= esc(restaurant) %></td></tr>
            <tr><th scope="row">Visit Date</th><td><%= esc(visitDate) %></td></tr>
            <tr><th scope="row">Party Size</th><td><%= esc(partySize) %></td></tr>
            <tr><th scope="row">Meal Type</th><td><%= esc(mealType) %></td></tr>
            <tr><th scope="row">Food Rating</th><td><%= esc(foodRating) %> / 5</td></tr>
            <tr><th scope="row">Service Rating</th><td><%= esc(serviceRating) %> / 5</td></tr>
            <tr><th scope="row">Recommend</th><td><%= esc(recommend) %></td></tr>
            <tr><th scope="row">Comments</th><td><%= esc(comments) %></td></tr>
        </tbody>
        <tfoot>
            <tr><td colspan="2" class="foot-note">Submitted via feedbackForm.jsp</td></tr>
        </tfoot>
    </table>
</section>

<p class="actions">
    <a class="button" href="feedbackForm.jsp">Submit another response</a>
</p>


<footer>
    <p>Andy Stiles - CSD-430 - Module 3 - Scriptlets + HTML table</p>
</footer>
</body>
</html>
