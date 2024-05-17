<%-- 
    Document   : Signup
    Created on : May 14, 2024, 10:18:27?AM
    Author     : yassine
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="ISO-8859-1">
        <title>Sign Up</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .form-signup {
                max-width: 530px;
                padding: 15px;
                margin: auto;
            }
            .form-signup .form-control {
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
                <a href="index.jsp">Login</a>
                <a href="forgetPassword.jsp">Forget Password</a>
            </h5>
        </div>
        <div class="container">
            <!-- Sign Up Form -->
            
            <form class="form-signup" action="SignUp" method="post">
                <h1 class="mb-3" style="font-family: Monotype Corsiva"><b>Create an Account</b></h1>

                <% if (request.getAttribute("Failed") != null) {%>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("Failed")%>
                </div>
                <% } %>

                <% if (request.getAttribute("Success") != null) {%>
                <div class="alert alert-success" role="alert">
                    <%= request.getAttribute("Success")%>
                </div>
                <% }%>

                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" id="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="mobileNumber" class="form-label">Mobile Number</label>
                    <input type="text" id="mobileNumber" name="mobileNumber" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="securityQuestion" class="form-label">Security Question</label>
                    <input type="text" id="securityQuestion" name="securityQuestion" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="answer" class="form-label">Answer</label>
                    <input type="text" id="answer" name="answer" class="form-control" required>
                </div>
                <button class="btn btn-primary" type="submit" value="Sign Up">Sign Up</button>
                <a href="Login.jsp" class="btn btn-secondary">Login</a>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

