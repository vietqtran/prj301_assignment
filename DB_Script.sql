IF EXISTS (SELECT name FROM sys.databases WHERE name = 'PRJ301_Assignment')
BEGIN
    USE [master];
    DROP DATABASE [PRJ301_Assignment];
END;

CREATE DATABASE [PRJ301_Assignment];

-- Sử dụng database PRJ301_Assignment
USE [PRJ301_Assignment];

-- Bảng User Role
CREATE TABLE [roles] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [userType] NVARCHAR(50) NOT NULL
);

-- Thêm dữ liệu vào bảng User Role
INSERT INTO [roles] ([userType])
VALUES ('Admin'), ('Manager'), ('Shipper'), ('Seller'), ('Customer');

-- Bảng User
CREATE TABLE [users] (
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [username] NVARCHAR(255) NOT NULL UNIQUE,
    [password] NVARCHAR(255) NOT NULL,
    [firstName] NVARCHAR(255),
    [lastName] NVARCHAR(255),
    [email] NVARCHAR(255) NOT NULL UNIQUE,
    [phone] NVARCHAR(255),
    [role] BIGINT NOT NULL REFERENCES roles(id),
    [avatar] NVARCHAR(255)
);

-- Bảng Address
CREATE TABLE [address] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [detail] NVARCHAR(255) NOT NULL,
    [town] NVARCHAR(255) NOT NULL,
    [district] NVARCHAR(255) NOT NULL,
    [city] NVARCHAR(255) NOT NULL
);

-- Bảng Colors
CREATE TABLE [colors] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(50) NOT NULL,
    [code] NVARCHAR(7) NOT NULL
);
insert into colors([name], [code]) 
values('Black', '#000000'), 
      ('White', '#FFFFFF'),
      ('Yellow', '#FFD23F'),
      ('Green Yellow', '#CCFF66'),
      ('Khaki', '#BCAA99'),
      ('Red', '#BF1A2F'),
      ('Eminence', '#783F8E'),
      ('Gray', '#C8C6D7'),
      ('Amaranth Pink', '#DD9AC2'),
      ('Light Green', '#94FBAB'),
      ('white', '#ffffff'),
      ('white', '#ffffff');

-- Bảng Categories
CREATE TABLE [categories] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [image] NVARCHAR(255) NOT NULL
);
insert into categories([name], [image]) values('test', 'test')

-- Bảng Shop Category
CREATE TABLE [shopCategories] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [image] NVARCHAR(255) NOT NULL
);
insert into shopCategories([name], [image]) values('test', 'test')

-- Bảng Shop
CREATE TABLE [shops] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [userId] BIGINT REFERENCES users(id) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [address] NVARCHAR(255) NOT NULL,
	[createDate] date default CAST(GETDATE() AS DATE) not null,
	[active] bit default 'TRUE' not null,
	[rate] float default 0 not null,
	[avatar] nvarchar(255) not null,
	[cover] nvarchar(255) not null
);

-- Bảng Shop Report
CREATE TABLE [shopReports] (
	[id] bigint primary key identity(1, 1) not null,
    [shopId] BIGINT REFERENCES shops(id) NOT NULL,
    [profit] FLOAT NOT NULL DEFAULT 0,
    [revenue] FLOAT NOT NULL DEFAULT 0,
    [expense] FLOAT NOT NULL DEFAULT 0,
    [amountOrders] BIGINT NOT NULL DEFAULT 0,
    [amountProducts] BIGINT NOT NULL DEFAULT 0
);

-- Bảng Product
CREATE TABLE [products] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [price] FLOAT NOT NULL,
    [salePrice] FLOAT,
    [description] NTEXT not null,
	[city] NVARCHAR(255) not null,
	[rate] float default 0 not null,
    [createDate] DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    [boughtQuantity] INT NOT NULL DEFAULT 0,
    [color] BIGINT REFERENCES colors(id) NOT NULL,
    [categoryId] BIGINT REFERENCES categories(id) NOT NULL,
    [shopCategoryId] BIGINT REFERENCES shopCategories(id) NOT NULL,
    [shopId] BIGINT REFERENCES shops(id) NOT NULL,
    [createBy] NVARCHAR(255),
    [deleteBy] NVARCHAR(255),
	[url] nvarchar(255) NOT NULL,
);

