USE [master]
GO
/****** Object:  Database [pharmacydb]    Script Date: 5/18/2015 5:28:14 PM ******/
CREATE DATABASE [pharmacydb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'farmacydb', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\farmacydb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'farmacydb_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\farmacydb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [pharmacydb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pharmacydb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pharmacydb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pharmacydb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pharmacydb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pharmacydb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pharmacydb] SET ARITHABORT OFF 
GO
ALTER DATABASE [pharmacydb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pharmacydb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [pharmacydb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pharmacydb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pharmacydb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pharmacydb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pharmacydb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pharmacydb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pharmacydb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pharmacydb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pharmacydb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pharmacydb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pharmacydb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pharmacydb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pharmacydb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pharmacydb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pharmacydb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pharmacydb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pharmacydb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pharmacydb] SET  MULTI_USER 
GO
ALTER DATABASE [pharmacydb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pharmacydb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pharmacydb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pharmacydb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [pharmacydb]
GO
/****** Object:  Table [dbo].[company]    Script Date: 5/18/2015 5:28:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company](
	[company_id] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_company] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employee]    Script Date: 5/18/2015 5:28:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[email] [nchar](20) NULL,
	[phone] [nchar](11) NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[medicine]    Script Date: 5/18/2015 5:28:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[medicine](
	[m_id] [int] IDENTITY(1,1) NOT NULL,
	[m_name] [nchar](20) NULL,
	[qty] [int] NULL,
	[unit] [nchar](10) NULL,
	[description] [varchar](120) NULL,
	[company_id] [int] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_medicine] PRIMARY KEY CLUSTERED 
(
	[m_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[purchase]    Script Date: 5/18/2015 5:28:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[m_id] [int] NULL,
	[qty] [int] NULL,
	[p_date] [date] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_purchase] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sell]    Script Date: 5/18/2015 5:28:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sell](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[s_date] [date] NULL,
	[qty] [int] NULL,
	[description] [varchar](120) NULL,
	[m_id] [int] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_sell] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[purchase]  WITH CHECK ADD  CONSTRAINT [FK_purchase_medicine] FOREIGN KEY([m_id])
REFERENCES [dbo].[medicine] ([m_id])
GO
ALTER TABLE [dbo].[purchase] CHECK CONSTRAINT [FK_purchase_medicine]
GO
ALTER TABLE [dbo].[sell]  WITH CHECK ADD  CONSTRAINT [FK_sell_medicine] FOREIGN KEY([m_id])
REFERENCES [dbo].[medicine] ([m_id])
GO
ALTER TABLE [dbo].[sell] CHECK CONSTRAINT [FK_sell_medicine]
GO
USE [master]
GO
ALTER DATABASE [pharmacydb] SET  READ_WRITE 
GO
