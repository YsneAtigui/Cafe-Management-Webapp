/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author yassine
 */
@WebServlet(name = "ProductServlet", urlPatterns = {"/ProductServlet"})
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("delete")) {
            String productId = request.getParameter("id");

            // Vérifiez si l'ID de la catégorie est fourni
            if (productId != null && !productId.isEmpty()) {
                try {
                    ProductDao.delete(productId);
                    request.setAttribute("Success", "Category Deleted Successfully");
                    request.getRequestDispatcher("product.jsp").forward(request, response);

                } catch (NumberFormatException e) {
                    request.setAttribute("Failed", "Invalid product ID");
                    request.getRequestDispatcher("product.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("Failed", "Invalid product ID");
                request.getRequestDispatcher("product.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("save")) {
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            Product product = new Product();
            product.setName(name);
            product.setCategory(category);
            product.setPrice(price);

            ProductDao.save(product);
            
            request.setAttribute("Success", "Product Saved Successfully");
            request.getRequestDispatcher("product.jsp").forward(request, response);
            
        } else if (action != null && action.equals("update")) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            Product product = new Product();

            product.setId(productId);
            product.setName(name);
            product.setCategory(category);
            product.setPrice(price);

            ProductDao.update(product);
            request.setAttribute("Success", "Product Updated Successfully");
            request.getRequestDispatcher("product.jsp").forward(request, response);
            
        }
    }

}
