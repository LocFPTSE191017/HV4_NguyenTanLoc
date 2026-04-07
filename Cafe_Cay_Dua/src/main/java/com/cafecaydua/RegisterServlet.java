package com.cafecaydua;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import at.favre.lib.crypto.bcrypt.BCrypt;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            response.sendRedirect("Register.html?error=1");
            return;
        }

        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Hash password
        String hashedPassword = BCrypt.withDefaults().hashToString(12, password.toCharArray());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe_cay_dua?useSSL=false&serverTimezone=UTC", "root", "your_password_here");

            String sql = "INSERT INTO users (username, password, phone, address) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, hashedPassword);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            int rows = stmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("Login.html?success=1");
            } else {
                response.sendRedirect("Register.html?error=2");
            }

            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Register.html?error=3");
        }
    }
}