USE [master]
GO
/****** Object:  Database [TPW24]    Script Date: 2014-05-27 15:06:53 ******/
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
/****** Object:  Table [dbo].[Applications]    Script Date: 2014-05-27 15:06:53 ******/
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
/****** Object:  Table [dbo].[BoardCategories]    Script Date: 2014-05-27 15:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BoardCategories](
	[BoardCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[BoardCategoryName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BoardCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Boards]    Script Date: 2014-05-27 15:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Boards](
	[BoardID] [int] IDENTITY(1,1) NOT NULL,
	[BoardName] [varchar](100) NOT NULL,
	[BoardCategoryID] [int] NULL,
	[Description] [varchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[BoardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 2014-05-27 15:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorType] [varchar](60) NULL,
	[ErrorMsg] [varchar](2048) NULL,
	[ErrorDate] [datetime] NULL,
	[AdditionalInfo] [varchar](1024) NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 2014-05-27 15:06:54 ******/
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
/****** Object:  Table [dbo].[Messages]    Script Date: 2014-05-27 15:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NULL,
	[WrittenBy] [uniqueidentifier] NULL,
	[DateWritten] [datetime] NULL,
	[DateLastEdited] [datetime] NULL,
	[Content] [ntext] NOT NULL,
	[IsBlocked] [bit] NULL,
 CONSTRAINT [PK__Messages__C87C037C67EE70D9] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrivateMsgs]    Script Date: 2014-05-27 15:06:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PrivateMsgs](
	[PrivateMsgID] [int] IDENTITY(1,1) NOT NULL,
	[WrittenBy] [uniqueidentifier] NULL,
	[SentTo] [uniqueidentifier] NULL,
	[DateWritten] [datetime] NULL,
	[Content] [ntext] NOT NULL,
	[PrivateMsgTitle] [varchar](60) NULL,
 CONSTRAINT [PK__PrivateM__A6B4D42044DE3ED2] PRIMARY KEY CLUSTERED 
(
	[PrivateMsgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 2014-05-27 15:06:54 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 2014-05-27 15:06:54 ******/
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
/****** Object:  Table [dbo].[Topics]    Script Date: 2014-05-27 15:06:54 ******/
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
	[StartedDate] [datetime] NULL,
	[ViewCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2014-05-27 15:06:54 ******/
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
/****** Object:  Table [dbo].[UsersInRoles]    Script Date: 2014-05-27 15:06:54 ******/
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
/****** Object:  Table [dbo].[UsersOpenAuthAccounts]    Script Date: 2014-05-27 15:06:54 ******/
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
/****** Object:  Table [dbo].[UsersOpenAuthData]    Script Date: 2014-05-27 15:06:54 ******/
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
/****** Object:  Table [dbo].[Utilisateurs]    Script Date: 2014-05-27 15:06:54 ******/
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
	[photoProfil] [varchar](500) NULL,
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
SET IDENTITY_INSERT [dbo].[BoardCategories] ON 

INSERT [dbo].[BoardCategories] ([BoardCategoryID], [BoardCategoryName]) VALUES (1, N'Culture Québécoise')
INSERT [dbo].[BoardCategories] ([BoardCategoryID], [BoardCategoryName]) VALUES (2, N'Ressources')
INSERT [dbo].[BoardCategories] ([BoardCategoryID], [BoardCategoryName]) VALUES (3, N'Autre & Discussion Générale')
SET IDENTITY_INSERT [dbo].[BoardCategories] OFF
SET IDENTITY_INSERT [dbo].[Boards] ON 

INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (3, N'Cuisine', 1, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (4, N'Histoire', 1, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (5, N'Cinéma', 1, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (6, N'Musique', 1, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (7, N'Théâtre', 1, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (8, N'Autre', 1, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (9, N'Téléphones importants', 2, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (10, N'Lieux importants', 2, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (11, N'Lois québécoises', 2, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (12, N'Autre', 2, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (13, N'Nouveautés', 3, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (14, N'Commentaires & Suggestions', 3, NULL)
INSERT [dbo].[Boards] ([BoardID], [BoardName], [BoardCategoryID], [Description]) VALUES (15, N'Discussion générale', 3, NULL)
SET IDENTITY_INSERT [dbo].[Boards] OFF
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 

INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1, N'System.Data.SqlClient.SqlException', N'Échec de la conversion d''une chaîne de caractères en uniqueidentifier.', CAST(0x0000A33400B93351 AS DateTime), N'Méthode DB.ExecuteNonQuery()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (2, N'System.Data.SqlClient.SqlException', N'Échec de la conversion d''une chaîne de caractères en uniqueidentifier.', CAST(0x0000A33400B9BEA1 AS DateTime), N'Méthode DB.ExecuteNonQuery()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (3, N'System.Data.SqlClient.SqlException', N'Échec de la conversion d''une chaîne de caractères en uniqueidentifier.', CAST(0x0000A33400BA135A AS DateTime), N'Méthode DB.ExecuteNonQuery()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (4, N'System.Data.SqlClient.SqlException', N'Échec de la conversion d''une chaîne de caractères en uniqueidentifier.', CAST(0x0000A33400BA7CDF AS DateTime), N'Méthode DB.ExecuteNonQuery()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (5, N'System.Data.SqlClient.SqlException', N'Le nom de variable ''@sentTo'' a déjà été déclaré. Les noms de variables doivent être uniques dans un traitement de requêtes ou une procédure stockée.', CAST(0x0000A33400BB1BD4 AS DateTime), N'Méthode DB.ExecuteNonQuery()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (6, N'System.InvalidCastException', N'Échec de la conversion de la valeur de paramètre d''un String en un Guid.', CAST(0x0000A33400BB417A AS DateTime), N'Méthode DB.ExecuteNonQuery()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (7, N'System.Data.SqlClient.SqlException', N'Le nom de variable ''@writtenBy'' a déjà été déclaré. Les noms de variables doivent être uniques dans un traitement de requêtes ou une procédure stockée.', CAST(0x0000A33400BC80BE AS DateTime), N'Méthode DB.ExecuteNonQuery()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (8, N'System.Data.SqlClient.SqlException', N'L''identificateur en plusieurs parties "m.WrittenBy" ne peut pas être lié.
L''identificateur en plusieurs parties "m.SentTo" ne peut pas être lié.
Le préfixe de colonne ''m'' ne correspond ni au nom de table ni au nom d''alias utilisés dans la requête.', CAST(0x0000A33400BE2986 AS DateTime), N'Méthode ExecuteReader()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (9, N'System.Data.SqlClient.SqlException', N'L''identificateur en plusieurs parties "m.WrittenBy" ne peut pas être lié.
L''identificateur en plusieurs parties "m.SentTo" ne peut pas être lié.
Le préfixe de colonne ''m'' ne correspond ni au nom de table ni au nom d''alias utilisés dans la requête.', CAST(0x0000A33400BE5609 AS DateTime), N'Méthode ExecuteReader()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (10, N'System.Web.HttpException', N'DataBinding : ''System.Data.DataRowView'' ne comporte pas de propriété appelée ''t''.', CAST(0x0000A33400C4AAB9 AS DateTime), N'Méthode DB.BindRepeater()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (11, N'System.Web.HttpException', N'DataBinding : ''System.Data.DataRowView'' ne comporte pas de propriété appelée ''t''.', CAST(0x0000A33400C4B13B AS DateTime), N'Méthode DB.BindRepeater()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (12, N'System.Web.HttpException', N'DataBinding : ''System.Data.DataRowView'' ne comporte pas de propriété appelée ''t''.', CAST(0x0000A33400C4B9ED AS DateTime), N'Méthode DB.BindRepeater()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (13, N'System.Web.HttpException', N'DataBinding : ''System.Data.DataRowView'' ne comporte pas de propriété appelée ''t''.', CAST(0x0000A33400C513A8 AS DateTime), N'Méthode DB.BindRepeater()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (14, N'System.Data.SqlClient.SqlException', N'L''identificateur en plusieurs parties "m.WrittenBy" ne peut pas être lié.
L''identificateur en plusieurs parties "m.SentTo" ne peut pas être lié.
Le préfixe de colonne ''m'' ne correspond ni au nom de table ni au nom d''alias utilisés dans la requête.', CAST(0x0000A33400F2AD6C AS DateTime), N'Méthode ExecuteReader()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (15, N'System.Data.SqlClient.SqlException', N'L''identificateur en plusieurs parties "m.WrittenBy" ne peut pas être lié.
L''identificateur en plusieurs parties "m.SentTo" ne peut pas être lié.
Le préfixe de colonne ''m'' ne correspond ni au nom de table ni au nom d''alias utilisés dans la requête.', CAST(0x0000A33400F2BBCA AS DateTime), N'Méthode ExecuteReader()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1013, N'System.InvalidOperationException', N'Un espace réservé d''élément doit être spécifié dans le ListView ''lvTopics''. Spécifiez un espace réservé d''élément en affectant la valeur "itemPlaceHolder" à la propriété ID d''un contrôle. Le contrôle d''espace réservé d''élément doit également spécifier runat="server".', CAST(0x0000A33700C9AE6F AS DateTime), N'Méthode DB.BindListView(ListView, DataTable)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1014, N'System.InvalidOperationException', N'Un espace réservé d''élément doit être spécifié dans le ListView ''lvTopics''. Spécifiez un espace réservé d''élément en affectant la valeur "itemPlaceHolder" à la propriété ID d''un contrôle. Le contrôle d''espace réservé d''élément doit également spécifier runat="server".', CAST(0x0000A33700C9FC0C AS DateTime), N'Méthode DB.BindListView(ListView, DataTable)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1015, N'System.InvalidOperationException', N'ExecuteReader nécessite une Connection ouverte et disponible. La connexion est actuellement fermée.', CAST(0x0000A33700CCD397 AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1016, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCD39C AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1017, N'System.InvalidOperationException', N'ExecuteReader nécessite une Connection ouverte et disponible. La connexion est actuellement fermée.', CAST(0x0000A33700CCD39D AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1018, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCD3A5 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1019, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCD3A6 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1020, N'System.InvalidOperationException', N'ExecuteReader nécessite une Connection ouverte et disponible. La connexion est actuellement fermée.', CAST(0x0000A33700CCD3B5 AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1021, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCD3B6 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1022, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCD3BE AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1023, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCD3E9 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1024, N'System.Web.HttpException', N'DataBinding : ''System.Data.DataRowView'' ne comporte pas de propriété appelée ''WrittenBy''.', CAST(0x0000A33700CCF35E AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1025, N'System.Web.HttpException', N'DataBinding : ''System.Data.DataRowView'' ne comporte pas de propriété appelée ''UserID''.', CAST(0x0000A33700CCF35F AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1026, N'System.Web.HttpException', N'DataBinding : ''System.Data.DataRowView'' ne comporte pas de propriété appelée ''TopicID''.', CAST(0x0000A33700CCF362 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1027, N'System.InvalidOperationException', N'Un DataReader associé à cette Command est déjà ouvert. Il doit d''abord être fermé.', CAST(0x0000A33700CCF387 AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1028, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCF387 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1029, N'System.InvalidOperationException', N'Un DataReader associé à cette Command est déjà ouvert. Il doit d''abord être fermé.', CAST(0x0000A33700CCF388 AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1030, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCF388 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1031, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCF38A AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1032, N'System.NullReferenceException', N'La référence d''objet n''est pas définie à une instance d''un objet.', CAST(0x0000A33700CCF3B1 AS DateTime), N'Méthode DB.OpenCon()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1033, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCF3B2 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1034, N'System.Web.HttpException', N'DataBinding : ''System.Data.DataRowView'' ne comporte pas de propriété appelée ''WrittenBy''.', CAST(0x0000A33700CCF3B3 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1035, N'System.Web.HttpException', N'DataBinding : ''System.Data.DataRowView'' ne comporte pas de propriété appelée ''StartedBy''.', CAST(0x0000A33700CCF3B5 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1036, N'System.InvalidOperationException', N'Tentative d''appel de MetaData non valide lorsque le lecteur est fermé.', CAST(0x0000A33700CCF3BB AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1037, N'System.InvalidOperationException', N'Erreur irrécupérable de connexion interne.', CAST(0x0000A33700CCF3BE AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1038, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCF3C5 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1039, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CCF3C8 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1040, N'System.InvalidOperationException', N'La connexion n''est pas fermée. L''état actuel de la connexion est en cours de connexion.', CAST(0x0000A33700CD2A4D AS DateTime), N'Méthode DB.OpenCon()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1041, N'System.InvalidOperationException', N'Un DataReader associé à cette Command est déjà ouvert. Il doit d''abord être fermé.', CAST(0x0000A33700CD2A67 AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1042, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CD2A85 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1043, N'System.InvalidOperationException', N'Un DataReader associé à cette Command est déjà ouvert. Il doit d''abord être fermé.', CAST(0x0000A33700CE766C AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1044, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CE766D AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1045, N'System.InvalidOperationException', N'Un DataReader associé à cette Command est déjà ouvert. Il doit d''abord être fermé.', CAST(0x0000A33700CE766D AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1046, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CE766E AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1047, N'System.NullReferenceException', N'La référence d''objet n''est pas définie à une instance d''un objet.', CAST(0x0000A33700CE7D52 AS DateTime), N'Méthode DB.OpenCon()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1048, N'System.InvalidOperationException', N'Un DataReader associé à cette Command est déjà ouvert. Il doit d''abord être fermé.', CAST(0x0000A33700CE7D55 AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1049, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CE7D55 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1050, N'System.InvalidOperationException', N'Un DataReader associé à cette Command est déjà ouvert. Il doit d''abord être fermé.', CAST(0x0000A33700CE8BDF AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1051, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CE8BE0 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1052, N'System.InvalidOperationException', N'Un DataReader associé à cette Command est déjà ouvert. Il doit d''abord être fermé.', CAST(0x0000A33700CE8FF1 AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1053, N'System.InvalidOperationException', N'Un DataReader associé à cette Command est déjà ouvert. Il doit d''abord être fermé.', CAST(0x0000A33700CE8FF1 AS DateTime), N'Méthode DB.FillDataSet()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1054, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CE8FF2 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1055, N'System.Web.HttpException', N'Le IListSource ne contient pas de source de données.', CAST(0x0000A33700CE8FF3 AS DateTime), N'Méthode DB.BindControl(Repeater, DataSet)')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1056, N'System.Data.SqlClient.SqlException', N'L''identificateur en plusieurs parties "m.WrittenBy" ne peut pas être lié.
L''identificateur en plusieurs parties "m.SentTo" ne peut pas être lié.
Le préfixe de colonne ''m'' ne correspond ni au nom de table ni au nom d''alias utilisés dans la requête.', CAST(0x0000A33700CF6842 AS DateTime), N'Méthode ExecuteReader()')
INSERT [dbo].[ErrorLog] ([ErrorID], [ErrorType], [ErrorMsg], [ErrorDate], [AdditionalInfo]) VALUES (1057, N'System.Data.SqlClient.SqlException', N'L''identificateur en plusieurs parties "m.WrittenBy" ne peut pas être lié.
L''identificateur en plusieurs parties "m.SentTo" ne peut pas être lié.
Le préfixe de colonne ''m'' ne correspond ni au nom de table ni au nom d''alias utilisés dans la requête.', CAST(0x0000A33700D24BEC AS DateTime), N'Méthode ExecuteReader()')
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'3nXQIlmnCW069lajDIHHBTT5Tej4KeRrCBZTbMzNoUw=', 1, N'j59RSWltZJlUiW5dIbjWSg==', N'clairitsapolis@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A32200768146 AS DateTime), CAST(0x0000A32200768146 AS DateTime), CAST(0x0000A32200768146 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'699b3bec-4f2d-465b-bed0-19c815a4b9f5', N'pfmJKCycL/ImYtUA5vveMgbFM1bMl3inhL8JbvZLCFQ=', 1, N'WD8S5pknwML1lKTRVjtByg==', N'landyland12@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A3220108737A AS DateTime), CAST(0x0000A3220108737A AS DateTime), CAST(0x0000A3220108737A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'8664a2e6-9bcf-4ba7-9a3c-27e5975b98ae', N'rhw/AHsorFhRoJaoVNPB858plf+nw73Be2YO/yXbpaI=', 1, N'7KwFoMR3xqvMVqlU7NE2LA==', N'ann24@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A3220080072D AS DateTime), CAST(0x0000A3220080072D AS DateTime), CAST(0x0000A3220080072D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'38b03650-c2be-4e6c-8ae0-32da39df2971', N'I2VGcJmCl+2+S95fZ3PtXRmZgwun9LQ5rMYW/7M+u/U=', 1, N'FInCGFcb0Aoj1og/ToOw1Q==', N'landyland@yahoo.com', NULL, NULL, 1, 0, CAST(0x0000A3220107F81C AS DateTime), CAST(0x0000A3220107F81C AS DateTime), CAST(0x0000A3220107F81C AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'c981f19a-950f-4113-b262-40406cc69616', N'anpwktsjn8QubjRPl0/UCFvuQ5w06leh4Y+4D0FY5xo=', 1, N'R0RRgBeMzlKLQVMzzyamkw==', N'miracle123@gmail.com', NULL, NULL, 1, 0, CAST(0x0000A322007E6359 AS DateTime), CAST(0x0000A322007E6359 AS DateTime), CAST(0x0000A322007E6359 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'e2ddcf8e-278b-4b9a-8835-6defeb68fd5e', N'qQRtGF8t8PPPlykFR5/hNvaaU6ID7V6JqLfY4yEALTg=', 1, N'P0sjkhWri6hD546Us7Mc8w==', N'dave@w24.com', NULL, NULL, 1, 0, CAST(0x0000A322007300E9 AS DateTime), CAST(0x0000A322007300E9 AS DateTime), CAST(0x0000A322007300E9 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'21b75f69-66c5-41cf-9801-8a95a45043f7', N'Hc/zPoBUiFpXYhi4qZAaBzhNARL9QsXz6QIFc4PB5eU=', 1, N'6ii2NYMdurRNKFoNeflwOA==', N'chefjuanpi@gmail.com', NULL, NULL, 0, 0, CAST(0x0000A325010AF54D AS DateTime), CAST(0x0000A325010AF54D AS DateTime), CAST(0x0000A325010AF54D AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'7b03013e-5d21-4321-9a4f-98fe30a1b232', N'1tn9aPe4qg97i9vjSM/MjJU1/1DeCTahauqK7SBR/Vg=', 1, N'mj5dPKnel9Ef29J0CNHuhg==', N'pepito@chiste.ca', NULL, NULL, 1, 0, CAST(0x0000A3220073B47A AS DateTime), CAST(0x0000A3220073B47A AS DateTime), CAST(0x0000A3220073B47A AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'3f926ab6-4b8d-4aaf-bd59-b063770ad231', N'MtZriEqD2vmZY7p5ZPwhLmZ6HcerD6p4h5P2/L5rkyc=', 1, N'q58xrXodMvY3++W6O4Iwow==', N'pablo@jojo.noel', NULL, NULL, 1, 0, CAST(0x0000A3200150180F AS DateTime), CAST(0x0000A3200150180F AS DateTime), CAST(0x0000A3200150180F AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'73d34188-eeb1-4703-a155-ca9bf55b92fe', N's7ylUmy3joOEml6v3Y4UEn0P1MDUBuqKFjr19AeW/HM=', 1, N'Dm7dyQTvp5Pk8kXlXSncmQ==', N'peter@uqac.ca', NULL, NULL, 1, 0, CAST(0x0000A322007F7F77 AS DateTime), CAST(0x0000A322007F7F77 AS DateTime), CAST(0x0000A322007F7F77 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'4325cafa-7515-426d-bf4d-d7816fd89467', N'b6DjKKawu9wBbZ0zGAuhWcHpxprdn47haOkyKigvFsU=', 1, N'/3xiMo8jYWH2v6/63TDCQg==', N'industwetrust@live.ca', NULL, NULL, 1, 0, CAST(0x0000A3310133AE20 AS DateTime), CAST(0x0000A33100F1C320 AS DateTime), CAST(0x0000A3310133AE20 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'79562e20-10d7-48b8-87b5-dfc940800737', N'LKukEARhuVeUH7yWEy7iLA+6+mvT5x2TvkelxHBi+8k=', 1, N'JmFkcXY26T32D4vmJcO/vQ==', N'stella@hotmail.com', NULL, NULL, 1, 0, CAST(0x0000A3220079F0FF AS DateTime), CAST(0x0000A3220079F0FF AS DateTime), CAST(0x0000A3220079F0FF AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
INSERT [dbo].[Memberships] ([ApplicationId], [UserId], [Password], [PasswordFormat], [PasswordSalt], [Email], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowsStart], [Comment]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'460b98ed-62fd-489f-ada6-e12869fe7376', N'aS2GV+pZ5j0NQQ/fC5U+chb4YXR4TFBxJVnpY6Sp0yg=', 1, N'J8oR8wnsTvd+DVRpAZi9UA==', N'tim@Burton.ca', NULL, NULL, 1, 0, CAST(0x0000A322007D0598 AS DateTime), CAST(0x0000A322007D0598 AS DateTime), CAST(0x0000A322007D0598 AS DateTime), CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), 0, CAST(0xFFFF2FB300000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (2, 3, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33100000000 AS DateTime), NULL, N'La cuisine québécoise', 0)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (3, 4, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33100000000 AS DateTime), NULL, N'L''histoire du québec', 0)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (4, 5, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33100000000 AS DateTime), NULL, N'Le cinéma québécois', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (6, 7, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33100000000 AS DateTime), NULL, N'La musique québécoise', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (7, 8, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33100000000 AS DateTime), NULL, N'Le théâtre québécois', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (8, 9, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33100000000 AS DateTime), NULL, N'Tous le reste de la culture québécoise', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (10, 10, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33100000000 AS DateTime), NULL, N'Les numéro de téléphones à connaître', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (11, 11, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', CAST(0x0000A33100000000 AS DateTime), NULL, N'Les lieux à connaître', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (13, 12, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', CAST(0x0000A33100000000 AS DateTime), NULL, N'Les lois aux Québec', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (14, 13, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', CAST(0x0000A33100000000 AS DateTime), NULL, N'Les autres ressources', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (15, 14, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', CAST(0x0000A33100000000 AS DateTime), NULL, N'Les nouveautés sur le forum', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (16, 15, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', CAST(0x0000A33100000000 AS DateTime), NULL, N'Tous commentaires et suggestions sont les bienvenues', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (17, 16, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', CAST(0x0000A33100000000 AS DateTime), NULL, N'Tout ce qui n''entre dans aucune autre catégories', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (18, 17, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33200000000 AS DateTime), NULL, N'J''ai vu six cents Suisses suçant six cents six saucisses dont six en sauce et six cents sans sauce.', 0)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (19, 16, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33300000000 AS DateTime), NULL, N'Top 10 des meilleurs blagues au monde selon un site quelquonque... Blagues non verifiées donc aucunement possible s''ils sont amusantes ou non.

http://www.blablagues.net/meilleures-imp-oui.html', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (20, 16, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33300000000 AS DateTime), NULL, N'Une réponse n''ayant autre but que de tester le système de réponses...', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (21, 18, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33300C9E4DA AS DateTime), NULL, N'Désormet, les date montreront les heures, minutes et secondes lors de l''affichage des dates de post de messages.', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (22, 19, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33400BF21F6 AS DateTime), NULL, N'http://fr.wikipedia.org/wiki/Qu%C3%A9bec', NULL)
INSERT [dbo].[Messages] ([MessageID], [TopicID], [WrittenBy], [DateWritten], [DateLastEdited], [Content], [IsBlocked]) VALUES (23, 3, N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33800E14C05 AS DateTime), NULL, N'Ce message sera effacé', 1)
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[PrivateMsgs] ON 

INSERT [dbo].[PrivateMsgs] ([PrivateMsgID], [WrittenBy], [SentTo], [DateWritten], [Content], [PrivateMsgTitle]) VALUES (9, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33400BCA635 AS DateTime), N'Ceci est un test', N'Ceci est un test')
INSERT [dbo].[PrivateMsgs] ([PrivateMsgID], [WrittenBy], [SentTo], [DateWritten], [Content], [PrivateMsgTitle]) VALUES (10, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', CAST(0x0000A33400D658EE AS DateTime), N'Hey!', N'Hey!')
INSERT [dbo].[PrivateMsgs] ([PrivateMsgID], [WrittenBy], [SentTo], [DateWritten], [Content], [PrivateMsgTitle]) VALUES (1010, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'4325cafa-7515-426d-bf4d-d7816fd89467', CAST(0x0000A33800F68E37 AS DateTime), N'Et ceci est une réponse', N'Re: Ceci est un test')
SET IDENTITY_INSERT [dbo].[PrivateMsgs] OFF
INSERT [dbo].[Roles] ([ApplicationId], [RoleId], [RoleName], [Description]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'710ca842-e67c-4c8f-9aaf-f0a05b5c0f0c', N'Admin', NULL)
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (3, 3, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Introduction', CAST(0x0000A31900C065CA AS DateTime), 68)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (4, 4, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Introduction', CAST(0x0000A31A00C065CA AS DateTime), 1)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (5, 5, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Introduction', CAST(0x0000A31B00C065CA AS DateTime), 9)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (7, 6, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Introduction', CAST(0x0000A31D00C065CA AS DateTime), 1)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (8, 7, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Introduction', CAST(0x0000A31E00C065CA AS DateTime), 4)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (9, 8, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Introduction', CAST(0x0000A31F00C065CA AS DateTime), 1)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (10, 9, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Introduction', CAST(0x0000A32000C065CA AS DateTime), 1)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (11, 10, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'Introduction', CAST(0x0000A32100C065CA AS DateTime), 1)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (12, 11, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'Introduction', CAST(0x0000A32200C065CA AS DateTime), 1)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (13, 12, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'Introduction', CAST(0x0000A32300C065CA AS DateTime), 1)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (14, 13, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'Introduction', CAST(0x0000A32400C065CA AS DateTime), 1)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (15, 14, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'Introduction', CAST(0x0000A32500C065CA AS DateTime), 1)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (16, 15, N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'Introduction', CAST(0x0000A32600C065CA AS DateTime), 5)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (17, 4, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'606 Suisses', CAST(0x0000A32700C065CA AS DateTime), 7)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (18, 13, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Le forum progrèsse...', CAST(0x0000A32800C065CA AS DateTime), 4)
INSERT [dbo].[Topics] ([TopicID], [BoardID], [StartedBy], [TopicTitle], [StartedDate], [ViewCount]) VALUES (19, 4, N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Le Québec, selon wikipedia', CAST(0x0000A32900C065CA AS DateTime), 6)
SET IDENTITY_INSERT [dbo].[Topics] OFF
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'claire', 0, CAST(0x0000A322007681C8 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'699b3bec-4f2d-465b-bed0-19c815a4b9f5', N'bobby1', 0, CAST(0x0000A322010873C1 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'8664a2e6-9bcf-4ba7-9a3c-27e5975b98ae', N'anita123', 0, CAST(0x0000A32200800744 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'38b03650-c2be-4e6c-8ae0-32da39df2971', N'bobby', 0, CAST(0x0000A3220107F895 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'c981f19a-950f-4113-b262-40406cc69616', N'petitpouce', 0, CAST(0x0000A322007E638A AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'e2ddcf8e-278b-4b9a-8835-6defeb68fd5e', N'Dave', 0, CAST(0x0000A322007305FD AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'21b75f69-66c5-41cf-9801-8a95a45043f7', N'dragon', 0, CAST(0x0000A325010AF573 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'7b03013e-5d21-4321-9a4f-98fe30a1b232', N'pepito', 0, CAST(0x0000A3220073B530 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'3f926ab6-4b8d-4aaf-bd59-b063770ad231', N'Pablo', 0, CAST(0x0000A320015018C3 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'73d34188-eeb1-4703-a155-ca9bf55b92fe', N'peter', 0, CAST(0x0000A322007F800B AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'4325cafa-7515-426d-bf4d-d7816fd89467', N'Mickael', 0, CAST(0x0000A33801389779 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'79562e20-10d7-48b8-87b5-dfc940800737', N'Stella', 0, CAST(0x0000A3220079F136 AS DateTime))
INSERT [dbo].[Users] ([ApplicationId], [UserId], [UserName], [IsAnonymous], [LastActivityDate]) VALUES (N'654f50e7-e247-488a-9b66-8cfaa49879ac', N'460b98ed-62fd-489f-ada6-e12869fe7376', N'JSparrow', 0, CAST(0x0000A322007D0615 AS DateTime))
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'21b75f69-66c5-41cf-9801-8a95a45043f7', N'710ca842-e67c-4c8f-9aaf-f0a05b5c0f0c')
INSERT [dbo].[UsersInRoles] ([UserId], [RoleId]) VALUES (N'4325cafa-7515-426d-bf4d-d7816fd89467', N'710ca842-e67c-4c8f-9aaf-f0a05b5c0f0c')
INSERT [dbo].[UsersOpenAuthAccounts] ([ApplicationName], [ProviderName], [ProviderUserId], [ProviderUserName], [MembershipUserName], [LastUsedUtc]) VALUES (N'/', N'facebook', N'100001649835286', N'industwetrust@live.ca', N'Mickael', CAST(0x0000A338011D27A2 AS DateTime))
INSERT [dbo].[UsersOpenAuthAccounts] ([ApplicationName], [ProviderName], [ProviderUserId], [ProviderUserName], [MembershipUserName], [LastUsedUtc]) VALUES (N'/', N'google', N'https://www.google.com/accounts/o8/id?id=AItOawk8RgNg01Sw6iHW9ryTRT1ocQpitwLgQ94', N'chefjuanpi@gmail.com', N'dragon', CAST(0x0000A325010B5100 AS DateTime))
INSERT [dbo].[UsersOpenAuthData] ([ApplicationName], [MembershipUserName], [HasLocalPassword]) VALUES (N'/', N'dragon', 0)
INSERT [dbo].[UsersOpenAuthData] ([ApplicationName], [MembershipUserName], [HasLocalPassword]) VALUES (N'/', N'Mickael', 0)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'17b4616b-ceb9-4aad-8aa0-0a3aa6c60d51', N'Claire', N'Popolis', N'F', N'Canada', N'Québec', N'Alma', NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'699b3bec-4f2d-465b-bed0-19c815a4b9f5', N'Bobby', N'Landy', N'H', N'', N'', N'', NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'8664a2e6-9bcf-4ba7-9a3c-27e5975b98ae', N'Anna', N'Frank', N'F', N'Alemagne', N'Cologne', N'Cologne', NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'c981f19a-950f-4113-b262-40406cc69616', N'Laura', N'Tremblay', N'F', N'Canada', N'Québec', N'Alma', NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'e2ddcf8e-278b-4b9a-8835-6defeb68fd5e', N'dave', N'cote', N'H', N'Canada', N'Québec', N'Chicoutimi', NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'7b03013e-5d21-4321-9a4f-98fe30a1b232', N'Jorge', N'Pepe', N'H', N'Canada', N'Québec', N'Chicoutimi', NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'3f926ab6-4b8d-4aaf-bd59-b063770ad231', N'Pablo', N'Aguilar-Lliguin', N'H', N'Canada', N'Quebec', N'Chicoutimi', NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'73d34188-eeb1-4703-a155-ca9bf55b92fe', N'Spiderman', N'Parker', N'H', N'Canada', N'Quebec', N'Chicoutimi', NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'4325cafa-7515-426d-bf4d-d7816fd89467', NULL, NULL, NULL, NULL, NULL, NULL, N'~/images/utilisateurs/Mickael.jpg', NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'79562e20-10d7-48b8-87b5-dfc940800737', N'Stella', N'Arthoise', N'F', N'Canada', N'Québec', N'Alma', NULL, NULL)
INSERT [dbo].[Utilisateurs] ([UserID], [FirstName], [LastName], [Sexe], [Country], [Province], [City], [photoProfil], [DateNais]) VALUES (N'460b98ed-62fd-489f-ada6-e12869fe7376', N'Tim', N'Burton', N'H', N'Canada', N'Québec', N'Montreal', NULL, NULL)
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [DF_ErrorLog_ErrorDate]  DEFAULT (getdate()) FOR [ErrorDate]
GO
ALTER TABLE [dbo].[Messages] ADD  CONSTRAINT [DF_Messages_DateWritten]  DEFAULT (getdate()) FOR [DateWritten]
GO
ALTER TABLE [dbo].[PrivateMsgs] ADD  CONSTRAINT [DF_PrivateMsgs_DateWritten]  DEFAULT (getdate()) FOR [DateWritten]
GO
ALTER TABLE [dbo].[Topics] ADD  CONSTRAINT [DF_Topics_StartedDate]  DEFAULT (getdate()) FOR [StartedDate]
GO
ALTER TABLE [dbo].[Boards]  WITH CHECK ADD FOREIGN KEY([BoardCategoryID])
REFERENCES [dbo].[BoardCategories] ([BoardCategoryID])
GO
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
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK__Messages__TopicI__25869641] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topics] ([TopicID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK__Messages__TopicI__25869641]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK__Messages__Writte__267ABA7A] FOREIGN KEY([WrittenBy])
REFERENCES [dbo].[Utilisateurs] ([UserID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK__Messages__Writte__267ABA7A]
GO
ALTER TABLE [dbo].[PrivateMsgs]  WITH CHECK ADD  CONSTRAINT [FK__PrivateMs__SentT__276EDEB3] FOREIGN KEY([SentTo])
REFERENCES [dbo].[Utilisateurs] ([UserID])
GO
ALTER TABLE [dbo].[PrivateMsgs] CHECK CONSTRAINT [FK__PrivateMs__SentT__276EDEB3]
GO
ALTER TABLE [dbo].[PrivateMsgs]  WITH CHECK ADD  CONSTRAINT [FK__PrivateMs__Writt__286302EC] FOREIGN KEY([WrittenBy])
REFERENCES [dbo].[Utilisateurs] ([UserID])
GO
ALTER TABLE [dbo].[PrivateMsgs] CHECK CONSTRAINT [FK__PrivateMs__Writt__286302EC]
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
