CREATE DATABASE app_food
CREATE DATABASE IF NOT EXISTS app_food

-- Tạo bảng
CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE restaurant (
    res_id INT AUTO_INCREMENT PRIMARY KEY,
    res_name VARCHAR(255),
    image VARCHAR(255),
    `desc` VARCHAR(255)
);

CREATE TABLE food_type (
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(255)
);

CREATE TABLE Food (
    food_id INT AUTO_INCREMENT PRIMARY KEY,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    `desc` VARCHAR(255),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE sub_food (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(255),
    sub_price FLOAT,
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE `order` (
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(255),
    arr_sub_id VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE like_res (
    user_id INT,
    res_id INT,
    date_like DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE rate_res (
    user_id INT,
    res_id INT,
    amount INT,
    date_rate DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

-- Thêm dữ liệu vào bảng
--bảng user
INSERT INTO `user` (full_name, email, password) VALUES
('Nguyễn Văn A', 'nguyenvana@gmail.com', 'password123'),
('Trần Thị B', 'tranthib@gmail.com', '123456'),
('Lê Văn C', 'levanc@gmail.com', 'abcdef'),
('Trương Minh H', 'truongminhh@gmail.com', 'pass789'),
('Võ Thị I', 'vothiti@gmail.com', 'password321'),
('Nguyễn Minh J', 'nguyenminhj@gmail.com', 'abc123'),
('Nguyễn Minh E', 'nguyenminhe@gmail.com', '123')

-- bảng food_type
INSERT INTO food_type (type_id, type_name) VALUES
(1, 'Bánh mì'),
(2, 'Kem'),
(3, 'Trà sữa'),
(4, 'Hải sản'),
(5, 'Ăn nhẹ'),
(6, 'Món nước'),
(7, 'Sushi');

-- bảng food
INSERT INTO food (food_id, food_name, image, price, `desc`, type_id) VALUES
(1, 'Bánh mì kẹp', 'banh_mi_kep.jpg', 50000, 'Bánh mì kẹp thịt nướng thơm ngon', 1),
(2, 'Kem vani', 'kem_vani.jpg', 20000, 'Kem vani mát lạnh, ngọt ngào', 2),
(3, 'Trà sữa', 'tra_sua.jpg', 35000, 'Trà sữa ngọt dịu, topping đa dạng', 3),
(4, 'Tôm hấp', 'tom_hap.jpg', 80000, 'Tôm hấp tươi ngon, đậm vị', 4),
(5, 'Sushi cá hồi', 'sushi_ca_hoi.jpg', 120000, 'Sushi với cá hồi tươi ngon', 7),
(6, 'Phở bò', 'pho_bo.jpg', 40000, 'Phở bò thơm ngon, nước dùng đậm đà', 6),
(7, 'Gỏi cuốn', 'goi_cuon.jpg', 30000, 'Gỏi cuốn tươi ngon, ăn nhẹ và bổ dưỡng', 5)


--bảng restaurant
INSERT INTO restaurant (res_name, image, `desc`) VALUES
('Nhà hàng Đại Dương', 'dai_duong.jpg', 'Nhà hàng nổi tiếng với hải sản tươi ngon'),
('Nhà hàng Phố Xưa', 'pho_xua.jpg', 'Nhà hàng chuyên đồ ăn truyền thống, giá phải chăng'),
('Quán Lẩu Nóng', 'lau_nong.jpg', 'Quán lẩu với các món ăn gia đình ngon tuyệt'),
('Nhà hàng Sài Gòn Xưa', 'saigon_xua.jpg', 'Nhà hàng chuyên các món ăn miền Nam'),
('Quán Trà Sữa Tiên Hưởng', 'tra_sua_tien_huong.jpg', 'Quán trà sữa mới, đầy đủ hương vị'),
('Nhà hàng Thái Lan', 'thai_lan.jpg', 'Nhà hàng chuyên món ăn Thái Lan truyền thống'),
('Nhà hàng Châu Âu', 'chau_au.jpg', 'Nhà hàng cao cấp với ẩm thực Châu Âu đa dạng')

-- bảng order
INSERT INTO `order` (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 2, 'ORDER001', '1,2'),
(2, 3, 1, 'ORDER002', NULL),
(3, 4, 3, 'ORDER003', '3'),
(4, 5, 2, 'ORDER004', '5'),
(5, 6, 1, 'ORDER005', '6'),
(6, 7, 2, 'ORDER006', '7'),
(7, 2, 1, 'ORDER007', NULL)


-- bảng like_res
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2024-12-01 10:00:00'),
(2, 2, '2024-12-02 11:00:00'),
(3, 3, '2024-12-03 12:00:00'),
(4, 4, '2024-12-04 13:00:00'),
(5, 5, '2024-12-05 14:00:00'),
(6, 6, '2024-12-06 15:00:00'),
(7, 7, '2024-12-07 16:00:00');

INSERT INTO like_res (user_id, res_id, date_like)VALUES 
(1, 6, '2024-12-08 12:30:00'), 
(1, 7, '2024-12-08 13:00:00');


INSERT INTO like_res (user_id, res_id)
VALUES 
(1, 1), 
(1, 2), 
(1, 3), 
(1, 4), 
(1, 5);


-- bảng rate_res
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 4, '2024-12-01 15:00:00'),
(2, 2, 5, '2024-12-02 16:00:00'),
(3, 3, 3, '2024-12-03 17:00:00'),
(4, 4, 4, '2024-12-04 18:00:00'),
(5, 5, 5, '2024-12-05 19:00:00'),
(6, 6, 2, '2024-12-06 20:00:00'),
(7, 7, 3, '2024-12-07 21:00:00');

-- bảng sub_food
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Phô mai', 10000, 1),
('Xúc xích', 15000, 1),
('Trân châu', 5000, 3),
('Tôm chiên', 20000, 4),
('Cá hồi', 30000, 5),
('Bánh phồng tôm', 10000, 6),
('Tương ớt', 5000, 7);


-- Tìm 5 người đã like nhà hàng nhiều nhất
-- SELECT user_id, COUNT(*) AS like_count
-- FROM like_res
-- GROUP BY user_id
-- ORDER BY like_count DESC
-- LIMIT 5;

SELECT u.user_id, u.full_name, COUNT(lr.res_id) AS like_count
FROM like_res lr
JOIN user u ON lr.user_id = u.user_id
GROUP BY u.user_id
ORDER BY like_count DESC
LIMIT 5;



-- Tìm 2 nhà hàng có lượt like nhiều nhất
-- SELECT res_id, COUNT(*) AS like_count
-- FROM like_res
-- GROUP BY res_id
-- ORDER BY like_count DESC
-- LIMIT 2;

SELECT r.res_id, r.res_name, COUNT(lr.user_id) AS like_count
FROM like_res lr
JOIN restaurant r ON lr.res_id = r.res_id
GROUP BY r.res_id
ORDER BY like_count DESC
LIMIT 2;



-- Tìm người đã đặt hàng nhiều nhất
SELECT u.user_id, u.full_name, COUNT(o.food_id) AS order_count
FROM `order` o
JOIN user u ON o.user_id = u.user_id
GROUP BY u.user_id
ORDER BY order_count DESC
LIMIT 1;


-- Tìm người dùng không hoạt động trong hệ thống
SELECT u.user_id, u.full_name
FROM user u
LEFT JOIN like_res lr ON u.user_id = lr.user_id
LEFT JOIN `order` o ON u.user_id = o.user_id
WHERE lr.user_id IS NULL AND o.user_id IS NULL;



