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
import model.User;

/**
 *
 * @author yassine
 */
public class ForgetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        User user = null;

        if (action != null && action.equals("search")) {
            String email = request.getParameter("email");

            try {
                user = UserDao.getSecurityQuestion(email);
                if (user != null) {
                    String securityQuestion = user.getSecurityQuestion();
                    request.setAttribute("securityQuestion", securityQuestion);
                    request.setAttribute("email", email);

                    request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
                } else {
                    request.setAttribute("Failed", "Email not found");
                    request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                request.setAttribute("Failed", "Email not found");
                request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
            }
        } else if (action != null && action.equals("save")) {

            String email = request.getParameter("email");
            String securityQuestion = request.getParameter("securityQuestion");
            String dbanswer = request.getParameter("answer");
            String newPassword = request.getParameter("newPassword");

            try {
                user = UserDao.getAnswer(email, securityQuestion);
                if (user != null) {
                    String answer = user.getAnswer();
                    if (answer.equals(dbanswer)) {
                        UserDao.update(email, newPassword);
                        request.setAttribute("Success", "You change Password Successfully");
                        request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
                    } else {
                        request.setAttribute("Failed", "Failed : Incorrect Answer");
                        request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("Failed", "Failed : Incorrect Answer");
                    request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                request.setAttribute("Failed", "Failed : Incorrect Answer");
                request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
            }

        }

    }

}
