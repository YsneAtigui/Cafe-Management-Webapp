<%-- 
    Document   : index
    Created on : May 13, 2024, 6:14:58?PM
    Author     : yassine
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="ISO-8859-1">
        <title>Login and Logout Form</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                
            }
            .form-login {
                max-width: 430px;
                padding: 15px;
                margin: auto;
            }
            .form-login .form-control {
                position: relative;
                box-sizing: border-box;
                height: auto;
                padding: 10px;
                font-size: 16px;
            }
            .btn-primary{
                padding: 8px 16px;
                border-radius: 4px;
                border: none;
                background-color: #198754;
                color: #fff;
                cursor: pointer;
            }
            .btn-primary:hover{
                background-color: #198754;
            }
            .btn-link {
                color: #198754;
            }
            a:hover {
                text-decoration: underline;
            }
            /* Sidebar styles */
            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: #198754;
                padding-top: 50px;
                padding-left: 20px;
            }
            .sidebar a {
                padding: 10px 0;
                display: block;
                color: #fff;
                text-decoration: none;
            }
            .sidebar a:hover {
                background-color: #0d5031;
            }
            .w3-padding-64{
                color :white;
            }
            .container {
                margin-left: 250px; /* Same width as the sidebar */
                padding: 20px;
                height: 100%;
                position: fixed;
                background-image: url('img/back.jpg'); /* Add your background image path here */
                background-size: cover; /* Ensures the background image covers the entire container */
                background-position: center; /* Centers the background image */
                background-repeat: no-repeat; 
                color: #198754; /* Optional: sets text color to white for better contrast */
                text-align: center;
            }
        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar">
            <img src="img\Logo.png" alt="Logo" style="width: 200px; height: auto;">
            <br><br><br>
            <h5>
                <a href="home.jsp">Home</a>
                <a href="Signup.jsp">Sign Up</a>
                <a href="forgetPassword.jsp">Forget Password</a>
            </h5>
        </div>

        <div class="container">
            <br><br><br>
            <%-- Check if user is logged in --%>
            <%
                String username = (String) session.getAttribute("username");
                if (username == null) {
            %>
            <!-- Login Form -->
            <form class="form-login" action="LoginServlet" method="post">
                <h1 class="mb-3" style="font-family: Monotype Corsiva"><br>LOGIN<br></h1>
                
                <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("error")%>
                </div>
                <% } %>
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <!-- Forget Password Button -->
                <a href="forgetPassword.jsp" class="btn btn-link">Forget Password?</a>
                <br><br>

                <button class="btn btn-primary" type="submit" value="Login">Sign in</button>

                <!-- Sign Up Button -->
                <a href="Signup.jsp" class="btn btn-secondary">Sign Up</a>
            </form>
            <% } else {%>
            <!-- Logout Form -->
            <form class="form-login" method="post" action="logout.jsp">
                <h2 class="mb-3">Welcome, <%= username%>!</h2>
                <button class="btn btn-primary" type="submit">Logout</button>
            </form>
            <% }%>

        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
