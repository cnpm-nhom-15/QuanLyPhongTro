USE [master]
GO
/****** Object:  Database [QL_PhongTro]    Script Date: 4/7/2019 7:26:49 PM ******/
CREATE DATABASE [QL_PhongTro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_PhongTro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QL_PhongTro.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/7/2019 7:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IDHoaDon] [int] NOT NULL,
	[IDPhong] [int] NULL,
	[ThoiGian] [date] NULL,
	[TienPhong] [int] NULL,
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
/****** Object:  Table [dbo].[HopDong]    Script Date: 4/7/2019 7:26:49 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/7/2019 7:26:49 PM ******/
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
/****** Object:  Table [dbo].[KyLuat]    Script Date: 4/7/2019 7:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyLuat](
	[IDKyLuat] [int] IDENTITY(1,1) NOT NULL,
	[IDKhachHang] [int] NULL,
	[ThoiGian] [date] NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_KyLuat] PRIMARY KEY CLUSTERED 
(
	[IDKyLuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phong]    Script Date: 4/7/2019 7:26:49 PM ******/
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
/****** Object:  Table [dbo].[ThietBi]    Script Date: 4/7/2019 7:26:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThietBi](
	[IDThietBi] [int] IDENTITY(1,1) NOT NULL,
	[TenThietBi] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThietBi] PRIMARY KEY CLUSTERED 
(
	[IDThietBi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TrangBi]    Script Date: 4/7/2019 7:26:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangBi](
	[IDThietBi] [int] NULL,
	[IDPhong] [int] NULL,
	[SoLuong] [int] NULL,
	[TinhTrang] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDPhong], [ThoiGian], [TienPhong], [TienDien], [TienNuoc], [TienWifi], [PhatSinh], [TongTien], [TrangThai], [GhiChu]) VALUES (1, 1, CAST(N'2018-10-02' AS Date), 900000, 100000, 50000, 30000, 10000, 2190828, 1, NULL)
INSERT [dbo].[HoaDon] ([IDHoaDon], [IDPhong], [ThoiGian], [TienPhong], [TienDien], [TienNuoc], [TienWifi], [PhatSinh], [TongTien], [TrangThai], [GhiChu]) VALUES (2, 2, CAST(N'2018-12-12' AS Date), 1000000, 30000, 20000, 10000, 10000, 2091767, 2, NULL)
SET IDENTITY_INSERT [dbo].[HopDong] ON 

INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (6, 1, 1, CAST(N'2018-01-12' AS Date), CAST(N'2019-05-20' AS Date))
INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (7, 2, 2, CAST(N'2018-12-09' AS Date), CAST(N'2019-12-09' AS Date))
INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (8, 3, 3, CAST(N'2018-09-06' AS Date), CAST(N'2019-10-09' AS Date))
INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (9, 4, 4, CAST(N'2018-02-01' AS Date), CAST(N'2019-03-02' AS Date))
INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (10, 5, 5, CAST(N'2018-02-09' AS Date), CAST(N'2019-02-10' AS Date))
INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (11, 6, 6, CAST(N'2018-01-01' AS Date), CAST(N'2019-01-01' AS Date))
INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (12, 7, 7, CAST(N'2018-02-02' AS Date), CAST(N'2019-02-02' AS Date))
INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (13, 8, 8, CAST(N'2019-03-03' AS Date), CAST(N'2019-03-09' AS Date))
INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (14, 9, 9, CAST(N'2018-04-04' AS Date), CAST(N'2019-05-05' AS Date))
INSERT [dbo].[HopDong] ([IDHopDong], [IDKhachHang], [IDPhong], [NgayBatDau], [NgayKetThuc]) VALUES (15, 10, 10, CAST(N'2018-10-10' AS Date), CAST(N'2019-10-10' AS Date))
SET IDENTITY_INSERT [dbo].[HopDong] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (1, N'Tran Van Thanh', N'185816822', N'0984899811', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (2, N'Ngo Duc The', N'187570251', N'0963996840', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (3, N'Tran Ba Thang', N'187570604', N'0977782591', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (4, N'Dinh Thi Vui', N'109271523', N'0397724113', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (5, N'Thai Van Tra', N'090971867', N'0386751624', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (6, N'Nguyen Van An', N'012345667', N'0987654321', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (7, N'Dang Cao Thanh', N'198726454', N'0341656527', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (8, N'Hoang Thi Hanh', N'187098727', N'0387545682', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (9, N'Tran Ba Dong', N'178963526', N'0399215941', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [HoTen], [CMND], [SDT], [GhiChu]) VALUES (10, N'Nguyen Xuan Hai', N'178793635', N'0458728998', NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[KyLuat] ON 

INSERT [dbo].[KyLuat] ([IDKyLuat], [IDKhachHang], [ThoiGian], [NoiDung]) VALUES (1, 1, CAST(N'2019-01-01' AS Date), N'vi pham')
INSERT [dbo].[KyLuat] ([IDKyLuat], [IDKhachHang], [ThoiGian], [NoiDung]) VALUES (2, 2, CAST(N'2019-02-02' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[KyLuat] OFF
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (1, N'P01', 500000, 1, 2)
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (2, N'P02', 600000, 2, 2)
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (3, N'P03', 1200000, 1, 3)
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (4, N'P04', 1000000, 2, 2)
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (5, N'P05', 900000, 1, 2)
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (6, N'P06', 900000, 1, 2)
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (7, N'P07', 900000, 1, 2)
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (8, N'P08', 900000, 1, 2)
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (9, N'P09', 900000, 1, 2)
INSERT [dbo].[Phong] ([IDPhong], [TenPhong], [GiaPhong], [NguoiHienTai], [NguoiToiDa]) VALUES (10, N'P10', 900000, 1, 2)
SET IDENTITY_INSERT [dbo].[Phong] OFF
SET IDENTITY_INSERT [dbo].[ThietBi] ON 

INSERT [dbo].[ThietBi] ([IDThietBi], [TenThietBi], [GhiChu]) VALUES (1, N'wifi', NULL)
INSERT [dbo].[ThietBi] ([IDThietBi], [TenThietBi], [GhiChu]) VALUES (2, N'dieuhoa', NULL)
INSERT [dbo].[ThietBi] ([IDThietBi], [TenThietBi], [GhiChu]) VALUES (3, N'tulanh', NULL)
INSERT [dbo].[ThietBi] ([IDThietBi], [TenThietBi], [GhiChu]) VALUES (4, N'nonglanh', NULL)
INSERT [dbo].[ThietBi] ([IDThietBi], [TenThietBi], [GhiChu]) VALUES (5, N'tivi', NULL)
SET IDENTITY_INSERT [dbo].[ThietBi] OFF
INSERT [dbo].[TrangBi] ([IDThietBi], [IDPhong], [SoLuong], [TinhTrang]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[TrangBi] ([IDThietBi], [IDPhong], [SoLuong], [TinhTrang]) VALUES (2, 1, 2, NULL)
INSERT [dbo].[TrangBi] ([IDThietBi], [IDPhong], [SoLuong], [TinhTrang]) VALUES (3, 3, 1, NULL)
INSERT [dbo].[TrangBi] ([IDThietBi], [IDPhong], [SoLuong], [TinhTrang]) VALUES (4, 2, 1, NULL)
INSERT [dbo].[TrangBi] ([IDThietBi], [IDPhong], [SoLuong], [TinhTrang]) VALUES (5, 4, 2, NULL)
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
ALTER TABLE [dbo].[KyLuat]  WITH CHECK ADD  CONSTRAINT [FK_KyLuat_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KyLuat] CHECK CONSTRAINT [FK_KyLuat_KhachHang]
GO
ALTER TABLE [dbo].[TrangBi]  WITH CHECK ADD  CONSTRAINT [FK_TrangBi_Phong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[Phong] ([IDPhong])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrangBi] CHECK CONSTRAINT [FK_TrangBi_Phong]
GO
ALTER TABLE [dbo].[TrangBi]  WITH CHECK ADD  CONSTRAINT [FK_TrangBi_ThietBi] FOREIGN KEY([IDThietBi])
REFERENCES [dbo].[ThietBi] ([IDThietBi])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TrangBi] CHECK CONSTRAINT [FK_TrangBi_ThietBi]
GO
USE [master]
GO
ALTER DATABASE [QL_PhongTro] SET  READ_WRITE 
GO
