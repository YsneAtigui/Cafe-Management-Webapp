<%-- 
    Document   : product
    Created on : May 14, 2024, 11:55:49 PM
    Author     : yassine
--%>

<%@page import="dao.CategoryDao"%>
<%@page import="model.Category"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Récupérer la liste des catégories depuis le DAO
    ArrayList<Product> list = ProductDao.getAllRecords();
    ArrayList<Category> listC = CategoryDao.getAllRecords();
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
                background-color: #007bff;
                color: #fff;
                cursor: pointer;
            }
            a {
                color: #007bff;
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
            #category {
                padding: 8px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 4px;
                width: 200px; /* Adjust width as needed */
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

            <h1>New Product</h1>


            <!-- Display form to add new category -->
            <form action="ProductServlet" method="post">    
                <!-- Hidden input field to store product ID for update -->
                <input type="hidden" id="productId" name="productId">

                Product Name: <input type="text" id="name" name="name" required>

                category :<select id="category" name="category" required>
                    <option value="">Select a category</option>
                    <c:forEach var="categoryObj" items="${listC}">
                        <% for (Category categoryObj : listC) {%>
                        <option value="<%= categoryObj.getName()%>"><%= categoryObj.getName()%></option>
                        <% }%>
                    </c:forEach>
                </select>

                Price: <input type="text" id="price" name="price" required>


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
                        <th>Category</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Parcourir la liste des catégories et afficher chaque entrée dans une ligne du tableau --%>
                <c:forEach var="productObj" items="${list}">
                    <% for (Product productObj : list) {%>
                    <tr>
                        <td><%= productObj.getId()%></td>
                        <td><%= productObj.getName()%></td>
                        <td><%= productObj.getCategory()%></td>
                        <td><%= productObj.getPrice()%></td>
                        <td>
                            <a href="#" onclick="populateName('<%= productObj.getId()%>', '<%= productObj.getName()%>', '<%= productObj.getPrice()%>', '<%= productObj.getCategory()%>')">Update</a>
                            <a href="ProductServlet?action=delete&id=<%= productObj.getId()%>">Delete</a>
                        </td>
                    </tr>

                    <% }%>
                </c:forEach>
                </tbody>
            </table>
            <script>
                function populateName(id, name, price, category) {
                    document.getElementById("productId").value = id;
                    document.getElementById("name").value = name;
                    document.getElementById("price").value = price;
                    document.getElementById("category").value = category;

                    document.getElementById("updateButton").style.display = "inline-block";
                }
            </script>
        </div>
    </body>
</html>
