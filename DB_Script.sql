USE [master];
DROP DATABASE [PRJ301_Assignment];

CREATE DATABASE [PRJ301_Assignment];

-- Sử dụng database PRJ301_Assignment
USE [PRJ301_Assignment];

-- Bảng User Role
CREATE TABLE [roles] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [userType] NVARCHAR(50) NOT NULL
);
INSERT INTO [roles] ([userType])
VALUES ('Admin'), ('Manager'), ('Shipper'), ('Seller'), ('Customer');

-- Bảng User
CREATE TABLE [users] (
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [username] NVARCHAR(255) NOT NULL UNIQUE,
    [password] NVARCHAR(255) NOT NULL,
    [name] NVARCHAR(255) default '',
    [email] NVARCHAR(255) NOT NULL UNIQUE,
    [phone] NVARCHAR(255) default '',
    [role] BIGINT NOT NULL ,
    [avatar] NVARCHAR(255) default '',
	[address] NVARCHAR(255) default ''
);
INSERT INTO [users] (
    [username],
    [password],
    [name],
    [email],
    [phone],
    [role],
    [avatar],
	[address]
) VALUES
    ('user1', 'password1', 'John Doe', 'user1@example.com', '1234567890', 1, 'avatar1.jpg', ''),
    ('user2', 'password2', 'Jane Smith', 'user2@example.com', '9876543210', 2, 'avatar2.jpg', ''),
    ('user3', 'password3', 'Mike Johnson', 'user3@example.com', '5555555555', 1, 'avatar3.jpg', ''),
    ('user4', 'password4', 'Alice Williams', 'user4@example.com', '6666666666', 2, 'avatar4.jpg', ''),
    ('user5', 'password5', 'David Brown', 'user5@example.com', '7777777777', 1, 'avatar5.jpg', ''),
    ('user6', 'password6', 'Emma Davis', 'user6@example.com', '8888888888', 2, 'avatar6.jpg', ''),
    ('user7', 'password7', 'Robert Miller', 'user7@example.com', '9999999999', 1, 'avatar7.jpg', ''),
    ('user8', 'password8', 'Sophia Wilson', 'user8@example.com', '1111111111', 2, 'avatar8.jpg', ''),
    ('user9', 'password9', 'Daniel Lee', 'user9@example.com', '2222222222', 1, 'avatar9.jpg', ''),
    ('user10', 'password10', 'Olivia Taylor', 'user10@example.com', '3333333333', 2, 'avatar10.jpg', '');

-- Bảng Address
CREATE TABLE [address] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [detail] NVARCHAR(255) NOT NULL,
    [town] NVARCHAR(255) NOT NULL,
    [district] NVARCHAR(255) NOT NULL,
    [city] NVARCHAR(255) NOT NULL
);
INSERT INTO [address] (
    [detail],
    [town],
    [district],
    [city]
) VALUES
    ('123 Main St', 'Town1', 'District1', 'City1'),
    ('456 Elm St', 'Town2', 'District2', 'City2'),
    ('789 Oak St', 'Town3', 'District3', 'City3'),
    ('101 Pine St', 'Town4', 'District4', 'City4'),
    ('202 Cedar St', 'Town5', 'District5', 'City5'),
    ('303 Maple St', 'Town6', 'District6', 'City6'),
    ('404 Birch St', 'Town7', 'District7', 'City7'),
    ('505 Willow St', 'Town8', 'District8', 'City8'),
    ('606 Redwood St', 'Town9', 'District9', 'City9'),
    ('707 Spruce St', 'Town10', 'District10', 'City10');

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
INSERT INTO [categories] (
    [name],
    [image]
) VALUES
    ('Category 1', 'image1.jpg'),
    ('Category 2', 'image2.jpg'),
    ('Category 3', 'image3.jpg'),
    ('Category 4', 'image4.jpg'),
    ('Category 5', 'image5.jpg'),
    ('Category 6', 'image6.jpg'),
    ('Category 7', 'image7.jpg'),
    ('Category 8', 'image8.jpg'),
    ('Category 9', 'image9.jpg'),
    ('Category 10', 'image10.jpg');

