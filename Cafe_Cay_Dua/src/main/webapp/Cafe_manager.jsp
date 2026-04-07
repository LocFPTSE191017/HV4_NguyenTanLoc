<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cafe Cây Dừa - Trang Chủ</title>
    <link rel="stylesheet" href="Style.css">
    <style>
        .profile-section {
            padding: 60px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .profile-card {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }
        .profile-card h2 {
            color: #8B4513;
            margin-top: 0;
        }
        .profile-card p {
            margin: 10px 0;
            font-size: 1.05em;
        }
        .profile-card form {
            margin-top: 20px;
        }
        .profile-card label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        .profile-card input, .profile-card textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
            box-sizing: border-box;
        }
        .profile-card textarea {
            min-height: 90px;
        }
        .profile-card button {
            margin-top: 15px;
            background-color: #8B4513;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1em;
        }
        .profile-card button:hover {
            background-color: #A0522D;
        }
        .orders-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .orders-table th, .orders-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        .orders-table th {
            background-color: #f7f3ef;
        }
        .message {
            margin: 15px 0;
            font-weight: bold;
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
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cafe_cay_dua?useSSL=false&serverTimezone=UTC", "root", "your_password_here")) {
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
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    String update = request.getParameter("update");
    String error = request.getParameter("error");
%>
    <header>
        <img src="logo.svg" alt="Logo Cafe Cây Dừa" style="width: 80px; height: 80px; margin-bottom: 10px;">
        <h1>Cafe Cây Dừa</h1>
        <p>Nơi hội tụ hương vị cà phê tinh tế</p>
    </header>
    <nav>
        <ul>
            <li><a href="#home">Trang Chủ</a></li>
            <li><a href="#menu">Menu</a></li>
            <li><a href="#profile">Profile</a></li>
            <li><a href="#about">Về Chúng Tôi</a></li>
            <li><a href="#contact">Liên Hệ</a></li>
        </ul>
    </nav>
    <section id="home" class="hero">
        <div>
            <h1>Chào Mừng Đến Với Cafe Cây Dừa</h1>
            <p>Trải nghiệm cà phê nguyên chất, không gian ấm cúng</p>
        </div>
    </section>
    <section id="about" class="about">
        <h2>Về Chúng Tôi</h2>
        <p>Cafe Cây Dừa là nơi mang đến cho bạn những ly cà phê ngon nhất, được pha chế từ những hạt cà phê chọn lọc. Chúng tôi cam kết chất lượng và dịch vụ tốt nhất.</p>
    </section>
    <section id="menu" class="menu">
        <h2>Menu Đặc Biệt</h2>
        <div class="menu-grid">
            <div class="menu-item">
                <img src="https://images.unsplash.com/photo-1497935586351-b67a49e012bf?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" alt="Cà Phê Đen">
                <h3>Cà Phê Đen</h3>
                <p>Cà phê đen nguyên chất, đậm đà hương vị.</p>
                <p class="price">Giá: 25,000 VND</p>
                <button class="add-to-cart-btn" onclick="addToCart('Cà Phê Đen', 25000)">Thêm vào Giỏ</button>
            </div>
            <div class="menu-item">
                <img src="https://images.unsplash.com/photo-1559496417-e7f25cb247f3?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" alt="Cà Phê Sữa">
                <h3>Cà Phê Sữa</h3>
                <p>Kết hợp hoàn hảo giữa cà phê và sữa tươi.</p>
                <p class="price">Giá: 30,000 VND</p>
                <button class="add-to-cart-btn" onclick="addToCart('Cà Phê Sữa', 30000)">Thêm vào Giỏ</button>
            </div>
            <div class="menu-item">
                <img src="https://images.unsplash.com/photo-1578662996442-48f60103fc96?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" alt="Cappuccino">
                <h3>Cappuccino</h3>
                <p>Cà phê Ý với lớp foam kem mịn.</p>
                <p class="price">Giá: 35,000 VND</p>
                <button class="add-to-cart-btn" onclick="addToCart('Cappuccino', 35000)">Thêm vào Giỏ</button>
            </div>
            <div class="menu-item">
                <img src="https://images.unsplash.com/photo-1541167760496-1628856ab772?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" alt="Latte">
                <h3>Latte</h3>
                <p>Cà phê latte với sữa và syrup hương vị.</p>
                <p class="price">Giá: 40,000 VND</p>
                <button class="add-to-cart-btn" onclick="addToCart('Latte', 40000)">Thêm vào Giỏ</button>
            </div>
        </div>
    </section>
    <section id="profile" class="profile-section">
        <div class="profile-card">
            <h2>Thông Tin Tài Khoản</h2>
            <% if ("1".equals(update)) { %>
                <div class="message" style="color: green;">Cập nhật thành công.</div>
            <% } else if ("1".equals(error)) { %>
                <div class="message" style="color: red;">Lỗi cập nhật thông tin. Vui lòng thử lại.</div>
            <% } %>
            <p><strong>Tên tài khoản:</strong> <%= username %></p>
            <p><strong>Vai trò:</strong> <%= role %></p>
            <form action="updateProfile" method="post">
                <label>Số điện thoại</label>
                <input type="tel" name="phone" value="<%= phone %>" required>
                <label>Địa chỉ</label>
                <textarea name="address" required><%= address %></textarea>
                <button type="submit">Cập nhật</button>
            </form>
        </div>
        <div class="profile-card">
            <h2>Lịch Sử Mua Hàng</h2>
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
    </section>
    <section id="contact" class="contact">
        <h2>Liên Hệ</h2>
        <p>Địa chỉ: 65/1, Tam Phước, Châu Thành , Bến Tre</p>
        <p>Điện thoại: 0833995219</p>
        <p>Email: info@cafecaydua.com</p>
    </section>
    <footer>
        <p>&copy; 2023 Cafe Cây Dừa. Tất cả quyền được bảo lưu.</p>
    </footer>
    <div class="cart" id="cart" style="display: none;">
        <h3>Giỏ Hàng</h3>
        <div id="cart-items"></div>
        <div class="cart-total">Tổng: <span id="cart-total">0</span> VND</div>
        <button class="checkout-btn" onclick="checkout()">Thanh Toán</button>
    </div>
    <script>
        let cart = [];
        let cartVisible = false;

        function loadCartFromStorage() {
            const saved = localStorage.getItem('cafe_cart');
            if (saved) {
                try {
                    cart = JSON.parse(saved);
                } catch (e) {
                    cart = [];
                }
            }
            updateCart();
            if (cart.length > 0) {
                document.getElementById('cart').style.display = 'block';
                cartVisible = true;
            }
        }

        function saveCartToStorage() {
            localStorage.setItem('cafe_cart', JSON.stringify(cart));
        }

        function addToCart(productName, price) {
            const existing = cart.find(item => item.name === productName);
            if (existing) {
                existing.quantity++;
            } else {
                cart.push({ name: productName, price: price, quantity: 1 });
            }
            saveCartToStorage();
            updateCart();
            if (!cartVisible) {
                document.getElementById('cart').style.display = 'block';
                cartVisible = true;
            }
        }

        function updateCart() {
            const cartItems = document.getElementById('cart-items');
            const cartTotal = document.getElementById('cart-total');
            cartItems.innerHTML = '';
            let total = 0;
            if (cart.length === 0) {
                cartItems.innerHTML = '<p>Giỏ hàng trống.</p>';
                cartTotal.textContent = '0';
                document.getElementById('cart').style.display = 'none';
                cartVisible = false;
                return;
            }
            cart.forEach((item, index) => {
                total += item.price * item.quantity;
                cartItems.innerHTML += `
                    <div class="cart-item">
                        <span>${item.name} x${item.quantity}</span>
                        <button type="button" onclick="removeFromCart(${index})">X</button>
                    </div>
                `;
            });
            cartTotal.textContent = total.toLocaleString();
            document.getElementById('cart').style.display = 'block';
            cartVisible = true;
        }

        function removeFromCart(index) {
            cart.splice(index, 1);
            saveCartToStorage();
            updateCart();
        }

        function checkout() {
            if (cart.length === 0) {
                alert('Giỏ hàng trống!');
                return;
            }
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = 'order';
            cart.forEach(item => {
                const inputName = document.createElement('input');
                inputName.type = 'hidden';
                inputName.name = 'productName[]';
                inputName.value = item.name;
                form.appendChild(inputName);

                const inputQty = document.createElement('input');
                inputQty.type = 'hidden';
                inputQty.name = 'quantity[]';
                inputQty.value = item.quantity;
                form.appendChild(inputQty);

                const inputPrice = document.createElement('input');
                inputPrice.type = 'hidden';
                inputPrice.name = 'price[]';
                inputPrice.value = item.price;
                form.appendChild(inputPrice);
            });
            document.body.appendChild(form);
            form.submit();
        }

        loadCartFromStorage();
    </script>
</body>
</html>