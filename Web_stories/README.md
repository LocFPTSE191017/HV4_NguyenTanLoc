# Web Stories - Ứng dụng đọc truyện

Ứng dụng này là một website đọc truyện nhỏ với frontend HTML/CSS/JavaScript thuần và backend Java Servlet + MySQL.

## Thành phần
- `WebContent/index.html` - trang chủ
- `WebContent/login.html` - trang đăng nhập
- `WebContent/register.html` - trang đăng ký
- `WebContent/styles.css` - kiểu dáng
- `WebContent/script.js` - logic frontend
- `src/com/example/webstories/DBConnection.java` - quản lý kết nối MySQL
- `src/com/example/webstories/LoginServlet.java` - xử lý đăng nhập
- `src/com/example/webstories/RegisterServlet.java` - xử lý đăng ký
- `src/com/example/webstories/StoryServlet.java` - trả danh sách và nội dung truyện
- `WEB-INF/web.xml` - cấu hình servlet
- `database.sql` - SQL tạo database, bảng, dữ liệu mẫu

## Cài đặt MySQL
1. Mở MySQL và chạy tệp `database.sql`.
2. Thông tin mặc định trong `DBConnection.java`:
   - URL: `jdbc:mysql://localhost:3306/web_stories?useSSL=false&serverTimezone=UTC`
   - User: `root`
   - Password: `password`
3. Nếu khác, chỉnh lại `DB_URL`, `DB_USER`, `DB_PASSWORD` trong `DBConnection.java`.

## Cách chạy trên Apache Tomcat
1. Sao chép thư mục này vào workspace của Eclipse hoặc IDE hỗ trợ Java Web.
2. Thêm MySQL Connector/J (`mysql-connector-java-8.x.x.jar`) vào:
   - `WEB-INF/lib` trong project, hoặc
   - thư mục `lib` của Tomcat.
3. Biên dịch project.
4. Deploy vào Tomcat.
5. Mở trình duyệt vào `http://localhost:8080/<context>/index.html`.
   - Nếu deploy với tên dự án là `Web_stories`, URL là `http://localhost:8080/Web_stories/index.html`.

## Lưu ý
- Người dùng phải `register` hoặc `login` trước khi xem nội dung truyện.
- `StoryServlet` trả danh sách tiêu đề khi không có `id`.
- Khi click tiêu đề, frontend sẽ gọi `StoryServlet?id=<storyId>`.

---

### Hướng dẫn nhanh
1. Chạy MySQL và tạo database với `database.sql`.
2. Biên dịch Java servlet.
3. Copy project vào Tomcat hoặc deploy từ IDE.
4. Mở `index.html`, đăng ký, đăng nhập và xem truyện.
