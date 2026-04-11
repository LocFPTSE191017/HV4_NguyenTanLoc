package com.example.webstories;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet xử lý đăng ký người dùng mới.
 */
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("register.html?error=Vui lòng nhập email và mật khẩu.");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String checkSql = "SELECT id FROM users WHERE email = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                checkStmt.setString(1, email);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) {
                        response.sendRedirect("register.html?error=Email đã tồn tại. Vui lòng dùng email khác.");
                        return;
                    }
                }
            }

            String insertSql = "INSERT INTO users (email, password) VALUES (?, ?)";
            try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                insertStmt.setString(1, email);
                insertStmt.setString(2, password);
                insertStmt.executeUpdate();
            }

            response.sendRedirect("login.html?message=Đăng ký thành công. Vui lòng đăng nhập.");
        } catch (SQLException e) {
            response.sendRedirect("register.html?error=Lỗi máy chủ. Vui lòng thử lại.");
        }
    }
}
