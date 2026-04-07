package com.cafecaydua;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("Login.html");
            return;
        }

        String[] productNames = request.getParameterValues("productName[]");
        String[] quantities = request.getParameterValues("quantity[]");
        String[] prices = request.getParameterValues("price[]");

        if (productNames == null || productNames.length == 0) {
            // Single item
            String productName = request.getParameter("productName");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));
            double total = quantity * price;

            // Insert single order
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO orders (user_id, product_name, quantity, price, total) VALUES (?, ?, ?, ?, ?)");
            stmt.setInt(1, userId);
            stmt.setString(2, productName);
            stmt.setInt(3, quantity);
            stmt.setDouble(4, price);
            stmt.setDouble(5, total);
            stmt.executeUpdate();
            stmt.close();
        } else {
            // Multiple items from cart
            for (int i = 0; i < productNames.length; i++) {
                String productName = productNames[i];
                int quantity = Integer.parseInt(quantities[i]);
                double price = Double.parseDouble(prices[i]);
                double total = quantity * price;

                PreparedStatement stmt = conn.prepareStatement("INSERT INTO orders (user_id, product_name, quantity, price, total) VALUES (?, ?, ?, ?, ?)");
                stmt.setInt(1, userId);
                stmt.setString(2, productName);
                stmt.setInt(3, quantity);
                stmt.setDouble(4, price);
                stmt.setDouble(5, total);
                stmt.executeUpdate();
                stmt.close();
            }
        }
    }
}