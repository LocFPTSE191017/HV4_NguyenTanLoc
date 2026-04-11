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
import jakarta.servlet.http.HttpSession;

/**
 * Servlet xử lý đăng nhập người dùng.
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null || email.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.html?error=Vui lòng nhập email và mật khẩu.");
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT id FROM users WHERE email = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        HttpSession session = request.getSession();
                        session.setAttribute("userEmail", email);
                        session.setAttribute("userId", rs.getInt("id"));
                        response.sendRedirect("index.html?message=Đăng nhập thành công.");
                    } else {
                        response.sendRedirect("login.html?error=Email hoặc mật khẩu không đúng.");
                    }
                }
            }
        } catch (SQLException e) {
            response.sendRedirect("login.html?error=Lỗi máy chủ. Vui lòng thử lại.");
        }
    }
}
