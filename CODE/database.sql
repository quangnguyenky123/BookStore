CREATE DATABASE [BookStore]
GO
USE [BookStore]
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDonDatHang] [varchar](50) NULL,
	[IdSach] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 2) NULL,
 CONSTRAINT [PK__ChiTietD__3214EC07CF2927DE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhapSach]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhapSach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPhieuNhap] [varchar](50) NULL,
	[IdSach] [int] NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK__ChiTietP__3214EC07200D702D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[Id] [varchar](50) NOT NULL,
	[IdKH] [varchar](50) NULL,
	[NgayDat] [date] NULL,
	[NgayGiao] [date] NULL,
	[DaHuy] [bit] NULL,
	[TrangThai] [int] NULL,
	[IsConfirm] [bit] NULL,
 CONSTRAINT [PK__DonDatHa__3214EC07D0BAB162] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[Id] [varchar](50) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Email] [varchar](50) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[IdThanhVien] [int] NULL,
 CONSTRAINT [PK__KhachHan__3214EC075421A232] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenNXB] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhapSach]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhapSach](
	[Id] [varchar](50) NOT NULL,
	[IdNXB] [int] NULL,
	[NgayNhap] [datetime] NULL,
 CONSTRAINT [PK__PhieuNha__3214EC0729125FE8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTriVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [varchar](20) NULL,
	[MatKhau] [varchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Email] [varchar](50) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[IdQuyen] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK__QuanTriV__3214EC0746BB4CB2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenSach] [nvarchar](100) NOT NULL,
	[IdTacGia] [int] NULL,
	[IdNXB] [int] NULL,
	[IdDanhMuc] [int] NULL,
	[Tap] [int] NULL,
	[SoLuong] [int] NOT NULL,
	[Gia] [int] NOT NULL,
	[TomTat] [nvarchar](max) NULL,
	[NgayThem] [date] NOT NULL,
	[TrangThai] [int] NULL,
	[HinhAnh] [varchar](max) NOT NULL,
	[SoLuotMua] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenTacGia] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhVien]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhVien](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [varchar](20) NULL,
	[MatKhau] [varchar](16) NULL,
	[Ten] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Email] [varchar](50) NULL,
	[SoDienThoai] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThaiGiaoHang]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiGiaoHang](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenTrangThai] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThaiSach]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiSach](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenTrangThai] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThaiSuDung]    Script Date: 02/01/2019 22:03:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiSuDung](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenTrangThai] [nvarchar](100) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] ON 

INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (1, N'DDH0162-8586576986310485122', 55, 40, CAST(130410.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (2, N'DDH0162-8586576986310485122', 59, 18, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (3, N'DDH0162-8586576986310485122', 61, 12, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (4, N'DDH5983-8586576983961613511', 55, 40, CAST(130410.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (5, N'DDH5983-8586576983961613511', 59, 18, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (6, N'DDH5983-8586576983961613511', 61, 12, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (7, N'DDH5983-8586576979131507725', 55, 28, CAST(130410.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (8, N'DDH5983-8586576979131507725', 59, 18, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (9, N'DDH5983-8586576979131507725', 61, 12, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (10, N'DDH5983-8586576979131507725', 63, 1, CAST(45820.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (11, N'DDH1233-8586576973202700082', 55, 5, CAST(130410.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (12, N'DDH5983-8586576159773152823', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (13, N'DDH5983-8586576159773152823', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (14, N'DDH5983-8586575441412519528', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (15, N'DDH5983-8586575441412519528', 59, 14, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (16, N'DDH2533-8586575289388445087', 18, 1, CAST(2342.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (17, N'DDH4526-8586575254772146113', 39, 3, CAST(44400.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (18, N'DDH4526-8586575254772146113', 18, 4, CAST(2342.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (19, N'DDH4526-8586575254772146113', 63, 3, CAST(45820.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (20, N'DDH4526-8586575254772146113', 61, 3, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (21, N'DDH4526-8586575254772146113', 55, 3, CAST(130410.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (22, N'DDH4526-8586575254772146113', 14, 3, CAST(93750.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (23, N'DDH4526-8586575254772146113', 65, 3, CAST(66300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (24, N'DDH4526-8586575254772146113', 64, 3, CAST(40300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (25, N'DDH4526-8586575254772146113', 59, 2, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (26, N'DDH3652-8586558165857591789', 64, 1, CAST(40300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (27, N'DDH3652-8586558165857591789', 65, 1, CAST(66300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (28, N'DDH3652-8586558165857591789', 63, 1, CAST(45820.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (29, N'DDH5983-8586552097992362071', 65, 1, CAST(66300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (30, N'DDH5983-8586552092878961932', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (31, N'DDH5983-8586552091454873762', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (32, N'DDH5983-8586552091454873762', 55, 1, CAST(130410.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (33, N'DDH4526-8586552088999872804', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (34, N'DDH5983-8586551958527619877', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (35, N'DDH5983-8586551958527619877', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (36, N'DDH5983-8586551750441521927', 55, 1, CAST(130410.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (37, N'DDH5983-8586551748465867822', 55, 1, CAST(130410.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (38, N'DDH5983-8586551746329731362', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (39, N'DDH5983-8586551745145622248', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (40, N'DDH5983-8586551745145622248', 63, 1, CAST(45820.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (41, N'DDH5983-8586551745145622248', 64, 1, CAST(40300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (42, N'DDH5983-8586551744257729697', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (43, N'DDH5983-8586551744257729697', 63, 1, CAST(45820.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (44, N'DDH5983-8586551742936031876', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (45, N'DDH5983-8586551742936031876', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (46, N'DDH5983-8586551742926011822', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (47, N'DDH5983-8586551742926011822', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (48, N'DDH5983-8586551663432514739', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (49, N'DDH5983-8586551663432514739', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (50, N'DDH4983-8586551658531399122', 55, 1, CAST(130410.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (51, N'DDH4983-8586551658531399122', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (52, N'DDH4983-8586551658531399122', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (53, N'DDH4983-8586551658531399122', 63, 1, CAST(45820.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (54, N'DDH4983-8586551657237175416', 65, 1, CAST(66300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (55, N'DDH4983-8586551657237175416', 64, 1, CAST(40300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (56, N'DDH4983-8586551657237175416', 63, 1, CAST(45820.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (57, N'DDH4983-8586551657237175416', 61, 1, CAST(103600.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (58, N'DDH4983-8586551657237175416', 59, 1, CAST(80300.00 AS Decimal(18, 2)))
INSERT [dbo].[ChiTietDonDatHang] ([Id], [IdDonDatHang], [IdSach], [SoLuong], [DonGia]) VALUES (59, N'DDH4983-8586551657237175416', 55, 1, CAST(130410.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ChiTietDonDatHang] OFF
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhapSach] ON 

INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (4, N'2-8586584416854775808', 7, 10, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (5, N'2-8586583850167828924', 7, 10, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (6, N'2-8586583849896155215', 7, 10, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (7, N'2-8586583849766850539', 7, 10, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (8, N'1-8586583847246325573', 6, 10, CAST(12323 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (9, N'2-8586583045620704228', 17, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (10, N'2-8586583045620704228', 18, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (11, N'4-8586582993584060926', 9, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (12, N'3-8586582983450434730', 8, 1, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (13, N'3-8586582983450434730', 10, 12, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (14, N'3-8586582983450434730', 14, 1, CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (15, N'2-8586582982919864883', 7, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (16, N'2-8586582982919864883', 11, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (17, N'2-8586582982919864883', 13, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (18, N'2-8586582982919864883', 17, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (19, N'2-8586582982919864883', 18, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (20, N'3-8586582981253574065', 8, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (21, N'3-8586582981253574065', 10, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (22, N'3-8586582981253574065', 14, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (23, N'3-8586582981253574065', 10, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (24, N'3-8586582981253574065', 10, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (25, N'3-8586582981253574065', 8, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (26, N'3-8586582981253574065', 14, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (27, N'3-8586582981253574065', 10, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (28, N'3-8586582981253574065', 10, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (29, N'3-8586582981253574065', 10, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (30, N'3-8586582981253574065', 14, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (31, N'3-8586582981253574065', 14, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (32, N'3-8586582981253574065', 10, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (33, N'3-8586582981253574065', 10, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (34, N'3-8586582981253574065', 8, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (35, N'3-8586582981253574065', 8, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (36, N'3-8586582981253574065', 8, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (37, N'1-8586582979049345475', 6, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (38, N'1-8586582979049345475', 12, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (39, N'1-8586582979049345475', 15, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (40, N'1-8586582979049345475', 6, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (41, N'1-8586582979049345475', 12, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (42, N'1-8586582979049345475', 12, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (43, N'1-8586582979049345475', 15, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (44, N'PNS4-8586582977332504224', 9, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (45, N'PNS4-8586582977332504224', 9, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (46, N'PNS4-8586582977332504224', 9, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (47, N'PNS4-8586582977332504224', 9, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (48, N'PNS1-8586582970047766567', 6, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (49, N'PNS1-8586582970047766567', 12, 2, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (50, N'PNS1-8586582970047766567', 15, 3, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (51, N'PNS1-8586582967839015554', 6, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (52, N'PNS1-8586582967839015554', 12, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (53, N'PNS1-8586582967839015554', 15, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (54, N'PNS2-8586582965720683589', 7, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (55, N'PNS2-8586582965720683589', 18, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (56, N'PNS2-8586582965720683589', 13, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (57, N'PNS2-8586582965720683589', 17, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (58, N'PNS2-8586582965128950243', 7, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (59, N'PNS2-8586582965128950243', 18, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (60, N'PNS2-8586582965128950243', 13, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (61, N'PNS2-8586582965128950243', 17, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (62, N'PNS4-8586582964495696423', 9, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (63, N'PNS4-8586582961458901136', 9, 1, CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (64, N'PNS1-8586576154196120536', 15, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (65, N'PNS2-8586575250476577549', 7, 3, CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (66, N'PNS2-8586575250476577549', 13, 3, CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (67, N'PNS2-8586575250476577549', 17, 3, CAST(54000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (68, N'PNS2-8586575250476577549', 18, 5, CAST(45000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (69, N'PNS1-8586559652763505246', 59, 17, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (70, N'PNS1-8586558163577192599', 59, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (71, N'PNS1-8586558163577192599', 15, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (72, N'PNS1-8586558163577192599', 12, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (73, N'PNS1-8586558163577192599', 28, 1, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietPhieuNhapSach] ([Id], [IdPhieuNhap], [IdSach], [SoLuong], [DonGia]) VALUES (74, N'PNS1-8586558163577192599', 50, 1, CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ChiTietPhieuNhapSach] OFF
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (3, N'Điện-Điện tử', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (4, N'Cơ khí', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (5, N'Kiến trúc', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (7, N'Khởi nghiệp - Làm giàu', N'', 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (9, N'Truyện Tranh', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (10, N'Ngoại Thương', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (11, N'Chứng Khoán', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (41, N'Bất Động Sản', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (42, N'Đầu tư', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (43, N'Văn học', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (44, N'Máy tính', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (45, N'Tin học', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (46, N'Tiểu thuyết', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (47, N'Truyện ngắn', NULL, 1)
INSERT [dbo].[DanhMuc] ([Id], [TenDanhMuc], [MoTa], [TrangThai]) VALUES (48, N'Gia đình', NULL, 1)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH0162-8586576986310485122', N'KH0162-8586576986310485122', CAST(N'2018-12-04' AS Date), NULL, 0, 1, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH1233-8586576973202700082', N'KH1233-8586576973202700082', CAST(N'2018-12-04' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH2533-8586575289388445087', N'KH2533-8586575289388445087', CAST(N'2018-12-06' AS Date), CAST(N'2018-12-08' AS Date), 0, 2, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH3652-8586558165857591789', N'KH3652-8586558165857591789', CAST(N'2018-12-26' AS Date), CAST(N'2018-12-27' AS Date), 0, 2, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH4526-8586552088999872804', N'KH4526-8586575254772146113', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH4526-8586575254772146113', N'KH4526-8586575254772146113', CAST(N'2018-12-06' AS Date), CAST(N'2018-12-24' AS Date), 0, 2, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH4983-8586551657237175416', N'KH4983-8586551657237175416', CAST(N'2019-01-02' AS Date), CAST(N'2019-01-04' AS Date), 0, 3, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH4983-8586551658531399122', N'KH4983-8586551658531399122', CAST(N'2019-01-02' AS Date), CAST(N'2019-01-03' AS Date), 0, 2, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586551663432514739', N'KH5983-8586551663432514739', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586551742926011822', N'KH5983-8586551742926011822', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586551742936031876', N'KH5983-8586551742936031876', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586551744257729697', N'KH5983-8586551744257729697', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586551745145622248', N'KH5983-8586551745145622248', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586551746329731362', N'KH5983-8586551746329731362', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586551748465867822', N'KH5983-8586551748465867822', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586551750441521927', N'KH5983-8586551750441521927', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586551958527619877', N'KH0162-8586576986310485122', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586552091454873762', N'KH0162-8586576986310485122', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 0)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586552092878961932', N'KH0162-8586576986310485122', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586552097992362071', N'KH5983-8586552097992362071', CAST(N'2019-01-02' AS Date), NULL, 0, 1, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586575441412519528', N'KH5983-8586575441412519528', CAST(N'2018-12-06' AS Date), NULL, 0, 1, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586576159773152823', N'KH5983-8586576159773152823', CAST(N'2018-12-05' AS Date), NULL, 0, 1, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586576979131507725', N'KH5983-8586576979131507725', CAST(N'2018-12-04' AS Date), CAST(N'2018-12-26' AS Date), 0, 2, 1)
INSERT [dbo].[DonDatHang] ([Id], [IdKH], [NgayDat], [NgayGiao], [DaHuy], [TrangThai], [IsConfirm]) VALUES (N'DDH5983-8586576983961613511', N'KH5983-8586576983961613511', CAST(N'2018-12-04' AS Date), NULL, 0, 1, 1)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH0162-8586576986310485122', N'Văn An', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH1233-8586576973202700082', N'bui vu thien', N'q9 tphcm', N'thienbv.1301@gmail.com', N'032123321', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH2533-8586575289388445087', N'Nguyễn Văn Bình', N'q10 tphcm', N'binh@gmail.com', N'01627893352', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH3652-8586558165857591789', N'Nguyen Thanh An', N'q9 tphcm', N'an@gmail.com', N'0326542563', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH4526-8586575254772146113', N'Bùi Văn Thiện', N'q10 tphcm', N'thienbv.1301@gmail.com', N'0365236254', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH4983-8586551657237175416', N'Bùi Vũ Thiện', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893894', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH4983-8586551658531399122', N'Bùi Vũ Thiện', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893894', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586551663432514739', N'Văn An', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586551742926011822', N'Văn An', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586551742936031876', N'Văn An', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586551744257729697', N'Văn An', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586551745145622248', N'Văn An', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586551746329731362', N'Văn An', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586551748465867822', N'Văn An', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586551750441521927', N'Văn An', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586552097992362071', N'bui vu thien', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586575441412519528', N'Bùi Vũ Thiện', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893894', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586576159773152823', N'bui vu thien', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586576979131507725', N'bui vu thien', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
INSERT [dbo].[KhachHang] ([Id], [TenKH], [DiaChi], [Email], [SoDienThoai], [IdThanhVien]) VALUES (N'KH5983-8586576983961613511', N'bui vu thien', N'q9 tphcm', N'thienbv.1301@gmail.com', N'01627893895', NULL)
SET IDENTITY_INSERT [dbo].[NhaXuatBan] ON 

INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (1, N'NXB Trẻ', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (2, N'AZ Việt Nam', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (3, N'Kim Đồng', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (4, N'Alphabooks', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (7, N'Nhã Nam', NULL, 2)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (9, N'Trí Việt - First News', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (10, N'Thai Ha Books', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (11, N' Bách Việt', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (12, N'Minh Long', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (13, N'Đinh Tị', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (14, N'Nhã Nam', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (15, N'IPM', NULL, 1)
INSERT [dbo].[NhaXuatBan] ([Id], [TenNXB], [MoTa], [TrangThai]) VALUES (16, N'Hoa Học Trò', NULL, 1)
SET IDENTITY_INSERT [dbo].[NhaXuatBan] OFF
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'1-8586582979049345475', 1, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'1-8586583847246325573', 1, CAST(N'2018-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'2-8586582982919864883', 2, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'2-8586583045620704228', 2, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'2-8586583849766850539', 2, CAST(N'2018-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'2-8586583849896155215', 2, CAST(N'2018-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'2-8586583850167828924', 2, CAST(N'2018-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'2-8586584416854775808', 2, CAST(N'2018-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'3-8586582981253574065', 3, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'3-8586582983450434730', 3, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'4-8586582993584060926', 4, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS1-8586558163577192599', 1, CAST(N'2018-12-26T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS1-8586559652763505246', 1, CAST(N'2018-12-24T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS1-8586576154196120536', 1, CAST(N'2018-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS1-8586582967839015554', 1, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS1-8586582970047766567', 1, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS2-8586575250476577549', 2, CAST(N'2018-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS2-8586582965128950243', 2, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS2-8586582965720683589', 2, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS4-8586582961458901136', 4, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS4-8586582964495696423', 4, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[PhieuNhapSach] ([Id], [IdNXB], [NgayNhap]) VALUES (N'PNS4-8586582977332504224', 4, CAST(N'2018-11-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[QuanTriVien] ON 

INSERT [dbo].[QuanTriVien] ([Id], [TaiKhoan], [MatKhau], [Ten], [DiaChi], [Email], [SoDienThoai], [IdQuyen], [TrangThai]) VALUES (2, N'ThienBV', N'25d55ad283aa400af464c76d713c07ad', N'Bùi Vũ Thiện', N'Q9', N'thienbv.1301@gmail.com', N'034652365', 1, 1)
INSERT [dbo].[QuanTriVien] ([Id], [TaiKhoan], [MatKhau], [Ten], [DiaChi], [Email], [SoDienThoai], [IdQuyen], [TrangThai]) VALUES (3, N'QuangNK', N'123', N'Nguyễn Kỳ Quang', N'Q9', N'quangnk@gmail.com', N'034652365', 1, 1)
INSERT [dbo].[QuanTriVien] ([Id], [TaiKhoan], [MatKhau], [Ten], [DiaChi], [Email], [SoDienThoai], [IdQuyen], [TrangThai]) VALUES (4, N'ThienBV1', N'5c4d8562ced2eebf9f1ae97a9def3fd8', N'Bùi Vũ Thiện', N'dsfsadfs fasfasf', N'sadasd@sd', N'3242343423', 1, 0)
INSERT [dbo].[QuanTriVien] ([Id], [TaiKhoan], [MatKhau], [Ten], [DiaChi], [Email], [SoDienThoai], [IdQuyen], [TrangThai]) VALUES (5, N'test123', N'25d55ad283aa400af464c76d713c07ad', N'test', N'test', N'test@mail.com', N'3242343423', 2, 1)
SET IDENTITY_INSERT [dbo].[QuanTriVien] OFF
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([Id], [TenQuyen], [MoTa]) VALUES (1, N'Employee', NULL)
INSERT [dbo].[Quyen] ([Id], [TenQuyen], [MoTa]) VALUES (2, N'Admin', NULL)
SET IDENTITY_INSERT [dbo].[Quyen] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (6, N'Trí Thông Minh Cảm Xúc For Dummies', 23, 10, 3, NULL, 14, 68310, N'Trí Thông Minh Cảm Xúc For Dummies

Trí thông minh cảm xúc chỉ sự thông minh trên phương diện tình cảm. Nó bao gồm khả năng nhận biết cảm xúc của mình cũng như của người khác, thấu hiểu những cảm xúc ấy và kiểm soát được chúng.

Trong nhiều năm, thậm chí nhiều thập kỷ, các nhà tâm lý học đã khám phá ra rất nhiều khái niệm về trí thông minh cảm xúc. Tuy nhiên, những kiến thức ấy lại tồn tại rời rạc mà không được tổng hợp và hệ thống hóa. Chỉ đến năm 1989, khi hai nhà tâm lý học – John (Jack) Mayer của Đại học New Hampshire và Peter Salovey của Đại học Yale – cho ra đời một lý thuyết nhìn nhận cả trí thông minh và cảm xúc trên cùng một hệ quy chiếu, khái niệm trí thông minh cảm xúc mới bước đầu được định hình.

Nhận thức và kiểm soát cảm xúc là một trong những bí quyết để đạt được thành công trong cuộc sống cá nhân cũng như tại nơi làm việc. Cuốn sách thú vị này sẽ giúp bạn thấu hiểu cảm xúc của bản thân và kiểm soát chúng, thay vì để chúng điều khiển bạn. Thông qua các phương pháp thực tế đã được kiểm chứng và những bài tập hữu ích, bạn sẽ khám phá cách để tăng cường sự tự tin, xây dựng những mối quan hệ bền vững với đối tác, gia đình, bạn bè, và tìm thấy hạnh phúc đích thực.

Đặc biệt trong bối cảnh Cách mạng công nghiệp 4.0 trí thông minh cảm xúc ngày càng trở nên quan trọng. Trong một thế giới của những thay đổi sâu sắc không ngừng, những cá nhân, tố chức với trí thông minh cảm xúc cao sẽ không chỉ sáng tạo hơn mà còn được trang bị tốt hơn để linh hoạt và bền bỉ hơn – một đặc tính then chốt để đối mặt với sự đột phá.

Mục lục:

Phần 1: Một loại thông minh mới xuất hiện

Phần 2: Bản chất của trí thông minh cảm xúc

Phần 3: Đưa trí thông minh cảm xúc vào công việc

Phần 4: Sử dụng trí thông minh cảm xúc trong gia đình

Phần 5: Danh sách mười điều', CAST(N'2018-10-10' AS Date), 3, N'TriThongMinhCamXucForDummies.jpg', 123)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (7, N'36 +14 Chước Thuyết Phục Bất Kỳ Ai (Tái Bản 2018)', 1, 2, 4, NULL, 36, 68310, N'36 +14 Chước Thuyết Phục Bất Kỳ Ai (Tái Bản 2018)

Hẳn đã có lúc bạn gặp những người có lời nói và hành động đầy sức mê hoặc khiến bạn như rơi vào vòng xoáy ảnh hưởng, bị dẫn dắt theo những ý tưởng, niềm tin của họ. Có lẽ cũng không ít lần bạn băn khoăn tự hỏi điều gì làm nên quyền uy của những bậc thầy thuyết phục đó. Câu trả lời là: vì họ biết cách thu hút mọi người, lay chuyển và biến những người chưa theo hoặc phản đối thành người ủng hộ dựa trên các nguyên tắc tâm lý của nghệ thuật thuyết phục. Điều gây ấn tượng không chỉ ở cách họ dễ dàng sử dụng sức thu hút và tài hùng biện để thuyết phục người khác đồng thuận với mình, mà còn ở chỗ họ khiến người khác cảm thấy hào hứng khi làm vậy. Họ chính là những chuyên gia thuyết phục.

Không chỉ các chuyên gia thuyết phục mới biết và áp dụng các nguyên tắc của nghệ thuật thuyết phục. Trong các mối quan hệ thường ngày với hàng xóm, bạn bè, người yêu, đồng nghiệp, khách hàng, đối thủ, chúng ta vẫn thường áp dụng những nguyên tắc tâm lý gây ảnh hưởng lên người khác chỉ có điều, chúng ta chưa am hiểu tường tận để có thể tận dụng tối đa sức mạnh của các “vũ khí” gây ảnh hưởng này.

Trong 36+14 chước thuyết phục bất kỳ ai, các tác giả đã giải nghĩa 6 vũ khí gây ảnh hưởng và chi phối đến những lựa chọn, quyết định của con người, và cách chúng thể hiện trong nhiều hoàn cảnh cụ thể, tập trung không chỉ tại công sở mà còn ở cả những giao thiệp cá nhân của bạn − ví dụ, với tư cách là bậc cha mẹ, người hàng xóm hay bạn bè. Những lời khuyên được đưa ra cũng rất thực tế, giúp định hướng hành động, mang tính đạo đức cao và dễ thực hiện, lại không hề tốn công sức hay tiền bạc.', CAST(N'2018-10-10' AS Date), 3, N'36_14_chuoc_thuyet_phuc_outline_28.3.2018-01.jpg', 123)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (8, N'Những Điều Tuổi Trẻ Thường Lãng Phí (Tái Bản 2018)', 1, 3, 5, NULL, 6, 74250, N'Thường thì có những điều trải qua rồi mới cảm thấy hối hận, rồi tự ru lòng bằng hai từ “giá như”. Thường thì thời gian trôi đi không trở lại bao giờ và tuổi đời của con người cũng chốc lát và vô thường. Giữa dòng đời vội vã, mấy ai chịu dừng lại để cảm nhận hương vị của cuộc sống, cảm nhận vẻ đẹp của thiên nhiên và lắng nghe chính mình? Để rồi họ đã lãng phí rất nhiều: Lãng phí tình yêu chân thành, lãng phí hạnh phúc giản dị, lãng phí cả nụ cười hồn hậu của Mẹ…

Cuốn sách này sẽ giúp chúng ta nhận ra những điều đó, chúng ta sẽ bắt gặp chính mình qua các nhân vật, qua các hình ảnh, qua các tình huống mà tác giả đề cập. Dĩ nhiên chúng ta sẽ nhận ra điều quan trọng nhất của đời mình là gì, và phải làm sao để tuổi trẻ trôi qua không hề lãng phí mà tràn đầy ý nghĩa, tràn đầy sức sống, hạnh phục thực sự và thành công trong cuộc sống.', CAST(N'2018-10-10' AS Date), 1, N'image_179062.jpg', 344)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (9, N'Chuyện Nhà Dr.Thanh', 1, 4, 5, NULL, 7, 256780, N'Chuyện Nhà Dr.Thanh

"Với Chuyện Nhà Dr. Thanh, tôi không có ý định thay đổi cách suy nghĩ của nhiều người về bản thân và gia đình mình, tôi chỉ muốn chia sẻ những câu chuyện có thật trong một gia tộc doanh nhân đầy sóng gió." (Trần Uyên Phương)

Chuyện Nhà Dr. Thanh của tác giả Trần Uyên Phương là cuốn tự truyện kể về cuộc đời sóng gió của ông chủ tập đoàn Tân Hiệp Phát - Trần Quí Thanh, những góc khuất đằng sau sự thành đạt và hùng mạnh của một gia tộc doanh nhân. Câu chuyện có nhiều tình tiết bất ngờ cuốn hút người đọc theo những biến cố trong cuộc đời ông. 

"Đây là một quyển sách rất ấn tượng về một doanh nhân, nỗ lực để xây dựng và phát triển một doanh nghiệp tư nhân lớn mạnh cùng thương hiệu của mình." - Võ Trí Thành – Chuyên gia kinh tế 

"Khi đọc tác phẩm này cá nhân Chí Trung rất xúc động, dù tác giả không cố tình làm văn, mọi thứ rất giản dị, cầm lên là đọc không buông xuống được" - NSƯT Chí Trung - Giám đốc Nhà hát Tuổi Trẻ', CAST(N'2018-10-10' AS Date), 1, N'chuyen-nha-dr-thanh.jpg', 234)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (10, N'Nhà Giả Kim (Tái Bản 2017)', 1, 3, 3, NULL, 20, 53820, N'Nhà Giả Kim (Tái Bản 2017)

NHÀ GIẢ KIM là cuốn sách được in nhiều nhất chỉ sau Kinh Thánh. Cuốn sách của Paulo Coelho có sự hấp dẫn ra sao khiến độc giả không chỉ các xứ dùng ngôn ngữ Bồ Đào Nha mà các ngôn ngữ khác say mê như vậy?

Tiểu thuyết NHÀ GIẢ KIM của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.

“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.” - Trích NHÀ GIẢ KIM', CAST(N'2018-10-10' AS Date), 1, N'8935235213746.jpg', 234)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (11, N'Nguồn Cội', 1, 2, 4, NULL, 1, 137500, N'Robert Langdon, giáo sư biểu tượng và biểu tượng tôn giáo đến từ trường đại học Harvard, đã tới Bảo tàng Guggenheim Bilbao để tham dự một sự kiện quan trọng - công bố một phát hiện "sẽ thay đổi bộ mặt khoa học mãi mãi".

Edmond Kirsch là một tỷ phú bốn mươi tuổi, một nhà tiên tri. Những phát minh kỹ thuật cao và những dự đoán táo bạo đã làm cho anh trở thành một nhân vật nổi tiếng toàn cầu. Kirsch - cũng chính là một trong những sinh viên đầu tiên của Langdon tại đại học Harvard cách đây hai thập kỷ - sẽ tiết lộ một bước đột phá đáng kinh ngạc...

Nó sẽ trả lời hai câu hỏi cơ bản về sự tồn tại của con người:
"Chúng ta đến từ đâu?" và "Chúng ta đang đi về đâu?"

Khi sự kiện bắt đầu, Langdon và vài trăm quan khách bị cuốn hút bởi một bài thuyết trình độc đáo mà chính Langdon cũng nhận thấy rằng sẽ gây ra nhiều tranh cãi hơn những gì ông tưởng tượng. Nhưng sự kiện này đột nhiên biến thành cuộc hỗn loạn, và khám phá quý giá của Kirsch đang dần biến mất vĩnh viễn. Trước nguy cơ phải đối mặt với một mối đe doạ sắp xảy ra, Langdon bị buộc phải bỏ trốn để thoát khỏi Bilbao cùng Ambra Vidal - Hoàng hậu tương lai của Tây Ban Nha để tìm ra mật khẩu bí ẩn sẽ mở ra bí mật của Kirsch.

Để chiến thắng những bí mật được giấu kín của lịch sử và tôn giáo cực đoan, Langdon và Ambra phải trốn tránh một thế lực với sức mạnh dường như xuất phát từ chính Hoàng gia Tây Ban Nha... và đang cố tìm cách để giữ Edmond Kirsch im lặng. Trên một hành trình được đánh dấu bởi các tác phẩm nghệ thuật hiện đại và các ký hiệu bí ẩn, Langdon và Vidal đã tìm ra những manh mối cuối cùng đưa họ đối mặt với khám phá gây sốc của Kirsch... và sự thật mà từ lâu chúng ta đã tìm kiếm.', CAST(N'2018-10-10' AS Date), 3, N'nguoncoi.jpg', 536)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (12, N'Rìu, Đàn, Cúc', 1, 1, 5, NULL, 7, 65550, N'Mùa xuân một năm nọ, vua tơ sống Nhật Bản nằm xuống, để lại sau lưng đế chế công nghiệp hùng mạnh và tấm gương lập nghiệp thành công đến mức trở thành huyền thoại.

Nén hương nguyện hồn chưa cháy hết, con cháu cụ đã nhộn nhạo vì bản di chúc quái đản. Dưới ánh sáng của ngọn nến thờ, bộ mặt những kẻ thừa kế nom thật ghê sợ. Làm sao mà một triệu phú nổi tiếng sống có tình người lại để lại cho con cháu mình bản di chúc chứa đựng mầm mống tàn sát lẫn nhau như vậy?

Khác với vua tơ sống đi lên từ gian khó, những kẻ thừa kế này sung sướng từ nhỏ và giống nhau ở một điểm chung là ích kỉ. Ở họ không có đức tính táo bạo của người khai phá, nhưng thói ranh mãnh và đầu óc tính toán thì lại rất nảy nở. Họ thích đâm dao sau lưng người khác hơn là chiến đấu công khai. Sinh ra bởi đại bàng, nhưng họ đã thoái hóa thành một bầy quạ.

Nếu không thế, thì cho dù bản di chúc có tai quái đến đâu, cũng không thể đẩy cả gia đình vào cảnh đổ máu.

Thấy trước diễn biến tàn khốc đó, một luật sư của gia đình đã hẹn gặp thám tử Kindaichi Kosuke để bàn với anh cách ngăn chặn tội ác tiềm tàng này.

Kindaichi vừa chân ướt chân ráo đến nơi, thì trở thành nhân chứng bất đắc dĩ cho cái chết đầu tiên liên quan đến gia đình phú quý nọ.

Vừa phẫn nộ vừa tự ái, anh bèn nán lại suốt mấy tháng liền để làm rõ vụ án, dù không ai mời và cũng không có thân chủ nào thanh toán chi phí. Kết quả là, anh lại đều đặn chứng kiến những cái chết như bị nguyền rủa của gia đình nọ…

Rìu, đàn, cúccho thấy một Yokomizo Seishi tiên phong trong thể loại trinh thám Nhật Bản hiện đại. Truyện chứa đựng tất cả các yếu tố rồi đây sẽ trở thành mô thức của tiểu thuyết tội phạm phá án từ thập niên 1940 trở đi: diễn biến rắc rối nhưng gợi ý rất rõ ràng, cách thức giết người quái đản, bí mật gia đình, những bản tính bị che đậy, một viên thám tử lập dị với phương pháp kì khôi, và đội ngũ cảnh sát làm việc năng nổ đúng chức trách nhưng rất dễ lạc hướng vì hỏa mù…

Rìu, đàn, cúc nằm trong series truyện trinh thám về thám tử Kindaichi Kosuke, do Yokomizo Seishi sáng tác vào cuối thập niên 1940 và được xuất bản lần đầu vào đầu thập niên 1950.  Nhân vật thám tử này, ngày nay đã trở thành một biểu tượng của văn hóa đại chúng Nhật Bản, xuất hiện trong rất nhiều tác phẩm điện ảnh, truyền hình, graphic novel…

Rìu, đàn, cúc cũng đã bước lên màn bạc hai lần, vào các năm 1976 và 2006.  ', CAST(N'2018-10-10' AS Date), 1, N'riu_dan_cuc_-_b_a_1.jpg', 312)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (13, N'Bố Già (Đông A)', 1, 2, 5, NULL, 6, 75900, N'Bố Già (Đông A)', CAST(N'2018-10-10' AS Date), 1, N'image_116793.jpg', 543)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (14, N'Án Mạng Trong Buổi Tiệc Hallowe’en', 1, 3, 7, NULL, 2, 93750, N'Trong lúc mọi người chuẩn bị buổi tiệc Hallowe''en dành cho những đứa trẻ từ 11-17 tuổi trong vùng tại Biệt thự Vườn Táo của bà Rowena Drake - một phụ nữ vừa giàu có vừa thích những hoạt động cộng đồng, có tài tổ chức và thích chỉ huy người khác - thì cô bé Joyce 13 tuổi huênh hoang rằng mình từng chứng kiến một vụ giết người. Chẳng ai tin vì cô bé Joyce này nổi tiếng "nổ" và dựng chuyện. Tuy nhiên, sau khi buổi tiệc diễn ra vui vẻ và thành công, người ta phát hiện Joyce chết dìm đầu vào một xô nước. Hercule Poirot được mời tới truy tìm hung thủ. Với lập luận phá án: có phải đúng vì Joyce từng chứng kiến và kẻ giết người có mặt trong số khách khứa nghe được nên ra tay giết cô bé diệt khẩu không? Thế thì chắc chắn trước đó phải có án mạng từng xảy ra trong vùng. Poirot lần lại quá khứ, hóa ra một cộng đồng vùng quê nhỏ những tưởng là yên bình như thế lại từng có rất nhiều vụ giết người, mất tích, âm mưu chiếm đoạt thừa kế... đều chưa tìm ra thủ phạm. 

Ngay khi vị thám tử tài ba bắt đầu lóe ra tia sáng đầu tiên về [những] kẻ đứng đằng sau tất cả vụ việc thì cũng là lúc nạn nhân mục tiêu thực sự - một đứa trẻ khác nữa - rơi vào tầm ngắm của kẻ giết người. Poirot có cứu được đứa trẻ này không, hay phải mất thêm một mạng sống nữa mới đưa được thủ phạm ra ánh sáng?

Trong một cái kết thực sự hấp dẫn và bất ngờ, không chỉ sát nhân bị lật mặt mà những tội ác từng xảy ra trở nên liền lạc do một dã tâm phi nhân tính.', CAST(N'2018-10-10' AS Date), 1, N'untitled_3_10.png', 5126)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (15, N'Mười Người Da Đen Nhỏ - Agatha Christie', 1, 1, 5, NULL, 8, 67150, N'Mười Người Da Đen Nhỏ - Agatha Christie

Mười người phát hiện rằng mình đã bị lừa ra đảo để "trả giá" cho "tội ác" đã gây ra, họ ứng với 10 bức tượng nhỏ đặt trên bàn ở phòng khách. Những ngày sau đó từng người lần lượt thiệt mạng tương tự cái cách bài đồng dao trong phòng mỗi người đã mô tả. Kỳ lạ hơn là sau khi một người qua đời, số tượng trong phòng khách bằng cách nào đó đều giảm đi một.

Người đầu tiên thiệt mạng là Anthony Marston, anh ta chết vì ngộ độc với triệu chứng tương tự người bị nghẹn. Sau Marston là Ethel Rogers, bà quản gia chết được chồng phát hiện đã chết vì dùng thuốc ngủ quá liều. Vị tướng Macarthur dường như linh cảm được cái chết sẽ đến nên đã bỏ ăn mà ngồi nhìn ra biển và lảm nhảm một mình, bác sĩ Armstrong sau đó phát hiện ông đã chết vì bị một vật cứng đập vào sau đầu.

Người thứ tư thiệt mạng là Thomas Rogers, trong lúc bổ củi chuẩn bị cho bữa sáng, dường như Thomas đã để trượt tay và làm lưỡi búa bay thẳng vào đầu. Là người luôn tin rằng mình không làm gì trái với Đức tin, rằng những người khác chết là do bị Chúa trừng phạt, tuy nhiên Emily Brent cũng không thể sống sót, bà bị tiêm thuốc độc vào cổ sau bữa ăn trưa, vết tiêm trên cổ bà tương tự như vết ong đốt.

Buổi tối hôm đó đến lượt quan tòa Wargrave được bác sĩ Armstrong phát hiện đã thiệt mạng vì bị bắn vào đầu trong khi đang đội bộ tóc giả của quan tòa. Bản thân bác sĩ vào ngày hôm sau cũng được những người còn lại phát hiện đã chết đuối ở vách đá. Blore là người thứ tám thiệt mạng trên đảo, viên thám tử tư bị bức tượng trong phòng cô Vera Claythorne rơi trúng đầu trong lúc hai người còn lại đang ở ngoài bờ biển bên xác bác sĩ Armstrong.

Rơi vào trạng thái hoảng loạn, Claythorne lừa cướp được súng của Lombard và giết chết tay cựu lính đánh thuê. Cuối cùng cô trở lại phòng và treo cổ tự tử với chiếc ghế và dây thòng lọng do một ai đó đã bày sẵn…

Đây là một vụ án mà không hề có sự hiện diện hay dấu vết của thủ phạm.', CAST(N'2018-10-10' AS Date), 3, N'8934974144519-2.jpg', 123)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (17, N'Nguồn Cội', 4, 2, 9, 1, 7, 2342, N'Robert Langdon, giáo sư biểu tượng và biểu tượng tôn giáo đến từ trường đại học Harvard, đã tới Bảo tàng Guggenheim Bilbao để tham dự một sự kiện quan trọng - công bố một phát hiện "sẽ thay đổi bộ mặt khoa học mãi mãi".

Edmond Kirsch là một tỷ phú bốn mươi tuổi, một nhà tiên tri. Những phát minh kỹ thuật cao và những dự đoán táo bạo đã làm cho anh trở thành một nhân vật nổi tiếng toàn cầu. Kirsch - cũng chính là một trong những sinh viên đầu tiên của Langdon tại đại học Harvard cách đây hai thập kỷ - sẽ tiết lộ một bước đột phá đáng kinh ngạc...

Nó sẽ trả lời hai câu hỏi cơ bản về sự tồn tại của con người:
"Chúng ta đến từ đâu?" và "Chúng ta đang đi về đâu?"

Khi sự kiện bắt đầu, Langdon và vài trăm quan khách bị cuốn hút bởi một bài thuyết trình độc đáo mà chính Langdon cũng nhận thấy rằng sẽ gây ra nhiều tranh cãi hơn những gì ông tưởng tượng. Nhưng sự kiện này đột nhiên biến thành cuộc hỗn loạn, và khám phá quý giá của Kirsch đang dần biến mất vĩnh viễn. Trước nguy cơ phải đối mặt với một mối đe doạ sắp xảy ra, Langdon bị buộc phải bỏ trốn để thoát khỏi Bilbao cùng Ambra Vidal - Hoàng hậu tương lai của Tây Ban Nha để tìm ra mật khẩu bí ẩn sẽ mở ra bí mật của Kirsch.

Để chiến thắng những bí mật được giấu kín của lịch sử và tôn giáo cực đoan, Langdon và Ambra phải trốn tránh một thế lực với sức mạnh dường như xuất phát từ chính Hoàng gia Tây Ban Nha... và đang cố tìm cách để giữ Edmond Kirsch im lặng. Trên một hành trình được đánh dấu bởi các tác phẩm nghệ thuật hiện đại và các ký hiệu bí ẩn, Langdon và Vidal đã tìm ra những manh mối cuối cùng đưa họ đối mặt với khám phá gây sốc của Kirsch... và sự thật mà từ lâu chúng ta đã tìm kiếm.', CAST(N'2018-11-26' AS Date), 3, N'nguoncoi.jpg', 435)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (18, N'Nguồn Cội', 4, 2, 5, 2, 4, 2342, N'Robert Langdon, giáo sư biểu tượng và biểu tượng tôn giáo đến từ trường đại học Harvard, đã tới Bảo tàng Guggenheim Bilbao để tham dự một sự kiện quan trọng - công bố một phát hiện "sẽ thay đổi bộ mặt khoa học mãi mãi".

Edmond Kirsch là một tỷ phú bốn mươi tuổi, một nhà tiên tri. Những phát minh kỹ thuật cao và những dự đoán táo bạo đã làm cho anh trở thành một nhân vật nổi tiếng toàn cầu. Kirsch - cũng chính là một trong những sinh viên đầu tiên của Langdon tại đại học Harvard cách đây hai thập kỷ - sẽ tiết lộ một bước đột phá đáng kinh ngạc...

Nó sẽ trả lời hai câu hỏi cơ bản về sự tồn tại của con người:
"Chúng ta đến từ đâu?" và "Chúng ta đang đi về đâu?"

Khi sự kiện bắt đầu, Langdon và vài trăm quan khách bị cuốn hút bởi một bài thuyết trình độc đáo mà chính Langdon cũng nhận thấy rằng sẽ gây ra nhiều tranh cãi hơn những gì ông tưởng tượng. Nhưng sự kiện này đột nhiên biến thành cuộc hỗn loạn, và khám phá quý giá của Kirsch đang dần biến mất vĩnh viễn. Trước nguy cơ phải đối mặt với một mối đe doạ sắp xảy ra, Langdon bị buộc phải bỏ trốn để thoát khỏi Bilbao cùng Ambra Vidal - Hoàng hậu tương lai của Tây Ban Nha để tìm ra mật khẩu bí ẩn sẽ mở ra bí mật của Kirsch.

Để chiến thắng những bí mật được giấu kín của lịch sử và tôn giáo cực đoan, Langdon và Ambra phải trốn tránh một thế lực với sức mạnh dường như xuất phát từ chính Hoàng gia Tây Ban Nha... và đang cố tìm cách để giữ Edmond Kirsch im lặng. Trên một hành trình được đánh dấu bởi các tác phẩm nghệ thuật hiện đại và các ký hiệu bí ẩn, Langdon và Vidal đã tìm ra những manh mối cuối cùng đưa họ đối mặt với khám phá gây sốc của Kirsch... và sự thật mà từ lâu chúng ta đã tìm kiếm.', CAST(N'2018-11-26' AS Date), 1, N'nguoncoi.jpg', 683)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (28, N'Lá Nằm Trong Lá', 4, 1, 10, NULL, 1, 63200, N'Lá Nằm Trong Lá

Mở cuốn sách mới của tác giả Nguyễn Nhật Ánh, bạn sẽ gặp những cái tên quen thuộc của những người nổi tiếng ngay trang 5 trang trọng đề tặng “các bạn văn hữu”: nhà thơ Bùi Chí Vinh, Phạm Sỹ Sáu, Lê Minh Quốc, nhà văn Nguyễn Đông Thức, nhà phê bình Huỳnh Như Phương, nhà báo Nguyễn Công Khế, Kim Hạnh, … Tuổi niên thiếu của “những thằng quỷ nhỏ” trong truyện có gắn gì với họ không, có phải là họ không, chỉ họ và tác giả mới biết, nhưng bạn đọc thì có thể tưởng tượng ra một nhóm “thằng” thân thiết, bắt đầu lớn, biết thinh thích con gái và ngập mộng văn chương.

Chuyện của bút nhóm học trò, truyện nằm trong truyện, những cơn giận dỗi ghen tuông bạn gái bạn trai với nhau, nhiều nhất vẫn là chuyện nhà trường có các cô giáo hơn trò vài tuổi coi trò như bạn, có thầy hiệu trưởng tâm lý và yêu thương học trò coi trò như con…Trở lại với đề tài học trò, hóm hỉnh và gần gũi như chính các em, Nguyễn Nhật Ánh chắc chắn sẽ được các bạn trẻ vui mừng đón nhận. Cứ lật đằng cuối sách, đọc bài thơ tình trong veo là có thể thấy điều đó “…Khi mùa xuân đến / Tình anh lại đầy / Lá nằm trong lá / Tay nằm trong tay”.

“Viết cho trẻ con giờ khó hơn xưa. Có hàng bao nhiêu là món giải trí rầm rộ, hoành tráng và lộng lẫy dọn sẵn, muốn thu phục “lũ tiểu yêu” thế kỷ 21 này, nhà văn không chỉ thông thuộc mặt bằng hiểu biết của chúng, mà còn phải tâm tình được với chúng bằng tốc độ của chúng. Có thể nói Nguyễn Nhật Ánh là một người lớn chấp nhận tham dự món du hành tốc độ cao cùng lũ trẻ. Thời thong thả đạp xe, từ tốn khuyên bảo đã qua rồi. Thực ra Nguyễn Nhật Ánh đã biết đi tàu tốc hành từ hai thập niên trước, khi nhữngKính vạn hoa, Thằng quỷ nhỏ, Bàn có năm chỗ ngồi… đem lại cho văn học thiếu nhi một diện mạo mới mẻ, những câu chuyện tưởng như ấm ớ ngày này qua tháng khác nhưng sao hôm nay nhìn lại, những người đã từng là trẻ con thấy nhớ quá..” (VIỆT TRUNG, báo Thanh Niên).

“Bước vào khoảng trời của tuổi biết buồn, Nguyễn Nhật Ánh đã ghi lại những bâng khuâng rung cảm đầu đời. Trong tâm tưởng của các em, bây giờ không chỉ nghĩ về cái gì mà còn nghĩ về ai, về một người khác giới cụ thể nào, và về cả bản thân, thế giới ấy tràn ngập những câu hỏi xôn xao về cái-gọi-là-tình-yêu. Truyện của Nguyễn Nhật Ánh đã đưa vào những câu hỏi lớn, muôn thuở, quen thuộc - những câu hỏi mà dường như trong đời ai cũng từng đối diện ít nhất một lần. Vì thế, trong khi độc giả thiếu niên phục lăn vì nhà văn đi guốc vào bụng họ, thì độc giả người lớn mỉm cười mơ màng nhớ lại một thời thơ dại...'' (TS. NGUYỄN THỊ THANH XUÂN, nhà nghiên cứu văn học).', CAST(N'2018-11-28' AS Date), 1, N'LaNamTrongLa1.jpg', 345)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (33, N'Mãi Mãi Là Bao Xa (Tái Bản 2018 Đủ Ngoại Truyện)', 4, 1, 9, NULL, 0, 63000, N'Bạch Lăng Lăng, nữ sinh khoa Điện khí, trẻ trung, xinh đẹp và rất tự hào khi quen được một người bạn lý tưởng qua mạng, chàng du học sinh của một trường nổi tiếng của Mỹ, người mang biệt danh “nhà khoa học”: Mãi Mãi Là Bao Xa. Qua những cuộc chuyện trò trên QQ, Lăng Lăng đã gắn bó với chàng trai đó lúc nào cô cũng không hay, cảm xúc lớn dần, sự chia sẻ lớn dần và đến một ngày cô phát hiện ra mình đã yêu người con trai “tài giỏi” và không một chút khuyết điểm ấy. Nhưng sự tỉnh táo giúp cô ý thức được rằng, thế giới mạng chỉ là ảo, họ ở cách nhau cả một đại dương mênh mông, anh lại quá xuất sắc và ưu tú, mối quan hệ của họ sẽ không có kết quả gì. Nhất là khi anh thông báo, nếu anh tiếp tục sự nghiệp nghiên cứu lần này, rất có thể anh phải định cư bên Mỹ, mãi mãi không trở về. Khi nghe tin đó, cô đã gục xuống trước màn hình máy tính và khóc. Tất cả như sụp đổ, tia hy vọng cuối cùng dập tắt, anh sẽ không về nước nữa, khoảng cách giữa họ là mãi mãi… Cô cay đắng nói với anh lời từ biệt và đưa nick của anh vào danh sách đen, không bao giờ xuất hiện khi cô đăng nhập QQ nữa…

Một năm trôi qua, Lăng Lăng tưởng đã quên đi “nhà khoa học” ở bên kia thế giới của mình, bên cô đã có Uông Đào, bạn trai, người mang lại cho cô cảm giác an toàn, người cô muốn lấy làm chồng dù cảm xúc dành cho anh chưa hẳn là tình yêu. Cô bảo vệ đề án tốt nghiệp, Uông Đào luôn quấn quýt bên cô… Và điều bất ngờ trong buổi bảo vệ đề án, Dương Lam Hàng, một giảng viên trẻ vừa trở về từ MIT, trường đại học danh tiếng của Mỹ, xuất thân từ một gia đình danh giá, đã tới tham dự buổi bảo vệ của cô và đưa ra những câu hỏi phản biện thật “khó chịu”. Với cô, Tất cả các nữ sinh trong trường đều ngưỡng mỗ và ao ước được trở thành bóng hồng trong trái tim của Dương Lam Hàng, nhưng với cô, đó đúng là ông thầy “biến thái”. Sự trớ trêu của số phận đun đẩy khiến cô ngày càng tiếp xúc với anh nhiều hơn, và chính anh là người gợi ý và nâng đỡ cho cô học tiếp thạc sĩ để có cơ hội ở lại trường.

Trở thành học viên của khoa Vật liệu, bao thách thức và khó khăn chờ đón cô, dưới sự dìu dắt và yêu cầu quá cao của thầy hướng dẫn, cô dần dần làm quen với công việc… Những buổi thảo luận, những lần thí nghiệm, những sự giúp đỡ, những lời quan tâm chân thành, và cộng thêm vẻ ngoài lạnh lùng, điễm tĩnh, rất đẹp của Dương Lam Hàng, trái tim Lăng Lăng cũng xao động. Một bên là người gần gũi với cô hằng ngày, chăm lo cho cô, nâng đỡ cô từng chút một, một bên là chàng trai ở mãi tận nơi xa, chưa một lần gặp mặt. Lăng Lăng giằng xé và không biết trái tim mình nghiêng về bên nào nhiều hơn. Đến khi cảm xúc vỡ òa, cô quyết định dừng học bởi không muốn gặp người thầy đã chiếm giữ vị trí trong trái tim cô, cô muốn chung thủy với tình cảm cho chàng trai Mãi Mãi Là Bao Xa, người chia sẻ và dành cho cô tình cảm chân thành, thì cũng là lúc cô phát hiện ra hình như Dương Lam Hàng và người cô yêu có thật nhiều điểm tương đồng. Mãi Mãi Là Bao Xa nói anh đã về nước và sẽ đến gặp cô… Vậy người thầy bên cô bấy lâu nay là ai?

Sự thật hé lộ. Người trong trái tim cô chỉ có một. Ngỡ ngàng, bàng hoàng rồi xúc động, cô không thể tin vào điều đang diễn ra trước mắt.

Liệu cô và Lam Hàng có thể tiếp tục chuyện tình cảm của mình, khi trong con mắt của mọi người họ là thầy - trò? Liệu họ có đủ dũng cảm để vượt qua những quy định khắt khe của nhà trường và những lời dị nghị của xã hội? Liệu Lăng Lăng có chịu chấp nhận hy sinh hạnh phúc, tình cảm của mình vì tiền đồ của Lam Hàng? Liệu Lam Hàng có thể từ bỏ tất cả, sự đam mê nghiên cứu, thân phận, địa vị của mình để giữ lấy tình yêu duy nhất trong trái tim anh? Liệu họ có thể một lần nữa vượt qua khoảng cách thời gian và không gian để trả lời cho câu hỏi: Mãi mãi là bao xa?', CAST(N'2018-11-29' AS Date), 1, N'bia_mai_mai_la_bao_xa_tb_5-2018_master.jpg', 654)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (36, N'Tiếng Thời Gian Du Dương', 4, 1, 9, NULL, 0, 49050, N'Thẩm An Bình có cảm tình với Cố Bình An, nhưng Cố Bình An lúc nào cũng cự tuyệt tình cảm ấy. Khi Thẩm An Bình du học ở nước ngoài, vì quá nhớ nhung Cố Bình An nên đã đáp máy bay trở về gặp cô, không ngờ vừa đúng lúc chứng kiến cảnh thân mật giữa Tất Nhiễm và Cố Bình An trong vườn trường. Thẩm An Bình đau khổ buồn bã, uống một trận thật say rồi quyết định buông xõa, còn Cố Bình An thì không hề biết gì.

Liệu, tình yêu lặng lẽ chưa kịp nói của Thẩm An Bình có ngày nảy mầm? Liệu, có lúc nào đó Cố Bình An tình cờ nhận ra? Liệu, trên con đường này, họ có mỗi người một phương?

Nếu như gió ngừng đưa tiếng hát du dương, chỉ còn lưu lại dư vị nhàn nhạt, hồi ức đau buồn có phải cũng theo gió tĩnh lặng mà dừng lại? Nếu như hồi ức không lan theo thủy triều, chỉ để lại sự khô cạn, sự lưu luyến trong đáy lòng có phải cũng theo ký ức khô kiệt mà tiêu tan mãi mãi?', CAST(N'2018-11-29' AS Date), 3, N'tieng-thoi-gian-du-duong-bia.jpg', 626)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (37, N'Hồ Đồ', 4, 1, 3, NULL, 0, 56700, N'Trên thế giới này, có một loại đàn ông mà nước mắt của cô có rơi bao nhiêu thì cũng không làm rung động được trái tim anh ta, dù cô có là một mỹ nhân khóc đến đổ cả Trường Thành đi chăng nữa thì anh ta cũng chẳng mảy may động lòng. Anh ta rời xa cô, chẳng có lí do gì, nếu cô hỏi anh ta, anh ta sẽ trả lời một cách vô cảm: “Cô muốn một lí do à, vậy thì tôi sẽ cho cô một lí do.”
Người ngoài nhíu mày khuyên bảo cô, đừng có ngốc nghếch nữa.

Không, cô không ngốc, chỉ là cô quá yêu anh ta thôi.

Cô đặt tay lên ngực tự hỏi: “Là anh ta sai sao?”

Không, anh ta không sai, chỉ là anh ta không yêu cô.

Yêu Lục Ứng Khâm, Trình Đoan Ngọ chỉ học được năm chữ: Đối diện với hiện thực.

Tình yêu đối với cô chỉ là sự hồ đồ, còn anh ta thì không thể hồ đồ.', CAST(N'2018-11-29' AS Date), 1, N'ho-do.jpg', 345)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (38, N'Yêu Như Một Cái Cây', 4, 1, 9, NULL, 0, 51120, N'Tôi là kẻ ngoại đạo với văn chương nhưng may mắn là người trong cuộc của một (vài) chuyện tình trên thế giới này.

Tôi từng yêu và chia tay một người, hẹn hò với một người sau đó. Thật tệ khi nhận ra mình đang duy trì một mối quan hệ na ná tình yêu nhưng hoàn toàn không phải. Tất cả chỉ để chạy trốn cảm giác cô đơn và thoát khỏi nỗi sợ hãi bị bỏ lại một mình.

Tôi bắt đầu viết “Yêu như một cái Cây” chừng hai năm trước, khi người yêu đầu tiên chọn cách rời xa tôi bằng một lý do tới giờ không sao nhớ nổi. Trong suốt nhiều tháng trời, tôi rơi vào khủng hoảng của những hồi ức cũ, của những tưởng tượng nếu giờ chúng ta còn yêu nhau thì sẽ thế nào. Một người mới bước tới, chìa tay cho tôi nắm lấy, dắt tôi đi qua vực sâu thăm thẳm của nỗi buồn. Chúng tôi hẹn hò, người ta yêu tôi nhưng không thể chắc chắn về điều ngược lại. Một ngày nào đó chưa xa, người ta hỏi “Có biết người ta yêu em nhiều lắm không mà cứ buồn hoài chuyện cũ?”

Sau đó, chúng tôi chia tay. Tôi biết điều này thật ngớ ngẩn, thực sự ngớ ngẩn khi nuối tiếc một người cũ bội bạc và bỏ qua một người yêu mình bằng cả trái tim. Song đôi khi, bạn chỉ có thể nhìn thấu mọi chuyện khi tất cả đã đi qua, để ngồi bình tâm bên tách trà chiều và vỡ lẽ người ta rời xa không phải bởi hết yêu, mà bởi người ta muốn bạn học cách thương yêu chính mình. Một người nào đó bước ra khỏi cuộc sống của bạn không có nghĩa bạn là người có lỗi và phải chịu đựng sự giày vò. Mỗi người chúng ta đều sở hữu quyền được yêu thương. Nhưng quyền lợi luôn đi kèm nghĩa vụ, bạn đã thực hiện nghĩa vụ thương yêu bản thân mình?

Tôi đã viết “Yêu như một cái Cây” trong suốt những tháng ngày như thế. Như một cách lặng lẽ ghi lại một phần chuyện tình yêu của đời mình, của những người xa lạ đi ngang cuộc đời tôi. Cho đến một ngày, tôi nhận ra mình đã không còn luyến lưu chuyện cũ, nhận ra mình đã để chữ “Tôi” bắt đầu mỗi câu viết thay vì “người cũ” như trước đây.

Tình yêu vốn dĩ là một điều kì diệu, chỉ cần bạn biết thương yêu chính mình, hạnh phúc ắt sẽ mỉm cười và bước về phía bạn. Cuốn sách này được thực hiện với tất cả niềm tin yêu như thế, để cầu chúc mọi điều tốt đẹp nhất sẽ đến với tất cả các bạn, những người yêu nhau trên thế giới này.', CAST(N'2018-11-29' AS Date), 1, N'yeu-nhu-mot-cai-cay-b.jpg', 623)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (39, N'Cuộc Sống Có Gì Năm Bạn 24 Tuổi?', 4, 1, 11, NULL, -3, 44400, N'Cuộc Sống Có Gì Năm Bạn 24 Tuổi?

Lúc bạn lênh đênh trên dòng đời, những người đồng trang lứa đều đã tiến thân, lương nhiều con số. Bạn trở về. Như một người đi sau. Nhưng một người bị bỏ lại. Nhưng bạn hài lòng. Vì những trải nghiệm đó chưa bao giờ ngưng khiến bạn tự hào về bản thân, cho dù là hôm nay, ngày mai hay nhiều ngày sau nữa.

Rất nhiều cánh cửa đã đóng lại. Nhưng cũng có rất nhiều cánh cửa khác mở ra. Bạn còn trẻ. Đó là một đặc ân. Nhưng chớ cho rằng mọi đIều tốt đẹp đều ngẫu nhiên xảy đến. Bạn nghĩ thế khi bắt đầu gõ những dòng đầu tiên trong cuốn sách này.', CAST(N'2018-11-29' AS Date), 1, N'8935212330411.jpg', 659)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (40, N'Nước Nhật Nhìn Từ Những Thứ Bình Thường', 4, 1, 9, NULL, 0, 58460, N'25 câu chuyện nhỏ, những câu chuyện bình thường về nước Nhật (như: chuyện về một nông gia, chuyện người Nhật “tốt” hay “không tốt”, nghệ sĩ Nhật trở thành nghị sĩ, lễ khai giảng ở một trường mầm non, thảm họa động đất Đông Nhật Bản,…) nhưng giúp ta hiểu thêm, những điều lớn lao, những điều kỳ diệu mà người ta vẫn ngợi ca về con người Nhật, đất nước Nhật chính là bắt nguồn từ những điều rất đỗi bình thường đó. Từ chính trải nghiệm của mình, tác giả đã dẫn dắt độc giả qua những câu chuyện hấp dẫn bằng giọng kể hiện đại, sinh động.

“Bây giờ, trong cuộc sống đầy những âu lo, chúng ta thường hay mơ bản thân hay con cái sẽ thành thiên tài, triệu phú hay siêu sao nổi tiếng. Chúng ta cũng hay mơ người nước mình sẽ giật giải Nobel hay xuất hiện nhưng vị anh hùng cứu nhân độ thế. Mơ ước cháy bỏng là như thế nhưng dường như chúng ta vẫn chưa đủ dũng cảm và nhận thức để biết sống và dám sống như một người bình thường. Nói cách khác, chúng ta đang thiếu những người bình thường làm được những điều bình thường…

Có lẽ biết sống như một người bình thường và làm được những điều bình thường đang là thử thách lớn nhất đối với chúng ta. Nếu chưa tin, bạn hãy thử sống như thế sẽ rõ.”', CAST(N'2018-11-29' AS Date), 1, N'8936117740695.jpg', 234)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (41, N'Môn Sử Không Chán Như Em Tưởng', 4, 1, 4, NULL, 0, 61620, N'Môn Sử Không Chán Như Em Tưởng là tập hợp những bài viết của học sinh trong giờ kiểm tra 45 phút hoặc bài tập về nhà, được tác giả khẳng định không phải là các bài ''Sử mẫu''. ''Tôi tôn trọng và mong muốn sự đa dạng trong nhận thức lịch sử của học sinh....Tôi tin rằng khi đọc những bài viết này, các bạn sẽ đi từ ngạc nhiên này tới ngạc nhiên khác. Với riêng tôi, mỗi bài viết của học sinh đều đem lại cho tôi động lực và gợi ra nhiều suy ngẫm về nghề nghiệp'', tác giả Nguyễn Quốc Vương chia sẻ.

“Giữa chán học môn Sử trong trường và quan tâm tới lịch sử, có ýthức lịch sử mạnh mẽ hay không lại là chuyện khác…Trong côngcuộc tái khai sáng quốc dân mà các trí thức đầu thế kỉ XX đang tiếnhành dang dở thì những thanh niên thuộc làu lịch sử học trong nhàtrường và tin rằng đó là chân lý bất biến lại có nguy cơ trở thànhnhững hòn đá cản đường.”', CAST(N'2018-11-29' AS Date), 3, N'9786045640456.jpg', 435)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (42, N'Vừa Đủ - Đẳng Cấp Sống Của Người Thụy Điển', 4, 1, 9, NULL, 0, 66000, N'"Không quá ít, không quá nhiều, chỉ vừa đủ" là cốt lõi của phong cách sống Lagom, nhưng biết như thế nào là đủ thì còn phụ thuộc vào giới hạn của mỗi người. Người Thụy Điển dùng Lagom như kim chỉ nam cho cả dân tộc, hình thành nên phong cách sống, ứng xử giao tiếp và thậm chí cả ẩm thực của riêng mình.

 Là một phần lãnh thổ của Bắc Âu, xứ sở nổi tiếng với phong cách sống tối giản, Thụy Điển tự xây dựng cho mình một phong cách sống hoàn toàn khác, mang tên Lagom. Với tài sản văn hóa riêng này, người dân Thụy Điển luôn biết vừa lòng với những gì mình đang có và gần như không bao giờ so sánh với cuộc sống của người khác.

“Lagom” là một tính từ dùng để chỉ sự vừa phải, không quá nhiều mà cũng chẳng quá ít. Thật khó để có thể chuyển tải hết ý nghĩa của từ lagom sang bất kỳ thứ tiếng nào khác. Người Thụy Điển dùng Lagom như “kim chỉ nam” chung cho cả dân tộc, hình thành nên phong cách sống, ứng xử, giao tiếp, và thậm chí cả ẩm thực của riêng mình. Lagom là vừa đủ, là thích hợp, là cân bằng nhưng không nhất thiết phải là hoàn hảo nhất. Như một giai thoại từ thế kỷ trước, nhiều người tin rằng từ này bắt nguồn từ thuật ngữ "laget om" của người Viking - nghĩa là "chuyền quanh trong nhóm” xuất phát từ thói quen những người Viking. Vào thời đó, khi tất cả cùng ngồi quanh chiếc bàn và chuyền tay nhau những chiếc sừng đựng đầy rượu, mỗi người nhấp một ngụm vừa phải, làm sao để những người sau đó cũng có đủ rượu để thưởng thức.

Trong một xã hội mà con người có thể tiếp cận với bất cứ thứ gì, vào bất cứ lúc nào thì Lagom giống như một cơn gió lạ. Sự hài lòng trong phong cách sống của người Thụy Điển không phải là vì họ có tất cả mọi thứ, mà đơn giản đó là một trạng thái thỏa mãn với những gì mình đang có. Lagom chính là việc thoát ra khỏi những bộn bề và cân đo đong đếm một cách thái quá.

Tinh thần Lagom thể hiện ở mọi mặt của cuộc sống Thụy Điển, từ việc chỉ nói ngắn gọn vừa đủ không khoa trương, ở trong những ngôi nhà đơn giản ít đồ đạc và thoáng đãng, ăn những đồ ăn không quá cầu kỳ, thậm chí đến vui chơi cũng không quá ồn ào, náo nhiệt… Tất cả những điều đó đã tạo nên một phong cách sống tối giản nhưng mang lại sự bình an trong tâm hồn và hài hòa trong cuộc sống.

Mang tập sách đến bạn đọc Việt Nam, mong rằng chúng ta đón nhận Lagom với một tinh thần và lối sống mới, biết vừa đủ với tất cả để cuộc sống bớt lại những gánh nặng, bộn bề. Từ đó bạn sẽ tìm được những bài học và lời khuyên để bắt đầu một lối sống Lagom. Đó có thể là những bài học về sự tiết chế và cân bằng, tìm sự cân bằng trong cuộc sống thường nhật để chúng ta có thể tìm được niềm vui tốt đẹp hơn, để từ đó có được những lợi ích cả về thể chất lẫn tinh thần cho bản thân, cũng như để cộng đồng và môi trường của chúng ta được cân bằng hơn nhờ vào lối sống của chúng ta.

"Không quá ít, không quá nhiều, chỉ vừa đủ" nhưng biết như thế nào là đủ thì đó lại là giới hạn của mỗi người. Chỉ biết rằng, với người Thụy Điển, họ luôn biết cách làm hài lòng bản thân bằng những cột mốc riêng để làm sao vẫn đủ đầy cho bản thân nhưng không bị thái quá. Ít hơn, để có được nhiều hơn là vậy.

 Cùng nằm trong bộ sách về phong cách sống Bắc – Âu, ngoài cuốn Vừa đủ - Đẳng cấp sống của người Thụy Điển, sắp tới First News cho ra mắt bạn đọc hai cuốn: Vượt qua tất cả - Nghệ thuật sống của người Phần Lan và Hạnh phúc Từ những điều nhỏ bé - Nghệ thuật sống của người Đan Mạch. Mời bạn đón đọc.', CAST(N'2018-11-29' AS Date), 3, N'cover-lagom-b_a-1.jpg', 245)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (43, N'Lagom – Biết Đủ Mới Là Tự Do', 4, 1, 5, NULL, 0, 117660, N'Trong thế giới vội vã ngày nay, chẳng phải thật tuyệt vời hay sao khi bạn có thể sống chậm lại và tận hưởng một cuộc sống ít áp lực, ít căng thẳng và có thêm thời gian cho những điều bạn yêu?

Lagom – “Không quá nhiều, không quá ít, vừa đủ” – là triết lý của người Thụy Điển, tập trung tìm kiếm sự cân bằng trong mọi mặt của cuộc sống – từ công việc, nghỉ ngơi, gia đình, bạn bè và mọi thứ khác.

Lagom là vừa đủ, là cân bằng, là bình đẳng. Đó là một từ dễ nói nhưng khó xác định. “Biết đủ” là hành trình dài hiểu chính mình, hiểu giá trị cốt lõi của bản thân và hiểu vị trí của mình ở giữa môi trường xung quanh. Đó cũng không phải là một đích đến. Ngược lại, lagom là động lực để bạn sáng tạo, tìm thấy tự do và trân trọng những gì mình đang có. Chính điều đó đã tạo nên một Thụy Điển “rất lagom mà cũng nhiều sáng kiến” – một nghịch lý thú vị, nhưng không khó hiểu, của đất nước này.

Lagom – Biết đủ mới là Tự do là những đúc rút của Niki Brantmark qua 13 năm sống tại Thụy Điển và 6 tháng dành thời gian để umgås – gặp gỡ và fika – nhâm nhi cà phê, trò chuyện với những người bản xứ quanh những chủ đề liên quan đến lagom. Kể câu chuyện về lối sống Thụy Điển, Niki Brantmark đã đưa ra những gợi ý tinh tế và những thực hành đơn giản, giúp bạn thay đổi những thói quen trong cuộc sống. Từ đó, bạn sẽ có nhiều thời gian hơn cho những điều quan trọng và tìm thấy hạnh phúc!', CAST(N'2018-11-29' AS Date), 1, N'untitled_3_8.png', 123)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (44, N'Trên Đường Băng', 4, 1, 9, NULL, 0, 64000, N'TRÊN ĐƯỜNG BĂNG là cuốn sách tập hợp những bài viết truyền cảm hứng và hướng dẫn kỹ năng cho các bạn trẻ khi chuẩn bị bước vào đời.

Cuốn Trên Đường Băng được chia làm 3 phần: “Chuẩn bị hành trang”, “Trong phòng chờ sân bay” và “Lên máy bay”, tương ứng với những quá trình một bạn trẻ phải trải qua trước khi “cất cánh” trên đường băng cuộc đời, bay vào bầu trời cao rộng.

Xuất phát từ cái tâm trong sáng của người đi trước dày dặn kinh nghiệm, kiến thức, Tony Buổi Sáng mang đến đọc giả những bài viết hài ước, tinh tế, sinh động và đầy thiết thực. Cuốn Trên Đường Băng với những bài viết về thái độ với sự học và kiến thức nói chung, cách ứng phó với những trắc trở thử thách khi đi làm, cách sống hào sảng nghĩa tình văn minh… truyền cảm hứng cho các bạn trẻ sống hết mình, trọn vẹn từng phút giây và sẵn sàng cho hành trang cuộc sống.

Trên Đường Băng của Tony Buổi Sáng tuy hướng đến những đọc giả là những người trẻ nhưng những người lớn hơn vẫn để hiểu hơn, và có cách nhìn nhận cũng như giáo dục con em mình tốt nhất thay vì bảo vệ con quá kĩ trở nên yếu ớt và thiếu tự lập. Và để yêu thương “khoa học” nhất. Đây cũng là cuốn sách mà những người đi làm nên sở hữu để nhìn lại chặng đường mình đã đi qua, suy ngẫm và thay đổi vì chưa bao giờ là quá muộn.

Một cuốn sách với nhiều điều để bạn học hỏi, suy ngẫm và chuẩn bị tốt nhất cho hành trang trên con đường tuổi trẻ của chính mình.', CAST(N'2018-11-29' AS Date), 3, N'trenduongbang.jpg', 315)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (45, N'Những Bậc Thầy Ngụy Tạo', 4, 1, 5, NULL, 0, 53130, N'Có vẻ cuộc sống khắc nghiệt khiến con người cần những hình mẫu lý tưởng để hướng theo, những lời chỉ dạy để hoàn thiện bản thân. Thế giới đầy những người sẵn sàng chỉ dẫn bạn phải sống như thế nào, những cuốn sách self-help liên tục nằm trong top bán chạy nhất mọi thời đại. Thế nhưng, liệu cuộc sống của những người thích “giảng đạo” đó có như những lời nói hoa mỹ của họ. Nếu đúng vậy, hẳn chúng ta không phải chứng kiến quá nhiều vụ bê bối tài chính, chính trị, thể thao,… bị phanh phui trong thời đại này. Với giọng văn đầy hài hước và châm biếm, Zac Bissonnette trong Những bậc thầy ngụy tạo đã tập hợp vô số câu chuyện về những chuyên gia “nói một đằng, làm một nẻo” để chúng ta có thể thấy chiếc áo cà sa không làm nên thầy tu, những lời nói hoa mỹ không làm nên giá trị một con người.', CAST(N'2018-11-29' AS Date), 1, N'8935251400335.jpg', 543)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (46, N'Chicken Soup For The Soul - Tin Vào Ngày Mai', 4, 1, 9, NULL, 0, 36340, N'Những câu chuyện hay và ý nghĩa trong loạt truyện Chicken Soup đã thật sự làm rung động trái tim của hàng chục triệu độc giả trên khắp hành tinh khi được chuyển ngữ thành nhiều ngôn ngữ khác nhau. Nó đã thật sự làm cho thế giới này trở nên tươi đẹp và phát triển tích cực hơn với sự lan truyền cảm xúc từ người sang người.

Không đơn thuần chỉ là loạt sách Chicken Soup for the Soul, nó còn là cảm xúc và triết lý sống. Đó là sức mạnh đương đầu với nghịch cảnh. Là tình bạn trong những khoảnh khắc trống vắng. Là niềm hy vọng soi sáng những nỗi đau sâu thẳm. Là đem tình yêu đáp lại nỗi đau. Chicken Soup for the Soul chính là niềm tin rằng chúng ta đều là người tốt và rằng bằng cách thật sự lắng nghe người khác, chúng ta có thể chữa lành vết thương nội tại của chính mình, của cộng đồng và cả thế giới.

Mỗi câu chuyện đều mang một thông điệp, mỗi câu chuyện đều xuất phát từ một người giống như bạn, mỗi câu chuyện đều có thể thay đổi suy nghĩ, trái tim và cuộc đời của bạn. Mong rằng bạn sẽ dành ra chút thời gian nghĩ lại về những câu chuyện đã tác động tích cực đến bạn – dù bạn đọc trong sách của chúng tôi hay trong những cuốn sách khác, hay chính bạn gặp phải trong cuộc sống – và hồi tưởng lại cảm giác phấn khích tuyệt vời bạn đã có khi lần đầu tiên cảm nhận.

Những câu chuyện trong Chicken Soup for the Soul Stories for a Better World –Tin vào ngày mai truyền cảm hứng và chia sẻ niềm vui trong cuộc sống, về niềm tin vào những điều tốt đẹp, bất kể những khó khăn trước mắt. Theo đó, cách chúng ta chọn lựa thái độ sống, cách chúng ta hành động và điều ta mong đợi ở người khác sẽ dẫn dắt chúng ta hành xử một cách chân thành và đầy tình cảm.

Câu chuyện về “bình yên” được chứa trong chai ''joy'' với ước mơ nhỏ nhoi của cậu bé Jerrome mong rằng ''những người đang chiến đấu sẽ được bình yên'' khi cậu gói chai joy lại và định gởi tặng cho tổng thống Bush. Câu chuyện về một góa phụ luôn buồn bã, mất niềm tin vào cuộc sống từ khi chồng bà qua đời bỗng nhiên phát hiện ra nghị lực sống phi thường từ một người có hoàn cảnh như mình, ''chúng ta có thể mất đi thức ăn, sự tự do hoặc vật chất nhưng không thể mất đi tình yêu cuộc sống''. Câu chuyện về một cô giáo dạy tiếng Anh cho những học sinh đa chủng tộc (là những cụ già, những người lao động nhập cư nghèo khổ) đã rất hạnh phúc khi được họ tặng cho một chiếc áo khoác cực đẹp – vốn là mơ ước của cô… Và rất nhiều câu chuyện khác đã thật sự mang đến cho độc giả sự tin tưởng vào cuộc sống, vào điều kỳ diệu của tình yêu thương và sự chia sẻ.', CAST(N'2018-11-29' AS Date), 1, N'image_115773.jpg', 234)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (48, N'Chữa Lành Nỗi Đau', 4, 1, 7, NULL, 0, 34760, N'Cuộc sống hàng ngày đầy rẫy lo toan, tất bật luôn khiến cho bạn có cảm giác như mình đang đối đầu với nhiều áp lực cuộc sống. Những nỗi đau, mâu thuẫn trong các mối quan hệ bạn bè, công việc, tình cảm… luôn nảy sinh khiến cho bạn cảm thấy chán nản, mệt mỏi và không còn cảm nhận được ý nghĩa cuộc sống. Quá khứ, hiện tại và tương lai luôn diễn ra nối tiếp nhau không có một ranh giới rõ ràng nào. Trong phút giây này, chúng ta đang nghĩ gì, đang làm gì thì đó là hiện tại, nhưng chỉ ngay sau đó, nó đã là của phút giây trước, và chúng ta đã lại đi trên những ý nghĩ mới của tương lai.

Thời gian bất tận, thế giới vô cùng, nhưng suy nghĩ của chúng ta còn rộng lớn và mạnh mẽ hơn nhiều. Chúng ta có thể kiến tạo ra cuộc sống theo ý mình vì chúng ta sinh ra để trao quyền làm việc đó. Mỗi người chúng ta là một ông hoàng, bà chúa cai quản các bộ phận của thể xác, hướng dẫn các hoạt động tinh thần, làm cho đời sống của mình thịnh vượng hơn lên. Nhưng nhiều người đã không ý thức được điều đó và đang phải chịu đựng một cuộc sống với buồn đau, bất hạnh và những vết thương không thể nào cứu chữa được.

Nếu bạn vẫn còn băn khoăn chưa biết nên bắt đầu từ đâu và nên sử dụng phương pháp nào tốt nhất để vực dậy chính mình, thì hãy thử đọc quyển sách này. Tạo hóa đã ban tặng cho bạn cuộc sống với những món quà vô giá mà bạn chưa nhận thấy được thì chúng tôi trao tặng bạn niềm tin để sẵn sàng đón nhận chúng.

Chữa Lành Nỗi Đau sẽ giúp bạn khơi dậy những năng lực thực sự đang tiềm ẩn bên trong mình. Sức mạnh đó sẽ tác động không chỉ đến suy nghĩ và cuộc sống của riêng bạn mà còn ảnh hưởng trực tiếp đến những người mà bạn tiếp xúc hàng ngày. Có thể trước đây bạn chưa nhận ra nhưng thật sự là bạn đang sỡ hữu một tinh thần mạnh mẽ, lạc quan đang cần được khám phá.

Quá khứ và tương lai sẽ không còn là điều xa vời hay xưa cũ đến nỗi khó nắm bắt như bạn vẫn thường nghĩ. Mỗi phút giây trong hiện tại này đã chứa đựng đầy đủ những gì bạn đang tìm kiếm để trả lời những câu hỏi của riêng mình. Chữa Lành Nỗi Đau không những có thể giúp bạn thoát khỏi những ám ảnh tiêu cực lâu nay trong cuộc sống, mà quyển sách này còn giúp bạn biết cách yêu thương chính mình để gieo những hạt giống hy vọng cho tương lai.

Hãy sống cuộc đời đích thực của chính mình, trở thành con người mà bạn mong muốn, vươn đến những ước mơ vẫn hằng ấp ủ và hướng tới những điều tốt đẹp trong mối quan hệ với người xung quanh; khi đó bạn sẽ truyền nguồn cảm hướng cho rất nhiều người khác.', CAST(N'2018-11-29' AS Date), 3, N'image_81.png', 34)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (49, N'Cất Tiếng Làm Điếng Thế Gian', 4, 1, 9, NULL, 0, 73260, N'“Sau trận Đại Hồng Thủy nổi tiếng, con người đã cố xây dựng Tháp Babel để vươn tới Thượng Đế. Dĩ nhiên, Thượng Đế không bằng lòng, ngài phất tay, tòa tháp lung lay rồi sụp đổ. Ngài bắt con người tản ra khắp thế giới, không bao giờ còn hiểu nhau đến mức có thể tụ tập xây một tòa tháp như vậy nữa.

Tháp Babel là hình tượng của sự bất đồng vĩnh cửu giữa con người, một vách ngăn vĩnh viễn giữa những tâm hồn nhân thế. Toàn bộ nhân loại chia năm xẻ bảy, cho đến một ngày bậc thầy giao tiếp xuất hiện, ông ta mang đến một cuốn sách xóa tan đi sự bất đồng đó và làm thế giới tâm hồn lần đầu tiên có một tiếng nói CHUNG.

Đó là cuốn sách bạn cầm trên tay đây "Cất tiếng làm điếng thế gian".', CAST(N'2018-11-29' AS Date), 1, N'9786047737819.jpg', 13)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (50, N'Cho Đi Là Còn Mãi', 4, 1, 7, NULL, 1, 48000, N'Chúng ta đang sống trong một thế giới đầy bất trắc với những nỗi đau của nhân loại cùng sự hủy hoại nghiêm trọng của môi trường. Chính vì vậy, chúng ta cần quan tâm đến nhau nhiều hơn để góp phần giảm bớt những nỗi đau và bất trắc ấy trong cuộc sống. Thế nhưng, chúng ta sẽ thể hiện điều đó như thế nào để có thể làm vơi đi những bất hạnh của chính mình và của người khác?

Bí quyết đơn giản nhất chính là: "Mỗi người hãy biết chia sẻ, biết cho đi, biết trao tặng những gì tốt nhất mà mình có cho người khác". Thật vậy, cuộc sống chính là quá trình trao tặng và đón nhận không ngừng. Có rất nhiều thứ chúng ta có thể trao tặng cho người khác, từ của cải vật chất cho đến một lời khuyên, một trải nghiệm, một lời nói chân tình, hay thậm chí chỉ là một ánh mắt thiện cảm, một nụ cười đôn hậu... Những hành động chia sẻ đó thể hiện tấm lòng yêu thương của chúng ta dành cho mọi người. Và chắc chắn rằng chúng ta cũng sẽ đón nhận được không ít điều tuyệt vời bắt nguồn từ sự cho đi cao đẹp này.

Cuộc sống là quá trình trao tặng và đón nhận không ngừng, mỗi chúng ta là một mắc xích quan trọng trong vòng liên kết ấy. Vì vậy, bạn đừng do dự khi mở rộng lòng mình với mọi người. Rất nhiều người, rất nhiều nơi trên thế giới đang chờ đợi ở bạn một sự hảo tâm, một vòng tay ấm áp... Đôi khi, chỉ một ánh mắt trìu mến, một nụ cười thân thiện, hay một câu nói chân tình cũng đủ làm viên mãn một trái tim! Hãy cho đi để thấy rằng đời sống thật phong phú.

Xuất phát từ chính những trải nghiệm thực tế, đồng thời căn cứ vào kết quả của một số công trình nghiên cứu, hai tác giả đã gợi mở nhiều ý tưởng sâu sắc đáng để người đọc suy ngẫm. Ở đó chúng ta không chỉ thấy được sức mạnh của sự chia sẻ mà còn học được cách chia sẻ. Sự chia sẻ giúp ta tìm được ý nghĩa đích thực của cuộc sống, xoá bỏ trong ta những lo âu, sợ hãi và cảm giác cô đơn, lạc lõng giữa dòng đời. Hơn thế nữa, ta nghiệm ra rằng: cho và nhận đều mang đến hạnh phúc. Cho không có nghĩa là mất đi, mà đó là lúc chúng ra được nhận lại rất nhiều - dưới muôn vàn hình thức khác nhau.', CAST(N'2018-11-29' AS Date), 3, N'image_146618.jpg', 524)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (51, N'Những Khoảng Lặng Cuộc Sống', 4, 1, 7, NULL, 0, 34760, N'Cuộc sống luôn chứa đựng cả niềm vui và nỗi buồn, biết bao sự kiện, biến cố và cả những điều rất bình dị luôn diễn ra, có lúc làm chúng ta ngập trạn niềm vui và hy vọng, có lúc lại nặng trĩu lo âu, thất vọng...

Nhưng cho dù cuộc sống có diễn ra như thế nào đi nữa, thì bạn luôn nhận ra một điều: ''Đằng sau tất cả những gì đã và đang xảy ra đều ẩn chứa một ý nghĩa nào đó để chúng ta suy ngẫm, trãi nghiệm và cảm nhận''. Những giọt nước mắt đâu chỉ là biểu hiện của sự khổ đau, mà đó cũng có thể là niềm hạnh phúc, mừng vui! Đôi khi, trong những phút giây khổ đau tuyệt vọng, chúng ta mới phát hiện ra được những điều tốt đẹp và quý giá cho cuộc sống của mình.

Tập sách này bao gồm những câu chuyện rất giản dị nhưng đầy ý nghĩa, súc tích, cảm động và sâu sắc. Mỗi câu chuyện là một thế giới riêng, đề cập đến những khía cạnh tâm tư của con người, sự trong sáng của tình yêu, sự nồng ấm chân thành của tình bạn, những nghĩa cử nhân ái, những bài học đầy tình người... ''Mỗi chúng ta ít nhiều đều đã và đang trải nghiệm những khoảnh khắc ý nghĩa và giá trị của cuộc sống, nhưng có thể vì nhiều lý do khác nhau mà đôi khi chúng ta vô tình không nhận ra hoặc đã bỏ lỡ...''

Chúng ta hãy trân trọng, cảm nhận và lưu giữ những ký ức tươi đẹp của mình trong từng giây từng phút. Bởi vì, những khoảnh khắc ấy giúp chúng ta cảm nhận sâu sắc hơn, hạnh phúc hơn với những gì mình đang sống. Đồng thơi, đây cũng chính là sức mạnh xoa dịu tâm hồn mỗi khi chúng ta gặp đau khổ, phiền muộn và nâng đỡ chúng ta vượt lên những phút yếu đuối, những suy nghĩ nhỏ nhen, tầm thường.', CAST(N'2018-11-29' AS Date), 1, N'nhung_khoang_lang_cuoc_song_tai_ban_2016_2_2018_07_06_14_19_55.jpg', 56)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (53, N'Tha Thứ Cho Nhau', 4, 1, 4, NULL, 0, 44250, N'Cuộc đời có những nỗi niềm riêng luôn phải giấu kín trong lòng. Nỗi niềm đó có khi đi với mình đến trọn đời mà không bao giờ được nói ra. Nếu có nói ra đi chăng nữa đôi lúc vẫn còn là dang dở. Ai có thể hiểu thấu lòng người những nỗi niềm không tên?

Trong những ngày nằm bệnh, cuộc đời đã dạy tôi về lòng kham nhẫn và biết ơn. Sống giữa cuộc đời này lòng còn đắng cay, còn hận thì mình còn đau. Chỉ có biết ơn mình mới thấy lòng mình vị tha thật sự.

Mình không muốn mình khổ đau thì cũng đừng mang khổ đau đến cho người khác. Buồn đau không làm nên điều gì tốt đẹp cho cuộc đời. Ai cũng có những tháng ngày buồn đau. Khi mọi nỗ lực cá nhân đã không giúp ích được gì, tốt nhất hãy cố quên và buông những tháng ngày đã qua. Đời người sống là phải biết thả trôi những muộn phiền. Còn nắm thì còn đau. Khi có điều gì bất ổn, làm bạn dằn vặt âu lo, hãy đặt bàn tay lên trái tim rồi nhủ thầm, “Không sao, tất cả sẽ qua mà!”

Cũng vậy, khi một người không đáng để bạn trân quý, bạn nên tìm cách chấp nhận để buông bỏ. Càng giữ chặt thì mất mát càng nhiều, càng níu kéo thì khổ đau càng lớn. Đừng níu kéo một ai, nếu họ muốn đi, cứ mặc họ đi. Đôi bàn tay là để học buông thả chứ không phải để nắm chặt mãi mãi một thứ gì. Bạn cố nắm thật lâu một thứ gì thì bạn càng mỏi mệt, càng nặng nề thêm. Nghịch lý cuộc đời đã dạy “điều duy nhất chắc chắn chính là chẳng có gì chắc chắn”. Biết vậy, nên bạn phải chấp nhận đổi thay. Đổi thay cũng là buông bỏ và cho qua để sự sống mình mới lại.

Cuộc đời là một làn gió. Tình người là một làn mây. Gió thì muốn bay khắp muôn phương, mà mây thì lúc tụ, lúc tan làm sao ta có thể nắm được. Gió và mây không thuộc riêng ai, thế thì “đừng buồn vì một người không nhớ đến ta”. Cái kỷ niệm thường làm nên những hồi ức. Hồi ức tạo nên những nỗi nhớ, và chúng ta khổ đau là do cất giữ quá nhiều kỷ niệm. Tôi sống thảnh thơi là vì biết buông những kỷ niệm không đáng nhớ. Sóng biển sẽ dạt vào bờ những gì không thuộc về nó. Chúng ta cũng tập buông đi những gì không thuộc về mình. Cho dù lòng còn tiếc nuối, vương vấn cũng phải đủ mạnh để vượt qua. Qua đến bờ bên kia nhìn lại, những gì mình quý hôm trước, hôm sau đã trở thành quá khứ. Mà quá khứ cũng chỉ là duyên đến duyên đi. Duyên đến thì sống chân tình, duyên đi thì buông nhẹ. Còn lại cứ thuận theo tự nhiên. Cuộc đời cái gì cũng chỉ là đến và đi, không có gì là mãi mãi.

Có những chuyện vốn dĩ mình không nên biết, khi biết rồi lại càng thêm đau. Sự thật luôn đi đôi với hận thù. Ở góc độ nào đó của cuộc đời, mình vẫn mong chúng ta đến với nhau bằng sự chân thành và ra đi cũng trong chân thành. Bởi vì những người chúng ta gặp giữa cuộc đời không phải là tình cờ thoáng qua. Mình vẫn nghĩ mỗi người đi qua cuộc đời đều có một lý do nhất định. Cuộc sống, mình đã không trao người khác niềm vui thì thôi, vẫn không muốn một ai đó vì mình mà buồn. Chỉ mong là vậy.', CAST(N'2018-11-29' AS Date), 3, N'image_179023.jpg', 768)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (54, N'Chiến Tranh Tiền Tệ (Tái Bản 2018)', 4, 1, 9, NULL, 0, 82800, N'Chiến tranh tiền tệ” giúp chúng ta hiểu nhiều điều, rằng Bill Gates chưa phải là người giàu nhất hành tinh, rằng tỉ lệ tử vong của các tổng thống Mỹ lại cao hơn tỉ lệ tử trận của binh lính Mỹ ngoài chiến trường, hay vì sao phố Wall lại mạo hiểm đổ hết vốn liếng của mình cho việc “đầu tư” vào Hitler.

“Chiến tranh tiền tệ” đề cập đến một cuộc chiến khốc liệt, không khoan nhượng và dai dẳng giữa một nhóm nhỏ các ông trùm tài chính - đứng đầu là gia tộc Rothschild - với các thể chế tài chính kinh tế của nhiều quốc gia. Đó là một cuộc chiến mà đồng tiền là súng đạn và mức sát thương thật là ghê gớm. Một cuốn sách thực sự làm sửng sốt với những ai muốn tìm hiểu về bản chất tiền tệ để từ đó nhận ra những hiểm hoạ tài chính tiềm ẩn nhằm chuẩn bị tâm lý cho một cuộc chiến tiền tệ “không đổ máu”.

Bên cạnh việc phơi bày những âm mưu của các nhà tài phiệt thế giới trong việc tạo ra những cơn “hạn hán” hay “bão lũ” về tiền tệ để thu lợi nhuận, cuốn sách cũng đề cập đến sự phát triển của các định chế tài chính thế giới - những cơ cấu được xây dựng nhằm đáp ứng nhu cầu phát triển vũ bão của nền kinh tế toàn cầu.

***

Một số trích dẫn:

“Trong mắt họ [gia tộc Rothschild] không có chiến tranh và hòa bình, không có khẩu hiệu và tuyên ngôn, cũng không có chết chóc và danh dự, họ xem thường những thứ mê hoặc đôi mắt của người đời này. Trong mắt họ chỉ có bàn đạp.”

“Tiền không có Tổ quốc. Các nhà tài chính không biết thế nào là lòng ái quốc và sự cao thượng. Mục đích duy nhất của họ chính là thu lợi.”

“Của cải vốn dĩ tự động chảy về nơi có thể bảo vệ nó và khiến nó tăng giá trị.”', CAST(N'2018-11-29' AS Date), 1, N'9786048029753.jpg', 56)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (55, N'Kỷ Nguyên Tiền Điện Tử', 4, 1, 3, NULL, -8, 130410, N'ừ một ảo ảnh biến thành hiện thực, từ một ý niệm trở thành hành động; và trong chưa đầy một thập kỷ, Bitcoin cùng nhiều loại tiền kỹ thuật số đã khuấy đảo cả hành tinh. Mới hôm trước, mọi thứ vẫn còn bình lặng. Nhưng chỉ sau một đêm, Bitcoin khiến toàn bộ thế giới xung quanh bạn rung chuyển. Từ “Bitcoin” xuất hiện trên mọi tít báo bạn lướt qua, và làm bùng nổ những cuộc tranh luận vô tận.

Người ta có rất nhiều cách gọi tên Bitcoin. Nó là tiền điện tử, tiền ảo, hay tiền mật mã (cryptocurrency). Bạn có thể sử dụng nó để mua bất cứ thứ gì, từ cà phê đến ô tô. Nhưng kể cả khi thế giới đang đổ xô vào cuộc đầu tư qui mô toàn cầu này, vẫn thật khó để trả lời: Bitcoin thực sự là gì, và tại sao mọi người lại cần quan tâm đến Bitcoin, cũng như công nghệ đằng sau nó - công nghệ Blockchain?

Paul Vigna và Michael J. Casey - bộ đôi phóng viên kinh tế dạn dày kinh nghiệm của The Wall Street - đã thực hiện cuốn sách “Kỷ nguyên tiền điện tử” để giúp độc giả có những hiểu biết cụ thể về làn sóng tiền điện tử đang dâng lên mạnh mẽ hơn bao giờ hết. Nguồn gốc, sự phát triển, chức năng, tiềm năng... - tất cả những gì bạn cần biết về tiền ảo, cũng như việc nó đang thách thức trật tự kinh tế toàn cầu ra sao - sẽ được phân tích trong cuốn sách này. Tác phẩm cung cấp bức tranh toàn cảnh về các hình thái tiền tệ, từ đó giải thích cho bạn hiểu lý do các chuyên gia mã hóa lại nảy ra ý tưởng về Blockchain và Bitcoin, và vì sao lại có nhiều người ủng hộ hệ thống tiền tệ mới này đến thế.

“Kỷ nguyên tiền điện tử” đưa chúng ta đến những nơi Bitcoin và Blockchain đang hiện hữu, từ những quốc gia nghèo khó châu Phi tới lãnh địa công nghệ châu Mỹ, từ những nền kinh tế mới nổi ở châu Á tới xứ sở ngân hàng châu Âu - để thấu hiểu thực trạng nền kinh tế thế giới trước sự nổi lên của tiền điện tử, và trả lời câu hỏi hóc búa: Liệu Bitcoin và công nghệ của nó, Blockchain, có thực sự thay đổi cả thế giới như cách Internet đã làm, theo lời tiên đoán của nhiều người hay không?

Hãy chuẩn bị tinh thần để cùng Vigna và Casey bước vào kỷ nguyên tiền điện tử!', CAST(N'2018-11-29' AS Date), 1, N'8936066685122.jpg', 889)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (58, N'BLOCKCHAIN ', 4, 1, 9, NULL, 0, 75900, N'Tiền điện tử, với đại diện tiêu biểu nhất là Bitcoin, đang là mối quan tâm hàng đầu của giới tài chính toàn cầu. Khả năng thanh toán bằng tiền ảo mở ra hàng loạt tiềm năng cho thương mại và thay đổi toàn diện thói quen tiêu dùng của con người. Hạt nhân của công nghệ hứa hẹn rung chuyển thế giới này được gọi là Blockchain.

Blockchain được giới công nghệ đánh giá là phát kiến vĩ đại nhất sau khi mạng Internet ra đời. Ứng dụng phổ biến nhất của nó là các loại tiền điện tử nổi tiếng (Bitcoin, Ethereum, Ripple...) đang làm mưa làm gió trên thị trường. Nhưng nghịch lý là, lại rất ít người nắm được bản chất của tiền điện tử và Blockchain. Rốt cuộc, Blockchain là gì? Nó hoạt động như thế nào? Blockchain thật sự là một đột phá trong công nghệ hay chỉ là một trào lưu nhất thời? Blockchain có liên hệ như thế nào với Bitcoin? Liệu Blockchain có nắm giữ tiềm năng thay đổi thế giới?...

Thực chất, những bài viết cung cấp thông tin về Blockchain và tiền điện tử không thiếu trên các website hay mạng xã hội, nhưng lại chưa đủ tính bao quát và còn khó tiếp thu. Đó là lý do cuốn sách “BLOCKCHAIN: Bản chất của Blockchain, Bitcoin, tiền điện tử, hợp đồng thông minh và tương lai của tiền tệ” của Mark Gates ra đời. Gates cung cấp một bản tóm lược dễ hiểu nhất, cung cấp nền tảng thiết yếu cho những người mới bắt đầu và cả những ai muốn nghiên cứu sâu hơn về công nghệ Blockchain và tiền ảo. Đọc cuốn sách này, bạn sẽ hiểu được Blockchain dưới nhiều khía cạnh, trong đó không chỉ có những lời ngợi khen mà còn không thiếu các chỉ trích, bình luận trái chiều.', CAST(N'2018-11-29' AS Date), 3, N'8936066684996.jpg', 546)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (59, N'Án Mạng Trên Chuyến Tàu Tốc Hành Phương Đông', 4, 1, 10, NULL, -8, 80300, N'Kẻ sát nhân đang đồng hành cùng chúng ta – trên chuyến tàu này…”

Vừa quá nửa đêm, chuyến tàu tốc hành phương Đông nổi tiếng buộc phải ngừng lại vì tuyết rơi quá dày. Vào buổi sáng, tay triệu phú Simon Ratchett được phát hiện nằm chết trong toa riêng của mình với mười hai nhát dao, cửa khoang được khóa từ bên trong. Một trong những hành khách có mặt trên chuyến tàu là thủ phạm.

Một mình giữa cơn bão tuyết cùng nhân dạng mù mờ về tên sát nhân qua lời chứng của mọi người, thám tử Hercule Poirot phải tìm ra chân tướng kẻ thủ ác giữa mười hai kẻ thù của nạn nhân, trước khi tên giết người kịp đào thoát…', CAST(N'2018-11-29' AS Date), 1, N'8934974152262.jpg', 79)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (60, N'Những Chiếc Đồng Hồ Kỳ Lạ', 4, 1, 9, NULL, 0, 83460, N'Sheila Webb nghĩ mình đến gặp một quý bà bị mù đợi cô ở nhà số 19 khu Wilbraham Crescent — chứ không phải là gặp một cái xác đàn ông trên sàn nhà. Nhưng khi cô Pebmarsh phủ nhận việc yêu cầu cử cô Sheila Webb đến đây, cũng như không hề sở hữu những chiếc đồng hồ hiện diện xung quanh cái xác, rõ ràng họ cần đến một thám tử tài ba.

“Vụ án quá phức tạp nên hẳn nhiên nó phải rất đơn giản,” Hercule Poirot tuyên bố. Nhưng kẻ sát nhân vẫn lộng hành còn thời gian thì cứ trôi đi…

Cuốn tiểu thuyết nổi tiếng với sự kiện Hercules Poirot không hề đến hiện trường xảy ra tội ác hoặc thẩm vấn nhân chứng hay người bị tình nghi. Ông bị thách thức chứng minh rằng có thể giải quyết một vụ án chỉ bằng kinh nghiệm và trí thông minh.  ', CAST(N'2018-11-29' AS Date), 3, N'8934974136088.jpg', 35)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (61, N'Cái Bóng Kinh Hoàng', 4, 1, 11, NULL, -14, 103600, N'Cái Bóng Kinh Hoàng là một cuốn tiểu thuyết trinh thám, đã được trao giải Marseillais và giải Cognac, là hai giải thưởng danh giá nhất ở Pháp dành cho thể loại tiểu thuyết trinh thám, hình sự. Nội dung tiểu thuyết kể về Cloé, một cô gái xinh đẹp, cuốn hút, rất thành công và mạnh mẽ. Cô hiện làm Phó tổng giám đốc, và được đích thân Tổng giám đốc sắp về hưu thông báo là sẽ được thay thế ông. Chuyện tình cảm cũng đang thăng hoa, cô có một người tình hết sức ưng ý.

Một đêm, trên đường về nhà, cô bị một cái bóng bám theo. Và từ đó trở đi, lúc nào cô cũng có cảm giác đang bị theo dõi: đồ vật trong nhà bị xê dịch, một số thứ tự nhiên biến mất rồi lại xuất hiện, cô mất ngủ, căng thẳng, hoảng loạn, đi làm muộn, không tập trung,… Nhưng khi cô kể lại thì không ai tin, tất cả mọi người từ bạn bè, người yêu, thậm chí cả cảnh sát đều nghĩ cô có vấn đề về tâm thần.

Cloé hoàn toàn tuyệt vọng khi mọi chuyện dồn dập xảy ra: cô bị Cái Bóng cưỡng bức nhưng lại không để lại dấu vết, người tình nồng nhiệt bỗng nhiên tuyên bố không hề yêu cô và kiên quyết rời bỏ, chức vụ cô đã từng được hứa hẹn lại được giao cho viên phó tổng giám đốc còn lại…. Mọi chuyện dần sáng tỏ khi Alexandre, một cảnh sát giỏi, vừa góa vợ sau 18 năm chung sống hạnh phúc (người vợ giống Cloé đến kinh ngạc) phát hiện ra một trường hợp bị theo dõi tương tự như của Cloé…

Đọc đến đây chắc chắn rất nhiều độc giả sẽ suy đoán ra một cái kết kiểu “anh hùng cứu mỹ nhân”. Tuy nhiên hung thủ - là kẻ mà không ai có thể ngờ tới - chính là một tên vô cùng độc ác và tinh vi - đã ra tay sát hại Alexandre trước. Đến lúc này thì Cloé mới thực sự rơi vào vực thẳm…

Với Cái bóng kinh hoàng, độc giả sẽ được theo dõi một câu chuyện vô cùng hồi hộp, gay cấn với những tình tiết được báo giới đánh giá là “lạnh người”, “nghẹt thở”, “căng thẳng đến tột độ!”… và một cái kết hoàn toàn bất ngờ.', CAST(N'2018-11-29' AS Date), 1, N'image_56325.jpg', 768)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (62, N'Em Là Nhà', 4, 1, 9, NULL, 0, 73500, N'Đằng sau một cuộc tình tan vỡ là điều gì?
Lời xin lỗi liệu có là đủ để làm nguôi ngoai nỗi đau của người bị bỏ lại?
Tình yêu thời nay, chỉ yêu thôi chưa bao giờ là đủ?

Nếu bạn còn chưa thể chắc chắn khi đưa ra câu trả lời của mình, vậy thì hãy cùng đi tìm đáp án cho những câu hỏi trên trong “Em là nhà” – Cuốn tiểu thuyết viết về những mối tình đan xen, là món quà, là lời nhắn nhủ của một người trẻ, gửi đến nhiều người trẻ.

Xoay quanh những đổ vỡ tình cảm, những thách thức, những sự lừa dối mà cô gái trẻ Như Nguyệt phải chịu đựng, chuyện tình yêu trong “Em là nhà” sẽ đưa bạn qua những cung bậc cảm xúc từ ngọt ngào đến cao trào uất hận, từ bình yên êm ấm đến những nỗi đau chỉ có thể âm thầm chịu đựng.
Tình yêu là điều duy nhất trên đời này không thể lên kế hoạch, không thể lường trước. Thời gian của một cuộc tình dường như chẳng thể đảm bảo về một cái kết hạnh phúc, giống như mối tình kéo dài suốt 7 năm của Như Nguyệt và Việt An. Hai con người đã dành cả thanh xuân ở bên nhau, sau cùng đã trở thành những người xa lạ. Chàng trai quay lưng, kết hôn với người bạn thân nhất của người con gái mình từng yêu. Đó là Hà Vi – cô gái xinh đẹp và phía sau là cả một gia đình bề thế. Sóng gió từ đó cứ đổ ập vào đời Như Nguyệt. Bình yên hết lần này đến lần khác rời bỏ cô mà đi.

“Em là nhà” là câu chuyện tình với nhiều nước mắt, nhiều thù hận, nhưng cũng không thiếu những điều ngọt ngào và những hạnh phúc bình dị. Mỗi trang sách bạn lật mở, mỗi nỗi đau bạn cảm nhận cùng những nhân vật chính là mỗi lần bạn xóa đi lớp sương mù đang giăng trong mình về tình yêu. Và những câu hỏi ở trên sẽ trở nên dễ dàng trả lời hơn bao giờ hết.

Chẳng phải tự nhiên mà Việt An bỏ Như Nguyệt để đến với Hà Vi.
Chẳng phải tự nhiên mà Mai và Như Nguyệt trở thành đối thủ và nhìn nhau bằng ánh mắt hình viên đạn, dù trước đó họ từng rất thân.
Cũng chẳng phải tự nhiên mà Như Nguyệt có thể dễ dàng bước qua những đổ vỡ của đời mình.

Vậy đó. Chuyện tình yêu trong “Em là nhà” không chỉ đơn thuần là những lần yêu – chia tay, cũng không hẳn là những thù hằn hay những mưu kế trả thù. Đó là cuộc sống của những người trẻ chông chênh, mỏng manh và đơn độc giữa những tháng ngày bão tố. Tuổi trẻ của họ được yêu, được nông nổi, được khờ dại, được nếm trải những nỗi đau để rồi nhận ra rằng: Tình yêu thôi là không đủ để làm nên một cuộc đời hạnh phúc. “Em là nhà” nhẹ nhàng như vị tình yêu đầu đời, đắng chát như mùi thù hận và bất ngờ với những bí mật thẳm sâu. 


Hãy đọc, cảm nhận để tự tìm đáp án cho những câu hỏi vẫn còn đang bỏ ngỏ trong trái tim bạn.', CAST(N'2018-11-29' AS Date), 3, N'9786045522714.jpg', 35)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (63, N'Chẳng Lẽ Ở Vậy Thiệt Sao', 4, 1, 11, NULL, -8, 45820, N'Tình yêu là thứ mong cầu chưa chắc đã có, theo đuổi chưa chắc đã thuộc về, nhưng cứ để tự nhiên thì ắt sẽ hạnh phúc. Vạn sự đều nên tùy duyên, nhân lúc chưa thuộc về một ai, hãy độc thân kiêu hãnh một cách “chảnh” lên nào (Hạc Xanh)

 Tình yêu chưa bao giờ là đề tài thôi thu hút sự quan tâm của nhân loại. Dù chúng ta có bị tình yêu đẩy đến thái cực nào, thăng hoa hay đau khổ, nhưng thật khó để từ chối lời mời gọi từ trái tim. Thế nên câu hỏi “Chẳng lẽ ở vậy thiệt sao?” được dùng làm tựa sách của nữ tác giả Hạc Xanh do Nhà xuất bản Văn Học và công ty văn hoá First News – Trí Việt liên kết phát hành, không nằm ngoài mong muốn: Ai cũng mong đợi tìm thấy một nửa đồng điệu của đời mình!

 Chẳng lẽ ở vậy thật sao? là tập tản văn luận về tình yêu của một người con gái thời đại này. Đó là những suy tư, phân tích khi yêu một người và khi tình yêu rời đi, ta sẽ xoay xở với cuộc đời thế nào.  Được chia thành 4 phần bao quát đầy đủ về tình ái, tập tản văn sẽ khiến bất kỳ cô gái nào cũng tìm thấy chân dung của chính mình dù là đã, đang và sẽ yêu.

 Ở phần đầu tiên của tập sách, Một cuộc tình đã mất, tác giả không chỉ gợi lại những kỷ niệm, niềm vui nỗi buồn những ngày đôi lứa còn thắm thiết, mà đằng sau đó là lời khẳng định lạc quan: Hãy cứ yêu hết mình cho hôm nay, bởi “Tình yêu là một thứ không thể để dành như một tài khoản ngân hàng, cứ chờ ngày tháng trôi qua thì sinh sôi nảy nở. Tình yêu là một thứ không hình hài, không cầm nắm, không mùi vị, nhưng lại là thứ cần được săn sóc mỗi ngày”.

 Tỉnh táo mà yêu là phần thứ hai khá thú vị khi Hạc Xanh muốn nhắn nhủ ta đừng quá ru ngủ tình yêu của mình. “Sẽ tốt hơn khi biết tình yêu là gì, trước khi yêu một ai đó” là thông điệp đầy kinh nghiệm cho bất cứ người nào muốn lao vào ngọn lửa tình.

 Không ít tình yêu với kết thúc xuất hiện danh từ ít ai muốn sở hữu: người yêu cũ. Tuy nhiên, đối diện với đoạn “vĩ thanh” này là một thái độ đầy tích cực của người con gái: “Chia tay không đáng sợ, đáng sợ là chính mình không thể vượt qua”. Đây cũng là một chủ đề nhỏ của phần thứ ba: Sau những cuộc tình.

 Ngày mai sẽ khác cũng là phần cuối cùng của tập sách dẫn lối độc giả hướng về một thái độ sống tích cực nhất: “Việc của chúng ta chính là mở rộng lòng mình và đón chờ những điều mới mẻ, tiếp nhận những thương yêu và trao đi yêu thương không chút phàn nàn”.

 Được viết với giọng văn nhẹ nhàng, nữ tính, đầy chất tâm tình nhưng không quá ủy mị, ướt át, tập sách có nhiều trang viết tựa như những lá thư tình của một cô gái viết gửi tặng chàng trai mình đã yêu, hoặc gửi tặng đến có thể là bất cứ ai trong chúng ta, những người trẻ vẫn dành cho tình yêu một vị trí quan trọng trong đời.

 Chẳng lẽ ở vậy thiệt sao? cũng là tập sách thứ 6 của Hạc Xanh về đề tài tình yêu, dường như là chủ đề chưa bao giờ ngừng chảy trong mạch sáng tác của cô gái Hà Nội này. Bởi như Hạc Xanh chia sẻ: “Mỗi lần đặt bút viết về tình yêu, tôi lại thấy mình bỗng dịu dàng, bỗng mềm mại, bỗng khao khát thứ tình cảm kỳ diệu ấy đến lạ. Cũng chỉ khi viết về  tình yêu thì tôi mới thấy gần gũi hơn với bạn đọc trẻ của mình. Những người mà ngày đêm trăn trở về những chuyện tình chưa trọn.

 Thông qua những ngày viết triền miên những cuộc tình, tôi lại thấy mình nhìn tình yêu dưới những lăng kính khác nhau. Có buồn, có vui, có khổ đau, có hy vọng… Những chiêm nghiệm ấy sẽ giúp tôi trải lòng với nhiều người hơn, cũng là để giúp tôi tự thấy mình trưởng thành và chín chắn hơn”.

 Chẳng phải là những lời hô hào to tát về việc chúng ta phải cư xử thế nào trong tình yêu, Chẳng lẽ ở vậy thiệt sao? là tiếng nói đầy thực tế mà cũng hết mực trân trọng tình yêu, dù ta có ở phía nào của một cuộc tình. Đây xứng đáng là một tập tản văn dành cho bất kỳ người trẻ nào, đặc biệt là các độc giả nữ có thêm niềm tin vào tình yêu và tin rằng mình luôn xứng đáng nhận được hạnh phúc.

 Và là một món quà mà tác giả gửi tặng:“Đôi khi chúng ta bị nhấn chìm quá lâu trong những nỗi cô đơn mà quên mất rằng cô đơn cũng chính là một niềm hạnh phúc. Khi bạn cô đơn, nghĩa là bạn đang chờ đợi cho tình yêu đích thực tìm đến với mình. Và khi bạn cô đơn, bạn sẽ học được cách quan sát, đón nhận yêu thương một cách thật sự trưởng thành hơn”.', CAST(N'2018-11-29' AS Date), 1, N'8935086844199.jpg', 764)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (64, N'Nghĩ Đơn Giản - Sống Đơn Thuần', 4, 1, 9, NULL, -6, 40300, N'Từ xưa đến nay, chúng ta vẫn được định hướng để tin rằng chẳng có điều gì đáng giá mà không cần đấu tranh. Bản thân tôi cũng đã dành hàng thập kỷ để nghiên cứu về nhận định phổ biến này. Tôi chưa bao giờ để cuộc sống trở nên dễ dàng. Tuy nhiên, giờ đây, thay vì cứ cố gắng làm mọi việc đúng theo ý mình, tôi đã tìm ra chiến lược để mọi thứ diễn ra theo cách của nó. Kết quả, tôi thấy mình khoẻ mạnh hơn, hạnh phúc và giàu có hơn tôi tưởng tượng. Nếu cuộc sống của bạn căng thẳng, buồn chán hoặc mãi quẩn quanh, đó là dấu hiệu bạn đang thiếu đi điều gì đó cốt yếu, và bạn đang tự cho phép mình ngừng phát triển. “Nghĩ đơn giản, sống đơn thuần” sẽ mang tới cho bạn bộ khung cơ bản để bạn nhìn nhận lại chính mình và tìm ra những mảnh ghép còn thiếu.

Đơn giản nhưng có sức tác động mạnh mẽ, những hành động này sẽ tạo nên sự khác biệt rõ rệt trong các trải nghiệm hàng ngày của bạn.', CAST(N'2018-11-29' AS Date), 1, N'9_22.jpg', 330)
INSERT [dbo].[Sach] ([Id], [TenSach], [IdTacGia], [IdNXB], [IdDanhMuc], [Tap], [SoLuong], [Gia], [TomTat], [NgayThem], [TrangThai], [HinhAnh], [SoLuotMua]) VALUES (65, N'Tư Duy Đột Phá', 4, 1, 9, NULL, -6, 66300, N'Chúng ta rất lười thay đổi. Thay đổi thói quen hành động đã khó, thay đổi thói quen tư duy còn là thử thách lớn hơn gấp nhiều lần. Nhưng nếu như bạn muốn tạo nên sự khác biệt, muốn vươn lên một tầm cao mới - thì điều tiên quyết bạn cần làm là thay đổi tư duy trong mọi việc.

"Tư duy đột phá" là cuốn sách giúp bạn tìm ra được động lực để thay đổi, cũng như chỉ dẫn rõ ràng cho bạn các phương pháp để có lối suy nghĩ vượt trội so với đám đông. Tác phẩm phân tích các lỗi tư duy thường gặp trong cuộc sống, từ đó định hướng cách thay đổi nếp nghĩ sai lầm và giúp bạn "nghĩ khác". Mục tiêu cuối cùng của "Tư duy đột phá" là trợ giúp bạn hạ gục sự tầm thường, để nắm bắt những thành tựu bạn vẫn luôn mong muốn. Với lối viết hài hước, hóm hỉnh và xen kẽ sự ngạo nghễ tinh tế, tác giả Patrick King cũng như cuốn sách của anh đã trở thành một người bạn, một cố vấn tâm lý thân thiết với bạn đọc.

Hãy nhớ rằng, chúng ta không quyết định được tương lai. Nhưng chúng ta hoàn toàn có thể lựa chọn thay đổi cách nghĩ, cách tư duy của mình để tạo dựng một tương lai tốt đẹp hơn.', CAST(N'2018-11-29' AS Date), 1, N'8936066685030_1.jpg', 250)
SET IDENTITY_INSERT [dbo].[Sach] OFF
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (1, N'Shinkai Makoto', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (3, N'Dale Carnegie', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (4, N'Nguyễn Nhật Ánh', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (5, N'Ngọc Huyền LB', N'', 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (6, N'Nguyễn Anh Đức', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (7, N'Arthur Conan Doyle', N'', 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (9, N'Tony Buổi Sáng', N'', 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (10, N'Robin Sharma', N'', 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (11, N'Nguyễn Ngọc Tư', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (13, N'Hamlet Trương', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (14, N'Huyền Trang', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (15, N'Bất Hối', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (16, N'Nguyễn Ngọc Thạch', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (17, N'Anh Khang', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (18, N'Du Phong', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (19, N'Gào', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (20, N'Gari', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (21, N'Quỳnh Seoul', NULL, 1)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (22, N'Thảo Xù', NULL, 2)
INSERT [dbo].[TacGia] ([Id], [TenTacGia], [MoTa], [TrangThai]) VALUES (23, N'Steven J. Stein', N'Tiến sĩ Steven J. Stein là một nhà tâm lý học lâm sàng, kiêm Giám đốc điều hành của Multi-Health Systems (MHS) – một công ty hàng đầu chuyên xuất bản các bài kiểm tra đánh giá năng lực tổng thể. Là một trong những chuyên gia hàng đầu trong lĩnh vực đánh giá năng lực tâm lý và trí thông minh cảm xúc, ông đã nhiều lần tư vấn cho các tổ chức quân sự và Chính phủ, các doanh nghiệp và tổ chức lớn, cũng như các đội thể thao chuyên nghiệp.', 1)
SET IDENTITY_INSERT [dbo].[TacGia] OFF
SET IDENTITY_INSERT [dbo].[TrangThaiGiaoHang] ON 

INSERT [dbo].[TrangThaiGiaoHang] ([Id], [TenTrangThai], [MoTa]) VALUES (1, N'Vừa đặt', NULL)
INSERT [dbo].[TrangThaiGiaoHang] ([Id], [TenTrangThai], [MoTa]) VALUES (2, N'Đang giao', NULL)
INSERT [dbo].[TrangThaiGiaoHang] ([Id], [TenTrangThai], [MoTa]) VALUES (3, N'Đã giao', NULL)
SET IDENTITY_INSERT [dbo].[TrangThaiGiaoHang] OFF
SET IDENTITY_INSERT [dbo].[TrangThaiSach] ON 

INSERT [dbo].[TrangThaiSach] ([Id], [TenTrangThai], [MoTa]) VALUES (1, N'Đang bán', NULL)
INSERT [dbo].[TrangThaiSach] ([Id], [TenTrangThai], [MoTa]) VALUES (2, N'Ngừng bán', NULL)
INSERT [dbo].[TrangThaiSach] ([Id], [TenTrangThai], [MoTa]) VALUES (3, N'Sắp bán', NULL)
SET IDENTITY_INSERT [dbo].[TrangThaiSach] OFF
SET IDENTITY_INSERT [dbo].[TrangThaiSuDung] ON 

INSERT [dbo].[TrangThaiSuDung] ([Id], [TenTrangThai], [MoTa]) VALUES (1, N'Đang sử dụng', NULL)
INSERT [dbo].[TrangThaiSuDung] ([Id], [TenTrangThai], [MoTa]) VALUES (2, N'Ngưng sử dụng', NULL)
SET IDENTITY_INSERT [dbo].[TrangThaiSuDung] OFF
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([IdDonDatHang])
REFERENCES [dbo].[DonDatHang] ([Id])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_Sach] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Sach] ([Id])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_Sach]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapSach]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhapSach_PhieuNhapSach] FOREIGN KEY([IdPhieuNhap])
REFERENCES [dbo].[PhieuNhapSach] ([Id])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapSach] CHECK CONSTRAINT [FK_ChiTietPhieuNhapSach_PhieuNhapSach]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapSach]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuNhapSach_Sach] FOREIGN KEY([IdSach])
REFERENCES [dbo].[Sach] ([Id])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhapSach] CHECK CONSTRAINT [FK_ChiTietPhieuNhapSach_Sach]
GO
ALTER TABLE [dbo].[DanhMuc]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_TrangThaiSuDung] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThaiSuDung] ([Id])
GO
ALTER TABLE [dbo].[DanhMuc] CHECK CONSTRAINT [FK_DanhMuc_TrangThaiSuDung]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([IdKH])
REFERENCES [dbo].[KhachHang] ([Id])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_TrangThaiGiaoHang] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThaiGiaoHang] ([Id])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_TrangThaiGiaoHang]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_ThanhVien] FOREIGN KEY([IdThanhVien])
REFERENCES [dbo].[ThanhVien] ([Id])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_ThanhVien]
GO
ALTER TABLE [dbo].[NhaXuatBan]  WITH CHECK ADD  CONSTRAINT [FK_NhaXuatBan_TrangThaiSuDung] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThaiSuDung] ([Id])
GO
ALTER TABLE [dbo].[NhaXuatBan] CHECK CONSTRAINT [FK_NhaXuatBan_TrangThaiSuDung]
GO
ALTER TABLE [dbo].[PhieuNhapSach]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapSach_NhaXuatBan] FOREIGN KEY([IdNXB])
REFERENCES [dbo].[NhaXuatBan] ([Id])
GO
ALTER TABLE [dbo].[PhieuNhapSach] CHECK CONSTRAINT [FK_PhieuNhapSach_NhaXuatBan]
GO
ALTER TABLE [dbo].[QuanTriVien]  WITH CHECK ADD  CONSTRAINT [FK_QuanTriVien_Quyen] FOREIGN KEY([IdQuyen])
REFERENCES [dbo].[Quyen] ([Id])
GO
ALTER TABLE [dbo].[QuanTriVien] CHECK CONSTRAINT [FK_QuanTriVien_Quyen]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_DanhMuc] FOREIGN KEY([IdDanhMuc])
REFERENCES [dbo].[DanhMuc] ([Id])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_DanhMuc]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NhaXuatBan] FOREIGN KEY([IdNXB])
REFERENCES [dbo].[NhaXuatBan] ([Id])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NhaXuatBan]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TacGia] FOREIGN KEY([IdTacGia])
REFERENCES [dbo].[TacGia] ([Id])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TacGia]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TrangThaiSach] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThaiSach] ([Id])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TrangThaiSach]
GO
ALTER TABLE [dbo].[TacGia]  WITH CHECK ADD  CONSTRAINT [FK_TacGia_TrangThaiSuDung] FOREIGN KEY([TrangThai])
REFERENCES [dbo].[TrangThaiSuDung] ([Id])
GO
ALTER TABLE [dbo].[TacGia] CHECK CONSTRAINT [FK_TacGia_TrangThaiSuDung]
GO
USE [master]
GO
ALTER DATABASE [BookStore] SET  READ_WRITE 
GO
