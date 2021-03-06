USE [master]
GO
DROP DATABASE [TPW24] /*detruire l'ancienne base de données */
GO
/****** Object:  Database [TPW24]    Script Date: 2014-05-16 11:02:13 ******/
CREATE DATABASE [TPW24]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TPW24', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TPW24.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TPW24_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TPW24_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[Applications]    Script Date: 2014-05-16 11:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[ApplicationName] [nvarchar](235) NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Boards]    Script Date: 2014-05-16 11:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Boards](
	[BoardID] [int] IDENTITY(1,1) NOT NULL,
	[BoardName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BoardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 2014-05-16 11:02:13 ******/
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
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2014-05-16 11:02:13 ******/
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
PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrivateMsgs]    Script Date: 2014-05-16 11:02:13 ******/
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
PRIMARY KEY CLUSTERED 
(
	[PrivateMsgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 2014-05-16 11:02:13 ******/
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
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2014-05-16 11:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[Description] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 2014-05-16 11:02:13 ******/
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
PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2014-05-16 11:02:13 ******/
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
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 2014-05-16 11:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersOpenAuthAccounts]    Script Date: 2014-05-16 11:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersOpenAuthAccounts](
	[ApplicationName] [nvarchar](128) NOT NULL,
	[ProviderName] [nvarchar](128) NOT NULL,
	[ProviderUserId] [nvarchar](128) NOT NULL,
	[ProviderUserName] [nvarchar](max) NOT NULL,
	[MembershipUserName] [nvarchar](128) NOT NULL,
	[LastUsedUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationName] ASC,
	[ProviderName] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UsersOpenAuthData]    Script Date: 2014-05-16 11:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersOpenAuthData](
	[ApplicationName] [nvarchar](128) NOT NULL,
	[MembershipUserName] [nvarchar](128) NOT NULL,
	[HasLocalPassword] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationName] ASC,
	[MembershipUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Utilisateurs]    Script Date: 2014-05-16 11:02:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Utilisateurs](
	[UserID] [uniqueidentifier] NOT NULL,
	[photoProfil] [varchar](500) NULL,
	[FirstName] [nvarchar](60) NULL,
	[LastName] [nvarchar](60) NULL,
	[Sexe] [char](1) NULL,
	[Country] [varchar](60) NULL,
	[Province] [varchar](60) NULL,
	[City] [varchar](60) NULL,
	[DateNais] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Applications] ([ApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'654f50e7-e247-488a-9b66-8cfaa49879ac', NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'3nXQIlmnCW069lajDIHHBTT5Tej4KeRrCBZTbMzNoUw=', 1, N'j59RSWltZJlUiW5dIbjWSg==', N'clairitsapolis@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A32200768146 AS DateTime), CAST(0x0000A32200768146 AS DateTime), CAST(0x0000A32200768146 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'699b3bec-4f2d-465b-bed0-19c815a4b9f5', N'pfmJKCycL/ImYtUA5vveMgbFM1bMl3inhL8JbvZLCFQ=', 1, N'WD8S5pknwML1lKTRVjtByg==', N'landyland12@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A3220108737A AS DateTime), CAST(0x0000A3220108737A AS DateTime), CAST(0x0000A3220108737A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'8664a2e6-9bcf-4ba7-9a3c-27e5975b98ae', N'rhw/AHsorFhRoJaoVNPB858plf+nw73Be2YO/yXbpaI=', 1, N'7KwFoMR3xqvMVqlU7NE2LA==', N'ann24@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A3220080072D AS DateTime), CAST(0x0000A3220080072D AS DateTime), CAST(0x0000A3220080072D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'38b03650-c2be-4e6c-8ae0-32da39df2971', N'I2VGcJmCl+2+S95fZ3PtXRmZgwun9LQ5rMYW/7M+u/U=', 1, N'FInCGFcb0Aoj1og/ToOw1Q==', N'landyland@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A3220107F81C AS DateTime), CAST(0x0000A3220107F81C AS DateTime), CAST(0x0000A3220107F81C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'c981f19a-950f-4113-b262-40406cc69616', N'anpwktsjn8QubjRPl0/UCFvuQ5w06leh4Y+4D0FY5xo=', 1, N'R0RRgBeMzlKLQVMzzyamkw==', N'miracle123@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A322007E6359 AS DateTime), CAST(0x0000A322007E6359 AS DateTime), CAST(0x0000A322007E6359 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'e2ddcf8e-278b-4b9a-8835-6defeb68fd5e', N'qQRtGF8t8PPPlykFR5/hNvaaU6ID7V6JqLfY4yEALTg=', 1, N'P0sjkhWri6hD546Us7Mc8w==', N'dave@w24.com', NULL, NULL, 1, 0, CAST(0x0000A322007300E9 AS DateTime), CAST(0x0000A322007300E9 AS DateTime), CAST(0x0000A322007300E9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'38916b3f-27df-43e9-8bc6-702c2d43dbed', N'qgtfxNN7YwVjK5u7oFKROVXQWXqzPDK0wpcnlwcXHTU=', 1, N'6TR2btenrlh6+ZtKagfkTQ==', N'yumyum@live.ca', NULL, NULL, 1, 0, CAST(0x0000A32B01057BA4 AS DateTime), CAST(0x0000A32B01057BA4 AS DateTime), CAST(0x0000A32B01057BA4 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'02b8fb5b-18d5-481f-af69-757c6f23ddcf', N'+VmrNz+A+KL/6fmIpoLijVRkcz3klsOVcRAo/abLjVE=', 1, N'lWQ1D6DrdqqHEGSPDkpBGg==', N'chefjuanpi@yahoo.com', NULL, NULL, 0, 0, CAST(0x0000A32D00F0B656 AS DateTime), CAST(0x0000A32D00F0B656 AS DateTime), CAST(0x0000A32D00F0B656 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'7b03013e-5d21-4321-9a4f-98fe30a1b232', N'1tn9aPe4qg97i9vjSM/MjJU1/1DeCTahauqK7SBR/Vg=', 1, N'mj5dPKnel9Ef29J0CNHuhg==', N'pepito@chiste.ca', NULL, NULL, 1, 0, CAST(0x0000A3220073B47A AS DateTime), CAST(0x0000A3220073B47A AS DateTime), CAST(0x0000A3220073B47A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'3f926ab6-4b8d-4aaf-bd59-b063770ad231', N'MtZriEqD2vmZY7p5ZPwhLmZ6HcerD6p4h5P2/L5rkyc=', 1, N'q58xrXodMvY3++W6O4Iwow==', N'pablo@jojo.noel', NULL, NULL, 1, 0, CAST(0x0000A3200150180F AS DateTime), CAST(0x0000A32B00793BE9 AS DateTime), CAST(0x0000A3200150180F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'73d34188-eeb1-4703-a155-ca9bf55b92fe', N's7ylUmy3joOEml6v3Y4UEn0P1MDUBuqKFjr19AeW/HM=', 1, N'Dm7dyQTvp5Pk8kXlXSncmQ==', N'peter@uqac.ca', NULL, NULL, 1, 0, CAST(0x0000A322007F7F77 AS DateTime), CAST(0x0000A322007F7F77 AS DateTime), CAST(0x0000A322007F7F77 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'79562e20-10d7-48b8-87b5-dfc940800737', N'LKukEARhuVeUH7yWEy7iLA+6+mvT5x2TvkelxHBi+8k=', 1, N'JmFkcXY26T32D4vmJcO/vQ==', N'stella@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A3220079F0FF AS DateTime), CAST(0x0000A3220079F0FF AS DateTime), CAST(0x0000A3220079F0FF AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'460b98ed-62fd-489f-ada6-e12869fe7376', N'aS2GV+pZ5j0NQQ/fC5U+chb4YXR4TFBxJVnpY6Sp0yg=', 1, N'J8oR8wnsTvd+DVRpAZi9UA==', N'tim@Burton.ca', NULL, NULL, 1, 0, CAST(0x0000A322007D0598 AS DateTime), CAST(0x0000A322007D0598 AS DateTime), CAST(0x0000A322007D0598 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'710ca842-e67c-4c8f-9aaf-f0a05b5c0f0c', N'Admin', NULL)
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'claire', 0, CAST(0x0000A322007681C8 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'699b3bec-4f2d-465b-bed0-19c815a4b9f5', N'bobby1', 0, CAST(0x0000A322010873C1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'8664a2e6-9bcf-4ba7-9a3c-27e5975b98ae', N'anita123', 0, CAST(0x0000A32200800744 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'38b03650-c2be-4e6c-8ae0-32da39df2971', N'bobby', 0, CAST(0x0000A3220107F895 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'c981f19a-950f-4113-b262-40406cc69616', N'petitpouce', 0, CAST(0x0000A322007E638A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'e2ddcf8e-278b-4b9a-8835-6defeb68fd5e', N'Dave', 0, CAST(0x0000A322007305FD AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'38916b3f-27df-43e9-8bc6-702c2d43dbed', N'Killer34', 0, CAST(0x0000A32B01057BC1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'02b8fb5b-18d5-481f-af69-757c6f23ddcf', N'Pablo123', 0, CAST(0x0000A32D00F0B678 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'7b03013e-5d21-4321-9a4f-98fe30a1b232', N'pepito', 0, CAST(0x0000A3220073B530 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'389ab6e8-40cb-44c3-aeb2-ae3444cef9f2', N'Pablote', 0, CAST(0x0000A32B0079A25F AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'3f926ab6-4b8d-4aaf-bd59-b063770ad231', N'Pablo', 0, CAST(0x0000A32B00793BE9 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'73d34188-eeb1-4703-a155-ca9bf55b92fe', N'peter', 0, CAST(0x0000A322007F800B AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'79562e20-10d7-48b8-87b5-dfc940800737', N'Stella', 0, CAST(0x0000A3220079F136 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'460b98ed-62fd-489f-ada6-e12869fe7376', N'JSparrow', 0, CAST(0x0000A322007D0615 AS DateTime))
INSERT [dbo].[UsersOpenAuthAccounts] ([ApplicationName], [ProviderName], [ProviderUserId], [ProviderUserName], [MembershipUserName], [LastUsedUtc]) VALUES (N'/', N'facebook', N'1055585736', N'chefjuanpi@yahoo.com', N'Pablo123', CAST(0x0000A32D00F0D7EE AS DateTime))
INSERT [dbo].[UsersOpenAuthData] ([ApplicationName], [MembershipUserName], [HasLocalPassword]) VALUES (N'/', N'Pablo123', 0)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', NULL, N'Claire', N'Popolis', N'F', N'Canada', N'Québec', N'Alma', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'699b3bec-4f2d-465b-bed0-19c815a4b9f5', NULL, N'Bobby', N'Landy', N'H', N'', N'', N'', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'8664a2e6-9bcf-4ba7-9a3c-27e5975b98ae', NULL, N'Anna', N'Frank', N'F', N'Alemagne', N'Cologne', N'Cologne', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'c981f19a-950f-4113-b262-40406cc69616', NULL, N'Laura', N'Tremblay', N'F', N'Canada', N'Québec', N'Alma', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'e2ddcf8e-278b-4b9a-8835-6defeb68fd5e', NULL, N'dave', N'cote', N'H', N'Canada', N'Québec', N'Chicoutimi', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'38916b3f-27df-43e9-8bc6-702c2d43dbed', NULL, N'Marie', N'Lachance', N'F', N'Australie', N'Belbourne', N'Sidney', CAST(0x0000000000000000 AS DateTime))
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'02b8fb5b-18d5-481f-af69-757c6f23ddcf', N'~/images/utilisateurs/Pablo123.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'7b03013e-5d21-4321-9a4f-98fe30a1b232', NULL, N'Jorge', N'Pepe', N'H', N'Canada', N'Québec', N'Chicoutimi', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'3f926ab6-4b8d-4aaf-bd59-b063770ad231', N'~/images/utilisateurs/pablo.jpg', N'Pablo', N'Aguilar-Lliguin', N'H', N'Canada', N'Quebec', N'Chicoutimi', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'73d34188-eeb1-4703-a155-ca9bf55b92fe', NULL, N'Spiderman', N'Parker', N'H', N'Canada', N'Quebec', N'Chicoutimi', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'79562e20-10d7-48b8-87b5-dfc940800737', NULL, N'Stella', N'Arthoise', N'F', N'Canada', N'Québec', N'Alma', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [photoProfil], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [DateNais]) VALUES (N'460b98ed-62fd-489f-ada6-e12869fe7376', NULL, N'Tim', N'Burton', N'H', N'Canada', N'Québec', N'Montreal', NULL)
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
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topics] ([TopicID])
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD FOREIGN KEY([WrittenBy])
REFERENCES [dbo].[Utilisateurs] ([UserID])
GO
ALTER TABLE [dbo].[PrivateMsgs]  WITH CHECK ADD FOREIGN KEY([SentTo])
REFERENCES [dbo].[Utilisateurs] ([UserID])
GO
ALTER TABLE [dbo].[PrivateMsgs]  WITH CHECK ADD FOREIGN KEY([WrittenBy])
REFERENCES [dbo].[Utilisateurs] ([UserID])
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
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD FOREIGN KEY([BoardID])
REFERENCES [dbo].[Boards] ([BoardID])
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD FOREIGN KEY([StartedBy])
REFERENCES [dbo].[Utilisateurs] ([UserID])
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
ALTER TABLE [dbo].[UsersOpenAuthAccounts]  WITH CHECK ADD  CONSTRAINT [OpenAuthAccount_UserData] FOREIGN KEY([ApplicationName], [MembershipUserName])
REFERENCES [dbo].[UsersOpenAuthData] ([ApplicationName], [MembershipUserName])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersOpenAuthAccounts] CHECK CONSTRAINT [OpenAuthAccount_UserData]
GO
USE [master]
GO
ALTER DATABASE [TPW24] SET  READ_WRITE 
GO
