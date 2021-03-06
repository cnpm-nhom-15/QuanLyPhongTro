USE [master]
GO
/****** Object:  Database [QL_PhongTro]    Script Date: 4/6/2019 1:08:05 AM ******/
CREATE DATABASE [QL_PhongTro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_PhongTro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_PhongTro.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_PhongTro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_PhongTro_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_PhongTro] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_PhongTro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_PhongTro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_PhongTro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_PhongTro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_PhongTro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_PhongTro] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_PhongTro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_PhongTro] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QL_PhongTro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_PhongTro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_PhongTro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_PhongTro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_PhongTro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_PhongTro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_PhongTro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_PhongTro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_PhongTro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_PhongTro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_PhongTro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_PhongTro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_PhongTro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_PhongTro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_PhongTro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_PhongTro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_PhongTro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_PhongTro] SET  MULTI_USER 
GO
ALTER DATABASE [QL_PhongTro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_PhongTro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_PhongTro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_PhongTro] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QL_PhongTro]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/6/2019 1:08:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IDHoaDon] [int] NOT NULL,
	[IDPhong] [int] NULL,
	[Thang] [date] NULL,
	[TienDien] [int] NULL,
	[TienNuoc] [int] NULL,
	[TienWifi] [int] NULL,
	[PhatSinh] [int] NULL,
	[TongTien] [int] NULL,
	[TrangThai] [int] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 4/6/2019 1:08:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[IDHopDong] [int] IDENTITY(1,1) NOT NULL,
	[IDKhachHang] [int] NULL,
	[IDPhong] [int] NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
 CONSTRAINT [PK_HopDong] PRIMARY KEY CLUSTERED 
(
	[IDHopDong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/6/2019 1:08:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[IDKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[CMND] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phong]    Script Date: 4/6/2019 1:08:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phong](
	[IDPhong] [int] IDENTITY(1,1) NOT NULL,
	[TenPhong] [nvarchar](50) NULL,
	[GiaPhong] [int] NULL,
	[NguoiHienTai] [int] NULL,
	[NguoiToiDa] [int] NULL,
 CONSTRAINT [PK_Phong] PRIMARY KEY CLUSTERED 
(
	[IDPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Phong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[Phong] ([IDPhong])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Phong]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HopDong_KhachHang]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_Phong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[Phong] ([IDPhong])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HopDong_Phong]
GO
USE [master]
GO
ALTER DATABASE [QL_PhongTro] SET  READ_WRITE 
GO
