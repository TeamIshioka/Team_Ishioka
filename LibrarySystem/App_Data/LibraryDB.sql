USE [master]
GO
/****** Object:  Database [LibraryDB]    Script Date: 3/4/2015 11:13:12 AM ******/
CREATE DATABASE [LibraryDB] ON  PRIMARY 
( NAME = N'LibraryDB', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL.2\MSSQL\DATA\LibraryDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryDB_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL.2\MSSQL\DATA\LibraryDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryDB] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDB] SET DB_CHAINING OFF 
GO
USE [LibraryDB]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1000,25) NOT NULL,
	[BookTitle] [varchar](50) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Publisher] [varchar](50) NOT NULL,
	[Category] [varchar](20) NOT NULL,
	[PublishedYear] [datetime] NOT NULL,
	[TotalPages] [int] NOT NULL,
	[ISBN] [varchar](20) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[ThumbnailPicture] [varchar](200) NULL,
	[AvailableCopies] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Disc]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Disc](
	[DiscId] [int] IDENTITY(20000,10) NOT NULL,
	[DiscTitle] [varchar](50) NOT NULL,
	[Artist] [varchar](50) NOT NULL,
	[Director] [varchar](50) NOT NULL,
	[Distributor] [varchar](50) NOT NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[Language] [varchar](20) NOT NULL,
	[Subtitle] [varchar](50) NOT NULL,
	[Category] [varchar](20) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Duration] [varchar](20) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[ThumbnailPicture] [varchar](200) NULL,
 CONSTRAINT [PK_Disc] PRIMARY KEY CLUSTERED 
(
	[DiscId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ebook]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ebook](
	[EbookId] [int] IDENTITY(5000,30) NOT NULL,
	[EbookTitle] [varchar](50) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Publisher] [varchar](50) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[PublishedYear] [datetime] NOT NULL,
	[TotalPages] [int] NOT NULL,
	[ISBN] [varchar](20) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[ThumbnailPicture] [varchar](200) NULL,
	[AvailableCopies] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Ebook] PRIMARY KEY CLUSTERED 
