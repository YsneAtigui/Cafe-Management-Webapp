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
            input{
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

            button {
                padding: 8px 16px;
                border-radius: 4px;
                border: none;
                background-color: #198754;
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
                <a href="category.jsp">Category management</a>
                <a href="product.jsp">Product management</a>
                <a href="placeOrder.jsp">Place Order</a>
                <a href="#">User Management</a>
                <a href="index.jsp">Logout</a>
            </h5>
        </div>

        <div class="container">
            <h1>Place Order</h1>
            <div class="form-table-container">
                <div class="form-container">
                    <form id="orderForm" action="OrderServlet" method="post">
                        <label for="name">Name:</label>&nbsp;&nbsp;
                        <input type="text" id="name" name="name" required>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="email">Email:</label>&nbsp;&nbsp;
                        <input type="email" id="email" name="email" required>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="mobile">Mobile Number:</label>&nbsp;&nbsp;
                        <input type="tel" id="mobile" name="mobile" required>
                        <br><br>
                        <label for="category">Select Category:</label>
                        <select id="category" name="category" required>
                            <option value="">Select a category</option>
                            <% ArrayList<Category> listC = CategoryDao.getAllRecords();
                                for (Category categoryObj : listC) {%>
                            <option value="<%= categoryObj.getName()%>"><%= categoryObj.getName()%></option>
                            <% }%>
                        </select>
                        &nbsp;&nbsp;&nbsp;&nbsp;
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
            <div class="add-product-form">
                <h2>Add Product</h2>
                <form id="addProductForm" action="AddProductServlet" method="post">
                    <label for="productName">Product Name:</label>
                    <input type="text" id="productName" name="productName" required>

                    <label for="price">Price:</label>&nbsp;&nbsp;
                    <input type="number" id="price" name="price" min="0" step="0.01" required>

                    <label for="quantity">Quantity:</label>&nbsp;&nbsp;
                    <input type="number" id="quantity" name="quantity" min="1" required>

                    <label for="totalPrice">Total Price:</label>&nbsp;&nbsp;
                    <input type="number" id="totalPrice" name="totalPrice" readonly>

                    <br><br>
                    <button type="button" onclick="calculateTotalPrice()">Calculate Total Price</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" onclick="addProduct()">Add Product</button>
                </form>
            </div>
            <div class="product-table">
                <h2>Products</h2>
                <table id="productTable">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody id="productTableBody2">
                    </tbody>
                </table>
                
            </div>
                        <button onclick="postData()">Post Table Values</button>
        </div>
        <script>
            function fetchProducts() {
                var category = document.getElementById("category").value;
                if (category !== "") {
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "OrderServlet?category=" + encodeURIComponent(category), true);
                    xhr.setRequestHeader("Content-Type", "application/json");
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4 && xhr.status === 200) {
                            var products = JSON.parse(xhr.responseText);
                            var productTableBody = document.getElementById("productTableBody");
                            productTableBody.innerHTML = "";
                            products.forEach(function (product) {
                                var row = productTableBody.insertRow();
                                var nameCell = row.insertCell();
                                var priceCell = row.insertCell();
                                nameCell.textContent = product.name;
                                priceCell.textContent = product.price;
                                var actionCell = row.insertCell();
                                var addActionLink = document.createElement("a");
                                addActionLink.textContent = "ADD";
                                addActionLink.href = "#"; // Set href to "#" for JavaScript click event
                                addActionLink.onclick = function () {
                                    // Populate input fields with product name and price
                                    document.getElementById("productName").value = product.name;
                                    document.getElementById("price").value = product.price;
                                };
                                actionCell.appendChild(addActionLink);
                            });
                        }
                    };
                    xhr.send();
                } else {
                    alert("Please select a category.");
                }
            }

            function calculateTotalPrice() {
                var price = parseFloat(document.getElementById("price").value);
                var quantity = parseInt(document.getElementById("quantity").value);

                if (!isNaN(price) && !isNaN(quantity)) {
                    var totalPrice = price * quantity;
                    document.getElementById("totalPrice").value = totalPrice.toFixed(2);
                } else {
                    alert("Please enter valid values for price and quantity.");
                }
            }


            function addProduct() {
                var productName = document.getElementById("productName").value;
                var price = parseFloat(document.getElementById("price").value);
                var quantity = parseInt(document.getElementById("quantity").value);

                if (productName.trim() === "" || isNaN(price) || isNaN(quantity)) {
                    alert("Please fill all fields with valid values.");
                    return;
                }

                var total = price * quantity;

                var tableBody = document.getElementById("productTableBody2");
                var newRow = tableBody.insertRow();

                var nameCell = newRow.insertCell();
                nameCell.textContent = productName;

                var priceCell = newRow.insertCell();
                priceCell.textContent = price.toFixed(2);

                var quantityCell = newRow.insertCell();
                quantityCell.textContent = quantity;

                var totalCell = newRow.insertCell();
                totalCell.textContent = total.toFixed(2);

                var deleteCell = newRow.insertCell();
                var deleteLink = document.createElement("a");
                deleteLink.textContent = "Delete";
                deleteLink.href = "#";
                deleteLink.onclick = function () {
                    var row = this.parentNode.parentNode;
                    tableBody.removeChild(row);
                };
                deleteCell.appendChild(deleteLink);
            }

        </script>
    </body>
</html>
