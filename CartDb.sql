USE [master]
GO
/****** Object:  Database [CartDb]    Script Date: 7/12/2020 8:29:36 PM ******/
CREATE DATABASE [CartDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CartDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2K16\MSSQL\DATA\CartDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CartDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER2K16\MSSQL\DATA\CartDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CartDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CartDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CartDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CartDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CartDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CartDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CartDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [CartDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CartDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CartDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CartDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CartDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CartDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CartDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CartDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CartDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CartDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CartDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CartDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CartDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CartDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CartDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CartDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CartDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CartDb] SET RECOVERY FULL 
GO
ALTER DATABASE [CartDb] SET  MULTI_USER 
GO
ALTER DATABASE [CartDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CartDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CartDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CartDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CartDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CartDb] SET QUERY_STORE = OFF
GO
USE [CartDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CartDb]
GO
/****** Object:  Table [dbo].[AppliedDiscount]    Script Date: 7/12/2020 8:29:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppliedDiscount](
	[AppliedDiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountId] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_AppliedDiscount] PRIMARY KEY CLUSTERED 
(
	[AppliedDiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 7/12/2020 8:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [nvarchar](50) NOT NULL,
	[DiscountDescription] [nvarchar](500) NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/12/2020 8:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductCost] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[productImageUrl] [nvarchar](500) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 7/12/2020 8:29:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[DeliveryCharges] [int] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AppliedDiscount] ON 

INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (1, 1, 1, 4)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (2, 2, 1, 3)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (4, 1, 2, 12)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (5, 2, 2, 2)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (6, 1, 3, 0)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (7, 2, 3, 5)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (8, 1, 4, 6)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (9, 2, 4, 8)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (10, 1, 5, 20)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (11, 2, 5, 25)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (12, 1, 6, 15)
INSERT [dbo].[AppliedDiscount] ([AppliedDiscountId], [DiscountId], [ProductID], [Discount]) VALUES (13, 2, 6, 10)
SET IDENTITY_INSERT [dbo].[AppliedDiscount] OFF
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([DiscountId], [DiscountName], [DiscountDescription]) VALUES (1, N'Normal Day Discount', N'Daily Discount applicable on a product.')
INSERT [dbo].[Discount] ([DiscountId], [DiscountName], [DiscountDescription]) VALUES (2, N'Additional Independence Day Discount', N'Additional Independence Day Discount')
SET IDENTITY_INSERT [dbo].[Discount] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl]) VALUES (1, N'Mixer Grinder', 2000, 1, N'https://rukminim1.flixcart.com/image/128/128/jwdupow0/mixer-grinder-juicer/x/p/h/bajaj-bravo-dlx-original-imafhfrzgzgzbknt.jpeg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl]) VALUES (2, N'Mircrowave', 5000, 1, N'https://www.reliancedigital.in/medias/581108150-Package-1-1200Wx1200H-96Wx96H?context=bWFzdGVyfGltYWdlc3wxODE4MHxpbWFnZS9qcGVnfGltYWdlcy9oYjMvaGM4Lzg5NjM4NTA0Njk0MDYuanBnfDJiMDcyYWZkOTZiNTBiMTkxMDI4ZGVhMWVhYmJhOGRlM2I2YWQ3NDFlZmY3ZTU0NTY5MTdiZjIyYTVhYjVlMzE')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl]) VALUES (3, N'Keyboard', 500, 2, N'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVI-scE1BFn-BclSDW0oz167iu1dADH0Ha4Q&usqp=CAU')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl]) VALUES (4, N'SD Card', 1200, 3, N'https://images-na.ssl-images-amazon.com/images/I/61HKLHi9t4L._SL1100_.jpg')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl]) VALUES (5, N'Recliner', 40000, 4, N'https://rukminim1.flixcart.com/image/416/416/recliner/z/b/7/dr-single-leatherette-la-z-boy-black-original-imaehdtktva6mjvh.jpeg?q=70')
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductCost], [CategoryID], [productImageUrl]) VALUES (6, N'Dining table', 36000, 4, N'https://rukminim1.flixcart.com/image/416/416/jyhl1u80/dining-set/z/w/8/6-seater-na-rosewood-sheesham-tf-048-true-furniture-teak-finish-original-imafgpekuxjzvhgk.jpeg?q=70')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (1, N'Home Applience', 150)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (2, N'Computers', 0)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (3, N'Mobile', 50)
INSERT [dbo].[ProductCategory] ([CategoryID], [CategoryName], [DeliveryCharges]) VALUES (4, N'Furniture', 500)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
ALTER TABLE [dbo].[AppliedDiscount]  WITH CHECK ADD  CONSTRAINT [FK_AppliedDiscount_Discount] FOREIGN KEY([DiscountId])
REFERENCES [dbo].[Discount] ([DiscountId])
GO
ALTER TABLE [dbo].[AppliedDiscount] CHECK CONSTRAINT [FK_AppliedDiscount_Discount]
GO
ALTER TABLE [dbo].[AppliedDiscount]  WITH CHECK ADD  CONSTRAINT [FK_AppliedDiscount_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[AppliedDiscount] CHECK CONSTRAINT [FK_AppliedDiscount_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategory] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
USE [master]
GO
ALTER DATABASE [CartDb] SET  READ_WRITE 
GO
