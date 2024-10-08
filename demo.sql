-- Tạo database 
CREATE DATABASE session14;
-- Lựa chọn database để thao tác 
USE session14;
-- Tạo bảng category 
CREATE TABLE category(
	id int primary key auto_increment,
    name varchar(100) NOT NULL unique,
    status tinyint(1) default 1
);
-- Tạo bảng product 
CREATE TABLE product(
	id int primary key auto_increment,
    name varchar(100) NOT NULL unique,
	price float check (price >0),
    sale_price float check (sale_price < price),
    image varchar(255),
    category_id int not null,
    foreign key(category_id) references category(id)
);
-- Tạo bảng account 
CREATE TABLE account(
	id int primary key auto_increment,
    email varchar(100) NOT NULL UNIQUE,
    password varchar(100) NOT NULL,
    full_name varchar(100)
);

-- Tạo bảng ơrder
CREATE TABLE  orders( 
id int primary key auto_increment,
id_account int,ship_address varchar(255),
phone varchar(11),status tinyint default 0 ,
created_at datetime DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_account) REFERENCES Account(id)
);

-- Tạo bảng order_detail 
CREATE TABLE order_detail(
id_order int ,
foreign key(id_order) references orders(id),
id_product int,foreign key(id_product) references product(id),
quantity int ,
check(quantity > 0),
price float NOT NULL,check(price > 0)
);

-- INSERT 5 bản ghi danh mục 
INSERT INTO category (name, status) VALUES ('Electronics', 1);
INSERT INTO category (name, status) VALUES ('Clothing', 1);
INSERT INTO category (name, status) VALUES ('Books', 1);
INSERT INTO category (name, status) VALUES ('Furniture', 1);
INSERT INTO category (name, status) VALUES ('Toys', 1);
SELECT * FROM category;
-- INSERT 5 bản ghi sản phẩm 
INSERT INTO product (name, price, sale_price, image, category_id) VALUES ('Smartphone', 699.99, 649.99, 'smartphone.jpg', 1);
INSERT INTO product (name, price, sale_price, image, category_id) VALUES ('T-shirt', 19.99, 14.99, 'tshirt.jpg', 2);
INSERT INTO product (name, price, sale_price, image, category_id) VALUES ('Novel', 9.99, 7.99, 'novel.jpg', 3);
INSERT INTO product (name, price, sale_price, image, category_id) VALUES ('Sofa', 499.99, 449.99, 'sofa.jpg', 4);
INSERT INTO product (name, price, sale_price, image, category_id) VALUES ('Action Figure', 29.99, 24.99, 'action_figure.jpg', 5);
-- INsert 5 bản ghi account 
INSERT INTO account (email, password, full_name) VALUES ('john.doe@example.com', 'password123', 'John Doe');
INSERT INTO account (email, password, full_name) VALUES ('jane.smith@example.com', 'password456', 'Jane Smith');
INSERT INTO account (email, password, full_name) VALUES ('alice.jones@example.com', 'password789', 'Alice Jones');
INSERT INTO account (email, password, full_name) VALUES ('bob.brown@example.com', 'password101', 'Bob Brown');
INSERT INTO account (email, password, full_name) VALUES ('carol.white@example.com', 'password202', 'Carol White');

-- INsert order 
INSERT INTO orders (id_account, ship_address, phone, status) VALUES (1, '123 Main St', '123-456-7890', 0);
INSERT INTO orders (id_account, ship_address, phone, status) VALUES (2, '456 Elm St', '987-654-3210', 1);
INSERT INTO orders (id_account, ship_address, phone, status) VALUES (3, '789 Oak St', '555-555-5555', 0);
INSERT INTO orders (id_account, ship_address, phone, status) VALUES (4, '101 Pine St', '111-222-3333', 1);
INSERT INTO orders (id_account, ship_address, phone, status) VALUES (5, '202 Maple St', '444-555-6666', 0);
-- Order detail 
INSERT INTO order_detail (id_order, id_product, quantity, price) VALUES (1, 1, 1, 649.99);
INSERT INTO order_detail (id_order, id_product, quantity, price) VALUES (2, 2, 2, 14.99);
INSERT INTO order_detail (id_order, id_product, quantity, price) VALUES (3, 3, 1, 7.99);
INSERT INTO order_detail (id_order, id_product, quantity, price) VALUES (4, 4, 1, 449.99);
INSERT INTO order_detail (id_order, id_product, quantity, price) VALUES (5, 5, 3, 24.99);

