<%@ page import="java.sql.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.FileInputStream" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    boolean accountFound = false;

    // ----------------------------
    // Load db.properties from classpath
    // ----------------------------
    Properties props = new Properties();
    try (java.io.InputStream in =
            getClass().getClassLoader().getResourceAsStream("db.properties")) {

        if (in == null) {
            out.println("Config Error: db.properties not found in WEB-INF/classes");
            return;
        }

        props.load(in);

    } catch (Exception e) {
        out.println("Config Error: " + e.getMessage());
        return;
    }

    // Use the correct keys
    String url  = props.getProperty("db.url");
    String user = props.getProperty("db.user");
    String pass = props.getProperty("db.password");


    try {
        // ----------------------------------------------------
        // Load MySQL Driver (required in JSP under Tomcat 10/11)
        // ----------------------------------------------------
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT customer_id FROM Customer WHERE email = ? AND password = ?"
             )) {

            stmt.setString(1, email);
            stmt.setString(2, password);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    accountFound = true;
                }
            }
        }

    } catch (ClassNotFoundException e) {
        out.println("Database Driver Error: MySQL driver not found in WEB-INF/lib");
        return;
    } catch (SQLException e) {
        out.println("Database Error: " + e.getMessage());
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/MoffatCss.css">
    <title>Login Result</title>

    <% if (accountFound) { %>
    <script>
        setTimeout(function() {
            window.location.href = "index.jsp";
        }, 3000);
    </script>
    <% } %>

</head>

<body class = "login-verify-body">

    <header class="site-header">
        <div class="top-bar">
            <div class="logo-area">
                <a href="LandingPage.jsp">
                    <img src="images/logo2.png" alt="Moffat Bay Lodge &amp; Marina logo">
                </a>
            </div>
                <nav class="main-nav">
                <a href="LoginPage.jsp">Login</a>
                <a href="CreateAccount.jsp">Create an Account</a>
                <a href="ReservationsPage.jsp">Make Your Reservation</a>
                <a href="LookupPage.jsp">Reservation Look-Up</a>
                <a href="AttractionsPage.jsp">Attractions</a>
                <a href="AboutPage.jsp">About Us</a>
            </nav>
        </div>
    </header>
    
        <!-- accent strips -->
        <div class="white-strip"></div>
        <div class="peach-strip"></div>
    

    <div class="outer-box">
        <div class="inner-box">
            <% if (accountFound) { %>
                <div class="success">Login successful!</div>
            <% } else { %>
                <div class="error">Account not found. Please try again.</div>
            <% } %>
            
            <a class="return-login" href="LoginPage.jsp">Return to Login</a>
        
        </div>
    </div>


<footer>
    <div class="footer-wave"></div>

    <div class="footer-inner">
        <div class="footer-columns">

            <div class="footer-column">
                <h4>Moffat Bay Lodge</h4>
                    <p>
                        1234 Bay Lodge, Joviedsa Island WA<br>
                        1-800-000
                    </p>
                </div>

                <div class="footer-column">
                    <h4>Hours</h4>
                    <p>
                        Monday - Friday<br>
                        7:00 AM - 10:00 PM<br><br>
                        Saturday - Sunday<br>
                        9:00 AM - 4:00 PM
                    </p>
                </div>

                <div class="footer-column">
                    <h4>Connect</h4>
                    <p>
                        &copy; 2035 by San Juan Islands<br>
                        Follow Us
                    </p>
                    <div class="footer-icons">
                        <span>🌊</span>
                        <span>📘</span>
                        <span>📸</span>
                    </div>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>
