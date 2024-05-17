/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import dao.ProductDao;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Product;

public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category");
        ArrayList<Product> products = null;
        try {
            products = ProductDao.getAllRecordsByCategory(category);
        } catch (SQLException ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(new Gson().toJson(products));
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des valeurs
        String[] productNames = request.getParameterValues("nameCell");
        String[] prices = request.getParameterValues("priceCell");
        String[] quantities = request.getParameterValues("quantityCell");
        String[] totals = request.getParameterValues("totalCell");
        
        
        String customerName = request.getParameter("name");
        String customerEmail = request.getParameter("email");
        String customerMobile = request.getParameter("mobile");
        double sumTotal = 0.0;

        if (totals != null) {
            for (String total : totals) {
                sumTotal += Double.parseDouble(total);
            }
        }

        if (productNames != null && prices != null && quantities != null && totals != null) {

            Document doc = new Document();
            try {
                // Définition du chemin où enregistrer le fichier PDF
                String path = "D:\\";
                String billId = "Facture";
                PdfWriter.getInstance(doc, new FileOutputStream(path + billId + ".pdf"));
                doc.open();

                // Ajout des éléments au document PDF
                Paragraph cafeName = new Paragraph("                                                        ADIA CAFE & RESTAURANT\n");
                doc.add(cafeName);
                Paragraph starline = new Paragraph("****************************************************************************************************************");
                doc.add(starline);
                Paragraph p1 = new Paragraph("\tCostomer Name : " + customerName + "\nCostomer Tel : " + customerMobile + "\nTotal Paid : " + sumTotal);
                doc.add(p1);
                doc.add(starline);

                // Création du tableau pour les détails de la commande
                PdfPTable tb1 = new PdfPTable(4);
                tb1.addCell("Name");
                tb1.addCell("Price");
                tb1.addCell("Quantity");
                tb1.addCell("Total");
                // Ajout des données de la commande au tableau
                for (int i = 0; i < productNames.length; i++) {
                    String productName = productNames[i];
                    String price = prices[i];
                    String quantity = quantities[i];
                    String total = totals[i];

                    tb1.addCell(productName);
                    tb1.addCell(price);
                    tb1.addCell(quantity);
                    tb1.addCell(total);
                }
                doc.add(tb1);

                doc.add(starline);
                Paragraph msg = new Paragraph("Thank you, Please visit Again");

            } catch (DocumentException e) {
                e.printStackTrace();
            } finally {
                // Fermeture du document PDF
                doc.close();
            }

            // Redirection vers la page où afficher le lien vers la facture PDF
            // Envoi du fichier PDF dans la réponse HTTP
            String billId = "Facture";
            File file = new File("D:\\" + billId + ".pdf");
            FileInputStream fis = new FileInputStream(file);
            BufferedInputStream bis = new BufferedInputStream(fis);
            OutputStream os = response.getOutputStream();

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment;filename=" + billId + ".pdf");

            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = bis.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }

            os.flush();
            os.close();
            bis.close();
            fis.close();

        } else {
            System.out.println("No products found");
        }

        // Création du document PDF
    }
}
