USE [master]
GO
/****** Object:  Database [AfpEat]    Script Date: 10/03/2020 17:22:45 ******/
CREATE DATABASE [AfpEat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AfpEat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AfpEat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AfpEat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\AfpEat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AfpEat] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AfpEat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AfpEat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AfpEat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AfpEat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AfpEat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AfpEat] SET ARITHABORT OFF 
GO
ALTER DATABASE [AfpEat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AfpEat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AfpEat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AfpEat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AfpEat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AfpEat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AfpEat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AfpEat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AfpEat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AfpEat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AfpEat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AfpEat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AfpEat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AfpEat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AfpEat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AfpEat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AfpEat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AfpEat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AfpEat] SET  MULTI_USER 
GO
ALTER DATABASE [AfpEat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AfpEat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AfpEat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AfpEat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AfpEat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AfpEat] SET QUERY_STORE = OFF
GO
USE [AfpEat]
GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie](
	[IdCategorie] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[Statut] [bit] NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[IdCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commande]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commande](
	[IdCommande] [int] IDENTITY(1,1) NOT NULL,
	[IdUtilisateur] [int] NOT NULL,
	[IdRestaurant] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Prix] [decimal](10, 2) NOT NULL,
	[IdEtatCommande] [int] NOT NULL,
 CONSTRAINT [PK_Commande] PRIMARY KEY CLUSTERED 
