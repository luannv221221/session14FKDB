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