USE [master]
GO
/****** Object:  Database [FMS]    Script Date: 2025-06-20 10:29:56 ******/
CREATE DATABASE [FMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FMS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [FMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FMS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FMS] SET RECOVERY FULL 
GO
ALTER DATABASE [FMS] SET  MULTI_USER 
GO
ALTER DATABASE [FMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FMS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FMS', N'ON'
GO
ALTER DATABASE [FMS] SET QUERY_STORE = OFF
GO
USE [FMS]
GO
/****** Object:  Table [dbo].[tblcart]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[RestaurentId] [int] NULL,
	[FoodId] [int] NULL,
	[Quantity] [int] NULL,
	[CreateOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblcategory]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
	[CategoryType] [varchar](50) NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomerInfo]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomerInfo](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[GenId] [int] NOT NULL,
	[Phone] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[Pincode] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDeliveryPartners]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDeliveryPartners](
	[DEId] [int] IDENTITY(1,1) NOT NULL,
	[Genid] [int] NULL,
	[Name] [varchar](200) NULL,
	[Phone] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[DrivingLicence] [varchar](500) NULL,
	[Address] [varchar](400) NULL,
	[Pincode] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DEId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDEStatus]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDEStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DEId] [int] NULL,
	[CurrentStatus] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFoodItems]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFoodItems](
	[FoodId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[RestaurentId] [int] NULL,
	[FoodName] [varchar](100) NULL,
	[Description] [varchar](400) NULL,
	[Price] [decimal](10, 2) NULL,
	[ImageUrl] [varchar](200) NULL,
	[Quanity] [int] NULL,
	[Status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderReview]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderReview](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[Desctiption] [varchar](max) NULL,
	[FoodRating] [int] NULL,
	[DERating] [int] NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [int] NULL,
	[CustomerId] [int] NULL,
	[RestaurentId] [int] NULL,
	[FoodId] [int] NULL,
	[Quantity] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[PaymentMode] [varchar](50) NULL,
	[Status] [varchar](100) NULL,
	[DeliveryAddress] [varchar](400) NULL,
	[OderDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderStatus]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderStatus](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[RecordId] [int] NULL,
	[DEId] [int] NULL,
	[RestaurentStatus] [varchar](200) NULL,
	[DEstatus] [varchar](200) NULL,
	[OverallStatus] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRestaurentInfo]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRestaurentInfo](
	[RestaurentId] [int] IDENTITY(1,1) NOT NULL,
	[GenId] [int] NOT NULL,
	[Phone] [varchar](50) NULL,
	[Address] [varchar](200) NULL,
	[Pincode] [varchar](50) NULL,
	[FoodLicenceNo] [varchar](50) NULL,
	[LogoUrl] [varchar](200) NULL,
	[Email] [varchar](200) NULL,
	[Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RestaurentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRolesMaster]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRolesMaster](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsersInfo]    Script Date: 2025-06-20 10:29:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsersInfo](
	[GenId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[RoleId] [int] NULL,
	[Status] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[GenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblcategory] ON 

INSERT [dbo].[tblcategory] ([CategoryId], [CategoryName], [CategoryType], [Status]) VALUES (1, N'Biryani', N'Veg', N'Active')
INSERT [dbo].[tblcategory] ([CategoryId], [CategoryName], [CategoryType], [Status]) VALUES (2, N'Biryani', N'NonVeg', N'Active')
INSERT [dbo].[tblcategory] ([CategoryId], [CategoryName], [CategoryType], [Status]) VALUES (3, N'Starter', N'Veg', N'Active')
INSERT [dbo].[tblcategory] ([CategoryId], [CategoryName], [CategoryType], [Status]) VALUES (4, N'Starter', N'NonVeg', N'Active')
INSERT [dbo].[tblcategory] ([CategoryId], [CategoryName], [CategoryType], [Status]) VALUES (5, N'MainCourse', N'Veg', N'Active')
INSERT [dbo].[tblcategory] ([CategoryId], [CategoryName], [CategoryType], [Status]) VALUES (6, N'MainCourse', N'NonVeg', N'Active')
SET IDENTITY_INSERT [dbo].[tblcategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCustomerInfo] ON 

INSERT [dbo].[tblCustomerInfo] ([CustomerId], [GenId], [Phone], [Address], [Pincode], [Email], [Name]) VALUES (1, 5, N'9502136931', NULL, NULL, N'srichaitany@gmail.com', N'Rashmitha')
INSERT [dbo].[tblCustomerInfo] ([CustomerId], [GenId], [Phone], [Address], [Pincode], [Email], [Name]) VALUES (2, 6, N'9654712852', NULL, NULL, N'raj@go.in', N'Raju')
INSERT [dbo].[tblCustomerInfo] ([CustomerId], [GenId], [Phone], [Address], [Pincode], [Email], [Name]) VALUES (3, 7, N'9658742152', NULL, NULL, N'da@gh.com', N'Sachin')
SET IDENTITY_INSERT [dbo].[tblCustomerInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFoodItems] ON 

INSERT [dbo].[tblFoodItems] ([FoodId], [CategoryId], [RestaurentId], [FoodName], [Description], [Price], [ImageUrl], [Quanity], [Status]) VALUES (1, 1, NULL, N'Paneer Biryani', N'Made with High Quality Paneer', CAST(200.00 AS Decimal(10, 2)), N'NA', 2, N'Active')
INSERT [dbo].[tblFoodItems] ([FoodId], [CategoryId], [RestaurentId], [FoodName], [Description], [Price], [ImageUrl], [Quanity], [Status]) VALUES (2, 3, 4, N'Veg Manchuria', N'Toasted with Tasty', CAST(210.00 AS Decimal(10, 2)), N'NA', 5, N'Active')
SET IDENTITY_INSERT [dbo].[tblFoodItems] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRestaurentInfo] ON 

INSERT [dbo].[tblRestaurentInfo] ([RestaurentId], [GenId], [Phone], [Address], [Pincode], [FoodLicenceNo], [LogoUrl], [Email], [Name]) VALUES (1, 2, N'9632587412', N'Visakhapatnam', N'530026', N'FSSAI8547541', N'', N'', N'Tasty Buds')
INSERT [dbo].[tblRestaurentInfo] ([RestaurentId], [GenId], [Phone], [Address], [Pincode], [FoodLicenceNo], [LogoUrl], [Email], [Name]) VALUES (2, 3, N'9632587412', N'Visakhapatnam', N'530026', N'FSSAI8547541', N'', N'', N'RedCherry Restaurent')
INSERT [dbo].[tblRestaurentInfo] ([RestaurentId], [GenId], [Phone], [Address], [Pincode], [FoodLicenceNo], [LogoUrl], [Email], [Name]) VALUES (3, 4, N'9632587412', N'Visakhapatnam', N'530026', N'FSSAI8547541', N'', N'', N'Brundavanam Restaurent')
INSERT [dbo].[tblRestaurentInfo] ([RestaurentId], [GenId], [Phone], [Address], [Pincode], [FoodLicenceNo], [LogoUrl], [Email], [Name]) VALUES (4, 8, N'9502136931', N'gajuwaka', N'530026', N'Abpdof87', N'sadfsdf', N'srichaitany@gmail.com', N'Food Court')
SET IDENTITY_INSERT [dbo].[tblRestaurentInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRolesMaster] ON 

INSERT [dbo].[tblRolesMaster] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[tblRolesMaster] ([RoleId], [RoleName]) VALUES (2, N'Restaurent')
INSERT [dbo].[tblRolesMaster] ([RoleId], [RoleName]) VALUES (3, N'DE')
INSERT [dbo].[tblRolesMaster] ([RoleId], [RoleName]) VALUES (4, N'Customer')
SET IDENTITY_INSERT [dbo].[tblRolesMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[tblUsersInfo] ON 

INSERT [dbo].[tblUsersInfo] ([GenId], [UserName], [Password], [RoleId], [Status], [CreatedOn]) VALUES (1, N'Admin', N'123', 1, N'Active', CAST(N'2025-06-05T11:44:10.770' AS DateTime))
INSERT [dbo].[tblUsersInfo] ([GenId], [UserName], [Password], [RoleId], [Status], [CreatedOn]) VALUES (2, N'Tasty456', N'123', 2, N'Active', CAST(N'2025-06-05T11:44:10.770' AS DateTime))
INSERT [dbo].[tblUsersInfo] ([GenId], [UserName], [Password], [RoleId], [Status], [CreatedOn]) VALUES (3, N'RedCherry852', N'123', 2, N'Active', CAST(N'2025-06-05T11:44:10.770' AS DateTime))
INSERT [dbo].[tblUsersInfo] ([GenId], [UserName], [Password], [RoleId], [Status], [CreatedOn]) VALUES (4, N'Brudavan963', N'123', 2, N'Active', CAST(N'2025-06-05T11:44:10.770' AS DateTime))
INSERT [dbo].[tblUsersInfo] ([GenId], [UserName], [Password], [RoleId], [Status], [CreatedOn]) VALUES (5, N'Ras950', N'gani1369', 4, N'Active', CAST(N'2025-06-17T14:45:42.833' AS DateTime))
INSERT [dbo].[tblUsersInfo] ([GenId], [UserName], [Password], [RoleId], [Status], [CreatedOn]) VALUES (6, N'Raj965', N'password123', 4, N'Active', CAST(N'2025-06-17T14:52:39.923' AS DateTime))
INSERT [dbo].[tblUsersInfo] ([GenId], [UserName], [Password], [RoleId], [Status], [CreatedOn]) VALUES (7, N'Sac965', N'sach1234', 4, N'Active', CAST(N'2025-06-17T15:43:12.977' AS DateTime))
INSERT [dbo].[tblUsersInfo] ([GenId], [UserName], [Password], [RoleId], [Status], [CreatedOn]) VALUES (8, N'Foo950', N'passwordFood', 2, N'Active', CAST(N'2025-06-18T15:47:57.833' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblUsersInfo] OFF
GO
ALTER TABLE [dbo].[tblcart]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomerInfo] ([CustomerId])
GO
ALTER TABLE [dbo].[tblcart]  WITH CHECK ADD FOREIGN KEY([FoodId])
REFERENCES [dbo].[tblFoodItems] ([FoodId])
GO
ALTER TABLE [dbo].[tblcart]  WITH CHECK ADD FOREIGN KEY([RestaurentId])
REFERENCES [dbo].[tblRestaurentInfo] ([RestaurentId])
GO
ALTER TABLE [dbo].[tblCustomerInfo]  WITH CHECK ADD FOREIGN KEY([GenId])
REFERENCES [dbo].[tblUsersInfo] ([GenId])
GO
ALTER TABLE [dbo].[tblDeliveryPartners]  WITH CHECK ADD FOREIGN KEY([Genid])
REFERENCES [dbo].[tblUsersInfo] ([GenId])
GO
ALTER TABLE [dbo].[tblDEStatus]  WITH CHECK ADD FOREIGN KEY([DEId])
REFERENCES [dbo].[tblDeliveryPartners] ([DEId])
GO
ALTER TABLE [dbo].[tblFoodItems]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[tblcategory] ([CategoryId])
GO
ALTER TABLE [dbo].[tblOrderReview]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrders] ([OrderId])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomerInfo] ([CustomerId])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([FoodId])
REFERENCES [dbo].[tblFoodItems] ([FoodId])
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD FOREIGN KEY([RestaurentId])
REFERENCES [dbo].[tblRestaurentInfo] ([RestaurentId])
GO
ALTER TABLE [dbo].[tblOrderStatus]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[tblOrders] ([OrderId])
GO
ALTER TABLE [dbo].[tblOrderStatus]  WITH CHECK ADD FOREIGN KEY([DEId])
REFERENCES [dbo].[tblDeliveryPartners] ([DEId])
GO
ALTER TABLE [dbo].[tblRestaurentInfo]  WITH CHECK ADD FOREIGN KEY([GenId])
REFERENCES [dbo].[tblUsersInfo] ([GenId])
GO
ALTER TABLE [dbo].[tblUsersInfo]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[tblRolesMaster] ([RoleId])
GO
USE [master]
GO
ALTER DATABASE [FMS] SET  READ_WRITE 
GO