-- Bảng Shop Category
CREATE TABLE [shopCategories] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [image] NVARCHAR(255) NOT NULL
);
INSERT INTO [shopCategories] (
    [name],
    [image]
) VALUES
    ('Category 1', 'image1.jpg'),
    ('Category 2', 'image2.jpg'),
    ('Category 3', 'image3.jpg'),
    ('Category 4', 'image4.jpg'),
    ('Category 5', 'image5.jpg'),
    ('Category 6', 'image6.jpg'),
    ('Category 7', 'image7.jpg'),
    ('Category 8', 'image8.jpg'),
    ('Category 9', 'image9.jpg'),
    ('Category 10', 'image10.jpg');

-- Bảng Shop
CREATE TABLE shops (
    id BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    email NVARCHAR(255) NOT NULL,
    password NVARCHAR(255) NOT NULL,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    createDate DATE DEFAULT CAST(GETDATE() AS DATE) NOT NULL,
    active BIT DEFAULT 'TRUE' NOT NULL,
    avatar NVARCHAR(255) NOT NULL,
    cover NVARCHAR(255) NOT NULL
);

-- Insert 10 rows into the "shops" table
INSERT INTO shops (email, password, name, address, active, avatar, cover)
VALUES
    ('shop1@example.com', 'password1', 'Shop 1', '123 Main St', 'TRUE', 'avatar1.jpg', 'cover1.jpg'),
    ('shop2@example.com', 'password2', 'Shop 2', '456 Elm St', 'TRUE', 'avatar2.jpg', 'cover2.jpg'),
    ('shop3@example.com', 'password3', 'Shop 3', '789 Oak St', 'TRUE', 'avatar3.jpg', 'cover3.jpg'),
    ('shop4@example.com', 'password4', 'Shop 4', '101 Pine St', 'TRUE', 'avatar4.jpg', 'cover4.jpg'),
    ('shop5@example.com', 'password5', 'Shop 5', '222 Birch St', 'TRUE', 'avatar5.jpg', 'cover5.jpg'),
    ('shop6@example.com', 'password6', 'Shop 6', '333 Cedar St', 'TRUE', 'avatar6.jpg', 'cover6.jpg'),
    ('shop7@example.com', 'password7', 'Shop 7', '444 Maple St', 'TRUE', 'avatar7.jpg', 'cover7.jpg'),
    ('shop8@example.com', 'password8', 'Shop 8', '555 Redwood St', 'TRUE', 'avatar8.jpg', 'cover8.jpg'),
    ('shop9@example.com', 'password9', 'Shop 9', '666 Walnut St', 'TRUE', 'avatar9.jpg', 'cover9.jpg'),
    ('shop10@example.com', 'password10', 'Shop 10', '777 Pine St', 'TRUE', 'avatar10.jpg', 'cover10.jpg');

-- Bảng Shop Report
CREATE TABLE [shopReports] (
	[id] bigint primary key identity(1, 1) not null,
    [shopId] BIGINT NOT NULL,
    [profit] FLOAT NOT NULL DEFAULT 0,
    [revenue] FLOAT NOT NULL DEFAULT 0,
    [expense] FLOAT NOT NULL DEFAULT 0,
    [amountOrders] BIGINT NOT NULL DEFAULT 0,
    [amountProducts] BIGINT NOT NULL DEFAULT 0
);
INSERT INTO [shopReports] (
    [shopId],
    [profit],
    [revenue],
    [expense],
    [amountOrders],
    [amountProducts]
) VALUES
    (1, 500.0, 1000.0, 500.0, 20, 200),
    (2, 600.0, 1200.0, 600.0, 25, 220),
    (3, 450.0, 900.0, 450.0, 18, 180),
    (4, 700.0, 1400.0, 700.0, 30, 250),
    (5, 550.0, 1100.0, 550.0, 22, 210),
    (6, 800.0, 1600.0, 800.0, 35, 270),
    (7, 400.0, 800.0, 400.0, 16, 160),
    (8, 750.0, 1500.0, 750.0, 28, 240),
    (9, 600.0, 1200.0, 600.0, 24, 200),
    (10, 650.0, 1300.0, 650.0, 26, 230);

