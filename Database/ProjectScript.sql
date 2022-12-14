USE [master]
GO
/****** Object:  Database [Project]    Script Date: 11-11-2022 16:07:46 ******/
CREATE DATABASE [Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project] SET RECOVERY FULL 
GO
ALTER DATABASE [Project] SET  MULTI_USER 
GO
ALTER DATABASE [Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Project', N'ON'
GO
ALTER DATABASE [Project] SET QUERY_STORE = OFF
GO
USE [Project]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 11-11-2022 16:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] NOT NULL,
	[AuthorName] [varchar](100) NOT NULL,
	[Experience] [int] NOT NULL,
	[BookID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 11-11-2022 16:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookReferenceNo]  AS ('BOOKNO'+right(replicate('0',(3))+CONVERT([varchar],[BookID]),(3))),
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[NumberOfPages] [int] NOT NULL,
	[NumberOfVolume] [int] NOT NULL,
	[PublishDate] [date] NOT NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11-11-2022 16:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11-11-2022 16:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 11-11-2022 16:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] NOT NULL,
	[SubCategoryName] [varchar](50) NOT NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11-11-2022 16:07:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MobileNo] [char](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Gender] [varchar](20) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Hobbies] [varchar](500) NULL,
	[ProfilePic] [varchar](300) NULL,
	[Password] [varchar](50) NOT NULL,
	[RoleID] [int] NULL,
	[ProfilePicPath] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Experience], [BookID]) VALUES (1, N'H.C. Verma', 50, 1)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Experience], [BookID]) VALUES (2, N'R.D. Sharma', 40, 2)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Experience], [BookID]) VALUES (3, N'S.N. Dhawan', 30, 3)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Experience], [BookID]) VALUES (4, N'S.C. Kheterpal', 30, 3)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Experience], [BookID]) VALUES (5, N'J.K. Rowling', 25, 4)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Experience], [BookID]) VALUES (6, N'Frank Herbert', 45, 5)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Experience], [BookID]) VALUES (7, N'A.P.J. Abdul Kalam', 40, 6)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Experience], [BookID]) VALUES (8, N'Arun Tiwari', 40, 6)
INSERT [dbo].[Author] ([AuthorID], [AuthorName], [Experience], [BookID]) VALUES (9, N'Anne Frank', 3, 7)
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [Title], [NumberOfPages], [NumberOfVolume], [PublishDate], [CategoryID]) VALUES (1, N'Concepts of Physics', 800, 2, CAST(N'2022-01-01' AS Date), 1)
INSERT [dbo].[Book] ([BookID], [Title], [NumberOfPages], [NumberOfVolume], [PublishDate], [CategoryID]) VALUES (2, N'Mathematics for Class 12', 600, 2, CAST(N'2022-01-01' AS Date), 1)
INSERT [dbo].[Book] ([BookID], [Title], [NumberOfPages], [NumberOfVolume], [PublishDate], [CategoryID]) VALUES (3, N'New Course Chemistry', 700, 2, CAST(N'2022-01-04' AS Date), 1)
INSERT [dbo].[Book] ([BookID], [Title], [NumberOfPages], [NumberOfVolume], [PublishDate], [CategoryID]) VALUES (4, N'Harry Potter', 4200, 7, CAST(N'1997-06-26' AS Date), 2)
INSERT [dbo].[Book] ([BookID], [Title], [NumberOfPages], [NumberOfVolume], [PublishDate], [CategoryID]) VALUES (5, N'Dune', 2400, 6, CAST(N'1965-08-08' AS Date), 2)
INSERT [dbo].[Book] ([BookID], [Title], [NumberOfPages], [NumberOfVolume], [PublishDate], [CategoryID]) VALUES (6, N'Wings of Freedom', 180, 1, CAST(N'1999-01-01' AS Date), 3)
INSERT [dbo].[Book] ([BookID], [Title], [NumberOfPages], [NumberOfVolume], [PublishDate], [CategoryID]) VALUES (7, N'The Diary of a Young Girl', 714, 1, CAST(N'1947-06-25' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Education')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Fiction')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Non-Fiction')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'User')
GO
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (1, N'Physics', 1)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (2, N'Mathematics', 1)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (3, N'Chemistry', 1)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (4, N'Fantasy', 2)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (5, N'Science', 2)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (6, N'Autobiography', 3)
INSERT [dbo].[SubCategory] ([SubCategoryID], [SubCategoryName], [CategoryID]) VALUES (7, N'Memoir', 3)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Name], [MobileNo], [Email], [Gender], [DateOfBirth], [Hobbies], [ProfilePic], [Password], [RoleID], [ProfilePicPath]) VALUES (1, N'Rishabh Shukla', N'9810671330', N'rishabhshukla647@gmail.com', N'Male', CAST(N'2000-07-09' AS Date), N'Cricket, Football, Films, Comics, Anime', N'264318099_1151252592083425_3379176892772917912_n.jpg', N'AJ@CR7styles', 1, N'C:\Users\rshukla1\Documents\Project\Project\wwwroot\Upload')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Author]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK_Users_MobileNo] CHECK  (([MobileNo] like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK_Users_MobileNo]
GO
USE [master]
GO
ALTER DATABASE [Project] SET  READ_WRITE 
GO
