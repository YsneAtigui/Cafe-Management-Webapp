<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.CategoryDao" %>
<%@ page import="model.Category" %>
<%@ page import="dao.ProductDao" %>
<%@ page import="model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
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
    <h1>Place Order</h1>
    <div class="form-table-container">
        <div class="form-container">
            <form id="orderForm" action="OrderServlet" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
                
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="mobile">Mobile Number:</label>
                <input type="tel" id="mobile" name="mobile" required>
                
                <label for="category">Select Category:</label>
                <select id="category" name="category" required>
                    <option value="">Select a category</option>
                    <% ArrayList<Category> listC = CategoryDao.getAllRecords();
                       for (Category categoryObj : listC) { %>
                        <option value="<%= categoryObj.getName() %>"><%= categoryObj.getName() %></option>
                    <% } %>
                </select>
                
                <button type="button" onclick="fetchProducts()">Fetch Products</button>
            </form>
        </div>

        <div class="table-container">
            <h2>Products</h2>
            <table id="productTable">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Action</th>
                        
                    </tr>
                </thead>
                <tbody id="productTableBody">
                </tbody>
            </table>
        </div>
    </div>
        </div>
    <script>
        function fetchProducts() {
            var category = document.getElementById("category").value;
            if (category !== "") {
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "OrderServlet?category=" + encodeURIComponent(category), true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var products = JSON.parse(xhr.responseText);
                        var productTableBody = document.getElementById("productTableBody");
                        productTableBody.innerHTML = "";
                        products.forEach(function(product) {
                            var row = productTableBody.insertRow();
                            var nameCell = row.insertCell();
                            var priceCell = row.insertCell();
                            nameCell.textContent = product.name;
                            priceCell.textContent = product.price;
                            var actionCell = row.insertCell();
                            var addActionLink = document.createElement("a");
                                addActionLink.textContent = "ADD";
                                addActionLink.href = "OrderServlet?productId=" + product.id; // Assuming the servlet URL and parameter
                                actionCell.appendChild(addActionLink);
                        });
                    }
                };
                xhr.send();
            } else {
                alert("Please select a category.");
            }
        }
    </script>
</body>
</html>