(
	[EbookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IssueBook]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueBook](
	[IssueBookId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[LibrarianId] [int] NOT NULL,
	[NumberOfdays] [int] NOT NULL,
 CONSTRAINT [PK_IssueBook] PRIMARY KEY CLUSTERED 
(
	[IssueBookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IssueDisc]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueDisc](
	[IssueDiscId] [int] IDENTITY(1,1) NOT NULL,
	[DiscId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[LibrarianId] [int] NOT NULL,
	[NumberOfDays] [int] NOT NULL,
 CONSTRAINT [PK_IssueDisc] PRIMARY KEY CLUSTERED 
(
	[IssueDiscId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IssueEbook]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueEbook](
	[IssueEbookId] [int] IDENTITY(1,1) NOT NULL,
	[EbookId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[LibrarianId] [int] NOT NULL,
	[NumberOfDays] [int] NOT NULL,
 CONSTRAINT [PK_IssueEbook] PRIMARY KEY CLUSTERED 
(
	[IssueEbookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Librarian](
	[LibrarianId] [int] IDENTITY(400700,45) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Province] [varchar](20) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[CellPhone] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Librarian] PRIMARY KEY CLUSTERED 
(
	[LibrarianId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerId] [int] IDENTITY(70050010,50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Province] [varchar](20) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[CellPhone] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[UserId] [int] IDENTITY(3001470,7) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Province] [varchar](20) NOT NULL,
	[PostalCode] [varchar](20) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[HomePhone] [varchar](20) NULL,
	[CellPhone] [varchar](20) NOT NULL,
	[Email] [varchar](20) NOT NULL,
	[Student] [char](10) NOT NULL,
	[SchoolName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[UserId] [int] NOT NULL,
	[PaymentType] [varchar](50) NOT NULL,
	[CardNumber] [varchar](19) NOT NULL,
	[NameOnCard] [varchar](50) NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[CSV] [int] NOT NULL,
	[BillingAddress] [varchar](20) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Province] [varchar](20) NOT NULL,
	[PostalCode] [varchar](6) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[CellPhone] [varchar](15) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PC]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PC](
	[PCId] [int] IDENTITY(100,1) NOT NULL,
	[Status] [varchar](10) NOT NULL,
 CONSTRAINT [PK_PC] PRIMARY KEY CLUSTERED 
(
	[PCId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId] [int] IDENTITY(10000,1) NOT NULL,
	[ItemType] [nvarchar](20) NOT NULL,
	[ItemId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[ExpireDate] [datetime] NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
	[PickupDate] [datetime] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Reservation_1] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReservePC]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReservePC](
	[PCId] [int] NOT NULL,
	[PCName] [varchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[Notes] [varchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReserveRoom]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReserveRoom](
	[RoomId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Notes] [varchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 3/4/2015 11:13:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(900,1) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookId], [BookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (1025, N'Divergent', N'Veronica Roth', N'Katherine Tegen Books', N'Science Fiction', CAST(0x000007DB00000000 AS DateTime), 487, N'0-06-202402-7', N'Divergent is the name of the book by Roth', N'abc.jpg', 10, N'Available')
INSERT [dbo].[Book] ([BookId], [BookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (1050, N'Harry Potter', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x00008B1800000000 AS DateTime), 300, N'0-07-112403-8', N'Harry Potter UK', N'harry.jpg', 10, N'Available')
INSERT [dbo].[Book] ([BookId], [BookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (1075, N'Ulysses', N'James Joyce', N'Sylvia Beach', N'Modernist Novel', CAST(0x0000836200000000 AS DateTime), 300, N'0-08-112408-2', N'James', N'james.jpg', 10, N'Available')
INSERT [dbo].[Book] ([BookId], [BookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (1125, N'Harry Potter 2', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x00008DF200000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry2.jpg', 10, N'Available')
INSERT [dbo].[Book] ([BookId], [BookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (1150, N'Harry Potter 3', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x000090CD00000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry3.jpg', 10, N'Available')
INSERT [dbo].[Book] ([BookId], [BookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (1175, N'Harry Potter 4', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x000093A700000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry4.jpg', 10, N'Available')
INSERT [dbo].[Book] ([BookId], [BookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (1200, N'Harry Potter 5', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x0000968200000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry5.jpg', 10, N'Available')
INSERT [dbo].[Book] ([BookId], [BookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (1225, N'Harry Potter 6', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x0000995C00000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry12.jpg', 10, N'Available')
INSERT [dbo].[Book] ([BookId], [BookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (1250, N'Harry Potter 7', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x00009C3700000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry34.jpg', 10, N'Available')
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Disc] ON 

INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20010, N'Pokemon the movie', N'Pikachu', N'Andy', N'Feng', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'Pokemon', N'3:00', N'Available', N'pokemon.jpg')
INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20020, N'Lego', N'LegoWorld', N'Mandeep', N'Singh', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'Lego', N'3:00', N'Available', N'lego.jpg')
INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20030, N'ATeam', N'Shah', N'Maunil', N'Shah', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'ATeam', N'3:00', N'Available', N'Ateam.jpg')
INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20040, N'Hellboy', N'Red', N'Hardik', N'Joshi', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'Joshi', N'3:00', N'Available', N'joshi.jpg')
INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20050, N'Batman', N'Bruce', N'Neha', N'khalwadekar', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'neha', N'3:00', N'Available', N'neha.jpg')
INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20060, N'Awesome', N'BigB', N'yashu', N'Ishioka', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'ishioka', N'3:00', N'Available', N'hero.jpg')
INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20070, N'Cool', N'George', N'Wei', N'Chan', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'wei', N'3:00', N'Available', N'wei.jpg')
INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20080, N'Hellboy2', N'Red', N'Hardik', N'Joshi', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'Joshi', N'3:00', N'Available', N'joshi.jpg')
INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20090, N'Batman3', N'Bruce', N'Neha', N'khalwadekar', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'neha', N'3:00', N'Available', N'neha.jpg')
INSERT [dbo].[Disc] ([DiscId], [DiscTitle], [Artist], [Director], [Distributor], [ReleaseDate], [Language], [Subtitle], [Category], [Description], [Duration], [Status], [ThumbnailPicture]) VALUES (20100, N'Awesome4', N'BigB', N'yashu', N'Ishioka', CAST(0x00008EE700000000 AS DateTime), N'English', N'English', N'Fantasy', N'ishioka', N'3:00', N'Available', N'hero.jpg')
SET IDENTITY_INSERT [dbo].[Disc] OFF
SET IDENTITY_INSERT [dbo].[Ebook] ON 

INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5030, N'Divergent', N'Veronica Roth', N'Katherine Tegen Books', N'Science Fiction', CAST(0x000007DB00000000 AS DateTime), 487, N'0-06-202402-7', N'Divergent is the name of the book by Roth', N'abc.jpg', 10, N'Available')
INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5060, N'Harry Potter', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x00008B1800000000 AS DateTime), 300, N'0-07-112403-8', N'Harry Potter UK', N'harry.jpg', 10, N'Available')
INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5090, N'Ulysses', N'James Joyce', N'Sylvia Beach', N'Modernist Novel', CAST(0x0000836200000000 AS DateTime), 300, N'0-08-112408-2', N'James', N'james.jpg', 10, N'Available')
INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5120, N'A Portrait of the Artist as a Young Man', N'James Joye', N'BW Huebsch', N'Modernist', CAST(0x0000183E00000000 AS DateTime), 320, N'0-09-114526-2', N'James Joyce', N'james2.jpg', 10, N'Available')
INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5150, N'Harry Potter 2', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x00008DF200000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry2.jpg', 10, N'Available')
INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5180, N'Harry Potter 3', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x000090CD00000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry3.jpg', 10, N'Available')
INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5210, N'Harry Potter 4', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x000093A700000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry4.jpg', 10, N'Available')
INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5240, N'Harry Potter 5', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x0000968200000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry5.jpg', 10, N'Available')
INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5270, N'Harry Potter 6', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x0000995C00000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry12.jpg', 10, N'Available')
INSERT [dbo].[Ebook] ([EbookId], [EbookTitle], [Author], [Publisher], [Category], [PublishedYear], [TotalPages], [ISBN], [Description], [ThumbnailPicture], [AvailableCopies], [Status]) VALUES (5300, N'Harry Potter 7', N'JK Rowling', N'Bloomsburry Publishing', N'Fantasy', CAST(0x00009C3700000000 AS DateTime), 326, N'0-07-112453-8', N'Harry Potter UK', N'harry34.jpg', 10, N'Available')
SET IDENTITY_INSERT [dbo].[Ebook] OFF
SET IDENTITY_INSERT [dbo].[Librarian] ON 

INSERT [dbo].[Librarian] ([LibrarianId], [Password], [FirstName], [MiddleName], [LastName], [JoiningDate], [Gender], [Address], [City], [Province], [PostalCode], [Country], [CellPhone], [Email]) VALUES (1, N'library12', N'Jake', NULL, N'Nesovic', CAST(0x0000903A00000000 AS DateTime), N'Male', N'Toronto', N'Toronto', N'ON', N'122322', N'Canada', N'1234567410', N'jake@gmail.com')
SET IDENTITY_INSERT [dbo].[Librarian] OFF
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([UserId], [Password], [FirstName], [MiddleName], [LastName], [Gender], [Address], [City], [Province], [PostalCode], [Country], [HomePhone], [CellPhone], [Email], [Student], [SchoolName]) VALUES (3001477, N'andy11', N'Andy', N'', N'Feng', N'Male', N'Scarborough', N'Toronto', N'ON', N'123456', N'Canada', NULL, N'1234567890', N'andy@gmail.com', N'Yes       ', N'Centennial')
INSERT [dbo].[Member] ([UserId], [Password], [FirstName], [MiddleName], [LastName], [Gender], [Address], [City], [Province], [PostalCode], [Country], [HomePhone], [CellPhone], [Email], [Student], [SchoolName]) VALUES (3001484, N'mandeep11', N'Mandeep', NULL, N'Singh', N'Male', N'Toronto', N'Toronto', N'ON', N'123456', N'Canada', NULL, N'1234569870', N'mani@gmail.com', N'Yes       ', N'Centennial')
INSERT [dbo].[Member] ([UserId], [Password], [FirstName], [MiddleName], [LastName], [Gender], [Address], [City], [Province], [PostalCode], [Country], [HomePhone], [CellPhone], [Email], [Student], [SchoolName]) VALUES (3001491, N'maunil11', N'Maunil', NULL, N'Shah', N'Male', N'Brampton', N'Brampton', N'ON', N'741852', N'Canada', NULL, N'4567891230', N'shah@gmail.com', N'No        ', N'N/A')
INSERT [dbo].[Member] ([UserId], [Password], [FirstName], [MiddleName], [LastName], [Gender], [Address], [City], [Province], [PostalCode], [Country], [HomePhone], [CellPhone], [Email], [Student], [SchoolName]) VALUES (3001498, N'neha11', N'Neha', NULL, N'Khalwadekar', N'female', N'Toronto', N'Toronto', N'ON', N'123456', N'Canada', NULL, N'1234569870', N'neha@gmail.com', N'Yes       ', N'Centennial')
INSERT [dbo].[Member] ([UserId], [Password], [FirstName], [MiddleName], [LastName], [Gender], [Address], [City], [Province], [PostalCode], [Country], [HomePhone], [CellPhone], [Email], [Student], [SchoolName]) VALUES (3001505, N'joshi11', N'Hardik', NULL, N'Joshi', N'Male', N'Toronto', N'Toronto', N'ON', N'123456', N'Canada', NULL, N'1234569870', N'hardik@gmail.com', N'No        ', N'N/A')
INSERT [dbo].[Member] ([UserId], [Password], [FirstName], [MiddleName], [LastName], [Gender], [Address], [City], [Province], [PostalCode], [Country], [HomePhone], [CellPhone], [Email], [Student], [SchoolName]) VALUES (3001512, N'wei11', N'Wei', NULL, N'Chan', N'Male', N'Toronto', N'Toronto', N'ON', N'123456', N'Canada', NULL, N'1234569870', N'wei@gmail.com', N'Yes       ', N'Centennial')
SET IDENTITY_INSERT [dbo].[Member] OFF
SET IDENTITY_INSERT [dbo].[PC] ON 

INSERT [dbo].[PC] ([PCId], [Status]) VALUES (101, N'Available')
INSERT [dbo].[PC] ([PCId], [Status]) VALUES (102, N'Available')
INSERT [dbo].[PC] ([PCId], [Status]) VALUES (103, N'Available')
INSERT [dbo].[PC] ([PCId], [Status]) VALUES (104, N'Available')
INSERT [dbo].[PC] ([PCId], [Status]) VALUES (105, N'Available')
INSERT [dbo].[PC] ([PCId], [Status]) VALUES (106, N'Available')
INSERT [dbo].[PC] ([PCId], [Status]) VALUES (107, N'Available')
INSERT [dbo].[PC] ([PCId], [Status]) VALUES (108, N'Available')
INSERT [dbo].[PC] ([PCId], [Status]) VALUES (109, N'Available')
INSERT [dbo].[PC] ([PCId], [Status]) VALUES (110, N'Available')
SET IDENTITY_INSERT [dbo].[PC] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [Capacity], [Status]) VALUES (900, 5, N'Available')
INSERT [dbo].[Room] ([RoomId], [Capacity], [Status]) VALUES (902, 5, N'Available')
SET IDENTITY_INSERT [dbo].[Room] OFF
ALTER TABLE [dbo].[IssueBook]  WITH CHECK ADD  CONSTRAINT [FK_IssueBook_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[IssueBook] CHECK CONSTRAINT [FK_IssueBook_BookId]
GO
ALTER TABLE [dbo].[IssueBook]  WITH CHECK ADD  CONSTRAINT [FK_IssueBook_LibrarianId] FOREIGN KEY([LibrarianId])
REFERENCES [dbo].[Librarian] ([LibrarianId])
GO
ALTER TABLE [dbo].[IssueBook] CHECK CONSTRAINT [FK_IssueBook_LibrarianId]
GO
ALTER TABLE [dbo].[IssueBook]  WITH CHECK ADD  CONSTRAINT [FK_IssueBook_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[IssueBook] CHECK CONSTRAINT [FK_IssueBook_UserId]
GO
ALTER TABLE [dbo].[IssueDisc]  WITH CHECK ADD  CONSTRAINT [FK_IssueDisc_DiscId] FOREIGN KEY([DiscId])
REFERENCES [dbo].[Disc] ([DiscId])
GO
ALTER TABLE [dbo].[IssueDisc] CHECK CONSTRAINT [FK_IssueDisc_DiscId]
GO
ALTER TABLE [dbo].[IssueDisc]  WITH CHECK ADD  CONSTRAINT [FK_IssueDisc_LibrarianId] FOREIGN KEY([LibrarianId])
REFERENCES [dbo].[Librarian] ([LibrarianId])
GO
ALTER TABLE [dbo].[IssueDisc] CHECK CONSTRAINT [FK_IssueDisc_LibrarianId]
GO
ALTER TABLE [dbo].[IssueDisc]  WITH CHECK ADD  CONSTRAINT [FK_IssueDisc_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[IssueDisc] CHECK CONSTRAINT [FK_IssueDisc_UserId]
GO
ALTER TABLE [dbo].[IssueEbook]  WITH CHECK ADD  CONSTRAINT [FK_IssueEbook_Ebook] FOREIGN KEY([EbookId])
REFERENCES [dbo].[Ebook] ([EbookId])
GO
ALTER TABLE [dbo].[IssueEbook] CHECK CONSTRAINT [FK_IssueEbook_Ebook]
GO
ALTER TABLE [dbo].[IssueEbook]  WITH CHECK ADD  CONSTRAINT [FK_IssueEbook_Librarian] FOREIGN KEY([LibrarianId])
REFERENCES [dbo].[Librarian] ([LibrarianId])
GO
ALTER TABLE [dbo].[IssueEbook] CHECK CONSTRAINT [FK_IssueEbook_Librarian]
GO
ALTER TABLE [dbo].[IssueEbook]  WITH CHECK ADD  CONSTRAINT [FK_IssueEbook_Member] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[IssueEbook] CHECK CONSTRAINT [FK_IssueEbook_Member]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_UserId]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Member] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Member]
GO
ALTER TABLE [dbo].[ReservePC]  WITH CHECK ADD  CONSTRAINT [FK_ReservePC_PCId] FOREIGN KEY([PCId])
REFERENCES [dbo].[PC] ([PCId])
GO
ALTER TABLE [dbo].[ReservePC] CHECK CONSTRAINT [FK_ReservePC_PCId]
GO
ALTER TABLE [dbo].[ReservePC]  WITH CHECK ADD  CONSTRAINT [FK_ReservePC_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[ReservePC] CHECK CONSTRAINT [FK_ReservePC_UserId]
GO
ALTER TABLE [dbo].[ReserveRoom]  WITH CHECK ADD  CONSTRAINT [FK_ReserveRoom_Member] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[ReserveRoom] CHECK CONSTRAINT [FK_ReserveRoom_Member]
GO
ALTER TABLE [dbo].[ReserveRoom]  WITH CHECK ADD  CONSTRAINT [FK_ReserveRoom_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[ReserveRoom] CHECK CONSTRAINT [FK_ReserveRoom_Room]
GO
USE [master]
GO
ALTER DATABASE [LibraryDB] SET  READ_WRITE 
GO
