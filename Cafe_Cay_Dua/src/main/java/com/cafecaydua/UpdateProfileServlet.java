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

public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if (username == null) {
            response.sendRedirect("Login.html");
            return;
        }

        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe_cay_dua?useSSL=false&serverTimezone=UTC", "root", "your_password_here");

            String sql = "UPDATE users SET phone = ?, address = ? WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, phone);
            stmt.setString(2, address);
            stmt.setString(3, username);
            stmt.executeUpdate();

            stmt.close();
            conn.close();

            response.sendRedirect("Profile.html?update=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Profile.html?error=1");
        }
    }
}