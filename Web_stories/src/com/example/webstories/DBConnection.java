package com.example.webstories;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Lớp quản lý kết nối tới MySQL thông qua JDBC.
 */
public class DBConnection {

    // Chỉnh lại theo cấu hình MySQL của bạn
    private static final String DB_URL = "jdbc:mysql://localhost:3306/web_stories?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "password";

    /**
     * Mở kết nối tới database.
     * @return Connection object
     * @throws SQLException nếu kết nối thất bại
     */
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Không tìm thấy MySQL JDBC Driver", e);
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
}
