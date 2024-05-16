/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

/**
 *
 * @author yassine
 */
import dao.CategoryDao;
import model.Category;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CategoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("save")) {
            String categoryName = request.getParameter("name");
            Category category = new Category();
            category.setName(categoryName);
            CategoryDao.save(category);
            request.setAttribute("Success", "Category Saved Successfully");
            request.getRequestDispatcher("category.jsp").forward(request, response);
        }
        if (action != null && action.equals("update")) {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String categoryName = request.getParameter("name");
            Category category = new Category();
            category.setId(categoryId);
            category.setName(categoryName);
            CategoryDao.update(category);
            request.setAttribute("Success", "Category Updated Successfully");
            request.getRequestDispatcher("category.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("delete")) {
            String categoryId = request.getParameter("id");

            // Vérifiez si l'ID de la catégorie est fourni
            if (categoryId != null && !categoryId.isEmpty()) {
                try {
                    CategoryDao.delete(categoryId);

                    request.setAttribute("Success", "Category Deleted Successfully");
                    request.getRequestDispatcher("category.jsp").forward(request, response);
                    
                } catch (NumberFormatException e) {
                    // Gérer les erreurs de conversion d'ID
                    
                    request.setAttribute("Failed", "Invalid category ID");
                    request.getRequestDispatcher("category.jsp").forward(request, response);
                }
            } else {
            
                request.setAttribute("Failed", "Category ID is missing");
                request.getRequestDispatcher("category.jsp").forward(request, response);
            }
        }

    }

}
