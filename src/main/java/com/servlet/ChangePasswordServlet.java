/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yassine
 */
public class ChangePasswordServlet extends HttpServlet {

     @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the form
        String email = request.getParameter("email");
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        // Validate if new password matches confirm password
        if (!newPassword.equals(confirmPassword)) {
            // If passwords don't match, redirect back to the change password page with an error message
            request.setAttribute("Failed", "Failed : Passwords do not match");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            
        }else{
            try {
                UserDao.changePassword(email, currentPassword, newPassword);
                request.setAttribute("Success", "You change Password Successfully");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                
            } catch (SQLException ex) {
                request.setAttribute("Failed", "Failed : Incorrect Email");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            }
        }
        
     }

}
