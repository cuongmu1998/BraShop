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
  ('FIT SMART','??o ng???c th??ng minh','banner1'),
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
  ('?????','#F21429'),
  ('??en','#1C1A1A'),
  ('Tr???ng','#E8DFDF'),
  ('H???ng','#E6468E'),
  ('N??u','#884343')

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
  ('Aqua leaf',1,1200000,0,'L???p ch??n ng???c d??i v???i ????? ???n ?????nh ??? m???t sau c???ng v???i h???a ti???t th??u tr??n b???u ??o v?? l???p ch??n ng???c gi??? ???????c ki???u d??ng m???m m???i n??? t??nh.','1.jpg',1,1,20,1),
  ('SEXY CUSHION DELICATE',2,1300000,0,'Ren co gi??n m???m m???i mang h???a ti???t hoa Morocco ??? m???t b??n v?? b???n l??ng v???i ren h???a ti???t v??? s?? ??? ???????ng vi??n h??? tr??? b??n d?????i.','2.jpg',2,2,30,1),
  ('FLORALE DAHLIA',3,1500000,0,'Th??ng tho??ng d??? ch???u, t???o v??ng ng???c tr??n ?????y v?? d??? d??ng ph???i v???i trang ph???c m???c ngo??i c??? r???ng.','3.jpg',3,3,40,1),
  ('FLORALE ROSE',4,1900000,0,'Ph???n d??y l??ng ph??a sau l?? ren hoa t???o n??n v??? ?????c tr??ng c???a s???n ph???m c???t cao l??m r?? d??ng ch??? U gi??p t??ng ????? bao ph??? v?? ???n ?????nh khi m???c.','4.jpg',4,4,10,1),
  ('FLORALE VIOLET',5,2100000,0,'Cho v??? n??? t??nh sang tr???ng v???i s??? nh??? nh??ng.','5.jpg',5,5,15,1),
  ('SIGNATURE LACE',6,1100000,0,'S??? d???ng French cup v???i m??t ?????m c?? th??? th??o r???i v?? t??ng th??m ????? che ph??? ??? m???t tr?????c.','6.jpg',1,6,20,1),
  ('MOROCCAN LEAF',7,1200000,0,'Nh???ng chi???c l?? Morocco truy???n c???m h???ng cho nh???ng h???a ti???t th??u h??nh l?? c??ng l?????i xuy??n th???u v?? ren tinh t??? v???i h??nh trang tr?? n???i ?????c ????o.','7.jpg',2,7,25,1),
  ('GO ALLROUND BRALETTE',1,1600000,0,'K???t h???p 2 l???p v???i m???m m???i gi??p gi??? ch???t ??o kh??ng b??? x?? d???ch v?? h??? tr??? n??ng t???t h??n, ki???u d??ng d??? m???c v?? co gi??n t???t.','8.jpg',3,8,20,1),
  ('SLOGGI EVERYDAY',2,1400000,0,'B???n d??y vai r??ng gi??p gi???m ??p l???c l??n vai v?? d??y vai kh??ng th??? th??o r???i gi??p n??ng ng???c v?? gi??? ch???t ??o kh??ng b??? x?? d???ch.','9.jpg',4,1,15,1),
  ('AQUA EXOTIC BANDEAU',3,1200000,0,'Chi???c ??o ng???c c???a Aqua Exotic Bandeau mang ?????n gi???i ph??p th???i trang ho??n h???o, n???u b???n c???n che khe ng???c.','10.jpg',5,2,30,1)

insert into orders(customer_id,status) values
  (1,0),
  (2,1),
  (3,2)

insert into customer(name,email,phone,username) values
  ('a','a@','0912','abc'),
  ('b','b@','0913','abcd'),
  ('c','c@','0914','abcde')

insert into product(name,category_id,price,sale_price,content,image,color_id,size_id,quantity,status) values
  ('Aqua leaf season 2',1,1200000,0,'L???p ch??n ng???c d??i v???i ????? ???n ?????nh ??? m???t sau c???ng v???i h???a ti???t th??u tr??n b???u ??o v?? l???p ch??n ng???c gi??? ???????c ki???u d??ng m???m m???i n??? t??nh.','21.jpg',1,1,20,1),
  ('SEXY CUSHION DELICATE SEASON 2',2,1300000,0,'Ren co gi??n m???m m???i mang h???a ti???t hoa Morocco ??? m???t b??n v?? b???n l??ng v???i ren h???a ti???t v??? s?? ??? ???????ng vi??n h??? tr??? b??n d?????i.','22.jpg',2,2,30,1),
  ('FLORALE DAHLIA SEASON 2',3,1500000,0,'Th??ng tho??ng d??? ch???u, t???o v??ng ng???c tr??n ?????y v?? d??? d??ng ph???i v???i trang ph???c m???c ngo??i c??? r???ng.','23.jpg',3,3,40,1),
  ('FLORALE ROSE SEASON 2',4,1900000,0,'Ph???n d??y l??ng ph??a sau l?? ren hoa t???o n??n v??? ?????c tr??ng c???a s???n ph???m c???t cao l??m r?? d??ng ch??? U gi??p t??ng ????? bao ph??? v?? ???n ?????nh khi m???c.','24.jpg',4,4,10,1),
  ('FLORALE VIOLET SEASON 2',5,2100000,0,'Cho v??? n??? t??nh sang tr???ng v???i s??? nh??? nh??ng.','25.jpg',5,5,15,1),
  ('SIGNATURE LACE SEASON 2',6,1100000,0,'S??? d???ng French cup v???i m??t ?????m c?? th??? th??o r???i v?? t??ng th??m ????? che ph??? ??? m???t tr?????c.','26.jpg',1,6,20,1),
  ('MOROCCAN LEAF SEASON 2',7,1200000,0,'Nh???ng chi???c l?? Morocco truy???n c???m h???ng cho nh???ng h???a ti???t th??u h??nh l?? c??ng l?????i xuy??n th???u v?? ren tinh t??? v???i h??nh trang tr?? n???i ?????c ????o.','27.jpg',2,7,25,1),
  ('GO ALLROUND BRALETTE SEASON 2',1,1600000,0,'K???t h???p 2 l???p v???i m???m m???i gi??p gi??? ch???t ??o kh??ng b??? x?? d???ch v?? h??? tr??? n??ng t???t h??n, ki???u d??ng d??? m???c v?? co gi??n t???t.','28.jpg',3,8,20,1),
  ('SLOGGI EVERYDAY SEASON 2',2,1400000,0,'B???n d??y vai r??ng gi??p gi???m ??p l???c l??n vai v?? d??y vai kh??ng th??? th??o r???i gi??p n??ng ng???c v?? gi??? ch???t ??o kh??ng b??? x?? d???ch.','29.jpg',4,1,15,1),
  ('AQUA EXOTIC BANDEAU SEASON 2',3,1200000,0,'Chi???c ??o ng???c c???a Aqua Exotic Bandeau mang ?????n gi???i ph??p th???i trang ho??n h???o, n???u b???n c???n che khe ng???c.','30.jpg',5,2,30,1)