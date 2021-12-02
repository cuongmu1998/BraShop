CREATE DATABASE BraShop DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

-- danh muc san pham
CREATE TABLE IF NOT EXISTS category (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  status tinyint,
  created_at timestamp default current_timestamp(),
  updated_at date
);

-- size
CREATE TABLE IF NOT EXISTS size (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  created_at timestamp default current_timestamp(),
  updated_at date
);

-- mau sac
CREATE TABLE IF NOT EXISTS color (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  color_code VARCHAR(255),
  created_at timestamp default current_timestamp(),
  updated_at date
);

-- san pham
CREATE TABLE IF NOT EXISTS product (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  category_id INT,
  price float,
  sale_price float,
  content text,
  image VARCHAR(255),
  color_id INT,
  size_id INT,
  quantity INT,
  status tinyint,
  created_at timestamp default current_timestamp(),
  updated_at date,
  FOREIGN KEY (category_id) REFERENCES category (id),
  FOREIGN KEY (color_id) REFERENCES color (id),
  FOREIGN KEY (size_id) REFERENCES size (id)
);

-- admin
CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) not null,
  email VARCHAR(255) not null,
  password VARCHAR(255) not null,
  remember_token VARCHAR(255),
  created_at timestamp default current_timestamp(),
  updated_at date
);

-- khach hang
CREATE TABLE IF NOT EXISTS customer (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) not null,
  email VARCHAR(255) not null,
  adress VARCHAR(255) not null,
  phone VARCHAR(255) not null,
  password VARCHAR(255) not null,
  status tinyint,
  created_at timestamp default current_timestamp(),
  updated_at date
);

-- don hang
CREATE TABLE IF NOT EXISTS orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id int NOT NULL,
  customer_name VARCHAR(255),
  customer_email VARCHAR(255),
  customer_adress VARCHAR(255),
  customer_phone VARCHAR(255),
  amount float,
  status tinyint,
  created_at timestamp default current_timestamp(),
  updated_at date,
  FOREIGN KEY (customer_id) REFERENCES customer (id)
);

-- chi tiet don hang
CREATE TABLE IF NOT EXISTS orderdetail (
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  price_unit float NOT NULL,
  quantity INT NOT NULL,
  
  FOREIGN KEY (order_id) REFERENCES orders (id),
  FOREIGN KEY (product_id) REFERENCES product (id)
);

-- mail
CREATE TABLE IF NOT EXISTS mail (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name INT,
  email VARCHAR(255),
  content text,
  created_at timestamp default current_timestamp(),
  updated_at date
);

-- Banner
CREATE TABLE IF NOT EXISTS banner (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name INT not null,
  content text not null,
  image VARCHAR(255) not null,
  created_at timestamp default current_timestamp(),
  updated_at date
);

insert into banner(name,content,image) values
  ('FIT SMART','Áo ngực thông minh','banner1'),
  ('NEW STUFF','Coming soon','banner2'),
  ('SALE OFF','Season sale','banner3')

insert into category(name,status) values
  ('Wired bra',1),
  ('Non-wired bra',1),
  ('Push-up bra',1),
  ('Deep V',1),
  ('Padded bra',1),
  ('Bralette',1),
  ('Magic wire bra',1)

insert into color(name,color_code) values
  ('Đỏ','#F21429'),
  ('Đen','#1C1A1A'),
  ('Trắng','#E8DFDF'),
  ('Hồng','#E6468E'),
  ('Nâu','#884343')

insert into size(name,status) values
  ('One'),
  ('M'),
  ('L'),
  ('XL'),
  ('70'),
  ('75'),
  ('80'),
  ('85')

