USE [master]
GO
/****** Object:  Database [appsuggest]    Script Date: 5/29/2022 3:00:49 PM ******/
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
/****** Object:  Table [dbo].[AppPlatforms]    Script Date: 5/29/2022 3:00:49 PM ******/
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
/****** Object:  Table [dbo].[Apps]    Script Date: 5/29/2022 3:00:49 PM ******/
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
/****** Object:  Table [dbo].[AppTypes]    Script Date: 5/29/2022 3:00:49 PM ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 5/29/2022 3:00:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 5/29/2022 3:00:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Name] [varchar](50) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 5/29/2022 3:00:49 PM ******/
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
/****** Object:  Table [dbo].[Providers]    Script Date: 5/29/2022 3:00:49 PM ******/
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
/****** Object:  Table [dbo].[Reviews]    Script Date: 5/29/2022 3:00:49 PM ******/
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
/****** Object:  Table [dbo].[States]    Script Date: 5/29/2022 3:00:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/29/2022 3:00:49 PM ******/
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
	[BirthDate] [datetime2](7) NULL,
	[CityId] [int] NULL,
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
SET IDENTITY_INSERT [dbo].[Apps] ON 

INSERT [dbo].[Apps] ([Id], [Name], [Link], [LogoLink], [Description], [Tags], [Version], [CreationDateTime], [UpdateDateTime], [AppTypeId], [ProviderId], [AppPlatformId]) VALUES (1, N'Microsoft Word', N'https://www.microsoft.com/en-ww/microsoft-365/word', N'https://iili.io/XEJ7pa.png', N'Microsoft Word , Microsoft tarafından geliştirilen bir kelime işlemci yazılımıdır . İlk olarak 25 Ekim 1983''te [6] Xenix sistemleri için Multi-Tool Word adı altında piyasaya sürüldü. [7] [8] [9] Sonraki sürümler daha sonra diğer birkaç platform için yazılmıştır: DOS çalıştıran IBM PC''ler (1983), Classic Mac OS çalıştıran Apple Macintosh (1985), AT&T UNIX PC (1985), Atari ST (1988 ), OS/2 (1989), Microsoft Windows (1989), SCO Unix(1990) ve macOS (2001).', N'microsoft word processor 2', N'3.0', CAST(N'2022-05-27T10:59:17.0000000' AS DateTime2), CAST(N'2022-05-29T14:10:01.7516443' AS DateTime2), 3, 1, 4)
INSERT [dbo].[Apps] ([Id], [Name], [Link], [LogoLink], [Description], [Tags], [Version], [CreationDateTime], [UpdateDateTime], [AppTypeId], [ProviderId], [AppPlatformId]) VALUES (2, N'Photoshop', N'https://www.adobe.com/photoshop', N'https://iili.io/XEJV2t.png', N'Adobe Photoshop , Adobe Inc. tarafından Windows ve macOS için geliştirilen ve yayınlanan bir raster grafik düzenleyicisidir . İlk olarak 1988 yılında Thomas ve John Knoll tarafından yaratılmıştır . O zamandan beri, yazılım yalnızca raster grafik düzenlemede değil, bir bütün olarak dijital sanatta endüstri standardı haline geldi.', N'Adobe Photoshop tasarım grafik resim', N'cc', CAST(N'2022-05-27T11:03:07.0000000' AS DateTime2), CAST(N'2022-05-27T11:36:03.2970009' AS DateTime2), 3, 2, 2)
INSERT [dbo].[Apps] ([Id], [Name], [Link], [LogoLink], [Description], [Tags], [Version], [CreationDateTime], [UpdateDateTime], [AppTypeId], [ProviderId], [AppPlatformId]) VALUES (4, N'Apple Iwork Pages', N'https://www.apple.com/iwork
', N'https://iili.io/XE3wTg.png', N'adsf', N'Apple Iwork Pages word ', N'3.00', CAST(N'2022-05-27T00:00:00.0000000' AS DateTime2), CAST(N'2022-05-27T00:00:00.0000000' AS DateTime2), 3, 4, 4)
INSERT [dbo].[Apps] ([Id], [Name], [Link], [LogoLink], [Description], [Tags], [Version], [CreationDateTime], [UpdateDateTime], [AppTypeId], [ProviderId], [AppPlatformId]) VALUES (5, N'Word Perfect', N'https://www.wordperfect.com/corel', N'https://iili.io/XEKt7S.png', N'Legendary & Comprehensive Suite. Compatible With MS Office. Buy Now! Windows 8 Compatible. 30 Day Money Back. Flexible Subscriptions. ', N'word processor corel', N'20.02', CAST(N'2022-05-27T11:40:49.0000000' AS DateTime2), CAST(N'2022-05-27T11:50:01.4645368' AS DateTime2), 3, 7, 4)
INSERT [dbo].[Apps] ([Id], [Name], [Link], [LogoLink], [Description], [Tags], [Version], [CreationDateTime], [UpdateDateTime], [AppTypeId], [ProviderId], [AppPlatformId]) VALUES (6, N'Google Docs', N'https://docs.google.com', N'https://iili.io/XEfzCJ.png', N'Create, edit, and collaborate on online documents with the Google Docs app. Work together in real time. • Share documents with your team.', N'google word processor ', N'1', CAST(N'2022-05-27T11:44:17.1371696' AS DateTime2), CAST(N'2022-05-27T11:44:17.1371696' AS DateTime2), 3, 4, 6)
INSERT [dbo].[Apps] ([Id], [Name], [Link], [LogoLink], [Description], [Tags], [Version], [CreationDateTime], [UpdateDateTime], [AppTypeId], [ProviderId], [AppPlatformId]) VALUES (7, N'Inkscape', N'https://inkscape.org', N'https://iili.io/XEfPu1.png', N'Inkscape is professional quality vector graphics software which runs on Linux, Mac OS X and Windows desktop computers.', N'Inkscape tasarım grafik resim vector', N'20.02', CAST(N'2022-05-27T11:47:55.4130506' AS DateTime2), CAST(N'2022-05-27T11:47:55.4140299' AS DateTime2), 7, 1, 4)
INSERT [dbo].[Apps] ([Id], [Name], [Link], [LogoLink], [Description], [Tags], [Version], [CreationDateTime], [UpdateDateTime], [AppTypeId], [ProviderId], [AppPlatformId]) VALUES (8, N'VLC Media Player', N'https://www.videolan.org', N'https://iili.io/XECKYl.png', N'VLC is a free and open source cross-platform multimedia player and framework that plays most multimedia files, and various streaming', N'Media player video oynatıcı', N'10.7', CAST(N'2022-05-27T11:54:24.5277393' AS DateTime2), CAST(N'2022-05-27T11:54:24.5277393' AS DateTime2), 5, 6, 4)
INSERT [dbo].[Apps] ([Id], [Name], [Link], [LogoLink], [Description], [Tags], [Version], [CreationDateTime], [UpdateDateTime], [AppTypeId], [ProviderId], [AppPlatformId]) VALUES (9, N'GCompris', N'https://gcompris.net', N'https://iili.io/XEC692.png', N'GCompris is a high quality educational software suite, including a large number of activities for children aged 2 to 10. ', N'çocuk child education ', N'3.0', CAST(N'2022-05-27T11:59:29.0000000' AS DateTime2), CAST(N'2022-05-27T12:00:34.4889389' AS DateTime2), 6, 8, 5)
INSERT [dbo].[Apps] ([Id], [Name], [Link], [LogoLink], [Description], [Tags], [Version], [CreationDateTime], [UpdateDateTime], [AppTypeId], [ProviderId], [AppPlatformId]) VALUES (10, N'kidpix', N'https://kidpix.app/', N'https://iili.io/XEnLRp.png', N'The biggest leap forward for the #1 kids drawing and painting creativity software in a decade, KID PIX 3D has everything your young artists need to tell', N'çocuk child education ', N'1', CAST(N'2022-05-27T12:06:49.1272865' AS DateTime2), CAST(N'2022-05-27T12:06:49.1272865' AS DateTime2), 6, 1, 6)
SET IDENTITY_INSERT [dbo].[Apps] OFF
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
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [StateId]) VALUES (1, N'Gaziantep', 1)
INSERT [dbo].[Cities] ([Id], [Name], [StateId]) VALUES (2, N'Mersin', 2)
INSERT [dbo].[Cities] ([Id], [Name], [StateId]) VALUES (3, N'Tarsus', 2)
INSERT [dbo].[Cities] ([Id], [Name], [StateId]) VALUES (4, N'İslahiye', 1)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
INSERT [dbo].[Config] ([Name], [Value]) VALUES (N'Hakk?nda mesaj', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porttitor leo eget lectus posuere vulputate et et quam. Phasellus ex augue, elementum ac tellus at, tempus congue nunc. ')
GO
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (1, N'Microsoft', N'https://www.microsoft.com', N'https://www.microsoft.com', N'Microsoft Corporation , bilgisayar yazılımı , tüketici elektroniği , kişisel bilgisayarlar ve ilgili hizmetler üreten bir Amerikan çok uluslu teknoloji şirketidir .')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (2, N'Apple', N'https://www.apple.com', N'https://www.apple.com', N'Apple Inc. ya da eski adıyla Apple Computer Inc., merkezi Cupertino''da[5] bulunan; tüketici elektroniği, bilgisayar yazılımı ve kişisel bilgisayar tasarlayan, geliştiren ve satan Amerikan çok uluslu şirket.')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (3, N'Corel', N'https://www.corel.com', N'https://www.corel.com', N'Corel Corporation, merkezi Ottawa, Ontario''da bulunan ve grafik işleme konusunda uzmanlaşmış Kanadalı bir yazılım şirketidir. CorelDRAW gibi yazılımlar üretmesi ve AfterShot Pro, PaintShop Pro, Painter, Video Studio ve WordPerfect''i almasıyla tanınır.')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (4, N'Google', N'https://www.google.com', N'https://www.google.com', N'Google LLC , yapay zeka , [10] arama motoru , çevrimiçi reklamcılık , bulut bilişim , bilgisayar yazılımı , kuantum bilişim , e-ticaret ve tüketici elektroniğine odaklanan çok uluslu bir Amerikan teknoloji şirketidir . ')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (5, N'Adobe', N'https://www.adobe.com', N'https://www.adobe.com', N'Adobe, Inc. (ya da eski adıyla Adobe Systems Incorporated; adobe, İngilizcede kerpiç anlamına geliyor) ABD merkezli, Kaliforniya bulunan, Dünya''nın 10 büyük grafik ve medya yazılımlarını üreten şirkettir.')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (6, N'VideoLAN', N'https://www.videolan.org/', N'https://www.videolan.org/', N'VideoLAN kar amacı gütmeyen bir kuruluştur, VideoLAN projesinin bir parçası olan bir komitesi ve üyeleri vardır.')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (7, N'Inkscape', N'https://inkscape.org', N'https://inkscape.org', N'Inkscape is Free and Open Source Software licensed under the')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (8, N' GCompris', N'https://gcompris.net', N'https://gcompris.net', N'GCompris is a high quality educational software suite, including a large number of activities for children aged 2 to 10. ')
INSERT [dbo].[Providers] ([Id], [Name], [HomePageLink], [LogoLink], [Description]) VALUES (9, N'kidpix', N'https://kidpix.app/', N'https://kidpix.app/', N'The biggest leap forward for the #1 kids drawing and painting creativity software in a decade, KID PIX 3D has everything your young artists need to tell')
SET IDENTITY_INSERT [dbo].[Providers] OFF
GO
SET IDENTITY_INSERT [dbo].[States] ON 

INSERT [dbo].[States] ([Id], [Name]) VALUES (1, N'Gaziantep')
INSERT [dbo].[States] ([Id], [Name]) VALUES (2, N'Mersin')
SET IDENTITY_INSERT [dbo].[States] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Phone], [IsAdmin], [BirthDate], [CityId]) VALUES (3, N'ahmad2135@gmail.com', N'$MYHASH$V1$10000$kmuSYEUKVmWrYhJkzKh4CfSm1oj+lbE+D/sWvgA/k2geoIXE', N'AHMAD', N'BWIDANI', NULL, 1, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Phone], [IsAdmin], [BirthDate], [CityId]) VALUES (4, N'ahmad@gmail.com', N'$MYHASH$V1$10000$x999yi/Ha/AAsTFZ37ORmKGcsJ1rQrScTvadVIzloQy7nOvS', N'AHMAD', N'BWIDANI', NULL, 0, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Phone], [IsAdmin], [BirthDate], [CityId]) VALUES (5, N'ahmad21@gmail.com', N'$MYHASH$V1$10000$wkvkrlT0UOpW7CDW01vMWxJmEa+BWaa7ApaIpcDCsOrwbJ5s', N'AHMAD', N'BWIDANI', N'NULL           ', 0, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Phone], [IsAdmin], [BirthDate], [CityId]) VALUES (6, N'ahmad2@gmail.com', N'$MYHASH$V1$10000$UbOS1oyvGtKCRssFQZKw8XB0a+35YA/wLn1CQaISB7sdhW8s', N'AHMAD', N'BWIDANI', NULL, 0, NULL, 1)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Phone], [IsAdmin], [BirthDate], [CityId]) VALUES (7, N'ahma@gmail.com', N'$MYHASH$V1$10000$RCOb1z6TdH4b1P69HKnmmaehLySidDwDGf3859mXIaJgRSQA', N'AHMAD', N'BWIDANI', NULL, 0, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Phone], [IsAdmin], [BirthDate], [CityId]) VALUES (8, N'ahm@gmail.com', N'$MYHASH$V1$10000$EeYAK4Zuc/2Rc5CWxI1hCKwG82kFXkKqOW5PBt2GQuNS3GW/', N'AHMAD', N'BWIDANI', NULL, 0, NULL, NULL)
INSERT [dbo].[Users] ([Id], [Email], [Password], [FirstName], [LastName], [Phone], [IsAdmin], [BirthDate], [CityId]) VALUES (9, N'ah@gmail.com', N'$MYHASH$V1$10000$9C+EBw3c3yCF9EvxUJjTRSi2rai4vT6fMhVkd2gdTWoghhhg', N'AHMAD', N'BWIDANI', NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__AppPlatf__737584F6097711F4]    Script Date: 5/29/2022 3:00:49 PM ******/
ALTER TABLE [dbo].[AppPlatforms] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Apps__737584F64D9E5585]    Script Date: 5/29/2022 3:00:49 PM ******/
ALTER TABLE [dbo].[Apps] ADD  CONSTRAINT [UQ__Apps__737584F64D9E5585] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Provider__737584F64EF5ACCA]    Script Date: 5/29/2022 3:00:49 PM ******/
ALTER TABLE [dbo].[Providers] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534AB69E540]    Script Date: 5/29/2022 3:00:49 PM ******/
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
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_States] FOREIGN KEY([StateId])
REFERENCES [dbo].[States] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_States]
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
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Cities]
GO
USE [master]
GO
ALTER DATABASE [appsuggest] SET  READ_WRITE 
GO
