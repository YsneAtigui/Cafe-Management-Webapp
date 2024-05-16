<%-- 
    Document   : forgetPassword
    Created on : May 16, 2024, 5:48:59 PM
    Author     : yassine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            <img src="img\Logo.png" alt="Logo" style="width: 200px; height: auto;">
            <br><br><br>
            <h5>
                <a href="home.jsp">Home</a>
                <a href="index.jsp">Login</a>
                <a href="forgetPassword.jsp">Forget Password</a>
            </h5>
        </div>

        <div class="container">

            <form class="form-signup" action="ForgetPasswordServlet" method="post">
                <h2 class="mb-3">Change Password</h2>
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
                <div class="mb-3">
                    <label for="Email" class="form-label">Email:</label>
                    <input type="text" id="email" name="email" class="form-control" required>
                    <br>
                    <input type="submit" class="btn btn-primary" name="action" value="search" id="searchButton">
                </div>
                
                
                <div class="mb-3">
                    <label for="securityQuestion" class="form-label">Security Question:</label>
                    <input type="text" id="securityQuestion" name="securityQuestion" class="form-control" >
                </div>

                <div class="mb-3">
                    <label for="answer" class="form-label">Answer:</label>
                    <input type="text" id="answer" name="answer" class="form-control" >
                </div>

                <div class="mb-3">
                    <label for="newPassword" class="form-label">New Password:</label>
                    <input type="password" id="newPassword" name="newPassword" class="form-control" >
                </div>
                <button type="submit" class="btn btn-primary" name="action" value="save">Change Password</button>
            </form>
        </div>
        <script>
            // Récupère la valeur de la question de sécurité stockée dans l'attribut de la requête
            var securityQuestion = '<%= request.getAttribute("securityQuestion")%>';
            var email ='<%= request.getAttribute("email")%>';
            // Vérifie si la question de sécurité n'est pas une chaîne vide
            if (securityQuestion !== "null" && email !== "null" ) {
                // Remplit la valeur de l'élément input avec la question de sécurité récupérée
                document.getElementById("securityQuestion").value = securityQuestion;
                document.getElementById("email").value=email;
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

