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
VALUES ('Admin'), ('Manager'), ('Seller'), ('Customer');

-- Bảng User
CREATE TABLE [users] (
    [id] BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    [username] NVARCHAR(255) NOT NULL UNIQUE,
    [password] NVARCHAR(255) NOT NULL,
    [name] NVARCHAR(255) DEFAULT '',
    [email] NVARCHAR(255) NOT NULL UNIQUE,
    [phone] NVARCHAR(255) DEFAULT '',
    [role] BIGINT NOT NULL,
    [avatar] NVARCHAR(255) DEFAULT '',
    [address] NVARCHAR(255) DEFAULT ''
);

INSERT INTO [users] (username, password, name, email, phone, role, avatar, address) VALUES
    ('user1', 'password1', 'User One', 'user1@example.com', '123-456-7890', 1, 'avatar1.jpg', '123 Main St'),
    ('user2', 'password2', 'User Two', 'user2@example.com', '234-567-8901', 2, 'avatar2.jpg', '456 Elm St'),
    ('user3', 'password3', 'User Three', 'user3@example.com', '345-678-9012', 1, 'avatar3.jpg', '789 Oak St'),
    ('user4', 'password4', 'User Four', 'user4@example.com', '456-789-0123', 3, 'avatar4.jpg', '101 Pine St'),
    ('user5', 'password5', 'User Five', 'user5@example.com', '567-890-1234', 2, 'avatar5.jpg', '222 Birch St'),
    ('user6', 'password6', 'User Six', 'user6@example.com', '678-901-2345', 1, 'avatar6.jpg', '333 Cedar St'),
    ('user7', 'password7', 'User Seven', 'user7@example.com', '789-012-3456', 3, 'avatar7.jpg', '444 Maple St'),
    ('user8', 'password8', 'User Eight', 'user8@example.com', '890-123-4567', 2, 'avatar8.jpg', '555 Redwood St'),
    ('user9', 'password9', 'User Nine', 'user9@example.com', '901-234-5678', 1, 'avatar9.jpg', '666 Walnut St'),
    ('user10', 'password10', 'User Ten', 'user10@example.com', '012-345-6789', 3, 'avatar10.jpg', '777 Pine St'),
    ('user11', 'password11', 'User Eleven', 'user11@example.com', '123-456-7890', 2, 'avatar11.jpg', '888 Oak St'),
    ('user12', 'password12', 'User Twelve', 'user12@example.com', '234-567-8901', 1, 'avatar12.jpg', '999 Elm St'),
    ('user13', 'password13', 'User Thirteen', 'user13@example.com', '345-678-9012', 3, 'avatar13.jpg', '111 Birch St'),
    ('user14', 'password14', 'User Fourteen', 'user14@example.com', '456-789-0123', 2, 'avatar14.jpg', '222 Maple St'),
    ('user15', 'password15', 'User Fifteen', 'user15@example.com', '567-890-1234', 1, 'avatar15.jpg', '333 Cedar St'),
    ('user16', 'password16', 'User Sixteen', 'user16@example.com', '678-901-2345', 3, 'avatar16.jpg', '444 Pine St'),
    ('user17', 'password17', 'User Seventeen', 'user17@example.com', '789-012-3456', 2, 'avatar17.jpg', '555 Oak St'),
    ('user18', 'password18', 'User Eighteen', 'user18@example.com', '890-123-4567', 1, 'avatar18.jpg', '666 Elm St'),
    ('user19', 'password19', 'User Nineteen', 'user19@example.com', '901-234-5678', 3, 'avatar19.jpg', '777 Birch St'),
    ('user20', 'password20', 'User Twenty', 'user20@example.com', '012-345-6789', 2, 'avatar20.jpg', '888 Maple St'),
    ('user21', 'password21', 'User Twenty-One', 'user21@example.com', '123-456-7890', 1, 'avatar21.jpg', '999 Cedar St'),
    ('user22', 'password22', 'User Twenty-Two', 'user22@example.com', '234-567-8901', 3, 'avatar22.jpg', '111 Pine St'),
    ('user23', 'password23', 'User Twenty-Three', 'user23@example.com', '345-678-9012', 2, 'avatar23.jpg', '222 Oak St'),
    ('user24', 'password24', 'User Twenty-Four', 'user24@example.com', '456-789-0123', 1, 'avatar24.jpg', '333 Elm St'),
    ('user25', 'password25', 'User Twenty-Five', 'user25@example.com', '567-890-1234', 3, 'avatar25.jpg', '444 Birch St'),
    ('user26', 'password26', 'User Twenty-Six', 'user26@example.com', '678-901-2345', 2, 'avatar26.jpg', '555 Maple St'),
    ('user27', 'password27', 'User Twenty-Seven', 'user27@example.com', '789-012-3456', 1, 'avatar27.jpg', '666 Cedar St'),
    ('user28', 'password28', 'User Twenty-Eight', 'user28@example.com', '890-123-4567', 3, 'avatar28.jpg', '777 Pine St'),
    ('user29', 'password29', 'User Twenty-Nine', 'user29@example.com', '901-234-5678', 2, 'avatar29.jpg', '888 Oak St'),
    ('user30', 'password30', 'User Thirty', 'user30@example.com', '012-345-6789', 1, 'avatar30.jpg', '999 Elm St'),
    ('user31', 'password31', 'User Thirty-One', 'user31@example.com', '123-456-7890', 3, 'avatar31.jpg', '111 Birch St'),
    ('user32', 'password32', 'User Thirty-Two', 'user32@example.com', '234-567-8901', 2, 'avatar32.jpg', '222 Maple St'),
    ('user33', 'password33', 'User Thirty-Three', 'user33@example.com', '345-678-9012', 1, 'avatar33.jpg', '333 Cedar St'),
    ('user34', 'password34', 'User Thirty-Four', 'user34@example.com', '456-789-0123', 3, 'avatar34.jpg', '444 Pine St'),
    ('user35', 'password35', 'User Thirty-Five', 'user35@example.com', '567-890-1234', 2, 'avatar35.jpg', '555 Oak St'),
    ('user36', 'password36', 'User Thirty-Six', 'user36@example.com', '678-901-2345', 1, 'avatar36.jpg', '666 Elm St'),
    ('user37', 'password37', 'User Thirty-Seven', 'user37@example.com', '789-012-3456', 3, 'avatar37.jpg', '777 Birch St'),
    ('user38', 'password38', 'User Thirty-Eight', 'user38@example.com', '890-123-4567', 2, 'avatar38.jpg', '888 Maple St'),
    ('user39', 'password39', 'User Thirty-Nine', 'user39@example.com', '901-234-5678', 1, 'avatar39.jpg', '999 Cedar St'),
    ('user40', 'password40', 'User Forty', 'user40@example.com', '012-345-6789', 3, 'avatar40.jpg', '111 Pine St'),
    ('user41', 'password41', 'User Forty-One', 'user41@example.com', '123-456-7890', 2, 'avatar41.jpg', '222 Oak St'),
    ('user42', 'password42', 'User Forty-Two', 'user42@example.com', '234-567-8901', 1, 'avatar42.jpg', '333 Elm St'),
    ('user43', 'password43', 'User Forty-Three', 'user43@example.com', '345-678-9012', 3, 'avatar43.jpg', '444 Birch St'),
    ('user44', 'password44', 'User Forty-Four', 'user44@example.com', '456-789-0123', 2, 'avatar44.jpg', '555 Maple St'),
    ('user45', 'password45', 'User Forty-Five', 'user45@example.com', '567-890-1234', 1, 'avatar45.jpg', '666 Cedar St'),
    ('user46', 'password46', 'User Forty-Six', 'user46@example.com', '678-901-2345', 3, 'avatar46.jpg', '777 Pine St'),
    ('user47', 'password47', 'User Forty-Seven', 'user47@example.com', '789-012-3456', 2, 'avatar47.jpg', '888 Oak St'),
    ('user48', 'password48', 'User Forty-Eight', 'user48@example.com', '890-123-4567', 1, 'avatar48.jpg', '999 Elm St'),
    ('user49', 'password49', 'User Forty-Nine', 'user49@example.com', '901-234-5678', 3, 'avatar49.jpg', '111 Birch St'),
    ('user50', 'password50', 'User Fifty', 'user50@example.com', '012-345-6789', 2, 'avatar50.jpg', '222 Maple St');

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
    email NVARCHAR(255) NOT NULL unique,
    password NVARCHAR(255) NOT NULL,
    name NVARCHAR(255) NOT NULL,
    address NVARCHAR(255) NOT NULL,
    createDate DATE DEFAULT CAST(GETDATE() AS DATE) NOT NULL,
    active BIT DEFAULT 'TRUE' NOT NULL,
    avatar NVARCHAR(255) NOT NULL
);


