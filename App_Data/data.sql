USE [master]
GO
/****** Object:  Database [AfpEat]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[Categorie]    Script Date: 04/03/2020 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie](
	[IdCategorie] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[Statut] [bit] NOT NULL,
 CONSTRAINT [PK_Categorie] PRIMARY KEY CLUSTERED 
(
	[IdCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commande]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[CommandeProduit]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[CommandeProduitMenu]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[EtatCommande]    Script Date: 04/03/2020 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EtatCommande](
	[IdEtatCommande] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EtatCommande] PRIMARY KEY CLUSTERED 
(
	[IdEtatCommande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 04/03/2020 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[Statut] [bit] NOT NULL,
	[Prix] [decimal](10, 2) NOT NULL,
	[IdRestaurant] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuCategorie]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[Operation]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[Photo]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[Produit]    Script Date: 04/03/2020 15:43:37 ******/
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
	[Description] [varchar](2000) NOT NULL,
	[Quantite] [int] NOT NULL,
 CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED 
(
	[IdProduit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduitCompose]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[ProduitPhoto]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[Restaurant]    Script Date: 04/03/2020 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[IdRestaurant] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](300) NOT NULL,
	[IdTypeCuisine] [int] NOT NULL,
	[Description] [varchar](2000) NOT NULL,
	[Budget] [decimal](10, 2) NOT NULL,
	[Adresse] [varchar](300) NOT NULL,
	[Telephone] [varchar](50) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Email] [varchar](300) NOT NULL,
	[CodePostal] [varchar](10) NOT NULL,
	[Ville] [varchar](100) NOT NULL,
	[Login] [varchar](100) NOT NULL,
	[Password] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[IdRestaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantPhoto]    Script Date: 04/03/2020 15:43:37 ******/
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
/****** Object:  Table [dbo].[SessionUtilisateur]    Script Date: 04/03/2020 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SessionUtilisateur](
	[IdSession] [varchar](50) NOT NULL,
	[DateSession] [datetime] NOT NULL,
 CONSTRAINT [PK_SessionUtilisateur] PRIMARY KEY CLUSTERED 
(
	[IdSession] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeCuisine]    Script Date: 04/03/2020 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeCuisine](
	[IdTypeCuisine] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[IdPhoto] [int] NOT NULL,
 CONSTRAINT [PK_TypeCuisine] PRIMARY KEY CLUSTERED 
(
	[IdTypeCuisine] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeVersement]    Script Date: 04/03/2020 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeVersement](
	[IdTypeVersement] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[Statut] [bit] NOT NULL,
 CONSTRAINT [PK_TypeVersement] PRIMARY KEY CLUSTERED 
(
	[IdTypeVersement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 04/03/2020 15:43:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[IdUtilisateur] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[Prenom] [varchar](100) NOT NULL,
	[Matricule] [varchar](50) NOT NULL,
	[Password] [varchar](300) NOT NULL,
	[Statut] [bit] NOT NULL,
	[Solde] [decimal](10, 2) NOT NULL,
	[IdSession] [varchar](50) NULL,
 CONSTRAINT [PK_Utilisateur] PRIMARY KEY CLUSTERED 
(
	[IdUtilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (50, N'Entrée', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (51, N'Plat', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (52, N'Dessert', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (53, N'Salade', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (54, N'Boisson', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (55, N'Pâtes', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (56, N'Panini', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (57, N'Pizza', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (58, N'Sandwich', 1)
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[EtatCommande] ON 

INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (1, N'En Attente')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (2, N'En cours de préparation')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (3, N'En cours de livraison')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (4, N'Livré')
SET IDENTITY_INSERT [dbo].[EtatCommande] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([IdMenu], [Nom], [Statut], [Prix], [IdRestaurant]) VALUES (1, N'Menu Panini', 1, CAST(10.00 AS Decimal(10, 2)), 106)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (1, 50)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (1, 51)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (1, 52)
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (221, N'asiatique.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (222, N'boulangerie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (223, N'brasserie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (224, N'fastfood.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (225, N'francaise.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (226, N'indien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (227, N'libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (228, N'pizza.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (229, N'Pokawa.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (230, N'Sushi Shop.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (231, N'SHAKA Poke.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (232, N'La Mie Caline.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (233, N'Maison Kayser.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (234, N'Boulangerie Beaubourg.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (235, N'Pomme de Pain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (236, N'Boulangerie artisanale Zerzour.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (237, N'Shake it Easy.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (238, N'Cheezer.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (239, N'Nabab Kebab.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (240, N'Burger & Fries.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (241, N'Les Burgers de Papa.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (242, N'Mac Doner.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (243, N'Fermier Gourmet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (244, N'La cochonnaille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (245, N'Nos Grands-mères ont du Talent.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (246, N'Canard Street.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (247, N'Zoe Bouillon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (248, N'Kitchen Paris.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (249, N'Crêperie Galette Cafe.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (250, N'Bollynan.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (251, N'Aarapana restaurant.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (252, N'Safran.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (253, N'Eat & Cool.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (254, N'Taboulé Paris.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (255, N'Chez le Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (256, N'Le Cèdre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (257, N'Noura.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (258, N'Zaatar Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (259, N'Big Falafel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (260, N'Marché Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (261, N'King Falafel Palace.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (262, N'O Beyrouth.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (263, N'Shawarma Lovers.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (264, N'Topoly.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (265, N'Five Pizza Original.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (266, N'5PIZZ.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (267, N'Chez Alfredo.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (268, N'Mulberry Street.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (269, N'Pizza La Fayette.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (270, N'Pizza Rustica.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (271, N'César Montorgueil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (272, N'Amala.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (273, N'Falstaff.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (274, N'Palazzo di Pasta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (275, N'Pizza Presto.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (276, N'Chez Aldo.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (277, N'Del Arte.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (278, N'Italian Trattoria.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (279, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (280, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (281, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (282, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (283, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (284, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (285, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (286, N'Chirashi Hawaïen.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (287, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (288, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (289, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (290, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (291, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (292, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (293, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (294, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (295, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (296, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (297, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (298, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (299, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (300, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (301, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (302, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (303, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (304, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (305, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (306, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (307, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (308, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (309, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (310, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (311, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (312, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (313, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (314, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (315, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (316, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (317, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (318, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (319, N'Chirashi Hawaïen.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (320, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (321, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (322, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (323, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (324, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (325, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (326, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (327, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (328, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (329, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (330, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (331, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (332, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (333, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (334, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (335, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (336, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (337, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (338, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (339, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (340, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (341, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (342, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (343, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (344, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (345, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (346, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (347, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (348, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (349, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (350, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (351, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (352, N'Chirashi Hawaïen.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (353, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (354, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (355, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (356, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (357, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (358, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (359, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (360, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (361, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (362, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (363, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (364, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (365, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (366, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (367, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (368, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (369, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (370, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (371, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (372, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (373, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (374, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (375, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (376, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (377, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (378, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (379, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (380, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (381, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (382, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (383, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (384, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (385, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (386, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (387, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (388, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (389, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (390, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (391, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (392, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (393, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (394, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (395, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (396, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (397, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (398, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (399, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (400, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (401, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (402, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (403, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (404, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (405, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (406, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (407, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (408, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (409, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (410, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (411, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (412, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (413, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (414, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (415, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (416, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (417, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (418, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (419, N'Tartelette poire amande.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (420, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (421, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (422, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (423, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (424, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (425, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (426, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (427, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (428, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (429, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (430, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (431, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (432, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (433, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (434, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (435, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (436, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (437, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (438, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (439, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (440, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (441, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (442, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (443, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (444, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (445, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (446, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (447, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (448, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (449, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (450, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (451, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (452, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (453, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (454, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (455, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (456, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (457, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (458, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (459, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (460, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (461, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (462, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (463, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (464, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (465, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (466, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (467, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (468, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (469, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (470, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (471, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (472, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (473, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (474, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (475, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (476, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (477, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (478, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (479, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (480, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (481, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (482, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (483, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (484, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (485, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (486, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (487, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (488, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (489, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (490, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (491, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (492, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (493, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (494, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (495, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (496, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (497, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (498, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (499, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (500, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (501, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (502, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (503, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (504, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (505, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (506, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (507, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (508, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (509, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (510, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (511, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (512, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (513, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (514, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (515, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (516, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (517, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (518, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (519, N'Éclair Praliné.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (520, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (521, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (522, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (523, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (524, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (525, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (526, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (527, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (528, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (529, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (530, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (531, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (532, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (533, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (534, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (535, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (536, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (537, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (538, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (539, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (540, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (541, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (542, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (543, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (544, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (545, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (546, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (547, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (548, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (549, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (550, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (551, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (552, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (553, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (554, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (555, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (556, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (557, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (558, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (559, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (560, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (561, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (562, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (563, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (564, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (565, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (566, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (567, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (568, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (569, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (570, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (571, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (572, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (573, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (574, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (575, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (576, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (577, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (578, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (579, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (580, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (581, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (582, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (583, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (584, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (585, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (586, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (587, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (588, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (589, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (590, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (591, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (592, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (593, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (594, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (595, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (596, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (597, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (598, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (599, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (600, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (601, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (602, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (603, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (604, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (605, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (606, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (607, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (608, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (609, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (610, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (611, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (612, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (613, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (614, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (615, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (616, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (617, N'Cup de fruits de saison.jpg')
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Produit] ON 

INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (80, 106, 50, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (81, 106, 50, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (82, 106, 50, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (83, 106, 50, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (84, 106, 50, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (85, 106, 50, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (86, 106, 50, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (87, 106, 51, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (88, 106, 51, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (89, 106, 51, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (90, 106, 51, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (91, 106, 51, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (92, 106, 51, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (93, 106, 51, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (94, 106, 51, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (95, 106, 51, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (96, 106, 52, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (97, 106, 52, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (98, 106, 52, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (99, 106, 52, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (100, 106, 52, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (101, 106, 52, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (102, 106, 52, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (103, 106, 52, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (104, 106, 54, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (105, 106, 54, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (106, 106, 54, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (107, 106, 54, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (108, 106, 54, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (109, 106, 54, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (110, 106, 54, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (111, 106, 54, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (112, 106, 54, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (113, 107, 50, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (114, 107, 50, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (115, 107, 50, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (116, 107, 50, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (117, 107, 50, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (118, 107, 50, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (119, 107, 50, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (120, 107, 51, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (121, 107, 51, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (122, 107, 51, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (123, 107, 51, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (124, 107, 51, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (125, 107, 51, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (126, 107, 51, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (127, 107, 51, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (128, 107, 51, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (129, 107, 52, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (130, 107, 52, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (131, 107, 52, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (132, 107, 52, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (133, 107, 52, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (134, 107, 52, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (135, 107, 52, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (136, 107, 52, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (137, 107, 54, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (138, 107, 54, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (139, 107, 54, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (140, 107, 54, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (141, 107, 54, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (142, 107, 54, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (143, 107, 54, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (144, 107, 54, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (145, 107, 54, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (146, 108, 50, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (147, 108, 50, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (148, 108, 50, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (149, 108, 50, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (150, 108, 50, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (151, 108, 50, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (152, 108, 50, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (153, 108, 51, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (154, 108, 51, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (155, 108, 51, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (156, 108, 51, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (157, 108, 51, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (158, 108, 51, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (159, 108, 51, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (160, 108, 51, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (161, 108, 51, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (162, 108, 52, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (163, 108, 52, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (164, 108, 52, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (165, 108, 52, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (166, 108, 52, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (167, 108, 52, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (168, 108, 52, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (169, 108, 52, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (170, 108, 54, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (171, 108, 54, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (172, 108, 54, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (173, 108, 54, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (174, 108, 54, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (175, 108, 54, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (176, 108, 54, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (177, 108, 54, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (178, 108, 54, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 25)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (179, 109, 57, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (180, 109, 57, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (181, 109, 53, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (182, 109, 53, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (183, 109, 53, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (184, 109, 58, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (185, 109, 58, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (186, 109, 58, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (187, 109, 58, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (188, 109, 58, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (189, 109, 58, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (190, 109, 58, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (191, 109, 58, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (192, 109, 58, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (193, 109, 58, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (194, 109, 58, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (195, 109, 58, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (196, 109, 58, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (197, 109, 58, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (198, 109, 56, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (199, 109, 56, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (200, 109, 56, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (201, 109, 56, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (202, 109, 56, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (203, 109, 52, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (204, 109, 52, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (205, 109, 52, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (206, 109, 52, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (207, 109, 52, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (208, 109, 52, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (209, 109, 52, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (210, 109, 52, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (211, 109, 52, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (212, 109, 52, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (213, 109, 52, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (214, 109, 52, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (215, 109, 52, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (216, 109, 52, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (217, 109, 52, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (218, 109, 52, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (219, 109, 52, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (220, 109, 52, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (221, 109, 52, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (222, 109, 52, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (223, 109, 52, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (224, 109, 52, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (225, 109, 52, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (226, 109, 52, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (227, 110, 57, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (228, 110, 57, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (229, 110, 53, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (230, 110, 53, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (231, 110, 53, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (232, 110, 58, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (233, 110, 58, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (234, 110, 58, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (235, 110, 58, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (236, 110, 58, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (237, 110, 58, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (238, 110, 58, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (239, 110, 58, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (240, 110, 58, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (241, 110, 58, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (242, 110, 58, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (243, 110, 58, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (244, 110, 58, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (245, 110, 58, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (246, 110, 56, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (247, 110, 56, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (248, 110, 56, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (249, 110, 56, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (250, 110, 56, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (251, 110, 52, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (252, 110, 52, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (253, 110, 52, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (254, 110, 52, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (255, 110, 52, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (256, 110, 52, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (257, 110, 52, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (258, 110, 52, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (259, 110, 52, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (260, 110, 52, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (261, 110, 52, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (262, 110, 52, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (263, 110, 52, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (264, 110, 52, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (265, 110, 52, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (266, 110, 52, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (267, 110, 52, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (268, 110, 52, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (269, 110, 52, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (270, 110, 52, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (271, 110, 52, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (272, 110, 52, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (273, 110, 52, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (274, 110, 52, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (275, 111, 57, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (276, 111, 57, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (277, 111, 53, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (278, 111, 53, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 25)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (279, 111, 53, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (280, 111, 58, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (281, 111, 58, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (282, 111, 58, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (283, 111, 58, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (284, 111, 58, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (285, 111, 58, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (286, 111, 58, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (287, 111, 58, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (288, 111, 58, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (289, 111, 58, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (290, 111, 58, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (291, 111, 58, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (292, 111, 58, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (293, 111, 58, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (294, 111, 56, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (295, 111, 56, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (296, 111, 56, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (297, 111, 56, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (298, 111, 56, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (299, 111, 52, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (300, 111, 52, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (301, 111, 52, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (302, 111, 52, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (303, 111, 52, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (304, 111, 52, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (305, 111, 52, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (306, 111, 52, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (307, 111, 52, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (308, 111, 52, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (309, 111, 52, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (310, 111, 52, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (311, 111, 52, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (312, 111, 52, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (313, 111, 52, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (314, 111, 52, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (315, 111, 52, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (316, 111, 52, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (317, 111, 52, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (318, 111, 52, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (319, 111, 52, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (320, 111, 52, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (321, 111, 52, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (322, 111, 52, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (323, 112, 57, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (324, 112, 57, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (325, 112, 53, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (326, 112, 53, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (327, 112, 53, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (328, 112, 58, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (329, 112, 58, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (330, 112, 58, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (331, 112, 58, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (332, 112, 58, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (333, 112, 58, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (334, 112, 58, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (335, 112, 58, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (336, 112, 58, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (337, 112, 58, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (338, 112, 58, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (339, 112, 58, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (340, 112, 58, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (341, 112, 58, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (342, 112, 56, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (343, 112, 56, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (344, 112, 56, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (345, 112, 56, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (346, 112, 56, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (347, 112, 52, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (348, 112, 52, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (349, 112, 52, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (350, 112, 52, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (351, 112, 52, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (352, 112, 52, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (353, 112, 52, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (354, 112, 52, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (355, 112, 52, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (356, 112, 52, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (357, 112, 52, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (358, 112, 52, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (359, 112, 52, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (360, 112, 52, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (361, 112, 52, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (362, 112, 52, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (363, 112, 52, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (364, 112, 52, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (365, 112, 52, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (366, 112, 52, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (367, 112, 52, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (368, 112, 52, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (369, 112, 52, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (370, 112, 52, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (371, 113, 57, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (372, 113, 57, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (373, 113, 53, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (374, 113, 53, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (375, 113, 53, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (376, 113, 58, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (377, 113, 58, N'Graine de chic Guacamole et Galettes de légumes de Soleil. 100% Vegan', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (378, 113, 58, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 20)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (379, 113, 58, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (380, 113, 58, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (381, 113, 58, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (382, 113, 58, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (383, 113, 58, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (384, 113, 58, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (385, 113, 58, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (386, 113, 58, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (387, 113, 58, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (388, 113, 58, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (389, 113, 58, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (390, 113, 56, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (391, 113, 56, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (392, 113, 56, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (393, 113, 56, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (394, 113, 56, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (395, 113, 52, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (396, 113, 52, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (397, 113, 52, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (398, 113, 52, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (399, 113, 52, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (400, 113, 52, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (401, 113, 52, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (402, 113, 52, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (403, 113, 52, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (404, 113, 52, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (405, 113, 52, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (406, 113, 52, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (407, 113, 52, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (408, 113, 52, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (409, 113, 52, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (410, 113, 52, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (411, 113, 52, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (412, 113, 52, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (413, 113, 52, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (414, 113, 52, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (415, 113, 52, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (416, 113, 52, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (417, 113, 52, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (418, 113, 52, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 30)
SET IDENTITY_INSERT [dbo].[Produit] OFF
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (80, 279)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (81, 280)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (82, 281)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (83, 282)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (84, 283)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (85, 284)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (86, 285)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (87, 286)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (88, 287)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (89, 288)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (90, 289)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (91, 290)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (92, 291)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (93, 292)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (94, 293)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (95, 294)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (96, 295)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (97, 296)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (98, 297)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (99, 298)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (100, 299)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (101, 300)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (102, 301)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (103, 302)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (104, 303)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (105, 304)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (106, 305)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (107, 306)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (108, 307)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (109, 308)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (110, 309)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (111, 310)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (112, 311)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (113, 312)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (114, 313)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (115, 314)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (116, 315)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (117, 316)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (118, 317)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (119, 318)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (120, 319)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (121, 320)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (122, 321)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (123, 322)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (124, 323)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (125, 324)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (126, 325)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (127, 326)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (128, 327)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (129, 328)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (130, 329)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (131, 330)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (132, 331)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (133, 332)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (134, 333)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (135, 334)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (136, 335)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (137, 336)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (138, 337)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (139, 338)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (140, 339)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (141, 340)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (142, 341)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (143, 342)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (144, 343)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (145, 344)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (146, 345)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (147, 346)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (148, 347)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (149, 348)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (150, 349)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (151, 350)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (152, 351)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (153, 352)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (154, 353)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (155, 354)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (156, 355)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (157, 356)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (158, 357)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (159, 358)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (160, 359)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (161, 360)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (162, 361)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (163, 362)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (164, 363)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (165, 364)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (166, 365)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (167, 366)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (168, 367)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (169, 368)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (170, 369)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (171, 370)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (172, 371)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (173, 372)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (174, 373)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (175, 374)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (176, 375)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (177, 376)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (178, 377)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (179, 378)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (180, 379)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (181, 380)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (182, 381)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (183, 382)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (184, 383)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (185, 384)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (186, 385)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (187, 386)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (188, 387)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (189, 388)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (190, 389)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (191, 390)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (192, 391)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (193, 392)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (194, 393)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (195, 394)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (196, 395)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (197, 396)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (198, 397)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (199, 398)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (200, 399)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (201, 400)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (202, 401)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (203, 402)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (204, 403)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (205, 404)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (206, 405)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (207, 406)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (208, 407)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (209, 408)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (210, 409)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (211, 410)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (212, 411)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (213, 412)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (214, 413)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (215, 414)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (216, 415)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (217, 416)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (218, 417)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (219, 418)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (220, 419)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (221, 420)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (222, 421)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (223, 422)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (224, 423)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (225, 424)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (226, 425)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (227, 426)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (228, 427)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (229, 428)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (230, 429)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (231, 430)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (232, 431)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (233, 432)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (234, 433)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (235, 434)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (236, 435)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (237, 436)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (238, 437)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (239, 438)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (240, 439)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (241, 440)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (242, 441)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (243, 442)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (244, 443)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (245, 444)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (246, 445)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (247, 446)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (248, 447)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (249, 448)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (250, 449)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (251, 450)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (252, 451)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (253, 452)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (254, 453)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (255, 454)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (256, 455)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (257, 456)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (258, 457)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (259, 458)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (260, 459)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (261, 460)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (262, 461)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (263, 462)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (264, 463)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (265, 464)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (266, 465)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (267, 466)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (268, 467)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (269, 468)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (270, 469)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (271, 470)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (272, 471)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (273, 472)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (274, 473)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (275, 474)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (276, 475)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (277, 476)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (278, 477)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (279, 478)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (280, 479)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (281, 480)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (282, 481)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (283, 482)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (284, 483)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (285, 484)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (286, 485)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (287, 486)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (288, 487)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (289, 488)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (290, 489)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (291, 490)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (292, 491)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (293, 492)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (294, 493)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (295, 494)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (296, 495)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (297, 496)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (298, 497)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (299, 498)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (300, 499)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (301, 500)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (302, 501)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (303, 502)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (304, 503)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (305, 504)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (306, 505)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (307, 506)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (308, 507)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (309, 508)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (310, 509)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (311, 510)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (312, 511)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (313, 512)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (314, 513)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (315, 514)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (316, 515)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (317, 516)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (318, 517)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (319, 518)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (320, 519)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (321, 520)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (322, 521)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (323, 522)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (324, 523)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (325, 524)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (326, 525)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (327, 526)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (328, 527)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (329, 528)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (330, 529)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (331, 530)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (332, 531)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (333, 532)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (334, 533)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (335, 534)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (336, 535)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (337, 536)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (338, 537)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (339, 538)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (340, 539)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (341, 540)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (342, 541)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (343, 542)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (344, 543)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (345, 544)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (346, 545)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (347, 546)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (348, 547)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (349, 548)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (350, 549)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (351, 550)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (352, 551)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (353, 552)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (354, 553)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (355, 554)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (356, 555)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (357, 556)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (358, 557)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (359, 558)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (360, 559)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (361, 560)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (362, 561)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (363, 562)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (364, 563)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (365, 564)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (366, 565)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (367, 566)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (368, 567)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (369, 568)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (370, 569)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (371, 570)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (372, 571)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (373, 572)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (374, 573)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (375, 574)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (376, 575)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (377, 576)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (378, 577)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (379, 578)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (380, 579)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (381, 580)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (382, 581)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (383, 582)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (384, 583)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (385, 584)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (386, 585)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (387, 586)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (388, 587)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (389, 588)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (390, 589)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (391, 590)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (392, 591)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (393, 592)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (394, 593)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (395, 594)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (396, 595)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (397, 596)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (398, 597)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (399, 598)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (400, 599)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (401, 600)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (402, 601)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (403, 602)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (404, 603)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (405, 604)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (406, 605)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (407, 606)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (408, 607)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (409, 608)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (410, 609)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (411, 610)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (412, 611)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (413, 612)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (414, 613)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (415, 614)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (416, 615)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (417, 616)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (418, 617)
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (106, N'Pokawa', 153, N'Et et commodi. Repudiandae et nam. Dolorem dicta laborum et accusantium. Sit eligendi eos. Quo vel eos distinctio reprehenderit fugit. Quia et quos dolorum non expedita.', CAST(9.00 AS Decimal(10, 2)), N'1 Place de la Paix', N'0155075487', N'0680228613', N'Dwight_Meyer@gmail.com', N'57354', N'Rennes', N'Dwight42', N'Wx19FF7k40')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (107, N'Sushi Shop', 153, N'Assumenda est optio voluptas. Nesciunt sequi voluptate beatae. Vero similique mollitia quia odio rem commodi animi impedit velit. Minus et laboriosam quis aliquid aut dolorem et aut. Sapiente amet autem hic distinctio. Aperiam et rerum in eveniet.', CAST(10.00 AS Decimal(10, 2)), N'36 Impasse du Havre', N'0154890058', N'0631630034', N'Eleanor42@yahoo.fr', N'77173', N'Saint-Nazaire', N'Eleanor51', N'qgTuD58i5h')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (108, N'SHAKA Poke', 153, N'Id non fugit et illo. Aliquam non vero distinctio assumenda dignissimos quos perspiciatis. Id totam natus. Saepe impedit ut at. Et in molestias qui architecto tenetur. Est excepturi distinctio id commodi et doloribus itaque placeat.', CAST(12.00 AS Decimal(10, 2)), N'4772 Place Montorgueil', N'0107076363', N'0658229616', N'Eloise.Girard@yahoo.fr', N'49405', N'Poitiers', N'Eloise93', N'aM2lKusxnl')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (109, N'La Mie Câline', 154, N'Reprehenderit quo ut aut error corrupti. Saepe quia qui earum. Eos aspernatur eligendi doloribus rem est quo. Eligendi quo accusantium magni voluptas consequuntur temporibus velit non enim.', CAST(10.00 AS Decimal(10, 2)), N'5 Boulevard Vaneau', N'0109236562', N'0684968431', N'Karla_Blanchard75@gmail.com', N'68358', N'Mérignac', N'Karla.Blanchard', N'VA2kl3IbxT')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (110, N'Maison Kayser', 154, N'Delectus perferendis inventore neque sed. Nemo provident et aspernatur cupiditate voluptate et aut id ipsam. Inventore voluptates distinctio laboriosam distinctio nulla. Ipsa ad maiores est laboriosam quia. Quam dolorem aut deserunt. Error ratione qui repellat odit voluptate et distinctio quas.', CAST(5.00 AS Decimal(10, 2)), N'48 Impasse Marcadet', N'0163216292', N'0693151896', N'Cora_Rolland@hotmail.fr', N'35949', N'Asnières-sur-Seine', N'Cora.Rolland40', N'2KWvQpg5Yv')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (111, N'Boulangerie Beaubourg', 154, N'Quo vel dolores. Quaerat vel autem ipsa qui sed sit. Reiciendis beatae repellat est quis voluptas. Nihil quia sit minima sunt. Facilis earum et consequuntur distinctio numquam tempore eos provident. Deleniti corrupti ipsa alias dignissimos.', CAST(10.00 AS Decimal(10, 2)), N'6783 Passage Laffitte', N'0113791972', N'0663461955', N'Lorena_Bernard@hotmail.fr', N'62232', N'Paris', N'Lorena97', N'whZr0wvPAJ')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (112, N'Pomme de Pain', 154, N'Iure qui eaque in omnis illo. Suscipit aut qui facilis qui. Rerum dolores modi nobis.', CAST(15.00 AS Decimal(10, 2)), N'5 Rue Joubert', N'0111297182', N'0624858479', N'Deanna0@hotmail.fr', N'75067', N'Villeneuve-d''Ascq', N'Deanna76', N'BcxF2LmKNZ')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (113, N'Boulangerie artisanale Zerzour', 154, N'Molestias odio modi nostrum quidem non quo. Architecto omnis nemo perferendis omnis. Qui vitae quas et aut ullam quia.', CAST(6.00 AS Decimal(10, 2)), N'4 Quai de Paris', N'0104982273', N'0652298354', N'Sean84@hotmail.fr', N'79694', N'Caen', N'Sean93', N'Ey3fEUwWrH')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (114, N'Shake it Easy', 155, N'Blanditiis error eum esse commodi tempora impedit quidem. Laborum facilis quam ex ut. Vitae voluptas molestiae. Accusamus non nisi quisquam totam vel et incidunt voluptatum. Adipisci et alias omnis tempore eaque inventore. Enim maxime quaerat.', CAST(4.00 AS Decimal(10, 2)), N'59 Place de la Paix', N'0193345800', N'0621370118', N'Brad_Deschamps@gmail.com', N'71486', N'Courbevoie', N'Brad_Deschamps', N'BU6lR1VeTE')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (115, N'Cheezer', 156, N'Dolorem est accusamus aut fugit. Consequatur quos praesentium ut ea veniam aperiam quas quo pariatur. Ex ab qui deleniti qui ut architecto neque odio. Hic sit tempora. Autem ipsum rerum. Tenetur quia error ad nisi temporibus.', CAST(6.00 AS Decimal(10, 2)), N'3 Passage de l''Abbaye', N'0139603335', N'0608248677', N'Rachael45@gmail.com', N'43257', N'Amiens', N'Rachael46', N'dnq6ks3ck1')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (116, N'Nabab Kebab', 156, N'Inventore est repellendus quisquam dolores qui vel odit eveniet. Qui tempore eos ea sint dolores. Tempora voluptatibus quis.', CAST(11.00 AS Decimal(10, 2)), N'3488 Place Dauphine', N'0170686108', N'0664337509', N'Tami_Duval@hotmail.fr', N'46612', N'Cannes', N'Tami5', N'aNkhLY14aC')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (117, N'Burger & Fries', 156, N'Non est ut reprehenderit ipsam non quisquam consequatur ad quidem. Qui et minus qui repellendus. Nisi rerum quo cupiditate quas quod unde repellendus. Numquam officia illo. Omnis consequatur natus error odit architecto perspiciatis et corrupti. Dolorem veniam quasi neque deleniti.', CAST(13.00 AS Decimal(10, 2)), N'424 Voie des Panoramas', N'0186349699', N'0630836291', N'Rodney72@gmail.com', N'43845', N'Nanterre', N'Rodney_Fournier', N'zKMWP6eqZ6')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (118, N'Les Burgers de Papa', 156, N'Et quod perferendis excepturi rem reprehenderit officia. Sunt qui aspernatur dolores. Et cum non dolorem voluptas voluptatibus asperiores voluptates ea non. Dolores et nesciunt eum dolorem ut nam quia. Repellendus eius saepe voluptatem recusandae vel a doloremque aut. Et consequatur quae.', CAST(8.00 AS Decimal(10, 2)), N'8227 Voie d''Alésia', N'0117354985', N'0665209279', N'Marion_Simon@gmail.com', N'48361', N'Metz', N'Marion.Simon55', N'Ywteaj1tKu')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (119, N'Mac Doner', 156, N'A ut aut dolores pariatur omnis quia natus dolorem sit. Dicta quos ut laborum aut. Ut molestias deserunt aut ut. Eos provident voluptatem voluptas perspiciatis possimus est tenetur laborum. Qui sit atque ab.', CAST(8.00 AS Decimal(10, 2)), N'49 Rue du Faubourg Saint-Honoré', N'0106563526', N'0648866571', N'Cedric76@gmail.com', N'95826', N'Drancy', N'Cedric.Nguyen', N'aMYR5Wl05h')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (120, N'Fermier Gourmet', 157, N'Rerum molestiae nostrum sed est vitae aperiam ea quasi quis. Et dolores quasi aut provident illo numquam exercitationem qui. Reiciendis qui eveniet assumenda harum veritatis quo cum quia dolorem. Sed omnis aut pariatur quidem natus ipsum quidem tenetur ut. Quidem a ipsam. Cumque omnis incidunt temporibus voluptatum.', CAST(14.00 AS Decimal(10, 2)), N'84 Allée d''Alésia', N'0130913300', N'0617918351', N'Maggie_Laine@hotmail.fr', N'96879', N'Fort-de-France', N'Maggie75', N'8uOO1yKBBJ')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (121, N'La cochonnaille', 157, N'Eaque voluptatem voluptates. Quibusdam ipsa dolorem repellendus enim. Tenetur voluptas provident odio vitae. Maxime est exercitationem temporibus cum consequatur. Neque explicabo quia aut dolore libero. Quae consequatur non dolorem in.', CAST(5.00 AS Decimal(10, 2)), N'9487 Passage de Tilsitt', N'0178216896', N'0608045370', N'Roderick.Roux20@hotmail.fr', N'10256', N'La Rochelle', N'Roderick50', N'T2Ilf9VyvB')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (122, N'Nos Grands-mères ont du Talent', 157, N'Perspiciatis cum eum libero aut. Inventore repellat occaecati. Non sed voluptates reiciendis. Minus incidunt consequatur est aut unde in ex. Quia facilis sit maiores nobis doloribus.', CAST(3.00 AS Decimal(10, 2)), N'70 Voie de Paris', N'0189319404', N'0605045895', N'Laverne.Louis83@gmail.com', N'74069', N'Bourges', N'Laverne.Louis11', N'yZRRhvLnRF')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (123, N'Canard Street', 157, N'Quia quasi architecto nulla. Optio unde quia ipsam. Vero doloremque quis. Sint quasi eos est. A numquam quia rem ipsam et fugit magnam.', CAST(8.00 AS Decimal(10, 2)), N'1 Quai des Panoramas', N'0186342333', N'0692063569', N'Belinda_Vasseur@yahoo.fr', N'12397', N'Créteil', N'Belinda.Vasseur15', N'B083JETwkX')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (124, N'Zoe Bouillon', 157, N'Dolore fugit architecto. Velit architecto autem molestiae eligendi esse eligendi non dolores. Et ut consequatur tempore libero illum quis deleniti. Et consequatur non sint est ut animi libero. Autem dolores qui et.', CAST(11.00 AS Decimal(10, 2)), N'62 Allée du Chat-qui-Pêche', N'0137983555', N'0642317080', N'Sarah_Leroy@yahoo.fr', N'12922', N'Saint-Paul', N'Sarah.Leroy', N'bnhInl2aDf')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (125, N'Kitchen Paris', 157, N'Qui provident delectus aliquam. Delectus neque vel laudantium quia ad. Illum delectus error quaerat excepturi quia veniam tempore eius sit. Voluptas et a repellendus. Libero harum quia voluptas eos sit iure.', CAST(14.00 AS Decimal(10, 2)), N'85 Avenue de l''Abbaye', N'0188766502', N'0673992068', N'Aaron_Philippe@gmail.com', N'12683', N'Villejuif', N'Aaron_Philippe', N'zw8A2DQ0Wn')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (126, N'Crêperie Galette Cafe', 157, N'Nihil dignissimos sequi quo fugit magnam aspernatur eos. Qui laudantium ut aut hic. Consequatur et non veritatis rerum quia aut. Sunt et quidem vel. Necessitatibus qui quia vitae.', CAST(5.00 AS Decimal(10, 2)), N'6525 Voie Mouffetard', N'0183939912', N'0618799857', N'Essie_Aubry@yahoo.fr', N'56033', N'Vitry-sur-Seine', N'Essie_Aubry68', N'Gx_Jm64MIv')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (127, N'Bollynan', 158, N'Et laboriosam molestiae est perspiciatis minus ut. Explicabo ipsum omnis enim ut tenetur harum qui non est. Nisi eius deleniti.', CAST(9.00 AS Decimal(10, 2)), N'4563 Passage Montorgueil', N'0144407831', N'0675860593', N'Myrtle_Maillard@gmail.com', N'95879', N'Saint-Paul', N'Myrtle.Maillard', N'4uSCgE1CGZ')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (128, N'Aarapana restaurant', 158, N'Sint iusto nostrum dignissimos hic et necessitatibus. Asperiores quidem distinctio omnis saepe. Reiciendis illum est ducimus suscipit est et autem. Et qui iusto excepturi hic in qui. Consequatur dicta omnis dolorum ipsam veniam dolor quia quo rerum. Ipsam qui iusto quam mollitia et iure provident in magni.', CAST(4.00 AS Decimal(10, 2)), N'76 Allée des Francs-Bourgeois', N'0105783053', N'0698466630', N'Eleanor.Thomas@gmail.com', N'56157', N'Grenoble', N'Eleanor_Thomas20', N'RP6tMILoXU')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (129, N'Safran', 158, N'Quo accusamus ullam aut vel omnis iste distinctio. Maiores inventore sit. Natus inventore cum qui aut inventore recusandae. Occaecati ea quas nisi labore enim rem nam. Modi voluptas sunt quae perspiciatis dolorem.', CAST(15.00 AS Decimal(10, 2)), N'2 Voie Molière', N'0183974163', N'0656398261', N'Phyllis_Jacquet@hotmail.fr', N'77631', N'Saint-Paul', N'Phyllis_Jacquet1', N'PkOTh4xTtg')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (130, N'Eat & Cool', 158, N'Commodi maxime deleniti repellendus minus vel et eius rem. Molestias et repellat rem et tenetur vel. Pariatur sint aliquid est temporibus. Dolore ut libero similique. Harum culpa et.', CAST(9.00 AS Decimal(10, 2)), N'815 Boulevard des Panoramas', N'0157209295', N'0650006278', N'Cora.Andre81@yahoo.fr', N'79868', N'Strasbourg', N'Cora26', N'SQDFzSDOoy')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (131, N'Taboulé Paris', 159, N'Commodi quod illo ut sunt amet consequatur sint. Ut non quibusdam explicabo veniam. Neque reiciendis et error rerum quis praesentium tenetur illo totam. Provident et tempora hic hic veniam.', CAST(3.00 AS Decimal(10, 2)), N'3880 Rue de Presbourg', N'0184243535', N'0623774802', N'Christine85@yahoo.fr', N'56451', N'La Seyne-sur-Mer', N'Christine.Blanchard94', N'UEFCujkCaE')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (132, N'Chez le Libanais', 159, N'Et nulla minima. Quo voluptas labore dolore. Ducimus id eius provident.', CAST(15.00 AS Decimal(10, 2)), N'59 Boulevard Molière', N'0188403764', N'0659526877', N'Rodolfo.Rousseau@yahoo.fr', N'65159', N'Montpellier', N'Rodolfo_Rousseau70', N'xOGN3Nspbi')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (133, N'Le Cèdre', 159, N'Est doloribus quaerat incidunt ea possimus ut eos. Qui in ut dolorem beatae assumenda aut. Necessitatibus quas molestiae ad numquam consequuntur magnam. Consequatur et voluptatem voluptate soluta minima pariatur quia eaque.', CAST(13.00 AS Decimal(10, 2)), N'6914 Impasse Laffitte', N'0189602393', N'0697902486', N'Arlene92@hotmail.fr', N'29406', N'Villeneuve-d''Ascq', N'Arlene_Maillard66', N'SVvIIrJEzK')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (134, N'Noura', 159, N'Repudiandae impedit enim sunt amet earum saepe quia fuga sit. At temporibus occaecati est veniam cum laborum sint ut voluptas. Eaque delectus reprehenderit totam. Veniam ducimus fuga quia nulla reiciendis culpa rem dolorem.', CAST(15.00 AS Decimal(10, 2)), N'092 Quai du Havre', N'0151065153', N'0693012989', N'Arlene86@hotmail.fr', N'21395', N'Vitry-sur-Seine', N'Arlene_Renard29', N'0d_1dZes3j')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (135, N'Zaatar Libanais', 159, N'Quo est explicabo excepturi sunt nisi vel sit. Ut doloribus debitis fugiat voluptas nulla. Dignissimos officia et accusantium aut tenetur est consequatur libero animi. Aut quibusdam voluptatem sit nisi.', CAST(11.00 AS Decimal(10, 2)), N'815 Place d''Alésia', N'0171129869', N'0612464614', N'Henry52@gmail.com', N'43971', N'Pessac', N'Henry_Brun', N'ihBZhpx4C5')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (136, N'Big Falafel', 159, N'Sunt et ea itaque neque eos delectus facere. Magnam vitae quas fugit est saepe aut suscipit esse eius. Ipsam voluptatem sint sed vero.', CAST(12.00 AS Decimal(10, 2)), N'6999 Voie Saint-Jacques', N'0147792342', N'0614954073', N'Howard.Hubert87@hotmail.fr', N'55170', N'Noisy-le-Grand', N'Howard.Hubert', N'knOMgr7I8e')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (137, N'Marché Libanais', 159, N'Rerum repellendus nihil reprehenderit vitae pariatur enim et. Aperiam enim reiciendis molestias cum hic modi consequatur et et. Omnis numquam quis hic dicta sit occaecati. Omnis illum nostrum est reprehenderit non aspernatur.', CAST(7.00 AS Decimal(10, 2)), N'07 Quai de la Victoire', N'0186260697', N'0619921925', N'Carolyn_Roger4@gmail.com', N'03537', N'Ajaccio', N'Carolyn.Roger95', N'rzHOgugfWW')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (138, N'King Falafel Palace', 159, N'Quasi quae voluptates illum ea sunt magnam inventore velit qui. Deserunt numquam omnis libero soluta. Dolor placeat repellendus eaque nesciunt qui atque rerum sunt dolores.', CAST(12.00 AS Decimal(10, 2)), N'33 Allée de la Ferronnerie', N'0139849625', N'0676276511', N'Tracy_Philippe@yahoo.fr', N'55896', N'Nancy', N'Tracy.Philippe', N'pfEIBf5svH')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (139, N'O Beyrouth', 159, N'Repellendus iure et eius placeat placeat. Odio quis eveniet autem odit velit libero totam. Eius et facilis inventore eaque minus voluptas neque quo et. Voluptas illo repudiandae deserunt commodi rem cupiditate. Consequatur aperiam similique molestiae beatae voluptatem temporibus. Aut reprehenderit et est nihil maxime voluptate.', CAST(9.00 AS Decimal(10, 2)), N'46 Place de Nesle', N'0127830573', N'0681333346', N'Emma_Remy63@gmail.com', N'97189', N'Cergy', N'Emma_Remy', N'MVk7i9vWDA')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (140, N'Shawarma Lovers', 159, N'Voluptate natus dicta occaecati ipsam veniam quo. Porro ratione libero. Perspiciatis eos ratione voluptatum fugiat. Placeat voluptate aut similique quia. Et ut amet rem.', CAST(6.00 AS Decimal(10, 2)), N'9352 Place Montorgueil', N'0188543444', N'0619468971', N'Faye60@gmail.com', N'47264', N'Saint-Quentin', N'Faye_Lambert', N'Z_enRUKdoD')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (141, N'Topoly', 159, N'Assumenda alias autem culpa et ex perspiciatis quae architecto et. Eos et atque voluptates aut voluptatem sint. Laborum sit eaque.', CAST(11.00 AS Decimal(10, 2)), N'3 Passage des Lombards', N'0115764190', N'0693187276', N'Colleen.Gerard14@hotmail.fr', N'63200', N'Montpellier', N'Colleen36', N'aOCE8lHmVx')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (142, N'Five Pizza Original', 160, N'Magni nostrum quaerat et veniam libero nesciunt veniam. Aliquam et nostrum animi. Ut similique eos voluptatem est sed et aliquam labore. Ut autem rerum asperiores accusantium ut asperiores consequatur.', CAST(14.00 AS Decimal(10, 2)), N'3478 Passage du Faubourg-Saint-Denis', N'0142741772', N'0657416092', N'Roberta92@hotmail.fr', N'70348', N'Nancy', N'Roberta91', N'7leGsVN8w8')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (143, N'5PIZZ', 160, N'Voluptatum laudantium ad et ut quia. Fugit eius sed commodi. Temporibus qui qui facilis a. Aut incidunt ipsam quidem nobis sunt.', CAST(14.00 AS Decimal(10, 2)), N'8 Avenue de Provence', N'0162948253', N'0678486762', N'Melanie59@gmail.com', N'15284', N'Le Havre', N'Melanie_Bonnet', N'wVECoXdpib')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (144, N'Chez Alfredo', 160, N'Dolores nam dolor. Culpa non neque illum perspiciatis pariatur. Vero praesentium id.', CAST(10.00 AS Decimal(10, 2)), N'1 Impasse Saint-Denis', N'0156850314', N'0631924006', N'Wilfred_Charpentier1@yahoo.fr', N'68796', N'Hyères', N'Wilfred66', N'HPonipi3Qo')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (145, N'Mulberry Street', 160, N'Vel omnis quisquam distinctio aut et est nostrum eveniet odio. Est odio et iure quasi laborum sunt aut eum. Et voluptas nihil expedita. Est aliquam ducimus qui dolores laudantium non aliquam nobis est. Labore beatae perspiciatis.', CAST(6.00 AS Decimal(10, 2)), N'73 Boulevard de l''Odéon', N'0149330246', N'0699568647', N'Willie77@hotmail.fr', N'79069', N'Toulon', N'Willie58', N'GLpk1ZCHUh')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (146, N'Pizza La Fayette', 160, N'Inventore enim culpa quo non. Qui eos qui omnis et placeat deserunt. Temporibus voluptatum et et labore doloribus. Excepturi natus ducimus maxime et sunt.', CAST(8.00 AS Decimal(10, 2)), N'4095 Rue d''Assas', N'0149571011', N'0695384599', N'Beth.Laurent@gmail.com', N'42836', N'Montreuil', N'Beth_Laurent', N'pAWEoxBySc')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (147, N'Pizza Rustica', 160, N'Sed est non cumque enim cumque nulla quia quas quasi. Quam quo nesciunt aut at nemo et maxime doloremque. Fugiat quam iure saepe quia.', CAST(7.00 AS Decimal(10, 2)), N'578 Allée Saint-Séverin', N'0185438063', N'0613550912', N'Toby89@yahoo.fr', N'28782', N'Créteil', N'Toby_Garcia70', N'OlV3q5nlDW')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (148, N'César Montorgueil', 160, N'Quidem aliquid adipisci culpa quaerat eius voluptate quae. Et consequatur consequatur dolorum doloremque veritatis est iure dolorem. Sed est maiores dolores voluptas. Nihil quia ut non ex. Sunt facere aut. Harum commodi laborum.', CAST(3.00 AS Decimal(10, 2)), N'8 Allée d''Argenteuil', N'0132707621', N'0649836580', N'Geoffrey_Guyot75@hotmail.fr', N'12567', N'Béziers', N'Geoffrey.Guyot', N'4ITuIQFdI7')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (149, N'Amala', 160, N'Fuga perferendis ipsam. Porro rerum voluptatibus voluptas iure molestiae. Fugit ut molestias quas voluptatem dolores a blanditiis quo quo. Laborum facilis inventore blanditiis nihil iusto enim ut.', CAST(12.00 AS Decimal(10, 2)), N'448 Place de la Ferronnerie', N'0175275307', N'0680323317', N'Mary83@gmail.com', N'65450', N'Boulogne-Billancourt', N'Mary77', N'MvprRwE_G8')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (150, N'Falstaff', 160, N'Atque similique ut accusantium maiores. Suscipit atque quos delectus et necessitatibus et est cumque. Voluptatem iste ullam qui modi nisi debitis quia id sit.', CAST(14.00 AS Decimal(10, 2)), N'70 Avenue Joubert', N'0123203921', N'0694483360', N'Sidney_Perez@gmail.com', N'65816', N'Cannes', N'Sidney71', N'ps_HTNA2Va')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (151, N'Palazzo di Pasta', 160, N'Et magnam esse ea adipisci nemo. Id similique non sed quo atque quos. Quia ut architecto. Corrupti sapiente quia ipsum cum vitae ab tenetur inventore est. Sunt dolorum eius illum. Repellat sit quos facere beatae occaecati eligendi quas magni.', CAST(15.00 AS Decimal(10, 2)), N'7131 Passage Saint-Bernard', N'0101733557', N'0634407313', N'Ben.Fabre94@gmail.com', N'89302', N'Créteil', N'Ben.Fabre17', N'PzIzOO_qq9')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (152, N'Pizza Presto', 160, N'Et magnam culpa consequatur consequuntur totam consequuntur. Porro saepe laudantium tempora id debitis aliquam itaque sit culpa. Dicta modi sed autem accusamus. Qui amet corporis sit. Autem iusto dolorum amet quia est expedita.', CAST(14.00 AS Decimal(10, 2)), N'216 Boulevard du Bac', N'0102592710', N'0662673574', N'Sharon.Riviere58@gmail.com', N'21768', N'Nice', N'Sharon87', N'CKcnrYGbMH')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (153, N'Chez Aldo', 160, N'Vero a et sequi vero sit iste porro. Ducimus sed consequatur sed dolore alias nostrum eligendi quibusdam officiis. Dolor iste optio iste excepturi vitae qui pariatur sit facilis. Voluptatibus dolores nostrum magni omnis.', CAST(3.00 AS Decimal(10, 2)), N'14 Allée de Presbourg', N'0198142286', N'0678621932', N'Marta.Rolland15@gmail.com', N'17409', N'Cholet', N'Marta94', N'Et8iPbb9Tv')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (154, N'Del Arte', 160, N'Excepturi quis cumque error velit at nesciunt est tenetur nisi. Et fuga vel. Quos consequatur iste quos nesciunt illum accusantium nulla. Aliquid ea qui. Id quod odio officia dolor. Eum quia consequatur corporis.', CAST(12.00 AS Decimal(10, 2)), N'75 Allée de la Paix', N'0153146342', N'0615689671', N'Curtis.Perrin@yahoo.fr', N'08145', N'Rennes', N'Curtis_Perrin75', N'MIZ49q3uNe')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (155, N'Italian Trattoria', 160, N'Similique quaerat velit aut maxime consequatur. Doloremque error enim unde in laudantium officiis. Enim nisi quidem quam. Ad eos perspiciatis perspiciatis voluptatem non aut dolor vero.', CAST(9.00 AS Decimal(10, 2)), N'3 Allée Royale', N'0139932440', N'0631512694', N'Edmond_Brunet62@hotmail.fr', N'81051', N'Issy-les-Moulineaux', N'Edmond70', N'iLPgLHdr4N')
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (106, 229)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (107, 230)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (108, 231)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (109, 232)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (110, 233)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (111, 234)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (112, 235)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (113, 236)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (114, 237)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (115, 238)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (116, 239)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (117, 240)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (118, 241)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (119, 242)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (120, 243)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (121, 244)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (122, 245)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (123, 246)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (124, 247)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (125, 248)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (126, 249)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (127, 250)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (128, 251)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (129, 252)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (130, 253)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (131, 254)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (132, 255)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (133, 256)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (134, 257)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (135, 258)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (136, 259)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (137, 260)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (138, 261)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (139, 262)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (140, 263)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (141, 264)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (142, 265)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (143, 266)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (144, 267)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (145, 268)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (146, 269)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (147, 270)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (148, 271)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (149, 272)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (150, 273)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (151, 274)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (152, 275)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (153, 276)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (154, 277)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (155, 278)
INSERT [dbo].[SessionUtilisateur] ([IdSession], [DateSession]) VALUES (N'eywqoydz0hbx12qvnwzljzoo', CAST(N'2020-03-04T15:32:18.310' AS DateTime))
SET IDENTITY_INSERT [dbo].[TypeCuisine] ON 

INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (153, N'Asiatique', 221)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (154, N'Boulangerie', 222)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (155, N'Brasserie', 223)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (156, N'Fastfood', 224)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (157, N'Francaise', 225)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (158, N'Indien', 226)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (159, N'Libanais', 227)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (160, N'Pizza', 228)
SET IDENTITY_INSERT [dbo].[TypeCuisine] OFF
SET IDENTITY_INSERT [dbo].[TypeVersement] ON 

INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (2, N'Espèces', 1)
INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (3, N'Chèque restaurant', 1)
SET IDENTITY_INSERT [dbo].[TypeVersement] OFF
SET IDENTITY_INSERT [dbo].[Utilisateur] ON 

INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (122, N'Kergall', N'Yoann', N'yoann', N'123', 1, CAST(50.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (123, N'Meyer', N'Camille', N'71296', N'ZzfSWN_t60', 1, CAST(62.04 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (124, N'Marty', N'Lilou', N'64649', N'l7JRs2Jmfb', 1, CAST(83.60 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (125, N'Blanc', N'Noah', N'88730', N'eKR4jyPlmC', 1, CAST(50.12 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (126, N'Garnier', N'Raphaël', N'39225', N'HMjhCgavuj', 1, CAST(79.51 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (127, N'Martin', N'Noémie', N'96450', N'xZqiaBEkPu', 1, CAST(22.70 AS Decimal(10, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Utilisateur] OFF
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
USE [master]
GO
ALTER DATABASE [AfpEat] SET  READ_WRITE 
GO
