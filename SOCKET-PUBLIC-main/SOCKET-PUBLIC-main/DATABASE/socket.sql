create database Socket_MMT
 go
 
 --  B2: Kích hoạt cơ sở dữ liệu
 use Socket_MMT
 go

CREATE TABLE CT_TranDau(
	[MaTD] [char](3) NOT NULL,
	[TenDoi] [varchar](50) NOT NULL,
	[SuKien] [smallint] NULL,
	[TenCauThu] [nvarchar](50) NULL,
	[ThoiGian] [varchar](3) NOT NULL,
)

CREATE TABLE TaiKhoan(
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
)
CREATE TABLE TranDau(
	[MaTD] [char](3) NOT NULL,
	[DoiA] [varchar](50) NULL,
	[DoiB] [varchar](50) NULL,
	[DiemA] [smallint] NULL,
	[DiemB] [smallint] NULL,
	[NgayThiDau] [date] NULL,
	[GioThiDau] [time](7) NULL,
)
GO
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'001', N'Brazil', 2, N'NEYMAR JR ', N'26')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'001', N'Brazil', 1, N'NEYMAR JR ', N'28')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'001', N'Brazil', 1, N'NEYMAR JR ', N'70')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'001', N'Brazil', 2, N'Luiz Gustavo', N'87')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'001', N'Brazil', 1, N'Oscar', N'90')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'001', N'Croatia', 1, N'MARCELO', N'10')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'001', N'Croatia', 2, N'ĆORLUKA', N'65')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'001', N'Croatia', 2, N'LOVREN ', N'68')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'002', N'Cameroon', 2, N'Nounkeu ', N'76')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'002', N'Mexico', 2, N'H. MORENO ', N'56')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'002', N'Mexico', 1, N'O. PERALTA', N'60')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'003', N'Brazil', 2, N'Ramires', N'44')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'003', N'Brazil', 2, N'T. SILVA', N'79')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'003', N'Mexico', 2, N'Aguilar', N'58')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'003', N'Mexico', 2, N'Vázquez', N'61')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'004', N'Australia', 1, N'CAHILL', N'34')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'004', N'Australia', 2, N'CAHILL', N'43')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'004', N'Australia', 2, N'JEDINAK', N'57')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'004', N'Australia', 2, N'MILLIGAN', N'67')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'004', N'Chile', 1, N'Alexis SANCHEZ', N'11')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'004', N'Chile', 1, N'Jorge Valdivia', N'13')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'004', N'Chile', 2, N'Charles Aránguiz', N'85')
INSERT [dbo].[CT_TranDau] ([MaTD], [TenDoi], [SuKien], [TenCauThu], [ThoiGian]) VALUES (N'004', N'Chile', 2, N'Jean Beausejour ', N'91')
GO
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau]) VALUES (N'ada', N'123d')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau]) VALUES (N'alo123', N'alo')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau]) VALUES (N'duchieu', N'truc')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau]) VALUES (N'hcmus1', N'abc')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau]) VALUES (N'hcmus2', N'abc')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau]) VALUES (N'hcmus3', N'bde')
INSERT [dbo].[TaiKhoan] ([TenDangNhap], [MatKhau]) VALUES (N'hcmus4', N'nth1')
GO
INSERT [dbo].[TranDau] ([MaTD], [DoiA], [DoiB], [DiemA], [DiemB], [NgayThiDau], [GioThiDau]) VALUES (N'001', N'Brazil', N'Croatia', 3, 1, CAST(N'2014-06-12' AS Date), CAST(N'17:00:00' AS Time))
INSERT [dbo].[TranDau] ([MaTD], [DoiA], [DoiB], [DiemA], [DiemB], [NgayThiDau], [GioThiDau]) VALUES (N'002', N'México', N'Cameroon', 1, 0, CAST(N'2014-06-13' AS Date), CAST(N'13:00:00' AS Time))
INSERT [dbo].[TranDau] ([MaTD], [DoiA], [DoiB], [DiemA], [DiemB], [NgayThiDau], [GioThiDau]) VALUES (N'003', N'Brazil', N' México', 0, 0, CAST(N'2014-06-16' AS Date), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TranDau] ([MaTD], [DoiA], [DoiB], [DiemA], [DiemB], [NgayThiDau], [GioThiDau]) VALUES (N'004', N'Chile', N'Australia', 3, 1, CAST(N'2014-06-13' AS Date), CAST(N'18:00:00' AS Time))
INSERT [dbo].[TranDau] ([MaTD], [DoiA], [DoiB], [DiemA], [DiemB], [NgayThiDau], [GioThiDau]) VALUES (N'005', N'Spain', N'Chile', 0, 2, CAST(N'2014-06-18' AS Date), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TranDau] ([MaTD], [DoiA], [DoiB], [DiemA], [DiemB], [NgayThiDau], [GioThiDau]) VALUES (N'006', N'Japan', N'Colombia', 1, 4, CAST(N'2014-06-24' AS Date), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TranDau] ([MaTD], [DoiA], [DoiB], [DiemA], [DiemB], [NgayThiDau], [GioThiDau]) VALUES (N'007', N'Switzerland', N'France', 2, 5, CAST(N'2014-06-20' AS Date), CAST(N'16:00:00' AS Time))
INSERT [dbo].[TranDau] ([MaTD], [DoiA], [DoiB], [DiemA], [DiemB], [NgayThiDau], [GioThiDau]) VALUES (N'008', N'United States', N'Germany', 0, 1, CAST(N'2014-06-26' AS Date), CAST(N'13:00:00' AS Time))
GO
ALTER TABLE [dbo].[CT_TranDau]  WITH CHECK ADD  CONSTRAINT [FK_CT_TranDau_TranDau] FOREIGN KEY([MaTD])
REFERENCES [dbo].[TranDau] ([MaTD])
GO
ALTER TABLE [dbo].[CT_TranDau] CHECK CONSTRAINT [FK_CT_TranDau_TranDau]
GO
ALTER TABLE [dbo].[CT_TranDau]  WITH CHECK ADD  CONSTRAINT [CK_CT_TranDau_SuKien] CHECK  (([SuKien]>=(1) AND [SuKien]<=(3)))
GO
ALTER TABLE [dbo].[CT_TranDau] CHECK CONSTRAINT [CK_CT_TranDau_SuKien]
GO
ALTER TABLE [dbo].[TranDau]  WITH CHECK ADD  CONSTRAINT [CK_TranDau_Diem] CHECK  (([DiemA]>=(0) AND [DiemB]>=(0)))
GO
ALTER TABLE [dbo].[TranDau] CHECK CONSTRAINT [CK_TranDau_Diem]
GO
USE [master]
GO
ALTER DATABASE [Socket_MTT] SET  READ_WRITE 
GO
