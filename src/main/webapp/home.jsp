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
                height: 100%;
                position: fixed;
                background-image: url('img/back.jpg'); /* Add your background image path here */
                background-size: cover; /* Ensures the background image covers the entire container */
                background-position: center; /* Centers the background image */
                background-repeat: no-repeat; 
                color: #198754; /* Optional: sets text color to white for better contrast */
                text-align: center;
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
            h1{
                font-family: "Monotype Corsiva", cursive;
            }
            h3{
                font-family: "Monotype Corsiva", cursive;
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
                <a href="category.jsp">Category Management</a>
                <a href="product.jsp">Product Management</a>
                <a href="placeOrder.jsp">Place Order</a>
                <a href="changePassword.jsp">Change Password</a>
                <a href="index.jsp">Logout</a>
            </h5>
        </div>
        
        <div class="container">
            <br><br><br><br>
            <h1><b>Welcome to Our Website!</b></h1>
            <h1><b>ADIA Cafe & Restaurant Management System</b></h1>
            <br><br><br>
            <h3><b>Created By </b> <br>ATIGUI YASSINE <br> EL AMRI FATIMA EZZAHRA <br> BEN DAOUD IMANE </h3>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