-- Bảng Product
CREATE TABLE [products] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(255) NOT NULL,
    [price] FLOAT NOT NULL,
    [salePrice] FLOAT,
    [description] NVARCHAR(MAX) not null,
	[city] NVARCHAR(255) not null,
	[rate] float default 0 not null,
    [createDate] DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
    [boughtQuantity] INT NOT NULL DEFAULT 0,
    [color] BIGINT NOT NULL,
    [categoryId] BIGINT NOT NULL,
    [shopCategoryId] BIGINT NOT NULL,
    [shopId] BIGINT NOT NULL,
    [createBy] NVARCHAR(255),
    [deleteBy] NVARCHAR(255),
	[url] nvarchar(255) NOT NULL,
);

DECLARE @counter INT
SET @counter = 1

WHILE @counter <= 100
BEGIN
    INSERT INTO products (name, price, salePrice, description, city, rate, createDate, boughtQuantity, color, categoryId, shopCategoryId, shopId, createBy, deleteBy, url)
    VALUES (
        'Product ' + CAST(@counter AS NVARCHAR(10)), -- Product name
        ROUND(RAND() * 100 + 10, 2),                 -- Rounded price (random)
        ROUND(NULLIF(RAND() * 100 + 5, NULL), 2),    -- Rounded sale price (random, might be NULL)
        'Description for Product ' + CAST(@counter AS NVARCHAR(10)), -- Description
        'City ' + CAST(@counter AS NVARCHAR(10)),    -- City
        ROUND(RAND() * 5, 2),                        -- Rounded rate (random between 0 and 5)
        GETDATE(),                                   -- Create date (current date)
        0,                                           -- Bought quantity (set to 0)
        1,                                           -- Color ID (assuming it's 1)
        1,                                           -- Category ID (assuming it's 1)
        1,                                           -- Shop Category ID (assuming it's 1)
        1,                                           -- Shop ID (assuming it's 1)
        'Admin',                                     -- Created by
        NULL,                                        -- Deleted by (set to NULL)
        'https://placeholder.com/product' + CAST(@counter AS NVARCHAR(10)) + '.jpg' -- Image URL (placeholder)
    )

    SET @counter = @counter + 1
END

-- Bảng Product Image
CREATE TABLE [productImages] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [productId] BIGINT NOT NULL,
    [imageUrl] NVARCHAR(255) NOT NULL,
    [role] INT NOT NULL -- 1-main, 2-sub, ...detail
);
INSERT INTO [productImages] (
    [productId],
    [imageUrl],
    [role]
) VALUES
    (1, 'image1.jpg', 1),
    (1, 'image2.jpg', 2),
    (1, 'image3.jpg', 2),
    (2, 'image4.jpg', 1),
    (2, 'image5.jpg', 2),
    (3, 'image6.jpg', 1),
    (3, 'image7.jpg', 2),
    (4, 'image8.jpg', 1),
    (5, 'image9.jpg', 1),
    (5, 'image10.jpg', 2);

-- Bảng Sizes Product
CREATE TABLE [sizesProduct] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [inventory] INT NOT NULL DEFAULT 0,
	[name] NVARCHAR(255) not null,
    [productId] BIGINT NOT NULL
);
INSERT INTO [sizesProduct] (
    [inventory],
    [name],
    [productId]
) VALUES
    (50, 'Small', 1),
    (60, 'Medium', 1),
    (70, 'Large', 1),
    (40, 'Small', 2),
    (55, 'Medium', 2),
    (45, 'Small', 3),
    (65, 'Medium', 3),
    (75, 'Large', 3),
    (30, 'Small', 4),
    (70, 'Medium', 4);

-- Bảng Voucher
CREATE TABLE [vouchers] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [priceCondition] FLOAT NOT NULL,
    [price] FLOAT NOT NULL DEFAULT 0,
    [percent] INT NOT NULL DEFAULT 0,
    [createBy] NVARCHAR(255),
    [deleteBy] NVARCHAR(255)
);
INSERT INTO [vouchers] (
    [priceCondition],
    [price],
    [percent],
    [createBy],
    [deleteBy]
) VALUES
    (50.0, 10.0, 0, 'User1', NULL),
    (75.0, 15.0, 0, 'User2', NULL),
    (100.0, 20.0, 0, 'User3', NULL),
    (60.0, 0.0, 15, 'User4', NULL),
    (80.0, 0.0, 20, 'User5', NULL),
    (70.0, 14.0, 0, 'User6', NULL),
    (90.0, 0.0, 10, 'User7', NULL),
    (120.0, 30.0, 0, 'User8', NULL),
    (55.0, 11.0, 0, 'User9', NULL),
    (95.0, 0.0, 25, 'User10', NULL);

--
create table [shippers](
	[id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [username] NVARCHAR(255) NOT NULL UNIQUE,
    [password] NVARCHAR(255) NOT NULL,
    [firstName] NVARCHAR(255),
    [lastName] NVARCHAR(255),
    [email] NVARCHAR(255) NOT NULL UNIQUE,
    [phone] NVARCHAR(255),
    [role] BIGINT NOT NULL default 3,
    [avatar] NVARCHAR(255),
	[shipCompany] NVARCHAR(255) not null
);
INSERT INTO [shippers] (
    [username],
    [password],
    [firstName],
    [lastName],
    [email],
    [phone],
    [role],
    [avatar],
    [shipCompany]
) VALUES
    ('shipper1', 'password1', 'John', 'Doe', 'shipper1@example.com', '1234567890', 3, 'avatar1.jpg', 'Company A'),
    ('shipper2', 'password2', 'Jane', 'Smith', 'shipper2@example.com', '9876543210', 3, 'avatar2.jpg', 'Company B'),
    ('shipper3', 'password3', 'Mike', 'Johnson', 'shipper3@example.com', '5555555555', 3, 'avatar3.jpg', 'Company C'),
    ('shipper4', 'password4', 'Alice', 'Williams', 'shipper4@example.com', '6666666666', 3, 'avatar4.jpg', 'Company D'),
    ('shipper5', 'password5', 'David', 'Brown', 'shipper5@example.com', '7777777777', 3, 'avatar5.jpg', 'Company E'),
    ('shipper6', 'password6', 'Emma', 'Davis', 'shipper6@example.com', '8888888888', 3, 'avatar6.jpg', 'Company F'),
    ('shipper7', 'password7', 'Robert', 'Miller', 'shipper7@example.com', '9999999999', 3, 'avatar7.jpg', 'Company G'),
    ('shipper8', 'password8', 'Sophia', 'Wilson', 'shipper8@example.com', '1111111111', 3, 'avatar8.jpg', 'Company H'),
    ('shipper9', 'password9', 'Daniel', 'Lee', 'shipper9@example.com', '2222222222', 3, 'avatar9.jpg', 'Company I'),
    ('shipper10', 'password10', 'Olivia', 'Taylor', 'shipper10@example.com', '3333333333', 3, 'avatar10.jpg', 'Company J');

--
create table [shipCompany](
	[id] bigint primary key identity(1, 1) not null,
	[name] nvarchar(255) not null,
	[image] nvarchar(255) not null
);
INSERT INTO [shipCompany] (
    [name],
    [image]
) VALUES
    ('Company 1', 'image1.jpg'),
    ('Company 2', 'image2.jpg'),
    ('Company 3', 'image3.jpg'),
    ('Company 4', 'image4.jpg'),
    ('Company 5', 'image5.jpg'),
    ('Company 6', 'image6.jpg'),
    ('Company 7', 'image7.jpg'),
    ('Company 8', 'image8.jpg'),
    ('Company 9', 'image9.jpg'),
    ('Company 10', 'image10.jpg');

-- Bảng Order
CREATE TABLE [orders] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [userId] BIGINT NOT NULL,
	[shopId] BIGINT not null,
	[shipperId] bigint,
    [totalPrice] FLOAT NOT NULL,
	[saleTotalPrice] FLOAT,
    [orderDate] DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
	[successDate] DATE,
    [phone] NVARCHAR(11) NOT NULL,
    [address] NVARCHAR(255) NOT NULL,
    [voucherId] BIGINT,
    [status] NVARCHAR(50) NOT NULL,
	[note] nvarchar(255),
	[deliveryChecking] nvarchar(255) not null
);
INSERT INTO [orders] (
    [userId],
    [shopId],
    [shipperId],
    [totalPrice],
    [saleTotalPrice],
    [orderDate],
    [successDate],
    [phone],
    [address],
    [voucherId],
    [status],
    [note],
    [deliveryChecking]
) VALUES
    (1, 1, 1, 100.0, NULL, '2023-09-23', '2023-09-24', '1234567890', 'Address 1', NULL, 'Completed', 'Note 1', 'Checking 1'),
    (2, 2, 2, 120.0, NULL, '2023-09-23', '2023-09-24', '9876543210', 'Address 2', NULL, 'Completed', 'Note 2', 'Checking 2'),
    (3, 3, 3, 80.0, NULL, '2023-09-23', NULL, '5555555555', 'Address 3', NULL, 'In Progress', 'Note 3', 'Checking 3'),
    (4, 4, 4, 150.0, NULL, '2023-09-23', '2023-09-24', '6666666666', 'Address 4', NULL, 'Completed', 'Note 4', 'Checking 4'),
    (5, 5, 5, 90.0, NULL, '2023-09-23', NULL, '7777777777', 'Address 5', NULL, 'In Progress', 'Note 5', 'Checking 5'),
    (6, 6, 6, 110.0, NULL, '2023-09-23', '2023-09-24', '8888888888', 'Address 6', NULL, 'Completed', 'Note 6', 'Checking 6'),
    (7, 7, 7, 70.0, NULL, '2023-09-23', NULL, '9999999999', 'Address 7', NULL, 'In Progress', 'Note 7', 'Checking 7'),
    (8, 8, 8, 130.0, NULL, '2023-09-23', '2023-09-24', '1111111111', 'Address 8', NULL, 'Completed', 'Note 8', 'Checking 8'),
    (9, 9, 9, 95.0, NULL, '2023-09-23', '2023-09-24', '2222222222', 'Address 9', NULL, 'Completed', 'Note 9', 'Checking 9'),
    (10, 10, 10, 120.0, NULL, '2023-09-23', NULL, '3333333333', 'Address 10', NULL, 'In Progress', 'Note 10', 'Checking 10');

-- Bảng Order Product
CREATE TABLE [orderProducts] (
	[id] bigint primary key identity(1, 1) not null,
    [orderId] BIGINT NOT NULL,
    [productId] BIGINT NOT NULL,
    [productPrice] FLOAT NOT NULL,
    [quantity] INT NOT NULL,
    [totalPrice] FLOAT NOT NULL,
    [salePrice] FLOAT,
    [imageUrl] NVARCHAR(255) NOT NULL
);
INSERT INTO [orderProducts] (
    [orderId],
    [productId],
    [productPrice],
    [quantity],
    [totalPrice],
    [salePrice],
    [imageUrl]
) VALUES
    (1, 1, 29.99, 2, 59.98, NULL, 'product1.jpg'),
    (1, 2, 19.99, 3, 59.97, 15.99, 'product2.jpg'),
    (2, 3, 39.99, 1, 39.99, NULL, 'product3.jpg'),
    (2, 4, 49.99, 2, 99.98, NULL, 'product4.jpg'),
    (3, 5, 24.99, 4, 99.96, NULL, 'product5.jpg'),
    (4, 6, 34.99, 2, 69.98, NULL, 'product6.jpg'),
    (4, 7, 54.99, 1, 54.99, 44.99, 'product7.jpg'),
    (5, 8, 19.99, 3, 59.97, NULL, 'product8.jpg'),
    (5, 9, 29.99, 2, 59.98, NULL, 'product9.jpg'),
    (6, 10, 64.99, 1, 64.99, 54.99, 'product10.jpg');

-- Bảng Cart
CREATE TABLE [carts] (
    [id] BIGINT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    [userId] BIGINT NOT NULL
);
INSERT INTO [carts] ([userId])
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10);


