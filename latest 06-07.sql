USE [master]
GO
/****** Object:  Database [ChildCareSystem]    Script Date: 7/6/2021 8:04:03 PM ******/
CREATE DATABASE [ChildCareSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChildCareSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ChildCareSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChildCareSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ChildCareSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ChildCareSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChildCareSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChildCareSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChildCareSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChildCareSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChildCareSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChildCareSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChildCareSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChildCareSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChildCareSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChildCareSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChildCareSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChildCareSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChildCareSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChildCareSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChildCareSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChildCareSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChildCareSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ChildCareSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ChildCareSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChildCareSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChildCareSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChildCareSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChildCareSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChildCareSystem', N'ON'
GO
ALTER DATABASE [ChildCareSystem] SET QUERY_STORE = OFF
GO
USE [ChildCareSystem]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[AdminID] [int] IDENTITY(400000,1) NOT NULL,
	[IdentityID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
 CONSTRAINT [PK__tblAdmin__3BA2AA8148129CBB] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlog]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[Thumbnail] [varchar](max) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[AuthorID] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[StatusID] [int] NOT NULL,
	[OnSlider] [bit] NOT NULL,
 CONSTRAINT [PK__tblBlog__54379E50B2E9DFD1] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBlogCategory]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBlogCategory](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__tblBlogC__19093A2B947EEFE7] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[CustomerID] [int] IDENTITY(500000,1) NOT NULL,
	[IdentityID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK__tblCusto__A4AE64B8F0051E26] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Rate] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
 CONSTRAINT [PK__tblFeedb__6A4BEDF6177139FD] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIdentity]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIdentity](
	[IdentityID] [int] IDENTITY(10000,1) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[RoleID] [int] NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK__tblIdent__30667A25CED708AD] PRIMARY KEY CLUSTERED 
(
	[IdentityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblManager]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManager](
	[ManagerID] [int] IDENTITY(300000,1) NOT NULL,
	[IdentityID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
 CONSTRAINT [PK__tblManag__3BA2AA81B260DF43] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMedicalExamination]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedicalExamination](
	[ExaminationID] [int] IDENTITY(1,1) NOT NULL,
	[ReservationID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Prescription] [nvarchar](max) NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK__tblMedic__C4A924C0BD77E847] PRIMARY KEY CLUSTERED 
