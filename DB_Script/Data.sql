USE [master]
GO
/****** Object:  Database [PRJ301_Assignment]    Script Date: 11/7/2023 11:21:49 AM ******/
CREATE DATABASE [PRJ301_Assignment]
ALTER DATABASE [PRJ301_Assignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [PRJ301_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRJ301_Assignment', N'ON'
GO
ALTER DATABASE [PRJ301_Assignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRJ301_Assignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRJ301_Assignment]
GO
/****** Object:  Table [dbo].[address]    Script Date: 11/7/2023 11:21:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](255) NOT NULL,
	[detail] [nvarchar](255) NOT NULL,
	[town] [nvarchar](255) NOT NULL,
	[district] [nvarchar](255) NOT NULL,
	[city] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cartProducts]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cartProducts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[productId] [bigint] NOT NULL,
	[cartId] [bigint] NOT NULL,
	[shopId] [bigint] NOT NULL,
	[quantity] [int] NOT NULL,
	[sizeId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[image] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[colors]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colors](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[code] [nvarchar](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderProducts]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderProducts](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orderId] [bigint] NOT NULL,
	[productId] [bigint] NOT NULL,
	[productPrice] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[totalPrice] [float] NOT NULL,
	[salePrice] [float] NULL,
	[imageUrl] [nvarchar](255) NOT NULL,
	[size] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[shopId] [bigint] NOT NULL,
	[shipperId] [bigint] NULL,
	[totalPrice] [float] NOT NULL,
	[saleTotalPrice] [float] NULL,
	[orderDate] [date] NOT NULL,
	[successDate] [date] NULL,
	[phone] [nvarchar](11) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[voucherId] [bigint] NULL,
	[status] [nvarchar](50) NOT NULL,
	[note] [nvarchar](255) NULL,
	[deliveryChecking] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productImages]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productImages](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[productId] [bigint] NOT NULL,
	[imageUrl] [nvarchar](255) NOT NULL,
	[role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[salePrice] [float] NULL,
	[description] [nvarchar](max) NOT NULL,
	[city] [nvarchar](255) NOT NULL,
	[rate] [float] NOT NULL,
	[createDate] [date] NOT NULL,
	[boughtQuantity] [int] NOT NULL,
	[color] [bigint] NOT NULL,
	[categoryId] [bigint] NOT NULL,
	[shopCategoryId] [bigint] NOT NULL,
	[shopId] [bigint] NOT NULL,
	[createBy] [nvarchar](255) NULL,
	[deleteBy] [nvarchar](255) NULL,
	[url] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rates]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rates](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[productId] [bigint] NOT NULL,
	[star] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userType] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipCompany]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipCompany](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [float] NOT NULL,
	[image] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopReports]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopReports](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[shopId] [bigint] NOT NULL,
	[profit] [float] NOT NULL,
	[revenue] [float] NOT NULL,
	[expense] [float] NOT NULL,
	[amountOrders] [bigint] NOT NULL,
	[amountProducts] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shops]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shops](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[createDate] [date] NOT NULL,
	[active] [bit] NOT NULL,
	[avatar] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sizesProduct]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sizesProduct](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[inventory] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[productId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](255) NULL,
	[role] [bigint] NOT NULL,
	[avatar] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vouchers]    Script Date: 11/7/2023 11:21:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vouchers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[priceCondition] [float] NOT NULL,
	[price] [float] NOT NULL,
	[percent] [int] NOT NULL,
	[createBy] [nvarchar](255) NULL,
	[deleteBy] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([id], [userId], [name], [phone], [detail], [town], [district], [city]) VALUES (1, 3, N'Trần Quốc Việt', N'1234567894', N'asdfaf', N'Xã Cốc Đán', N'Huyện Ngân Sơn', N'Tỉnh Bắc Kạn')
INSERT [dbo].[address] ([id], [userId], [name], [phone], [detail], [town], [district], [city]) VALUES (2, 3, N'Trần Quốc Việt', N'1234567892', N'1111', N'Xã Lý Bôn', N'Huyện Bảo Lâm', N'Tỉnh Cao Bằng')
SET IDENTITY_INSERT [dbo].[address] OFF
GO
SET IDENTITY_INSERT [dbo].[cartProducts] ON 

INSERT [dbo].[cartProducts] ([id], [productId], [cartId], [shopId], [quantity], [sizeId]) VALUES (8, 3, 2, 1, 1, 7)
SET IDENTITY_INSERT [dbo].[cartProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[carts] ON 

INSERT [dbo].[carts] ([id], [userId]) VALUES (1, 2)
INSERT [dbo].[carts] ([id], [userId]) VALUES (2, 3)
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [image]) VALUES (1, N'Áo tay ngắn', N'image1.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (2, N'Áo dài tay', N'image2.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (3, N'Quần dài', N'image3.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (4, N'Quần short', N'image4.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (5, N'Giày', N'image5.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (6, N'Dép', N'image6.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (7, N'Tất, Vớ', N'image7.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (8, N'Mũ, Nón', N'image8.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (9, N'Cặp, Balo', N'image9.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (10, N'Máy Tính', N'image10.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (11, N'Điện Thoại', N'image10.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (12, N'Nước Hoa', N'image10.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (13, N'Đồ Dùng Gia Đình', N'image10.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (14, N'Đồ Trang Điểm', N'image10.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (15, N'Phụ Kiện, Trang Sức', N'image10.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (16, N'Sách', N'image10.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (17, N'Thú Cưng', N'image10.jpg')
INSERT [dbo].[categories] ([id], [name], [image]) VALUES (18, N'Khác...', N'image10.jpg')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[colors] ON 

INSERT [dbo].[colors] ([id], [name], [code]) VALUES (1, N'Black', N'#000000')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (2, N'White', N'#FFFFFF')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (3, N'Yellow', N'#FFD23F')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (4, N'Green Yellow', N'#CCFF66')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (5, N'Khaki', N'#BCAA99')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (6, N'Red', N'#BF1A2F')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (7, N'Eminence', N'#783F8E')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (8, N'Gray', N'#C8C6D7')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (9, N'Amaranth Pink', N'#DD9AC2')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (10, N'Light Green', N'#94FBAB')
INSERT [dbo].[colors] ([id], [name], [code]) VALUES (11, N'Multi Color', N'#ffffff')
SET IDENTITY_INSERT [dbo].[colors] OFF
GO
SET IDENTITY_INSERT [dbo].[orderProducts] ON 

INSERT [dbo].[orderProducts] ([id], [orderId], [productId], [productPrice], [quantity], [totalPrice], [salePrice], [imageUrl], [size]) VALUES (1, 1, 3, 50000, 4, 96000, 24000, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0iv5r9s2rm0b.jpg?alt=media&token=aeebe317-9841-4692-9a26-a52589874760', N'9')
INSERT [dbo].[orderProducts] ([id], [orderId], [productId], [productPrice], [quantity], [totalPrice], [salePrice], [imageUrl], [size]) VALUES (2, 1, 2, 110000, 1, 52800, 52800, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyeegkb7.jpg?alt=media&token=d5ab0a30-a4c9-46d7-8c42-46385066efd3', N'6')
INSERT [dbo].[orderProducts] ([id], [orderId], [productId], [productPrice], [quantity], [totalPrice], [salePrice], [imageUrl], [size]) VALUES (3, 2, 7, 150000, 1, 75000, 75000, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fe91a7904d85af4232e35e94bf116ed11.jpg?alt=media&token=3422c5d4-40b8-4725-b2d3-c94f2354f883', N'17')
INSERT [dbo].[orderProducts] ([id], [orderId], [productId], [productPrice], [quantity], [totalPrice], [salePrice], [imageUrl], [size]) VALUES (4, 3, 2, 110000, 1, 52800, 52800, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyeegkb7.jpg?alt=media&token=d5ab0a30-a4c9-46d7-8c42-46385066efd3', N'6')
INSERT [dbo].[orderProducts] ([id], [orderId], [productId], [productPrice], [quantity], [totalPrice], [salePrice], [imageUrl], [size]) VALUES (5, 4, 1, 110000, 2, 105600, 52800, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyh7lg0b.jpg?alt=media&token=1e8d0d40-1ecc-435a-a467-33b81239f834', N'1')
INSERT [dbo].[orderProducts] ([id], [orderId], [productId], [productPrice], [quantity], [totalPrice], [salePrice], [imageUrl], [size]) VALUES (6, 5, 1, 110000, 4, 211200, 52800, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyh7lg0b.jpg?alt=media&token=1e8d0d40-1ecc-435a-a467-33b81239f834', N'2')
SET IDENTITY_INSERT [dbo].[orderProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [userId], [shopId], [shipperId], [totalPrice], [saleTotalPrice], [orderDate], [successDate], [phone], [address], [voucherId], [status], [note], [deliveryChecking]) VALUES (1, 3, 1, 6, 173800, 0, CAST(N'2023-10-29' AS Date), NULL, N'1234567894', N'asdfaf, Xã Cốc Đán, Huyện Ngân Sơn, Tỉnh Bắc Kạn', 0, N'waitForConfirmation', N'', N'')
INSERT [dbo].[orders] ([id], [userId], [shopId], [shipperId], [totalPrice], [saleTotalPrice], [orderDate], [successDate], [phone], [address], [voucherId], [status], [note], [deliveryChecking]) VALUES (2, 3, 2, 2, 110000, 0, CAST(N'2023-10-29' AS Date), NULL, N'1234567894', N'asdfaf, Xã Cốc Đán, Huyện Ngân Sơn, Tỉnh Bắc Kạn', 0, N'waitForConfirmation', N'', N'')
INSERT [dbo].[orders] ([id], [userId], [shopId], [shipperId], [totalPrice], [saleTotalPrice], [orderDate], [successDate], [phone], [address], [voucherId], [status], [note], [deliveryChecking]) VALUES (3, 3, 1, 1, 92800, 0, CAST(N'2023-11-07' AS Date), CAST(N'2023-11-07' AS Date), N'1234567894', N'asdfaf, Xã Cốc Đán, Huyện Ngân Sơn, Tỉnh Bắc Kạn', 0, N'delivered', N'', N'')
INSERT [dbo].[orders] ([id], [userId], [shopId], [shipperId], [totalPrice], [saleTotalPrice], [orderDate], [successDate], [phone], [address], [voucherId], [status], [note], [deliveryChecking]) VALUES (4, 3, 1, 1, 145600, 0, CAST(N'2023-11-07' AS Date), NULL, N'1234567894', N'asdfaf, Xã Cốc Đán, Huyện Ngân Sơn, Tỉnh Bắc Kạn', 0, N'waitingForDelivery', N'', N'')
INSERT [dbo].[orders] ([id], [userId], [shopId], [shipperId], [totalPrice], [saleTotalPrice], [orderDate], [successDate], [phone], [address], [voucherId], [status], [note], [deliveryChecking]) VALUES (5, 3, 1, 2, 246200, 0, CAST(N'2023-11-07' AS Date), NULL, N'1234567892', N'1111, Xã Lý Bôn, Huyện Bảo Lâm, Tỉnh Cao Bằng', 0, N'waitForConfirmation', N'', N'')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[productImages] ON 

INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (1, 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyh7lg0b.jpg?alt=media&token=1e8d0d40-1ecc-435a-a467-33b81239f834', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (2, 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyim5w2d.jpg?alt=media&token=a3ece2bc-983e-4ede-b010-ca40d52ea477', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (3, 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0id4kpqnjob6.jpg?alt=media&token=7d6d48eb-0038-4e1e-a4ef-79c3c62552c1', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (4, 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0id4kps2441a.jpg?alt=media&token=3ccb0991-7a4a-4068-80ca-c3b0787117ef', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (5, 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyk0qc79.jpg?alt=media&token=5fdcfd59-8433-47ab-93f6-8f5ebf51da71', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (6, 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134201-7qukw-lgidc6mhb113ce.jpg?alt=media&token=38f1b2f9-1624-43ca-aa9c-b58ca3ac3dd6', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (7, 2, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyeegkb7.jpg?alt=media&token=d5ab0a30-a4c9-46d7-8c42-46385066efd3', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (8, 2, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyft1035.jpg?alt=media&token=2d2c3494-234c-4b33-9397-79a416e9ebd7', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (9, 2, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyk0qc79.jpg?alt=media&token=d6f8c2d1-6d3a-42a0-9e79-83920cdd0276', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (10, 2, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkylfas04.jpg?alt=media&token=2b2c7b18-545c-417a-9e5a-17448f3cad33', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (11, 2, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkylfas04.jpg?alt=media&token=0e4db5c6-601f-40f3-afbb-8b7a478cdc84', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (12, 2, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134201-7qukw-lgidc6mhb113ce.jpg?alt=media&token=31b7739e-68df-4314-b977-5d866a2693de', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (13, 3, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0iv5r9s2rm0b.jpg?alt=media&token=aeebe317-9841-4692-9a26-a52589874760', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (14, 3, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0iv5r9thc281.jpg?alt=media&token=d9f7732f-5ff6-4858-8af3-15d7632eefde', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (15, 3, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0iv5r9uvwi34.jpg?alt=media&token=5985be86-ca2f-473e-8492-388ac4e72737', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (16, 3, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0iv5r9wagy01.jpg?alt=media&token=1abab3be-91d1-4096-b7bb-324e802218e1', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (17, 3, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0iv5r9xp1e0b.jpg?alt=media&token=df344bd2-2394-4a05-afc7-89c04ec4dc73', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (18, 3, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0iv5r9z3lu6b.jpg?alt=media&token=25728583-f7cd-45c9-8b43-773632ff87ac', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (19, 3, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0iv5ra0i6a79.jpg?alt=media&token=4e595ed8-cd1a-4c1e-8696-ffe50ad7320a', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (20, 3, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134201-7qukw-lh2c3wq1ntwy34.jpg?alt=media&token=e6d7ce23-3967-4f69-9e09-36595fd76570', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (22, 5, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fb7922edc9d86c7bf1a916eaa21ac1397_tn.jpg?alt=media&token=8f759e7b-932a-44be-bf58-fa29aef97137', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (23, 6, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F64b0019263a9d11fe9df39f4a13af185.jpg?alt=media&token=f8555ae9-4f53-4e02-8b60-22b72df6aebb', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (24, 6, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F584cfc262661b1cbb60fdbea02aaafbd.jpg?alt=media&token=19baf5a7-9495-4bb2-ba4e-db49565cf905', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (25, 6, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F8732c31cc5de8caabe0f4172c0fe3f0e.jpg?alt=media&token=dd04f341-97cb-4425-bb4f-7dfbd8bc439e', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (26, 6, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F1967766f5d5f52c9f2f8058c053ff1ee.jpg?alt=media&token=0c90c6cf-925f-456f-9f0d-955fabad7285', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (27, 6, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fb0bcaa00992c3b2928d1b2adaca2a35a.jpg?alt=media&token=dbca5b99-ac6a-491e-b475-90541c3b3f0c', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (28, 6, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F0cfd1ccfd8b31fd2a9cdf3190282601c.jpg?alt=media&token=0dbb1bf8-1bcb-4c4c-9586-c6b095b52b19', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (29, 6, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fb7d8ab90a92439712c683f42d28152ba.jpg?alt=media&token=afe7f377-ea6e-40f6-a268-f6f55fcff56f', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (30, 7, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fe91a7904d85af4232e35e94bf116ed11.jpg?alt=media&token=3422c5d4-40b8-4725-b2d3-c94f2354f883', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (31, 7, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Faa383927271c8f7966e4a96d9b69f638.jpg?alt=media&token=b6670338-8956-4c87-a410-0a9070e19b74', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (32, 7, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fb06cc99dc9c7954cb78baf5c583306fd.jpg?alt=media&token=411529e0-3c91-45d4-9750-d3c2492c0f09', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (33, 7, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fbf438932a5eaa240ea78bb17231a02f8.jpg?alt=media&token=a306fbb9-7b3b-4e1b-9703-239469629d0d', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (34, 7, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F449bfcade120f189c0c32ad094db18c9.jpg?alt=media&token=7d698d45-a5e1-49bd-9f66-f627e35cc30a', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (35, 7, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F9bb81b647231e9c3be8de086fcbdd41c.jpg?alt=media&token=10c79bda-ef96-40e2-9137-21d97960a241', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (36, 7, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F96d5d0a2028e0b8bc14ff815e7d09a06.jpg?alt=media&token=e0b50b9a-3ddf-433b-b265-301d06cb4322', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (37, 8, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F93d7bf99a4acf81035ff2642332cd3dd.jpg?alt=media&token=9a47aafa-f18f-4809-a16e-f2b143bf0e9b', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (38, 8, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F39c0f32436681bb917ba5910a64dad87.jpg?alt=media&token=6e87f091-d5fa-4cab-88e5-31cc9db4fc40', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (39, 9, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvdx-ljk9rt4jnsk6a5.jpg?alt=media&token=add578be-ec36-4003-9109-bdd5fd92448e', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (40, 9, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvel-lj3nbhsvgj0pbc.jpg?alt=media&token=faa7e863-dc43-4193-9b30-3fda44fab982', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (41, 9, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvev-lj3nbhk9t3tb58.jpg?alt=media&token=805aaaa6-b4ed-40c6-bb20-4b2ad52d1fee', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (42, 9, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvfh-linprk42lbm59e.jpg?alt=media&token=288f332f-1792-41d2-890d-f78c5da0a5fc', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (43, 9, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvcy-lj3nbhmrpg53f9.jpg?alt=media&token=8c0eb7cc-a804-4cda-b1d6-6f8e5721ee0f', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (44, 9, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvd1-linprl277e5rd4.jpg?alt=media&token=d98e1be6-8295-481a-88c0-bd1b21bdb915', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (45, 9, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvdi-lj3nbhfk00jld0.jpg?alt=media&token=45b9179e-439b-4e56-ad6f-eaa6210793c1', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (46, 9, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvdr-litxf32gyq6e1f.jpg?alt=media&token=0e4d919e-987f-42b5-a194-73198a644956', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (47, 9, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvdx-lj3nbhnbq1al03.jpg?alt=media&token=4f3fc1c9-861a-4b2d-b349-4445db2c37d1', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (48, 10, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F89563eff21356985611d93b782321dcf.jpg?alt=media&token=e90274aa-f3a4-494c-a2f5-00237f7e5eb9', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (49, 10, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F45780c3459074a52acaa31cb42247225.jpg?alt=media&token=7d6d0a18-3ad8-4eb8-af7f-34d2322c3fd5', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (50, 10, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F4635c5af14f94ed78ec6284983581212.jpg?alt=media&token=a87c4fae-f881-4343-9462-77f62f987da2', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (51, 10, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F578a9cabf390fc01e02e1837e87a2d88.jpg?alt=media&token=969fa2d2-ddf5-46e3-bf07-ab7e64884468', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (52, 10, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F22cd05fcce82abedace8fa5ba8cdb5fe.jpg?alt=media&token=a8c955d0-1be5-4681-939e-ce5df430bd08', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (53, 11, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lmc1kb3usu73fc.jpg?alt=media&token=72e694e5-2af4-4dc9-ab82-9b23fb5a3478', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (54, 11, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lmc1kb3uomhre3.jpg?alt=media&token=168f4049-7cb2-4614-8dbe-e595706dcf1d', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (55, 11, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lmc1kb3uq12789.jpg?alt=media&token=fac93b6f-c354-47b4-819d-6026b022e6ce', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (56, 11, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lmc1kb3uu8rj3a.jpg?alt=media&token=207b2d79-a478-4537-a71a-ec866c056ec0', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (57, 11, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lmrmwlj119en54.jpg?alt=media&token=68fe8c70-1a83-41ae-8bee-530208d9f2e4', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (58, 12, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lg6646n5dp4a04.jpg?alt=media&token=a2c82363-6f08-40fe-b649-41284d8c9b2d', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (59, 12, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lg6646n5ujxm3a.jpg?alt=media&token=8089a83b-9ace-4158-9dc9-b83b75e9b6bc', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (60, 12, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lg6646n5t5d6ab.jpg?alt=media&token=46753b5d-0ccc-4c6b-ad9a-f2934ec7b0da', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (61, 12, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lg6646n5vyi2d5.jpg?alt=media&token=eacb5ad4-3a63-48f3-b3d7-3ee77abbfcbe', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (62, 14, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lg6646n5dp4a04.jpg?alt=media&token=e072183b-a1c9-4119-9b9d-dacc331a0c04', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (63, 14, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lg6646n5ujxm3a.jpg?alt=media&token=6f2b5a81-1c61-4230-a168-e03993fdb41c', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (64, 14, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lg6646n5t5d6ab.jpg?alt=media&token=c23a9972-2d63-489d-a0ad-bac3835ba48b', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (65, 14, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lg6646n5vyi2d5.jpg?alt=media&token=95c993b0-72c5-445c-805f-4845f122a38b', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (66, 15, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfvywlysa9knd6.jpg?alt=media&token=1a974271-b367-4ef2-8494-4fab84c54a0d', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (67, 15, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfvywlysbo537d.jpg?alt=media&token=b087c1ec-07a2-4088-8d0e-b22afcc0b982', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (68, 15, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfvywlysd2pjf6.jpg?alt=media&token=8a7bf38a-397e-4618-84a7-d5a8a076ce9e', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (69, 15, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfvywlyseh9zfd.jpg?alt=media&token=8ffd92a3-2fd0-45f3-acda-8df57a7a3c27', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (70, 15, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfvywlysfvufb9.jpg?alt=media&token=5b97052f-52cf-4749-acbd-57f54d15da63', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (71, 15, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfvywlyshaev95.jpg?alt=media&token=10ea47f1-374b-4117-adbd-701191e435a9', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (72, 15, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfvywlysiozbaa.jpg?alt=media&token=6263e0e9-2217-4f4c-8f3f-6653d8144cd5', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (73, 15, N'', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (74, 16, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44proy22d8.jpg?alt=media&token=2922ff95-7dd3-499f-a4e3-f5b1cb3423c0', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (75, 16, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44prqcmi8c.jpg?alt=media&token=96c04681-e289-4404-b232-0d4f49927ec0', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (76, 16, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44prrr6ya2.jpg?alt=media&token=1654bd8e-d186-426d-809e-880422447479', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (77, 16, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44prt5re26.jpg?alt=media&token=2cbb5172-cae1-4809-aab2-5030cd244fea', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (78, 16, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44prvywa37.jpg?alt=media&token=3c500698-0a43-4fa1-8f8e-1acd1da31346', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (79, 16, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44prxdgq8c.jpg?alt=media&token=192b7206-721c-47fe-85e0-943d18e98cd4', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (80, 16, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44prys16df.jpg?alt=media&token=3ea73746-4867-4882-a98b-ae7bdf64d69d', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (81, 16, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44ps1l62bf.jpg?alt=media&token=ac2024bb-0494-41e5-837a-6f2736f82650', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (82, 16, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44ps06lm63.jpg?alt=media&token=2e9a38bd-6d80-4aa4-86c3-2ff020a0656b', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (83, 17, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5kqi0g39i7ad.jpg?alt=media&token=88be3688-22e4-4df3-a3b5-36ea7bb6cbdc', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (84, 17, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5kqi0g4o2n7f.jpg?alt=media&token=e1859120-9700-470e-b7bb-4d8c9fe8afcb', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (85, 17, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5kqi0g7h7j03.jpg?alt=media&token=c5b37108-ca3e-4b46-a302-f11be2c2c7a5', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (86, 17, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5kqi0g8vrz40.jpg?alt=media&token=73d4c58b-2b64-4a67-81be-a07ca73c9934', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (87, 17, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5kqi0g62n3ef.jpg?alt=media&token=3916ba79-a758-4db3-874b-17b8c882fffe', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (88, 17, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5l53kqr9i7ba.jpg?alt=media&token=fa4d7a58-f151-4cdd-83b7-4e4414fe5f50', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (89, 17, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5l53kr6pr306.jpg?alt=media&token=040fef59-3d32-498b-9a31-1a5402e0e876', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (90, 17, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5l53krm5zza5.jpg?alt=media&token=05deee86-d5c5-4e3f-8908-664d4ed52ea1', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (91, 18, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgg4977nfz7b96.jpg?alt=media&token=458551b3-534f-4125-959a-39f2a575abf2', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (92, 18, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgg4977m5m5m7f.jpg?alt=media&token=bc3fff66-159b-4636-a804-7fe975d7402c', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (93, 18, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgg4977m5mgn6d.jpg?alt=media&token=378c9b87-f18d-4312-8a97-a9d2cc1a65be', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (94, 18, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgg4977ml2ei05.jpg?alt=media&token=aac0232f-bd75-4fa0-a843-e78dfadf7f43', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (95, 18, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgg4977ml2pj4f.jpg?alt=media&token=7c37ca14-80bd-4e98-969a-878ba34054ae', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (96, 18, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgg4977mmh9z7f.jpg?alt=media&token=f2bb5f0d-a7a0-4e80-ad8b-4d42b21f37cb', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (97, 18, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgg4977oavp3df.jpg?alt=media&token=3ee9b38d-2a5a-46bc-89fe-6165f2ff3eaf', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (98, 19, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgl8nimupisqa4.jpg?alt=media&token=3db68565-e7b8-4c6a-8b97-c5c93013e1ba', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (99, 19, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-22120-1de8tywlswkv4c.jpg?alt=media&token=1d4d07a6-e0f6-473d-b667-cb90ee64164d', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (100, 19, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-22120-6ad68zwlswkv1a.jpg?alt=media&token=997f0b15-286b-4c30-9836-f3466d4bca70', 2)
GO
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (101, 19, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-22120-xrz74ywlswkvc0.jpg?alt=media&token=00d076f5-8123-4608-b5c5-759c952e7742', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (102, 19, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfsb9n7iq0hj01.jpg?alt=media&token=4ba297aa-2e98-453a-b96d-96cf926041c7', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (103, 19, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfsb9n7iq06i80.jpg?alt=media&token=f08e062b-94d5-474b-adfc-787e75346fcd', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (104, 20, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfc2s6jnjng5f7.jpg?alt=media&token=829071ef-6e41-4593-926e-6bf229dbfc31', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (105, 20, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfc2s6jns2ut8e.jpg?alt=media&token=1c52a29d-05cd-4438-85af-a101b7001af5', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (106, 20, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfc2s6jnqoadf2.jpg?alt=media&token=6e37e5bf-2465-414e-bfd8-e4977725a2b4', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (107, 20, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfc2s6jnp9pxbb.jpg?alt=media&token=f7e418e3-732f-492f-ab29-ef7a76c547cc', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (108, 20, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfc2s6jnnv5hdc.jpg?alt=media&token=7a33a054-f4f2-4258-9b14-828bfe5a5cf4', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (109, 20, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfc2s6jnmgl16f.jpg?alt=media&token=5b8ad730-a4f8-4bfa-9772-a4b522c6b1db', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (110, 20, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfc2s6jnl20l42.jpg?alt=media&token=c94c87ae-29de-4bda-bde7-07e6c3a5f025', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (111, 21, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvf2-lj3u6fbeqarkea.jpg?alt=media&token=ea440943-3bf7-45d5-94ae-7d3569ac5956', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (112, 21, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qveu-lien85leivlbac.jpg?alt=media&token=9eb6a2cd-5d02-4a52-b53a-60d0f0c60885', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (113, 21, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvf9-lj3u6duovfgt67.jpg?alt=media&token=69af7b4b-4934-430f-9e07-ffaf3f195f67', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (114, 21, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvdq-lien86zmhdkn3d.jpg?alt=media&token=dd3a9df2-6a6c-4b8f-9c40-ec75f93ae728', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (115, 21, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvec-lj3u6l1aftot72.jpg?alt=media&token=9440ec44-ffdf-4f12-a6c5-68db8faae7c7', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (116, 21, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvcu-lj3u6kdzb40d05.jpg?alt=media&token=1d8c770c-7474-4e66-940e-abccaa7e2bd8', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (117, 21, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvcw-ljdkj9h1qxvkf8.jpg?alt=media&token=342b606c-16ed-4923-8ee9-6e8650fd7b0c', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (118, 21, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvf9-ljc5eawqjp59de.jpg?alt=media&token=35c08ecc-09c3-47e1-83bd-5bcc3e29f137', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (119, 22, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lilbahue67yq29.jpg?alt=media&token=c7b9e1d4-f806-48cc-a221-864eb0fce501', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (120, 22, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lilfd07xg6vm2d.jpg?alt=media&token=c03b83dd-3067-4212-a83a-500a57cde12c', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (121, 22, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-ln3qc6v7acige0.jpg?alt=media&token=60449a90-27ad-4e4a-9c3c-5000f33dfa3b', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (122, 22, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-ln3qc6v7br2w1c.jpg?alt=media&token=2ccd1814-f782-46db-a5e6-9a6e27a61d39', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (123, 22, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lmfjuohc6f3312.jpg?alt=media&token=f6d0350f-5134-401d-94f0-2c1717fb97ea', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (124, 22, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lilfd08ruf9ue9.jpg?alt=media&token=f3c8b093-090b-454c-b658-cbccfb148ad9', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (125, 22, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lilfd07xj00i89.jpg?alt=media&token=92f65d95-b2e6-4c62-8eca-76532946324d', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (126, 22, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5fpfwqclpb18.jpg?alt=media&token=2145ccaa-fc16-4128-9b45-edbf9ba2d217', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (127, 23, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F119fc3959add8c7039ba99f84e06169d.jpg?alt=media&token=a5b1e9ec-1c6f-43dd-96c3-57f1fb7e68ed', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (128, 23, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F0bfc2815a9e60209d157f2f8b9c8e09f.jpg?alt=media&token=ed508432-c1f9-4a78-bfc0-b7b59c2f96d2', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (129, 23, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F7d6270c960d8674c6aa1b6fe568a1957.jpg?alt=media&token=6c60129b-f904-4c3d-bbcf-2f525fb71061', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (130, 23, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F119fc3959add8c7039ba99f84e06169d.jpg?alt=media&token=f1cee474-4ee5-4376-904e-d890a6023ee5', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (131, 23, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F8188b820bfbbdc7e1e13883bb2d6db3b.jpg?alt=media&token=c564cfbf-50e1-4caa-8fe9-38b3e77d8a2a', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (132, 24, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkkqe3ybsyik05.jpg?alt=media&token=816a4ed0-a687-45bb-af8f-a4a1af689f92', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (133, 24, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkkqe3ybvrng96.jpg?alt=media&token=d1b7a141-2c34-400e-95e1-a2a4ff7e47f5', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (134, 24, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkkqe3ybx67w97.jpg?alt=media&token=a5958201-cfab-4465-8bd5-b3cbaf9b4df7', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (135, 24, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkkqe3yce1180e.jpg?alt=media&token=e6f6c2db-f8ab-4f73-8bf3-f3d569b898f8', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (136, 24, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkkqe3yc9tbw46.jpg?alt=media&token=928d78d6-d596-4691-ba1f-73aa17e6caeb', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (137, 24, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkkqe3yc8erge6.jpg?alt=media&token=4c4fad03-5fc3-4984-b259-40d6dda2a498', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (138, 24, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkkqe3yc1dx81c.jpg?alt=media&token=ea2fb967-83c2-4ea5-aeb3-1446d2852ded', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (139, 25, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk7litqw6wmse4.jpg?alt=media&token=7985ac63-c6a2-40f7-a2db-a786ce1476b2', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (140, 25, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk7litqw9pro7f.jpg?alt=media&token=b152b2fd-61aa-49bb-a384-3d7966e25041', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (141, 25, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk7litqwb4c4f1.jpg?alt=media&token=159c53bb-e61f-4d72-b398-93cfb3b0b6af', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (142, 25, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk7litqwciwk64.jpg?alt=media&token=9104110b-0207-43eb-88b1-218ef3db11f4', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (143, 25, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk7litqwdxh0ba.jpg?alt=media&token=20d65441-5ea1-40b3-abe0-46b57dbe7904', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (144, 25, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk7litqwfc1g11.jpg?alt=media&token=55a8e15b-d19b-4b1f-9189-a7488dee8c00', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (145, 25, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk7t69htjeo25b.jpg?alt=media&token=87e41565-cf3b-49dd-99d9-e1059d0d8262', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (146, 26, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ll5wdh8iblik0c.jpg?alt=media&token=ced75352-0f11-4654-94d9-059a0f33179c', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (147, 26, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ll5wdh8ieengbe.jpg?alt=media&token=f4fabad5-216d-4297-b198-d1d84db6620e', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (148, 26, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ll5wdh8ik0x853.jpg?alt=media&token=bcdb0217-a038-4fac-9128-4b8be8b29fcb', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (149, 26, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ll5wdh8imu24c4.jpg?alt=media&token=181271b7-1a03-48e4-8ad1-bd6fe4657b0f', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (150, 26, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ll5wdh8ipn7095.jpg?alt=media&token=46658a0e-8c05-48d1-ab11-93f773e0b64a', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (151, 26, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ll5wdh8iwo18aa.jpg?alt=media&token=1ffbaf38-8178-48b8-8646-7303addcdb51', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (152, 26, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ll5wdh8iy2loeb.jpg?alt=media&token=0f9e0a12-ae09-4106-964b-6f5fa6c93e9a', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (153, 27, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llszw9h98aaq6b.jpg?alt=media&token=132d4acd-805e-401d-ade4-0d9a8bbd8eed', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (154, 27, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llszw9h8hliaaa.jpg?alt=media&token=8eb7023a-a8c0-4800-9863-4ae6a611c2c2', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (155, 27, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llszw9h8g6xu01.jpg?alt=media&token=03e14767-85a4-4d10-87f9-70a709652695', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (156, 27, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llszw9h8g73810.jpg?alt=media&token=05446c3a-620d-477b-acc6-3d4580f200f1', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (157, 27, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llszw9h8j02qf1.jpg?alt=media&token=3dcc813f-82e0-4cc1-a8d2-2acde4ee880e', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (158, 27, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llszw9h8ken67c.jpg?alt=media&token=5889401e-853e-4886-9a90-35f158d4b86e', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (159, 27, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llszw9h8lt7m4c.jpg?alt=media&token=de66dc25-a207-4ed1-b5af-2c2e9eae1b8c', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (160, 27, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llszw9h8vn6q9e.jpg?alt=media&token=327ca1a3-e052-4261-94b8-68c9e34b02f9', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (161, 28, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llnccvrcwm8o2c.jpg?alt=media&token=ef561194-e350-46c2-8049-17a30810951c', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (162, 28, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ln73oxo6gknx55.jpg?alt=media&token=f68fafcd-7118-4a69-bd54-2ed2a3a52fcc', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (163, 28, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ln73oxo614f18a.jpg?alt=media&token=1ecb96d9-7691-4017-9af3-283c9db31912', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (164, 28, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7qukw-ljp85mk1w8f143.jpg?alt=media&token=d40bfadf-b21d-40ac-9d62-91e1efa04c53', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (165, 29, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lm78ezaue4f805.jpg?alt=media&token=2ae282be-3f37-4e07-aab4-a7e3c367abe8', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (166, 29, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lm78ezaaexia98.jpg?alt=media&token=a77f4b67-e453-4433-97a5-1519c7af44c5', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (167, 29, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llxd7s91pgbo6a.jpg?alt=media&token=49ad40ce-1636-4fd3-aa6d-0029a23e254c', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (168, 29, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llxd7s9au57o7c.jpg?alt=media&token=89c5e870-5c47-41a5-8a93-53dbc4e3b99a', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (169, 29, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkti1339b84hcc.jpg?alt=media&token=d63038d2-274a-4562-99c5-63d327e80105', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (170, 30, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llyte04h7e1w2c.jpg?alt=media&token=bf383030-51c4-46fb-b9a9-a26b178957e4', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (171, 30, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lm78ezakej1g48.jpg?alt=media&token=775c6b64-9c0a-4ec4-b56e-76a1d7a43761', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (172, 30, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llyte04rmfj664.jpg?alt=media&token=86e13770-b477-4712-bd13-15465333b427', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (173, 30, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lm78ezzjdzhg33.jpg?alt=media&token=92f25293-a449-42c1-b606-a24ee467413a', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (174, 30, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkti1339b84hcc.jpg?alt=media&token=24429b28-1a93-4767-b77c-1374bc1a56f1', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (175, 31, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llvyltp56qcka4.jpg?alt=media&token=1212dbd3-f165-4aac-bad6-2b90f89d4f40', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (176, 31, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrr0w31zroka4.jpg?alt=media&token=6b3d9337-3196-4506-862b-3d5baa9c5b1c', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (177, 31, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrr0w325dyce7.jpg?alt=media&token=783863e6-4d41-4f51-9b03-9bbcd5d761fa', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (178, 31, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrr0w31zroka4.jpg?alt=media&token=c9593c18-f13a-452e-b936-d9b5c64552e9', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (179, 31, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrr0w31yd4454.jpg?alt=media&token=6ea8c7b5-2383-44f2-b354-19c9cb10ea5d', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (180, 31, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrr0w31vjz885.jpg?alt=media&token=9605f081-a9de-4fe2-9b25-ba3dfdfa36d4', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (181, 31, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkti1339b84hcc.jpg?alt=media&token=10768a9e-7f49-4c8f-98c5-d69450c36ae8', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (190, 32, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llvyltp55bs4a4.jpg?alt=media&token=26a93c94-46bf-4e69-b4c3-d7a542208f0c', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (191, 32, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrmn5oj6hwi36.jpg?alt=media&token=26bc47ba-25a4-4b64-b7b7-30c2442397fb', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (192, 32, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrmn5ojc46a96.jpg?alt=media&token=c69db02f-fe04-4b76-858b-7f9ded3d63d6', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (193, 32, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llvyltp4ogys39.jpg?alt=media&token=3b79f0d5-0f61-4555-8994-44425e64ace7', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (194, 32, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrmn5oipn3667.jpg?alt=media&token=9dd2f097-7d07-4cd8-9610-95f70d209422', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (195, 32, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrmn5oitusi13.jpg?alt=media&token=238843b0-1789-478e-8ba5-1ac90f515f0f', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (196, 32, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llrmn5oiwnxe37.jpg?alt=media&token=d974da70-00b4-4602-be20-afd22e68be68', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (197, 32, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llvyltp53x7oc4.jpg?alt=media&token=562a564b-ad62-49ad-a4d0-1e296a25bb64', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (198, 32, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkti1339b84hcc.jpg?alt=media&token=ee505a18-2633-4953-a383-1aec05c4afed', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (199, 33, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lminscs88u8yf1.jpg?alt=media&token=7ac60c8f-be75-48c0-bd6a-413d4c108cf2', 1)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (200, 33, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lminscsi8fmq4f.jpg?alt=media&token=45db3c72-c871-43bf-b765-91962f3702e4', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (201, 33, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7rbk0-ll1yd19lxboob8.jpg?alt=media&token=79de4d34-203a-4a2a-b979-4e1e753f170b', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (202, 33, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7rbk0-ll1yd07lgye0f9.jpg?alt=media&token=167526dd-12ad-4690-bd03-e7c2206df15c', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (203, 33, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7rbk0-ll1yd3dmwvlc32.jpg?alt=media&token=a23ad2ef-7911-4920-8ae2-388068b38b3f', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (204, 33, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7rbk0-ll1yd2mpxgk842.jpg?alt=media&token=7416a140-9a58-46d1-bc8c-9dcc9bd2ba01', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (205, 33, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lminscs8a8ted4.jpg?alt=media&token=26b8c062-8fbe-4ccf-ab24-7fe7c8377678', 2)
INSERT [dbo].[productImages] ([id], [productId], [imageUrl], [role]) VALUES (206, 33, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkti1339b84hcc.jpg?alt=media&token=245c7898-48f3-4f81-96c9-4647e5dc224e', 2)
SET IDENTITY_INSERT [dbo].[productImages] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (1, N'Áo phông nam nữ Tommy Hilfiger in vạch sọc đen trắng đỏ chữ kí quanh áo. Áo Thun Unisex Form Unisex Siêu Hot 2023', 110000, 52800, N'<p>🌿 Bảng Size: Size M :Nặng 45-55kg, Size L :Nặng 55-65 kg, Size XL:Nặng 65-75 kg, I. CAM KẾT CỦA SHOP - Sản phẩm giống hình và mô tả - Chấp nhận đổi hàng khi size không vừa trong vòng 3 ngày - Hàng có sẵn, giao hàng ngay khi nhận được đơn của quý khách - Hoàn tiền nếu sản phẩm không giống với mô tả - Chấp nhận đổi hàng khi size không vừa - Giao hàng trên toàn quốc, nhận hàng trả tiền II. HỖ TRỢ ĐỔI TRẢ THEO QUY ĐỊNH CỦA SHOPEE - Điều kiện áp dụng (trong vòng 3 ngày kể từ khi nhận sản phẩm) - Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất. 1. Trường hợp được chấp nhận: - Hàng giao sai size khách đã đặt hàng - Giao thiếu hàng 2. Trường hợp không đủ điều kiện áp dụng chính sách: - Quá 2 ngày kể từ khi Quý khách nhận hàng - Gửi lại hàng không đúng mẫu mã, không phải sản phẩm của GenZ.Sotre34 - Không thích, không hợp, đặt nhầm mã, nhầm màu,... III. MÔ TẢ SẢN PHẨM - Xuất xứ: Việt Nam - Chất liệu: chất UMI thấm hút mồ hôi tốt, thoáng mát - Đường may tỉ mỉ chắc chắc - Thiết kế: hiện đại, trẻ trung, dễ phối - Đủ size: M - L - XL (các bạn tham khảo tại bảng size nhé) ---------------------------------------------------------------------------------- ❤️ Quy định bảo hành, đổi trả đối với sản phẩm đúng quy định của Shopee 💚 Điều kiện áp dụng (trong vòng 03 ngày kể từ khi nhận sản phẩm): Hàng hoá vẫn còn mới, chưa qua sử dụng Hàng hóa hư hỏng do vận chuyển hoặc do nhà sản xuất. 💚 Trường hợp được chấp nhận: Hàng không đúng size, kiểu dáng như quý khách đặt hàng Không đủ số lượng như trong đơn hàng 💚 Trường hợp không đủ điều kiện áp dụng chính sách Đổi/Trả : Quá 03 ngày kể từ khi Quý khách nhận hàng Gửi lại hàng không đúng mẫu mã, không phải hàng của shop #oversize #unisex #freesize #streetwear #aothunnamnu #bbr #aothuncaocap #aothunamnudep #aothunnam #aothunbestquality #aothun #aothunnam #aothunnu #aothunnamnu #aothununisex #aohottrend #ao #aothun #nam #nu #form #aothunstreetwear #aothunburberrynam #aothunburberrynu #bbr #aoburberrynam #aoburberrynu #aoburberry #aophongnam #aophongnu #aoburberry</p>', N'Thành phố Hà Nội.', 0, CAST(N'2023-10-27' AS Date), 6, 2, 1, 0, 1, N'soihoang434', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyh7lg0b.jpg?alt=media&token=1e8d0d40-1ecc-435a-a467-33b81239f834')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (2, N'Áo phông nam nữ Tommy Hilfiger in vạch sọc đen trắng đỏ chữ kí quanh áo. Áo Thun Unisex Form Unisex Siêu Hot 2023', 110000, 52800, N'<p>🌿 Bảng Size: Size M :Nặng 45-55kg, Size L :Nặng 55-65 kg, Size XL:Nặng 65-75 kg, I. CAM KẾT CỦA SHOP - Sản phẩm giống hình và mô tả - Chấp nhận đổi hàng khi size không vừa trong vòng 3 ngày - Hàng có sẵn, giao hàng ngay khi nhận được đơn của quý khách - Hoàn tiền nếu sản phẩm không giống với mô tả - Chấp nhận đổi hàng khi size không vừa - Giao hàng trên toàn quốc, nhận hàng trả tiền II. HỖ TRỢ ĐỔI TRẢ THEO QUY ĐỊNH CỦA SHOPEE - Điều kiện áp dụng (trong vòng 3 ngày kể từ khi nhận sản phẩm) - Hàng hoá bị rách, in lỗi, bung chỉ, và các lỗi do vận chuyển hoặc do nhà sản xuất. 1. Trường hợp được chấp nhận: - Hàng giao sai size khách đã đặt hàng - Giao thiếu hàng 2. Trường hợp không đủ điều kiện áp dụng chính sách: - Quá 2 ngày kể từ khi Quý khách nhận hàng - Gửi lại hàng không đúng mẫu mã, không phải sản phẩm của GenZ.Sotre34 - Không thích, không hợp, đặt nhầm mã, nhầm màu,... III. MÔ TẢ SẢN PHẨM - Xuất xứ: Việt Nam - Chất liệu: chất UMI thấm hút mồ hôi tốt, thoáng mát - Đường may tỉ mỉ chắc chắc - Thiết kế: hiện đại, trẻ trung, dễ phối - Đủ size: M - L - XL (các bạn tham khảo tại bảng size nhé) ---------------------------------------------------------------------------------- ❤️ Quy định bảo hành, đổi trả đối với sản phẩm đúng quy định của Shopee 💚 Điều kiện áp dụng (trong vòng 03 ngày kể từ khi nhận sản phẩm): Hàng hoá vẫn còn mới, chưa qua sử dụng Hàng hóa hư hỏng do vận chuyển hoặc do nhà sản xuất. 💚 Trường hợp được chấp nhận: Hàng không đúng size, kiểu dáng như quý khách đặt hàng Không đủ số lượng như trong đơn hàng 💚 Trường hợp không đủ điều kiện áp dụng chính sách Đổi/Trả : Quá 03 ngày kể từ khi Quý khách nhận hàng Gửi lại hàng không đúng mẫu mã, không phải hàng của shop #oversize #unisex #freesize #streetwear #aothunnamnu #bbr #aothuncaocap #aothunamnudep #aothunnam #aothunbestquality #aothun #aothunnam #aothunnu #aothunnamnu #aothununisex #aohottrend #ao #aothun #nam #nu #form #aothunstreetwear #aothunburberrynam #aothunburberrynu #bbr #aoburberrynam #aoburberrynu #aoburberry #aophongnam #aophongnu #aoburberry</p>', N'Thành phố Hà Nội.', 3, CAST(N'2023-10-27' AS Date), 2, 1, 1, 0, 1, N'soihoang434', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0i2hkyeegkb7.jpg?alt=media&token=d5ab0a30-a4c9-46d7-8c42-46385066efd3')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (3, N'Áo Thun Burlon Chim Trắng ❤ Áo Phông Cotton Dày Dặn Dáng Rộng Nam Nữ Siêu Phẩm Cháy Phố', 50000, 24000, N'<p>Áo Thun Burlon Chim Trắng ❤ Áo Phông Cotton Dày Dặn Dáng Rộng Nam Nữ NVA502 - chất liệu: cotton co giãn - style: Hàn Quốc Oppa - diện trong các dịp: tiệc tùng, cưới hỏi, chụp hình, du lich, đi chơi, cafe cho đến hẹn hò... Xuất xứ: Việt Nam Địa chỉ sản xuất: 8b/24 - Bá Liễu - Hải Tân - TP Hải Dương HƯỚNG DẪN CHỌN SIZE - size M: 40-50kg - size L: 51-60Kg - size XL:61-69kg, (dưới 1m73) 🔰HƯỚNG DẪN BẢO QUẢN ▶Lần đầu giặt nên giặt tay và ngâm nước ấm trước khi giặt để tiệt khuẩn ( có thể bỏ qua nếu lười ) ▶Phơi trong điều kiện ánh nắng gắt từ 1-2h không nên phơi quá lâu tránh tình trạng cũ áo, áo bị nhàu ▶Nên trở ngược áo khi phơi để tránh tình trạng bay màu áo ▶Xếp gọn khi đã khô để giữ form áo được thẳng và bảo quản cho áo luôn như mới 👍 🔯NHỚ LIKE VÀ THEO DÕI SHOP NHA. ----------------------------- 🔐Có thể IB shop để được tư vấn miễn phí nhé !! #aothun #burlon #aophong #thunmy #phongmy #thunloang #phongloang #thununisex #thunnam #thunnu #phongnam #phongnu #aococtay #taylo #aotaylo #cotton</p>', N'Thành phố Hà Nội.', 0, CAST(N'2023-10-27' AS Date), 4, 1, 1, 0, 1, N'soihoang434', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk0iv5r9s2rm0b.jpg?alt=media&token=aeebe317-9841-4692-9a26-a52589874760')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (6, N'Mặt nạ hoá trang Silicon LOẠI XỊN nhiều mẫu mã và phụ kiện cực kỳ vui nhộn dành cho các tín đồ TikTok', 249000, 149000, N'<p>Mặt nạ hoá trang Silicon cực kỳ vui nhộn dành cho các tín đồ TikTok</p><p>Đặc điểm:</p><p>Được làm bằng chất liệu silicon mềm mại, không độc hại và đàn hồi, mặt nạ này rất tự nhiên, chân thực và phù hợp với hầu hết người lớn. Mặt nạ vui nhộn này có khuôn mặt xanh lá, môi vàng, mắt đen và thiết kế sống động sẽ khiến bạn trở nên tuyệt vời trong các bữa tiệc. Mặt nạ có một lỗ hở trên mí mắt để nếu bạn không thể tìm thấy mắt của mình, bạn có thể cắt lỗ bằng tay. Có rất nhiều không gian và có thể thở.</p><p>Thích hợp cho các cuộc họp mặt gia đình, nhập vai, lễ hội hóa trang, lễ hội hóa trang, Halloween, Giáng sinh, Phục sinh và các hoạt động khác.</p><p>&nbsp;</p><p>Tên sản phẩm: Mặt nạ</p><p>Chất liệu: Silicon</p><p>Các đặc trưng: Hoạt hình, không độc hại, nền bỉ, đạo cụ hóa trang</p><p>Kích thước: 32cm x 28cm x 25cm/12.6" x 11.02" x 9.84" (Xấp xỉ)</p><p>&nbsp;</p><p>Lưu ý:</p><p>Do chênh lệch cài đặt ánh sáng và màn hình, màu sắc sản phẩm có thể hơi khác so với hình ảnh.</p><p>Vui lòng cho phép sai số một chút về số đo do cách đo lường thủ công.</p><p>Lưu ý sản phẩm cao su non có mùi đặc biệt, bạn cần lau sạch trước khi sử dụng, có thể để nơi thoáng gió để khử mùi hôi.</p>', N'Tỉnh Hà Giang.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 18, 0, 2, N'wibustore', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F64b0019263a9d11fe9df39f4a13af185.jpg?alt=media&token=f8555ae9-4f53-4e02-8b60-22b72df6aebb')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (7, N'💥SIÊU HOT💥 Mũ len chùm đầu pikachu', 150000, 75000, N'<p>Mũ len chùm đầu pikachu siêu hot&nbsp;</p><p>▪️ Len móc tỉ mỉ</p><p>▪️ Freesize&nbsp;</p><p>▪️ Có 3 mẫu để lựa chọn&nbsp;</p><p>👉 Có sẵn</p><p>&nbsp;#mũ_len_pikachu #mũ_pikachu #mũ_len_chùm_đầu_pikachu</p>', N'Tỉnh Hà Giang.', 0, CAST(N'2023-10-27' AS Date), 1, 3, 8, 0, 2, N'wibustore', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fe91a7904d85af4232e35e94bf116ed11.jpg?alt=media&token=3422c5d4-40b8-4725-b2d3-c94f2354f883')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (8, N'Set 100 Cuộn Giấy Vệ Sinh In Hình Độc Đáo Tiện Dụng', 48166, 28060, N'<p>Thời gian giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày</p><p>Chào mừng bạn đến với OuRui.vn<br><br>Chi tiết sản phẩm:<br>Các đặc điểm: Giấy vệ sinh in hình tờ tiền 100 đô la Mỹ&nbsp;<br>Chi tiết sản phẩm: Kích thước: 105 * 30 mm<br>Họa tiết: Giấy vệ sinh in hình tờ 100 đô la Mỹ độc đáo tiện lợi<br>Chất liệu: giấy<br>Trọng lượng: 125 g<br><br>Gói hàng bao gồm: 1 x Cuộn giấy vệ sinh&nbsp;</p>', N'Tỉnh Bắc Kạn.', 0, CAST(N'2023-10-27' AS Date), 0, 2, 13, 0, 3, N'**Fashion**', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F93d7bf99a4acf81035ff2642332cd3dd.jpg?alt=media&token=9a47aafa-f18f-4809-a16e-f2b143bf0e9b')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (9, N'Quà tặng sinh nhật Cốc Baba 480 ML giá rẻ Cốc gốm sứ có nắp có thìa Cốc nước ngộ nghĩnh', 158000, 79000, N'<p><br>*****VIẾT THIỆP CHÚC MỪNG THEO YÊU CẦU CHO KHÁCH*****</p><p>Quà tặng sinh nhật Cốc Baba giá rẻ Cốc gốm sứ có nắp có thìa Cốc nước ngộ nghĩnh<br>Xuất xứ: Trung Quốc đại lục<br>Loại vật liệu: Gốm sứ<br>Nơi giao hàng: Tỉnh Quảng Đông<br>Phong cách: Phim hoạt hình</p>', N'Tỉnh Bắc Kạn.', 0, CAST(N'2023-10-27' AS Date), 0, 5, 13, 0, 3, N'**Fashion**', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvdx-ljk9rt4jnsk6a5.jpg?alt=media&token=add578be-ec36-4003-9109-bdd5fd92448e')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (10, N'Dép Bông Đi Trong Nhà Hình Hoạt Hình Dễ Thương', 202000, 126000, N'<p>Thời gian giao hàng dự kiến cho sản phẩm này là từ 7-9 ngày</p><p>-Chào mừng bạn đến với cửa hàng startopoele3.vn -<br><br><br>Sản phẩm hoàn toàn mới và chất lượng cao ！！！<br>☞☞☞Thông tin sản phẩm☜☜☜<br>Chất liệu: Nhung<br>Size: 35-42 EU *** Nhồi bông có độ co giãn, bông sẽ co giãn theo size chân của bạn! ! !<br>Mùa phù hợp để mang: Mùa đông<br>Phong cách: Hoạt hình<br>Ưu điểm: Giữ ấm<br><br>Xin lưu ý :&nbsp;<br>1. Hình chỉ hiển thị mẫu, do ánh sáng, môi trường, máy ảnh, các hiệu ứng khác nhau, hình ảnh hơi khác so với hàng thật.<br>2. Vui lòng cho phép sai số một chút về số đo do cách đo lường thủ công, sai số 1-2 cm, mong quý khách thông cảm.<br>3. Do vận chuyển đường dài, nếu gói hàng bạn nhận được bị hư hỏng nhẹ, vui lòng liên hệ với chúng tôi để giải quyết. Vui lòng không đánh giá tiêu cực cho chúng tôi , chúng tôi sẽ chịu trách nhiệm dưới mọi hình thức.<br><br>Đánh giá phản hồi:<br>1. Chúng tôi đánh giá cao việc bạn lựa chọn chúng tôi và khuyến khích chúng tôi làm tốt hơn. Phản hồi và đánh giá của bạn là rất quan trọng đối với chúng tôi .<br>2. Nếu bạn hài lòng với sản phẩm hoặc dịch vụ của chúng tôi , vui lòng để lại cho chúng tôi xếp hạng 5 sao.<br>3. Tuy nhiên, nếu bạn có bất kỳ câu hỏi hoặc thắc mắc nào về đơn hàng của mình, vui lòng liên hệ với chúng tôi trước khi đánh giá bất kỳ phản hồi nào, chúng tôi sẽ cố gắng hết sức để giải quyết vấn đề cho bạn.<br>4. Nếu có bất kỳ vấn đề gì, xin vui lòng liên hệ với chúng tôi đầu tiên, đừng bình luận tiêu cực, cảm ơn bạn đã hợp tác, chúng tôi sẽ luôn phục vụ bạn tận tình, chúc bạn mua sắm vui vẻ!<br><br><br>Khách hàng hãy yên tâm mua hàng, chúng tôi sẽ phục vụ tận tình!&nbsp;</p>', N'Tỉnh Bắc Kạn.', 0, CAST(N'2023-10-27' AS Date), 0, 5, 6, 0, 3, N'**Fashion**', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F89563eff21356985611d93b782321dcf.jpg?alt=media&token=e90274aa-f3a4-494c-a2f5-00237f7e5eb9')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (11, N'Tranh Mèo Tom thư pháp treo tường | Tranh VÕ TÒNG ĐẢ HỔ chế | Tranh Tọa Sơn Quan Hổ Đấu chế | Tranh Đô Rê Mon thư pháp', 199000, 159200, N'<p>LƯU Ý: Chẳng may tranh có bị cong hoặc nhăn trong quá trình vận chuyển. Quý khách chỉ cần treo lên khoảng 1-2 ngày tranh sẽ tự phẳng ạ!</p><p>=&gt; Từ 01-08-2023 tất cả các mẫu đều đã được chỉnh sửa và nâng cấp chất liệu đẹp hơn mẫu cũ. Sản phẩm mới CAM KẾT y chang trong video và hình ảnh hiện tại. Mọi đánh giá của khách hàng trước 01-08 sẽ khác so với sản phẩm hiện tại.</p><p>=&gt; Hiện nay có 1 số người ăn cắp hình ảnh của shop để đăng sản phẩm tương tự. Mong các bạn cân nhắc kĩ trước khi mua!</p><p>Tranh Treo Tường Mèo Tôm Thư Pháp Thủy Mặc: Công Tôm Báo là 1 sự kết hợp hoàn hảo giữa cổ điển và hiện đại, hứa hẹn sẽ mang đến cho bạn 1 trải nghiệm thú vị.</p><p>+ CHẤT LIỆU:<br>&nbsp;- Canvas (vải)</p><p>+ KÍCH THƯỚC:&nbsp;<br>&nbsp; &nbsp; 30x60cm</p><p>+ 1 ĐỔI 1 TRONG 7 NGÀY NẾU HÀNG LỖI</p><p>+ Hàng thủ công sản xuất tại Việt Nam</p><p>#tranhdoremonthuphap<br>#tranhvotongdaho<br>#tranhtoasonquanhodau<br>#tranhmeotomthuphap<br>#tranhmeotom<br>#congtombao<br>#tranhtreotuongmeotom<br>#tranhmeotomtreotuong<br>#tranhtomthuymac<br>#tranhtreotuong</p>', N'Tỉnh Hà Giang.', 0, CAST(N'2023-10-27' AS Date), 0, 2, 13, 0, 5, N'Ngộ Decor 1997', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lmc1kb3usu73fc.jpg?alt=media&token=72e694e5-2af4-4dc9-ab82-9b23fb5a3478')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (14, N'Áo thun HIGHMODE "ADU VAI L**" - Form Oversize, 100% cotton, unisex nam nữ', 210000, 180000, N'<p>&gt; Áo thun HIGHMODE "ADU VAI L**"<br>Thiết kế và sản xuất độc quyền bởi HIGHMODE<br>_________________________<br>👕 HƯỚNG DẪN CHỌN SIZE ÁO<br>- S: Chiều cao bé hơn 155(cm), cân nặng dưới 45<br>- M: Chiều cao từ 155 - 163(cm), cân nặng 45 - 54(kg)<br>- L: Chiều cao từ 163 - 170(cm), cân nặng 54 - 73(kg)<br>- XL: Chiều cao từ 170 - 180(cm), cân nặng 73 - 85(kg)<br>- XXL: Chiều cao từ 180 - 190(cm), cân nặng 85 - 90++(kg)<br>Áo thun Form Oversize, hãy chọn lùi 1 size nếu muốn mặc fit người hơn hoặc tăng 1 size nếu muốn mặc rộng; nếu phân vân hãy nhắn tin Highmode để nhận tư vấn thêm.<br>_________________________<br>ℹ️ THÔNG TIN ÁO<br>- Chất liệu: 100% Cotton định lượng 230gsm co giãn 2 chiều<br>- Màu sắc: Đen<br>- Form: Boxy, Streetwear Local brand<br>- Thiết kế: Độc quyển bởi Highmode, In PET chuyển nhiệt&nbsp;<br>- Bảo quản: Giặt với nước lạnh, không dùng thuốc tẩy, tránh là, ủi lên bề mặt hình in&nbsp;<br>_________________________<br>🌎 CHÍNH SÁCH ĐỔI/TRẢ ÁO<br>- Đổi/Trả áo miễn phí nếu có lỗi sản xuất, giao nhầm hàng trong vòng 7 ngày từ khi nhận hàng<br>- Hỗ trợ đổi Size trong vòng 7 ngày nếu sản phẩm không vừa&nbsp;<br>- Sản phẩm còn nguyên vẹn, chưa giặt và không dơ bẩn bởi những tác nhân bên ngoài sau khi mua hàng<br>* Nếu có bất kì vấn đề gì hãy nhắn tin Highmode để được xử lý trước khi đánh giá sản phẩm, xin cảm ơn khách hàng^^</p>', N'Thành phố Hà Nội.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 1, 0, 6, N'HIGHMODE STREETWEAR OFFICIAL', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lg6646n5dp4a04.jpg?alt=media&token=e072183b-a1c9-4119-9b9d-dacc331a0c04')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (15, N'Bàn Phím Cơ Keychron K6 Pro - Bàn Phím Custom QMK/VIA', 2490000, 2050000, N'<p>🌟𝗠𝗘𝗧𝗔 𝗚𝗘𝗔𝗥 - High End &amp; Set Up Gear<br>✨𝐊𝐄𝐘𝐂𝐇𝐑𝐎𝐍 𝐊𝟔 𝐏𝐑𝐎 - Đơn Giản, Nhỏ Gọn và Tinh Tế<br>Nếu Bạn là người di chuyển nhiều mà đã quen dùng phím cơ thì xin chúc mừng, bạn đang ở đúng bài đăng rồi đấy.<br>Với 𝐊𝐞𝐲𝐜𝐡𝐫𝐨𝐧 nói chung và 𝐊𝐞𝐲𝐜𝐡𝐫𝐨𝐧 𝐊𝟔 𝐏𝐫𝐨 nói riêng, sự tối giản và tinh tế có lẽ sẽ là ưu điểm lớn nhất, khiến nó có nét riêng giữa một rừng phím cơ dưới 3 triệu đồng.<br>Với cân nặng vỏn vẹn 600g (đã tính cả viền Nhôm), sự nhẹ nhàng khi mang 𝐊𝐞𝐲𝐜𝐡𝐫𝐨𝐧 𝐊𝟔 𝐏𝐫𝐨 bên mình sẽ khiến bạn phải cảm thấy bất ngờ. Kết hợp với layout 65% gọn nhẹ, chúng ta sẽ có thể cất gọn chiếc phím vào gần như mọi loại balo để đem theo đi khắp nơi.<br>👉𝐊𝐞𝐲𝐜𝐡𝐫𝐨𝐧 𝐊𝟔 𝐏𝐫𝐨 là một giải pháp tuyệt vời cho làm việc đa nhiệm. Hỗ trợ kết nối không dây với tối đa 3 thiết bị thông qua Broadcom Bluetooth 5.1 ổn định.<br>&nbsp;👉𝐊𝟔 𝐏𝐫𝐨 phiên bản nâng cấp của K6 với sự hỗ trợ của phần mềm QMK / VIA mang đến khả năng tùy chỉnh vô tận cho mọi quy trình làm việc linh hoạt.<br>&nbsp;👉𝐊𝟔 𝐏𝐫𝐨 đã được tái thiết kế với lớp foam tiêu âm được bổ sung khiến âm thanh gõ dễ chịu.<br>&nbsp;👉Miếng đệm phía dưới bằng silicon dày và plate thép mang đến khả năng phản hồi nhanh, tăng cường độ ổn định khi 𝐊𝟔 𝐏𝐫𝐨 đặt trên bàn làm việc.<br>&nbsp;👉𝐊𝐞𝐲𝐜𝐡𝐫𝐨𝐧 𝐊𝟔 𝐏𝐫𝐨 được tích hợp sẵn Hot-swap trên PCB. Nhờ đó bạn có thể dễ dàng thay thế Switch một các nhanh chóng mà không cần rã hàn.<br>&nbsp;👉𝐊𝐞𝐲𝐜𝐡𝐫𝐨𝐧 𝐊𝟔 𝐏𝐫𝐨 sử dụng switch thế hệ mới từ Gateron tăng sự ổn định và nâng cao cảm giác tại các đầu ngón tay của bạn.<br>🌿Khác với nhiều sản phẩm đi trước của Keychron như K1, K3 hay K4, 𝐊𝐞𝐲𝐜𝐡𝐫𝐨𝐧 𝐊𝟔 𝐏𝐫𝐨 từ ngày đầu xuất hiện đã thu hút đáng kể sự chú ý từ cộng đồng phím cơ bấy giờ cho bạn thỏa sức đắm mình trong thế giới custom. Vậy còn ngại gì mà không đến ngay 𝐌𝐞𝐭𝐚 𝐆𝐞𝐚𝐫 để trải nghiệm và nhận ngay ưu đãi cực shock trong dịp siêu sale lớn nhất trong năm thôi nèo !!!<br>---------------------------------------------<br>HƯỚNG DẪN SỬ DỤNG<br>- Kết nối bluetooth: Gạt công tắc, FN1 + Q ( 4 giây )<br>- Thay đổi chế độ đèn: FN1 + A&nbsp;<br>- Bật/ tắt đèn: FN1 + caps lock<br>- Tăng/ giảm độ sáng: FN + S/X<br>% pin chỉ báo khi sạc: Khi pin dưới 15% đèn pin báo nhấp nháy màu đỏ. Đèn đỏ chỉ sáng khi đang sạc.<br>Thời gian sạc khoảng 3 tiếng đèn sẽ chuyển xanh<br>Lưu ý khi sạc: Keychron K6 pro chỉ hỗ trợ sạc tới 5V 2A. Khi sạc quá công suất sẽ gây cháy mạch. Cửa hàng KHỒNG CHỊU TRÁCH NHIỆM khi khách hàng sạc sai cách.<br>CHÍNH SÁCH MUA HÀNG<br>✅ Cam kết bán hàng chính hãng 100%<br>✅ Bảo hành 12 Tháng, Đổi mới trong 7 ngày đầu nếu có lỗi NSX<br>🚀🚀Ship toàn VŨ TRỤ🚀🚀</p>', N'Thành phố Hà Nội.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 10, 0, 7, N'Meta Gear Oficial', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfvywlysa9knd6.jpg?alt=media&token=1a974271-b367-4ef2-8494-4fab84c54a0d')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (16, N'Bàn Phím Cơ Keychron V1 - Full Knob - Bàn Phím Custom QMK/VIA', 2190000, 1925000, N'<p>🌟𝗠𝗘𝗧𝗔 𝗚𝗘𝗔𝗥 - High End &amp; Set Up Gear 📣Keychron V1 - Dấu ấn của thế giới bàn phím cơ custom 📣𝐊𝐞𝐲𝐜𝐡𝐫𝐨𝐧 𝐕𝟏 - một sự lựa chọn tuyệt vời để bạn tiếp cận thế giới bàn phím custom. Với bố cục 75% nhỏ gọn, hỗ trợ QMK/VIA, đệm silicon cách âm và keycap PBT Double-shot, Keychron V1 được thiết kế để mang lại sự thoải mái khi đánh máy và tăng năng suất làm việc. 🍀 Với bố cục 75% tinh gọn hơn so với bàn phím cơ thông thường, lại hỗ trợ thêm cả QMK/VIA, đệm silicon cách âm tuyệt vời và Keycaps Double-shot PBT, bàn phim cơ custom Keychron V1 hứa hẹn sẽ mang lại sự thoải mái trên trải nghiệm gõ cũng như giúp tăng năng suất cho công việc 🍀 Bàn phím cơ Keychron V1 được tinh chỉnh toàn diện cho việc anh em có thể custom mọi thứ luôn! Tất cả những thành phần cấu tạo nên chiếc bàn phím cơ này đều dễ dàng tuỳ biến theo sở thích cá nhân như mod bất kỳ bộ phận nào với trải nghiệm gõ vô cùng thoả mãn như cách mà anh em muốn. 🍀 Với Knob đa năng cho việc điều chỉnh - Keychron V1 cho phép các anh em tuỳ chỉnh Knob hoặc lệnh Macro theo sở thích trên núm xoay: phóng to/nhỏ, điều chỉnh độ sáng màn hình, âm thanh, kích thích cọ (đối với Designer), chọn hình ảnh/video hoặc màu đèn nền... thông qua phần mềm VIA một cách đơn giản như đang giỡn! 🍀 Người dùng có thể dễ dàng chuyển đổi bố cục cũng như các chức năng trên bàn phím từ macOS sang Windows hay từ Windows sang macOS trên V1 chỉ bằng một nút gạt. 🍀 Hỗ trợ đầy đủ từ phần mềm QMK và VIA nâng cấp khả năng đa dạng của V1 cho phép người dùng tự lập trình và chính sửa lại từng phím, tuỳ chỉnh cho bố cục bàn phím kể cả các phím tắt, núm xoay và thậm chí cả hiệu ứng đèn nền… 🍀 Hot-swap được gắn sẵn trên PCB, vì vậy người dùng có thể cài đặt hoặc thay đổi các Switch mà không rã hàn phím. Ngoài ra, PCB còn hỗ trợ cho cả Switch 3 pin hay 5 pin MX với hầu hết các hãng Switch thứ 3 trên thị trường hiện nay. 🍀 Với thiết kế được gọi là South-facing RGB, Keychron V1 chiếu sáng tốt hơn so với đèn nền bàn phím từ góc của người gõ với các Keycap PBT (non-shine-through) hiển thị tốt hơn. Hơn thế nữa, South-facing RGB vẫn hiện thị tốt khi anh em cài đặt các Keycap thay thế cho Profile OEM hoặc Cherry trên bàn phím. 🍀 Thiết kế bắt ít cố định cho PCB giúp tăng độ ổn định và dễ dàng hơn trong việc thay đổi và nâng cấp bàn phím cơ Keychron V1. Sự khéo léo chính xác này làm cho các bộ ổn định ổn định hơn và ít rung lắc hơn với các phím Space bar, Shift, Enter, Delete… Keychron V1 cũng hỗ trợ các bộ Stabilizers cho bên thứ ba như Cherry hoặc Durock HƯỚNG DẪN SỬ DỤNG - Fn + Q : Chuyển chế độ đèn - Fn + tab : Bật tắt đèn bàn phím - Fn + W/S : Tăng giảm độ sáng CHÍNH SÁCH MUA HÀNG ✅ Cam kết bán hàng chính hãng 100% ✅ Bảo hành 12 Tháng, Đổi mới trong 7 ngày đầu nếu có lỗi NSX 🚀🚀Ship toàn VŨ TRỤ🚀🚀</p>', N'Thành phố Hà Nội.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 10, 0, 7, N'Meta Gear Oficial', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lful44proy22d8.jpg?alt=media&token=2922ff95-7dd3-499f-a4e3-f5b1cb3423c0')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (17, N'Akko Switch V3 Pro - Cream Yellow - Piano Pro - 45 Switch - 5 Pin dùng cho bàn phím cơ', 259000, 169000, N'<p>🌟𝗠𝗘𝗧𝗔 𝗚𝗘𝗔𝗥 - High End &amp; Set Up Gear<br>-----------------------------------------------------------<br>💎AKKO Switch V3 pro – Cream Yellow Pro là một dòng switch đời mới được AKKO kết hợp cùng nhà sản xuất GOTT nhằm thỏa mãn đam mê trải nghiệm cảm giác gõ phím của người dùng. Một điểm khác biệt lớn nhất giữa AKKO switch V3 và AKKO switch V2 là lò xo. Lò xo có biên độ dày hơn của AKKO switch V3 hứa hẹn sẽ đem lại trải nghiệm độc đáo và khác biệt cho người dùng. Điểm đặc biệt của dòng switch mới này chính là chất liệu POM / PC / PA giúp âm phát ra khi gõ khác biệt với các phiên bản trước đó.&nbsp;<br>🚩THÔNG SỐ CHI TIẾT CỦA AKKO SWITCH V3 – CREAM YELLOW&nbsp;<br>✔ Type: Linear, 5 pin&nbsp;<br>✔ Operating Force: 50 ± 5gf&nbsp;<br>✔ End Force: 58 ± 5gf&nbsp;<br>✔ Total Travel: 3.3mm&nbsp;<br>✔ Pre-Travel: 2.0 ± 0.6mm<br>------------------------------------------------------------<br>💎AKKO Switch V3 pro – Cream Blue Pro là một dòng switch đời mới được AKKO kết hợp cùng nhà sản xuất GOTT nhằm thỏa mãn đam mê trải nghiệm cảm giác gõ phím của người dùng. Một điểm khác biệt lớn nhất giữa AKKO switch V3 và AKKO switch V2 là lò xo. Lò xo có biên độ dày hơn của AKKO switch V3 hứa hẹn sẽ đem lại trải nghiệm độc đáo và khác biệt cho người dùng. Điểm đặc biệt của dòng switch mới này chính là chất liệu POM / PC / PA giúp âm phát ra khi gõ khác biệt với các phiên bản trước đó.<br>🚩THÔNG SỐ CHI TIẾT CỦA AKKO SWITCH V3 – CREAM BLUE<br>&nbsp; ✔ Type: Tactile, 5 pin<br>&nbsp; ✔ Operating Force: 45 ± 10gf<br>&nbsp; ✔ Tactile Force: 55 ± 10gf<br>&nbsp; ✔ Tactile Position: 0.1mm<br>&nbsp; ✔ Total Travel: 3.3mm<br>&nbsp; ✔ Pre-Travel: 2.2 ± 0.6mm<br>-----------------------------------------------------------<br>💎AKKO Switch V3 pro - Piano là dòng switch sinh ra để thỏa mãn đam mê trải nghiệm cảm giác gõ phím của bạn. Switch đã được lube tay ngay từ nhà máy sản xuất để tạo nên cảm giác bấm mượt mà khiến cho trải nghiệm gõ độc đáo tựa như đàn piano. Đây cũng là switch thứ 2 của AKKO.<br>🚩THÔNG SỐ CHI TIẾT CỦA AKKO SWITCH V3 PRO - PIANO&nbsp;<br>✔Linear switch, 5 pin<br>✔Operating Force: 48gf ± 5gf<br>✔Bottom-Out Force: 53gf ± 5gf<br>✔Total Travel: 3.5 ± 0.3mm<br>✔Pre-Travel: 1.9 ± 0.3mm<br>✔ Switch đã được lube sẵn bằng tay từ nhà máy<br>-----------------------------------------------------------</p>', N'Thành phố Hà Nội.', 0, CAST(N'2023-10-27' AS Date), 0, 3, 10, 0, 7, N'Meta Gear Oficial', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7r98o-lm5kqi0g39i7ad.jpg?alt=media&token=88be3688-22e4-4df3-a3b5-36ea7bb6cbdc')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (18, N'[Có thể thay tròng] Kính Vincii.gallery - Kính mắt Vincii The Mince II Series gọng Acetate cao cấp, lõi TItanium', 720000, 0, N'<p>Sau sự thành công của Series The Mince, Vincii quyết định mang tới 1 mẫu kính mới “The Mince II” với cải tiến hơn so với bản cũ. Vẫn giữ được form dáng phù hợp với hầu hết mọi dáng mặt, “Mince II” sở hữu bảng màu độc đáo hơn với sự kết hợp giữa bóng và lì ở chất liệu gọng kính cùng tông màu trung tính, có thể kết hợp với mọi outfit. “The Mince II” có thể vừa sử dụng làm kính cận, vừa sử dụng làm kính râm bởi sự tiện lợi nhưng vẫn mang tính thời trang của nó.</p><p>x3 độ fashion khi Custom cùng các lens kính màu</p><p>Dòng sản phẩm Vincii The Mince II Series hiện instock với 3 phiên bản màu: Black, Trans Navy và Trans Smoke</p>', N'Thành phố Hà Nội.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 15, 0, 8, N'vincii.gallery_', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgg4977nfz7b96.jpg?alt=media&token=458551b3-534f-4125-959a-39f2a575abf2')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (19, N'[Có thể thay tròng] Kính Vincii.gallery - Kính mắt Vincii The Mince Series gọng Acetate cao cấp', 700000, 0, N'<p>“ The Mince Series “ là 1 trong những mẫu kính nằm trong Top Best Seller của VINCII. Kể từ ngày ra mắt em nó vẫn giữ vững được phong độ khi sở hữu dáng kính thanh mảnh đầy mê hoặc, phù hợp với hầu hết mọi khuôn mặt. The Mince sẽ là sự lựa chọn hoàn hảo cho outfit của bạn.</p><p>x3 độ fashion khi Custom cùng các lens kính màu</p><p>Dòng sản phẩm The Mince Series hiện instock với 4 phiên bản màu: Grey, M.Green, Mix và Champagne&nbsp;</p>', N'Thành phố Hà Nội.', 0, CAST(N'2023-10-27' AS Date), 0, 8, 15, 0, 8, N'vincii.gallery_', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lgl8nimupisqa4.jpg?alt=media&token=3db68565-e7b8-4c6a-8b97-c5c93013e1ba')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (20, N'Áo Sơ Mi Nam Nữ Dài Tay Chất Vải Nhung Tăm Kiểu Dáng Basic Dài Tay Oversize Đen', 315000, 159000, N'<p><img src="https://down-vn.img.susercontent.com/file/vn-11134208-7qukw-lfc3an7wu4xw72" width="873" height="873"></p><p><br><img src="https://down-vn.img.susercontent.com/file/vn-11134208-7qukw-lfc3an7wwy2s04" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/vn-11134208-7qukw-lfc3an7wycn857" width="873" height="873"></p><p>&nbsp;</p><p>⏩ Cách chọn size: Shop có bảng size mẫu. Bạn NÊN INBOX, cung cấp chiều cao, cân nặng để SHOP TƯ VẤN SIZE.</p><p>⏩⏩ Bảng size mẫu Gman Menswear</p><p>&nbsp;</p><p>Size M: Nặng 45-53kg ; Cao &lt;1m65</p><p>Size L: Nặng 54-61kg ; Cao &lt;1m70</p><p>Size XL: Nặng 62-70kg ; Cao &lt;1m75</p><p>Size XXL: Nặng 71-80kg ; Cao &lt;1m80</p><p>&nbsp;</p><p>Lưu ý: Đây là bảng thông số chọn size cơ bản, tùy thuộc và vào mỗi người mà có thể +/- 1 Size</p><p>&nbsp;</p><p>* Chính sách và điều kiện đổi trả của Gman Menswear:</p><p>&nbsp;</p><p>+ Cam kết chất lượng và mẫu mã sản phẩm giống với hình ảnh.</p><p>&nbsp;</p><p>+ Cam kết được đổi trả hàng trong vòng 7 ngày.</p><p>&nbsp;</p><p>+ Hàng phải còn mới và chưa qua sử dụng</p><p>&nbsp;</p><p>+ Sản phẩm bị lỗi do vận chuyển và do nhà sản xuất</p><p>&nbsp;</p><p>📌 LƯU Ý: Khi quý khách có gặp bất kì vấn đề gì về sản phẩm và vận chuyển đừng vội đánh giá mà hãy liên hệ Shop để đc hỗ trợ 1 cách tốt nhất nhé.</p><p>#aosominu #aosominam #aosomi #aosominamtayngan #aosominuformrong #aosomitayngan #aosominhungtam #aosomitrangnu #aosominamformrong #aosominukieu #aosominutayngan #aosomikieu #aosomitrang #aosomitrangnam #aosomikieunu #aosominucongso #aosominamtaydai #aosomitayngannu #aosomitrangnuformrong</p>', N'Tỉnh Sơn La.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 2, 0, 9, N'Gman Menswear', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lfc2s6jnjng5f7.jpg?alt=media&token=829071ef-6e41-4593-926e-6bf229dbfc31')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (21, N'Áo Thun Dài Tay Cổ Tròn Màu Trơn Đơn Giản Thời Trang Cho Nam', 235000, 141000, N'<p>♥Chào mừng đến với STAY CHIC♥</p><p>&nbsp;</p><p>Chào mừng bạn đến tư vấn dịch vụ khách hàng về vấn đề sản phẩm, chúng tôi sẽ giải đáp thỏa đáng cho bạn &nbsp; &nbsp;</p><p>&nbsp;</p><p>🔊Chúng tôi chỉ muốn mang đến cho bạn những sản phẩm tốt nhất, hợp thời trang nhất, chất lượng tốt nhất và rẻ nhất.</p><p>🔊Thời trang là một phần của không khí hàng ngày và nó luôn thay đổi theo mọi sự kiện.!</p><p>🛒Hãy bắt đầu mua sắm vui vẻ!</p><p><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkonukjsn519ed" width="873" height="873"></p><p><br><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkonukjsojlpdf" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkonukjspy650c" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkooilisjqgs7e" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkooilisjqkd11" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkooilisl54t36" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkooilismjp9ac" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkooilispcu5bb" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkooilisqreldb" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkooiliss5z14f" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkooilisny9p89" width="873" height="873"><img src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkooilmeegjh65" width="873" height="873"></p><p>🔔Mẹo mua:</p><p>📏. Kích thước của quần áo được đo bằng tay, xin vui lòng cho phép (±) sai số 3 cm</p><p>📷. Do sự khác biệt giữa các màn hình, hình ảnh có thể không phản ánh màu sắc thực tế của mặt hàng</p><p>🎁. Tất cả các mặt hàng có trong kho. Chúng tôi gửi từ nước ngoài. Chúng tôi sẽ giao hàng trong vòng 2 ~ 3 ngày</p><p>🥰.Khách hàng thân mến, nếu bạn có bất kỳ câu hỏi nào về sản phẩm của chúng tôi, xin vui lòng cho chúng tôi biết. Chúng tôi sẽ liên hệ lại với bạn trong thời gian sớm nhất. cảm ơn</p><p>🚚. Trong trường hợp bình thường, bạn sẽ nhận được hàng trong khoảng 6-13 ngày.</p><p>⭐. Nếu bạn hài lòng với sản phẩm và dịch vụ của chúng tôi, vui lòng để lại đánh giá và hình ảnh 5 sao. Nếu bạn không hài lòng với giao dịch mua này, đừng lo lắng về việc đưa ra đánh giá xấu cho chúng tôi trước. Bạn có thể liên hệ với chúng tôi trước, và chúng tôi sẽ xử lý nó cho bạn. Vui lòng hiểu rằng quá trình xử lý không chính xác trong khoảng thời gian.</p><p>&nbsp;</p><p>Stay CHIC mang đến cho bạn màu sắc của thế giới, dịch vụ trước và sau bán hàng hoàn hảo, để tất cả những ai biết đến chúng tôi đều cảm động và thu hoạch ~ ~</p><p>&nbsp;</p><p>##STAY Chic thời trang thực sự rất đơn giản</p>', N'Tỉnh Sơn La.', 0, CAST(N'2023-10-27' AS Date), 0, 11, 2, 0, 9, N'Gman Menswear', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fsg-11134201-7qvf2-lj3u6fbeqarkea.jpg?alt=media&token=ea440943-3bf7-45d5-94ae-7d3569ac5956')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (22, N'Áo Thun Tay Dài Nam Nữ Flexible Raglan, Áo Giữ Nhiệt Cotton 100% Bản Daily FREDO', 350000, 179000, N'<p>* THÔNG TIN SẢN PHẨM:</p><p>- Chất liệu: 100% Cotton 250GSM</p><p>- Size: M - L - XL</p><p>- Form: Ovesize dạng chữ A</p><p>- Điểm nhấn: Vạt áo xẻ tà</p><p>&nbsp;</p><p><img src="https://down-vn.img.susercontent.com/file/vn-11134208-7r98o-ln42xwjcjpp492" width="873" height="1163"></p><p><br>&nbsp;</p><p>* HƯỚNG DẪN BẢO QUẢN:</p><p>- Không giặt, sấy quá nóng ( &lt; 40 Độ )</p><p>- Không dùng hóa chất, thuốc tẩy</p><p>- Nên phơi ở những nơi nắng nhẹ, thoáng gió</p><p>- Không giặt chung đồ trắng với quần áo màu</p><p>&nbsp;</p><p>* 5 ĐƯỢC CỦA KHÁCH HÀNG KHI MUA SẮM TẠI FREDO:</p><p>- Được đổi trả sản phẩm trong 30 ngày nếu nhận hàng không ưng ý</p><p>- Được trải nghiệm mua hàng Online tiện lợi</p><p>- Được đội ngũ chăm sóc khách hàng 24/24 (như người tình của bạn 😊)</p><p>- Được nhiều chương trình khuyến mãi và quà tặng cho khách hàng thân thiết</p><p>- Được đóng gói đúng tiêu chuẩn và gửi hàng nhanh ngay sau khi xác nhận đơn</p><p>&nbsp;</p><p>* CHÍNH SÁCH ĐỔI TRẢ SẢN PHẨM</p><p>1. Nếu sản phẩm bị lỗi (rách, hỏng..) hoặc sai khác (giao sai mẫu, sai phân loại trên đơn hàng) shop sẽ hỗ trợ đổi trả hàng</p><p>cho khách)</p><p>2. Nếu sản phẩm nhận được đúng phân loại và mẫu mã đơn hàng, nhưng khách hàng sử dụng không vừa hoặc muốn đổi lại size hoặc sang mẫu khác, shop sẽ hỗ trợ đổi hàng 2 chiều cho khách hàng</p><p>3. Trường hợp shop gửi thiếu sản phẩm: vui lòng giữ nguyên bao bì, có video quay khi unbox đơn hàng. Nếu bạn thấy sản phẩm chất lượng đúng mô tả và hài lòng với đơn hàng, hãy đánh giá cho Fredo biết nha!</p><p>&nbsp;</p><p>LƯU Ý:</p><p>- Nếu chưa chọn được size có thể INBOX trực tiếp các thông số cơ thể cho shop để được tư vấn size kĩ hơn</p><p>- Khi các bạn gặp bất kì vấn đề gì về sản phẩm, đừng vội đánh giá mà hãy INBOX để Fredo hỗ trợ bạn nhé!</p><p>- Mọi vấn đề thắc mắc về sản phẩm hoặc các vần đề phát sinh về hàng hóa xin quý khách vui lòng liên hệ qua phần Chat.</p><p>&nbsp;</p><p>Cảm ơn cậu vì đã tin tưởng và lựa chọn Fredo. Chúc cậu một ngày mới tốt lành và có những trải nghiệm tuyệt vời cùng Fredo nha!</p><p>&nbsp;</p><p>#aothunnamtaydai #ao_thun_nam #aothunnam #aophongnam #ao_phong_nam #aophongnam #aothuncotton #aothunbasic #aothuntayngan &nbsp;#aothunnam #fredo</p>', N'Tỉnh Thái Nguyên.', 0, CAST(N'2023-10-27' AS Date), 0, 5, 2, 0, 10, N'FREDO STUDIO', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lilbahue67yq29.jpg?alt=media&token=c7b9e1d4-f806-48cc-a221-864eb0fce501')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (23, N'ÁO KHOÁC NHẸ NAM NỮ 2 LỚP THU ĐÔNG FOM RỘNG HỌA TIẾT PHỐI VIỀN SỌC TAY ĐƠN GIẢN HÓT TRIEND 2023', 158000, 89000, N'<p>Bên trong áo có lót dù thoáng khí mát mẻ, tạo cảm giác vận động thoải mái khi mặc.<br>Đường chỉ may sắc sảo, cực kì chắc chắn &amp; 2 lớp dày dặn.<br>Đảm bảo không ra màu, không phai màu &amp; không nhăn.<br>Dễ dàng Mix cùng nhiều kiểu trang phục yêu thích hằng ngày &amp; tự tin đi đến mọi nơi mọi lúc với phong cách chất lừ của riêng bạn.<br>Hàng tại xưởng không qua trung gian, Hàng luôn có sẵn.<br>Khách mua hàng được tặng các phần quà bất ngờ cho các đơn hàng ngẫu nhiên đặc biệt.<br>Hàng chuẩn đẹp như hình (cam kết hình chụp thật 100%)..<br>Shop luôn sẵn lòng hỗ trợ tư vấn giải đáp thắc mặc của bạn khi cần.<br>Xuất xứ: Việt Nam</p><p><br>SIZE GỒM 3 SIZE : M ,L ,XL</p><p><br>size M : dành cho những bạn từ 43 đến 49kg &lt; 1m 60</p><p><br>size L : dành cho những bạn từ 50 đến 58kg &lt;1m7</p><p><br>size xl :dành cho những bạn từ 58 đến 69kg &lt; 1m 76<br>shop : ao.khoac.nam.nu.gia.si<br>địa chỉ 17/9a/6 đường 22 kp7 linh đông thủ đức hồ chí minh<br>xuất xứ việt nam&nbsp;</p>', N'Tỉnh Thái Nguyên.', 0, CAST(N'2023-10-27' AS Date), 0, 11, 2, 0, 10, N'FREDO STUDIO', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2F119fc3959add8c7039ba99f84e06169d.jpg?alt=media&token=a5b1e9ec-1c6f-43dd-96c3-57f1fb7e68ed')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (24, N'Áo Hoodie Cotton IFXBYT áo dài tay form rộng in hình boy phố unisex 100% cotton-B0093', 360000, 190000, N'<p>Thời gian giao hàng ước tính cho sản phẩm này là 3-7 ngày</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Thông tin sản phẩm Áo hoodie Unisex IFXBYT</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>- - Chất liệu: 100 - Chất liệu: 100% Cotton, vải mềm, chất vải mịn, thoáng mát, không xù.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>- - Đường may chuẩn, tỉ mỉ, chắc chắn.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>- - Mặc ở nhà, đi chơi hay tập thể thao. Phù hợp với nhiều loại trang phục.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Thiết kế hiện đại, trẻ trung và năng động. Dễ dàng kết hợp. Biểu đồ kích thước:</p><p>&nbsp;</p><p>Chiều dài M: 69 Ngực: 116 Chiều dài tay: 56 Chiều rộng vai: 60</p><p>&nbsp;</p><p>Chiều dài L: 71 Ngực: 120 Chiều dài tay: 57 Chiều rộng vai: 62</p><p>&nbsp;</p><p>Chiều dài XL: 69 Ngực: 124 Chiều dài tay: 58 Chiều rộng vai: 64</p><p>&nbsp;</p><p>Chiều dài 2XL: 69 Ngực: 128 Chiều dài tay: 59 Chiều rộng vai: 66</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Do ánh sáng, sẽ có một số khác biệt về màu sắc, xin vui lòng thông cảm!</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Lưu ý: Đơn vị đo: cm. Do các phương pháp đo lường khác nhau, xin vui lòng cho phép lỗi 1-3 cm, lỗi không phải là một vấn đề chất lượng. Do sự khác biệt về cài đặt ánh sáng và màn hình, màu sắc của mặt hàng có thể hơi khác so với hình ảnh. Vui lòng hiểu và cân nhắc khi đặt hàng!</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Dịch vụ khách hàng</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với bộ phận chăm sóc khách hàng. Đôi khi, đại diện dịch vụ khách hàng có thể phản hồi chậm do lượng tin nhắn tìm kiếm lời khuyên. Hãy kiên nhẫn chờ đợi. Chúng tôi sẽ tích cực giải quyết các mối quan tâm của bạn.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Nếu bạn có bất kỳ vấn đề nào với sản phẩm bạn nhận được, bạn có thể liên hệ với bộ phận chăm sóc khách hàng. Chúng tôi rất vui khi giải quyết vấn đề của bạn.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Xin đừng vội đưa ra những đánh giá tiêu cực.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Chúng tôi sẽ cung cấp cho bạn dịch vụ sau bán hàng tốt nhất.</p><figure class="image"><img style="aspect-ratio:873/873;" src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-lkkceg4bl3nge5" width="873" height="873"></figure>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 2, 0, 11, N'IFXBYT', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lkkqe3ybsyik05.jpg?alt=media&token=816a4ed0-a687-45bb-af8f-a4a1af689f92')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (25, N'Áo Hoodie Cotton nam IFXBYT áo dài tay form rộng basic in hình unisex 100% cotton-Y0233', 305000, 199000, N'<p>Thời gian giao hàng ước tính cho sản phẩm này là 3-7 ngày</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Thông tin sản phẩm Áo hoodie Unisex IFXBYT</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>- - Chất liệu: 100 - Chất liệu: 100% Cotton, vải mềm, chất vải mịn, thoáng mát, không xù.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>- - Đường may chuẩn, tỉ mỉ, chắc chắn.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>- - Mặc ở nhà, đi chơi hay tập thể thao. Phù hợp với nhiều loại trang phục.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Thiết kế hiện đại, trẻ trung và năng động. Dễ dàng kết hợp. Biểu đồ kích thước:</p><p>&nbsp;</p><p>Chiều dài M: 69 Ngực: 116 Chiều dài tay: 56 Chiều rộng vai: 60</p><p>&nbsp;</p><p>Chiều dài L: 71 Ngực: 120 Chiều dài tay: 57 Chiều rộng vai: 62</p><p>&nbsp;</p><p>Chiều dài XL: 69 Ngực: 124 Chiều dài tay: 58 Chiều rộng vai: 64</p><p>&nbsp;</p><p>Chiều dài 2XL: 69 Ngực: 128 Chiều dài tay: 59 Chiều rộng vai: 66</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Do ánh sáng, sẽ có một số khác biệt về màu sắc, xin vui lòng thông cảm!</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Lưu ý: Đơn vị đo: cm. Do các phương pháp đo lường khác nhau, xin vui lòng cho phép lỗi 1-3 cm, lỗi không phải là một vấn đề chất lượng. Do sự khác biệt về cài đặt ánh sáng và màn hình, màu sắc của mặt hàng có thể hơi khác so với hình ảnh. Vui lòng hiểu và cân nhắc khi đặt hàng!</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Dịch vụ khách hàng</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với bộ phận chăm sóc khách hàng. Đôi khi, đại diện dịch vụ khách hàng có thể phản hồi chậm do lượng tin nhắn tìm kiếm lời khuyên. Hãy kiên nhẫn chờ đợi. Chúng tôi sẽ tích cực giải quyết các mối quan tâm của bạn.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Nếu bạn có bất kỳ vấn đề nào với sản phẩm bạn nhận được, bạn có thể liên hệ với bộ phận chăm sóc khách hàng. Chúng tôi rất vui khi giải quyết vấn đề của bạn.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Xin đừng vội đưa ra những đánh giá tiêu cực.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Chúng tôi sẽ cung cấp cho bạn dịch vụ sau bán hàng tốt nhất.</p><p>&nbsp;</p><figure class="image"><img style="aspect-ratio:873/873;" src="https://down-vn.img.susercontent.com/file/vn-11134208-7qukw-lk7sdga1hvcye3" width="873" height="873"></figure>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 2, 0, 11, N'IFXBYT', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fvn-11134207-7qukw-lk7litqw6wmse4.jpg?alt=media&token=7985ac63-c6a2-40f7-a2db-a786ce1476b2')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (26, N'Áo sweater nam IFXBYT áo khoác nỉ thời trang in hình unisex 100% cotton-V0018', 305000, 169000, N'<p>&nbsp;&nbsp;&nbsp;&nbsp;Thời gian giao hàng ước tính cho sản phẩm này là 3-7 ngày</p><p>&nbsp;</p><p>Thông tin sản phẩm Áo hoodie unisex IFXBYT</p><p>&nbsp;</p><p>- - Chất liệu: 100 - Chất liệu: 100% Cotton, vải mềm, chất vải mịn, thoáng mát, không xù.</p><p>&nbsp;</p><p>- - Đường may chuẩn, tỉ mỉ, chắc chắn.</p><p>&nbsp;</p><p>- Mặc ở nhà, đi chơi hoặc khi tập thể thao. Thích hợp phối với nhiều loại trang phục.</p><p>&nbsp;</p><p>- - Kiểu dáng hiện đại, trẻ trung, năng động. Dễ dàng để kết hợp. Biểu đồ kích thước:</p><p>Chiều dài M: 69 Ngực: 116 Chiều dài tay: 56 Chiều rộng vai: 60</p><p>Chiều dài L: 71 Ngực: 120 Chiều dài tay: 57 Chiều rộng vai: 62</p><p>Chiều dài Xl: 69 Ngực: 124 Chiều dài tay: 58 Chiều rộng vai: 64</p><p>Chiều dài 2XL: 69 Ngực: 128 Chiều dài tay: 59 Chiều rộng vai: 66</p><p>&nbsp;</p><p>Do ánh sáng, sẽ có một số khác biệt về màu sắc, xin vui lòng thông cảm!</p><p>&nbsp;</p><p>Lưu ý: Đơn vị đo: cm. Do các phương pháp đo lường khác nhau, xin vui lòng cho phép lỗi 1-3 cm, lỗi không phải là vấn đề chất lượng. Do sự khác biệt về cài đặt ánh sáng và màn hình, màu sắc của mặt hàng có thể hơi khác so với hình ảnh. Vui lòng hiểu và cân nhắc khi đặt hàng!</p><p>&nbsp;</p><p>Dịch vụ khách hàng</p><p>&nbsp;</p><p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với bộ phận chăm sóc khách hàng. Đôi khi, đại diện cho dịch vụ khách hàng có thể phản hồi chậm do số lượng tin nhắn tìm kiếm lời khuyên. Hãy kiên nhẫn chờ đợi. Chúng tôi sẽ tích cực giải quyết mối quan tâm của bạn.</p><p>&nbsp;</p><p>Nếu bạn có bất kỳ vấn đề nào với sản phẩm bạn nhận được, bạn có thể liên hệ với bộ phận chăm sóc khách hàng. Chúng tôi rất vui khi giải quyết vấn đề của bạn.</p><p>&nbsp;</p><p>Xin đừng vội đưa ra những đánh giá tiêu cực.</p><p>&nbsp;</p><p>Chúng tôi sẽ cung cấp cho bạn dịch vụ sau bán hàng tốt nhất.</p><p>&nbsp;</p><figure class="image"><img style="aspect-ratio:873/873;" src="https://down-vn.img.susercontent.com/file/cn-11134208-7r98o-ll69z6vr5o2c5b" width="873" height="873"></figure>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 2, 0, 11, N'IFXBYT', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-ll5wdh8iblik0c.jpg?alt=media&token=ced75352-0f11-4654-94d9-059a0f33179c')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (27, N'Áo sweater nam IFXBYT áo nỉ tay dài basic form rộng unisex 100% cotton-Y0451', 255000, 159000, N'<p>Thông tin sản phẩm Áo nỉ Unisex IFXBYT nam nữ áo nỉ rộng</p><p>&nbsp;</p><p>- - Chất liệu: 100 - Chất liệu: 100% cotton, vải mềm, chất vải mịn, thoáng mát, không xù.</p><p>&nbsp;</p><p>- - Đường may chuẩn, tỉ mỉ, chắc chắn.</p><p>&nbsp;</p><p>- Mặc ở nhà, đi chơi hoặc khi tập thể thao. Thích hợp để trộn quần áo với nhiều loại.</p><p>&nbsp;</p><p>- - Kiểu dáng hiện đại, trẻ trung, năng động. Dễ dàng kết hợp.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;Thông số lựa chọn kích thước:</p><p>&nbsp;</p><p>Chiều dài M: 69 Ngực: 116 Chiều dài tay: 56</p><p>&nbsp;</p><p>Chiều dài L: 71 Ngực: 120 Chiều dài tay áo: 57</p><p>&nbsp;</p><p>Chiều dài Xl: 73 Bức tượng bán thân: 124 Chiều dài tay áo: 58</p><p>&nbsp;</p><p>Chiều dài 2XL: 75 Hình dạng cơ thể: 128 Chiều dài cánh tay: 59</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>Do ánh sáng nên sẽ có một số khác biệt về màu sắc, các bạn chú ý khi chụp ảnh nhé!</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp; Đơn vị đo lường: cm. Do các phương pháp đo lường khác nhau, xin vui lòng cho phép sai số 1-3 cm, phạm vi sai số không đồng nhất. Do sự khác biệt về cài đặt ánh sáng và màn hình, màu sắc của mặt hàng có thể hơi khác so với hình ảnh. Vui lòng hiểu và cân nhắc khi đặt hàng!</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp; Dịch vụ khách hàng</p><p>&nbsp;</p><p>&nbsp; Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với bộ phận chăm sóc khách hàng. Đôi khi, đại diện dịch vụ khách hàng có thể phản hồi chậm do lượng tin nhắn tìm kiếm lời khuyên. Hãy đợi. Chúng tôi sẽ tích cực giải quyết các mối quan tâm của bạn.</p><p>&nbsp;</p><p>&nbsp; Nếu bạn có bất kỳ vấn đề nào với sản phẩm bạn nhận được, bạn có thể liên hệ với bộ phận chăm sóc khách hàng. Chúng tôi rất vui khi giải quyết vấn đề của bạn.</p><p>&nbsp;</p><p>&nbsp; Xin đừng vội đưa ra những đánh giá tiêu cực.</p><p>&nbsp;</p><p>&nbsp; Chúng tôi sẽ cung cấp cho bạn dịch vụ sau bán hàng.</p>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 2, 2, 0, 11, N'IFXBYT', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llszw9h98aaq6b.jpg?alt=media&token=132d4acd-805e-401d-ade4-0d9a8bbd8eed')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (28, N'Áo Hoodie Cổ Cao Dáng Rộng Phối Khóa Kéo Thời Trang áo hoodie có dây kéo Retro Mỹ hoodie zip Nam Nữ', 429509, 239000, N'<p>���Trong trường hợp bình thường, bạn sẽ nhận được hàng trong vòng 7-10 ngày.</p><p>���Màu sắc: Đen, Xanh lá cây</p><p>���Kích thước: M-3XL</p><p>���Chất liệu: Bông</p><p>���Biểu đồ kích thước là để tham khảo, xin vui lòng tham khảo ý kiến dịch vụ khách hàng để biết kích thước cụ thể.</p><p>&nbsp;</p><p>Banuuuu.vn: “Ghi chú mua hàng ”</p><p>1.Chúng tôi là người bán ở Trung Quốc đại lục, tất cả đều được vận chuyển từ Trung Quốc đại lục.</p><p>2. Cửa hàng có nhiều kiểu dáng, tốc độ mới nhanh, chất lượng đảm bảo, giá siêu ưu đãi. Hãy chú ý nhiều hơn đến doanh số bán hàng của chúng tôi.</p><p>3. Các lô hàng khẩn cấp không được chấp nhận, hậu cần có thể bị chậm trễ một chút. Xin hãy tha thứ cho tôi.</p><p>4. Một khi gói hàng được gửi đi, nó không thể được trả lại hoặc trao đổi. Nếu bạn không muốn hoặc muốn đóng đơn hàng, chúng tôi sẽ mất nó. Cửa hàng chịu rất nhiều áp lực. Xin hãy tha thứ cho tôi.</p><p>5. Nếu bạn có bất kỳ câu hỏi nào, bạn có thể liên hệ với chúng tôi, đừng đưa ra đánh giá xấu một cách dễ dàng.</p><p>6.Do sự khác biệt về ánh sáng và màn hình, màu sắc của sản phẩm có thể hơi khác so với hình ảnh, mong các bạn thông cảm.</p>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 2, 0, 12, N'bannuu.vn', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llnccvrcwm8o2c.jpg?alt=media&token=ef561194-e350-46c2-8049-17a30810951c')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (29, N'Mới Áo hoodie cotton Cổ Cao áo hoodie nữ Dáng Rộng áo hoodie nam Thời Trang retro Mỹ Chất Lượng Cao áo hoodie bigsize Nam Nữ', 409000, 229000, N'<p>���Trong trường hợp bình thường, bạn sẽ nhận được hàng trong vòng 7-10 ngày.</p><p>���Màu sắc: Đen, Xanh lá cây</p><p>���Kích thước: M-3XL</p><p>���Chất liệu: Bông</p><p>���Biểu đồ kích thước là để tham khảo, xin vui lòng tham khảo ý kiến dịch vụ khách hàng để biết kích thước cụ thể.</p><p>&nbsp;</p><p>Banuuuu.vn: “Ghi chú mua hàng ”</p><p>1.Chúng tôi là người bán ở Trung Quốc đại lục, tất cả đều được vận chuyển từ Trung Quốc đại lục.</p><p>2. Cửa hàng có nhiều kiểu dáng, tốc độ mới nhanh, chất lượng đảm bảo, giá siêu ưu đãi. Hãy chú ý nhiều hơn đến doanh số bán hàng của chúng tôi.</p><p>3. Các lô hàng khẩn cấp không được chấp nhận, hậu cần có thể bị chậm trễ một chút. Xin hãy tha thứ cho tôi.</p><p>4. Một khi gói hàng được gửi đi, nó không thể được trả lại hoặc trao đổi. Nếu bạn không muốn hoặc muốn đóng đơn hàng, chúng tôi sẽ mất nó. Cửa hàng chịu rất nhiều áp lực. Xin hãy tha thứ cho tôi.</p><p>5. Nếu bạn có bất kỳ câu hỏi nào, bạn có thể liên hệ với chúng tôi, đừng đưa ra đánh giá xấu một cách dễ dàng.</p><p>6.Do sự khác biệt về ánh sáng và màn hình, màu sắc của sản phẩm có thể hơi khác so với hình ảnh, mong các bạn thông cảm.</p>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 1, 2, 0, 12, N'bannuu.vn', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lm78ezaue4f805.jpg?alt=media&token=2ae282be-3f37-4e07-aab4-a7e3c367abe8')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (30, N'Mới Áo hoodie cotton Cổ Cao áo hoodie nữ Dáng Rộng áo hoodie nam Thời Trang retro Mỹ Chất Lượng Cao áo hoodie bigsize Nam Nữ', 409000, 229000, N'<p>���Trong trường hợp bình thường, bạn sẽ nhận được hàng trong vòng 7-10 ngày.</p><p>���Màu sắc: Đen, Xanh lá cây</p><p>���Kích thước: M-3XL</p><p>���Chất liệu: Bông</p><p>���Biểu đồ kích thước là để tham khảo, xin vui lòng tham khảo ý kiến dịch vụ khách hàng để biết kích thước cụ thể.</p><p>&nbsp;</p><p>Banuuuu.vn: “Ghi chú mua hàng ”</p><p>1.Chúng tôi là người bán ở Trung Quốc đại lục, tất cả đều được vận chuyển từ Trung Quốc đại lục.</p><p>2. Cửa hàng có nhiều kiểu dáng, tốc độ mới nhanh, chất lượng đảm bảo, giá siêu ưu đãi. Hãy chú ý nhiều hơn đến doanh số bán hàng của chúng tôi.</p><p>3. Các lô hàng khẩn cấp không được chấp nhận, hậu cần có thể bị chậm trễ một chút. Xin hãy tha thứ cho tôi.</p><p>4. Một khi gói hàng được gửi đi, nó không thể được trả lại hoặc trao đổi. Nếu bạn không muốn hoặc muốn đóng đơn hàng, chúng tôi sẽ mất nó. Cửa hàng chịu rất nhiều áp lực. Xin hãy tha thứ cho tôi.</p><p>5. Nếu bạn có bất kỳ câu hỏi nào, bạn có thể liên hệ với chúng tôi, đừng đưa ra đánh giá xấu một cách dễ dàng.</p><p>6.Do sự khác biệt về ánh sáng và màn hình, màu sắc của sản phẩm có thể hơi khác so với hình ảnh, mong các bạn thông cảm.</p>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 8, 2, 0, 12, N'bannuu.vn', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llyte04h7e1w2c.jpg?alt=media&token=bf383030-51c4-46fb-b9a9-a26b178957e4')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (31, N'Áo hoodie Bằng cotton áo hoodie form rộng Có Khóa Kéo áo hoodie bigsize Phong Cách hip hop Thời Trang Áo hoodie Nam Nữ', 455000, 294000, N'<p>���Trong trường hợp bình thường, bạn sẽ nhận được hàng trong vòng 7-10 ngày.</p><p>���Màu: Xám, Kaki</p><p>���Kích thước: M-3XL</p><p>���Chất liệu: Bông</p><p>���Biểu đồ kích thước là để tham khảo, xin vui lòng tham khảo ý kiến dịch vụ khách hàng để biết kích thước cụ thể.</p><p>&nbsp;</p><p>Banuuuu.vn: “Ghi chú mua hàng ”</p><p>1.Chúng tôi là người bán ở Trung Quốc đại lục, tất cả đều được vận chuyển từ Trung Quốc đại lục.</p><p>2. Cửa hàng có nhiều kiểu dáng, tốc độ mới nhanh, chất lượng đảm bảo, giá siêu ưu đãi. Hãy chú ý nhiều hơn đến doanh số bán hàng của chúng tôi.</p><p>3. Các lô hàng khẩn cấp không được chấp nhận, hậu cần có thể bị chậm trễ một chút. Xin hãy tha thứ cho tôi.</p><p>4. Một khi gói hàng được gửi đi, nó không thể được trả lại hoặc trao đổi. Nếu bạn không muốn hoặc muốn đóng đơn hàng, chúng tôi sẽ mất nó. Cửa hàng chịu rất nhiều áp lực. Xin hãy tha thứ cho tôi.</p><p>5. Nếu bạn có bất kỳ câu hỏi nào, bạn có thể liên hệ với chúng tôi, đừng đưa ra đánh giá xấu một cách dễ dàng.</p><p>6.Do sự khác biệt về ánh sáng và màn hình, màu sắc của sản phẩm có thể hơi khác so với hình ảnh, mong các bạn thông cảm.</p>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 8, 2, 0, 12, N'bannuu.vn', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llvyltp56qcka4.jpg?alt=media&token=1212dbd3-f165-4aac-bad6-2b90f89d4f40')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (32, N'Mới Áo hoodie cotton Có Túi Lớn áo hoodie form rộng Phong Cách hip hop Mỹ Áo hoodie Nam Nữ retro áo hoodie bigsize oversize áo hoodie dày', 460000, 279000, N'<p>���Trong trường hợp bình thường, bạn sẽ nhận được hàng trong vòng 7-10 ngày.</p><p>���Màu: Xám, Kaki</p><p>���Kích thước: M-3XL</p><p>���Chất liệu: Bông</p><p>���Biểu đồ kích thước là để tham khảo, xin vui lòng tham khảo ý kiến dịch vụ khách hàng để biết kích thước cụ thể.</p><p>&nbsp;</p><p>Banuuuu.vn: “Ghi chú mua hàng ”</p><p>1.Chúng tôi là người bán ở Trung Quốc đại lục, tất cả đều được vận chuyển từ Trung Quốc đại lục.</p><p>2. Cửa hàng có nhiều kiểu dáng, tốc độ mới nhanh, chất lượng đảm bảo, giá siêu ưu đãi. Hãy chú ý nhiều hơn đến doanh số bán hàng của chúng tôi.</p><p>3. Các lô hàng khẩn cấp không được chấp nhận, hậu cần có thể bị chậm trễ một chút. Xin hãy tha thứ cho tôi.</p><p>4. Một khi gói hàng được gửi đi, nó không thể được trả lại hoặc trao đổi. Nếu bạn không muốn hoặc muốn đóng đơn hàng, chúng tôi sẽ mất nó. Cửa hàng chịu rất nhiều áp lực. Xin hãy tha thứ cho tôi.</p><p>5. Nếu bạn có bất kỳ câu hỏi nào, bạn có thể liên hệ với chúng tôi, đừng đưa ra đánh giá xấu một cách dễ dàng.</p><p>6.Do sự khác biệt về ánh sáng và màn hình, màu sắc của sản phẩm có thể hơi khác so với hình ảnh, mong các bạn thông cảm.</p>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 11, 2, 0, 12, N'bannuu.vn', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-llvyltp55bs4a4.jpg?alt=media&token=26a93c94-46bf-4e69-b4c3-d7a542208f0c')
INSERT [dbo].[products] ([id], [name], [price], [salePrice], [description], [city], [rate], [createDate], [boughtQuantity], [color], [categoryId], [shopCategoryId], [shopId], [createBy], [deleteBy], [url]) VALUES (33, N'Mới Áo sweater Cổ polo Cách Nhiệt Dáng Rộng Dày Dặn Áo sweater form rộng Phong Cách Mỹ Cổ Điển áo sweater nam Thời Trang áo sweater có cổ Nam Nữ', 389000, 239000, N'<p><img src="https://down-vn.img.susercontent.com/file/sg-11134202-7rbk0-ll1yd6cqhcfc86" width="873" height="1746"></p><p><br><img src="https://down-vn.img.susercontent.com/file/sg-11134202-7rbk0-ll1yd8e9j58oc8" width="873" height="1746"><img src="https://down-vn.img.susercontent.com/file/sg-11134202-7rbk0-ll1yd8e9j58oc8" width="873" height="1746"><img src="https://down-vn.img.susercontent.com/file/sg-11134202-7rbk0-ll1yd9kpt0gyf7" width="873" height="1746"><img src="https://down-vn.img.susercontent.com/file/sg-11134202-7rbk0-ll1yd9kpt0gyf7" width="873" height="1746"></p>', N'Tỉnh Hoà Bình.', 0, CAST(N'2023-10-27' AS Date), 0, 11, 2, 0, 12, N'bannuu.vn', NULL, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/products%2Fcn-11134207-7r98o-lminscs88u8yf1.jpg?alt=media&token=7ac60c8f-be75-48c0-bd6a-413d4c108cf2')
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[rates] ON 

INSERT [dbo].[rates] ([id], [userId], [productId], [star], [content], [date]) VALUES (1, 3, 2, 3, N'<p>oke day</p>', CAST(N'2023-11-07' AS Date))
SET IDENTITY_INSERT [dbo].[rates] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [userType]) VALUES (1, N'Admin')
INSERT [dbo].[roles] ([id], [userType]) VALUES (2, N'Manager')
INSERT [dbo].[roles] ([id], [userType]) VALUES (3, N'Seller')
INSERT [dbo].[roles] ([id], [userType]) VALUES (4, N'Customer')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[shipCompany] ON 

INSERT [dbo].[shipCompany] ([id], [name], [price], [image]) VALUES (1, N'Giao Hàng Nhanh', 40000, N'ghn.png')
INSERT [dbo].[shipCompany] ([id], [name], [price], [image]) VALUES (2, N'VN Post', 35000, N'vnpost.png')
INSERT [dbo].[shipCompany] ([id], [name], [price], [image]) VALUES (3, N'Giao Hàng Tiết Kiệm', 30000, N'ghtk.png')
INSERT [dbo].[shipCompany] ([id], [name], [price], [image]) VALUES (4, N'Viettel Post', 40000, N'viettelpost.png')
INSERT [dbo].[shipCompany] ([id], [name], [price], [image]) VALUES (5, N'J&T EXPRESS', 35000, N'j&t.png')
INSERT [dbo].[shipCompany] ([id], [name], [price], [image]) VALUES (6, N'Ninja Van', 25000, N'ninjavan.png')
SET IDENTITY_INSERT [dbo].[shipCompany] OFF
GO
SET IDENTITY_INSERT [dbo].[shopReports] ON 

INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (1, 1, 0, 658400, 0, 4, 3)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (2, 2, 0, 110000, 0, 1, 2)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (3, 3, 0, 0, 0, 0, 0)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (4, 4, 0, 0, 0, 0, 0)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (5, 5, 0, 0, 0, 0, 1)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (6, 6, 0, 0, 0, 0, 1)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (7, 7, 0, 0, 0, 0, 3)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (8, 8, 0, 0, 0, 0, 2)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (9, 9, 0, 0, 0, 0, 2)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (10, 10, 0, 0, 0, 0, 2)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (11, 11, 0, 0, 0, 0, 4)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (12, 12, 0, 0, 0, 0, 6)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (13, 13, 0, 0, 0, 0, 0)
INSERT [dbo].[shopReports] ([id], [shopId], [profit], [revenue], [expense], [amountOrders], [amountProducts]) VALUES (14, 13, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[shopReports] OFF
GO
SET IDENTITY_INSERT [dbo].[shops] ON 

INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (1, N'soihoang434@gmail.com', N'soihoang434', N'soihoang434', N'shop address, Phường Việt Hưng, Quận Long Biên, Thành phố Hà Nội.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2Fvn-11134207-7r98o-lkxlb9gfxq71c5.jpg?alt=media&token=cd441f99-c774-4a71-9bc2-cfad5a6661ee')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (2, N'wibustore@gmail.com', N'wibustore', N'wibustore', N'wibustore, Xã Sủng Tráng, Huyện Yên Minh, Tỉnh Hà Giang.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2Fb7922edc9d86c7bf1a916eaa21ac1397_tn.jpg?alt=media&token=29aec871-27d4-45a0-bda5-4f828807c303')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (3, N'fashion@gmail.com', N'fashionfashion', N'**Fashion**', N'**Fashion**, Xã Yến Dương, Huyện Ba Bể, Tỉnh Bắc Kạn.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2F2e7d7b7e368610f01cb299bec846068e_tn.jpg?alt=media&token=1161fd84-27b5-4f30-82f1-a36a4d59773e')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (4, N'AppleFlagshipStore@gmail.com', N'AppleFlagshipStore', N'Apple Flagship Store', N'Apple Flagship Store, Phường Hiệp Thành, Thành phố Ngã Bảy, Tỉnh Hậu Giang.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2F62160f74aa5cffa160b2062658d2be75_tn.jpg?alt=media&token=3e76a2b3-497c-418a-b9c2-6b0b3c9a91cb')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (5, N'ngodecor@gmail.com', N'ngodecor', N'Ngộ Decor 1997', N'Ngộ Decor 1997, Xã Yên Cường, Huyện Bắc Mê, Tỉnh Hà Giang.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2Fvn-11134207-7r98o-lkxlb9gfxq71c5.jpg?alt=media&token=22bf54b9-895b-4ecd-bc6e-220623af7359')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (6, N'HIGHMODESTREETWEAROFFICIAL@gmail.com', N'HIGHMODESTREETWEAROFFICIAL', N'HIGHMODE STREETWEAR OFFICIAL', N'HIGHMODE STREETWEAR OFFICIAL, Xã Tứ Hiệp, Huyện Thanh Trì, Thành phố Hà Nội.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2F81b20a0034994857e24cecd22c528c2c_tn.jpg?alt=media&token=6d3f0f74-5024-4bcb-b1fb-5a1c4f65aaab')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (7, N'metagear@gmail.com', N'metagear', N'Meta Gear Oficial', N'Meta Gear Oficial, Phường Mai Động, Quận Hoàng Mai, Thành phố Hà Nội.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2F38dc533e383af5db105854d820f74b5f_tn.jpg?alt=media&token=5c863b96-d944-43c2-924a-fe8d0b983b4f')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (8, N'vinciigallery@gmail.com', N'vinciigallery', N'vincii.gallery_', N'vincii.gallery_, Phường Mỹ Đình 2, Quận Nam Từ Liêm, Thành phố Hà Nội.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2Fd3e0c5eeb4dbd7c665c8892c097c17ee_tn.jpg?alt=media&token=a38f23ed-618b-4bc3-baec-22ded4f88fd7')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (9, N'GmanMenswear@gmail.com', N'GmanMenswear', N'Gman Menswear', N'Gman Menswear, Xã Nà Pó, Huyện Mai Sơn, Tỉnh Sơn La.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2Fefc6293449e079dc0637111e3e13bff6_tn.png?alt=media&token=043261f9-f4a6-486d-9c5a-6f9de50859aa')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (10, N'FREDOSTUDIO@gmail.com', N'FREDOSTUDIO', N'FREDO STUDIO', N'FREDO STUDIO, Xã Tân Quang, Thành phố Sông Công, Tỉnh Thái Nguyên.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2Ff69b14778812f54b4d3bbd2f6d8654c5_tn.jpg?alt=media&token=3100844c-53e5-4f34-b665-318a935a3453')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (11, N'IFXBYT@gmail.com', N'IFXBYTIFXBYT', N'IFXBYT', N'IFXBYT, Xã Toàn Sơn, Huyện Đà Bắc, Tỉnh Hoà Bình.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2F2f91f0fb1d44ea357b591b2704f67668_tn.jpg?alt=media&token=8971cdc7-7d34-4264-81b7-7670d9820254')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (12, N'bannuu.vn@gmail.com', N'bannuu.vn', N'bannuu.vn', N'bannuu.vn, Xã Cao Sơn, Huyện Lương Sơn, Tỉnh Hoà Bình.', CAST(N'2023-10-27' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2F93c53c752d3941c1c47630c676368f25_tn.jpg?alt=media&token=c5c7ad5a-400b-4409-8a95-fca44bc94532')
INSERT [dbo].[shops] ([id], [email], [password], [name], [address], [createDate], [active], [avatar]) VALUES (13, N'viettqhe170367@fpt.edu.vn', N'testpass', N'test', N'ha noi, Xã Nam Sơn, Huyện Sóc Sơn, Thành phố Hà Nội.', CAST(N'2023-11-07' AS Date), 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2F%E1%BA%A2nh%20ch%E1%BB%A5p%20m%C3%A0n%20h%C3%ACnh%202023-09-23%20112309.png?alt=media&token=f97af9c7-2905-4e84-bd9d-620055cbad3c')
SET IDENTITY_INSERT [dbo].[shops] OFF
GO
SET IDENTITY_INSERT [dbo].[sizesProduct] ON 

INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (1, 320, N'M', 1)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (2, 229, N'L', 1)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (3, 122, N'XL', 1)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (4, 321, N'M', 2)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (5, 453, N'L', 2)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (6, 121, N'XL', 2)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (7, 94, N'M', 3)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (8, 23, N'L', 3)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (9, 70, N'XL', 3)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (11, 2, N'asd', 5)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (12, 23, N'Khỉ', 6)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (13, 43, N'Chó Shiba', 6)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (14, 28, N'Chó Husky', 6)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (15, 45, N'Cáo', 6)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (16, 19, N'Cá Xanh', 6)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (17, 42, N'Không Viền', 7)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (18, 15, N'Viền Mắt Đen', 7)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (19, 345, N'Trắng', 8)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (20, 566, N'Mặt cười + Thìa', 9)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (21, 425, N' Nhếch Mép + Thìa', 9)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (22, 45, N'36', 10)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (23, 54, N'37', 10)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (24, 34, N'38', 10)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (25, 65, N'39', 10)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (26, 83, N'40', 10)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (27, 34, N'41', 10)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (28, 45, N'42', 10)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (29, 31, N'43', 10)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (30, 45534, N'Doraemon An Nhiên', 11)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (31, 34534, N'Mèo Tom Bê Tha', 11)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (32, 43, N'M', 12)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (33, 34, N'L', 12)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (34, 54, N'XL', 12)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (35, 98, N'M', 14)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (36, 67, N'L', 14)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (37, 102, N'XL', 14)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (38, 545, N'Red Switch', 15)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (39, 343, N'Blue Switch', 15)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (40, 676, N'Brown Switch', 15)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (41, 54, N'Red Switch', 16)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (42, 341, N'Blue Switch', 16)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (43, 93, N'Brown Switch', 16)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (44, 56, N'Cream Yellow', 17)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (45, 76, N'Cream Blue', 17)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (46, 13, N'Piano', 17)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (47, 525, N'Black', 18)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (48, 636, N'Trans Navy', 18)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (49, 125, N'Trans Smoke', 18)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (50, 34, N'Gray', 19)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (51, 55, N'Champagne', 19)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (52, 534, N'Túi Hộp - M', 20)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (53, 341, N'Túi Hộp - L', 20)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (54, 678, N'Túi Hộp - XL', 20)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (55, 426, N'Không Túi - M', 20)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (56, 26, N'Không Túi - L', 20)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (57, 768, N'Không Túi - XL', 20)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (58, 5345, N'Be - M', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (59, 345, N'Be - L', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (60, 5245, N'Be - XL', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (61, 242, N'Be - XXL', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (62, 52, N'Xám Đậm - M', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (63, 647376, N'Xám Đậm - L', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (64, 754, N'Xám Đậm - XL', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (65, 13451, N'Xám Đậm - XXL', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (66, 658, N'Xanh Lam - M', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (67, 324, N'Xanh Lam - L', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (68, 53276, N'Xanh Lam - XL', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (69, 34, N'Xanh Lam - XXL', 21)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (70, 414, N'M', 22)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (71, 5125, N'L', 22)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (72, 672, N'XL', 22)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (73, 55, N'Đen - M', 23)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (74, 68, N'Đen - L', 23)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (75, 134, N'Đen - XL', 23)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (76, 342, N'Xám - M', 23)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (77, 869, N'Xám - L', 23)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (78, 23, N'Xám - XL', 23)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (79, 6456, N'M', 24)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (80, 4252, N'L', 24)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (81, 1515, N'XL', 24)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (82, 5466, N'XXL', 24)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (83, 261, N'M', 25)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (84, 847, N'L', 25)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (85, 323, N'XL', 25)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (86, 6858, N'XXL', 25)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (87, 459, N'M', 26)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (88, 245, N'L', 26)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (89, 255, N'XL', 26)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (90, 565, N'XXL', 26)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (91, 536, N'M', 27)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (92, 256, N'L', 27)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (93, 687, N'XL', 27)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (94, 974, N'XXL', 27)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (95, 678, N'M', 28)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (96, 234, N'L', 28)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (97, 564, N'XL', 28)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (98, 421, N'XXL', 28)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (99, 43, N'M', 29)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (100, 453, N'L', 29)
GO
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (101, 66, N'XL', 29)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (102, 114, N'XXL', 29)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (103, 545, N'M', 30)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (104, 414, N'L', 30)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (105, 244, N'XL', 30)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (106, 653, N'XXL', 30)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (107, 41, N'M', 31)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (108, 223, N'L', 31)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (109, 413, N'XL', 31)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (110, 414, N'XXL', 31)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (119, 352, N'Đỏ Trắng - M', 32)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (120, 52, N'Đỏ Trắng - L', 32)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (121, 436, N'Đỏ Trắng - XL', 32)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (122, 662, N'Đỏ Trắng - XXL', 32)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (123, 245, N'Đen Trắng - M', 32)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (124, 467, N'Đen Trắng - L', 32)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (125, 89, N'Đen Trắng - XL', 32)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (126, 334, N'Đen Trắng - XXL', 32)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (127, 545, N'Trắng - M', 33)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (128, 4342, N'Trắng - L', 33)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (129, 2556, N'Trắng - XL', 33)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (130, 33, N'Đen - M', 33)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (131, 7735, N'Đen - L', 33)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (132, 8581, N'Đen - XL', 33)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (133, 6236, N'Nâu - M', 33)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (134, 347, N'Nâu - L', 33)
INSERT [dbo].[sizesProduct] ([id], [inventory], [name], [productId]) VALUES (135, 2687, N'Nâu - XL', 33)
SET IDENTITY_INSERT [dbo].[sizesProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [name], [email], [phone], [role], [avatar], [address]) VALUES (1, N'admin', N'admin', N'admin', N'admin@gmail.com', N'', 1, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2F1DEBD6D6-9EEE-4EFD-9406-7CD864BB9713.jpeg?alt=media&token=6a1c17e6-945f-4bbe-8197-159cef7bdcc1', N'')
INSERT [dbo].[users] ([id], [username], [password], [name], [email], [phone], [role], [avatar], [address]) VALUES (2, N'tranquocviet1303', N'11111111', N'', N'tranquocviet1303@gmail.com', N'', 5, N'', N'')
INSERT [dbo].[users] ([id], [username], [password], [name], [email], [phone], [role], [avatar], [address]) VALUES (3, N'user1', N'11111111', N'', N'user1@example.com', N'', 5, N'https://firebasestorage.googleapis.com/v0/b/mooru-eee6d.appspot.com/o/avatars%2FScreenshot%202023-10-29%20170200.png?alt=media&token=75944c41-3e5e-41e3-8c7f-e5131565d8dd', N'')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__shops__AB6E61645279E2AB]    Script Date: 11/7/2023 11:21:50 AM ******/
ALTER TABLE [dbo].[shops] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E616411FA7CDB]    Script Date: 11/7/2023 11:21:50 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572E58F228C]    Script Date: 11/7/2023 11:21:50 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (CONVERT([date],getdate())) FOR [orderDate]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('waitForConfirmation') FOR [status]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [rate]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (CONVERT([date],getdate())) FOR [createDate]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [boughtQuantity]
GO
ALTER TABLE [dbo].[rates] ADD  DEFAULT ((0)) FOR [star]
GO
ALTER TABLE [dbo].[rates] ADD  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[shopReports] ADD  DEFAULT ((0)) FOR [profit]
GO
ALTER TABLE [dbo].[shopReports] ADD  DEFAULT ((0)) FOR [revenue]
GO
ALTER TABLE [dbo].[shopReports] ADD  DEFAULT ((0)) FOR [expense]
GO
ALTER TABLE [dbo].[shopReports] ADD  DEFAULT ((0)) FOR [amountOrders]
GO
ALTER TABLE [dbo].[shopReports] ADD  DEFAULT ((0)) FOR [amountProducts]
GO
ALTER TABLE [dbo].[shops] ADD  DEFAULT (CONVERT([date],getdate())) FOR [createDate]
GO
ALTER TABLE [dbo].[shops] ADD  DEFAULT ('TRUE') FOR [active]
GO
ALTER TABLE [dbo].[sizesProduct] ADD  DEFAULT ((0)) FOR [inventory]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('') FOR [phone]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('') FOR [avatar]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('') FOR [address]
GO
ALTER TABLE [dbo].[vouchers] ADD  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[vouchers] ADD  DEFAULT ((0)) FOR [percent]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_Assignment] SET  READ_WRITE 
GO
