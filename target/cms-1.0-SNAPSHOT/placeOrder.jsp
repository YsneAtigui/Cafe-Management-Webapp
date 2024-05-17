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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
            <h1>Place Order</h1>
            <% if (request.getAttribute("Failed") != null) {%>
                <div class="alert alert-danger" role="alert">
                    <%= request.getAttribute("Failed")%>
                </div>
                <% } %>

                <% if (request.getAttribute("Success") != null) {%>
                <div class="alert alert-success" role="alert">
                    <%= request.getAttribute("Success")%>
                </div>
                <% }%>
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
                        <button type="button" onclick="fetchProducts()">Search</button>
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
            <br><br>
            <div class="add-product-form">
                <h2>Add Product</h2>
                <br>
                <form id="addProductForm">
                    <label for="productName">Product Name:</label>&nbsp;&nbsp;
                    <input type="text" id="productName" name="productName" required>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label for="price">Price:</label>&nbsp;&nbsp;
                    <input type="number" id="price" name="price" min="0" step="0.01" required>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label for="totalPrice">Total Price:</label>&nbsp;&nbsp;
                    <input type="number" id="totalPrice" name="totalPrice" readonly>

                    <br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <label for="quantity">Quantity:</label>&nbsp;&nbsp;
                    <input type="number" id="quantity" name="quantity" min="1" required>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" onclick="calculateTotalPrice()">Calculate Total Price</button>
                    <br><br>
                    <button type="button" onclick="addProduct()">Add Product</button>
                </form>
            </div>
            <div class="product-table">
                <form id="generateBillForm" action="OrderServlet" method="post">
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

                    
                </form>

                <form id="combinedForm" action="OrderServlet" method="post" style="display:none;"></form>

                <button type="button" onclick="submitCombinedForm()">Generate Bill</button>

            </div>



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
                                addActionLink.textContent = "Add";
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
                var grandtotal = grandtotal + total;
                var tableBody = document.getElementById("productTableBody2");
                var newRow = tableBody.insertRow();

                var nameCell = newRow.insertCell();
                nameCell.textContent = productName;
                var nameInput = document.createElement("input");
                nameInput.type = "hidden";
                nameInput.name = "nameCell";
                nameInput.value = productName;
                nameCell.appendChild(nameInput);

                var priceCell = newRow.insertCell();
                priceCell.textContent = price.toFixed(2);
                var priceInput = document.createElement("input");
                priceInput.type = "hidden";
                priceInput.name = "priceCell";
                priceInput.value = price.toFixed(2);
                priceCell.appendChild(priceInput);

                var quantityCell = newRow.insertCell();
                quantityCell.textContent = quantity;
                var quantityInput = document.createElement("input");
                quantityInput.type = "hidden";
                quantityInput.name = "quantityCell";
                quantityInput.value = quantity;
                quantityCell.appendChild(quantityInput);

                var totalCell = newRow.insertCell();
                totalCell.textContent = total.toFixed(2);
                var totalInput = document.createElement("input");
                totalInput.type = "hidden";
                totalInput.name = "totalCell";
                totalInput.value = total.toFixed(2);
                totalCell.appendChild(totalInput);


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

            function submitCombinedForm() {
            // Get references to the forms
            var orderForm = document.getElementById('orderForm');
            var productForm = document.getElementById('generateBillForm');
            var combinedForm = document.getElementById('combinedForm');

            // Clear the combined form
            combinedForm.innerHTML = '';

            // Copy elements from orderForm to combinedForm
            Array.from(orderForm.elements).forEach(function(element) {
                if (element.name && element.value) {
                    var input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = element.name;
                    input.value = element.value;
                    combinedForm.appendChild(input);
                }
            });

            // Copy elements from productForm to combinedForm
            Array.from(productForm.elements).forEach(function(element) {
                if (element.name && element.value) {
                    var input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = element.name;
                    input.value = element.value;
                    combinedForm.appendChild(input);
                }
            });

            // Submit the combined form
            combinedForm.submit();
        }
        </script>
    </body>
</html>