insert into product(name,category_id,price,sale_price,content,image,color_id,size_id,quantity,status) values
  ('Aqua leaf',1,1200000,0,'Lớp chân ngực dài với độ ổn định ở mặt sau cộng với họa tiết thêu trên bầu áo và lớp chân ngực giữ được kiểu dáng mềm mại nữ tính.','1.jpg',1,1,20,1),
  ('SEXY CUSHION DELICATE',2,1300000,0,'Ren co giãn mềm mại mang họa tiết hoa Morocco ở mặt bên và bản lưng với ren họa tiết vỏ sò ở đường viên hỗ trợ bên dưới.','2.jpg',2,2,30,1),
  ('FLORALE DAHLIA',3,1500000,0,'Thông thoáng dễ chịu, tạo vòng ngực tròn đầy và dễ dàng phối với trang phục mặc ngoài cổ rộng.','3.jpg',3,3,40,1),
  ('FLORALE ROSE',4,1900000,0,'Phần dây lưng phía sau là ren hoa tạo nên vẻ đặc trưng của sản phẩm cắt cao làm rõ dáng chữ U giúp tăng độ bao phủ và ổn định khi mặc.','4.jpg',4,4,10,1),
  ('FLORALE VIOLET',5,2100000,0,'Cho vẻ nữ tính sang trọng với sự nhẹ nhàng.','5.jpg',5,5,15,1),
  ('SIGNATURE LACE',6,1100000,0,'Sử dụng French cup với mút đệm có thể tháo rời và tăng thêm độ che phủ ở mặt trước.','6.jpg',1,6,20,1),
  ('MOROCCAN LEAF',7,1200000,0,'Những chiếc lá Morocco truyền cảm hứng cho những họa tiết thêu hình lá cùng lưới xuyên thấu và ren tinh tế với hình trang trí nổi độc đáo.','7.jpg',2,7,25,1),
  ('GO ALLROUND BRALETTE',1,1600000,0,'Kết hợp 2 lớp vải mềm mại giúp giữ chặt áo không bị xê dịch và hỗ trợ nâng tốt hơn, kiểu dáng dễ mặc và co giãn tốt.','8.jpg',3,8,20,1),
  ('SLOGGI EVERYDAY',2,1400000,0,'Bản dây vai rông giúp giảm áp lực lên vai và dây vai không thể tháo rời giúp nâng ngực và giữ chặt áo không bị xê dịch.','9.jpg',4,1,15,1),
  ('AQUA EXOTIC BANDEAU',3,1200000,0,'Chiếc áo ngực của Aqua Exotic Bandeau mang đến giải pháp thời trang hoàn hảo, nếu bạn cần che khe ngực.','10.jpg',5,2,30,1)

insert into orders(customer_id,status) values
  (1,0),
  (2,1),
  (3,2)

insert into customer(name,email,phone,username) values
  ('a','a@','0912','abc'),
  ('b','b@','0913','abcd'),
  ('c','c@','0914','abcde')

insert into product(name,category_id,price,sale_price,content,image,color_id,size_id,quantity,status) values
  ('Aqua leaf season 2',1,1200000,0,'Lớp chân ngực dài với độ ổn định ở mặt sau cộng với họa tiết thêu trên bầu áo và lớp chân ngực giữ được kiểu dáng mềm mại nữ tính.','21.jpg',1,1,20,1),
  ('SEXY CUSHION DELICATE SEASON 2',2,1300000,0,'Ren co giãn mềm mại mang họa tiết hoa Morocco ở mặt bên và bản lưng với ren họa tiết vỏ sò ở đường viên hỗ trợ bên dưới.','22.jpg',2,2,30,1),
  ('FLORALE DAHLIA SEASON 2',3,1500000,0,'Thông thoáng dễ chịu, tạo vòng ngực tròn đầy và dễ dàng phối với trang phục mặc ngoài cổ rộng.','23.jpg',3,3,40,1),
  ('FLORALE ROSE SEASON 2',4,1900000,0,'Phần dây lưng phía sau là ren hoa tạo nên vẻ đặc trưng của sản phẩm cắt cao làm rõ dáng chữ U giúp tăng độ bao phủ và ổn định khi mặc.','24.jpg',4,4,10,1),
  ('FLORALE VIOLET SEASON 2',5,2100000,0,'Cho vẻ nữ tính sang trọng với sự nhẹ nhàng.','25.jpg',5,5,15,1),
  ('SIGNATURE LACE SEASON 2',6,1100000,0,'Sử dụng French cup với mút đệm có thể tháo rời và tăng thêm độ che phủ ở mặt trước.','26.jpg',1,6,20,1),
  ('MOROCCAN LEAF SEASON 2',7,1200000,0,'Những chiếc lá Morocco truyền cảm hứng cho những họa tiết thêu hình lá cùng lưới xuyên thấu và ren tinh tế với hình trang trí nổi độc đáo.','27.jpg',2,7,25,1),
  ('GO ALLROUND BRALETTE SEASON 2',1,1600000,0,'Kết hợp 2 lớp vải mềm mại giúp giữ chặt áo không bị xê dịch và hỗ trợ nâng tốt hơn, kiểu dáng dễ mặc và co giãn tốt.','28.jpg',3,8,20,1),
  ('SLOGGI EVERYDAY SEASON 2',2,1400000,0,'Bản dây vai rông giúp giảm áp lực lên vai và dây vai không thể tháo rời giúp nâng ngực và giữ chặt áo không bị xê dịch.','29.jpg',4,1,15,1),
  ('AQUA EXOTIC BANDEAU SEASON 2',3,1200000,0,'Chiếc áo ngực của Aqua Exotic Bandeau mang đến giải pháp thời trang hoàn hảo, nếu bạn cần che khe ngực.','30.jpg',5,2,30,1)