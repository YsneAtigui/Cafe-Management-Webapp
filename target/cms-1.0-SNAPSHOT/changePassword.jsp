<%-- 
    Document   : changePassword
    Created on : May 16, 2024, 5:11:55 PM
    Author     : yassine
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Change Password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
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
        </style>

    </head>
    <body>
        <div class="sidebar">
            <h3 class="w3-padding-64"><b>ADIA<br>Cafe & Restaurant</b></h3>
            <br><br>
            <h5>
                <a href="home.jsp">Home</a>
                <a href="category.jsp">Category management</a>
                <a href="product.jsp">Product management</a>
                <a href="placeOrder.jsp">Place Order</a>
                <a href="#">User Management</a>
                <a href="index.jsp">Logout</a>
            </h5>
        </div>

        <div class="container">
            
            <form class="form-signup" action="ChangePasswordServlet" method="post">
                <h2 class="mb-3">Change Password</h2>
                <% if (request.getAttribute("Failed") != null) {%>
                <p style="color: red;"><%= request.getAttribute("Failed")%></p>
                <% } %>

                <% if (request.getAttribute("Success") != null) {%>
                <p style="color: green;"><%= request.getAttribute("Success")%></p>
                <% }%>
                <div class="mb-3">
                <label for="Email" class="form-label">Email:</label>
                <input type="text" id="email" name="email" class="form-control" required>
                </div>
                
                <div class="mb-3">
                <label for="currentPassword" class="form-label">Current Password:</label>
                <input type="password" id="currentPassword" name="currentPassword" class="form-control" required>
                </div>
                
                <div class="mb-3">
                <label for="newPassword" class="form-label">New Password:</label>
                <input type="password" id="newPassword" name="newPassword" class="form-control" required>
                </div>
                
                <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Change Password</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

