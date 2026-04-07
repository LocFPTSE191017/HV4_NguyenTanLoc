<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Cafe Cây Dừa</title>
    <link rel="stylesheet" href="Style.css">
    <style>
        .profile-container {
            max-width: 900px;
            margin: 80px auto;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .profile-container h2 {
            text-align: center;
            color: #8B4513;
        }
        .profile-block {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            align-items: start;
        }
        .profile-card, .history-card, .cart-card {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        .profile-card h3, .history-card h3, .cart-card h3 {
            margin-top: 0;
            color: #8B4513;
        }
        .profile-card p, .profile-card label {
            margin-bottom: 12px;
            font-size: 1em;
        }
        .profile-card input, .profile-card textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1em;
        }
        .profile-card textarea {
            resize: vertical;
            min-height: 80px;
        }
        .profile-card button {
            background-color: #8B4513;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px 20px;
            cursor: pointer;
            font-size: 1em;
        }
        .profile-card button:hover {
            background-color: #A0522D;
        }
        .orders-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        .orders-table th, .orders-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .orders-table th {
            background-color: #f7f3ef;
        }
        .cart-card ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .cart-card li {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }
        .cart-card li:last-child {
            border-bottom: none;
        }
        .cart-total {
            margin-top: 15px;
            font-weight: bold;
            text-align: right;
        }
        .cart-card .checkout-btn {
            width: 100%;
            margin-top: 15px;
            background-color: #8B4513;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px;
            cursor: pointer;
        }
        .cart-card .checkout-btn:hover {
            background-color: #A0522D;
        }
        .message {
            margin-top: 15px;
            font-weight: bold;
        }
        @media (max-width: 900px) {
            .profile-block {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("Login.html");
        return;
    }
    String role = "";
    String phone = "";
    String address = "";
    List<Map<String, Object>> orders = new ArrayList<>();
    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe_cay_dua?useSSL=false&serverTimezone=UTC", "root", "your_password_here")) {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (PreparedStatement stmt = conn.prepareStatement("SELECT role, phone, address FROM users WHERE username = ?")) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    role = rs.getString("role");
                    phone = rs.getString("phone") != null ? rs.getString("phone") : "";
                    address = rs.getString("address") != null ? rs.getString("address") : "";
                }
            }
        }
        try (PreparedStatement stmt = conn.prepareStatement("SELECT product_name, quantity, price, total, order_date FROM orders WHERE user_id = (SELECT id FROM users WHERE username = ?) ORDER BY order_date DESC")) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> order = new HashMap<>();
                    order.put("product_name", rs.getString("product_name"));
                    order.put("quantity", rs.getInt("quantity"));
                    order.put("price", rs.getDouble("price"));
                    order.put("total", rs.getDouble("total"));
                    order.put("order_date", rs.getTimestamp("order_date"));
                    orders.add(order);
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    String update = request.getParameter("update");
    String error = request.getParameter("error");
%>
    <div class="profile-container">
        <h2>Trang Profile</h2>
        <% if ("1".equals(update)) { %>
            <div class="message" style="color: green;">Cập nhật thông tin thành công.</div>
        <% } else if ("1".equals(error)) { %>
            <div class="message" style="color: red;">Lỗi cập nhật thông tin. Vui lòng thử lại.</div>
        <% } %>
        <div class="profile-block">
            <div class="profile-card">
                <h3>Thông Tin Cơ Bản</h3>
                <p><strong>Tên tài khoản:</strong> <%= username %></p>
                <p><strong>Vai trò:</strong> <%= role %></p>
                <form action="updateProfile" method="post">
                    <label>SĐT</label>
                    <input type="tel" name="phone" value="<%= phone %>" required>
                    <label>Địa chỉ</label>
                    <textarea name="address" required><%= address %></textarea>
                    <button type="submit">Lưu Thay Đổi</button>
                </form>
            </div>
            <div class="cart-card">
                <h3>Giỏ Hàng Hiện Tại</h3>
                <ul id="cart-list"></ul>
                <p class="cart-total">Tổng hiện tại: <span id="cart-sum">0</span> VND</p>
                <button class="checkout-btn" id="checkout-btn" type="button">Thanh Toán</button>
            </div>
        </div>
        <div class="history-card" style="margin-top: 30px;">
            <h3>Lịch Sử Mua Hàng</h3>
            <% if (orders.isEmpty()) { %>
                <p>Bạn chưa có đơn hàng nào.</p>
            <% } else { %>
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Tổng</th>
                            <th>Ngày đặt</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Map<String, Object> order : orders) { %>
                            <tr>
                                <td><%= order.get("product_name") %></td>
                                <td><%= order.get("quantity") %></td>
                                <td><%= order.get("price") %> VND</td>
                                <td><%= order.get("total") %> VND</td>
                                <td><%= order.get("order_date") %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>
        <p style="margin-top: 20px;"><a href="Cafe_manager.html">Quay lại Trang Chủ</a></p>
    </div>
    <script>
        function loadCart() {
            const cartData = localStorage.getItem('cart');
            const cartList = document.getElementById('cart-list');
            const cartSum = document.getElementById('cart-sum');
            const checkoutBtn = document.getElementById('checkout-btn');
            cartList.innerHTML = '';
            let total = 0;
            if (!cartData) {
                cartList.innerHTML = '<li>Giỏ hàng trống.</li>';
                checkoutBtn.disabled = true;
                checkoutBtn.style.opacity = '0.5';
                cartSum.textContent = '0';
                return;
            }
            const cart = JSON.parse(cartData);
            if (cart.length === 0) {
                cartList.innerHTML = '<li>Giỏ hàng trống.</li>';
                checkoutBtn.disabled = true;
                checkoutBtn.style.opacity = '0.5';
                cartSum.textContent = '0';
                return;
            }
            cart.forEach(item => {
                const subtotal = item.price * item.quantity;
                total += subtotal;
                const li = document.createElement('li');
                li.textContent = `${item.name} x${item.quantity} - ${subtotal.toLocaleString()} VND`;
                cartList.appendChild(li);
            });
            cartSum.textContent = total.toLocaleString();
            checkoutBtn.disabled = false;
            checkoutBtn.style.opacity = '1';
            checkoutBtn.onclick = function() {
                alert('Vui lòng thanh toán tại trang chủ hoặc chuyển giỏ hàng khi đặt hàng.');
            };
        }
        loadCart();
    </script>
</body>
</html>