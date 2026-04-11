-- Tạo database và bảng cho ứng dụng Web Stories
CREATE DATABASE IF NOT EXISTS web_stories CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE web_stories;

-- Bảng users lưu thông tin đăng nhập
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Bảng stories lưu truyện ngắn
CREATE TABLE IF NOT EXISTS stories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL
);

-- Dữ liệu mẫu cho stories
INSERT INTO stories (title, content) VALUES
('Ngọn đèn biển', 'Trong đêm mưa, ngọn đèn biển vẫn sáng hiu hắt, dẫn lối cho tàu thuyền về bến...'),
('Bức thư cũ', 'Một ngày nọ, Lâm tìm thấy bức thư của ông ngoại trong gác mái và cuộc đời của cậu thay đổi mãi mãi...'),
('Chiếc đồng hồ cát', 'Chiếc đồng hồ cát cổ im lặng trên bàn, nhưng mỗi giọt cát rơi xuống như một lời nhắc về thời gian...'),
('Quán cà phê trên phố nhỏ', 'Buổi sáng ở quán cà phê phố nhỏ luôn đầy chuyện kể và mùi cà phê ấm nồng...'),
('Mùa thu cuối cùng', 'Lá vàng rơi lả tả trên con đường cũ, bước chân ai chậm rãi qua những ký ức...');
