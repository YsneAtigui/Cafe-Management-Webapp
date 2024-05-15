<%-- 
    Document   : home
    Created on : May 13, 2024, 7:40:06?PM
    Author     : yassine
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="ISO-8859-1">
        <title>Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
                padding-top: 50px;
            }
            .container {
                margin-left: 250px; /* Same width as the sidebar */
                padding: 20px;
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
                <a href="#">Category management</a>
                <a href="#">Product management</a>
                <a href="#">Place Order</a>
                <a href="#">User Management</a>
                <a href="index.jsp">Logout</a>
            </h5>
        </div>

        <div class="container">
            <h2>Welcome to Our Website!</h2>
            <p>This is the main content area of your home page.</p>
            <p>You can add your slider here, along with other content.</p>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
