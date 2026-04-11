package com.example.webstories;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet trả dữ liệu truyện và kiểm tra phiên đăng nhập.
 */
public class StoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String storyId = request.getParameter("id");
        response.setContentType("application/json;charset=UTF-8");

        if (storyId == null || storyId.isEmpty()) {
            sendStoryList(response);
            return;
        }

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            try (PrintWriter writer = response.getWriter()) {
                writer.write("{\"error\": \"Bạn phải đăng nhập để xem truyện.\"}");
            }
            return;
        }

        sendStoryContent(response, storyId);
    }

    private void sendStoryList(HttpServletResponse response) throws IOException {
        String sql = "SELECT id, title FROM stories ORDER BY id";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            StringBuilder json = new StringBuilder();
            json.append("[");
            boolean first = true;
            while (rs.next()) {
                if (!first) {
                    json.append(",");
                }
                first = false;
                json.append("{");
                json.append("\"id\":").append(rs.getInt("id")).append(",");
                json.append("\"title\":\"").append(escapeJson(rs.getString("title"))).append("\"");
                json.append("}");
            }
            json.append("]");
            try (PrintWriter writer = response.getWriter()) {
                writer.write(json.toString());
            }
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            try (PrintWriter writer = response.getWriter()) {
                writer.write("{\"error\": \"Lỗi khi lấy danh sách truyện.\"}");
            }
        }
    }

    private void sendStoryContent(HttpServletResponse response, String storyId) throws IOException {
        String sql = "SELECT title, content FROM stories WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, Integer.parseInt(storyId));
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String title = escapeJson(rs.getString("title"));
                    String content = escapeJson(rs.getString("content"));
                    try (PrintWriter writer = response.getWriter()) {
                        writer.write("{\"id\":" + storyId + ",\"title\":\"" + title + "\",\"content\":\"" + content + "\"}");
                    }
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    try (PrintWriter writer = response.getWriter()) {
                        writer.write("{\"error\": \"Không tìm thấy truyện.\"}");
                    }
                }
            }
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            try (PrintWriter writer = response.getWriter()) {
                writer.write("{\"error\": \"ID truyện không hợp lệ.\"}");
            }
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            try (PrintWriter writer = response.getWriter()) {
                writer.write("{\"error\": \"Lỗi khi tải nội dung truyện.\"}");
            }
        }
    }

    private String escapeJson(String text) {
        if (text == null) {
            return "";
        }
        return text.replace("\\", "\\\\")
                   .replace("\"", "\\\"")
                   .replace("\n", "\\n")
                   .replace("\r", "\\r");
    }
}
