USE [master]
GO
/****** Object:  Database [PropertyManager]    Script Date: 10/6/2020 5:24:29 PM ******/
CREATE DATABASE [PropertyManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PropertyManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PropertyManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PropertyManager] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PropertyManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PropertyManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PropertyManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PropertyManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PropertyManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PropertyManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [PropertyManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PropertyManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PropertyManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PropertyManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PropertyManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PropertyManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PropertyManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PropertyManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PropertyManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PropertyManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PropertyManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PropertyManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PropertyManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PropertyManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PropertyManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PropertyManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PropertyManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PropertyManager] SET RECOVERY FULL 
GO
ALTER DATABASE [PropertyManager] SET  MULTI_USER 
GO
ALTER DATABASE [PropertyManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PropertyManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PropertyManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PropertyManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PropertyManager] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PropertyManager', N'ON'
GO
ALTER DATABASE [PropertyManager] SET QUERY_STORE = OFF
GO
USE [PropertyManager]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 10/6/2020 5:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[ApartmentId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingId] [int] NOT NULL,
	[ApartmentNum] [nvarchar](5) NOT NULL,
	[SquareFeet] [int] NOT NULL,
	[Bathrooms] [int] NOT NULL,
	[Rent] [smallmoney] NOT NULL,
	[TenantId] [nvarchar](50) NULL,
	[AdminId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Apartment_1] PRIMARY KEY CLUSTERED 
