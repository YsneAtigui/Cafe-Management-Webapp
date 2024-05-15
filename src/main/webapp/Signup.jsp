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
                padding-top: 50px;
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
        </style>
        
    </head>
    <body>
        <!-- Sidebar -->
    <div class="sidebar">
    	<h3 class="w3-padding-64"><b>ADIA<br>Cafe & Restaurant</b></h3>
        <br><br>
        <h5>
        <a href="home.jsp">Home</a>
        <a href="index.jsp">Login</a>
        <a href="#">Forget Password</a>
        </h5>
    </div>
        <div class="container">
            <!-- Sign Up Form -->
            <form class="form-signup" action="SignUp" method="post">
                <h2 class="mb-3">Sign Up</h2>

                <% if (request.getAttribute("Failed") != null) {%>
                <p style="color: red;"><%= request.getAttribute("Failed")%></p>
                <% } %>

                <% if (request.getAttribute("Success") != null) {%>
                <p style="color: green;"><%= request.getAttribute("Success")%></p>
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