(
	[ExaminationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOpenTime]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOpenTime](
	[OpenTimeID] [int] IDENTITY(1,1) NOT NULL,
	[OpenTime] [time](7) NOT NULL,
 CONSTRAINT [PK_tblOpenTime] PRIMARY KEY CLUSTERED 
(
	[OpenTimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPatient]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPatient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](100) NOT NULL,
	[Gender] [bit] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[Birthday] [date] NOT NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK__tblPatie__970EC346C545E187] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblReservation]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblReservation](
	[ReservationID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PatientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StaffAssignedID] [int] NOT NULL,
	[IntervalTimeID] [int] NOT NULL,
	[CheckInTime] [smalldatetime] NOT NULL,
	[CreatedDate] [smalldatetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK__tblReser__B7EE5F04B35B530A] PRIMARY KEY CLUSTERED 
(
	[ReservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[RoleID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblService]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblService](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[SpecialtyID] [int] NOT NULL,
	[Thumbnail] [varchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[StatusID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[CreatedPersonID] [int] NOT NULL,
 CONSTRAINT [PK__tblServi__C51BB0EA74F7B74F] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSpecialty]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSpecialty](
	[SpecialtyID] [int] IDENTITY(1,1) NOT NULL,
	[SpecialtyName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpecialtyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStaff]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStaff](
	[StaffID] [int] IDENTITY(200000,1) NOT NULL,
	[IdentityID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Birthday] [date] NOT NULL,
	[CitizenID] [varchar](12) NOT NULL,
	[SpecialtyID] [int] NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK__tblStaff__96D4AAF71D06CEB4] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSystemSetting]    Script Date: 7/6/2021 8:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSystemSetting](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[SettingName] [varchar](100) NOT NULL,
	[SettingValue] [varchar](100) NOT NULL,
	[AdminID] [int] NOT NULL,
	[CreatedDate] [date] NULL,
	[UpdatedDate] [date] NULL,
 CONSTRAINT [PK_tblSystemSetting] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAdmin] ON 

INSERT [dbo].[tblAdmin] ([AdminID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (400000, 10017, CAST(N'2021-06-30' AS Date), NULL, N'Nguyen Vo Bao Nguyen', N'0899156326', N'50/30/14 Duong Quang Ham', CAST(N'2001-06-26' AS Date), N'079201030075')
INSERT [dbo].[tblAdmin] ([AdminID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (400001, 10019, CAST(N'2021-07-02' AS Date), NULL, N'Lê Khôi', N'0931155341', N'410 Điện Biên Phủ', CAST(N'2001-03-20' AS Date), N'012345678935')
SET IDENTITY_INSERT [dbo].[tblAdmin] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBlog] ON 

INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (28, N'blogTest.jpg', N'Kỉ niệm Ngày Quốc tế Điều dưỡng', 10006, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Trong đại dịch COVID-19 đội ngũ điều dưỡng, hộ sinh, kỹ thuật vi&ecirc;n y đ&atilde; v&agrave; đang l&agrave; c&aacute;c chiến sĩ &aacute;o trắng c&oacute; mặt tại c&aacute;c vị tr&iacute; từ địa phương đến tuyến đầu chống dịch. Xin gửi lời cảm ơn v&agrave; lời ch&uacute;c sức khỏe đến tất cả những người đang l&agrave;m c&ocirc;ng việc chăm s&oacute;c người bệnh nh&acirc;n ng&agrave;y đặc biệt n&agrave;y &ldquo;Ng&agrave;y Quốc tế Điều dưỡng 12/5&rdquo;.</span></p>', 1, CAST(N'2021-06-13T22:12:56.867' AS DateTime), NULL, 1, 1)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (33, N'224052021-1-1320x990.png', N'Những điều cần biết khi tiêm Vắc xin AstraZeneca', 10006, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Đến ng&agrave;y 04/05/2021, 341 nh&acirc;n vi&ecirc;n đ&atilde; ho&agrave;n tất ti&ecirc;m vắc-xin ngừa COVID-19 2 liều v&agrave; 735 nh&acirc;n vi&ecirc;n ho&agrave;n tất ti&ecirc;m 1 liều. Trong cuộc chiến d&agrave;i hạn với đại dịch COVID-19, hy vọng &ldquo;h&agrave;ng r&agrave;o bảo vệ sinh học&rdquo; sẽ tiếp th&ecirc;m sức mạnh v&agrave; &yacute; ch&iacute; cho đội ngũ tuyến đầu trong c&ocirc;ng t&aacute;c ph&ograve;ng chống dịch. Bệnh viện Nhi Đồng Th&agrave;nh phố đảm bảo m&ocirc;i trường an to&agrave;n cho qu&yacute; th&acirc;n nh&acirc;n bệnh nh&acirc;n đến thăm kh&aacute;m cũng như g&oacute;p phần bảo vệ, chăm s&oacute;c v&agrave; n&acirc;ng cao sức khỏe người d&acirc;n trong giai đoạn hiện nay.</span></p>', 4, CAST(N'2021-06-21T19:02:46.510' AS DateTime), NULL, 1, 1)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (35, N'31032021-3-1.png', N'Lo âu chia tay và rối loạn lo âu chia tay ở trẻ em', 10006, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Trong khoảng thời gian thơ ấu, việc cảm thấy lo lắng khi n&oacute;i lời tạm biệt với ba mẹ l&agrave; tiến tr&igrave;nh tự nhi&ecirc;n của trẻ. C&aacute;c dấu hiệu kh&oacute;c l&oacute;c, c&aacute;u kỉnh hoặc đeo b&aacute;m l&agrave; những phản ứng l&agrave;nh mạnh đối với sự chia ly cũng như biểu hiện một giai đoạn ph&aacute;t triển b&igrave;nh thường. Phản ứng n&agrave;y c&oacute; thể xuất hiện trước sinh nhật đầu ti&ecirc;n của con v&agrave; k&eacute;o d&agrave;i đến khi trẻ 4 tuổi. Mặc d&ugrave; cường độ v&agrave; thời gian của lo &acirc;u chia ly c&oacute; thể rất kh&aacute;c nhau ở từng trẻ, nhưng với sự hiểu biết v&agrave; c&aacute;c chiến lược ứng ph&oacute; đ&uacute;ng đắn, nỗi sợ h&atilde;i của trẻ c&oacute; thể được xoa dịu v&agrave; sẽ biến mất ho&agrave;n to&agrave;n khi con lớn hơn. Tuy nhi&ecirc;n, ngay cả khi ba mẹ cố gắng hết sức, một số trẻ vẫn trải qua nỗi lo lắng qu&aacute; mức về sự chia ly trong suốt những năm học tiểu học hoặc về sau. Nếu lo &acirc;u chia ly diễn ra một c&aacute;ch li&ecirc;n tục hoặc t&aacute;i diễn theo th&aacute;ng v&agrave; cản trở c&aacute;c hoạt động b&igrave;nh thường như học tập hay vui chơi c&ugrave;ng bạn b&egrave;, đ&oacute; c&oacute; thể l&agrave; dấu hiệu của rối loạn lo &acirc;u chia ly.</span></p>', 3, CAST(N'2021-06-21T19:11:56.980' AS DateTime), NULL, 1, 1)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (36, N'01042021-1320x880.jpg', N'Vai trò của cha mẹ trong việc nuôi dạy trẻ', 10006, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Từ việc khuyến kh&iacute;ch con học tập ở trường v&agrave; tổ chức cho trẻ c&aacute;c hoạt động vui chơi v&agrave; thể thao, cha mẹ c&ograve;n l&agrave; h&igrave;nh mẫu cho trẻ noi theo (con l&agrave;m theo những điều cha mẹ l&agrave;m, kh&ocirc;ng phải như cha mẹ n&oacute;i), cha mẹ l&agrave; những người sẽ ảnh hưởng lớn đến sự h&igrave;nh th&agrave;nh v&agrave; ph&aacute;t triển nh&acirc;n c&aacute;ch của con c&aacute;i. Tuy nhi&ecirc;n, cha mẹ kh&ocirc;ng phải l&agrave; những người c&oacute; ảnh hưởng trực tiếp duy nhất &mdash; đặc biệt l&agrave; sau khi trẻ bắt đầu đến trường học v&agrave; tương t&aacute;c với thế giới rộng lớn b&ecirc;n ngo&agrave;i.</span></p>
<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Hầu hết c&aacute;c bậc cha mẹ đều nỗ lực để tạo cho trẻ một khởi đầu tốt nhất c&oacute; thể, nhưng điều quan trọng, cha mẹ cần nhận thức được rằng trẻ sẽ bước v&agrave;o thế giới bằng ch&iacute;nh khả năng, t&iacute;nh c&aacute;ch v&agrave; với mục ti&ecirc;u c&aacute; nh&acirc;n. Mặc d&ugrave; cha mẹ c&oacute; thể muốn con m&igrave;nh đi theo con đường m&agrave; ch&iacute;nh cha mẹ đ&atilde; chọn, tuy nhi&ecirc;n cha mẹ h&atilde;y l&agrave; người cung cấp một giao diện về thế giới để trang bị cho trẻ sự độc lập v&agrave; khả năng theo đuổi ước mơ của m&igrave;nh</span></p>', 3, CAST(N'2021-06-21T19:13:28.160' AS DateTime), NULL, 1, 0)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (37, N'18062021-1024x768.png', N'Cứu sống một trường hợp Methemoglobine máu nặng', 10006, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Ng&agrave;y 17/6/2021, Khoa Hồi sức cấp cứu Bệnh viện Nhi Đồng Th&agrave;nh Phố nhận một trường hợp em L. H. 15 tuổi, nam, ngụ ở Giồng Riềng, Ki&ecirc;n Giang do bệnh viện tuyến trước chuyển đến trong t&igrave;nh trạng t&iacute;m m&ocirc;i, t&iacute;m tay ch&acirc;n to&agrave;n th&acirc;n, mệt. Khai th&aacute;c bệnh sử, ghi nhận em bị Cha la v&igrave; ham chơi game vi t&iacute;nh, kh&ocirc;ng lo học để thi l&ecirc;n lớp 10, n&ecirc;n uống 1 nắp thuốc trừ cỏ&nbsp; hiệu Cantanil, hoạt chất l&agrave; propanil v&agrave; butachlor.</span></p>', 4, CAST(N'2021-07-03T23:20:11.277' AS DateTime), CAST(N'2021-07-03T23:20:11.273' AS DateTime), 0, 0)
INSERT [dbo].[tblBlog] ([BlogID], [Thumbnail], [Title], [AuthorID], [Description], [CategoryID], [CreatedDate], [UpdatedDate], [StatusID], [OnSlider]) VALUES (38, N'5k-1-1024x436.jpg', N'Bệnh viện Nhi Đồng Thành Phố vẫn luôn an toàn cho bạn và cho các bé', 10007, N'<p><span style="color: #444444; font-family: Nunito, sans-serif; font-size: 16px; background-color: #ffffff;">Hiện tại, c&aacute;c khoa bệnh nội tr&uacute; vẫn hoat động điều trị b&igrave;nh thường, bảo vệ gi&atilde;n c&aacute;ch v&agrave; tiếp tục tu&acirc;n thủ 5K nghi&ecirc;m ngặt tối đa. Khoa Kh&aacute;m bệnh vẫn tiếp nhận v&agrave; ph&acirc;n luồng bệnh nhi, qu&yacute; kh&aacute;ch h&agrave;ng đến kh&aacute;m một c&aacute;ch an to&agrave;n, an t&acirc;m nhất cho qu&yacute; vị. Qu&yacute; bệnh nhi th&acirc;n nh&acirc;n b&igrave;nh tĩnh đ&oacute;n nhận th&ocirc;ng b&aacute;o sớm nhất từ b&aacute;o ch&iacute; ch&iacute;nh thống, k&ecirc;nh fanpage v&agrave; website ch&iacute;nh thức của Bệnh Viện.</span></p>', 4, CAST(N'2021-07-05T09:51:29.230' AS DateTime), CAST(N'2021-07-05T09:51:29.227' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[tblBlog] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBlogCategory] ON 

INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (1, N'Giới thiệu')
INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (2, N'Hướng dẫn')
INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (3, N'Sức khỏe')
INSERT [dbo].[tblBlogCategory] ([CategoryID], [CategoryName]) VALUES (4, N'Tin tức')
SET IDENTITY_INSERT [dbo].[tblBlogCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblCustomer] ON 

INSERT [dbo].[tblCustomer] ([CustomerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [PhoneNumber]) VALUES (500002, 10004, CAST(N'2021-06-08T07:56:00.000' AS DateTime), NULL, N'Lê Hoàng Khôi', N'467/10 Điện Biên Phủ', CAST(N'2021-06-08' AS Date), N'012345678912', N'0931155350')
INSERT [dbo].[tblCustomer] ([CustomerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [PhoneNumber]) VALUES (500004, 10013, CAST(N'2021-06-23T23:37:00.000' AS DateTime), NULL, N'Nguyễn Võ Bảo Nguyên', N'50/30/14 Dương Quảng Hàm, Phường 5, Quận Gò Vấp', CAST(N'2000-06-25' AS Date), N'079201030078', N'0899156326')
INSERT [dbo].[tblCustomer] ([CustomerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [PhoneNumber]) VALUES (500005, 10014, CAST(N'2021-06-24T10:55:00.000' AS DateTime), NULL, N'Trần Lê Hải Vy', N'50/30/14 Dương Quảng Hàm, Phường 5, Quận Gò Vấp', CAST(N'2000-12-25' AS Date), N'079201030070', N'0899156326')
SET IDENTITY_INSERT [dbo].[tblCustomer] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFeedback] ON 

INSERT [dbo].[tblFeedback] ([FeedbackID], [ServiceID], [CustomerID], [Comment], [Rate], [ReservationID]) VALUES (1, 6, 500004, N'abv', 5, 18)
INSERT [dbo].[tblFeedback] ([FeedbackID], [ServiceID], [CustomerID], [Comment], [Rate], [ReservationID]) VALUES (2, 6, 500002, N'Dịch vụ khá tốt.', 4, 12)
INSERT [dbo].[tblFeedback] ([FeedbackID], [ServiceID], [CustomerID], [Comment], [Rate], [ReservationID]) VALUES (3, 6, 500002, N'Thủ tục còn chậm chạp.', 2, 11)
INSERT [dbo].[tblFeedback] ([FeedbackID], [ServiceID], [CustomerID], [Comment], [Rate], [ReservationID]) VALUES (4, 6, 500002, N'Tạm ổn,', 3, 10)
SET IDENTITY_INSERT [dbo].[tblFeedback] OFF
GO
SET IDENTITY_INSERT [dbo].[tblIdentity] ON 

INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10004, N'50d1fae90738dedf2ba244b14e2ad3fe6ede0c3d8afd1ef3ef432ff09c2687b7', CAST(N'2021-06-08' AS Date), NULL, 1, N'nguyenhoang01012001@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10006, N'50d1fae90738dedf2ba244b14e2ad3fe6ede0c3d8afd1ef3ef432ff09c2687b7', CAST(N'2021-06-08' AS Date), NULL, 2, N'minhle@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10007, N'3353ad5d8df7d36fddb97c763357b488a50bc4a7d0b32bd8c5d8212cd80dc6ea', CAST(N'2021-06-21' AS Date), NULL, 2, N'nguyena@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10008, N'1bdd2861ae8a233b5f97961f0ed7cea5fe4126a7d0d121998b7c4baff3aafd77', CAST(N'2021-06-21' AS Date), NULL, 2, N'nguyenb@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10009, N'48ec664f036757868fbc5a06ffcab37f76df76503dfff68ef128cc139174f758', CAST(N'2021-06-21' AS Date), NULL, 2, N'nguyenc@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10010, N'76bbd654ecf9655d8ebdf07e3862535d275e699b91e09e7f1e90a78ceb662f7c', CAST(N'2021-06-21' AS Date), NULL, 2, N'nguyend@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10013, N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2021-06-23' AS Date), NULL, 1, N'nguyenseraph2625@outlook.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10014, N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2021-06-24' AS Date), NULL, 1, N'haivy009@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10015, N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2021-06-24' AS Date), NULL, 3, N'nguyenseraph2625@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10016, N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2021-06-24' AS Date), NULL, 2, N'abc@abc', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10017, N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2021-06-30' AS Date), NULL, 4, N'nguyennvbse150944@fpt.edu.vn', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10018, N'50d1fae90738dedf2ba244b14e2ad3fe6ede0c3d8afd1ef3ef432ff09c2687b7', CAST(N'2021-07-02' AS Date), NULL, 3, N'khoilhse150854@gmail.com', 1)
INSERT [dbo].[tblIdentity] ([IdentityID], [Password], [CreatedDate], [UpdatedDate], [RoleID], [Email], [StatusID]) VALUES (10019, N'50d1fae90738dedf2ba244b14e2ad3fe6ede0c3d8afd1ef3ef432ff09c2687b7', CAST(N'2021-07-02' AS Date), NULL, 4, N'khoile@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[tblIdentity] OFF
GO
SET IDENTITY_INSERT [dbo].[tblManager] ON 

INSERT [dbo].[tblManager] ([ManagerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (300000, 10015, CAST(N'2021-06-24T11:20:43.837' AS DateTime), NULL, N'Nguyễn Võ Bảo Nguyên', N'0899156326', N'50/30/14 Dương Quảng Hàm, Phường 5, Quận Gò Vấp', CAST(N'2000-06-26' AS Date), N'079201030078')
INSERT [dbo].[tblManager] ([ManagerID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [PhoneNumber], [Address], [Birthday], [CitizenID]) VALUES (300001, 10018, CAST(N'2021-07-02T21:30:31.177' AS DateTime), NULL, N'Lê Hoàng Khôi', N'09311553987', N'467 Điện Biên Phủ', CAST(N'2001-05-24' AS Date), N'012345678912')
SET IDENTITY_INSERT [dbo].[tblManager] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOpenTime] ON 

INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (1, CAST(N'08:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (2, CAST(N'09:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (3, CAST(N'10:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (4, CAST(N'11:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (5, CAST(N'14:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (6, CAST(N'15:00:00' AS Time))
INSERT [dbo].[tblOpenTime] ([OpenTimeID], [OpenTime]) VALUES (7, CAST(N'16:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[tblOpenTime] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPatient] ON 

INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (17, N'Nguyễn Thị Bảo Trân', 1, 500002, CAST(N'2021-06-19' AS Date), NULL, CAST(N'2012-08-16' AS Date), 1)
INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (18, N'Lê Anh Tài', 0, 500002, CAST(N'2021-06-19' AS Date), NULL, CAST(N'2010-02-10' AS Date), 1)
INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (19, N'Nguyễn Võ Bảo Nguyên', 0, 500002, CAST(N'2021-06-19' AS Date), NULL, CAST(N'2013-05-17' AS Date), 1)
INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (20, N'Minh Trang', 1, 500002, CAST(N'2021-06-20' AS Date), NULL, CAST(N'2016-12-31' AS Date), 2)
INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (23, N'Bảo Nguyên', 0, 500004, CAST(N'2021-06-23' AS Date), NULL, CAST(N'2004-09-05' AS Date), 1)
INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (24, N'Hải Vy', 1, 500004, CAST(N'2021-06-23' AS Date), NULL, CAST(N'2004-10-05' AS Date), 1)
INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (25, N'BasketBall', 0, 500004, CAST(N'2021-06-30' AS Date), NULL, CAST(N'2021-11-04' AS Date), 2)
INSERT [dbo].[tblPatient] ([PatientID], [PatientName], [Gender], [CustomerID], [CreatedDate], [UpdatedDate], [Birthday], [StatusID]) VALUES (26, N'BasketBall', 1, 500004, CAST(N'2021-07-01' AS Date), NULL, CAST(N'2021-02-12' AS Date), 2)
SET IDENTITY_INSERT [dbo].[tblPatient] OFF
GO
SET IDENTITY_INSERT [dbo].[tblReservation] ON 

INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (10, 500002, 17, 6, 200002, 1, CAST(N'2021-06-21T08:00:00' AS SmallDateTime), CAST(N'2021-06-21T13:20:00' AS SmallDateTime), CAST(N'2021-06-21T13:20:00.000' AS DateTime), 150)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (11, 500002, 18, 6, 200003, 1, CAST(N'2021-06-21T08:00:00' AS SmallDateTime), CAST(N'2021-06-21T13:26:00' AS SmallDateTime), CAST(N'2021-06-21T13:26:00.000' AS DateTime), 150)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (12, 500002, 19, 6, 200002, 4, CAST(N'2021-06-21T11:00:00' AS SmallDateTime), CAST(N'2021-06-21T13:30:00' AS SmallDateTime), CAST(N'2021-06-21T13:30:00.000' AS DateTime), 150)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (13, 500004, 23, 6, 200003, 4, CAST(N'2021-06-24T08:00:00' AS SmallDateTime), CAST(N'2021-06-23T23:56:00' AS SmallDateTime), CAST(N'2021-06-23T23:56:00.000' AS DateTime), 150)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (14, 500004, 24, 6, 200002, 4, CAST(N'2021-06-25T11:00:00' AS SmallDateTime), CAST(N'2021-06-23T23:58:00' AS SmallDateTime), CAST(N'2021-06-23T23:58:00.000' AS DateTime), 150)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (15, 500004, 24, 6, 200002, 2, CAST(N'2021-06-29T09:00:00' AS SmallDateTime), CAST(N'2021-06-24T10:33:00' AS SmallDateTime), CAST(N'2021-06-24T10:33:00.000' AS DateTime), 150)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (16, 500004, 23, 8, 200004, 7, CAST(N'2021-07-08T16:00:00' AS SmallDateTime), CAST(N'2021-06-24T10:34:00' AS SmallDateTime), CAST(N'2021-06-24T10:34:00.000' AS DateTime), 70)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (17, 500004, 24, 6, 200002, 3, CAST(N'2021-07-29T10:00:00' AS SmallDateTime), CAST(N'2021-06-24T10:34:00' AS SmallDateTime), CAST(N'2021-06-24T10:34:00.000' AS DateTime), 150)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (18, 500004, 23, 6, 200002, 2, CAST(N'2021-06-25T09:00:00' AS SmallDateTime), CAST(N'2021-06-24T11:46:00' AS SmallDateTime), CAST(N'2021-06-24T11:46:00.000' AS DateTime), 150)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (19, 500004, 23, 8, 200004, 4, CAST(N'2021-07-01T11:00:00' AS SmallDateTime), CAST(N'2021-06-30T12:13:00' AS SmallDateTime), CAST(N'2021-06-30T12:13:11.357' AS DateTime), 70)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (20, 500004, 23, 9, 200005, 3, CAST(N'2021-07-02T10:00:00' AS SmallDateTime), CAST(N'2021-07-01T22:18:00' AS SmallDateTime), CAST(N'2021-07-01T22:18:12.580' AS DateTime), 100)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (21, 500002, 19, 9, 200005, 4, CAST(N'2021-07-03T11:00:00' AS SmallDateTime), CAST(N'2021-07-02T21:42:00' AS SmallDateTime), CAST(N'2021-07-02T21:42:08.763' AS DateTime), 100)
INSERT [dbo].[tblReservation] ([ReservationID], [CustomerID], [PatientID], [ServiceID], [StaffAssignedID], [IntervalTimeID], [CheckInTime], [CreatedDate], [UpdatedDate], [Price]) VALUES (22, 500002, 19, 6, 200002, 1, CAST(N'2021-07-10T08:00:00' AS SmallDateTime), CAST(N'2021-07-06T19:48:00' AS SmallDateTime), CAST(N'2021-07-06T19:48:06.820' AS DateTime), 155)
SET IDENTITY_INSERT [dbo].[tblReservation] OFF
GO
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (1, N'Khách hàng')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (2, N'Nhân viên')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (3, N'Quản lí')
INSERT [dbo].[tblRole] ([RoleID], [RoleName]) VALUES (4, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[tblService] ON 

INSERT [dbo].[tblService] ([ServiceID], [ServiceName], [SpecialtyID], [Thumbnail], [Description], [Price], [StatusID], [CreatedDate], [UpdatedDate], [CreatedPersonID]) VALUES (6, N'Khám Tai mũi họng', 1, N'service1.jpg', N'<p>Kh&aacute;m tai- mũi- họng cho trẻ em.</p>', 155, 1, CAST(N'2021-06-18' AS Date), NULL, 10006)
INSERT [dbo].[tblService] ([ServiceID], [ServiceName], [SpecialtyID], [Thumbnail], [Description], [Price], [StatusID], [CreatedDate], [UpdatedDate], [CreatedPersonID]) VALUES (8, N'Tư vấn dinh dưỡng', 6, N'service2.jpg', N'<p>Tư vấn dinh dưỡng cho trẻ em.</p>', 70, 1, CAST(N'2021-06-18' AS Date), NULL, 10006)
INSERT [dbo].[tblService] ([ServiceID], [ServiceName], [SpecialtyID], [Thumbnail], [Description], [Price], [StatusID], [CreatedDate], [UpdatedDate], [CreatedPersonID]) VALUES (9, N'Khám đường hô hấp', 7, N'service3.jpg', N'<p>Kh&aacute;m đường h&ocirc; hấp.</p>', 100, 1, CAST(N'2021-06-18' AS Date), NULL, 10006)
INSERT [dbo].[tblService] ([ServiceID], [ServiceName], [SpecialtyID], [Thumbnail], [Description], [Price], [StatusID], [CreatedDate], [UpdatedDate], [CreatedPersonID]) VALUES (13, N'Khám mắt', 2, N'kham_mt_cho_tr_tim_nguyen_nhan_tic_mt_thai_qua__tr.png', N'<p>Kh&aacute;m mắt cho trẻ em.</p>', 65, 0, CAST(N'2021-07-05' AS Date), CAST(N'2021-07-05' AS Date), 10007)
SET IDENTITY_INSERT [dbo].[tblService] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSpecialty] ON 

INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (1, N'Tai-Mũi-Họng')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (2, N'Mắt')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (3, N'Ngoại')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (4, N'Nội thần kinh')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (5, N'Ngoại thần kinh')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (6, N'Dinh dưỡng')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (7, N'Hô hấp')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (8, N'Huyết học')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (9, N'Tiêu hóa')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (10, N'Tim mạch')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (11, N'Thận-Nội tiết')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (12, N'Da liễu')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (13, N'Dị ứng')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (14, N'Sơ sinh')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (15, N'Răng-Hàm mặt')
INSERT [dbo].[tblSpecialty] ([SpecialtyID], [SpecialtyName]) VALUES (16, N'Tiêm chủng')
SET IDENTITY_INSERT [dbo].[tblSpecialty] OFF
GO
SET IDENTITY_INSERT [dbo].[tblStaff] ON 

INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200002, 10006, CAST(N'2021-06-08' AS Date), NULL, N'Minh Hoang', N'152/11 Nguyen Thi Tan', CAST(N'2021-06-08' AS Date), N'012345678913', 1, N'0931155351')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200003, 10007, CAST(N'2021-06-21' AS Date), NULL, N'Nguyễn Văn A', N'152/11 Nguyen Thi Tan', CAST(N'1994-06-22' AS Date), N'012345678914', 1, N'0901122321')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200004, 10008, CAST(N'2021-06-21' AS Date), NULL, N'Nguyễn Văn B', N'152/11 Nguyen Thi Tan', CAST(N'1994-04-21' AS Date), N'012345678915', 6, N'0901122322')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200005, 10009, CAST(N'2021-06-21' AS Date), NULL, N'Nguyễn Văn C', N'152/11 Nguyen Thi Tan', CAST(N'1991-02-22' AS Date), N'012345678916', 7, N'0901122323')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200006, 10010, CAST(N'2021-06-21' AS Date), NULL, N'Nguyễn Văn D', N'152/11 Nguyen Thi Tan', CAST(N'1993-02-03' AS Date), N'012345678917', 6, N'0901122328')
INSERT [dbo].[tblStaff] ([StaffID], [IdentityID], [CreatedDate], [UpdatedDate], [FullName], [Address], [Birthday], [CitizenID], [SpecialtyID], [PhoneNumber]) VALUES (200008, 10016, CAST(N'2021-06-24' AS Date), NULL, N'sad45as4', N'sadasasdqw', CAST(N'1998-05-04' AS Date), N'079201030078', 1, N'0899156326')
SET IDENTITY_INSERT [dbo].[tblStaff] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSystemSetting] ON 

INSERT [dbo].[tblSystemSetting] ([SettingId], [SettingName], [SettingValue], [AdminID], [CreatedDate], [UpdatedDate]) VALUES (3, N'Max Blog Post On Homepage', N'3', 400000, CAST(N'2021-06-30' AS Date), CAST(N'2021-06-30' AS Date))
INSERT [dbo].[tblSystemSetting] ([SettingId], [SettingName], [SettingValue], [AdminID], [CreatedDate], [UpdatedDate]) VALUES (4, N'Max Service Post On Homepage', N'3', 400000, CAST(N'2021-06-30' AS Date), CAST(N'2021-06-30' AS Date))
INSERT [dbo].[tblSystemSetting] ([SettingId], [SettingName], [SettingValue], [AdminID], [CreatedDate], [UpdatedDate]) VALUES (6, N'Max Patient Profile', N'4', 400000, CAST(N'2021-06-30' AS Date), CAST(N'2021-06-30' AS Date))
SET IDENTITY_INSERT [dbo].[tblSystemSetting] OFF
GO
ALTER TABLE [dbo].[tblAdmin] ADD  CONSTRAINT [DF__tblAdmin__Create__49C3F6B7]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblBlog] ADD  CONSTRAINT [DF__tblBlog__Created__571DF1D5]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblBlog] ADD  CONSTRAINT [DF_tblBlog_OnSlider]  DEFAULT ((0)) FOR [OnSlider]
GO
ALTER TABLE [dbo].[tblCustomer] ADD  CONSTRAINT [DF__tblCustom__Creat__5441852A]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblIdentity] ADD  CONSTRAINT [DF__tblIdenti__Creat__398D8EEE]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblIdentity] ADD  CONSTRAINT [DF_tblIdentity_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[tblManager] ADD  CONSTRAINT [DF__tblManage__Creat__45F365D3]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblMedicalExamination] ADD  CONSTRAINT [DF__tblMedica__Creat__17036CC0]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblPatient] ADD  CONSTRAINT [DF__tblPatien__Creat__73BA3083]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblPatient] ADD  CONSTRAINT [DF_tblPatient_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[tblReservation] ADD  CONSTRAINT [DF_tblReservation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblReservation] ADD  CONSTRAINT [DF_tblReservation_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[tblService] ADD  CONSTRAINT [DF_tblService_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblStaff] ADD  CONSTRAINT [DF__tblStaff__Create__7E37BEF6]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblAdmin]  WITH CHECK ADD  CONSTRAINT [FK__tblAdmin__Identi__48CFD27E] FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblAdmin] CHECK CONSTRAINT [FK__tblAdmin__Identi__48CFD27E]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK__tblBlog__Categor__02FC7413] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblBlogCategory] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK__tblBlog__Categor__02FC7413]
GO
ALTER TABLE [dbo].[tblBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblBlog_tblIdentity] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
GO
ALTER TABLE [dbo].[tblBlog] CHECK CONSTRAINT [FK_tblBlog_tblIdentity]
GO
ALTER TABLE [dbo].[tblCustomer]  WITH CHECK ADD  CONSTRAINT [FK__tblCustom__Ident__534D60F1] FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblCustomer] CHECK CONSTRAINT [FK__tblCustom__Ident__534D60F1]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__Custo__0B91BA14] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK__tblFeedba__Custo__0B91BA14]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__Reser__16CE6296] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[tblReservation] ([ReservationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK__tblFeedba__Reser__16CE6296]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK__tblFeedba__Servi__0A9D95DB] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[tblService] ([ServiceID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK__tblFeedba__Servi__0A9D95DB]
GO
ALTER TABLE [dbo].[tblIdentity]  WITH CHECK ADD  CONSTRAINT [FK__tblIdenti__RoleI__3A81B327] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblRole] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblIdentity] CHECK CONSTRAINT [FK__tblIdenti__RoleI__3A81B327]
GO
ALTER TABLE [dbo].[tblManager]  WITH CHECK ADD  CONSTRAINT [FK__tblManage__Ident__44FF419A] FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblManager] CHECK CONSTRAINT [FK__tblManage__Ident__44FF419A]
GO
ALTER TABLE [dbo].[tblMedicalExamination]  WITH CHECK ADD  CONSTRAINT [FK__tblMedica__Reser__151B244E] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[tblReservation] ([ReservationID])
GO
ALTER TABLE [dbo].[tblMedicalExamination] CHECK CONSTRAINT [FK__tblMedica__Reser__151B244E]
GO
ALTER TABLE [dbo].[tblMedicalExamination]  WITH CHECK ADD  CONSTRAINT [FK__tblMedica__Servi__160F4887] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[tblService] ([ServiceID])
GO
ALTER TABLE [dbo].[tblMedicalExamination] CHECK CONSTRAINT [FK__tblMedica__Servi__160F4887]
GO
ALTER TABLE [dbo].[tblPatient]  WITH CHECK ADD  CONSTRAINT [FK__tblPatien__Custo__72C60C4A] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblPatient] CHECK CONSTRAINT [FK__tblPatien__Custo__72C60C4A]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK__tblReserv__Inter__41B8C09B] FOREIGN KEY([IntervalTimeID])
REFERENCES [dbo].[tblOpenTime] ([OpenTimeID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK__tblReserv__Inter__41B8C09B]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK__tblReserv__Staff__114A936A] FOREIGN KEY([StaffAssignedID])
REFERENCES [dbo].[tblStaff] ([StaffID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK__tblReserv__Staff__114A936A]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK_tblReservation_tblCustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tblCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK_tblReservation_tblCustomer]
GO
ALTER TABLE [dbo].[tblReservation]  WITH CHECK ADD  CONSTRAINT [FK_tblReservation_tblPatient] FOREIGN KEY([PatientID])
REFERENCES [dbo].[tblPatient] ([PatientID])
GO
ALTER TABLE [dbo].[tblReservation] CHECK CONSTRAINT [FK_tblReservation_tblPatient]
GO
ALTER TABLE [dbo].[tblService]  WITH CHECK ADD  CONSTRAINT [FK__tblServic__Speci__07C12930] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[tblSpecialty] ([SpecialtyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblService] CHECK CONSTRAINT [FK__tblServic__Speci__07C12930]
GO
ALTER TABLE [dbo].[tblService]  WITH CHECK ADD  CONSTRAINT [FK_tblService_tblIdentity] FOREIGN KEY([CreatedPersonID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
GO
ALTER TABLE [dbo].[tblService] CHECK CONSTRAINT [FK_tblService_tblIdentity]
GO
ALTER TABLE [dbo].[tblStaff]  WITH CHECK ADD  CONSTRAINT [FK__tblStaff__Identi__7D439ABD] FOREIGN KEY([IdentityID])
REFERENCES [dbo].[tblIdentity] ([IdentityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblStaff] CHECK CONSTRAINT [FK__tblStaff__Identi__7D439ABD]
GO
ALTER TABLE [dbo].[tblStaff]  WITH CHECK ADD  CONSTRAINT [FK__tblStaff__Specia__7F2BE32F] FOREIGN KEY([SpecialtyID])
REFERENCES [dbo].[tblSpecialty] ([SpecialtyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblStaff] CHECK CONSTRAINT [FK__tblStaff__Specia__7F2BE32F]
GO
ALTER TABLE [dbo].[tblSystemSetting]  WITH CHECK ADD  CONSTRAINT [FK__tblSystem__Admin__628FA481] FOREIGN KEY([AdminID])
REFERENCES [dbo].[tblAdmin] ([AdminID])
GO
ALTER TABLE [dbo].[tblSystemSetting] CHECK CONSTRAINT [FK__tblSystem__Admin__628FA481]
GO
USE [master]
GO
ALTER DATABASE [ChildCareSystem] SET  READ_WRITE 
GO