(
	[ApartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentEx1B]    Script Date: 10/6/2020 5:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentEx1B](
	[ApartmentId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[ApartmentNum] [nvarchar](5) NOT NULL,
	[SquareFeet] [int] NOT NULL,
	[Bathrooms] [int] NOT NULL,
	[Rent] [smallmoney] NOT NULL,
	[TenantName] [nvarchar](50) NULL,
	[AdminName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Apartment] PRIMARY KEY CLUSTERED 
(
	[ApartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 10/6/2020 5:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BuildingId] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](15) NOT NULL,
	[Zip] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BuildingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 10/6/2020 5:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(10001,1) NOT NULL,
	[ApartmentId] [int] NOT NULL,
	[InvoiceDate] [smalldatetime] NOT NULL,
	[DueDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_InvoiceId] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineItem]    Script Date: 10/6/2020 5:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItem](
	[LineItemId] [int] IDENTITY(1001,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[Description] [nvarchar](25) NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_LineItemId] PRIMARY KEY CLUSTERED 
(
	[LineItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 10/6/2020 5:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[BuildingName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 10/6/2020 5:24:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ReceiptId] [int] IDENTITY(101,1) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[ReceiptDate] [smalldatetime] NOT NULL,
	[Amount] [smallmoney] NOT NULL,
 CONSTRAINT [PK_ReceiptId] PRIMARY KEY CLUSTERED 
(
	[ReceiptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Apartment] ON 

INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (1, 1, N'101', 400, 1, 550.0000, N'1', NULL)
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (2, 1, N'102', 550, 1, 700.0000, N'2', NULL)
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (3, 1, N'103', 700, 1, 900.0000, N'3', NULL)
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (4, 1, N'104', 400, 1, 550.0000, N'4', NULL)
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (6, 1, N'105', 900, 2, 1200.0000, N'5', NULL)
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (7, 2, N'201', 600, 1, 700.0000, N'6', NULL)
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (10, 2, N'202', 1000, 2, 1200.0000, N'7', NULL)
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (13, 2, N'203', 800, 1, 950.0000, N'8', NULL)
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (14, 2, N'204', 600, 1, 700.0000, N'9', NULL)
INSERT [dbo].[Apartment] ([ApartmentId], [BuildingId], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantId], [AdminId]) VALUES (17, 2, N'205', 1200, 2, 1400.0000, N'10', NULL)
SET IDENTITY_INSERT [dbo].[Apartment] OFF
GO
SET IDENTITY_INSERT [dbo].[ApartmentEx1B] ON 

INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (1, N'Southeast Apartments', N'308 Pioneer Rd', N'101', 400, 1, 550.0000, NULL, N'Hill')
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (2, N'Southeast Apartments', N'308 Pioneer Rd', N'102', 550, 1, 700.0000, NULL, N'Hill')
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (3, N'Southeast Apartments', N'308 Pioneer Rd', N'103', 700, 1, 900.0000, NULL, N'Hill')
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (5, N'Southeast Apartments', N'308 Pioneer Rd', N'104', 400, 1, 550.0000, NULL, N'Hill')
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (6, N'Southeast Apartments', N'308 Pioneer Rd', N'105', 900, 2, 1200.0000, NULL, N'Hill')
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (7, N'Southwest Apartments', N'1250 Homer Rd', N'201', 600, 1, 700.0000, NULL, N'Hill')
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (8, N'Southwest Apartments', N'1250 Homer Rd', N'202', 1000, 2, 1200.0000, NULL, N'Hill')
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (9, N'Southwest Apartments', N'1250 Homer Rd', N'203', 800, 1, 950.0000, NULL, N'Hill')
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (10, N'Southwest Apartments', N'1250 Homer Rd', N'204', 600, 1, 700.0000, NULL, N'Hill')
INSERT [dbo].[ApartmentEx1B] ([ApartmentId], [BuildingName], [Address], [ApartmentNum], [SquareFeet], [Bathrooms], [Rent], [TenantName], [AdminName]) VALUES (12, N'Southwest Apartments', N'1250 Homer Rd', N'205', 1200, 2, 1400.0000, NULL, N'Hill')
SET IDENTITY_INSERT [dbo].[ApartmentEx1B] OFF
GO
SET IDENTITY_INSERT [dbo].[Building] ON 

INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (2, N'Southeast Apartments', N'308 Pioneer Rd', N'Red Wing', N'MN', N'55066     ')
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (3, N'Southwest Apartments', N'1250 Homer Rd', N'Winona', N'MN', N'55987     ')
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (4, N'Northeast Apartments', N'123 Lake View Dr', N'Winona', N'MN', N'55987     ')
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (6, N'Northwest Apartments', N'468 West Ave', N'La Crosse', N'WI', N'54601     ')
INSERT [dbo].[Building] ([BuildingId], [BuildingName], [Address], [City], [State], [Zip]) VALUES (8, N'Uptown Apartments', N'9898 Red Wing Ave', N'Red Wing', N'MN', N'55066     ')
SET IDENTITY_INSERT [dbo].[Building] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10001, 1, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10003, 2, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10004, 3, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10005, 5, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10006, 6, CAST(N'2018-09-21T00:00:00' AS SmallDateTime), CAST(N'2018-10-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10007, 1, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10008, 2, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10009, 3, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10010, 5, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[Invoice] ([InvoiceId], [ApartmentId], [InvoiceDate], [DueDate]) VALUES (10011, 6, CAST(N'2018-10-21T00:00:00' AS SmallDateTime), CAST(N'2018-11-01T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[LineItem] ON 

INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1001, 10001, N'Rent, October 2018', 750.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1002, 10001, N'Electricity', 50.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1003, 10001, N'Gas', 40.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1004, 10001, N'Garage', 60.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1005, 10001, N'Cable TV/Internet', 70.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1006, 10002, N'Rent, October 2018', 700.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1007, 10002, N'Electricity', 45.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1008, 10002, N'Gas', 40.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1009, 10002, N'Garage', 55.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1010, 10002, N'Cable TV/Internet', 65.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1011, 10003, N'Rent, October 2018', 900.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1012, 10003, N'Electricity', 75.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1013, 10003, N'Gas', 65.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1014, 10003, N'Garage', 100.0000)
INSERT [dbo].[LineItem] ([LineItemId], [InvoiceId], [Description], [Amount]) VALUES (1015, 10003, N'Cable TV/Internet', 90.0000)
SET IDENTITY_INSERT [dbo].[LineItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [Name], [Role], [BuildingName], [PhoneNumber]) VALUES (2, N'Luke Brimley', N'Tenant', N'Southeast Apartments', CAST(5556182519 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [Name], [Role], [BuildingName], [PhoneNumber]) VALUES (3, N'Josh Crabtree', N'Tenant', N'Southwest Apartments', CAST(5552156187 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [Name], [Role], [BuildingName], [PhoneNumber]) VALUES (4, N'Jack Wilson', N'Tenant', N'Northeast Apartments', CAST(5554657543 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [Name], [Role], [BuildingName], [PhoneNumber]) VALUES (5, N'Jim Brewster', N'Tenant', N'Northwest Apartments', CAST(5554125434 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [Name], [Role], [BuildingName], [PhoneNumber]) VALUES (6, N'Calder Hill', N'Admin', N'Southeast Apartments', CAST(5552121234 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [Name], [Role], [BuildingName], [PhoneNumber]) VALUES (7, N'Calder Hill', N'Admin', N'Southwest Apartments', CAST(5552121234 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [Name], [Role], [BuildingName], [PhoneNumber]) VALUES (8, N'Willie Hays', N'Admin', N'Northeast Apartments', CAST(5554657513 AS Numeric(18, 0)))
INSERT [dbo].[Person] ([PersonId], [Name], [Role], [BuildingName], [PhoneNumber]) VALUES (9, N'Willie Hays', N'Admin', N'Northwest Apartments', CAST(5554657513 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [ReceiptDate], [Amount]) VALUES (101, 10001, CAST(N'2018-10-01T00:00:00' AS SmallDateTime), 970.0000)
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [ReceiptDate], [Amount]) VALUES (103, 10002, CAST(N'2018-10-01T00:00:00' AS SmallDateTime), 905.0000)
INSERT [dbo].[Receipt] ([ReceiptId], [InvoiceId], [ReceiptDate], [Amount]) VALUES (104, 10003, CAST(N'2018-10-01T00:00:00' AS SmallDateTime), 1230.0000)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
GO
USE [master]
GO
ALTER DATABASE [PropertyManager] SET  READ_WRITE 
GO