-- Insert 10 rows into the "shops" table
INSERT INTO shops (email, password, name, address, active, avatar)
VALUES
    ('shop1@example.com', 'password1', 'Shop 1', '123 Main St', 'TRUE', 'avatar1.jpg'),
    ('shop2@example.com', 'password2', 'Shop 2', '456 Elm St', 'TRUE', 'avatar2.jpg'),
    ('shop3@example.com', 'password3', 'Shop 3', '789 Oak St', 'TRUE', 'avatar3.jpg'),
    ('shop4@example.com', 'password4', 'Shop 4', '101 Pine St', 'TRUE', 'avatar4.jpg'),
    ('shop5@example.com', 'password5', 'Shop 5', '222 Birch St', 'TRUE', 'avatar5.jpg'),
    ('shop6@example.com', 'password6', 'Shop 6', '333 Cedar St', 'TRUE', 'avatar6.jpg'),
    ('shop7@example.com', 'password7', 'Shop 7', '444 Maple St', 'TRUE', 'avatar7.jpg'),
    ('shop8@example.com', 'password8', 'Shop 8', '555 Redwood St', 'TRUE', 'avatar8.jpg'),
    ('shop9@example.com', 'password9', 'Shop 9', '666 Walnut St', 'TRUE', 'avatar9.jpg'),
    ('shop10@example.com', 'password10', 'Shop 10', '777 Pine St', 'TRUE', 'avatar10.jpg');

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
        CAST(ROUND(RAND() * 10, 0) AS BIGINT),                                           -- Color ID (assuming it's 1)
        CAST(ROUND(RAND() * 10, 0) AS BIGINT),                                           -- Category ID (assuming it's 1)
        CAST(ROUND(RAND() * 10, 0) AS BIGINT),                                           -- Shop Category ID (assuming it's 1)
        CAST(ROUND(RAND() * 10, 0) AS BIGINT),                                           -- Shop ID (assuming it's 1)
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

select * from users
select * from categories
select * from vouchers
select * from sizesProduct
select * from roles
select * from address
select * from colors
select * from shops
SELECT * FROM shopReports
select * from productImages
select * from orders
select * from orderProducts
select * from shipCompany
select * from cartProducts
select * from carts
select * from rates