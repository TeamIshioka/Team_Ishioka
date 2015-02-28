USE [master]
GO
/****** Object:  Database [LibraryDB]    Script Date: 2/28/2015 11:26:10 AM ******/
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
/****** Object:  Table [dbo].[Book]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Disc]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Disc](
	[DiscId] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Ebook]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ebook](
	[EbookId] [int] IDENTITY(1,1) NOT NULL,
	[EbookTitle] [varchar](50) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[Publisher] [varchar](50) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[PublishedYear] [int] NOT NULL,
	[TotalPages] [int] NOT NULL,
	[ISBN] [varchar](20) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[AvailableCopies] [int] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[ThumbnailPicture] [varchar](200) NULL,
 CONSTRAINT [PK_Ebook] PRIMARY KEY CLUSTERED 
(
	[EbookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoldBook]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoldBook](
	[BookId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[NumberOfdays] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoldDisc]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoldDisc](
	[DiscId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[NumberOfDays] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoldEbook]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoldEbook](
	[EbookId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[NumberOfDays] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IssueBook]    Script Date: 2/28/2015 11:26:10 AM ******/
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
/****** Object:  Table [dbo].[IssueDisc]    Script Date: 2/28/2015 11:26:10 AM ******/
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
/****** Object:  Table [dbo].[IssueEbook]    Script Date: 2/28/2015 11:26:10 AM ******/
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
/****** Object:  Table [dbo].[Librarian]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Librarian](
	[LibrarianId] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[JoiningDate] [varchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[Manager]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerId] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Member]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Member](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[Payment]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[UserId] [int] NOT NULL,
	[PaymentType] [varchar](50) NOT NULL,
	[CardNumber] [varchar](16) NOT NULL,
	[NameOnCard] [varchar](50) NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[CSV] [int] NOT NULL,
	[BillingAddress] [varchar](20) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[Province] [varchar](20) NOT NULL,
	[PostalCode] [varchar](10) NOT NULL,
	[Country] [varchar](20) NOT NULL,
	[CellPhone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[CardNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PC]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PC](
	[PCId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](10) NULL,
 CONSTRAINT [PK_PC] PRIMARY KEY CLUSTERED 
(
	[PCId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReservePC]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReservePC](
	[PCId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Notes] [varchar](50) NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReserveRoom]    Script Date: 2/28/2015 11:26:10 AM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 2/28/2015 11:26:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
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
ALTER TABLE [dbo].[HoldBook]  WITH CHECK ADD  CONSTRAINT [FK_HoldBook_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[HoldBook] CHECK CONSTRAINT [FK_HoldBook_Book]
GO
ALTER TABLE [dbo].[HoldBook]  WITH CHECK ADD  CONSTRAINT [FK_HoldBook_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[HoldBook] CHECK CONSTRAINT [FK_HoldBook_UserId]
GO
ALTER TABLE [dbo].[HoldDisc]  WITH CHECK ADD  CONSTRAINT [FK_HoldDisc_DiscId] FOREIGN KEY([DiscId])
REFERENCES [dbo].[Disc] ([DiscId])
GO
ALTER TABLE [dbo].[HoldDisc] CHECK CONSTRAINT [FK_HoldDisc_DiscId]
GO
ALTER TABLE [dbo].[HoldDisc]  WITH CHECK ADD  CONSTRAINT [FK_HoldDisc_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[HoldDisc] CHECK CONSTRAINT [FK_HoldDisc_UserId]
GO
ALTER TABLE [dbo].[HoldEbook]  WITH CHECK ADD  CONSTRAINT [FK_HoldEbook_Ebook] FOREIGN KEY([EbookId])
REFERENCES [dbo].[Ebook] ([EbookId])
GO
ALTER TABLE [dbo].[HoldEbook] CHECK CONSTRAINT [FK_HoldEbook_Ebook]
GO
ALTER TABLE [dbo].[HoldEbook]  WITH CHECK ADD  CONSTRAINT [FK_HoldEbook_Member] FOREIGN KEY([UserId])
REFERENCES [dbo].[Member] ([UserId])
GO
ALTER TABLE [dbo].[HoldEbook] CHECK CONSTRAINT [FK_HoldEbook_Member]
GO
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
