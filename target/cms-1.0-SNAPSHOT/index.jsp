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
            padding-top: 50px;
        }
        .form-login {
            max-width: 330px;
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
        <a href="Signup.jsp">Sign Up</a>
        <a href="#">Forget Password</a>
        </h5>
    </div>
    
    <div class="container">
        <%-- Check if user is logged in --%>
        <%
            String username = (String) session.getAttribute("username");
            if (username == null) {
        %>
        <!-- Login Form -->
        <form class="form-login" action="LoginServlet" method="post">
            <h2 class="mb-3">Login</h2>
            <% if(request.getAttribute("error") != null) { %>
                <p style="color: red;"><%= request.getAttribute("error") %></p>
            <% } %>
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    Invalid username or password!
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
        <% } else { %>
        <!-- Logout Form -->
        <form class="form-login" method="post" action="logout.jsp">
            <h2 class="mb-3">Welcome, <%= username %>!</h2>
            <button class="btn btn-primary" type="submit">Logout</button>
        </form>
        <% } %>
        
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