(
	[IdCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommandeProduit]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommandeProduit](
	[IdCommandeProduit] [int] IDENTITY(1,1) NOT NULL,
	[Prix] [decimal](10, 2) NOT NULL,
	[Quantite] [int] NOT NULL,
	[IdCommande] [int] NOT NULL,
	[IdProduit] [int] NOT NULL,
 CONSTRAINT [PK_CommandeProduit_1] PRIMARY KEY CLUSTERED 
(
	[IdCommandeProduit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommandeProduitMenu]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommandeProduitMenu](
	[IdCommandeProduit] [int] NOT NULL,
	[IdMenu] [int] NOT NULL,
 CONSTRAINT [PK_CommandeProduitMenu] PRIMARY KEY CLUSTERED 
(
	[IdCommandeProduit] ASC,
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommandeProduitProduit]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommandeProduitProduit](
	[IdCommandeProduit] [int] NOT NULL,
	[IdProduit] [int] NOT NULL,
 CONSTRAINT [PK_CommandeProduitProduit] PRIMARY KEY CLUSTERED 
(
	[IdCommandeProduit] ASC,
	[IdProduit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EtatCommande]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtatCommande](
	[IdEtatCommande] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EtatCommande] PRIMARY KEY CLUSTERED 
(
	[IdEtatCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[Statut] [bit] NOT NULL,
	[Prix] [decimal](10, 2) NOT NULL,
	[IdRestaurant] [int] NOT NULL,
	[IdPhoto] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuCategorie]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCategorie](
	[IdMenu] [int] NOT NULL,
	[IdCategorie] [int] NOT NULL,
 CONSTRAINT [PK_MenuCategorie] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC,
	[IdCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operation](
	[IdOperation] [int] IDENTITY(1,1) NOT NULL,
	[IdUtilisateur] [int] NOT NULL,
	[Montant] [decimal](10, 2) NOT NULL,
	[IdTypeVersement] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Operation] PRIMARY KEY CLUSTERED 
(
	[IdOperation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Photo]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[IdPhoto] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[IdPhoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produit]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produit](
	[IdProduit] [int] IDENTITY(1,1) NOT NULL,
	[IdRestaurant] [int] NOT NULL,
	[IdCategorie] [int] NOT NULL,
	[Nom] [varchar](300) NOT NULL,
	[Prix] [decimal](10, 2) NOT NULL,
	[Description] [varchar](3000) NOT NULL,
	[Quantite] [int] NOT NULL,
 CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED 
(
	[IdProduit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduitCompose]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduitCompose](
	[IdProduit] [int] NOT NULL,
	[IdProduitPere] [int] NOT NULL,
 CONSTRAINT [PK_ProduitCompose] PRIMARY KEY CLUSTERED 
(
	[IdProduit] ASC,
	[IdProduitPere] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduitPhoto]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduitPhoto](
	[IdProduit] [int] NOT NULL,
	[IdPhoto] [int] NOT NULL,
 CONSTRAINT [PK_ProduitPhoto] PRIMARY KEY CLUSTERED 
(
	[IdProduit] ASC,
	[IdPhoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[IdRestaurant] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](300) NOT NULL,
	[Slug] [varchar](300) NULL,
	[IdTypeCuisine] [int] NOT NULL,
	[Description] [varchar](3000) NOT NULL,
	[Budget] [decimal](10, 2) NOT NULL,
	[Adresse] [varchar](300) NOT NULL,
	[Telephone] [varchar](50) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Email] [varchar](300) NOT NULL,
	[CodePostal] [varchar](10) NOT NULL,
	[Ville] [varchar](100) NOT NULL,
	[IdUtilisateur] [int] NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[IdRestaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantPhoto]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RestaurantPhoto](
	[IdRestaurant] [int] NOT NULL,
	[IdPhoto] [int] NOT NULL,
 CONSTRAINT [PK_RestaurantPhoto] PRIMARY KEY CLUSTERED 
(
	[IdRestaurant] ASC,
	[IdPhoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionUtilisateur]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionUtilisateur](
	[IdSession] [varchar](100) NOT NULL,
	[DateSession] [datetime] NOT NULL,
 CONSTRAINT [PK_SessionUtilisateur] PRIMARY KEY CLUSTERED 
(
	[IdSession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeCuisine]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeCuisine](
	[IdTypeCuisine] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[IdPhoto] [int] NOT NULL,
 CONSTRAINT [PK_TypeCuisine] PRIMARY KEY CLUSTERED 
(
	[IdTypeCuisine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeVersement]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeVersement](
	[IdTypeVersement] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[Statut] [bit] NOT NULL,
 CONSTRAINT [PK_TypeVersement] PRIMARY KEY CLUSTERED 
(
	[IdTypeVersement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 10/03/2020 17:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[IdUtilisateur] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[Prenom] [varchar](100) NOT NULL,
	[Login] [varchar](100) NOT NULL,
	[Password] [varchar](300) NOT NULL,
	[Statut] [bit] NOT NULL,
	[Solde] [decimal](10, 2) NOT NULL,
	[IdSession] [varchar](100) NULL,
	[IdRole] [int] NULL,
 CONSTRAINT [PK_Utilisateur] PRIMARY KEY CLUSTERED 
(
	[IdUtilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (113, N'Entrée', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (114, N'Plat', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (115, N'Dessert', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (116, N'Salade', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (117, N'Boisson', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (118, N'Pâtes', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (119, N'Panini', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (120, N'Pizza', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (121, N'Sandwich', 1)
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[EtatCommande] ON 

INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (1, N'En Attente')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (2, N'En cours de préparation')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (3, N'En cours de livraison')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (4, N'Livré')
SET IDENTITY_INSERT [dbo].[EtatCommande] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([IdMenu], [Nom], [Statut], [Prix], [IdRestaurant], [IdPhoto]) VALUES (7, N'Menu Poke bowl signature & boisson', 1, CAST(12.90 AS Decimal(10, 2)), 456, 3403)
INSERT [dbo].[Menu] ([IdMenu], [Nom], [Statut], [Prix], [IdRestaurant], [IdPhoto]) VALUES (8, N'Menu Poke bowl signature, boisson & dessert', 1, CAST(15.90 AS Decimal(10, 2)), 456, 3404)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (7, 114)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (7, 117)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (8, 114)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (8, 115)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (8, 117)
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3006, N'asiatique.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3007, N'boulangerie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3008, N'brasserie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3009, N'fastfood.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3010, N'francaise.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3011, N'indien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3012, N'libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3013, N'pizza.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3014, N'Pokawa.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3015, N'Sushi Shop.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3016, N'SHAKA Poke.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3017, N'La Mie Caline.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3018, N'Maison Kayser.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3019, N'Boulangerie Beaubourg.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3020, N'Pomme de Pain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3021, N'Boulangerie artisanale Zerzour.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3022, N'Shake it Easy.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3023, N'Cheezer.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3024, N'Nabab Kebab.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3025, N'Burger & Fries.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3026, N'Les Burgers de Papa.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3027, N'Mac Doner.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3028, N'Fermier Gourmet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3029, N'La cochonnaille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3030, N'Nos Grands-mères ont du Talent.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3031, N'Canard Street.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3032, N'Zoe Bouillon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3033, N'Kitchen Paris.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3034, N'Crêperie Galette Cafe.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3035, N'Bollynan.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3036, N'Aarapana restaurant.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3037, N'Safran.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3038, N'Eat & Cool.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3039, N'Taboulé Paris.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3040, N'Chez le Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3041, N'Le Cèdre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3042, N'Noura.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3043, N'Zaatar Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3044, N'Big Falafel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3045, N'Marché Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3046, N'King Falafel Palace.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3047, N'O Beyrouth.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3048, N'Shawarma Lovers.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3049, N'Topoly.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3050, N'Five Pizza Original.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3051, N'5PIZZ.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3052, N'Chez Alfredo.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3053, N'Mulberry Street.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3054, N'Pizza La Fayette.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3055, N'Pizza Rustica.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3056, N'César Montorgueil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3057, N'Amala.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3058, N'Falstaff.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3059, N'Palazzo di Pasta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3060, N'Pizza Presto.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3061, N'Chez Aldo.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3062, N'Del Arte.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3063, N'Italian Trattoria.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3064, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3065, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3066, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3067, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3068, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3069, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3070, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3071, N'Chirashi Hawaïen.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3072, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3073, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3074, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3075, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3076, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3077, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3078, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3079, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3080, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3081, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3082, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3083, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3084, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3085, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3086, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3087, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3088, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3089, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3090, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3091, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3092, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3093, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3094, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3095, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3096, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3097, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3098, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3099, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3100, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3101, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3102, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3103, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3104, N'Chirashi Hawaïen.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3105, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3106, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3107, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3108, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3109, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3110, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3111, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3112, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3113, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3114, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3115, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3116, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3117, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3118, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3119, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3120, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3121, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3122, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3123, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3124, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3125, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3126, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3127, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3128, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3129, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3130, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3131, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3132, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3133, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3134, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3135, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3136, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3137, N'Chirashi Hawaïen.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3138, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3139, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3140, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3141, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3142, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3143, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3144, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3145, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3146, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3147, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3148, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3149, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3150, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3151, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3152, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3153, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3154, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3155, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3156, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3157, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3158, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3159, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3160, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3161, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3162, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3163, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3164, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3165, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3166, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3167, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3168, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3169, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3170, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3171, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3172, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3173, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3174, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3175, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3176, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3177, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3178, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3179, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3180, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3181, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3182, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3183, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3184, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3185, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3186, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3187, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3188, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3189, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3190, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3191, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3192, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3193, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3194, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3195, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3196, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3197, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3198, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3199, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3200, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3201, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3202, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3203, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3204, N'Tartelette poire amande.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3205, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3206, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3207, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3208, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3209, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3210, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3211, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3212, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3213, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3214, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3215, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3216, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3217, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3218, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3219, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3220, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3221, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3222, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3223, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3224, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3225, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3226, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3227, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3228, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3229, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3230, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3231, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3232, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3233, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3234, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3235, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3236, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3237, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3238, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3239, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3240, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3241, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3242, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3243, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3244, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3245, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3246, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3247, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3248, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3249, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3250, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3251, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3252, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3253, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3254, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3255, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3256, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3257, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3258, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3259, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3260, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3261, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3262, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3263, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3264, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3265, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3266, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3267, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3268, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3269, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3270, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3271, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3272, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3273, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3274, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3275, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3276, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3277, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3278, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3279, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3280, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3281, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3282, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3283, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3284, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3285, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3286, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3287, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3288, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3289, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3290, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3291, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3292, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3293, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3294, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3295, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3296, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3297, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3298, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3299, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3300, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3301, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3302, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3303, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3304, N'Éclair Praliné.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3305, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3306, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3307, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3308, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3309, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3310, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3311, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3312, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3313, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3314, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3315, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3316, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3317, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3318, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3319, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3320, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3321, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3322, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3323, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3324, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3325, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3326, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3327, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3328, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3329, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3330, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3331, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3332, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3333, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3334, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3335, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3336, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3337, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3338, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3339, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3340, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3341, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3342, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3343, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3344, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3345, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3346, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3347, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3348, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3349, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3350, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3351, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3352, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3353, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3354, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3355, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3356, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3357, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3358, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3359, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3360, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3361, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3362, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3363, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3364, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3365, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3366, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3367, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3368, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3369, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3370, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3371, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3372, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3373, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3374, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3375, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3376, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3377, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3378, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3379, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3380, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3381, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3382, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3383, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3384, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3385, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3386, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3387, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3388, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3389, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3390, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3391, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3392, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3393, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3394, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3395, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3396, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3397, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3398, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3399, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3400, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3401, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3402, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3403, N'Menu Poke bowl signature & boisson.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3404, N'Menu Poke bowl signature, boisson & dessert.jpg')
GO
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Produit] ON 

INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2453, 456, 113, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2454, 456, 113, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2455, 456, 113, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2456, 456, 113, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2457, 456, 113, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2458, 456, 113, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2459, 456, 113, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2460, 456, 114, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2461, 456, 114, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2462, 456, 114, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2463, 456, 114, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2464, 456, 114, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2465, 456, 114, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2466, 456, 114, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2467, 456, 114, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2468, 456, 114, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2469, 456, 115, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2470, 456, 115, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2471, 456, 115, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2472, 456, 115, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2473, 456, 115, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2474, 456, 115, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2475, 456, 115, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2476, 456, 115, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2477, 456, 117, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2478, 456, 117, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2479, 456, 117, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2480, 456, 117, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2481, 456, 117, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2482, 456, 117, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2483, 456, 117, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2484, 456, 117, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2485, 456, 117, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2486, 457, 113, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2487, 457, 113, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2488, 457, 113, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2489, 457, 113, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2490, 457, 113, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2491, 457, 113, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2492, 457, 113, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2493, 457, 114, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2494, 457, 114, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2495, 457, 114, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2496, 457, 114, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2497, 457, 114, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2498, 457, 114, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2499, 457, 114, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2500, 457, 114, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2501, 457, 114, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2502, 457, 115, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2503, 457, 115, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2504, 457, 115, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2505, 457, 115, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2506, 457, 115, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2507, 457, 115, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2508, 457, 115, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2509, 457, 115, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2510, 457, 117, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2511, 457, 117, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2512, 457, 117, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2513, 457, 117, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2514, 457, 117, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2515, 457, 117, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2516, 457, 117, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2517, 457, 117, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2518, 457, 117, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2519, 458, 113, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2520, 458, 113, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2521, 458, 113, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2522, 458, 113, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2523, 458, 113, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2524, 458, 113, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2525, 458, 113, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2526, 458, 114, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2527, 458, 114, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2528, 458, 114, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2529, 458, 114, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2530, 458, 114, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2531, 458, 114, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2532, 458, 114, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2533, 458, 114, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2534, 458, 114, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2535, 458, 115, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2536, 458, 115, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2537, 458, 115, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2538, 458, 115, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2539, 458, 115, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2540, 458, 115, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2541, 458, 115, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2542, 458, 115, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2543, 458, 117, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2544, 458, 117, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2545, 458, 117, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2546, 458, 117, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2547, 458, 117, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2548, 458, 117, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2549, 458, 117, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2550, 458, 117, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2551, 458, 117, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 40)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2552, 459, 120, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2553, 459, 120, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2554, 459, 116, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2555, 459, 116, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2556, 459, 116, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2557, 459, 121, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2558, 459, 121, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2559, 459, 121, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2560, 459, 121, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2561, 459, 121, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2562, 459, 121, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2563, 459, 121, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2564, 459, 121, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2565, 459, 121, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2566, 459, 121, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2567, 459, 121, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2568, 459, 121, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2569, 459, 121, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2570, 459, 121, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2571, 459, 119, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2572, 459, 119, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2573, 459, 119, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2574, 459, 119, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2575, 459, 119, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2576, 459, 115, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2577, 459, 115, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2578, 459, 115, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2579, 459, 115, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2580, 459, 115, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2581, 459, 115, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2582, 459, 115, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2583, 459, 115, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2584, 459, 115, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2585, 459, 115, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2586, 459, 115, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2587, 459, 115, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2588, 459, 115, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2589, 459, 115, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2590, 459, 115, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2591, 459, 115, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2592, 459, 115, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2593, 459, 115, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2594, 459, 115, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2595, 459, 115, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2596, 459, 115, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2597, 459, 115, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2598, 459, 115, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2599, 459, 115, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2600, 460, 120, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2601, 460, 120, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2602, 460, 116, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2603, 460, 116, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2604, 460, 116, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2605, 460, 121, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2606, 460, 121, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2607, 460, 121, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2608, 460, 121, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2609, 460, 121, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2610, 460, 121, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2611, 460, 121, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2612, 460, 121, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2613, 460, 121, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2614, 460, 121, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2615, 460, 121, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2616, 460, 121, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2617, 460, 121, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2618, 460, 121, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2619, 460, 119, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2620, 460, 119, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2621, 460, 119, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2622, 460, 119, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2623, 460, 119, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2624, 460, 115, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2625, 460, 115, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2626, 460, 115, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2627, 460, 115, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2628, 460, 115, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2629, 460, 115, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2630, 460, 115, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2631, 460, 115, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2632, 460, 115, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2633, 460, 115, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2634, 460, 115, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2635, 460, 115, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2636, 460, 115, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2637, 460, 115, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2638, 460, 115, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2639, 460, 115, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2640, 460, 115, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2641, 460, 115, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2642, 460, 115, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2643, 460, 115, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2644, 460, 115, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2645, 460, 115, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2646, 460, 115, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2647, 460, 115, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2648, 461, 120, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2649, 461, 120, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2650, 461, 116, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2651, 461, 116, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 35)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2652, 461, 116, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2653, 461, 121, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2654, 461, 121, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2655, 461, 121, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2656, 461, 121, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2657, 461, 121, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2658, 461, 121, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2659, 461, 121, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2660, 461, 121, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2661, 461, 121, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2662, 461, 121, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2663, 461, 121, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2664, 461, 121, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2665, 461, 121, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2666, 461, 121, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2667, 461, 119, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2668, 461, 119, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2669, 461, 119, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2670, 461, 119, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2671, 461, 119, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2672, 461, 115, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2673, 461, 115, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2674, 461, 115, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2675, 461, 115, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2676, 461, 115, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2677, 461, 115, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2678, 461, 115, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2679, 461, 115, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2680, 461, 115, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2681, 461, 115, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2682, 461, 115, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2683, 461, 115, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2684, 461, 115, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2685, 461, 115, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2686, 461, 115, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2687, 461, 115, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2688, 461, 115, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2689, 461, 115, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2690, 461, 115, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2691, 461, 115, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2692, 461, 115, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2693, 461, 115, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2694, 461, 115, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2695, 461, 115, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2696, 462, 120, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2697, 462, 120, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2698, 462, 116, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2699, 462, 116, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2700, 462, 116, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2701, 462, 121, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2702, 462, 121, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2703, 462, 121, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2704, 462, 121, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2705, 462, 121, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2706, 462, 121, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2707, 462, 121, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2708, 462, 121, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2709, 462, 121, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2710, 462, 121, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2711, 462, 121, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2712, 462, 121, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2713, 462, 121, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2714, 462, 121, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2715, 462, 119, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2716, 462, 119, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2717, 462, 119, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2718, 462, 119, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2719, 462, 119, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2720, 462, 115, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2721, 462, 115, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2722, 462, 115, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2723, 462, 115, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2724, 462, 115, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2725, 462, 115, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2726, 462, 115, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2727, 462, 115, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2728, 462, 115, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2729, 462, 115, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2730, 462, 115, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2731, 462, 115, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2732, 462, 115, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2733, 462, 115, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2734, 462, 115, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2735, 462, 115, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2736, 462, 115, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2737, 462, 115, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2738, 462, 115, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2739, 462, 115, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2740, 462, 115, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2741, 462, 115, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2742, 462, 115, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2743, 462, 115, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2744, 463, 120, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2745, 463, 120, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2746, 463, 116, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2747, 463, 116, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2748, 463, 116, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2749, 463, 121, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2750, 463, 121, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2751, 463, 121, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 10)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2752, 463, 121, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2753, 463, 121, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2754, 463, 121, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2755, 463, 121, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2756, 463, 121, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2757, 463, 121, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2758, 463, 121, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2759, 463, 121, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2760, 463, 121, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2761, 463, 121, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2762, 463, 121, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2763, 463, 119, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2764, 463, 119, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2765, 463, 119, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2766, 463, 119, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2767, 463, 119, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2768, 463, 115, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2769, 463, 115, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2770, 463, 115, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2771, 463, 115, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2772, 463, 115, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2773, 463, 115, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2774, 463, 115, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2775, 463, 115, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2776, 463, 115, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2777, 463, 115, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2778, 463, 115, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2779, 463, 115, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2780, 463, 115, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2781, 463, 115, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2782, 463, 115, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2783, 463, 115, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2784, 463, 115, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2785, 463, 115, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2786, 463, 115, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2787, 463, 115, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2788, 463, 115, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2789, 463, 115, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2790, 463, 115, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (2791, 463, 115, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 45)
SET IDENTITY_INSERT [dbo].[Produit] OFF
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2453, 3064)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2454, 3065)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2455, 3066)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2456, 3067)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2457, 3068)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2458, 3069)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2459, 3070)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2460, 3071)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2461, 3072)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2462, 3073)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2463, 3074)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2464, 3075)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2465, 3076)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2466, 3077)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2467, 3078)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2468, 3079)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2469, 3080)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2470, 3081)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2471, 3082)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2472, 3083)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2473, 3084)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2474, 3085)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2475, 3086)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2476, 3087)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2477, 3088)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2478, 3089)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2479, 3090)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2480, 3091)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2481, 3092)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2482, 3093)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2483, 3094)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2484, 3095)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2485, 3096)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2486, 3097)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2487, 3098)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2488, 3099)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2489, 3100)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2490, 3101)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2491, 3102)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2492, 3103)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2493, 3104)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2494, 3105)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2495, 3106)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2496, 3107)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2497, 3108)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2498, 3109)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2499, 3110)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2500, 3111)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2501, 3112)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2502, 3113)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2503, 3114)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2504, 3115)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2505, 3116)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2506, 3117)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2507, 3118)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2508, 3119)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2509, 3120)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2510, 3121)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2511, 3122)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2512, 3123)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2513, 3124)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2514, 3125)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2515, 3126)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2516, 3127)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2517, 3128)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2518, 3129)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2519, 3130)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2520, 3131)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2521, 3132)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2522, 3133)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2523, 3134)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2524, 3135)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2525, 3136)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2526, 3137)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2527, 3138)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2528, 3139)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2529, 3140)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2530, 3141)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2531, 3142)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2532, 3143)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2533, 3144)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2534, 3145)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2535, 3146)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2536, 3147)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2537, 3148)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2538, 3149)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2539, 3150)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2540, 3151)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2541, 3152)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2542, 3153)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2543, 3154)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2544, 3155)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2545, 3156)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2546, 3157)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2547, 3158)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2548, 3159)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2549, 3160)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2550, 3161)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2551, 3162)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2552, 3163)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2553, 3164)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2554, 3165)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2555, 3166)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2556, 3167)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2557, 3168)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2558, 3169)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2559, 3170)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2560, 3171)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2561, 3172)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2562, 3173)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2563, 3174)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2564, 3175)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2565, 3176)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2566, 3177)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2567, 3178)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2568, 3179)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2569, 3180)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2570, 3181)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2571, 3182)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2572, 3183)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2573, 3184)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2574, 3185)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2575, 3186)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2576, 3187)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2577, 3188)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2578, 3189)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2579, 3190)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2580, 3191)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2581, 3192)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2582, 3193)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2583, 3194)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2584, 3195)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2585, 3196)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2586, 3197)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2587, 3198)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2588, 3199)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2589, 3200)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2590, 3201)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2591, 3202)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2592, 3203)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2593, 3204)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2594, 3205)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2595, 3206)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2596, 3207)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2597, 3208)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2598, 3209)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2599, 3210)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2600, 3211)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2601, 3212)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2602, 3213)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2603, 3214)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2604, 3215)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2605, 3216)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2606, 3217)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2607, 3218)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2608, 3219)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2609, 3220)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2610, 3221)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2611, 3222)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2612, 3223)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2613, 3224)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2614, 3225)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2615, 3226)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2616, 3227)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2617, 3228)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2618, 3229)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2619, 3230)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2620, 3231)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2621, 3232)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2622, 3233)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2623, 3234)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2624, 3235)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2625, 3236)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2626, 3237)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2627, 3238)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2628, 3239)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2629, 3240)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2630, 3241)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2631, 3242)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2632, 3243)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2633, 3244)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2634, 3245)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2635, 3246)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2636, 3247)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2637, 3248)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2638, 3249)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2639, 3250)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2640, 3251)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2641, 3252)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2642, 3253)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2643, 3254)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2644, 3255)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2645, 3256)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2646, 3257)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2647, 3258)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2648, 3259)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2649, 3260)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2650, 3261)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2651, 3262)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2652, 3263)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2653, 3264)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2654, 3265)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2655, 3266)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2656, 3267)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2657, 3268)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2658, 3269)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2659, 3270)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2660, 3271)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2661, 3272)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2662, 3273)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2663, 3274)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2664, 3275)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2665, 3276)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2666, 3277)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2667, 3278)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2668, 3279)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2669, 3280)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2670, 3281)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2671, 3282)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2672, 3283)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2673, 3284)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2674, 3285)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2675, 3286)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2676, 3287)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2677, 3288)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2678, 3289)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2679, 3290)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2680, 3291)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2681, 3292)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2682, 3293)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2683, 3294)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2684, 3295)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2685, 3296)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2686, 3297)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2687, 3298)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2688, 3299)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2689, 3300)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2690, 3301)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2691, 3302)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2692, 3303)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2693, 3304)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2694, 3305)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2695, 3306)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2696, 3307)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2697, 3308)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2698, 3309)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2699, 3310)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2700, 3311)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2701, 3312)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2702, 3313)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2703, 3314)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2704, 3315)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2705, 3316)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2706, 3317)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2707, 3318)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2708, 3319)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2709, 3320)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2710, 3321)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2711, 3322)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2712, 3323)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2713, 3324)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2714, 3325)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2715, 3326)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2716, 3327)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2717, 3328)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2718, 3329)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2719, 3330)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2720, 3331)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2721, 3332)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2722, 3333)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2723, 3334)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2724, 3335)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2725, 3336)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2726, 3337)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2727, 3338)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2728, 3339)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2729, 3340)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2730, 3341)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2731, 3342)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2732, 3343)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2733, 3344)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2734, 3345)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2735, 3346)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2736, 3347)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2737, 3348)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2738, 3349)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2739, 3350)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2740, 3351)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2741, 3352)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2742, 3353)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2743, 3354)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2744, 3355)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2745, 3356)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2746, 3357)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2747, 3358)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2748, 3359)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2749, 3360)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2750, 3361)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2751, 3362)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2752, 3363)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2753, 3364)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2754, 3365)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2755, 3366)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2756, 3367)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2757, 3368)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2758, 3369)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2759, 3370)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2760, 3371)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2761, 3372)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2762, 3373)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2763, 3374)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2764, 3375)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2765, 3376)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2766, 3377)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2767, 3378)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2768, 3379)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2769, 3380)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2770, 3381)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2771, 3382)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2772, 3383)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2773, 3384)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2774, 3385)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2775, 3386)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2776, 3387)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2777, 3388)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2778, 3389)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2779, 3390)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2780, 3391)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2781, 3392)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2782, 3393)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2783, 3394)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2784, 3395)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2785, 3396)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2786, 3397)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2787, 3398)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2788, 3399)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2789, 3400)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2790, 3401)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (2791, 3402)
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (456, N'Pokawa', N'pokawa', 209, N'Ut aut inventore debitis voluptatem recusandae non natus ea nesciunt. Voluptatem corporis sit tenetur optio illo sed ab exercitationem. Modi nihil dolores ratione. Voluptas numquam eveniet eos et quisquam at. Eos est reiciendis sint. Cum eum est voluptas quia molestiae minima.', CAST(5.00 AS Decimal(10, 2)), N'56 Voie de la Harpe', N'0123019957', N'0616574196', N'Shelia74@hotmail.fr', N'36652', N'Aix-en-Provence', 186)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (457, N'Sushi Shop', N'sushi-shop', 209, N'Reiciendis voluptatem eos sunt qui. Nemo possimus voluptas et occaecati. Repellendus dolorem nobis ab quaerat id impedit. Nostrum aut numquam cumque nemo molestias error. Et voluptatem at tempora magnam quo odit quia cum error. At doloribus eveniet.', CAST(6.00 AS Decimal(10, 2)), N'7047 Rue de Montmorency', N'0171642887', N'0694198042', N'Henry71@yahoo.fr', N'17126', N'Bordeaux', 187)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (458, N'SHAKA Poke', N'shaka-poke', 209, N'Ad qui incidunt architecto cupiditate eius. Eum corrupti dolores. At nihil doloribus sit eius illum.', CAST(13.00 AS Decimal(10, 2)), N'7082 Avenue de Tilsitt', N'0125086371', N'0642253667', N'Andres94@gmail.com', N'68342', N'Champigny-sur-Marne', 188)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (459, N'La Mie Câline', N'la-mie-caline', 210, N'Ea et enim. Aliquam non in in omnis consequatur. Ut velit non tenetur quaerat maiores sint. Dolore ea quidem corporis nihil exercitationem doloremque.', CAST(4.00 AS Decimal(10, 2)), N'7869 Avenue du Havre', N'0198213305', N'0677395759', N'Leo.Roger@gmail.com', N'82511', N'Villejuif', 189)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (460, N'Maison Kayser', N'maison-kayser', 210, N'Reprehenderit et fuga et consequatur aut cum eius voluptas. Dolorem sed necessitatibus quasi est et unde quia. Laudantium quo facere.', CAST(14.00 AS Decimal(10, 2)), N'56 Avenue du Dahomey', N'0152750358', N'0623933258', N'Kim.Fabre30@hotmail.fr', N'96870', N'Antony', 190)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (461, N'Boulangerie Beaubourg', N'boulangerie-beaubourg', 210, N'Incidunt temporibus quidem commodi possimus asperiores dolor. Adipisci iste sunt a. Eos fuga aut et quidem. Sint sit voluptatem ut. Sed consequatur ut sit dignissimos itaque rerum illo aspernatur mollitia.', CAST(4.00 AS Decimal(10, 2)), N'2 Impasse d''Orsel', N'0117938955', N'0696927243', N'Bernice.Aubry72@hotmail.fr', N'31877', N'Nancy', 191)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (462, N'Pomme de Pain', N'pomme-de-pain', 210, N'Minima voluptatem distinctio enim est consequuntur ullam non nisi. Doloremque repellendus esse repellendus. Quia dicta molestias impedit fugiat repellendus eaque architecto. Quos deleniti nihil quia enim consequuntur officia qui. Dolor cumque iure quae nesciunt in et.', CAST(14.00 AS Decimal(10, 2)), N'336 Boulevard de la Pompe', N'0148950096', N'0680588020', N'Sabrina_Moulin@yahoo.fr', N'43916', N'Hyères', 192)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (463, N'Boulangerie artisanale Zerzour', N'boulangerie-artisanale-zerzour', 210, N'Commodi necessitatibus impedit veniam quas dolor omnis et expedita consequuntur. Sit sed perspiciatis et ea architecto dolorem est. Qui et natus illum qui assumenda debitis qui. Eligendi autem blanditiis sit. Sit reprehenderit minus est. Voluptate dolorem quasi.', CAST(4.00 AS Decimal(10, 2)), N'400 Passage de Provence', N'0172256968', N'0693257388', N'Angelica60@hotmail.fr', N'48553', N'Nice', 193)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (464, N'Shake it Easy', N'shake-it-easy', 211, N'Nisi assumenda occaecati ipsa animi placeat. Quis architecto est autem. Velit fugiat maxime unde dolores. Fuga quis debitis qui.', CAST(9.00 AS Decimal(10, 2)), N'410 Quai Saint-Jacques', N'0161864397', N'0649549701', N'Alicia68@hotmail.fr', N'17719', N'Les Abymes', 194)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (465, N'Cheezer', N'cheezer', 212, N'Debitis amet laboriosam aut eum assumenda itaque aspernatur. Similique eos omnis nulla. Et consequuntur et omnis velit laudantium impedit esse. Laudantium molestias et quasi architecto nisi consequuntur. Libero minus explicabo et necessitatibus.', CAST(12.00 AS Decimal(10, 2)), N'2 Impasse de Vaugirard', N'0178444274', N'0679114925', N'Angela.Rodriguez11@gmail.com', N'62145', N'La Seyne-sur-Mer', 195)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (466, N'Nabab Kebab', N'nabab-kebab', 212, N'Voluptas error ipsum quisquam minima et accusamus facilis et. Eveniet dolorem voluptates enim architecto ducimus est ex. In optio culpa aliquam laboriosam qui ab ipsam minus.', CAST(15.00 AS Decimal(10, 2)), N'789 Impasse de l''Abbaye', N'0166893754', N'0631397797', N'Emmett_Marchand@yahoo.fr', N'14284', N'Lyon', 196)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (467, N'Burger & Fries', N'burger-fries', 212, N'Rerum quo a nobis dolorum tempore voluptatem corporis facere. Qui adipisci rerum quae incidunt esse ea molestiae mollitia sapiente. Exercitationem rem in quis dolorum ad iusto accusantium modi.', CAST(10.00 AS Decimal(10, 2)), N'13 Allée du Faubourg Saint-Honoré', N'0178038715', N'0684806600', N'Rosa.Francois42@yahoo.fr', N'81561', N'Tours', 197)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (468, N'Les Burgers de Papa', N'les-burgers-de-papa', 212, N'Totam sit quia nostrum voluptatum. Fuga tenetur ex reprehenderit quo neque dignissimos. Placeat beatae at tempora molestias. Cum veritatis est ducimus excepturi nihil aliquam sint. Illum laborum dicta iste nostrum laborum.', CAST(3.00 AS Decimal(10, 2)), N'750 Rue de Tilsitt', N'0103600132', N'0635018460', N'Lewis96@gmail.com', N'61561', N'Montpellier', 198)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (469, N'Mac Doner', N'mac-doner', 212, N'Minima beatae distinctio eveniet facilis pariatur nobis nesciunt. Totam ut sit temporibus perferendis ducimus dolores delectus. Vero molestiae quo aliquid illum aut hic totam a. Facilis ut est aperiam magni quia.', CAST(7.00 AS Decimal(10, 2)), N'93 Avenue du Bac', N'0165867966', N'0624289491', N'Winston.Giraud25@hotmail.fr', N'27266', N'Villejuif', 199)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (470, N'Fermier Gourmet', N'fermier-gourmet', 213, N'Sed omnis qui ut nam dolores exercitationem. Saepe modi eum eaque ut qui laudantium. Quia qui sunt.', CAST(6.00 AS Decimal(10, 2)), N'6690 Quai Oberkampf', N'0162207244', N'0627366450', N'Megan.Fernandez89@hotmail.fr', N'33884', N'Ajaccio', 200)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (471, N'La cochonnaille', N'la-cochonnaille', 213, N'Enim accusantium nihil nihil eum harum sed. Sapiente rem ex autem qui et perspiciatis. Quaerat quisquam corrupti et. Nam dolor aliquam et suscipit cum autem perspiciatis. Dolores distinctio qui. Deleniti laboriosam delectus delectus nihil sequi fuga nemo.', CAST(13.00 AS Decimal(10, 2)), N'181 Impasse Dauphine', N'0142207272', N'0682686244', N'Jean.Charles@hotmail.fr', N'66277', N'Le Mans', 201)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (472, N'Nos Grands-mères ont du Talent', N'nos-grands-meres-ont-du-talent', 213, N'Eos aut ipsam nemo doloremque nemo beatae. Facilis temporibus commodi. Natus architecto voluptatibus debitis.', CAST(8.00 AS Decimal(10, 2)), N'3078 Impasse de la Pompe', N'0182112914', N'0673110061', N'Tommie9@hotmail.fr', N'45197', N'Pessac', 202)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (473, N'Canard Street', N'canard-street', 213, N'Nisi qui tenetur esse at est est maiores enim. Et nulla quam atque omnis ullam. Id in voluptatum dolore atque in et numquam quia sapiente. Omnis id sequi a soluta praesentium provident.', CAST(11.00 AS Decimal(10, 2)), N'9995 Impasse Delesseux', N'0177986203', N'0647658808', N'Danny_Menard90@gmail.com', N'71754', N'Amiens', 203)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (474, N'Zoe Bouillon', N'zoe-bouillon', 213, N'Assumenda ut omnis. Sequi sint temporibus dolorem voluptatem blanditiis. Nesciunt molestiae ut veniam et. Corrupti praesentium quo unde praesentium. Alias inventore et rerum dolor vel. At sunt quo voluptatem accusamus voluptates laboriosam incidunt veniam ratione.', CAST(12.00 AS Decimal(10, 2)), N'547 Impasse Lepic', N'0107961103', N'0662481435', N'Wilbert_Caron20@gmail.com', N'64052', N'Cannes', 204)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (475, N'Kitchen Paris', N'kitchen-paris', 213, N'Consequuntur aut fuga ipsum et occaecati dolores. In dolor quo voluptatem. At possimus rem.', CAST(3.00 AS Decimal(10, 2)), N'1 Impasse des Lombards', N'0191112730', N'0631194232', N'Jeanette_Guerin@yahoo.fr', N'37801', N'Saint-Maur-des-Fossés', 205)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (476, N'Crêperie Galette Cafe', N'creperie-galette-cafe', 213, N'Iste nam sit tempore repudiandae numquam quo. Rerum voluptatem sit. Sint ut delectus veritatis in ipsum iusto magni cumque odit. Ea in non asperiores at est. Nesciunt eligendi dolores voluptas commodi debitis vero. Tenetur reprehenderit occaecati dolores sed fugiat blanditiis quos.', CAST(11.00 AS Decimal(10, 2)), N'432 Voie des Saussaies', N'0144471769', N'0642627283', N'Neil_Aubry@gmail.com', N'83862', N'Saint-Paul', 206)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (477, N'Bollynan', N'bollynan', 214, N'Quia at porro commodi. Dolorum praesentium consequatur ea delectus et hic eum inventore et. Voluptatem qui et. Voluptates aperiam vitae.', CAST(5.00 AS Decimal(10, 2)), N'6 Impasse Du Sommerard', N'0144094005', N'0624311202', N'Ervin85@gmail.com', N'86993', N'Ajaccio', 207)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (478, N'Aarapana restaurant', N'aarapana-restaurant', 214, N'Nihil eum soluta ratione veritatis excepturi ex. Ratione perspiciatis eligendi quia. Facilis ipsum distinctio. Expedita numquam iste iusto aliquid qui repellendus.', CAST(7.00 AS Decimal(10, 2)), N'6 Passage de la Harpe', N'0148813146', N'0696894080', N'Josephine.Marchand67@yahoo.fr', N'65133', N'Asnières-sur-Seine', 208)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (479, N'Safran', N'safran', 214, N'Ullam doloribus aut ut exercitationem accusamus voluptas fugiat nobis. Earum ut sed. In consectetur ut. Et minima ut amet saepe numquam quisquam. Cum laboriosam in corrupti dolor.', CAST(6.00 AS Decimal(10, 2)), N'936 Boulevard La Boétie', N'0108928171', N'0688941522', N'Amanda_Denis50@yahoo.fr', N'40016', N'Amiens', 209)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (480, N'Eat & Cool', N'eat-cool', 214, N'Sint voluptatibus quo. Dolorem laborum quos et possimus quod sunt qui aut non. Voluptatum non dolore eius voluptatibus qui sunt in sed recusandae. Reiciendis distinctio voluptates laborum suscipit consequatur et. Qui assumenda recusandae provident.', CAST(3.00 AS Decimal(10, 2)), N'5240 Boulevard Lepic', N'0158002797', N'0695838863', N'Elias9@yahoo.fr', N'74813', N'Brest', 210)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (481, N'Taboulé Paris', N'taboule-paris', 215, N'Omnis doloremque omnis ipsa qui quidem soluta quam. Rerum laboriosam beatae rerum ducimus autem voluptates dolores quam. Sit consequuntur sequi in ut totam eveniet sunt consequatur. Laborum autem assumenda voluptatibus quaerat pariatur suscipit vitae quas.', CAST(8.00 AS Decimal(10, 2)), N'11 Impasse Zadkine', N'0123108130', N'0645352325', N'Tara.Gauthier@hotmail.fr', N'57895', N'Aubervilliers', 211)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (482, N'Chez le Libanais', N'chez-le-libanais', 215, N'Aliquam quas tempore voluptates est dicta ipsum animi. Qui debitis quis culpa. Optio quia eos. Laudantium commodi accusantium laudantium est vel.', CAST(13.00 AS Decimal(10, 2)), N'2405 Impasse Pastourelle', N'0119136327', N'0615427845', N'Colleen_Fontaine25@yahoo.fr', N'74576', N'Levallois-Perret', 212)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (483, N'Le Cèdre', N'le-cedre', 215, N'Qui necessitatibus consequatur earum pariatur vitae et. Non et aliquid doloremque ea assumenda voluptas et voluptatum quo. Laborum asperiores inventore et possimus esse aperiam ut eum. Tenetur voluptate numquam libero neque aut eos.', CAST(3.00 AS Decimal(10, 2)), N'45 Quai Pierre Charron', N'0184550089', N'0612698486', N'Brad.Huet@yahoo.fr', N'88265', N'Noisy-le-Grand', 213)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (484, N'Noura', N'noura', 215, N'Ut quis exercitationem voluptatem eum sed deserunt assumenda. Perspiciatis quam est enim molestias autem quaerat omnis quo corrupti. Corporis est voluptates voluptate. Quaerat ut est harum ratione ratione modi accusamus. Ratione quisquam ab est facilis voluptatem sed reiciendis.', CAST(9.00 AS Decimal(10, 2)), N'7287 Passage Dauphine', N'0134478266', N'0672442382', N'Sheryl.Berger7@yahoo.fr', N'36457', N'Rouen', 214)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (485, N'Zaatar Libanais', N'zaatar-libanais', 215, N'Itaque accusantium tenetur quis aut quaerat reiciendis sed consequatur ducimus. Qui quae qui doloribus sint nulla. Blanditiis cum quibusdam porro quas et. Rerum hic facere recusandae ab. Autem natus ad reprehenderit. Optio aut maxime.', CAST(9.00 AS Decimal(10, 2)), N'49 Allée Monsieur-le-Prince', N'0190259437', N'0665566102', N'Genevieve77@yahoo.fr', N'28792', N'Boulogne-Billancourt', 215)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (486, N'Big Falafel', N'big-falafel', 215, N'Nostrum omnis laborum dignissimos consequuntur. Veritatis ratione debitis dolor. Non porro qui voluptatem quam eum sed qui repellendus. Veritatis occaecati dolorum. Et quo voluptatibus ut nam maiores libero cupiditate vitae saepe.', CAST(8.00 AS Decimal(10, 2)), N'035 Rue Delesseux', N'0195711581', N'0657590384', N'Lula31@gmail.com', N'98217', N'Saint-Denis', 216)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (487, N'Marché Libanais', N'marche-libanais', 215, N'Aperiam beatae sed ut doloremque debitis eveniet. Ea id aut omnis. Et nulla ut et accusantium est. Adipisci ratione soluta fuga nobis omnis alias. Excepturi non velit dolorem labore dolorem cupiditate quia. Eum harum quis voluptatem saepe saepe.', CAST(14.00 AS Decimal(10, 2)), N'02 Voie du Havre', N'0190215392', N'0642483524', N'Ervin.Gerard@hotmail.fr', N'76190', N'Asnières-sur-Seine', 217)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (488, N'King Falafel Palace', N'king-falafel-palace', 215, N'Doloribus neque similique itaque. Repudiandae et sint vitae. Aut laudantium ut maiores dolor explicabo excepturi neque sit velit. Quos sequi laborum quis labore ullam. Est aut qui voluptatibus architecto accusantium.', CAST(8.00 AS Decimal(10, 2)), N'3076 Voie Bonaparte', N'0166847943', N'0604460801', N'Kim.Hubert@gmail.com', N'27564', N'Grenoble', 218)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (489, N'O Beyrouth', N'o-beyrouth', 215, N'Est consequuntur maxime voluptatem aut fugiat eum consequatur. Officia incidunt sit beatae et distinctio. Rerum perspiciatis omnis iste nemo dolores ut et itaque pariatur. Possimus eos nihil dolorem dicta atque a et.', CAST(10.00 AS Decimal(10, 2)), N'1852 Voie Bonaparte', N'0156783072', N'0630154581', N'Ignacio_Sanchez@hotmail.fr', N'29661', N'Colmar', 219)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (490, N'Shawarma Lovers', N'shawarma-lovers', 215, N'Dolorum dolor vitae quo quia dolores eum illo est. Vero aspernatur quo et sunt qui modi consequuntur. Odit quaerat reiciendis autem laboriosam unde recusandae cupiditate sunt. Maiores et doloribus ipsam totam aut quis rerum sed doloremque.', CAST(12.00 AS Decimal(10, 2)), N'1861 Avenue d''Assas', N'0136521432', N'0657100256', N'Hope.Roger@gmail.com', N'82276', N'Calais', 220)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (491, N'Topoly', N'topoly', 215, N'Amet facilis id eaque soluta id maxime dolor necessitatibus aut. Nihil atque nobis harum dolore voluptatem laboriosam suscipit veniam vitae. Magni consequatur corrupti dolorum alias voluptas repellat qui. Doloremque fuga earum sit et animi.', CAST(14.00 AS Decimal(10, 2)), N'0283 Quai Dauphine', N'0100778249', N'0645608651', N'Latoya73@hotmail.fr', N'97755', N'Saint-Denis', 221)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (492, N'Five Pizza Original', N'five-pizza-original', 216, N'Possimus est esse repellat recusandae veniam aut. Magni ut odio harum blanditiis nulla nemo voluptas officiis. Eaque qui enim itaque. Vel cumque dolor. Qui mollitia ullam voluptatum voluptatem quibusdam.', CAST(9.00 AS Decimal(10, 2)), N'099 Voie Marcadet', N'0197330991', N'0673124265', N'Patsy_Schmitt6@hotmail.fr', N'83027', N'Bordeaux', 222)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (493, N'5PIZZ', N'5pizz', 216, N'Aspernatur sed culpa aut. Vel architecto tempore dolore voluptatem corporis est vel a quidem. Voluptatem tempore iusto pariatur sint expedita sequi consequatur dolores. Aspernatur fugit earum aliquid voluptatibus voluptatem ducimus nihil omnis. Quas odio et aliquam. Qui sint qui similique.', CAST(10.00 AS Decimal(10, 2)), N'7646 Voie Dauphine', N'0144948480', N'0624923079', N'Diane.Muller@yahoo.fr', N'02703', N'Cergy', 223)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (494, N'Chez Alfredo', N'chez-alfredo', 216, N'Velit quam animi est et magnam nulla voluptatem veritatis. Aut facilis ipsam maxime porro nobis ad et. Nihil quisquam voluptatum nihil ut repellendus saepe.', CAST(10.00 AS Decimal(10, 2)), N'432 Avenue de la Huchette', N'0165871455', N'0660945329', N'Jana46@hotmail.fr', N'53724', N'Saint-Nazaire', 224)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (495, N'Mulberry Street', N'mulberry-street', 216, N'Ex pariatur et nemo repellendus mollitia consequatur mollitia perspiciatis. Non dolore aperiam labore. Omnis quae qui. At nostrum ea nihil excepturi numquam quaerat cum sit fugiat. Tempore est est earum autem soluta temporibus sit hic ea.', CAST(3.00 AS Decimal(10, 2)), N'6310 Rue La Boétie', N'0129561027', N'0664348594', N'Rene.Martin75@hotmail.fr', N'66700', N'Quimper', 225)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (496, N'Pizza La Fayette', N'pizza-la-fayette', 216, N'Sit atque in. Perferendis aliquam aut quo nihil corrupti amet. Deleniti vitae quae mollitia occaecati. Officiis iusto quam. Inventore explicabo ipsam est.', CAST(9.00 AS Decimal(10, 2)), N'5318 Avenue du Chat-qui-Pêche', N'0128886910', N'0608937292', N'Carl.Colin@yahoo.fr', N'53936', N'Dunkerque14', 226)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (497, N'Pizza Rustica', N'pizza-rustica', 216, N'Aut nihil incidunt est fugit aut. Vero distinctio molestiae porro unde recusandae sed sequi magnam. Deleniti quod aut in excepturi. Veniam corrupti animi facere perferendis laudantium quaerat voluptates quidem velit. Molestias provident earum enim distinctio cupiditate repudiandae blanditiis est. Distinctio blanditiis saepe molestiae dolorem sit.', CAST(5.00 AS Decimal(10, 2)), N'075 Rue Zadkine', N'0113884491', N'0652734503', N'Christina.Pierre@hotmail.fr', N'97463', N'Vitry-sur-Seine', 227)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (498, N'César Montorgueil', N'cesar-montorgueil', 216, N'Animi sint enim aut. Sint aperiam inventore praesentium tempore quae non doloribus. Voluptatibus fugit hic sit quia nihil et. Aliquam tempore accusantium suscipit in. Et aut aspernatur assumenda fugit deleniti numquam. Impedit aliquam impedit incidunt dolorum quidem magnam quia.', CAST(6.00 AS Decimal(10, 2)), N'1210 Place de Caumartin', N'0118351346', N'0629326835', N'Jackie18@hotmail.fr', N'13166', N'Troyes', 228)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (499, N'Amala', N'amala', 216, N'Accusantium illum occaecati corrupti. Consequatur hic adipisci doloribus accusantium autem eos. Exercitationem magnam sit molestiae modi.', CAST(6.00 AS Decimal(10, 2)), N'84 Quai du Bac', N'0143428699', N'0672606283', N'Jesus.Jean@hotmail.fr', N'13760', N'Montreuil', 229)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (500, N'Falstaff', N'falstaff', 216, N'Autem rerum similique vero dicta voluptatem rem eveniet sit nisi. Eum eveniet qui. Dolorum accusantium est quod debitis quaerat occaecati cum praesentium deserunt. Et aut ut accusantium. Veritatis et provident.', CAST(4.00 AS Decimal(10, 2)), N'9 Impasse Charlemagne', N'0174331360', N'0651361203', N'Annie.Olivier@hotmail.fr', N'24285', N'Niort', 230)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (501, N'Palazzo di Pasta', N'palazzo-di-pasta', 216, N'At eligendi eum. Voluptatem sequi temporibus dolor et. Enim vel impedit. Quis molestias aut consequatur omnis blanditiis. Necessitatibus dolores et molestiae fuga ut iusto eum. Natus ut enim.', CAST(11.00 AS Decimal(10, 2)), N'31 Boulevard du Bac', N'0130982603', N'0650131577', N'Noah89@gmail.com', N'13884', N'Saint-Denis', 231)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (502, N'Pizza Presto', N'pizza-presto', 216, N'Autem voluptatibus explicabo officia. Ipsum dolorem dicta et tempore ad maiores numquam exercitationem. Rerum temporibus praesentium ducimus earum qui nulla libero. Natus rerum natus sit voluptas est.', CAST(5.00 AS Decimal(10, 2)), N'3470 Avenue du Havre', N'0182189070', N'0681640683', N'Edwin92@hotmail.fr', N'13800', N'Perpignan', 232)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (503, N'Chez Aldo', N'chez-aldo', 216, N'Dolore aut ut totam et odio qui. Labore placeat alias provident est repellat corporis. Earum tempore expedita asperiores quis. Maiores nobis et odit qui voluptatem.', CAST(6.00 AS Decimal(10, 2)), N'57 Allée Laffitte', N'0122890462', N'0614645893', N'Tracy_Blanc@hotmail.fr', N'69001', N'Mérignac', 233)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (504, N'Del Arte', N'del-arte', 216, N'Voluptatum quaerat nulla minima vero voluptas autem est nam. Eos in enim consequuntur. Vero non quae excepturi reiciendis.', CAST(3.00 AS Decimal(10, 2)), N'29 Allée des Rosiers', N'0114989135', N'0613457502', N'Cornelius.Gautier42@yahoo.fr', N'19839', N'Cholet', 234)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (505, N'Italian Trattoria', N'italian-trattoria', 216, N'Maiores consectetur voluptatem ea excepturi. Laudantium neque sed dolorem. Nemo sed consequatur assumenda dolorem repellendus error. Magni nulla alias debitis quo in nobis nemo. Molestias delectus minima voluptatem sint voluptas provident quam voluptatibus. Temporibus soluta repellat numquam.', CAST(10.00 AS Decimal(10, 2)), N'5 Avenue de Paris', N'0124958073', N'0661749358', N'Theresa_Durand@hotmail.fr', N'53943', N'Vitry-sur-Seine', 235)
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (456, 3014)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (457, 3015)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (458, 3016)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (459, 3017)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (460, 3018)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (461, 3019)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (462, 3020)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (463, 3021)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (464, 3022)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (465, 3023)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (466, 3024)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (467, 3025)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (468, 3026)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (469, 3027)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (470, 3028)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (471, 3029)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (472, 3030)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (473, 3031)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (474, 3032)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (475, 3033)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (476, 3034)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (477, 3035)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (478, 3036)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (479, 3037)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (480, 3038)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (481, 3039)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (482, 3040)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (483, 3041)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (484, 3042)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (485, 3043)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (486, 3044)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (487, 3045)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (488, 3046)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (489, 3047)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (490, 3048)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (491, 3049)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (492, 3050)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (493, 3051)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (494, 3052)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (495, 3053)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (496, 3054)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (497, 3055)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (498, 3056)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (499, 3057)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (500, 3058)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (501, 3059)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (502, 3060)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (503, 3061)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (504, 3062)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (505, 3063)
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IdRole], [Nom]) VALUES (1, N'Utilisateur')
INSERT [dbo].[Role] ([IdRole], [Nom]) VALUES (2, N'Restaurateur')
INSERT [dbo].[Role] ([IdRole], [Nom]) VALUES (3, N'Admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[SessionUtilisateur] ([IdSession], [DateSession]) VALUES (N'yvxclddo0gc1ksfyphbyqong', CAST(N'2020-03-10T17:18:34.397' AS DateTime))
SET IDENTITY_INSERT [dbo].[TypeCuisine] ON 

INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (209, N'Asiatique', 3006)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (210, N'Boulangerie', 3007)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (211, N'Brasserie', 3008)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (212, N'Fastfood', 3009)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (213, N'Francaise', 3010)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (214, N'Indien', 3011)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (215, N'Libanais', 3012)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (216, N'Pizza', 3013)
SET IDENTITY_INSERT [dbo].[TypeCuisine] OFF
SET IDENTITY_INSERT [dbo].[TypeVersement] ON 

INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (2, N'Espèces', 1)
INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (3, N'Chèque restaurant', 1)
SET IDENTITY_INSERT [dbo].[TypeVersement] OFF
SET IDENTITY_INSERT [dbo].[Utilisateur] ON 

INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (179, N'TuTu', N'Toto', N'admin', N'AMoTpYaTvGpiM19PO4EfYsDBLp9wYes8xZZJ3tM2TlamHNeVmkbeG95frtsy1AZVkA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (180, N'Kergall', N'Yoann', N'yoann', N'AHLYgNNZcZIn7LJgdyj2ksi+I5fcaq7x0bOHCC2UInLr5uiinOskSts55CbokNvAeQ==', 1, CAST(500.00 AS Decimal(10, 2)), N'tuyfw5c4fu5r4opp1kd1kqsb', 1)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (181, N'Henry', N'Ada', N'Ada.Henry', N'ANreC4FG+Bu6KHSr1cqmbrJVRVfX+VrYnsgKqwJ33NjiGsEerkE9ghMgH6/Y/BbrBg==', 1, CAST(52.52 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (182, N'Renault', N'Armando', N'Armando_Renault0', N'AHYXEEpS7RhuAIziOuNGwU/8jZCTfJnbQqdp9OJ48qnpUExXNju2a7tlK4hCs+CSUA==', 1, CAST(73.52 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (183, N'Leclerc', N'Christopher', N'Christopher98', N'APsiS+mZwGhbhOAEDECvB2jL2dZDBaPYGHZoTSmIXFkvYsoxuRz5+klYrjARe4fdyA==', 1, CAST(30.32 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (184, N'Vidal', N'Audrey', N'Audrey10', N'ALARod5APQEBFby/bAV9+788f24zPcIZIZh71GpiUJ+5VllzReSyVTIUOmEI8q4qbA==', 1, CAST(66.60 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (185, N'Clement', N'Toby', N'Toby.Clement22', N'AN3zpZeeFyvuSVLiEVdkU4B5MczY3rMtUg70WC8nDVcawiKQrTE7EKWLMsitXyNnEw==', 1, CAST(26.08 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (186, N'Picard', N'Shelia', N'Shelia27', N'ALj31xj0CGcjQzIoF5rfiC6+PTjfEA7KLusK+M7265UTwPgScvtrkpUP+Zen4DB+Fg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (187, N'Petit', N'Henry', N'Henry.Petit', N'ABbhZDoELY3OFYPtK7598IIFguYHQmyQozi4YDNWcE3oQyyTU3p+vHmmv5fnmzqtcg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (188, N'Duval', N'Andres', N'Andres_Duval1', N'AEgTBtUl6sZ8IdJtIcG/cWtHfpO3DoE+fjnek5gRSE11w9WMzdfHuu8JEQ9gXl5KrA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (189, N'Roger', N'Leo', N'Leo.Roger', N'AJRTH9KfGr9tk2o23tjSB6GlEsgwbLs1O8+FvGJMKfrxZRFnlDQx8y5Gd26cZx8MbA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (190, N'Fabre', N'Kim', N'Kim34', N'AE1sM++W+vo+g3na13j8Q3IK7jt8VFG0OBH/FrEVKwN0HjEzqT5NHw9pst5V3OWnCw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (191, N'Aubry', N'Bernice', N'Bernice9', N'AC57HucFi6UxckmYmBOac9NC1a6wXvY4IPdxTQO7GUBjawYdNePoTeDNCZ9UC9GXhw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (192, N'Moulin', N'Sabrina', N'Sabrina_Moulin', N'AGMXcKbgvKam+co/aMri3fqneODuixQ840fQdxc7lWB0jdgcCsAf9PDFWa7C0Tcj8Q==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (193, N'Clement', N'Angelica', N'Angelica_Clement', N'ALgqpZDv9d1UCDOyInGHfH3vchIPiPHShpj8qKWQHY6DjaADshmuno6aPvHPaKkBQg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (194, N'Garcia', N'Alicia', N'Alicia_Garcia', N'APLui/a12UqQeaXN2FEOXwWcED64LEffRKCJm7v4x535dBngKUeNVjS8lUQRvgmDrA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (195, N'Rodriguez', N'Angela', N'Angela98', N'AMRugvLF5R3ToZ4L7MpbkgrUeKRgGmFP72/mg8p+ddR1QoQTKEjsGvQvEKuSlaRhyg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (196, N'Marchand', N'Emmett', N'Emmett_Marchand', N'AOig7BRV/yI0zu5FABLfBpBf1QRlEYnzdZv4Nzbo+XJGscffKZfR4/x/5jCJI+Z9fQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (197, N'Francois', N'Rosa', N'Rosa28', N'AOX0BuvP4Vr1VmadubEQJHg2NUwq0blfXqR2uSQHPPrxgp9Lfk1WtOoTgW6g7EF1uA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (198, N'Maillard', N'Lewis', N'Lewis.Maillard', N'AKpvEicpK9DAnLbMpx1pNaKa90tZDhDNuC+tifNQ2O5TTiL9boBLVS4X7K57MF3TzQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (199, N'Giraud', N'Winston', N'Winston.Giraud', N'APfgpKy1fZvgxz+g2tgzP4uP1BzlJXHevQ07irljGvIV6r60W1kTmkXiSFxcqMRb/Q==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (200, N'Fernandez', N'Megan', N'Megan_Fernandez25', N'ANJaz8LmRjz/cZbzr6byNVn3AlxpyUlwTY5rv4rmLwIzu9RtgPxsnx+wafA1GAX75A==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (201, N'Charles', N'Jean', N'Jean_Charles94', N'AJZJmL/nSqzLzktvhv5+bSHytcuuW5D51GEbR78vK1hiSlE5xKjdFc7dSiNfjd+8uw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (202, N'Rey', N'Tommie', N'Tommie_Rey97', N'AFg/FLWLiTXBXLC94GpMlOzj2DFXmZkSNPJeNFatYbzlt7k6F/g74qIZEEcWj6hI1g==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (203, N'Menard', N'Danny', N'Danny27', N'AJ1titU8p0JKovYE8J4zUN4iWZZTR6GjVRzwxLZ6IteH7BdrS/Au800GWW5e61vxKw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (204, N'Caron', N'Wilbert', N'Wilbert.Caron71', N'AG899scYakNFWBbHCXRV5v2OlQDK9WLNFEwVEEQNHNFp2MsQEZhhkQeAE/1AKaCqgQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (205, N'Guerin', N'Jeanette', N'Jeanette0', N'AD+IT81I6PJX9lKI5T9XmVBmQ0L10zDMr8LpvMpBWXpOru/12l/MVghr0kecd1usow==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (206, N'Aubry', N'Neil', N'Neil.Aubry54', N'AAYm//j1vgF7VHds3AXem0btF3Pg8mC4s9DNuHrOtmSf76xkONQAuPmGDdky5DadSA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (207, N'Philippe', N'Ervin', N'Ervin_Philippe53', N'ALqAnWGo1c7A1OmTfMevxeEgB/PmD3XgwqRnmQ01wkh5yc5czug+7/npI55gt5kpmw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (208, N'Marchand', N'Josephine', N'Josephine_Marchand8', N'AMRwOP4BQchWGZooAQ03wM5MG9xLgZiIXp3G5jaKzCEIiuC/jbUAf1Lf3lLLemSTkA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (209, N'Denis', N'Amanda', N'Amanda86', N'AJcDVnxLHnksi8FMknelv7QbQYo4XZiLQR501EpUQY3M9Qff2DwB71XzujB20t07Ug==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (210, N'Roussel', N'Elias', N'Elias_Roussel24', N'AJHLjtA8Fobm5lpE6Nsu9ljHA2wz/5H2kCa/o7ACMdzoM9h1MjPspruhn+Sh3pMMsA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (211, N'Gauthier', N'Tara', N'Tara.Gauthier63', N'ALXxn/ol3KB7YuB8Q/Qki+F+c1xksU5c3NvFUVluQK0+HKlOaPv0+vRzB3BUtBm7cg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (212, N'Fontaine', N'Colleen', N'Colleen.Fontaine', N'AOraHz4fUbBLMl5NxP9lu6zcOSiohV9RzsfOXl8359G/4//Uu6Qn0nxxv8OXh0h0Nw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (213, N'Huet', N'Brad', N'Brad.Huet', N'AKo6Dtk1qsfcwTIjxRfk67sViVb5ECYQstA1CN2ZMhIKPudQJwt3BynHmGlSMCNe+Q==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (214, N'Berger', N'Sheryl', N'Sheryl5', N'AE+PeH7KJURCYgbuxU314gnBUAH6B7nLwx3e0WaPbt95KtDnotLERjlzTP3+5jBiJg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (215, N'Collet', N'Genevieve', N'Genevieve73', N'AC3BJWvFdW5o3q8IjSakfMYmeEpsply7Mbk4ePDxw0fip8/JRInVP0Q4NvVWujVzhg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (216, N'Richard', N'Lula', N'Lula.Richard', N'AM/dvpapEb7Syi+E1H72bJDyKGM+S/F0KsceCiDbr6D6pIj3TylzAdw8nlaVUHCnuA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (217, N'Gerard', N'Ervin', N'Ervin24', N'ACX6Va0veGw4uH/fMVNF8wsRDCSFselKEUtaL7CorDa0LLdkxadD6gwoTMASC2+cew==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (218, N'Hubert', N'Kim', N'Kim32', N'AEvFX2nFOLTUdPxSVKMGBvHpXV+I1e5i62FNBXNz1N/4UELJinzixtqP1mGhC20XMA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (219, N'Sanchez', N'Ignacio', N'Ignacio.Sanchez0', N'AEkouZQVUWdxbTt2fO1VLWbf4Qw/l9EwUhg/GH5nWYDNlN3ER9JIVGRixyGY2qJitQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (220, N'Roger', N'Hope', N'Hope_Roger', N'AJRlqQR+2OjO4luoT3Lq8nAziJrqKhqZMngfCGFuAosAyVn1WpVRQmw1LWn5AQskmw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (221, N'Mercier', N'Latoya', N'Latoya97', N'AEPAekjobHtuNnrQ0HE1ZC5SA30zLw8aSPDuECVr+JtcxxIpy2Cb//eWGPKbieEpeQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (222, N'Schmitt', N'Patsy', N'Patsy_Schmitt6', N'AAyPjUzfOsO/BNGMhCyLF9yIedAk9uQREWH7UZ2vrDFsLIG08ots2IrHi+tJ/XIbhw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (223, N'Muller', N'Diane', N'Diane.Muller81', N'AC3QzB6sAs4FOeITbeCuVK8gQahmy46TdaADTRpQRKrDTUOE5MLgh0VTCmEg59xvKg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (224, N'Dupont', N'Jana', N'Jana23', N'AEbxses5700O+4RSj5Z4xwd/Oj4wvl821bup/xDOtmIW1JNUc4NCkQ2XzMgXdyooxg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (225, N'Martin', N'Rene', N'Rene7', N'AC4f8EnTHcSz649wS6yR8wCiFIXGJ2gkcUjL5iJMNa9dDmPmpByyGXsXZYhH7F+QcQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (226, N'Colin', N'Carl', N'Carl_Colin76', N'AKc1MWOChZZZ3X/uqMTvhVHNaNFObbG09Gyt99BHOUbaDpBUPGtjqTlFSIpeRVOSDg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (227, N'Pierre', N'Christina', N'Christina77', N'AOA0VtCkkj1rSwwZANDMUvF1GZgO+DSkMJNltu8avGxf/z90HkWRo6onu8eXE0O1wQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (228, N'Picard', N'Jackie', N'Jackie3', N'AEylhxutSa6bBdvjaRKHdv8pHAsf24TPD3i4/9rFWjAlXTOegonQg0T9EH0mryLOMw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (229, N'Jean', N'Jesus', N'Jesus.Jean', N'AJlvl7nDSXoTFyoEDsqX5FctokG6/LLEER/Z4pLQdJDcBEI1CUU2fHjz2vXhg4ga5A==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (230, N'Olivier', N'Annie', N'Annie_Olivier65', N'APR14M6sHTgWdEPTbPmDU0hnle2hy5hf9O3IHJ5pLQaT+6Ubt0pCrwXSlT0dHKbe/Q==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (231, N'Olivier', N'Noah', N'Noah.Olivier26', N'AAYA0VCcpRrY+UpqXooJRuP13yR6yD42sV7+uUaJATq88YhsAXyU33i+anIpbjpXug==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (232, N'Da silva', N'Edwin', N'Edwin.Dasilva', N'AF5BBluup1qQZqRI9neufuSag9gn0RcBcD3Kdp2err43EofCouoRPn5PfVxywvFi9w==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (233, N'Blanc', N'Tracy', N'Tracy.Blanc', N'AAT/2bweYYEXoD1iR0WnU8kPPGVPh0PA/33acnA/+tlUTZZXaG8NGHsIszRklzTNFQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (234, N'Gautier', N'Cornelius', N'Cornelius_Gautier', N'AIUQuvlH/zB3tSm1WFqRRrLeSaIgnd+wwIB4y6nmFZdoJctM8/ZkOt/yrp6cMwDX5A==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession], [IdRole]) VALUES (235, N'Durand', N'Theresa', N'Theresa.Durand', N'AMJZQzzJaemsNL1IRcb/a8VUr+peVu3AUMFhFAW9lHdoAmmEnVPM8VJdHplVeWTfyA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL, 2)
SET IDENTITY_INSERT [dbo].[Utilisateur] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Utilisateur]    Script Date: 10/03/2020 17:22:45 ******/
ALTER TABLE [dbo].[Utilisateur] ADD  CONSTRAINT [IX_Utilisateur] UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD  CONSTRAINT [FK_Commande_EtatCommande] FOREIGN KEY([IdEtatCommande])
REFERENCES [dbo].[EtatCommande] ([IdEtatCommande])
GO
ALTER TABLE [dbo].[Commande] CHECK CONSTRAINT [FK_Commande_EtatCommande]
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD  CONSTRAINT [FK_Commande_Restaurant] FOREIGN KEY([IdRestaurant])
REFERENCES [dbo].[Restaurant] ([IdRestaurant])
GO
ALTER TABLE [dbo].[Commande] CHECK CONSTRAINT [FK_Commande_Restaurant]
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD  CONSTRAINT [FK_Commande_Utilisateur] FOREIGN KEY([IdUtilisateur])
REFERENCES [dbo].[Utilisateur] ([IdUtilisateur])
GO
ALTER TABLE [dbo].[Commande] CHECK CONSTRAINT [FK_Commande_Utilisateur]
GO
ALTER TABLE [dbo].[CommandeProduit]  WITH CHECK ADD  CONSTRAINT [FK_CommandeProduit_Commande] FOREIGN KEY([IdCommande])
REFERENCES [dbo].[Commande] ([IdCommande])
GO
ALTER TABLE [dbo].[CommandeProduit] CHECK CONSTRAINT [FK_CommandeProduit_Commande]
GO
ALTER TABLE [dbo].[CommandeProduit]  WITH CHECK ADD  CONSTRAINT [FK_CommandeProduit_Produit] FOREIGN KEY([IdProduit])
REFERENCES [dbo].[Produit] ([IdProduit])
GO
ALTER TABLE [dbo].[CommandeProduit] CHECK CONSTRAINT [FK_CommandeProduit_Produit]
GO
ALTER TABLE [dbo].[CommandeProduitMenu]  WITH CHECK ADD  CONSTRAINT [FK_CommandeProduitMenu_CommandeProduit] FOREIGN KEY([IdCommandeProduit])
REFERENCES [dbo].[CommandeProduit] ([IdCommandeProduit])
GO
ALTER TABLE [dbo].[CommandeProduitMenu] CHECK CONSTRAINT [FK_CommandeProduitMenu_CommandeProduit]
GO
ALTER TABLE [dbo].[CommandeProduitMenu]  WITH CHECK ADD  CONSTRAINT [FK_CommandeProduitMenu_Menu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([IdMenu])
GO
ALTER TABLE [dbo].[CommandeProduitMenu] CHECK CONSTRAINT [FK_CommandeProduitMenu_Menu]
GO
ALTER TABLE [dbo].[CommandeProduitProduit]  WITH CHECK ADD  CONSTRAINT [FK_CommandeProduitProduit_CommandeProduit] FOREIGN KEY([IdCommandeProduit])
REFERENCES [dbo].[CommandeProduit] ([IdCommandeProduit])
GO
ALTER TABLE [dbo].[CommandeProduitProduit] CHECK CONSTRAINT [FK_CommandeProduitProduit_CommandeProduit]
GO
ALTER TABLE [dbo].[CommandeProduitProduit]  WITH CHECK ADD  CONSTRAINT [FK_CommandeProduitProduit_Produit] FOREIGN KEY([IdProduit])
REFERENCES [dbo].[Produit] ([IdProduit])
GO
ALTER TABLE [dbo].[CommandeProduitProduit] CHECK CONSTRAINT [FK_CommandeProduitProduit_Produit]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Photo] FOREIGN KEY([IdPhoto])
REFERENCES [dbo].[Photo] ([IdPhoto])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Photo]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Restaurant] FOREIGN KEY([IdRestaurant])
REFERENCES [dbo].[Restaurant] ([IdRestaurant])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Restaurant]
GO
ALTER TABLE [dbo].[MenuCategorie]  WITH CHECK ADD  CONSTRAINT [FK_MenuCategorie_Categorie] FOREIGN KEY([IdCategorie])
REFERENCES [dbo].[Categorie] ([IdCategorie])
GO
ALTER TABLE [dbo].[MenuCategorie] CHECK CONSTRAINT [FK_MenuCategorie_Categorie]
GO
ALTER TABLE [dbo].[MenuCategorie]  WITH CHECK ADD  CONSTRAINT [FK_MenuCategorie_Menu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([IdMenu])
GO
ALTER TABLE [dbo].[MenuCategorie] CHECK CONSTRAINT [FK_MenuCategorie_Menu]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_TypeVersement] FOREIGN KEY([IdTypeVersement])
REFERENCES [dbo].[TypeVersement] ([IdTypeVersement])
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_TypeVersement]
GO
ALTER TABLE [dbo].[Operation]  WITH CHECK ADD  CONSTRAINT [FK_Operation_Utilisateur] FOREIGN KEY([IdUtilisateur])
REFERENCES [dbo].[Utilisateur] ([IdUtilisateur])
GO
ALTER TABLE [dbo].[Operation] CHECK CONSTRAINT [FK_Operation_Utilisateur]
GO
ALTER TABLE [dbo].[Produit]  WITH CHECK ADD  CONSTRAINT [FK_Produit_Categorie] FOREIGN KEY([IdCategorie])
REFERENCES [dbo].[Categorie] ([IdCategorie])
GO
ALTER TABLE [dbo].[Produit] CHECK CONSTRAINT [FK_Produit_Categorie]
GO
ALTER TABLE [dbo].[Produit]  WITH CHECK ADD  CONSTRAINT [FK_Produit_Restaurant] FOREIGN KEY([IdRestaurant])
REFERENCES [dbo].[Restaurant] ([IdRestaurant])
GO
ALTER TABLE [dbo].[Produit] CHECK CONSTRAINT [FK_Produit_Restaurant]
GO
ALTER TABLE [dbo].[ProduitCompose]  WITH CHECK ADD  CONSTRAINT [FK_ProduitCompose_Produit] FOREIGN KEY([IdProduit])
REFERENCES [dbo].[Produit] ([IdProduit])
GO
ALTER TABLE [dbo].[ProduitCompose] CHECK CONSTRAINT [FK_ProduitCompose_Produit]
GO
ALTER TABLE [dbo].[ProduitCompose]  WITH CHECK ADD  CONSTRAINT [FK_ProduitCompose_Produit1] FOREIGN KEY([IdProduitPere])
REFERENCES [dbo].[Produit] ([IdProduit])
GO
ALTER TABLE [dbo].[ProduitCompose] CHECK CONSTRAINT [FK_ProduitCompose_Produit1]
GO
ALTER TABLE [dbo].[ProduitPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProduitPhoto_Photo] FOREIGN KEY([IdPhoto])
REFERENCES [dbo].[Photo] ([IdPhoto])
GO
ALTER TABLE [dbo].[ProduitPhoto] CHECK CONSTRAINT [FK_ProduitPhoto_Photo]
GO
ALTER TABLE [dbo].[ProduitPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProduitPhoto_Produit] FOREIGN KEY([IdProduit])
REFERENCES [dbo].[Produit] ([IdProduit])
GO
ALTER TABLE [dbo].[ProduitPhoto] CHECK CONSTRAINT [FK_ProduitPhoto_Produit]
GO
ALTER TABLE [dbo].[Restaurant]  WITH CHECK ADD  CONSTRAINT [FK_Restaurant_TypeCuisine] FOREIGN KEY([IdTypeCuisine])
REFERENCES [dbo].[TypeCuisine] ([IdTypeCuisine])
GO
ALTER TABLE [dbo].[Restaurant] CHECK CONSTRAINT [FK_Restaurant_TypeCuisine]
GO
ALTER TABLE [dbo].[Restaurant]  WITH CHECK ADD  CONSTRAINT [FK_Restaurant_Utilisateur] FOREIGN KEY([IdUtilisateur])
REFERENCES [dbo].[Utilisateur] ([IdUtilisateur])
GO
ALTER TABLE [dbo].[Restaurant] CHECK CONSTRAINT [FK_Restaurant_Utilisateur]
GO
ALTER TABLE [dbo].[RestaurantPhoto]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantPhoto_Photo] FOREIGN KEY([IdPhoto])
REFERENCES [dbo].[Photo] ([IdPhoto])
GO
ALTER TABLE [dbo].[RestaurantPhoto] CHECK CONSTRAINT [FK_RestaurantPhoto_Photo]
GO
ALTER TABLE [dbo].[RestaurantPhoto]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantPhoto_Restaurant] FOREIGN KEY([IdRestaurant])
REFERENCES [dbo].[Restaurant] ([IdRestaurant])
GO
ALTER TABLE [dbo].[RestaurantPhoto] CHECK CONSTRAINT [FK_RestaurantPhoto_Restaurant]
GO
ALTER TABLE [dbo].[TypeCuisine]  WITH CHECK ADD  CONSTRAINT [FK_TypeCuisine_Photo] FOREIGN KEY([IdPhoto])
REFERENCES [dbo].[Photo] ([IdPhoto])
GO
ALTER TABLE [dbo].[TypeCuisine] CHECK CONSTRAINT [FK_TypeCuisine_Photo]
GO
ALTER TABLE [dbo].[Utilisateur]  WITH CHECK ADD  CONSTRAINT [FK_Utilisateur_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([IdRole])
GO
ALTER TABLE [dbo].[Utilisateur] CHECK CONSTRAINT [FK_Utilisateur_Role]
GO
USE [master]
GO
ALTER DATABASE [AfpEat] SET  READ_WRITE 
GO