-- Bảng Cart Product
CREATE TABLE [cartProducts] (
	[id] bigint primary key identity(1, 1) not null,
    [productId] BIGINT NOT NULL,
    [cartId] BIGINT NOT NULL,
	[shopId] bigint not null,
    [quantity] INT NOT NULL,
    [price] FLOAT NOT NULL,
    [salePrice] FLOAT,
    [totalPrice] FLOAT NOT NULL
);
INSERT INTO [cartProducts] (
    [productId],
    [cartId],
    [shopId],
    [quantity],
    [price],
    [salePrice],
    [totalPrice]
) VALUES
    (1, 1, 1, 2, 29.99, NULL, 59.98),
    (2, 1, 1, 3, 19.99, 15.99, 59.97),
    (3, 2, 2, 1, 39.99, NULL, 39.99),
    (4, 2, 2, 2, 49.99, NULL, 99.98),
    (5, 3, 3, 4, 24.99, NULL, 99.96),
    (6, 4, 4, 2, 34.99, NULL, 69.98),
    (7, 4, 4, 1, 54.99, 44.99, 54.99),
    (8, 5, 5, 3, 19.99, NULL, 59.97),
    (9, 5, 5, 2, 29.99, NULL, 59.98),
    (10, 6, 6, 1, 64.99, 54.99, 64.99);

