USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 2021-06-06 5:08:46 PM ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShop', N'ON'
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE = OFF
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[About]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Image] [nvarchar](500) NULL,
	[MataTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MataTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [nchar](10) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MataTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nchar](250) NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
	[Tags] [nvarchar](500) NULL,
	[Language] [varchar](2) NULL,
	[MoreImages] [xml] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentTag]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentTag](
	[ContentID] [bigint] NOT NULL,
	[TagID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContentTag] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [varchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[ID] [nvarchar](2) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[IsDefault] [bit] NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[TypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CustomerID] [bigint] NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[productID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](20) NULL,
	[MataTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[IncludeVAT] [bit] NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[Warranty] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nchar](250) NULL,
	[Status] [bit] NULL,
	[TopHot] [datetime] NULL,
	[ViewCount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MataTitle] [varchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeywords] [nvarchar](250) NULL,
	[MetaDescription] [nchar](250) NULL,
	[Status] [bit] NULL,
	[ShowOnHome] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfig]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfig](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Value] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SystemConfig] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[GroupID] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[ProvinceID] [int] NULL,
	[DistrictID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 2021-06-06 5:08:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome], [Language]) VALUES (1, N'tin nước ngoài', NULL, NULL, 0, NULL, CAST(N'2021-05-27T22:46:14.510' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome], [Language]) VALUES (2, N'tin trong nước', NULL, NULL, 0, NULL, CAST(N'2021-05-27T22:46:24.787' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 0, NULL)
INSERT [dbo].[Category] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome], [Language]) VALUES (3, N'123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'vi')
INSERT [dbo].[Category] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome], [Language]) VALUES (4, N'liouy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'en')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status]) VALUES (1, N'<div>Địa chỉ: Hà Nội, Việt Nam</div><div>Sđt:09282819</div><div>Email:onlineshop.info@onlineshop.com.vn</div>', N'true      ')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MataTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount], [Tags], [Language], [MoreImages]) VALUES (1, N'tin tức', N'tin_tuc', N'mô tả
hai ba bốn', N'/Data/images/sim.jpg', 2, N'<p><span style="color:#e74c3c"><span style="font-size:18px"><strong>hai ba bốn</strong></span></span></p>

<p>tin tức</p>
', 1234, NULL, NULL, NULL, NULL, N'ddd', N'iuytr                                                                                                                                                                                                                                                     ', 1, NULL, NULL, N'tin tức, thời sự', NULL, NULL)
INSERT [dbo].[Content] ([ID], [Name], [MataTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount], [Tags], [Language], [MoreImages]) VALUES (2, N'123456', N'dadd', N'adrw', NULL, 1, N'<p>adfafa sauwr</p>
', 1, CAST(N'2021-06-04T17:02:11.950' AS DateTime), N'admin', CAST(N'2021-06-04T17:53:02.177' AS DateTime), NULL, N'ddd', N'iuytr                                                                                                                                                                                                                                                     ', 0, NULL, 0, N'tin tức', NULL, N'<Images />')
INSERT [dbo].[Content] ([ID], [Name], [MataTitle], [Description], [Image], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount], [Tags], [Language], [MoreImages]) VALUES (3, NULL, NULL, NULL, NULL, 1, NULL, NULL, CAST(N'2021-06-04T17:55:33.943' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, N'vi', N'<Images><Image>/Data/images/sim(1).jpg</Image></Images>')
SET IDENTITY_INSERT [dbo].[Content] OFF
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'thoi_su')
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (1, N'tin_tuc')
INSERT [dbo].[ContentTag] ([ContentID], [TagID]) VALUES (2, N'tin_tuc')
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (1, N'123', N'234', N'', N'456', N'', CAST(N'2021-06-01T22:55:40.583' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (2, N'123', N'234', N'ccCzasda', N'456', N'retret345', CAST(N'2021-06-01T22:55:56.640' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (3, N'123', N'', N'', N'', N'', CAST(N'2021-06-01T22:56:37.520' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (4, N'', N'', N'', N'456', N'', CAST(N'2021-06-01T22:56:50.790' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (5, N'qưer', N'3456', N'jhgfdsa', N'tyuiop', N'zxcvbnm', CAST(N'2021-06-01T22:59:52.143' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (6, N'', N'234', N'', N'', N'', CAST(N'2021-06-01T23:00:06.780' AS DateTime), NULL)
INSERT [dbo].[Feedback] ([ID], [Name], [Phone], [Email], [Address], [Content], [CreateDate], [Status]) VALUES (7, N'123', N'', N'', N'', N'', CAST(N'2021-06-01T23:00:23.250' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
INSERT [dbo].[Footer] ([ID], [Content], [Status]) VALUES (N'footer1', N'<div class="section group">
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Information</h4>
                    <ul>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="contact.html">Customer Service</a></li>
                        <li><a href="#">Advanced Search</a></li>
                        <li><a href="delivery.html">Orders and Returns</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Why buy from us</h4>
                    <ul>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="contact.html">Customer Service</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="contact.html">Site Map</a></li>
                        <li><a href="#">Search Terms</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>My account</h4>
                    <ul>
                        <li><a href="contact.html">Sign In</a></li>
                        <li><a href="index.html">View Cart</a></li>
                        <li><a href="#">My Wishlist</a></li>
                        <li><a href="#">Track My Order</a></li>
                        <li><a href="contact.html">Help</a></li>
                    </ul>
                </div>
                <div class="col_1_of_4 span_1_of_4">
                    <h4>Contact</h4>
                    <ul>
                        <li><span>+91-123-456789</span></li>
                        <li><span>+00-123-000000</span></li>
                    </ul>
                    <div class="social-icons">
                        <h4>Follow Us</h4>
                        <ul>
                            <li><a href="#" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"><img src="images/twitter.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"><img src="images/skype.png" alt="" /> </a></li>
                            <li><a href="#" target="_blank"> <img src="images/dribbble.png" alt="" /></a></li>
                            <li><a href="#" target="_blank"> <img src="images/linkedin.png" alt="" /></a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                </div>
            </div>', 1)
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'en', N'Tiếng Anh', 0)
INSERT [dbo].[Language] ([ID], [Name], [IsDefault]) VALUES (N'vi', N'Tiếng Việt', 1)
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (1, N'Trang chủ', N'/', 1, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (2, N'Giới thiệu', N'/gioi-thieu', 2, N'_blank', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (3, N'Tin tức', N'/tin-tuc', 3, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (4, N'Sản phẩm', N'/san-pham', 4, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (5, N'Liên hệ', N'/lien-he', 5, N'_self', 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (6, N'Register', N'/dang-ky', 1, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (7, N'Login', N'/dang-nhap', 2, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (8, N'Delivery', N'/delivery', 3, N'_self', 1, 2)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [TypeID]) VALUES (9, N'Checkout', N'/checkout', 4, N'_self', 1, 2)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'menu-main')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'menu-top')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (1, CAST(N'2021-06-01T16:07:49.030' AS DateTime), NULL, N'jaka ton', N'5567894', N'Hà Nội', N'sakura@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (2, CAST(N'2021-06-01T16:12:07.617' AS DateTime), NULL, N'jaka ty', N'44445555', N'tp', N'', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (3, CAST(N'2021-06-01T18:05:40.627' AS DateTime), NULL, N'jaka ton', N'44445555', N'Hà Nội', N'chitao5799@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (4, CAST(N'2021-06-01T18:07:20.733' AS DateTime), NULL, N'jaka ty', N'44445555', N'Hà Nội', N'chitao5799@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (5, CAST(N'2021-06-01T18:08:48.830' AS DateTime), NULL, N'jaka ton', N'44445555', N'Hoài Đức', N'chitao5799@gmail.com', NULL)
INSERT [dbo].[Order] ([ID], [CreatedDate], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [Status]) VALUES (6, CAST(N'2021-06-01T18:10:49.477' AS DateTime), NULL, N'jaka ton', N'44445555', N'Hoài Đức', N'chitao5799@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (5, 2, 1, CAST(850 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (5, 3, 1, CAST(850 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (6, 1, 3, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (6, 2, 5, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (6, 3, 3, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (6, 4, 1, CAST(600 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (8, 1, 1, CAST(1900 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (19, 1, 1, CAST(9863 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (19, 5, 1, CAST(9863 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([productID], [OrderID], [Quantity], [Price]) VALUES (19, 6, 1, CAST(9863 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (1, N'Máy tính để bàn', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(620 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham
"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"', NULL, CAST(N'2021-05-28T23:04:32.207' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (2, N'Loa', N'A002', N'loa', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic3.jpg', N'<Images><Image>http://localhost:57636/Data/images/sim.jpg</Image></Images>', CAST(900 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham
"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"', NULL, CAST(N'2021-05-28T23:04:39.083' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (3, N'Máy ảnh', N'A003', N'may-anh', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic1.jpg', N'<Images><Image>http://localhost:57636/Data/images/sim.jpg</Image></Images>', CAST(599 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'Where can I get some?
There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', NULL, CAST(N'2021-05-28T23:04:49.710' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (4, N'Máy tính samsung', N'A004', N'may-tinh', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic4.jpg', NULL, CAST(680 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'Where can I get some?
There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', NULL, CAST(N'2021-05-28T23:05:29.313' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (5, N'Máy ảnh kata', N'A005', N'may-anh', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/feature-pic3.jpg', NULL, CAST(850 AS Decimal(18, 0)), NULL, NULL, 0, 2, N'Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', NULL, CAST(N'2021-05-28T22:05:37.543' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-05-28T23:05:29.313' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (6, N'Loa ipsum', N'A006', N'loa', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/feature-pic1.jpg', NULL, CAST(600 AS Decimal(18, 0)), NULL, NULL, 0, 2, N'Where does it come from?
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', NULL, CAST(N'2021-05-28T22:06:15.427' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-05-28T23:05:29.313' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (7, N'Tivi', N'A007', N'tivi', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/feature-pic2.jpg', NULL, CAST(800 AS Decimal(18, 0)), NULL, NULL, 0, 2, N'Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', NULL, CAST(N'2021-05-28T22:06:23.343' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-05-28T23:05:29.313' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (8, N'Loa lorem', N'A008', N'loa', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/feature-pic4.jpg', NULL, CAST(1900 AS Decimal(18, 0)), NULL, NULL, 0, 2, N'Where does it come from?
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', NULL, CAST(N'2021-05-28T22:06:31.613' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2022-05-28T23:05:29.313' AS DateTime), 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (9, N'máy tính a1', N'A009', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic3.jpg', NULL, CAST(9200 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:43:54.740' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (11, N'Máy tính tr', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(3456 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (13, N'Máy tính y78', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(2341 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:49.360' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (15, N'Máy tính gh7', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(3345 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:52.663' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (17, N'Máy tính dell68', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(6789 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:56.027' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (19, N'Máy tính er', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(9863 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:58.683' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (21, N'Máy tính dee22', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(3452 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (22, N'Máy tính dê3', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(12345 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (23, N'Máy tính uio87', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(457756 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (24, N'Máy tính gty54', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(23398 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (25, N'Máy tính cv5', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(343556 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (26, N'Máy tính ee2', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(8096 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (27, N'Máy tính nj89', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(234 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-05-31T15:44:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (28, N'Máy tính ka123', N'A001', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic2.jpg', NULL, CAST(18754 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2002-05-31T15:44:45.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[Product] ([ID], [Name], [Code], [MataTitle], [Description], [Image], [MoreImages], [Price], [PromotionPrice], [IncludeVAT], [Quantity], [CategoryID], [Detail], [Warranty], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [TopHot], [ViewCount]) VALUES (29, N'máy tính hyu77', N'A009', N'desktop', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', N'/Assets/Client/images/new-pic3.jpg', NULL, CAST(456321 AS Decimal(18, 0)), NULL, NULL, 0, 3, N'1914 translation by H. Rackham', NULL, CAST(N'2021-06-03T15:43:54.740' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (1, N'Điện thoại di động', N'mobile-phone', NULL, 1, NULL, CAST(N'2021-05-28T21:51:23.580' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (2, N'DESKTOP', N'desktop', NULL, 1, NULL, CAST(N'2021-05-28T21:51:53.553' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (3, N'LAPTOP', N'laptop', NULL, 1, NULL, CAST(N'2021-05-28T21:52:07.893' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (4, N'ACCESSORIES', N'accessories', NULL, 1, NULL, CAST(N'2021-05-28T21:52:39.560' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (5, N'SOFTWARE', N'software', NULL, 1, NULL, CAST(N'2021-05-28T21:53:14.737' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (6, N'SPORTS & FITNESS', N'sport', NULL, 1, NULL, CAST(N'2021-05-28T21:53:25.843' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (7, N'FOOTWEAR', N'footwear', NULL, 1, NULL, CAST(N'2021-05-28T21:53:40.220' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (8, N'JEWELLERY', N'jewellery', 2, 1, NULL, CAST(N'2021-05-28T21:53:54.257' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (9, N'CLOTHING', N'clothing', NULL, 1, NULL, CAST(N'2021-05-28T21:54:08.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (10, N'HOME DECOR & KITCHEN', N'home-decor-kitchen', 1, 1, NULL, CAST(N'2021-05-28T21:54:30.183' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MataTitle], [ParentID], [DisplayOrder], [SeoTitle], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeywords], [MetaDescription], [Status], [ShowOnHome]) VALUES (11, N'BEAUTY & HEALTHCARE', N'beauth-healthcare', 1, 1, NULL, CAST(N'2021-05-28T21:54:54.937' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_CONTENT', N'Thêm tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADD_USER', N'Thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xóa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_CONTENT', N'Sửa tin tức')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'EDIT_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'VIEW_USER', N'Xem danh sách người dùng')
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'/Assets/Client/images/slide-1-image.png', 1, NULL, NULL, CAST(N'2021-05-28T22:23:25.050' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'/Assets/Client/images/slide-2-image.jpg', 2, NULL, NULL, CAST(N'2021-05-28T22:25:17.187' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'/Assets/Client/images/slide-3-image.jpg', 3, NULL, NULL, CAST(N'2021-05-28T22:25:23.503' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'thoi_su', N' thời sự')
INSERT [dbo].[Tag] ([ID], [Name]) VALUES (N'tin_tuc', N'tin tức')
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'admin', N'202cb962ac59075b964b07152d234b70', N'ADMIN', N'httk', N'ggg', NULL, N'0987654', NULL, NULL, CAST(N'2021-05-26T10:35:51.990' AS DateTime), NULL, CAST(N'2021-05-28T15:35:35.590' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'admin2', N'827ccb0eea8a706c4c34a16891f84e7b', N'MOD', N'httk', N'ttttt', N'ch9@gmail.com', N'0987654', NULL, NULL, NULL, NULL, CAST(N'2021-05-26T22:57:39.790' AS DateTime), NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'admin3', N'827ccb0eea8a706c4c34a16891f84e7b', N'MEMBER', N'h', N'Ho', N'c99@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'ttt', N'827ccb0eea8a706c4c34a16891f84e7b', N'MEMBER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'admin7', N'827ccb0eea8a706c4c34a16891f84e7b', N'MEMBER', N'rtetert', N'ertreee ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'adgh', N'123456', N'MEMBER', N'123456', N'Ho', N'chưetfds@gmail.com', N'0987654', NULL, NULL, CAST(N'2021-06-02T10:57:16.053' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'admee', N'1234567', N'MEMBER', N'123456', N'H', N'chtẻtr@gmail.com', NULL, NULL, NULL, CAST(N'2021-06-02T11:37:33.727' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'tyu', N'e10adc3949ba59abbe56e057f20f883e', N'MEMBER', N'123456', N'ytyy', N'chi9@gmail.com', N'0987654', 701, 70113, CAST(N'2021-06-03T16:55:22.873' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [ProvinceID], [DistrictID], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'ytutyy', N'b3275960d68fda9d831facc0426c3bbc', N'MEMBER', N'123456', NULL, N'c9fdgdfg9@gmail.com', NULL, 101, 0, CAST(N'2021-06-03T16:56:30.587' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'MOD', N'Moderator')
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Content] ADD  CONSTRAINT [DF_Content_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [DF_Feedback_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Language] ADD  CONSTRAINT [DF_Language_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((1)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('MEMBER') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
