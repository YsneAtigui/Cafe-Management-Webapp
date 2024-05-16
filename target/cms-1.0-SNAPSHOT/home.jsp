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
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
            }
            .container {
                margin-left: 250px; /* Same width as the sidebar */
                padding: 20px;
            }
            a {
                color: #198754;
                text-decoration: none;
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
        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar">
            <img src="img\Logo.png" alt="Logo" style="width: 200px; height: auto;">
            <br><br><br>
            <h5>
                <a href="home.jsp">Home</a>
                <a href="category.jsp">Category management</a>
                <a href="product.jsp">Product management</a>
                <a href="placeOrder.jsp">Place Order</a>
                <a href="changePassword.jsp">Change Password</a>
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