-- Bảng Product Image
CREATE TABLE [productImages] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [productId] BIGINT REFERENCES products(id) NOT NULL,
    [imageUrl] NVARCHAR(255) NOT NULL,
    [role] INT NOT NULL -- 1-main, 2-sub, ...detail
);

-- Bảng Sizes Product
CREATE TABLE [sizesProduct] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [inventory] INT NOT NULL DEFAULT 0,
	[name] NVARCHAR(255) not null,
    [productId] BIGINT REFERENCES products(id) NOT NULL
);

-- Bảng Voucher
CREATE TABLE [vouchers] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [priceCondition] FLOAT NOT NULL,
    [price] FLOAT NOT NULL DEFAULT 0,
    [percent] INT NOT NULL DEFAULT 0,
    [createBy] NVARCHAR(255),
    [deleteBy] NVARCHAR(255)
);

--
create table [shippers](
	[id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [username] NVARCHAR(255) NOT NULL UNIQUE,
    [password] NVARCHAR(255) NOT NULL,
    [firstName] NVARCHAR(255),
    [lastName] NVARCHAR(255),
    [email] NVARCHAR(255) NOT NULL UNIQUE,
    [phone] NVARCHAR(255),
    [role] BIGINT NOT NULL REFERENCES roles(id) default 3,
    [avatar] NVARCHAR(255),
	[shipCompany] NVARCHAR(255) not null
)
--
create table [shipCompany](
	[id] bigint primary key identity(1, 1) not null,
	[name] nvarchar(255) not null,
	[image] nvarchar(255) not null
)

-- Bảng Order
CREATE TABLE [orders] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [userId] BIGINT REFERENCES users(id) NOT NULL,
	[shopId] BIGINT references shops(id) not null,
	[shipperId] bigint references shippers(id),
    [totalPrice] FLOAT NOT NULL,
	[saleTotalPrice] FLOAT,
    [orderDate] DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
	[successDate] DATE,
    [phone] NVARCHAR(11) NOT NULL,
    [address] NVARCHAR(255) NOT NULL,
    [voucherId] BIGINT REFERENCES vouchers(id),
    [status] NVARCHAR(50) NOT NULL,
	[note] nvarchar(255),
	[deliveryChecking] nvarchar(255) not null
);

-- Bảng Order Product
CREATE TABLE [orderProducts] (
    [orderId] BIGINT REFERENCES orders(id) NOT NULL,
    [productId] BIGINT REFERENCES products(id) NOT NULL,
    [productPrice] FLOAT NOT NULL,
    [quantity] INT NOT NULL,
    [totalPrice] FLOAT NOT NULL,
    [salePrice] FLOAT,
    [imageUrl] NVARCHAR(255) NOT NULL
);

-- Bảng Cart
CREATE TABLE [carts] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [userId] BIGINT REFERENCES users(id) NOT NULL
);

-- Bảng Cart Product
CREATE TABLE [cartProducts] (
    [productId] BIGINT REFERENCES products(id) NOT NULL,
    [cartId] BIGINT REFERENCES carts(id) NOT NULL,
	[shopId] bigint references shops(id) not null,
    [quantity] INT NOT NULL,
    [price] FLOAT NOT NULL,
    [salePrice] FLOAT NOT NULL,
    [totalPrice] FLOAT NOT NULL
);

create table [rate](
	[id] bigint primary key identity(1, 1) not null,
	[userId] bigint references users(id) not null,
	[productId] bigint references products(id) not null,
	[star] int default 0 not null,
	[content] NTEXT not null,
	[date] date default getdate() not null
)





select * from users
select * from categories
select * from vouchers
select * from sizesProduct
select * from roles
select * from address
select * from colors
select * from shops
SELECT * FROM shopReports
select * from products
select * from productImages