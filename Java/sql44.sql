USE [master]
GO
/****** Object:  Database [QuanLyPhongTro]    Script Date: 5/26/2019 8:38:48 PM ******/
CREATE DATABASE [QuanLyPhongTro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMC_DaNang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DMC_DaNang.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DMC_DaNang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\DMC_DaNang_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyPhongTro] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyPhongTro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyPhongTro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyPhongTro] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyPhongTro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyPhongTro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyPhongTro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyPhongTro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyPhongTro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyPhongTro] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyPhongTro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyPhongTro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyPhongTro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyPhongTro] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyPhongTro]
GO
/****** Object:  StoredProcedure [dbo].[CapNhatHoaDon]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatHoaDon]
@IDPP int,
@NgayL date,

@IDP int,
@NgayLap date,
@Thang date,
@ChiSoCu float,
@ChiSoMoi float,
@TienDien int,
@TienNuoc int,
@TongTien int
AS
BEGIN
UPDATE HoaDon
SET  IDP = @IDP,NgayLap = @NgayLap ,Thang = @Thang ,ChiSoCu = @ChiSoCu ,ChiSoMoi = @ChiSoMoi ,TienDien = @TienDien,TienNuoc = @TienNuoc ,TongTien = @TongTien
WHERE IDP = @IDPP AND  NgayLap = @NgayL
END




GO
/****** Object:  StoredProcedure [dbo].[CapNhatHopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatHopDong]
@IDSVV int,
@NgayT date, 

@IDSV int,
@IDP int,
@NgayTao date,
@NgayBatDau date,
@NgayKetThuc date
AS
BEGIN
UPDATE HopDong
SET  IDSV = @IDSV ,IDP = @IDP,NgayTao = @NgayTao ,NgayBatDau = @NgayBatDau ,NgayKetThuc = @NgayKetThuc
WHERE IDSV = @IDSVV and NgayTao = @NgayT
END




GO
/****** Object:  StoredProcedure [dbo].[CapNhatKhuNha]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatKhuNha]
@KhuN nvarchar(100),
@KhuNha nvarchar(100),
@IDNV int
AS
BEGIN
UPDATE KhuNha
SET  KhuNha =@KhuNha, IDNV = @IDNV
WHERE KhuNha = @KhuN
END








GO
/****** Object:  StoredProcedure [dbo].[CapNhatKThuongKLuat]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatKThuongKLuat]
@IDSVV int,
@IDSV int,
@NguyenNhan nvarchar(100),
@NgayThang date,
@HinhPhat nvarchar(100)
AS
BEGIN
UPDATE KyLuatKhenThuong
SET IDSV = @IDSV, NguyenNhan = @NguyenNhan, NgayThang = @NgayThang, HinhPhat = @HinhPhat
WHERE IDSV = @IDSVV
END








GO
/****** Object:  StoredProcedure [dbo].[CapNhatNhanVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatNhanVien]
@HoT nvarchar(100),
@SDTT varchar(100),

@HoTen nvarchar(100),
@DiaChi nvarchar(100),
@SDT varchar(100),
@GioiTinh int,
@NgaySinh date,
@ChucVu nvarchar(100)
AS
BEGIN
UPDATE NhanVien
SET HoTen = @HoTen ,DiaChi = @DiaChi ,SDT = @SDT ,GioiTinh = @GioiTinh ,NgaySinh = @NgaySinh ,ChucVu = @ChucVu
WHERE HoTen = @HoT and SDT = @SDTT
END




GO
/****** Object:  StoredProcedure [dbo].[CapNhatPhong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatPhong]
@Tenp varchar(50),
@IDKNN int,

@TenPhong varchar(50),
@IDKN int,
@SoNguoiHienTai int,
@SoNguoiToiDa int
AS
BEGIN
UPDATE Phong
SET  TenPhong = @TenPhong,IDKN = @IDKN ,SoNguoiHienTai = @SoNguoiHienTai,SoNguoiToiDa = @SoNguoiToiDa
WHERE TenPhong = @TenP AND IDKN = @IDKNN
END




GO
/****** Object:  StoredProcedure [dbo].[CapNhatSinhVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatSinhVien]
@Ma varchar(50),
@MaSV varchar(50),
@HoTen nvarchar(50),
@IDTH int,
@Lop varchar(50),
@GioiTinh int,
@NgaySinh date,
@SoCMND varchar(20),
@SDT varchar(20)
AS
BEGIN
UPDATE SinhVien
SET MaSV = @MaSV,HoTen = @HoTen,IDTH =@IDTH,Lop = @Lop,GioiTinh = @GioiTinh,NgaySinh = @NgaySinh,SoCMND = @SoCMND,SDT = @SDT
WHERE MaSV = @Ma
END








GO
/****** Object:  StoredProcedure [dbo].[CapNhatTruong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatTruong]
@TenT nvarchar(100),
@TenTruong nvarchar(100),
@DiaChi nvarchar(100)
AS
BEGIN
UPDATE TruongHoc
SET TenTruong = @TenTruong, DiaChi = @DiaChi
WHERE TenTruong = @TenT
END








GO
/****** Object:  StoredProcedure [dbo].[CapNhatUser]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CapNhatUser]
@UserN nvarchar(50),
@UserName nvarchar(50),
@Password nvarchar(100),
@Email varchar(50),
@UserType int,
@UserStatus int
AS
BEGIN
UPDATE tblUser
SET UserName = @UserName ,Password = @Password ,Email = @Email ,UserType = @UserType ,UserStatus = @UserStatus
WHERE UserName = @UserN
END








GO
/****** Object:  StoredProcedure [dbo].[ChiTietHoaDon]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietHoaDon]
@IDP int,
@NgayLap date
AS
BEGIN
     select kn.KhuNha, hd.*, p.TenPhong from HoaDon hd inner join Phong p on p.IDP = hd.IDP inner join KhuNha kn on kn.IDKN = p.IDKN
     where hd.IDP = @IDP and NgayLap = @NgayLap
END



GO
/****** Object:  StoredProcedure [dbo].[ChiTietHopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietHopDong]
@IDSV int,
@NgayT date
AS
BEGIN
     SELECT sv.HoTen, p.TenPhong, hd.IDHD, hd.NgayTao, hd.NgayBatDau, hd.NgayKetThuc
     FROM SinhVien sv inner join HopDong hd on hd.IDSV = sv.IDSV inner join Phong p on p.IDP = hd.IDP
     WHERE hd.IDSV = @IDSV and NgayTao = @NgayT
END



GO
/****** Object:  StoredProcedure [dbo].[ChiTietKhuNha]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietKhuNha]
@KhuNha nvarchar(100)
AS
BEGIN
     SELECT *
     FROM KhuNha
     WHERE KhuNha = @KhuNha
END








GO
/****** Object:  StoredProcedure [dbo].[ChiTietKThuongKLuat]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietKThuongKLuat]
@IDSV int
AS
BEGIN
     SELECT *
     FROM KyLuatKhenThuong
     WHERE IDSV = @IDSV
END








GO
/****** Object:  StoredProcedure [dbo].[ChiTietLienHe]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietLienHe]
@HoTen nvarchar(50)
AS
BEGIN
     SELECT *
     FROM LienHe
     WHERE HoTen = @HoTen
END








GO
/****** Object:  StoredProcedure [dbo].[ChiTietNhanVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietNhanVien]
@HoTen nvarchar(100),
@SDT varchar(100)
AS
BEGIN
     SELECT *
     FROM NhanVien
     WHERE HoTen = @HoTen and SDT = @SDT
END




GO
/****** Object:  StoredProcedure [dbo].[ChiTietPhong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietPhong]
@TenPhong varchar(50),
@IDKN int
AS
BEGIN
     SELECT *
     FROM Phong
     WHERE TenPhong = @TenPhong and IDKN = @IDKN
END




GO
/****** Object:  StoredProcedure [dbo].[ChiTietSinhVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietSinhVien]
@MaSV varchar(50)
AS
BEGIN
     SELECT sv.*, th.TenTruong
     FROM SinhVien sv  inner join TruongHoc th on th.IDTH = sv.IDTH
     WHERE MaSV = @MaSV
END



GO
/****** Object:  StoredProcedure [dbo].[ChiTietTruong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietTruong]
    @TenTruong nvarchar(100)
AS
BEGIN
     SELECT *
     FROM TruongHoc
     WHERE TenTruong = @TenTruong
END








GO
/****** Object:  StoredProcedure [dbo].[ChiTietUser]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietUser]
    @UserName varchar(50)
AS
BEGIN
     SELECT *
     FROM tblUser
     WHERE UserName = @UserName
END
 








GO
/****** Object:  StoredProcedure [dbo].[DanhSachHoaDon]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachHoaDon]
AS
BEGIN
     SELECT *
     FROM HoaDon
END








GO
/****** Object:  StoredProcedure [dbo].[DanhSachHopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachHopDong]
AS
BEGIN
     SELECT *
     FROM HopDong
END








GO
/****** Object:  StoredProcedure [dbo].[DanhSachKhuNha]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachKhuNha]
AS
BEGIN
     SELECT *
     FROM KhuNha
END








GO
/****** Object:  StoredProcedure [dbo].[DanhSachKThuongKLuat]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachKThuongKLuat]
AS
BEGIN
     SELECT *
     FROM KyLuatKhenThuong
END








GO
/****** Object:  StoredProcedure [dbo].[DanhSachLienHe]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachLienHe]
AS
BEGIN
     SELECT *
     FROM LienHe
END








GO
/****** Object:  StoredProcedure [dbo].[DanhSachNhanVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachNhanVien]
AS
BEGIN
     SELECT *
     FROM NhanVien
END








GO
/****** Object:  StoredProcedure [dbo].[DanhSachPhong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachPhong]
AS
BEGIN
     SELECT *
     FROM Phong
END








GO
/****** Object:  StoredProcedure [dbo].[DanhSachSinhVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachSinhVien]
AS
BEGIN
     SELECT *
     FROM SinhVien
END








GO
/****** Object:  StoredProcedure [dbo].[DanhSachTruong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhSachTruong]
AS
BEGIN
     SELECT *
     FROM TruongHoc
END








GO
/****** Object:  StoredProcedure [dbo].[ThemHoaDon]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemHoaDon]
@IDP int,
@NgayLap date,
@Thang date,
@ChiSoCu float,
@ChiSoMoi float,
@TienDien int,
@TienNuoc int,
@TongTien int
AS
BEGIN
INSERT INTO HoaDon(IDP,NgayLap,Thang,ChiSoCu,ChiSoMoi,TienDien,TienNuoc,TongTien) 
VALUES (@IDP, @NgayLap, @Thang, @ChiSoCu, @ChiSoMoi, @TienDien, @TienNuoc, @TongTien ) 
END




GO
/****** Object:  StoredProcedure [dbo].[ThemHopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemHopDong]
@IDSV int,
@IDP int,
@NgayTao date,
@NgayBatDau date,
@NgayKetThuc date
AS
BEGIN
INSERT INTO HopDong(IDSV,IDP,NgayTao,NgayBatDau,NgayKetThuc) 
VALUES (@IDSV, @IDP, @NgayTao, @NgayBatDau, @NgayKetThuc ) 
END





GO
/****** Object:  StoredProcedure [dbo].[ThemKhuNha]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemKhuNha]
@KhuNha nvarchar(100),
@IDNV int
AS
BEGIN
INSERT INTO KhuNha(KhuNha,IDNV) 
VALUES (@KhuNha, @IDNV ) 
END








GO
/****** Object:  StoredProcedure [dbo].[ThemKThuongKLuat]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemKThuongKLuat]
@IDSV int,
@NguyenNhan nvarchar(100),
@NgayThang date,
@HinhPhat nvarchar(100)
AS
BEGIN
INSERT INTO KyLuatKhenThuong(IDSV, NguyenNhan, NgayThang, HinhPhat) 
VALUES (@IDSV, @NguyenNhan, @NgayThang, @HinhPhat) 
END








GO
/****** Object:  StoredProcedure [dbo].[ThemLienHe]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ThemLienHe]
@HoTen nvarchar(50),
@Email varchar(50),
@ChuDe nvarchar(50),
@NoiDung nvarchar(100),
@NgayGui date
as
begin
INSERT INTO LienHe (HoTen,Email,ChuDe,NoiDung,NgayGui)
values (@HoTen, @Email, @ChuDe, @NoiDung, @NgayGui)
end



GO
/****** Object:  StoredProcedure [dbo].[ThemNhanVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemNhanVien]
@HoTen nvarchar(100),
@DiaChi nvarchar(100),
@SDT varchar(100),
@GioiTinh int,
@NgaySinh date,
@ChucVu nvarchar(100)
AS
BEGIN
INSERT INTO NhanVien(HoTen,DiaChi,SDT ,GioiTinh,NgaySinh,ChucVu) 
VALUES (@HoTen, @DiaChi, @SDT, @GioiTinh, @NgaySinh, @ChucVu ) 
END








GO
/****** Object:  StoredProcedure [dbo].[ThemPhong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemPhong]
@TenPhong varchar(50),
@IDKN int,
@SoNguoiHienTai int,
@SoNguoiToiDa int
AS
BEGIN
INSERT INTO Phong(TenPhong,IDKN,SoNguoiHienTai,SoNguoiToiDa) 
VALUES (@TenPhong,@IDKN, @SoNguoiHienTai, @SoNguoiToiDa ) 
END




GO
/****** Object:  StoredProcedure [dbo].[ThemSinhVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemSinhVien]
@MaSV varchar(50),
@HoTen nvarchar(50),
@IDTH int,
@Lop varchar(50),
@GioiTinh int,
@NgaySinh date,
@SoCMND varchar(20),
@SDT varchar(20)
AS
BEGIN
INSERT INTO SinhVien(MaSV,HoTen,IDTH,Lop,GioiTinh,NgaySinh,SoCMND,SDT ) 
VALUES ( @MaSV ,@HoTen ,@IDTH ,@Lop ,@GioiTinh,@NgaySinh ,@SoCMND ,@SDT ) 
END








GO
/****** Object:  StoredProcedure [dbo].[ThemTruong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemTruong]
@TenTruong nvarchar(100),
@DiaChi nvarchar(100)
AS
BEGIN
INSERT INTO TruongHoc(TenTruong, DiaChi)
VALUES ( @TenTruong, @DiaChi) 
END








GO
/****** Object:  StoredProcedure [dbo].[ThemUser]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ThemUser]
@UserName nvarchar(50),
@Password nvarchar(100),
@Email varchar(50),
@UserType int,
@UserStatus int
AS
BEGIN
INSERT INTO tblUser(UserName,Password,Email,UserType,UserStatus) 
VALUES ( @UserName, @Password, @Email, @UserType, @UserStatus) 
END









GO
/****** Object:  StoredProcedure [dbo].[XemUser]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XemUser]  
AS
BEGIN
     SELECT *
     FROM tblUser
END








GO
/****** Object:  StoredProcedure [dbo].[XoaHoaDon]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaHoaDon]
@IDP int,
@NgayLap date
AS
BEGIN
DELETE FROM HoaDon
WHERE IDP = @IDP and NgayLap = @NgayLap
END




GO
/****** Object:  StoredProcedure [dbo].[XoaHopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaHopDong]
@IDSV int,
@NgayTao date
AS
BEGIN
DELETE FROM HopDong
WHERE IDSV = @IDSV and NgayTao = @NgayTao
END




GO
/****** Object:  StoredProcedure [dbo].[XoaKhuNha]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaKhuNha]
@KhuNha nvarchar(100)
AS
BEGIN
DELETE FROM KhuNha
WHERE KhuNha = @KhuNha
END








GO
/****** Object:  StoredProcedure [dbo].[XoaKThuongKLuat]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaKThuongKLuat]
@IDSV int
AS
BEGIN
DELETE KyLuatKhenThuong
WHERE IDSV = @IDSV
END








GO
/****** Object:  StoredProcedure [dbo].[XoaLienHe]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaLienHe]
@HoTen nvarchar(50)
AS
BEGIN
     DELETE LienHe
     WHERE HoTen = @HoTen
END








GO
/****** Object:  StoredProcedure [dbo].[XoaNhanVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaNhanVien]
@HoTen nvarchar(100),
@SDT varchar(100)
AS
BEGIN
DELETE FROM NhanVien
WHERE HoTen = @HoTen and SDT = @SDT
END




GO
/****** Object:  StoredProcedure [dbo].[XoaPhong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaPhong]
@TenPhong varchar(50),
@IDKN int
AS
BEGIN
DELETE FROM Phong
WHERE TenPhong = @TenPhong and IDKN = @IDKN
END




GO
/****** Object:  StoredProcedure [dbo].[XoaSinhVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaSinhVien]
@MaSV varchar(50)
AS
BEGIN
DELETE FROM SinhVien
WHERE MaSV = @MaSV
END








GO
/****** Object:  StoredProcedure [dbo].[XoaTruongHoc]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaTruongHoc]
@TenTruong nvarchar(100)
AS
BEGIN
DELETE FROM TruongHoc
WHERE TenTruong = @TenTruong
END









GO
/****** Object:  StoredProcedure [dbo].[XoaUser]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[XoaUser]
@UserName varchar(50)
AS
BEGIN
DELETE FROM tblUser
WHERE UserName = @UserName
END








GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[IDHDon] [int] IDENTITY(1,1) NOT NULL,
	[IDP] [int] NULL,
	[NgayLap] [date] NULL,
	[Thang] [date] NULL,
	[ChiSoCu] [int] NULL,
	[ChiSoMoi] [int] NULL,
	[TienDien] [int] NULL,
	[TienNuoc] [int] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[IDHDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[IDHD] [int] IDENTITY(1,1) NOT NULL,
	[IDSV] [int] NULL,
	[IDP] [int] NULL,
	[NgayTao] [date] NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
 CONSTRAINT [PK_HopDong] PRIMARY KEY CLUSTERED 
(
	[IDHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuNha]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuNha](
	[IDKN] [int] IDENTITY(1,1) NOT NULL,
	[KhuNha] [nvarchar](100) NULL,
	[IDNV] [int] NULL,
 CONSTRAINT [PK_KhuNha] PRIMARY KEY CLUSTERED 
(
	[IDKN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KyLuatKhenThuong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyLuatKhenThuong](
	[IDKL] [int] IDENTITY(1,1) NOT NULL,
	[IDSV] [int] NULL,
	[NguyenNhan] [nvarchar](100) NULL,
	[NgayThang] [date] NULL,
	[HinhPhat] [nvarchar](100) NULL,
 CONSTRAINT [PK_KyLuatKhenThuong] PRIMARY KEY CLUSTERED 
(
	[IDKL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LienHe](
	[IDLH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[ChuDe] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](100) NULL,
	[NgayGui] [date] NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[IDLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[IDNV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [varchar](100) NULL,
	[GioiTinh] [int] NULL,
	[NgaySinh] [date] NULL,
	[ChucVu] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[IDNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phong](
	[IDP] [int] IDENTITY(1,1) NOT NULL,
	[IDKN] [int] NULL,
	[TenPhong] [varchar](50) NOT NULL,
	[SoNguoiHienTai] [int] NULL,
	[SoNguoiToiDa] [int] NULL,
 CONSTRAINT [PK_Phong_1] PRIMARY KEY CLUSTERED 
(
	[IDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[IDSV] [int] IDENTITY(1,1) NOT NULL,
	[MaSV] [varchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[IDTH] [int] NOT NULL,
	[Lop] [varchar](50) NULL,
	[GioiTinh] [int] NULL,
	[NgaySinh] [date] NULL,
	[SoCMND] [varchar](20) NULL,
	[SDT] [varchar](20) NULL,
 CONSTRAINT [PK__SinhVien__B87C029F95823479] PRIMARY KEY CLUSTERED 
(
	[IDSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[IDU] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[UserType] [int] NULL,
	[UserStatus] [int] NULL,
 CONSTRAINT [PK__tblUser__C4971C3988606C8D] PRIMARY KEY CLUSTERED 
(
	[IDU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TruongHoc]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TruongHoc](
	[IDTH] [int] IDENTITY(1,1) NOT NULL,
	[TenTruong] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_TruongHoc] PRIMARY KEY CLUSTERED 
(
	[IDTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([IDHDon], [IDP], [NgayLap], [Thang], [ChiSoCu], [ChiSoMoi], [TienDien], [TienNuoc], [TongTien]) VALUES (1, 1, CAST(0xA73E0B00 AS Date), CAST(0xB63D0B00 AS Date), 123, 200, 115500, 30000, 145500)
INSERT [dbo].[HoaDon] ([IDHDon], [IDP], [NgayLap], [Thang], [ChiSoCu], [ChiSoMoi], [TienDien], [TienNuoc], [TongTien]) VALUES (2, 2, CAST(0xA83E0B00 AS Date), CAST(0x8A3E0B00 AS Date), 234, 333, 148500, 30000, 178500)
INSERT [dbo].[HoaDon] ([IDHDon], [IDP], [NgayLap], [Thang], [ChiSoCu], [ChiSoMoi], [TienDien], [TienNuoc], [TongTien]) VALUES (3, 7, CAST(0xA73E0B00 AS Date), CAST(0x923E0B00 AS Date), 89, 99, 15000, 15000, 30000)
INSERT [dbo].[HoaDon] ([IDHDon], [IDP], [NgayLap], [Thang], [ChiSoCu], [ChiSoMoi], [TienDien], [TienNuoc], [TongTien]) VALUES (4, 4, CAST(0xA63E0B00 AS Date), CAST(0x8A3E0B00 AS Date), 123, 555, 648000, 15000, 663000)
INSERT [dbo].[HoaDon] ([IDHDon], [IDP], [NgayLap], [Thang], [ChiSoCu], [ChiSoMoi], [TienDien], [TienNuoc], [TongTien]) VALUES (5, 1, CAST(0xB03F0B00 AS Date), CAST(0x9C3F0B00 AS Date), 1234, 1345, 166500, 30000, 196500)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[HopDong] ON 

INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (1, 231, 1, CAST(0x8A3E0B00 AS Date), CAST(0x8A3E0B00 AS Date), CAST(0xA73E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (2, 232, 1, CAST(0xDD3D0B00 AS Date), CAST(0xD53D0B00 AS Date), CAST(0x183F0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (3, 342, 2, CAST(0x9F3E0B00 AS Date), CAST(0x8A3E0B00 AS Date), CAST(0xA73E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (4, 233, 15, CAST(0x9F3E0B00 AS Date), CAST(0x8B3E0B00 AS Date), CAST(0xFC3E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (5, 234, 15, CAST(0x983E0B00 AS Date), CAST(0x8A3E0B00 AS Date), CAST(0xA03E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (6, 341, 5, CAST(0x923E0B00 AS Date), CAST(0xD53D0B00 AS Date), CAST(0xF53E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (7, 343, 4, CAST(0x5A3E0B00 AS Date), CAST(0x763E0B00 AS Date), CAST(0x203F0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (8, 344, 2, CAST(0xE43D0B00 AS Date), CAST(0xE33D0B00 AS Date), CAST(0xA13E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (9, 235, 3, CAST(0xDE3D0B00 AS Date), CAST(0x8A3E0B00 AS Date), CAST(0xA73E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (10, 236, 6, CAST(0x903E0B00 AS Date), CAST(0x8A3E0B00 AS Date), CAST(0x993E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (11, 236, 6, CAST(0xA53E0B00 AS Date), CAST(0x8A3E0B00 AS Date), CAST(0xA73E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (12, 237, 7, CAST(0x913E0B00 AS Date), CAST(0x8A3E0B00 AS Date), CAST(0x8D3E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (13, 237, 7, CAST(0x993E0B00 AS Date), CAST(0x8B3E0B00 AS Date), CAST(0xA13E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (14, 238, 8, CAST(0xBE3D0B00 AS Date), CAST(0xB73D0B00 AS Date), CAST(0x923E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (16, 239, 9, CAST(0xB73D0B00 AS Date), CAST(0xD53D0B00 AS Date), CAST(0xF03D0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (17, 359, 108, CAST(0xDB3D0B00 AS Date), CAST(0xDE3D0B00 AS Date), CAST(0x533E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (19, 240, 156, CAST(0xF83D0B00 AS Date), CAST(0xF13D0B00 AS Date), CAST(0x6F3E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (20, 253, 3, CAST(0x2F3E0B00 AS Date), CAST(0x2F3E0B00 AS Date), CAST(0x4C3E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (21, 348, 47, CAST(0x2F3E0B00 AS Date), CAST(0x2E3E0B00 AS Date), CAST(0x4C3E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (22, 285, 50, CAST(0x913E0B00 AS Date), CAST(0x8A3E0B00 AS Date), CAST(0xA13E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (23, 279, 15, CAST(0x2F3E0B00 AS Date), CAST(0x2E3E0B00 AS Date), CAST(0x4B3E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (24, 261, 50, CAST(0x323E0B00 AS Date), CAST(0x363E0B00 AS Date), CAST(0x763E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (25, 286, 28, CAST(0xBF3D0B00 AS Date), CAST(0xB73D0B00 AS Date), CAST(0xA23E0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (26, 231, 225, CAST(0xAF3F0B00 AS Date), CAST(0xA33F0B00 AS Date), CAST(0xF4430B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (27, 278, 74, CAST(0xB33F0B00 AS Date), CAST(0xB33F0B00 AS Date), CAST(0x7D400B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (28, 401, 93, CAST(0x233F0B00 AS Date), CAST(0x233F0B00 AS Date), CAST(0xA83F0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (29, 252, 33, CAST(0xB33F0B00 AS Date), CAST(0x9B3F0B00 AS Date), CAST(0xB93F0B00 AS Date))
INSERT [dbo].[HopDong] ([IDHD], [IDSV], [IDP], [NgayTao], [NgayBatDau], [NgayKetThuc]) VALUES (30, 444, 48, CAST(0x5E3F0B00 AS Date), CAST(0x5E3F0B00 AS Date), CAST(0x61400B00 AS Date))
SET IDENTITY_INSERT [dbo].[HopDong] OFF
SET IDENTITY_INSERT [dbo].[KhuNha] ON 

INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (1, N'Khu A1', 1)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (2, N'Khu A2', 15)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (3, N'Khu A3', 17)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (4, N'Khu B1', 18)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (5, N'Khu B2', 20)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (6, N'Khu B3', 9)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (7, N'Khu C1', 1)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (8, N'Khu C2', 12)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (9, N'Khu C3', 11)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (10, N'Khu D1', 2)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (11, N'Khu D2', 4)
INSERT [dbo].[KhuNha] ([IDKN], [KhuNha], [IDNV]) VALUES (12, N'Khu D3', 3)
SET IDENTITY_INSERT [dbo].[KhuNha] OFF
SET IDENTITY_INSERT [dbo].[KyLuatKhenThuong] ON 

INSERT [dbo].[KyLuatKhenThuong] ([IDKL], [IDSV], [NguyenNhan], [NgayThang], [HinhPhat]) VALUES (1, 267, N'uống rượu', CAST(0x923E0B00 AS Date), N'phạt 50k')
INSERT [dbo].[KyLuatKhenThuong] ([IDKL], [IDSV], [NguyenNhan], [NgayThang], [HinhPhat]) VALUES (2, 389, N'làm ồn', CAST(0x933E0B00 AS Date), N'phạt 10k')
SET IDENTITY_INSERT [dbo].[KyLuatKhenThuong] OFF
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([IDLH], [HoTen], [Email], [ChuDe], [NoiDung], [NgayGui]) VALUES (2, N'Nguyễn Nam', N'nam@hhe.com', N'chu de 1', N'nội dung 1', CAST(0xDC3D0B00 AS Date))
INSERT [dbo].[LienHe] ([IDLH], [HoTen], [Email], [ChuDe], [NoiDung], [NgayGui]) VALUES (3, N'Lê Hoàng', N'haong@gmail.com', N'chủ đề 2', N'nội dung 2', CAST(0x983D0B00 AS Date))
INSERT [dbo].[LienHe] ([IDLH], [HoTen], [Email], [ChuDe], [NoiDung], [NgayGui]) VALUES (4, N'kkkk', N'a@gmail.j.com', N'sss', N'aaaasss', CAST(0xA03E0B00 AS Date))
INSERT [dbo].[LienHe] ([IDLH], [HoTen], [Email], [ChuDe], [NoiDung], [NgayGui]) VALUES (5, N'admin ga', N'@gmail.com', N'chu de ', N'noi dung', CAST(0xAC3D0B00 AS Date))
INSERT [dbo].[LienHe] ([IDLH], [HoTen], [Email], [ChuDe], [NoiDung], [NgayGui]) VALUES (6, N'fwefwe', N'wefwe@xn--gergerg-6s4c', N'wefwe', N'wefew', CAST(0xB33F0B00 AS Date))
INSERT [dbo].[LienHe] ([IDLH], [HoTen], [Email], [ChuDe], [NoiDung], [NgayGui]) VALUES (7, N'wefwe', N'fwefwe@rhrthrt', N'wefwe', N'waefe', CAST(0xB33F0B00 AS Date))
INSERT [dbo].[LienHe] ([IDLH], [HoTen], [Email], [ChuDe], [NoiDung], [NgayGui]) VALUES (8, N'wefwe', N'fwefwe@rhrthrt', N'wefwe', N'waefe', CAST(0xB33F0B00 AS Date))
INSERT [dbo].[LienHe] ([IDLH], [HoTen], [Email], [ChuDe], [NoiDung], [NgayGui]) VALUES (9, N'eargre', N'were@grer', N'regre', N'regerger', CAST(0xB33F0B00 AS Date))
INSERT [dbo].[LienHe] ([IDLH], [HoTen], [Email], [ChuDe], [NoiDung], [NgayGui]) VALUES (10, N'eargre', N'were@grer', N'regre', N'regerger', CAST(0xB33F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[LienHe] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (1, N'Lý Nam Thông', N'457 Phố Đan, Phường Thời Trúc, Huyện An Bình Phước', N'01234567890', 1, CAST(0x45F70A00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (2, N'Ngô Công Lộc', N'721 Phố Duy, Phường Bồ Nghiêm Giang, Huyện Ân Thoa Mỹ Hồ Chí Minh', N'01234567891', 1, CAST(0x62090B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (3, N'Huỳnh Bảo Huỳnh', N'33, Ấp Trưởng Như, Phường Vịnh Vương, Huyện Như Lạng Sơn', N'01234567892', 1, CAST(0x980F0B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (4, N'Thân Hưng Ðạo', N'6889 Phố Lỳ Giao Nguyệt, Phường Nhiên Âu, Quận 58 Hải Phòng', N'01234567893', 1, CAST(0xFB060B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (5, N'Nguyễn Quang Vũ', N'217 Phố Hoàng Uy Đoan, Ấp Đan Lực, Huyện Tăng Kỷ Ân Cần Thơ', N'01234567894', 1, CAST(0x4F090B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (6, N'Đặng Ðông Hải', N'7 Phố Trà Thạch Hùng, Xã 14, Huyện Khuất Điện Biên', N'01234567895', 1, CAST(0x70010B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (7, N'Quang Khánh An', N'7 Phố Quản Sĩ Di, Phường Yên, Huyện 2 Bạc Liêu', N'01234567896', 1, CAST(0x05040B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (8, N'Lê Ðông Phương', N'70, Ấp 6, Xã Thanh Thời, Quận Ong Hạnh Vĩnh Long', N'01234567897', 1, CAST(0xA4FE0A00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (9, N'Lạc Hồng Quý', N'514, Thôn An Lều, Phường Ân, Quận Quách Lâm Đồng', N'01234567898', 1, CAST(0x1D0B0B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (10, N'Văn Tuấn Trung', N'10 Phố Chử, Xã 46, Quận Hội Đà Nẵng', N'01234567899', 1, CAST(0x59020B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (11, N'Phạm Thiên Thư', N'7169 Phố La, Phường 46, Quận Uyên Bửu Hà Giang', N'01234567900', 0, CAST(0x870B0B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (12, N'Phí Tuyết Trinh', N'820 Phố Lê Điền Vy, Xã 78, Huyện 4 Hồ Chí Minh', N'01234567901', 0, CAST(0xD90E0B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (13, N'Tôn Mỹ Vân', N'3 Phố Bạch Bảo Trân, Xã Bắc Huỳnh, Huyện Thiều Nhạn Bình Phước', N'01234567902', 0, CAST(0xB5100B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (14, N'Nguyễn Trúc Phương', N'372, Ấp Trang, Phường Trí, Huyện Nhã Đàm Hải Dương', N'01234567903', 0, CAST(0x05FF0A00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (15, N'Châu Minh Huệ', N'4889 Phố Triệu Thy Dinh, Phường Vịnh Long, Huyện Vương Đắk Nông', N'01234567904', 0, CAST(0x8CF60A00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (16, N'Hoàng Hoài Phương', N'03 Phố Hà Ty Anh, Phường 6, Huyện Toản Giáp Hải Dương', N'01234567905', 0, CAST(0x4DFB0A00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (17, N'Hoàng Gia Hân', N'2 Phố Đái, Phường Khánh, Quận Thơ Quỳnh Hòa Bình', N'01234567906', 0, CAST(0xC2110B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (18, N'Chung Khánh Thi (Thy)', N'35 Phố Thào Tuyền Uy, Ấp Mẫn Trung, Quận Mộc Quân Chiêu Hồ Chí Minh', N'01234567907', 0, CAST(0xC3EE0A00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (19, N'Thi Quỳnh Liên', N'6 Phố Ông Mạnh Sáng, Phường Ty Đình Hợp, Quận 15 Thanh Hóa', N'01234567908', 0, CAST(0x610D0B00 AS Date), N'Quản lý')
INSERT [dbo].[NhanVien] ([IDNV], [HoTen], [DiaChi], [SDT], [GioiTinh], [NgaySinh], [ChucVu]) VALUES (20, N'Lý Uyên Thơ', N'3 Phố Diêm Dinh Cầm, Xã Sử, Quận Quý Nhuận Hồ Chí Minh', N'01234567909', 0, CAST(0x08160B00 AS Date), N'Quản lý')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[Phong] ON 

INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (1, 10, N'P0001', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (2, 3, N'P0002', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (3, 10, N'P0003', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (4, 2, N'P0004', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (5, 11, N'P0005', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (6, 12, N'P0006', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (7, 2, N'P0007', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (8, 9, N'P0008', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (9, 4, N'P0009', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (10, 7, N'P0010', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (11, 2, N'P0011', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (12, 3, N'P0012', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (13, 2, N'P0013', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (14, 5, N'P0014', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (15, 6, N'P0015', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (16, 5, N'P0016', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (17, 1, N'P0017', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (18, 6, N'P0018', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (19, 5, N'P0019', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (20, 9, N'P0020', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (21, 8, N'P0021', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (22, 5, N'P0022', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (23, 7, N'P0023', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (24, 6, N'P0024', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (25, 9, N'P0025', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (26, 7, N'P0026', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (27, 1, N'P0027', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (28, 3, N'P0028', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (29, 10, N'P0029', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (30, 4, N'P0030', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (31, 4, N'P0031', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (32, 6, N'P0032', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (33, 3, N'P0033', 1, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (34, 10, N'P0034', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (35, 7, N'P0035', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (36, 1, N'P0036', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (37, 8, N'P0037', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (38, 7, N'P0038', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (39, 7, N'P0039', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (40, 6, N'P0040', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (41, 4, N'P0041', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (42, 11, N'P0042', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (43, 6, N'P0043', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (44, 10, N'P0044', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (45, 10, N'P0045', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (46, 3, N'P0046', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (47, 12, N'P0047', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (48, 10, N'P0048', 1, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (49, 11, N'P0049', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (50, 7, N'P0050', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (51, 2, N'P0051', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (52, 7, N'P0052', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (53, 4, N'P0053', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (54, 2, N'P0054', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (55, 4, N'P0055', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (56, 10, N'P0056', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (57, 2, N'P0057', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (58, 8, N'P0058', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (59, 12, N'P0059', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (60, 11, N'P0060', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (61, 8, N'P0061', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (62, 4, N'P0062', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (63, 7, N'P0063', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (64, 4, N'P0064', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (65, 2, N'P0065', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (66, 4, N'P0066', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (67, 9, N'P0067', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (68, 5, N'P0068', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (69, 11, N'P0069', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (70, 7, N'P0070', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (71, 2, N'P0071', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (72, 9, N'P0072', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (73, 5, N'P0073', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (74, 10, N'P0074', 1, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (75, 6, N'P0075', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (76, 8, N'P0076', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (77, 1, N'P0077', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (78, 11, N'P0078', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (79, 9, N'P0079', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (80, 12, N'P0080', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (81, 9, N'P0081', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (82, 8, N'P0082', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (83, 8, N'P0083', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (84, 3, N'P0084', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (85, 11, N'P0085', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (86, 1, N'P0086', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (87, 2, N'P0087', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (88, 10, N'P0088', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (89, 9, N'P0089', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (90, 9, N'P0090', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (91, 11, N'P0091', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (92, 10, N'P0092', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (93, 10, N'P0093', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (94, 5, N'P0094', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (95, 5, N'P0095', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (96, 12, N'P0096', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (97, 9, N'P0097', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (98, 8, N'P0098', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (99, 4, N'P0099', 0, 12)
GO
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (100, 5, N'P0100', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (101, 12, N'P0101', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (102, 10, N'P0102', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (103, 10, N'P0103', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (104, 7, N'P0104', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (105, 2, N'P0105', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (106, 7, N'P0106', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (107, 8, N'P0107', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (108, 12, N'P0108', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (109, 4, N'P0109', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (110, 6, N'P0110', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (111, 7, N'P0111', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (112, 3, N'P0112', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (113, 10, N'P0113', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (114, 11, N'P0114', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (115, 4, N'P0115', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (116, 2, N'P0116', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (117, 8, N'P0117', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (118, 12, N'P0118', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (119, 1, N'P0119', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (120, 1, N'P0120', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (121, 1, N'P0121', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (122, 1, N'P0122', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (123, 4, N'P0123', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (124, 4, N'P0124', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (125, 12, N'P0125', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (126, 10, N'P0126', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (127, 12, N'P0127', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (128, 10, N'P0128', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (129, 3, N'P0129', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (130, 6, N'P0130', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (131, 11, N'P0131', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (132, 9, N'P0132', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (133, 7, N'P0133', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (134, 2, N'P0134', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (135, 2, N'P0135', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (136, 4, N'P0136', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (137, 5, N'P0137', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (138, 6, N'P0138', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (139, 4, N'P0139', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (140, 6, N'P0140', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (141, 3, N'P0141', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (142, 5, N'P0142', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (143, 6, N'P0143', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (144, 7, N'P0144', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (145, 11, N'P0145', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (146, 11, N'P0146', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (147, 12, N'P0147', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (148, 11, N'P0148', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (149, 5, N'P0149', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (150, 8, N'P0150', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (151, 8, N'P0151', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (152, 11, N'P0152', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (153, 9, N'P0153', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (154, 5, N'P0154', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (155, 2, N'P0155', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (156, 11, N'P0156', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (157, 8, N'P0157', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (158, 9, N'P0158', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (159, 8, N'P0159', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (160, 12, N'P0160', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (161, 12, N'P0161', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (162, 9, N'P0162', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (163, 10, N'P0163', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (164, 12, N'P0164', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (165, 10, N'P0165', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (166, 5, N'P0166', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (167, 9, N'P0167', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (168, 1, N'P0168', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (169, 9, N'P0169', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (170, 5, N'P0170', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (171, 7, N'P0171', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (172, 2, N'P0172', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (173, 6, N'P0173', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (174, 12, N'P0174', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (175, 11, N'P0175', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (176, 1, N'P0176', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (177, 8, N'P0177', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (178, 6, N'P0178', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (179, 2, N'P0179', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (180, 9, N'P0180', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (181, 10, N'P0181', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (182, 11, N'P0182', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (183, 11, N'P0183', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (184, 6, N'P0184', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (185, 6, N'P0185', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (186, 9, N'P0186', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (187, 7, N'P0187', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (188, 5, N'P0188', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (189, 11, N'P0189', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (190, 10, N'P0190', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (191, 4, N'P0191', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (192, 2, N'P0192', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (193, 9, N'P0193', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (194, 7, N'P0194', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (195, 4, N'P0195', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (196, 1, N'P0196', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (197, 6, N'P0197', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (198, 7, N'P0198', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (199, 4, N'P0199', 0, 12)
GO
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (200, 9, N'P0200', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (201, 2, N'P0201', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (202, 7, N'P0202', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (203, 7, N'P0203', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (204, 11, N'P0204', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (205, 9, N'P0205', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (206, 1, N'P0206', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (207, 3, N'P0207', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (208, 11, N'P0208', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (209, 8, N'P0209', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (210, 2, N'P0210', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (211, 3, N'P0211', 0, 8)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (212, 2, N'P0212', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (213, 11, N'P0213', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (214, 3, N'P0214', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (215, 11, N'P0215', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (216, 6, N'P0216', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (217, 10, N'P0217', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (218, 10, N'P0218', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (219, 10, N'P0219', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (220, 11, N'P0220', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (221, 5, N'P0221', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (222, 9, N'P0222', 0, 11)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (223, 5, N'P0223', 0, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (224, 4, N'P0224', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (225, 9, N'P0225', 1, 9)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (226, 8, N'P0226', 0, 12)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (227, 8, N'P0227', 0, 10)
INSERT [dbo].[Phong] ([IDP], [IDKN], [TenPhong], [SoNguoiHienTai], [SoNguoiToiDa]) VALUES (228, 4, N'P0228', 0, 9)
SET IDENTITY_INSERT [dbo].[Phong] OFF
SET IDENTITY_INSERT [dbo].[SinhVien] ON 

INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (231, N'MSV_0001', N'Mai Ðinh Lộc', 29, N'29-K1', 1, CAST(0xD2130B00 AS Date), N'1840000001', N'0987654321')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (232, N'MSV_0002', N'Giang Hòa Thái', 52, N'52-K2', 1, CAST(0xEF140B00 AS Date), N'1840000002', N'0987654322')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (233, N'MSV_0003', N'Nguyễn Khánh Minh', 48, N'48-K2', 1, CAST(0x6B210B00 AS Date), N'1840000003', N'0987654323')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (234, N'MSV_0004', N'Liễu Thành Nguyên', 36, N'36-K3', 1, CAST(0x36250B00 AS Date), N'1840000004', N'0987654324')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (235, N'MSV_0005', N'Mạc Ðức Quảng', 33, N'33-K2', 1, CAST(0xCD140B00 AS Date), N'1840000005', N'0987654325')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (236, N'MSV_0006', N'Nguyễn Hoàng Duệ', 43, N'43-K3', 1, CAST(0xD80D0B00 AS Date), N'1840000006', N'0987654326')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (237, N'MSV_0007', N'Phí Quốc Hoàn', 53, N'53-K1', 1, CAST(0x7E1E0B00 AS Date), N'1840000007', N'0987654327')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (238, N'MSV_0008', N'Lý Trung Dũng', 37, N'37-K2', 1, CAST(0xAA190B00 AS Date), N'1840000008', N'0987654328')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (239, N'MSV_0009', N'Võ Quang Lân', 30, N'30-K1', 1, CAST(0x360A0B00 AS Date), N'1840000009', N'0987654329')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (240, N'MSV_0010', N'Ngư Xuân Cao', 29, N'29-K3', 1, CAST(0x610C0B00 AS Date), N'1840000010', N'0987654330')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (241, N'MSV_0011', N'Nguyễn Giang Thiên', 30, N'30-K3', 1, CAST(0xA30D0B00 AS Date), N'1840000011', N'0987654331')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (242, N'MSV_0012', N'Đàm Tuấn Linh', 29, N'29-K3', 1, CAST(0x03190B00 AS Date), N'1840000012', N'0987654332')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (243, N'MSV_0013', N'Châu Hữu Tường', 40, N'40-K2', 1, CAST(0x7D180B00 AS Date), N'1840000013', N'0987654333')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (244, N'MSV_0014', N'Phùng Dương Anh', 32, N'32-K2', 1, CAST(0x37250B00 AS Date), N'1840000014', N'0987654334')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (245, N'MSV_0015', N'Nguyễn Hữu Bình', 29, N'29-K2', 1, CAST(0x39140B00 AS Date), N'1840000015', N'0987654335')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (246, N'MSV_0016', N'Châu Anh Tài', 47, N'47-K2', 1, CAST(0x4F180B00 AS Date), N'1840000016', N'0987654336')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (247, N'MSV_0017', N'Phạm Thành Vinh', 50, N'50-K3', 1, CAST(0xDA1E0B00 AS Date), N'1840000017', N'0987654337')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (248, N'MSV_0018', N'Bùi Trung Hải', 53, N'53-K1', 1, CAST(0x300F0B00 AS Date), N'1840000018', N'0987654338')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (249, N'MSV_0019', N'Hoàng Huy Hoàng', 32, N'32-K1', 1, CAST(0xA5190B00 AS Date), N'1840000019', N'0987654339')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (250, N'MSV_0020', N'Phí Chính Hữu', 38, N'38-K3', 1, CAST(0x61130B00 AS Date), N'1840000020', N'0987654340')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (251, N'MSV_0021', N'Bùi Gia Phước', 32, N'32-K2', 1, CAST(0xEE240B00 AS Date), N'1840000021', N'0987654341')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (252, N'MSV_0022', N'Lâm Đình Chiến', 47, N'47-K1', 1, CAST(0x78110B00 AS Date), N'1840000022', N'0987654342')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (253, N'MSV_0023', N'Đỗ Gia Khánh', 30, N'30-K1', 1, CAST(0x43130B00 AS Date), N'1840000023', N'0987654343')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (254, N'MSV_0024', N'Đỗ Bình An', 49, N'49-K3', 1, CAST(0xC4080B00 AS Date), N'1840000024', N'0987654344')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (255, N'MSV_0025', N'Trang Duy Thành', 46, N'46-K3', 1, CAST(0x8C180B00 AS Date), N'1840000025', N'0987654345')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (256, N'MSV_0026', N'Võ Lam Phương', 46, N'46-K1', 1, CAST(0xE31C0B00 AS Date), N'1840000026', N'0987654346')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (257, N'MSV_0027', N'Tiêu Hoài Phong', 30, N'30-K1', 1, CAST(0x03090B00 AS Date), N'1840000027', N'0987654347')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (258, N'MSV_0028', N'Bùi Bá Thiện', 39, N'39-K1', 1, CAST(0x4E1E0B00 AS Date), N'1840000028', N'0987654348')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (259, N'MSV_0029', N'Lạc Việt Khang', 42, N'42-K3', 1, CAST(0xCC1A0B00 AS Date), N'1840000029', N'0987654349')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (260, N'MSV_0030', N'Triệu Tôn Lễ', 40, N'40-K1', 1, CAST(0x8F0B0B00 AS Date), N'1840000030', N'0987654350')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (261, N'MSV_0031', N'Hoàng Quang Nhân', 30, N'30-K1', 1, CAST(0x360E0B00 AS Date), N'1840000031', N'0987654351')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (262, N'MSV_0032', N'Trần Thành Long', 39, N'39-K1', 1, CAST(0x900E0B00 AS Date), N'1840000032', N'0987654352')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (263, N'MSV_0033', N'Nguyễn Hữu Trí', 47, N'47-K2', 1, CAST(0xFF150B00 AS Date), N'1840000033', N'0987654353')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (264, N'MSV_0034', N'Bùi Thanh Toàn', 53, N'53-K3', 1, CAST(0xCD180B00 AS Date), N'1840000034', N'0987654354')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (265, N'MSV_0035', N'Vương Sơn Hà', 38, N'38-K3', 1, CAST(0x0D250B00 AS Date), N'1840000035', N'0987654355')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (266, N'MSV_0036', N'Nguyễn Gia Phúc', 41, N'41-K3', 1, CAST(0xC5140B00 AS Date), N'1840000036', N'0987654356')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (267, N'MSV_0037', N'Thủy Thắng Lợi', 49, N'49-K1', 1, CAST(0xD81F0B00 AS Date), N'1840000037', N'0987654357')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (268, N'MSV_0038', N'Châu Phi Hoàng', 46, N'46-K2', 1, CAST(0xA60C0B00 AS Date), N'1840000038', N'0987654358')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (269, N'MSV_0039', N'Vĩnh Minh Chiến', 37, N'37-K3', 1, CAST(0x12100B00 AS Date), N'1840000039', N'0987654359')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (270, N'MSV_0040', N'Nguyễn Hữu Ðịnh', 28, N'28-K2', 1, CAST(0x981D0B00 AS Date), N'1840000040', N'0987654360')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (271, N'MSV_0041', N'Phó Tuấn Chương', 50, N'50-K1', 1, CAST(0x66230B00 AS Date), N'1840000041', N'0987654361')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (272, N'MSV_0042', N'Nguyễn Trung Nhân', 53, N'53-K3', 1, CAST(0x67230B00 AS Date), N'1840000042', N'0987654362')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (273, N'MSV_0043', N'Nguyễn Thiện Ðức', 43, N'43-K3', 1, CAST(0xB91D0B00 AS Date), N'1840000043', N'0987654363')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (274, N'MSV_0044', N'Nguyễn Nghĩa Hòa', 47, N'47-K1', 1, CAST(0xE0240B00 AS Date), N'1840000044', N'0987654364')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (275, N'MSV_0045', N'Nguyễn Phúc Khang', 54, N'54-K3', 1, CAST(0xC3080B00 AS Date), N'1840000045', N'0987654365')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (276, N'MSV_0046', N'Võ Trường Long', 37, N'37-K3', 1, CAST(0x541C0B00 AS Date), N'1840000046', N'0987654366')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (277, N'MSV_0047', N'Đỗ Minh Hùng', 53, N'53-K2', 1, CAST(0x45140B00 AS Date), N'1840000047', N'0987654367')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (278, N'MSV_0048', N'Quyền Quang Bửu', 47, N'47-K2', 1, CAST(0xA2080B00 AS Date), N'1840000048', N'0987654368')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (279, N'MSV_0049', N'Bùi Trung Chính', 31, N'31-K1', 1, CAST(0xAC150B00 AS Date), N'1840000049', N'0987654369')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (280, N'MSV_0050', N'Võ Huy Thông', 53, N'53-K1', 1, CAST(0x81150B00 AS Date), N'1840000050', N'0987654370')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (281, N'MSV_0051', N'Lê Ðức Hải', 28, N'28-K2', 1, CAST(0x790A0B00 AS Date), N'1840000051', N'0987654371')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (282, N'MSV_0052', N'Phạm Xuân Kiên', 31, N'31-K2', 1, CAST(0x4D150B00 AS Date), N'1840000052', N'0987654372')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (283, N'MSV_0053', N'Bùi Quang Huy', 48, N'48-K2', 1, CAST(0xB20A0B00 AS Date), N'1840000053', N'0987654373')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (284, N'MSV_0054', N'Nguyễn Thạch Tùng', 51, N'51-K1', 1, CAST(0x680D0B00 AS Date), N'1840000054', N'0987654374')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (285, N'MSV_0055', N'Hoàng Xuân An', 54, N'54-K1', 1, CAST(0xFA0B0B00 AS Date), N'1840000055', N'0987654375')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (286, N'MSV_0056', N'Đỗ Ðình Nam', 54, N'54-K3', 1, CAST(0x3E1B0B00 AS Date), N'1840000056', N'0987654376')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (287, N'MSV_0057', N'Vũ Ðại Ngọc', 54, N'54-K3', 1, CAST(0x33130B00 AS Date), N'1840000057', N'0987654377')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (288, N'MSV_0058', N'Bành Thanh Hào', 32, N'32-K3', 1, CAST(0x5C1A0B00 AS Date), N'1840000058', N'0987654378')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (289, N'MSV_0059', N'Dương Ngọc Dũng', 36, N'36-K1', 1, CAST(0xF0200B00 AS Date), N'1840000059', N'0987654379')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (290, N'MSV_0060', N'Nguyễn Mạnh Hà', 32, N'32-K1', 1, CAST(0xC50B0B00 AS Date), N'1840000060', N'0987654380')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (291, N'MSV_0061', N'Úc Hồng Quý', 30, N'30-K2', 1, CAST(0xA50F0B00 AS Date), N'1840000061', N'0987654381')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (292, N'MSV_0062', N'Nguyễn Huy Chiểu', 36, N'36-K3', 1, CAST(0x6F160B00 AS Date), N'1840000062', N'0987654382')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (293, N'MSV_0063', N'An Ðông Quân', 51, N'51-K3', 1, CAST(0xD50A0B00 AS Date), N'1840000063', N'0987654383')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (294, N'MSV_0064', N'Mạch Tân Bình', 46, N'46-K1', 1, CAST(0xD00E0B00 AS Date), N'1840000064', N'0987654384')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (295, N'MSV_0065', N'Ngô Bá Phước', 34, N'34-K3', 1, CAST(0xA20A0B00 AS Date), N'1840000065', N'0987654385')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (296, N'MSV_0066', N'Chử Ngọc Minh', 28, N'28-K3', 1, CAST(0x470F0B00 AS Date), N'1840000066', N'0987654386')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (297, N'MSV_0067', N'Lê Quốc Trung', 49, N'49-K1', 1, CAST(0x9C100B00 AS Date), N'1840000067', N'0987654387')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (298, N'MSV_0068', N'Nghiêm Bá Lộc', 52, N'52-K2', 1, CAST(0x13200B00 AS Date), N'1840000068', N'0987654388')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (299, N'MSV_0069', N'Nguyễn Anh Duy', 51, N'51-K2', 1, CAST(0xCF0E0B00 AS Date), N'1840000069', N'0987654389')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (300, N'MSV_0070', N'Huỳnh Ngọc Khương', 49, N'49-K1', 1, CAST(0x93170B00 AS Date), N'1840000070', N'0987654390')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (301, N'MSV_0071', N'Chu Anh Tuấn', 30, N'30-K2', 1, CAST(0x9F120B00 AS Date), N'1840000071', N'0987654391')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (302, N'MSV_0072', N'Hồ Minh Quân', 43, N'43-K1', 1, CAST(0x0D100B00 AS Date), N'1840000072', N'0987654392')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (303, N'MSV_0073', N'Thi Xuân Hãn', 31, N'31-K3', 1, CAST(0x0A150B00 AS Date), N'1840000073', N'0987654393')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (304, N'MSV_0074', N'Tô Hoàng Quân', 36, N'36-K1', 1, CAST(0x9E160B00 AS Date), N'1840000074', N'0987654394')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (305, N'MSV_0075', N'Hoàng Trường Giang', 32, N'32-K2', 1, CAST(0x7D230B00 AS Date), N'1840000075', N'0987654395')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (306, N'MSV_0076', N'Đoàn Thái Sơn', 46, N'46-K1', 1, CAST(0xF40A0B00 AS Date), N'1840000076', N'0987654396')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (307, N'MSV_0077', N'Liễu Thiên Lương', 50, N'50-K1', 1, CAST(0x13160B00 AS Date), N'1840000077', N'0987654397')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (308, N'MSV_0078', N'Phùng Triều Vĩ', 39, N'39-K2', 1, CAST(0x9A140B00 AS Date), N'1840000078', N'0987654398')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (309, N'MSV_0079', N'Ngô Gia Uy', 46, N'46-K3', 1, CAST(0x42190B00 AS Date), N'1840000079', N'0987654399')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (310, N'MSV_0080', N'Hàn Quang Sáng', 34, N'34-K1', 1, CAST(0xCD150B00 AS Date), N'1840000080', N'0987654400')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (311, N'MSV_0081', N'Ngô Duy Hoàng', 38, N'38-K2', 1, CAST(0x9C110B00 AS Date), N'1840000081', N'0987654401')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (312, N'MSV_0082', N'Võ Phi Ðiệp', 38, N'38-K1', 1, CAST(0xAE1E0B00 AS Date), N'1840000082', N'0987654402')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (313, N'MSV_0083', N'Huỳnh Gia Thiện', 46, N'46-K2', 1, CAST(0x3D250B00 AS Date), N'1840000083', N'0987654403')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (314, N'MSV_0084', N'Quyền Vũ Minh', 48, N'48-K2', 1, CAST(0x351B0B00 AS Date), N'1840000084', N'0987654404')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (315, N'MSV_0085', N'Phan Quốc Phong', 32, N'32-K1', 1, CAST(0x5F1B0B00 AS Date), N'1840000085', N'0987654405')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (316, N'MSV_0086', N'Trần Nam Việt', 43, N'43-K3', 1, CAST(0x000F0B00 AS Date), N'1840000086', N'0987654406')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (317, N'MSV_0087', N'Phạm Hải Sơn', 40, N'40-K2', 1, CAST(0x410A0B00 AS Date), N'1840000087', N'0987654407')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (318, N'MSV_0088', N'Nguyễn Ngọc Huy', 53, N'53-K1', 1, CAST(0x581F0B00 AS Date), N'1840000088', N'0987654408')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (319, N'MSV_0089', N'Doãn Xuân Lộc', 29, N'29-K3', 1, CAST(0xE5230B00 AS Date), N'1840000089', N'0987654409')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (320, N'MSV_0090', N'Đinh Thiện Nhân', 41, N'41-K3', 1, CAST(0x4B180B00 AS Date), N'1840000090', N'0987654410')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (321, N'MSV_0091', N'Úc Huy Tường', 40, N'40-K3', 1, CAST(0x80200B00 AS Date), N'1840000091', N'0987654411')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (322, N'MSV_0092', N'Huỳnh Quốc Tiến', 39, N'39-K3', 1, CAST(0xA30B0B00 AS Date), N'1840000092', N'0987654412')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (323, N'MSV_0093', N'Hoàng Trọng Khánh', 49, N'49-K2', 1, CAST(0x27170B00 AS Date), N'1840000093', N'0987654413')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (324, N'MSV_0094', N'Hoàng Thành An', 30, N'30-K2', 1, CAST(0x8F070B00 AS Date), N'1840000094', N'0987654414')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (325, N'MSV_0095', N'Vũ Ðức Anh', 39, N'39-K2', 1, CAST(0x09080B00 AS Date), N'1840000095', N'0987654415')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (326, N'MSV_0096', N'Võ Chí Công', 34, N'34-K2', 1, CAST(0x12230B00 AS Date), N'1840000096', N'0987654416')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (327, N'MSV_0097', N'Trang Hữu Trác', 54, N'54-K2', 1, CAST(0x1B210B00 AS Date), N'1840000097', N'0987654417')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (328, N'MSV_0098', N'Đặng Tuấn Hoàng', 41, N'41-K1', 1, CAST(0x1C100B00 AS Date), N'1840000098', N'0987654418')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (329, N'MSV_0099', N'Úc Ngọc Quang', 45, N'45-K3', 1, CAST(0x630E0B00 AS Date), N'1840000099', N'0987654419')
GO
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (330, N'MSV_0100', N'Nguyễn Minh Chiến', 29, N'29-K2', 1, CAST(0xD3220B00 AS Date), N'1840000100', N'0987654420')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (331, N'MSV_0101', N'Châu Thành Thiện', 39, N'39-K1', 1, CAST(0x2D100B00 AS Date), N'1840000101', N'0987654421')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (332, N'MSV_0102', N'Ngư Hữu Cường', 52, N'52-K1', 1, CAST(0x55200B00 AS Date), N'1840000102', N'0987654422')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (333, N'MSV_0103', N'Phan Việt Cường', 44, N'44-K1', 1, CAST(0x7F0D0B00 AS Date), N'1840000103', N'0987654423')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (334, N'MSV_0104', N'Nguyễn Tấn Tài', 38, N'38-K3', 1, CAST(0x1B190B00 AS Date), N'1840000104', N'0987654424')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (335, N'MSV_0105', N'Đinh Quang Thắng', 39, N'39-K1', 1, CAST(0x43190B00 AS Date), N'1840000105', N'0987654425')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (336, N'MSV_0106', N'Nguyễn Minh Triết', 37, N'37-K3', 1, CAST(0x1A210B00 AS Date), N'1840000106', N'0987654426')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (337, N'MSV_0107', N'Đào Duy Ngôn', 46, N'46-K3', 1, CAST(0xB2160B00 AS Date), N'1840000107', N'0987654427')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (338, N'MSV_0108', N'Phí Thiên Hưng', 40, N'40-K1', 1, CAST(0x0A0C0B00 AS Date), N'1840000108', N'0987654428')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (339, N'MSV_0109', N'Diệp Chí Hiếu', 31, N'31-K1', 1, CAST(0xD21E0B00 AS Date), N'1840000109', N'0987654429')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (340, N'MSV_0110', N'Lý Quang Triều', 50, N'50-K3', 1, CAST(0x22150B00 AS Date), N'1840000110', N'0987654430')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (341, N'MSV_0111', N'Nguyễn Thanh Hiền', 31, N'31-K1', 0, CAST(0x601D0B00 AS Date), N'1840000111', N'0987654431')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (342, N'MSV_0112', N'Châu Khánh Quyên', 44, N'44-K1', 0, CAST(0xF7190B00 AS Date), N'1840000112', N'0987654432')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (343, N'MSV_0113', N'Phạm Minh Yến', 42, N'42-K2', 0, CAST(0xC2130B00 AS Date), N'1840000113', N'0987654433')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (344, N'MSV_0114', N'Trần Ánh Lệ', 44, N'44-K3', 0, CAST(0x42080B00 AS Date), N'1840000114', N'0987654434')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (345, N'MSV_0115', N'Thái Kim Chi', 31, N'31-K2', 0, CAST(0x34140B00 AS Date), N'1840000115', N'0987654435')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (346, N'MSV_0116', N'Thảo Hồng Oanh', 45, N'45-K2', 0, CAST(0x5B090B00 AS Date), N'1840000116', N'0987654436')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (347, N'MSV_0117', N'Vũ Tú Trinh', 42, N'42-K1', 0, CAST(0x79210B00 AS Date), N'1840000117', N'0987654437')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (348, N'MSV_0118', N'Ngô Thanh Nhàn', 47, N'47-K3', 0, CAST(0x001F0B00 AS Date), N'1840000118', N'0987654438')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (349, N'MSV_0119', N'Phí Bích Lam', 54, N'54-K2', 0, CAST(0x9A0A0B00 AS Date), N'1840000119', N'0987654439')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (350, N'MSV_0120', N'Đào Tuyết Hoa', 44, N'44-K3', 0, CAST(0x6A120B00 AS Date), N'1840000120', N'0987654440')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (351, N'MSV_0121', N'Nguyễn Quỳnh Dao', 35, N'35-K2', 0, CAST(0x541D0B00 AS Date), N'1840000121', N'0987654441')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (352, N'MSV_0122', N'Nguyễn Minh Ngọc', 35, N'35-K3', 0, CAST(0x3E0B0B00 AS Date), N'1840000122', N'0987654442')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (353, N'MSV_0123', N'Úc Hương Giang', 44, N'44-K3', 0, CAST(0x441C0B00 AS Date), N'1840000123', N'0987654443')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (354, N'MSV_0124', N'Đỗ Nguyệt Nga', 36, N'36-K3', 0, CAST(0x540F0B00 AS Date), N'1840000124', N'0987654444')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (355, N'MSV_0125', N'Đinh Như Anh', 47, N'47-K1', 0, CAST(0x72130B00 AS Date), N'1840000125', N'0987654445')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (356, N'MSV_0126', N'Phạm Thanh Nhã', 37, N'37-K1', 0, CAST(0xAA240B00 AS Date), N'1840000126', N'0987654446')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (357, N'MSV_0127', N'Trầm Anh Thư', 34, N'34-K3', 0, CAST(0x40220B00 AS Date), N'1840000127', N'0987654447')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (358, N'MSV_0128', N'Đặng Liên Hương', 32, N'32-K3', 0, CAST(0x2E1D0B00 AS Date), N'1840000128', N'0987654448')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (359, N'MSV_0129', N'Nguyễn Như Loan', 28, N'28-K1', 0, CAST(0x481D0B00 AS Date), N'1840000129', N'0987654449')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (360, N'MSV_0130', N'Đỗ Hồng Ngân', 53, N'53-K1', 0, CAST(0x60150B00 AS Date), N'1840000130', N'0987654450')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (361, N'MSV_0131', N'Nguyễn Hồng Thắm', 28, N'28-K1', 0, CAST(0x9A100B00 AS Date), N'1840000131', N'0987654451')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (362, N'MSV_0132', N'Bùi Thúy Liễu', 53, N'53-K2', 0, CAST(0x7C210B00 AS Date), N'1840000132', N'0987654452')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (363, N'MSV_0133', N'Ngô Lệ Thanh', 48, N'48-K1', 0, CAST(0xE7160B00 AS Date), N'1840000133', N'0987654453')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (364, N'MSV_0134', N'Vĩnh Nguyệt Minh', 40, N'40-K2', 0, CAST(0x791D0B00 AS Date), N'1840000134', N'0987654454')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (365, N'MSV_0135', N'Đinh Tùng Quân', 48, N'48-K3', 0, CAST(0x3C230B00 AS Date), N'1840000135', N'0987654455')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (366, N'MSV_0136', N'Phó Ðông Tuyền', 49, N'49-K2', 0, CAST(0xA30E0B00 AS Date), N'1840000136', N'0987654456')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (367, N'MSV_0137', N'Mạch Bảo Trân', 51, N'51-K1', 0, CAST(0x7F230B00 AS Date), N'1840000137', N'0987654457')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (368, N'MSV_0138', N'Chử Lan Phương', 51, N'51-K1', 0, CAST(0x59150B00 AS Date), N'1840000138', N'0987654458')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (369, N'MSV_0139', N'Phạm Tuyết Mai', 38, N'38-K3', 0, CAST(0x04090B00 AS Date), N'1840000139', N'0987654459')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (370, N'MSV_0140', N'Cao Ngọc Ánh', 43, N'43-K1', 0, CAST(0x761F0B00 AS Date), N'1840000140', N'0987654460')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (371, N'MSV_0141', N'Lê Ngọc Quyên', 45, N'45-K3', 0, CAST(0x761B0B00 AS Date), N'1840000141', N'0987654461')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (372, N'MSV_0142', N'Hồ Minh Nhi', 38, N'38-K2', 0, CAST(0x330E0B00 AS Date), N'1840000142', N'0987654462')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (373, N'MSV_0143', N'Lê Khánh Vy', 53, N'53-K1', 0, CAST(0x150B0B00 AS Date), N'1840000143', N'0987654463')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (374, N'MSV_0144', N'Lương Bích Châu', 35, N'35-K3', 0, CAST(0xED090B00 AS Date), N'1840000144', N'0987654464')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (375, N'MSV_0145', N'Dữu Khánh Ngọc', 46, N'46-K3', 0, CAST(0x7A170B00 AS Date), N'1840000145', N'0987654465')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (376, N'MSV_0146', N'Tô Linh Chi', 29, N'29-K3', 0, CAST(0x9C160B00 AS Date), N'1840000146', N'0987654466')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (377, N'MSV_0147', N'Tạ Lệ Hoa', 42, N'42-K2', 0, CAST(0x53100B00 AS Date), N'1840000147', N'0987654467')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (378, N'MSV_0148', N'Lưu Hồng Mai', 28, N'28-K2', 0, CAST(0x5A150B00 AS Date), N'1840000148', N'0987654468')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (379, N'MSV_0149', N'Lâm Bảo Thúy', 29, N'29-K2', 0, CAST(0x291B0B00 AS Date), N'1840000149', N'0987654469')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (380, N'MSV_0150', N'Dương Mộng Vân', 33, N'33-K1', 0, CAST(0x93120B00 AS Date), N'1840000150', N'0987654470')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (381, N'MSV_0151', N'Phạm Hà Nhi', 38, N'38-K3', 0, CAST(0x44130B00 AS Date), N'1840000151', N'0987654471')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (382, N'MSV_0152', N'Ngô Thảo My', 49, N'49-K3', 0, CAST(0xDF120B00 AS Date), N'1840000152', N'0987654472')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (383, N'MSV_0153', N'Lý Thùy Uyên', 40, N'40-K3', 0, CAST(0x17220B00 AS Date), N'1840000153', N'0987654473')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (384, N'MSV_0154', N'Đỗ Hồng Hạnh', 51, N'51-K2', 0, CAST(0x8E090B00 AS Date), N'1840000154', N'0987654474')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (385, N'MSV_0155', N'Quyền Thiện Tiên', 28, N'28-K1', 0, CAST(0x4C140B00 AS Date), N'1840000155', N'0987654475')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (386, N'MSV_0156', N'Cao Diễm Quỳnh', 37, N'37-K3', 0, CAST(0xBF0B0B00 AS Date), N'1840000156', N'0987654476')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (387, N'MSV_0157', N'Lưu Tường Vân', 50, N'50-K1', 0, CAST(0x200D0B00 AS Date), N'1840000157', N'0987654477')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (388, N'MSV_0158', N'Mạch Uyên Minh', 32, N'32-K2', 0, CAST(0xCE090B00 AS Date), N'1840000158', N'0987654478')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (389, N'MSV_0159', N'Vương Kiều Mai', 47, N'47-K1', 0, CAST(0x2E230B00 AS Date), N'1840000159', N'0987654479')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (390, N'MSV_0160', N'Võ Phương Nhi', 32, N'32-K2', 0, CAST(0xAC1C0B00 AS Date), N'1840000160', N'0987654480')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (391, N'MSV_0161', N'Dương Hồng Mai', 34, N'34-K2', 0, CAST(0x0C090B00 AS Date), N'1840000161', N'0987654481')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (392, N'MSV_0162', N'Hoàng Mỹ Nhi', 50, N'50-K1', 0, CAST(0x811F0B00 AS Date), N'1840000162', N'0987654482')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (393, N'MSV_0163', N'Hồ Khánh Mai', 31, N'31-K3', 0, CAST(0x24100B00 AS Date), N'1840000163', N'0987654483')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (394, N'MSV_0164', N'Võ Kim Hoa', 36, N'36-K2', 0, CAST(0x7C0E0B00 AS Date), N'1840000164', N'0987654484')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (395, N'MSV_0165', N'Hoàng Kiều Mỹ', 50, N'50-K2', 0, CAST(0x3F190B00 AS Date), N'1840000165', N'0987654485')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (396, N'MSV_0166', N'Đặng Uyên Trâm', 29, N'29-K3', 0, CAST(0x7C110B00 AS Date), N'1840000166', N'0987654486')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (397, N'MSV_0167', N'Lý Hồng Ngân', 35, N'35-K3', 0, CAST(0x320B0B00 AS Date), N'1840000167', N'0987654487')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (398, N'MSV_0168', N'Bùi Hương Nhi', 32, N'32-K2', 0, CAST(0x321A0B00 AS Date), N'1840000168', N'0987654488')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (399, N'MSV_0169', N'Bùi Trúc Lâm', 47, N'47-K1', 0, CAST(0x460D0B00 AS Date), N'1840000169', N'0987654489')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (400, N'MSV_0170', N'Bùi Quế Chi', 30, N'30-K2', 0, CAST(0x34100B00 AS Date), N'1840000170', N'0987654490')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (401, N'MSV_0171', N'Bùi Hiền Mai', 38, N'38-K3', 0, CAST(0x8E210B00 AS Date), N'1840000171', N'0987654491')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (402, N'MSV_0172', N'Phan Thanh Hà', 42, N'42-K2', 0, CAST(0x68140B00 AS Date), N'1840000172', N'0987654492')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (403, N'MSV_0173', N'Chử Ngọc Quyên', 32, N'32-K1', 0, CAST(0xDC1A0B00 AS Date), N'1840000173', N'0987654493')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (404, N'MSV_0174', N'Dương Thu Huyền', 52, N'52-K2', 0, CAST(0x66100B00 AS Date), N'1840000174', N'0987654494')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (405, N'MSV_0175', N'Vũ Mai Linh', 42, N'42-K2', 0, CAST(0xA30A0B00 AS Date), N'1840000175', N'0987654495')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (406, N'MSV_0176', N'Võ Quỳnh Nga', 37, N'37-K3', 0, CAST(0x9F190B00 AS Date), N'1840000176', N'0987654496')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (407, N'MSV_0177', N'Ngô Yến Loan', 30, N'30-K2', 0, CAST(0xCE190B00 AS Date), N'1840000177', N'0987654497')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (408, N'MSV_0178', N'Đỗ Ngọc Linh', 46, N'46-K1', 0, CAST(0x7B100B00 AS Date), N'1840000178', N'0987654498')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (409, N'MSV_0179', N'Nguyễn Gia Quỳnh', 53, N'53-K3', 0, CAST(0x5F110B00 AS Date), N'1840000179', N'0987654499')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (410, N'MSV_0180', N'Lục Thanh Trang', 31, N'31-K2', 0, CAST(0x63210B00 AS Date), N'1840000180', N'0987654500')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (411, N'MSV_0181', N'Quách Hạnh Nga', 44, N'44-K2', 0, CAST(0x1D1F0B00 AS Date), N'1840000181', N'0987654501')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (412, N'MSV_0182', N'Lưu Như Quỳnh', 53, N'53-K2', 0, CAST(0xAE1D0B00 AS Date), N'1840000182', N'0987654502')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (413, N'MSV_0183', N'Hồ Mai Trinh', 32, N'32-K2', 0, CAST(0x2E230B00 AS Date), N'1840000183', N'0987654503')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (414, N'MSV_0184', N'Lê Thu Mai', 49, N'49-K3', 0, CAST(0xC40A0B00 AS Date), N'1840000184', N'0987654504')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (415, N'MSV_0185', N'Chung Lệ Băng', 36, N'36-K1', 0, CAST(0x740D0B00 AS Date), N'1840000185', N'0987654505')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (416, N'MSV_0186', N'Ngô Thanh Uyên', 49, N'49-K2', 0, CAST(0xB8190B00 AS Date), N'1840000186', N'0987654506')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (417, N'MSV_0187', N'Hoàng Thanh Thu', 49, N'49-K2', 0, CAST(0x4D120B00 AS Date), N'1840000187', N'0987654507')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (418, N'MSV_0188', N'Quách Kim Khuyên', 29, N'29-K1', 0, CAST(0x29110B00 AS Date), N'1840000188', N'0987654508')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (419, N'MSV_0189', N'Phan Hồng Nhung', 51, N'51-K1', 0, CAST(0x30080B00 AS Date), N'1840000189', N'0987654509')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (420, N'MSV_0190', N'Trương Thùy Linh', 42, N'42-K2', 0, CAST(0x21110B00 AS Date), N'1840000190', N'0987654510')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (421, N'MSV_0191', N'Lê Tuệ Lâm', 43, N'43-K3', 0, CAST(0x0C1C0B00 AS Date), N'1840000191', N'0987654511')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (422, N'MSV_0192', N'Phan Phương Thủy', 49, N'49-K3', 0, CAST(0xE51D0B00 AS Date), N'1840000192', N'0987654512')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (423, N'MSV_0193', N'Lý Phương Thanh', 42, N'42-K3', 0, CAST(0x830E0B00 AS Date), N'1840000193', N'0987654513')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (424, N'MSV_0194', N'Trang Bích Hà', 42, N'42-K1', 0, CAST(0x28210B00 AS Date), N'1840000194', N'0987654514')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (425, N'MSV_0195', N'Huỳnh Hà Mi', 53, N'53-K3', 0, CAST(0xD8210B00 AS Date), N'1840000195', N'0987654515')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (426, N'MSV_0196', N'Trần Minh Tuệ', 33, N'33-K1', 0, CAST(0xD20A0B00 AS Date), N'1840000196', N'0987654516')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (427, N'MSV_0197', N'Vũ Kiều Anh', 28, N'28-K2', 0, CAST(0x320B0B00 AS Date), N'1840000197', N'0987654517')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (428, N'MSV_0198', N'Nguyễn Ban Mai', 35, N'35-K2', 0, CAST(0x0F130B00 AS Date), N'1840000198', N'0987654518')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (429, N'MSV_0199', N'Dữu Bích Ngân', 53, N'53-K1', 0, CAST(0x4C0E0B00 AS Date), N'1840000199', N'0987654519')
GO
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (430, N'MSV_0200', N'Lý Diễm Phúc', 35, N'35-K3', 0, CAST(0x401D0B00 AS Date), N'1840000200', N'0987654520')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (431, N'MSV_0201', N'Mai Mộng Nguyệt', 48, N'48-K3', 0, CAST(0x04200B00 AS Date), N'1840000201', N'0987654521')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (432, N'MSV_0202', N'Nguyễn Vân Thúy', 34, N'34-K2', 0, CAST(0x6D130B00 AS Date), N'1840000202', N'0987654522')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (433, N'MSV_0203', N'Châu Ánh Nguyệt', 48, N'48-K3', 0, CAST(0xB8160B00 AS Date), N'1840000203', N'0987654523')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (434, N'MSV_0204', N'Võ Triều Nguyệt', 38, N'38-K2', 0, CAST(0xA7090B00 AS Date), N'1840000204', N'0987654524')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (435, N'MSV_0205', N'Phan Khánh Mai', 35, N'35-K1', 0, CAST(0xC01F0B00 AS Date), N'1840000205', N'0987654525')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (436, N'MSV_0206', N'Đỗ Thúy Hạnh', 51, N'51-K3', 0, CAST(0x0D230B00 AS Date), N'1840000206', N'0987654526')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (437, N'MSV_0207', N'Tạ Ngọc San', 46, N'46-K2', 0, CAST(0x960A0B00 AS Date), N'1840000207', N'0987654527')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (438, N'MSV_0208', N'Thái Thái Hà', 37, N'37-K1', 0, CAST(0xF10A0B00 AS Date), N'1840000208', N'0987654528')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (439, N'MSV_0209', N'Chung Ngọc Khanh', 43, N'43-K2', 0, CAST(0x69240B00 AS Date), N'1840000209', N'0987654529')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (440, N'MSV_0210', N'Cao Quế Phương', 50, N'50-K3', 0, CAST(0x7A1D0B00 AS Date), N'1840000210', N'0987654530')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (441, N'MSV_0211', N'Trần Lam Hà', 39, N'39-K2', 0, CAST(0x5F190B00 AS Date), N'1840000211', N'0987654531')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (442, N'MSV_0212', N'Trang Thảo Nhi', 44, N'44-K1', 0, CAST(0x9B180B00 AS Date), N'1840000212', N'0987654532')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (443, N'MSV_0213', N'Bạch Ðan Khanh', 33, N'33-K1', 0, CAST(0x6F240B00 AS Date), N'1840000213', N'0987654533')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (444, N'MSV_0214', N'Phan Thúy Ngọc', 31, N'31-K3', 0, CAST(0x0C210B00 AS Date), N'1840000214', N'0987654534')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (445, N'MSV_0215', N'Nguyễn Phương Nhi', 29, N'29-K2', 0, CAST(0x450F0B00 AS Date), N'1840000215', N'0987654535')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (446, N'MSV_0216', N'Thân Nguyệt Hồng', 37, N'37-K1', 0, CAST(0xDA200B00 AS Date), N'1840000216', N'0987654536')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (447, N'MSV_0217', N'Hoàng Khuê Trúc', 35, N'35-K1', 0, CAST(0x15220B00 AS Date), N'1840000217', N'0987654537')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (448, N'MSV_0218', N'Nguyễn Việt Hà', 49, N'49-K3', 0, CAST(0xE9100B00 AS Date), N'1840000218', N'0987654538')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (449, N'MSV_0219', N'Bành Hương Thu', 33, N'33-K2', 0, CAST(0xE8110B00 AS Date), N'1840000219', N'0987654539')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (450, N'MSV_0220', N'Lý Bích Hiền', 34, N'34-K3', 0, CAST(0x410C0B00 AS Date), N'1840000220', N'0987654540')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (451, N'MSV_0221', N'Dương Anh Thảo', 43, N'43-K1', 0, CAST(0xFB140B00 AS Date), N'1840000221', N'0987654541')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (452, N'MSV_0222', N'Nguyễn Thục Khuê', 28, N'28-K2', 0, CAST(0x7C150B00 AS Date), N'1840000222', N'0987654542')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (453, N'MSV_0223', N'Nguyễn Thụy Vân', 46, N'46-K2', 0, CAST(0xBA190B00 AS Date), N'1840000223', N'0987654543')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (454, N'MSV_0224', N'Thạch Ngọc Khanh', 49, N'49-K1', 0, CAST(0x580B0B00 AS Date), N'1840000224', N'0987654544')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (455, N'MSV_0225', N'Hoàng Thu Thảo', 36, N'36-K2', 0, CAST(0x421B0B00 AS Date), N'1840000225', N'0987654545')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (456, N'MSV_0226', N'Chu Nguyệt Lan', 43, N'43-K2', 0, CAST(0x9E0C0B00 AS Date), N'1840000226', N'0987654546')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (457, N'MSV_0227', N'Trầm Thu Hường', 34, N'34-K1', 0, CAST(0xF01F0B00 AS Date), N'1840000227', N'0987654547')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (458, N'MSV_0228', N'Nguyễn Kiều Nguyệt', 40, N'40-K2', 0, CAST(0x541F0B00 AS Date), N'1840000228', N'0987654548')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (459, N'MSV_0229', N'Dương Ngọc Lệ', 46, N'46-K3', 0, CAST(0x3A0A0B00 AS Date), N'1840000229', N'0987654549')
INSERT [dbo].[SinhVien] ([IDSV], [MaSV], [HoTen], [IDTH], [Lop], [GioiTinh], [NgaySinh], [SoCMND], [SDT]) VALUES (460, N'MSV_0230', N'Ngư Ngọc Thơ', 30, N'30-K1', 0, CAST(0x05130B00 AS Date), N'1840000230', N'0987654550')
SET IDENTITY_INSERT [dbo].[SinhVien] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([IDU], [UserName], [Password], [Email], [UserType], [UserStatus]) VALUES (1, N'admin', N'admin', N'admin@gmail.com', 0, 1)
INSERT [dbo].[tblUser] ([IDU], [UserName], [Password], [Email], [UserType], [UserStatus]) VALUES (2, N'user1', N'user1', N'user@gmail.com', 1, 1)
INSERT [dbo].[tblUser] ([IDU], [UserName], [Password], [Email], [UserType], [UserStatus]) VALUES (3, N'a', N'a', N'a@gmail.j.com', 1, 1)
INSERT [dbo].[tblUser] ([IDU], [UserName], [Password], [Email], [UserType], [UserStatus]) VALUES (4, N'b', N'b', N'nohukalu@alienwar.e13.com', 1, 1)
SET IDENTITY_INSERT [dbo].[tblUser] OFF
SET IDENTITY_INSERT [dbo].[TruongHoc] ON 

INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (28, N'Học viện Âm nhạc Huế', N'8 Phố Trang, Phường Phương, Quận Lạc Thuận An Giang')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (29, N'Học viện Âm nhạc Quốc gia Việt Nam', N'22, Thôn Khâu Trâm, Xã Đoan Thập, Huyện Lộc Lào Cai')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (30, N'Học viện Báo chí và Tuyên truyền', N'556, Ấp Ý Trâm, Xã 4, Huyện Lực Ong Hà Nam')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (31, N'Học viện Cán bộ Quản lý xây dựng và đô thị', N'07 Phố Bồ Duyên Trác, Phường Ty Diệu, Huyện Nhuận Cao Bằng')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (32, N'Học viện Cán bộ Thành phố Hồ Chí Minh', N'77, Thôn Thuần Trang, Xã 8, Quận 63 Kiên Giang')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (33, N'Học viện Chính sách và phát triển', N'574 Phố Phan Thanh Giao, Phường 16, Huyện Vừ Miên Kiếm Đà Nẵng')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (34, N'Học viện Chính trị - Hành chính Quốc gia Hồ Chí Minh', N'443 Phố Trác Chi Hương, Xã Cát, Quận 8 Hồ Chí Minh')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (35, N'Học viện Công nghệ Bưu chính Viễn thông cơ sở 2, Thành phố Hồ Chí Minh', N'6948 Phố Hán, Xã Ẩn Cầm, Huyện Dương Cát Thái Nguyên')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (36, N'Học viện Công nghệ Bưu chính Viễn thông', N'782 Phố Cấn Tuyền Thoa, Xã Lạc, Quận Khổng Bảo Thiên Đà Nẵng')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (37, N'Học viện Dân tộc', N'213 Phố Ấu Quyên Ân, Phường 9, Quận 06 Quảng Ngãi')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (38, N'Học viện Hàng không Việt Nam', N'9, Ấp Ý Mẫn, Xã 3, Quận Duyên Hữu Hà Tĩnh')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (39, N'Học viện Hành chính Quốc gia', N'4 Phố Hằng, Xã Kiều, Huyện Việt Điền Hải Phòng')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (40, N'Học viện Khoa học và Công nghệ', N'324 Phố Khuê, Xã 2, Quận Minh Quyền Thừa Thiên Huế')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (41, N'Học viện Khoa học, Công nghệ và Đổi mới sáng tạo', N'6 Phố Bành, Xã Thào, Huyện Hán Nhàn Hòa Bình')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (42, N'Học viện Khoa học xã hội', N'5578 Phố Dư, Phường Ly Mộc, Huyện Bàng Mạnh Hà Tĩnh')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (43, N'Học viện Ngân hàng', N'131, Thôn Kim Kiếm, Phường Triệu Hương Thời, Huyện Khâu Bảo Đắk Nông')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (44, N'Học viện Ngoại giao Việt Nam', N'7768 Phố Diệu, Xã Nghĩa Đào, Huyện 6 Đà Nẵng')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (45, N'Học viện Phụ nữ Việt Nam', N'868, Ấp Khoát Xuân, Xã 5, Huyện Tuyến Đồng Tháp')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (46, N'Học viện Quản lý Giáo dục', N'73, Ấp Lễ Vân, Xã Xa Ngân Bảo, Huyện Hoa Vân Quảng Nam')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (47, N'Học viện Tài chính', N'44, Ấp Thoại Đình, Thôn Ty Tuyết, Huyện Cự Ngạn Hải Phú Thọ')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (48, N'Học viện Thanh thiếu niên Việt Nam', N'7062, Thôn 93, Xã Lộ Trúc, Huyện Thiều Phú Yên')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (49, N'Học viện Tòa án', N'897 Phố Đỗ Tâm Kiều, Xã Trạch Mai, Quận Mộc Sử Cần Thơ')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (50, N'Học viện Tư Pháp', N'6, Thôn Khổng Mỹ Chi, Xã 41, Huyện Tiêu Thường Gia Lai')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (51, N'Học viện Xây dựng Đảng', N'3274 Phố Nguyễn, Ấp Kim Thùy, Huyện Cung Tâm Đoan Bắc Ninh')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (52, N'Học viện Y dược học cổ truyền Việt Nam', N'54 Phố Lò, Thôn Khương Trí, Quận Phương Cần Thơ8 Phố Trang, Phường Phương, Quận Lạc Thuận An Giang')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (53, N'Nhạc viện Thành phố Hồ Chí Minh', N'22, Thôn Khâu Trâm, Xã Đoan Thập, Huyện Lộc Lào Cai')
INSERT [dbo].[TruongHoc] ([IDTH], [TenTruong], [DiaChi]) VALUES (54, N'Viện Đại học Mở Hà Nội', N'556, Ấp Ý Trâm, Xã 4, Huyện Lực Ong Hà Nam')
SET IDENTITY_INSERT [dbo].[TruongHoc] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__KhuNha__144753739B4CAD71]    Script Date: 5/26/2019 8:38:48 PM ******/
ALTER TABLE [dbo].[KhuNha] ADD  CONSTRAINT [UQ__KhuNha__144753739B4CAD71] UNIQUE NONCLUSTERED 
(
	[KhuNha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__NhanVien__CA1930A5E25C7A76]    Script Date: 5/26/2019 8:38:48 PM ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UQ__NhanVien__CA1930A5E25C7A76] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SinhVien__2725081B4602425A]    Script Date: 5/26/2019 8:38:48 PM ******/
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [UQ__SinhVien__2725081B4602425A] UNIQUE NONCLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SinhVien__2725081BDCB234BB]    Script Date: 5/26/2019 8:38:48 PM ******/
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [UQ__SinhVien__2725081BDCB234BB] UNIQUE NONCLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SinhVien__CA1930A5D0145E4C]    Script Date: 5/26/2019 8:38:48 PM ******/
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [UQ__SinhVien__CA1930A5D0145E4C] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__SinhVien__F5EEA1C65D9628B8]    Script Date: 5/26/2019 8:38:48 PM ******/
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [UQ__SinhVien__F5EEA1C65D9628B8] UNIQUE NONCLUSTERED 
(
	[SoCMND] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tblUser__A9D10534EFF360A5]    Script Date: 5/26/2019 8:38:48 PM ******/
ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [UQ__tblUser__A9D10534EFF360A5] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tblUser__C9F284568070B651]    Script Date: 5/26/2019 8:38:48 PM ******/
ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [UQ__tblUser__C9F284568070B651] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tblUser__C9F28456B31CD6DF]    Script Date: 5/26/2019 8:38:48 PM ******/
ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [UQ__tblUser__C9F28456B31CD6DF] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Phong1] FOREIGN KEY([IDP])
REFERENCES [dbo].[Phong] ([IDP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Phong1]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_Phong1] FOREIGN KEY([IDP])
REFERENCES [dbo].[Phong] ([IDP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HopDong_Phong1]
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_SinhVien] FOREIGN KEY([IDSV])
REFERENCES [dbo].[SinhVien] ([IDSV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HopDong_SinhVien]
GO
ALTER TABLE [dbo].[KhuNha]  WITH CHECK ADD  CONSTRAINT [FK_KhuNha_NhanVien] FOREIGN KEY([IDNV])
REFERENCES [dbo].[NhanVien] ([IDNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KhuNha] CHECK CONSTRAINT [FK_KhuNha_NhanVien]
GO
ALTER TABLE [dbo].[KyLuatKhenThuong]  WITH CHECK ADD  CONSTRAINT [FK_KyLuatKhenThuong_SinhVien] FOREIGN KEY([IDSV])
REFERENCES [dbo].[SinhVien] ([IDSV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KyLuatKhenThuong] CHECK CONSTRAINT [FK_KyLuatKhenThuong_SinhVien]
GO
ALTER TABLE [dbo].[Phong]  WITH CHECK ADD  CONSTRAINT [FK_Phong_KhuNha] FOREIGN KEY([IDKN])
REFERENCES [dbo].[KhuNha] ([IDKN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phong] CHECK CONSTRAINT [FK_Phong_KhuNha]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_TruongHoc] FOREIGN KEY([IDTH])
REFERENCES [dbo].[TruongHoc] ([IDTH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_TruongHoc]
GO
/****** Object:  Trigger [dbo].[trigger_HopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_HopDong] ON [dbo].[HopDong]
    AFTER INSERT,update,delete
AS
    BEGIN
        UPDATE  dbo.Phong
        SET     SoNguoiHienTai = ( SELECT   COUNT(IDP)
                                   FROM     dbo.HopDong
                                   WHERE    dbo.Phong.IDP = dbo.HopDong.IDP
                                            AND dbo.HopDong.NgayKetThuc > GETDATE()
                                   GROUP BY dbo.HopDong.IDP
                                 )
        UPDATE  dbo.Phong
        SET     SoNguoiHienTai = 0
        WHERE   SoNguoiHienTai IS NULL
    END
GO
/****** Object:  Trigger [dbo].[trigger_SuaHopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_SuaHopDong] ON [dbo].[HopDong]
    AFTER update
AS
    BEGIN
        UPDATE  dbo.Phong
        SET     SoNguoiHienTai = ( SELECT   COUNT(IDP)
                                   FROM     dbo.HopDong
                                   WHERE    dbo.Phong.IDP = dbo.HopDong.IDP
                                            AND dbo.HopDong.NgayKetThuc > GETDATE()
                                   GROUP BY dbo.HopDong.IDP
                                 )
        UPDATE  dbo.Phong
        SET     SoNguoiHienTai = 0
        WHERE   SoNguoiHienTai IS NULL
    END
GO
/****** Object:  Trigger [dbo].[trigger_ThemHopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_ThemHopDong] ON [dbo].[HopDong]
    AFTER INSERT
AS
    BEGIN
        UPDATE  dbo.Phong
        SET     SoNguoiHienTai = ( SELECT   COUNT(IDP)
                                   FROM     dbo.HopDong
                                   WHERE    dbo.Phong.IDP = dbo.HopDong.IDP
                                            AND dbo.HopDong.NgayKetThuc > GETDATE()
                                   GROUP BY dbo.HopDong.IDP
                                 )
        UPDATE  dbo.Phong
        SET     SoNguoiHienTai = 0
        WHERE   SoNguoiHienTai IS NULL
    END
GO
/****** Object:  Trigger [dbo].[trigger_XoaHopDong]    Script Date: 5/26/2019 8:38:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trigger_XoaHopDong] ON [dbo].[HopDong]
    AFTER delete
AS
    BEGIN
        UPDATE  dbo.Phong
        SET     SoNguoiHienTai = ( SELECT   COUNT(IDP)
                                   FROM     dbo.HopDong
                                   WHERE    dbo.Phong.IDP = dbo.HopDong.IDP
                                            AND dbo.HopDong.NgayKetThuc > GETDATE()
                                   GROUP BY dbo.HopDong.IDP
                                 )
        UPDATE  dbo.Phong
        SET     SoNguoiHienTai = 0
        WHERE   SoNguoiHienTai IS NULL
    END
GO
USE [master]
GO
ALTER DATABASE [QuanLyPhongTro] SET  READ_WRITE 
GO
