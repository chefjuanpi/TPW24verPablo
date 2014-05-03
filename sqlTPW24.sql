USE [TPW24]
GO
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [UsersInRoleUser]
GO
ALTER TABLE [dbo].[UsersInRoles] DROP CONSTRAINT [UsersInRoleRole]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UserApplication]
GO
ALTER TABLE [dbo].[Topics] DROP CONSTRAINT [FK__Topics__StartedB__15502E78]
GO
ALTER TABLE [dbo].[Topics] DROP CONSTRAINT [FK__Topics__BoardID__145C0A3F]
GO
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [RoleApplication]
GO
ALTER TABLE [dbo].[Profiles] DROP CONSTRAINT [UserProfile]
GO
ALTER TABLE [dbo].[PrivateMsgs] DROP CONSTRAINT [FK__PrivateMs__Writt__1BFD2C07]
GO
ALTER TABLE [dbo].[PrivateMsgs] DROP CONSTRAINT [FK__PrivateMs__SentT__1CF15040]
GO
ALTER TABLE [dbo].[Messages] DROP CONSTRAINT [FK__Messages__Writte__1920BF5C]
GO
ALTER TABLE [dbo].[Messages] DROP CONSTRAINT [FK__Messages__TopicI__182C9B23]
GO
ALTER TABLE [dbo].[Memberships] DROP CONSTRAINT [MembershipUser]
GO
ALTER TABLE [dbo].[Memberships] DROP CONSTRAINT [MembershipApplication]
GO
/****** Object:  Table [dbo].[Utilisateurs]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[Utilisateurs]
GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[UsersInRoles]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[Topics]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[Profiles]
GO
/****** Object:  Table [dbo].[PrivateMsgs]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[PrivateMsgs]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[Messages]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[Memberships]
GO
/****** Object:  Table [dbo].[Boards]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[Boards]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 03/05/2014 17:08:17 ******/
DROP TABLE [dbo].[Applications]
GO
USE [master]
GO
/****** Object:  Database [TPW24]    Script Date: 03/05/2014 17:08:17 ******/
DROP DATABASE [TPW24]
GO
/****** Object:  Database [TPW24]    Script Date: 03/05/2014 17:08:17 ******/
CREATE DATABASE [TPW24]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TPW24', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TPW24.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TPW24_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TPW24_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TPW24] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TPW24].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TPW24] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TPW24] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TPW24] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TPW24] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TPW24] SET ARITHABORT OFF 
GO
ALTER DATABASE [TPW24] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TPW24] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TPW24] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TPW24] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TPW24] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TPW24] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TPW24] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TPW24] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TPW24] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TPW24] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TPW24] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TPW24] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TPW24] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TPW24] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TPW24] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TPW24] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TPW24] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TPW24] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TPW24] SET RECOVERY FULL 
GO
ALTER DATABASE [TPW24] SET  MULTI_USER 
GO
ALTER DATABASE [TPW24] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TPW24] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TPW24] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TPW24] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TPW24', N'ON'
GO
USE [TPW24]
GO
/****** Object:  Table [dbo].[Applications]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationName] [nvarchar](235) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK__Applicat__C93A4C99DB4735F1] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Boards]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Boards](
	[BoardID] [int] IDENTITY(1,1) NOT NULL,
	[BoardName] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Boards__F9646BD240EAF453] PRIMARY KEY CLUSTERED 
(
	[BoardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[PasswordQuestion] [nvarchar](256) NULL,
	[PasswordAnswer] [nvarchar](128) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowsStart] [datetime] NOT NULL,
	[Comment] [nvarchar](256) NULL,
 CONSTRAINT [PK__Membersh__1788CC4CABA37E24] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NULL,
	[WrittenBy] [uniqueidentifier] NULL,
	[DateWritten] [date] NOT NULL,
	[DateLastEdited] [date] NULL,
	[Content] [ntext] NOT NULL,
	[IsBlocked] [bit] NULL,
 CONSTRAINT [PK__Messages__C87C037C18F20B45] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrivateMsgs]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateMsgs](
	[PrivateMsgID] [int] IDENTITY(1,1) NOT NULL,
	[WrittenBy] [uniqueidentifier] NULL,
	[SentTo] [uniqueidentifier] NULL,
	[DateWritten] [date] NOT NULL,
	[Content] [ntext] NOT NULL,
 CONSTRAINT [PK__PrivateM__A6B4D420168FAAF5] PRIMARY KEY CLUSTERED 
(
	[PrivateMsgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [nvarchar](4000) NOT NULL,
	[PropertyValueStrings] [nvarchar](4000) NOT NULL,
	[PropertyValueBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Profiles__1788CC4C1E506F23] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
 CONSTRAINT [PK__Roles__8AFACE1A0BB4851F] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topics](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[BoardID] [int] NULL,
	[StartedBy] [uniqueidentifier] NULL,
	[TopicTitle] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Topics__022E0F7DB9C55345] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Users__1788CC4C2D3D43BB] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__UsersInR__AF2760AD5099C1BC] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Utilisateurs]    Script Date: 03/05/2014 17:08:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Utilisateurs](
	[UserID] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](60) NULL,
	[LastName] [nvarchar](60) NULL,
	[Sexe] [char](1) NULL,
	[Country] [varchar](60) NULL,
	[Province] [varchar](60) NULL,
	[City] [varchar](60) NULL,
	[CreationDate] [date] NULL,
	[DateLastLogin] [date] NULL,
 CONSTRAINT [PK__Utilisat__1788CCACE6438F47] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Applications] ([ApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'654f50e7-e247-488a-9b66-8cfaa49879ac', NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'3f926ab6-4b8d-4aaf-bd59-b063770ad231', N'MtZriEqD2vmZY7p5ZPwhLmZ6HcerD6p4h5P2/L5rkyc=', 1, N'q58xrXodMvY3++W6O4Iwow==', N'pablo@jojo.noel', NULL, NULL, 1, 0, CAST(0x0000A3200150180F AS DateTime), CAST(0x0000A3200150180F AS DateTime), CAST(0x0000A3200150180F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'710ca842-e67c-4c8f-9aaf-f0a05b5c0f0c', N'Admin', NULL)
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'3f926ab6-4b8d-4aaf-bd59-b063770ad231', N'Pablo', 0, CAST(0x0000A320015018C3 AS DateTime))
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [CreationDate], [DateLastLogin]) VALUES (N'3f926ab6-4b8d-4aaf-bd59-b063770ad231', N'Pablo', N'Aguilar-Lliguin', N'H', N'Canada', N'Quebec', N'Chicoutimi', CAST(0x7B380B00 AS Date), CAST(0x7B380B00 AS Date))
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipApplication]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [MembershipUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [MembershipUser]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK__Messages__TopicI__182C9B23] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topics] ([TopicID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK__Messages__TopicI__182C9B23]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK__Messages__Writte__1920BF5C] FOREIGN KEY([WrittenBy])
REFERENCES [dbo].[Utilisateurs] ([UserID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK__Messages__Writte__1920BF5C]
GO
ALTER TABLE [dbo].[PrivateMsgs]  WITH CHECK ADD  CONSTRAINT [FK__PrivateMs__SentT__1CF15040] FOREIGN KEY([SentTo])
REFERENCES [dbo].[Utilisateurs] ([UserID])
GO
ALTER TABLE [dbo].[PrivateMsgs] CHECK CONSTRAINT [FK__PrivateMs__SentT__1CF15040]
GO
ALTER TABLE [dbo].[PrivateMsgs]  WITH CHECK ADD  CONSTRAINT [FK__PrivateMs__Writt__1BFD2C07] FOREIGN KEY([WrittenBy])
REFERENCES [dbo].[Utilisateurs] ([UserID])
GO
ALTER TABLE [dbo].[PrivateMsgs] CHECK CONSTRAINT [FK__PrivateMs__Writt__1BFD2C07]
GO
ALTER TABLE [dbo].[Profiles]  WITH CHECK ADD  CONSTRAINT [UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Profiles] CHECK CONSTRAINT [UserProfile]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [RoleApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [RoleApplication]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK__Topics__BoardID__145C0A3F] FOREIGN KEY([BoardID])
REFERENCES [dbo].[Boards] ([BoardID])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK__Topics__BoardID__145C0A3F]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK__Topics__StartedB__15502E78] FOREIGN KEY([StartedBy])
REFERENCES [dbo].[Utilisateurs] ([UserID])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK__Topics__StartedB__15502E78]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [UserApplication] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([ApplicationId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [UserApplication]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleRole]
GO
ALTER TABLE [dbo].[UsersInRoles]  WITH CHECK ADD  CONSTRAINT [UsersInRoleUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersInRoles] CHECK CONSTRAINT [UsersInRoleUser]
GO
USE [master]
GO
ALTER DATABASE [TPW24] SET  READ_WRITE 
GO
