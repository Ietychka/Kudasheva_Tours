USE [master]
GO
/****** Object:  Database [Kudasheva_Tours]    Script Date: 20.09.2023 18:10:59 ******/
CREATE DATABASE [Kudasheva_Tours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kudasheva_Tours', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kudasheva_Tours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kudasheva_Tours_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Kudasheva_Tours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Kudasheva_Tours] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kudasheva_Tours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kudasheva_Tours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kudasheva_Tours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kudasheva_Tours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kudasheva_Tours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kudasheva_Tours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kudasheva_Tours] SET  MULTI_USER 
GO
ALTER DATABASE [Kudasheva_Tours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kudasheva_Tours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kudasheva_Tours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kudasheva_Tours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kudasheva_Tours] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Kudasheva_Tours] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Kudasheva_Tours] SET QUERY_STORE = OFF
GO
USE [Kudasheva_Tours]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 20.09.2023 18:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 20.09.2023 18:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 20.09.2023 18:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[ID] [int] NOT NULL,
	[HotelID] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 20.09.2023 18:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[ID] [int] NOT NULL,
	[HotelID] [int] NOT NULL,
	[ImageSource] [varchar](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 20.09.2023 18:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[HotelID] [int] NOT NULL,
	[TourID] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC,
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 20.09.2023 18:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[ID] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 20.09.2023 18:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 20.09.2023 18:10:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AB', N'Абхазия                                                                                             ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AI', N'Англия                                                                                              ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BG', N'Болгария                                                                                            ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DE', N'Германия                                                                                            ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'EG', N'Египет                                                                                              ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GE', N'Грузия                                                                                              ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IL', N'Израиль                                                                                             ')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'RU', NULL)
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (1, N'Тип 1                                                                                               ', NULL)
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (2, N'Тип 2                                                                                               ', NULL)
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (3, N'Тип 3                                                                                               ', NULL)
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (4, N'Тип 4                                                                                               ', NULL)
INSERT [dbo].[Type] ([ID], [Name], [Description]) VALUES (5, N'Тип 5                                                                                               ', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([ID])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([ID])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([ID])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([ID])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([ID])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [Kudasheva_Tours] SET  READ_WRITE 
GO
