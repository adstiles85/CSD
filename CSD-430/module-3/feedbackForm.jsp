<%-- 
Name: Andy Stiles
Class: CSD-430 Server Side Development
Assignment: M3 - Working with JSP Forms
Date: 9/8/2025
File: feedbackForm.jsp
Explanation: Collects restaurant experience feedback with 3+ input types 
and 5+ fields, posts to feedbackResult.jsp for display.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Restaurant Feedback</title>
    <link rel="stylesheet" href="assets/styles.css" />
</head>
<body>
<header>
    <h1>Restaurant Feedback</h1>
    <p class="subtitle">Please tell us about your visit. Fields marked * are required.</p>
</header>

<section class="desc">
    <h2>Field descriptions</h2>
    <ul>
        <li><strong>Name*</strong> and <strong>Email*</strong>: Your contact info</li>
        <li><strong>Restaurant Name*</strong>: Where you dined</li>
        <li><strong>Visit Date*</strong> and <strong>Party Size*</strong>: When you visited and with how many</li>
        <li><strong>Meal Type*</strong>: Breakfast, Lunch, or Dinner</li>
        <li><strong>Food</strong> and <strong>Service Ratings*</strong>: 1 to 5</li>
        <li><strong>Recommend?</strong>: Would you come back</li>
        <li><strong>Comments</strong>: Anything else we should know</li>
    </ul>
</section>

<section class="form-wrap">
    <!-- Intention: HTML form posts to result JSP via POST -->
    <form action="feedbackResult.jsp" method="post" class="card">
        <!-- Intention: top grid fields -->
        <div class="grid">
            <label>Full Name*
                <input type="text" name="name" required />
            </label>

            <label>Email*
                <input type="email" name="email" required />
            </label>

            <label>Restaurant Name*
                <input type="text" name="restaurant" required />
            </label>

            <label>Visit Date*
                <input type="date" name="visitDate" required />
            </label>

            <label>Party Size*
                <input type="number" name="partySize" min="1" max="20" value="2" required />
            </label>

            <label>Meal Type*
                <select name="mealType" required>
                    <option value="">Select one</option>
                    <option>Breakfast</option>
                    <option>Lunch</option>
                    <option>Dinner</option>
                </select>
            </label>
        </div>

        <!-- Intention: ratings as radios, aligned with CSS -->
        <fieldset>
            <legend>Food Rating*</legend>
            <div class="radio-group">
                <label><input type="radio" name="foodRating" value="1" required /> 1</label>
                <label><input type="radio" name="foodRating" value="2" /> 2</label>
                <label><input type="radio" name="foodRating" value="3" /> 3</label>
                <label><input type="radio" name="foodRating" value="4" /> 4</label>
                <label><input type="radio" name="foodRating" value="5" /> 5</label>
            </div>
        </fieldset>

        <fieldset>
            <legend>Service Rating*</legend>
            <div class="radio-group">
                <label><input type="radio" name="serviceRating" value="1" required /> 1</label>
                <label><input type="radio" name="serviceRating" value="2" /> 2</label>
                <label><input type="radio" name="serviceRating" value="3" /> 3</label>
                <label><input type="radio" name="serviceRating" value="4" /> 4</label>
                <label><input type="radio" name="serviceRating" value="5" /> 5</label>
            </div>
        </fieldset>

        <!-- Intention: checkbox + comments -->
        <label class="inline">
            <input type="checkbox" name="recommend" value="yes" />
            I would recommend this restaurant to a friend
        </label>

        <label>Comments
            <textarea name="comments" rows="4" placeholder="Share details about your experience..."></textarea>
        </label>

        <!-- Intention: form actions -->
        <div class="actions">
            <button type="submit">Submit Feedback</button>
            <button type="reset" class="secondary">Reset</button>
        </div>
    </form>
</section>


<footer>
    <p>Andy Stiles - CSD-430 - Module 3 - JSP form posts to result JSP</p>
</footer>
</body>
</html>
