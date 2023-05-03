USE [master]
GO
/****** Object:  Database [icecream]    Script Date: 5/3/2023 5:36:09 PM ******/
CREATE DATABASE [icecream]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'icecream', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\icecream.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'icecream_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\icecream_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [icecream] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [icecream].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [icecream] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [icecream] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [icecream] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [icecream] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [icecream] SET ARITHABORT OFF 
GO
ALTER DATABASE [icecream] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [icecream] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [icecream] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [icecream] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [icecream] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [icecream] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [icecream] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [icecream] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [icecream] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [icecream] SET  DISABLE_BROKER 
GO
ALTER DATABASE [icecream] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [icecream] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [icecream] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [icecream] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [icecream] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [icecream] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [icecream] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [icecream] SET RECOVERY FULL 
GO
ALTER DATABASE [icecream] SET  MULTI_USER 
GO
ALTER DATABASE [icecream] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [icecream] SET DB_CHAINING OFF 
GO
ALTER DATABASE [icecream] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [icecream] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [icecream] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [icecream] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'icecream', N'ON'
GO
ALTER DATABASE [icecream] SET QUERY_STORE = OFF
GO
USE [icecream]
GO
/****** Object:  User [mtaha1234]    Script Date: 5/3/2023 5:36:10 PM ******/
CREATE USER [mtaha1234] FOR LOGIN [mtaha1234] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[membership]    Script Date: 5/3/2023 5:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membership](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NULL,
	[planId] [bigint] NULL,
	[methodId] [bigint] NULL,
	[status] [varchar](1) NULL,
	[date] [datetime2](7) NULL,
	[last] [datetime2](7) NULL,
 CONSTRAINT [PK_membership] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plan]    Script Date: 5/3/2023 5:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plan](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[numberOfMonth] [bigint] NULL,
	[price] [bigint] NULL,
	[status] [varchar](1) NULL,
	[date] [datetime] NULL,
	[last] [datetime] NULL,
 CONSTRAINT [PK_plan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 5/3/2023 5:36:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[contact] [varchar](50) NULL,
	[address] [text] NULL,
	[status] [varchar](1) NULL,
	[date] [datetime2](7) NULL,
	[last] [datetime2](7) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[membership] ADD  CONSTRAINT [DF_membership_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[membership] ADD  CONSTRAINT [DF_membership_last]  DEFAULT (getdate()) FOR [last]
GO
ALTER TABLE [dbo].[plan] ADD  CONSTRAINT [DF_plan_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[plan] ADD  CONSTRAINT [DF_plan_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[plan] ADD  CONSTRAINT [DF_plan_last]  DEFAULT (getdate()) FOR [last]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_user_last]  DEFAULT (getdate()) FOR [last]
GO
USE [master]
GO
ALTER DATABASE [icecream] SET  READ_WRITE 
GO
