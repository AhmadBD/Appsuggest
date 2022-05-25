USE [master]
GO
/****** Object:  Database [appsuggest]    Script Date: 5/25/2022 10:53:50 AM ******/
CREATE DATABASE [appsuggest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'appsuggest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\appsuggest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'appsuggest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\appsuggest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [appsuggest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [appsuggest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [appsuggest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [appsuggest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [appsuggest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [appsuggest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [appsuggest] SET ARITHABORT OFF 
GO
ALTER DATABASE [appsuggest] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [appsuggest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [appsuggest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [appsuggest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [appsuggest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [appsuggest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [appsuggest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [appsuggest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [appsuggest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [appsuggest] SET  ENABLE_BROKER 
GO
ALTER DATABASE [appsuggest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [appsuggest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [appsuggest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [appsuggest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [appsuggest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [appsuggest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [appsuggest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [appsuggest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [appsuggest] SET  MULTI_USER 
GO
ALTER DATABASE [appsuggest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [appsuggest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [appsuggest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [appsuggest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [appsuggest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [appsuggest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [appsuggest] SET QUERY_STORE = OFF
GO
USE [appsuggest]
GO
/****** Object:  Table [dbo].[AppPlatforms]    Script Date: 5/25/2022 10:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppPlatforms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apps]    Script Date: 5/25/2022 10:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apps](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Link] [varchar](max) NOT NULL,
	[LogoLink] [varchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Tags] [nvarchar](max) NULL,
	[Version] [varchar](20) NOT NULL,
	[CreationDateTime] [datetime2](7) NOT NULL,
	[UpdateDateTime] [datetime2](7) NOT NULL,
	[AppTypeId] [int] NOT NULL,
	[ProviderId] [int] NOT NULL,
	[AppPlatformId] [int] NOT NULL,
 CONSTRAINT [PK__Apps__3214EC07B5D636C2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppTypes]    Script Date: 5/25/2022 10:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 5/25/2022 10:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Name] [varchar](50) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 5/25/2022 10:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Link] [varchar](max) NOT NULL,
	[AppId] [int] NOT NULL,
 CONSTRAINT [PK__Images__3214EC07768BB93B] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 5/25/2022 10:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[HomePageLink] [varchar](max) NULL,
	[LogoLink] [varchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 5/25/2022 10:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[UserId] [int] NOT NULL,
	[AppId] [int] NOT NULL,
	[Rate] [int] NOT NULL,
	[ReviewText] [nvarchar](max) NULL,
	[AppVersion] [varchar](20) NOT NULL,
	[CreationDateTime] [datetime2](7) NOT NULL,
	[UpdateDateTime] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[AppId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/25/2022 10:53:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [char](15) NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK__Users__3214EC07F4E2EE1E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AppPlatforms] ON 

INSERT [dbo].[AppPlatforms] ([Id], [Name]) VALUES (1, N'Android')
INSERT [dbo].[AppPlatforms] ([Id], [Name]) VALUES (2, N'IOS')
INSERT [dbo].[AppPlatforms] ([Id], [Name]) VALUES (5, N'Linux')
INSERT [dbo].[AppPlatforms] ([Id], [Name]) VALUES (3, N'Mac OS')
INSERT [dbo].[AppPlatforms] ([Id], [Name]) VALUES (6, N'Web')
INSERT [dbo].[AppPlatforms] ([Id], [Name]) VALUES (4, N'Windows')
SET IDENTITY_INSERT [dbo].[AppPlatforms] OFF
GO
SET IDENTITY_INSERT [dbo].[AppTypes] ON 

INSERT [dbo].[AppTypes] ([Id], [Name], [Description]) VALUES (3, N'Kelime İşlemciler', N' Dokümantasyon için bu uygulamalar. Bununla birlikte, bu belgeleri saklamama, biçimlendirmeme ve yazdırmama da yardımcı oluyor.')
INSERT [dbo].[AppTypes] ([Id], [Name], [Description]) VALUES (4, N'Veritabanı Yazılımı', N' Bu yazılım, bir veritabanı oluşturmak ve yönetmek için kullanılır. Veritabanı Yönetim Sistemi veya DBMS olarak da bilinir. Verilerin organizasyonuna yardımcı olurlar. ')
INSERT [dbo].[AppTypes] ([Id], [Name], [Description]) VALUES (5, N'Multimedya Yazılımı', N'Görüntü, ses veya video dosyalarını oynatabilen, oluşturabilen veya kaydedebilen yazılımdır. Video düzenleme, animasyon, grafik ve görüntü düzenleme için kullanılırlar.')
INSERT [dbo].[AppTypes] ([Id], [Name], [Description]) VALUES (6, N'Eğitim ve Referans Yazılımları', N'Bu tür yazılımlar, belirli bir konuda öğrenmeyi kolaylaştırmak için özel olarak tasarlanmıştır. Bu kategoriye giren çeşitli eğitim yazılımları vardır.')
INSERT [dbo].[AppTypes] ([Id], [Name], [Description]) VALUES (7, N'Grafik Yazılımı', N'Adından da anlaşılacağı gibi, Grafik Yazılımı, kullanıcının görsel verileri veya görüntüleri düzenlemesine veya değiştirmesine yardımcı olduğu için grafiklerle çalışmak üzere tasarlanmıştır. Resim editörleri ve illüstrasyon yazılımlarından oluşur.')
INSERT [dbo].[AppTypes] ([Id], [Name], [Description]) VALUES (8, N'Web Tarayıcıları', N'Bu uygulamalar internette gezinmek için kullanılır. Kullanıcının web üzerinden veri bulmasına ve almasına yardımcı olurlar.')
SET IDENTITY_INSERT [dbo].[AppTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (1, N'Microsoft', N'https://www.microsoft.com', N'https://www.microsoft.com', N'Microsoft Corporation , bilgisayar yazılımı , tüketici elektroniği , kişisel bilgisayarlar ve ilgili hizmetler üreten bir Amerikan çok uluslu teknoloji şirketidir .')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (2, N'Apple', N'https://www.apple.com', N'https://www.apple.com', N'Apple Inc. ya da eski adıyla Apple Computer Inc., merkezi Cupertino''da[5] bulunan; tüketici elektroniği, bilgisayar yazılımı ve kişisel bilgisayar tasarlayan, geliştiren ve satan Amerikan çok uluslu şirket.')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (3, N'Corel', N'https://www.corel.com', N'https://www.corel.com', N'Corel Corporation, merkezi Ottawa, Ontario''da bulunan ve grafik işleme konusunda uzmanlaşmış Kanadalı bir yazılım şirketidir. CorelDRAW gibi yazılımlar üretmesi ve AfterShot Pro, PaintShop Pro, Painter, Video Studio ve WordPerfect''i almasıyla tanınır.')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (4, N'Google', N'https://www.google.com', N'https://www.google.com', N'Google LLC , yapay zeka , [10] arama motoru , çevrimiçi reklamcılık , bulut bilişim , bilgisayar yazılımı , kuantum bilişim , e-ticaret ve tüketici elektroniğine odaklanan çok uluslu bir Amerikan teknoloji şirketidir . ')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (5, N'Adobe', N'https://www.adobe.com', N'https://www.adobe.com', N'Adobe, Inc. (ya da eski adıyla Adobe Systems Incorporated; adobe, İngilizcede kerpiç anlamına geliyor) ABD merkezli, Kaliforniya bulunan, Dünya''nın 10 büyük grafik ve medya yazılımlarını üreten şirkettir.')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (6, N'VideoLAN', N'https://www.videolan.org/', N'https://www.videolan.org/', N'VideoLAN kar amacı gütmeyen bir kuruluştur, VideoLAN projesinin bir parçası olan bir komitesi ve üyeleri vardır.')
SET IDENTITY_INSERT [dbo].[Providers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__AppPlatf__737584F663C47135]    Script Date: 5/25/2022 10:53:50 AM ******/
ALTER TABLE [dbo].[AppPlatforms] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Apps__737584F64D9E5585]    Script Date: 5/25/2022 10:53:50 AM ******/
ALTER TABLE [dbo].[Apps] ADD  CONSTRAINT [UQ__Apps__737584F64D9E5585] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Provider__737584F6FD1C8BC5]    Script Date: 5/25/2022 10:53:50 AM ******/
ALTER TABLE [dbo].[Providers] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534AB69E540]    Script Date: 5/25/2022 10:53:50 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__A9D10534AB69E540] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apps] ADD  CONSTRAINT [DF__Apps__CreationDa__33D4B598]  DEFAULT (getdate()) FOR [CreationDateTime]
GO
ALTER TABLE [dbo].[Apps] ADD  CONSTRAINT [DF__Apps__UpdateDate__34C8D9D1]  DEFAULT (getdate()) FOR [UpdateDateTime]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [CreationDateTime]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [UpdateDateTime]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__IsAdmin__286302EC]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Apps]  WITH CHECK ADD  CONSTRAINT [FK_Apps_AppPlatforms] FOREIGN KEY([AppPlatformId])
REFERENCES [dbo].[AppPlatforms] ([Id])
GO
ALTER TABLE [dbo].[Apps] CHECK CONSTRAINT [FK_Apps_AppPlatforms]
GO
ALTER TABLE [dbo].[Apps]  WITH CHECK ADD  CONSTRAINT [FK_Apps_AppTypes] FOREIGN KEY([AppTypeId])
REFERENCES [dbo].[AppTypes] ([Id])
GO
ALTER TABLE [dbo].[Apps] CHECK CONSTRAINT [FK_Apps_AppTypes]
GO
ALTER TABLE [dbo].[Apps]  WITH CHECK ADD  CONSTRAINT [FK_Apps_Providers] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Providers] ([Id])
GO
ALTER TABLE [dbo].[Apps] CHECK CONSTRAINT [FK_Apps_Providers]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Apps] FOREIGN KEY([AppId])
REFERENCES [dbo].[Apps] ([Id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Apps]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK__Reviews__AppId__3C69FB99] FOREIGN KEY([AppId])
REFERENCES [dbo].[Apps] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK__Reviews__AppId__3C69FB99]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK__Reviews__UserId__3B75D760] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK__Reviews__UserId__3B75D760]
GO
USE [master]
GO
ALTER DATABASE [appsuggest] SET  READ_WRITE 
GO