--
SELECT * FROM category;
SELECT * FROM product; 
-- lấy ra id,tên sản phẩm ,price,sale_price,image, tên danh mục 

SELECT 	product.id,product.name,product.price,product.sale_price,category.name AS category_name
FROM product 
JOIN category
ON product.category_id = category.id;

INSERT INTO product (name, price, sale_price, image, category_id) VALUES ('Smartphone 1', 699.99, 649.99, 'smartphone1.jpg', 1);

-- Hiển thị danh sách danh mục và số lượng của sản phẩm theo danh mục đó 
-- COUNT đếm() 
SELECT COUNT(*) FROM product;
SELECT category_id,COUNT(*) as total_product FROM product group by category_id;

INSERT INTO category (name, status) VALUES ('PC', 1);
SELECT * FROM category;
-- Hiển thị danh sách danh mục và số lượng của sản phẩm theo danh mục đó 
SELECT category.id,category.name,category.id,count(product.category_id) as total_product
FROM  product
RIGHT JOIN category
on category.id = product.category_id
group by category.id,category.name,category.id;

SELECT * FROM orders;

-- xem account có id = 1 mua sản phẩm nào 
select * FROM order_detail WHERE id_order = 1;

-- xem chi tiết đơn hàng có id = 1 và lấy ra id_order,productName,quantity,price,totalpirce 
SELECT order_detail.id_order,order_detail.quantity,order_detail.price, order_detail.price * order_detail.quantity as total_price, product.name as produt_name
FROM order_detail 
JOIN product;

-- == Lấy về danh sách đơn hàng , id đơn hàng, tên khách hàng, địa chỉ ship phone,status 

SELECT * FROM orders; 

SELECT orders.id,orders.phone,orders.ship_address,account.full_name as 'account_name'
FROM orders
JOIN account 
ON orders.id_account = account.id;

-- SELECT Kết Hợp mệnh đề where 

SELECT * FROM product;

-- where với toán tử > 
-- lấy ra danh sách sản phẩm có giá lớn hơn 20 
SELECT * FROM product WHERE price > 20;
-- Lấy ra các sản phẩm có category_id = 1 
SELECT * FROM product WHERE category_id = 1;
-- lấy ra sản phẩm có giá lớn hơn 19 và nhở hơn 100 
SELECT * FROM product WHERE price > 19 AND price < 100;
SELECT * FROM product WHERE price BETWEEN 19 AND 100;

-- Lấy Những sản phẩm có category_id = 1,2,3 ;
SELECT * FROM product WHERE category_id IN (1,2,3); 

-- Toán tử LIKE trong mệnh đề where 
-- Lấy ra những sản phẩm mà tên có chứa chữ t 
SELECT * FROM product WHERE name LIKE '%t%';

-- Lấy ra những sản phẩm mà tên có chứa chữ phone 
SELECT * FROM product WHERE name LIKE '%phone%';

-- Lấy ra những sản phẩm mà có tên bắt đầu bằng chữ s 
SELECT * FROM product WHERE name LIKE 's%';

-- Lấy ra những sản phẩm mà có tên bắt đầu bằng chữ e
SELECT * FROM product WHERE name LIKE '%e';

-- LIMIT 

-- lấy ra 3 sản phẩm đầu của bảng sản phẩm 
SELECT * FROM product LIMIT 3; 

-- LIMIT OFFSET 
-- phân trang mỗi trang thì có 2 sản phẩm 
-- Trang đầu 
-- Cách 1
SELECT * FROM product LIMIT 0,2;
-- Cách 2 
SELECT * FROM product LIMIT 2 OFFSET 0;
-- Trang 2 
SELECT * FROM product LIMIT 2 OFFSET 2;
-- Trang 3 
SELECT * FROM product limit 2 OFFSET 4;

-- ORDER BY 
SELECT * FROM product; 

-- Sắp xếp sản phẩm theo giá tăng dần 
SELECT * FROM product ORDER BY price ASC; 

-- sắp xếp sản phẩm theo giá khuyến mãi giảm dần
SELECT * FROM product ORDER BY sale_price DESC; 

SELECT * FROM orders;
SELECT * FROM order_detail;
-- Lấy về danh sách đơn hàng và tổng sản phẩm của đơn hàng đó 
SELECT orders.id,orders.id_account,orders.status,count(order_detail.id_order) as total_product 
FROM orders 
JOIN order_detail
ON orders.id = order_detail.id_order
GROUP BY orders.id,orders.id_account,orders.status
HAVING orders.status = 0;
