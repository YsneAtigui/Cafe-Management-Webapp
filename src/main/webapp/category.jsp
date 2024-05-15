<%-- 
    Document   : category
    Created on : May 14, 2024, 8:04:52 PM
    Author     : yassine
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDao"%>
<%@page import="model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Récupérer la liste des catégories depuis le DAO
    ArrayList<Category> list = CategoryDao.getAllRecords();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Manage Categories</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
            }
            h1, h2 {
                color: #333;
            }
            form {
                margin-bottom: 70px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            input[type="text"] {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }
            input[type="submit"] {
                padding: 8px 16px;
                border-radius: 4px;
                border: none;
                background-color: #198754;
                color: #fff;
                cursor: pointer;
            }
            a {
                color: #198754;
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
            .container {
                margin-left: 250px; /* Same width as the sidebar */
                padding: 70px;
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
                <a href="category.jsp">Category management</a>
                <a href="product.jsp">Product management</a>
                <a href="placeOrder.jsp">Place Order</a>
                <a href="#">User Management</a>
                <a href="index.jsp">Logout</a>
            </h5>
        </div>

        <div class="container">

            <h1>Manage Categories</h1>
            <!-- Display form to add new category -->
            <form action="Category" method="post">
                
                <!-- Hidden input field to store product ID for update -->
                <input type="hidden" id="categoryId" name="categoryId">
                
                Category Name: <input type="text" name="name" id="categoryName">
                <input type="submit" name="action" value="save">
                <input type="submit" name="action" value="update" id="updateButton" style="display: none;">
            </form>

            <!-- Display existing categories -->
            <h2>Existing Categories</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Parcourir la liste des catégories et afficher chaque entrée dans une ligne du tableau --%>
                <c:forEach var="categoryObj" items="${list}">
                    <% for (Category categoryObj : list) {%>
                    <tr>
                        <td><%= categoryObj.getId()%></td>
                        <td><%= categoryObj.getName()%></td>
                        <td>
                            <a href="#" onclick="populateName('<%= categoryObj.getId()%>', '<%= categoryObj.getName()%>')">Update</a>
                            <a href="Category?action=delete&id=<%= categoryObj.getId()%>">Delete</a>
                        </td>
                    </tr>

                    <% }%>
                </c:forEach>
                </tbody>
            </table>
            <script>
                function populateName(id,name) {
                    document.getElementById("categoryName").value = name;
                    document.getElementById("categoryId").value = id;
                    document.getElementById("updateButton").style.display = "inline-block";
                }
            </script>
        </div>
    </body>
</html>