create table [rates](
	[id] bigint primary key identity(1, 1) not null,
	[userId] bigint not null,
	[productId] bigint not null,
	[star] int default 0 not null,
	[content] NVARCHAR(MAX) not null,
	[date] date default getdate() not null
);
INSERT INTO [rates] (
    [userId],
    [productId],
    [star],
    [content],
    [date]
) VALUES
    (1, 1, 5, 'Great product!', '2023-09-23'),
    (1, 2, 4, 'Good service!', '2023-09-23'),
    (2, 3, 5, 'Excellent quality!', '2023-09-23'),
    (2, 4, 3, 'Average product.', '2023-09-23'),
    (3, 5, 4, 'Fast delivery!', '2023-09-23'),
    (3, 6, 5, 'Very satisfied!', '2023-09-23'),
    (4, 7, 2, 'Not as expected.', '2023-09-23'),
    (4, 8, 4, 'Decent price.', '2023-09-23'),
    (5, 9, 5, 'Top-notch!', '2023-09-23'),
    (5, 10, 3, 'Could be better.', '2023-09-23'),
    (6, 1, 4, 'Impressive!', '2023-09-23'),
    (6, 2, 5, 'Highly recommended!', '2023-09-23'),
    (7, 3, 3, 'Fair service.', '2023-09-23'),
    (7, 4, 5, 'Outstanding!', '2023-09-23'),
    (8, 5, 4, 'Good value.', '2023-09-23'),
    (8, 6, 2, 'Not happy.', '2023-09-23'),
    (9, 7, 5, 'Worth it!', '2023-09-23'),
    (9, 8, 4, 'Reasonable price.', '2023-09-23'),
    (10, 9, 5, 'Excellent product!', '2023-09-23'),
    (10, 10, 3, 'Could improve.', '2023-09-23');



CREATE TRIGGER trg_delete_user 
ON users
AFTER DELETE
AS
BEGIN
  DELETE FROM shops 
  WHERE userId IN (SELECT id FROM deleted)
END

select * from users
select * from categories
select * from vouchers
select * from sizesProduct
select * from roles
select * from address
select * from colors
select * from shops
SELECT * FROM shopReports
select * from products where rate = 5
select * from productImages
select * from shippers
select * from orders
select * from orderProducts
select * from shipCompany
select * from cartProducts
select * from carts
select * from rates

delete from users where id = 10