USE [master]
GO
/****** Object:  Database [AfpEat]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[Categorie]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[Commande]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[CommandeProduit]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[CommandeProduitMenu]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[CommandeProduitProduit]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[EtatCommande]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[MenuCategorie]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[Operation]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[Photo]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[Produit]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[ProduitCompose]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[ProduitPhoto]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[Restaurant]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[RestaurantPhoto]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[RoleUtilisateur]    Script Date: 11/03/2020 00:14:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUtilisateur](
	[IdUtilisateur] [int] NOT NULL,
	[IdRole] [int] NOT NULL,
 CONSTRAINT [PK_RoleUtilisateur] PRIMARY KEY CLUSTERED 
(
	[IdUtilisateur] ASC,
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SessionUtilisateur]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[TypeCuisine]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[TypeVersement]    Script Date: 11/03/2020 00:14:45 ******/
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
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 11/03/2020 00:14:45 ******/
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
 CONSTRAINT [PK_Utilisateur] PRIMARY KEY CLUSTERED 
(
	[IdUtilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (131, N'Entrée', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (132, N'Plat', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (133, N'Dessert', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (134, N'Salade', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (135, N'Boisson', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (136, N'Pâtes', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (137, N'Panini', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (138, N'Pizza', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (139, N'Sandwich', 1)
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[EtatCommande] ON 

INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (1, N'En Attente')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (2, N'En cours de préparation')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (3, N'En cours de livraison')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (4, N'Livré')
SET IDENTITY_INSERT [dbo].[EtatCommande] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([IdMenu], [Nom], [Statut], [Prix], [IdRestaurant], [IdPhoto]) VALUES (11, N'Menu Poke bowl signature & boisson', 1, CAST(12.90 AS Decimal(10, 2)), 556, 4201)
INSERT [dbo].[Menu] ([IdMenu], [Nom], [Statut], [Prix], [IdRestaurant], [IdPhoto]) VALUES (12, N'Menu Poke bowl signature, boisson & dessert', 1, CAST(15.90 AS Decimal(10, 2)), 556, 4202)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (11, 132)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (11, 135)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (12, 132)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (12, 133)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (12, 135)
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3804, N'asiatique.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3805, N'boulangerie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3806, N'brasserie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3807, N'fastfood.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3808, N'francaise.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3809, N'indien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3810, N'libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3811, N'pizza.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3812, N'Pokawa.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3813, N'Sushi Shop.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3814, N'SHAKA Poke.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3815, N'La Mie Caline.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3816, N'Maison Kayser.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3817, N'Boulangerie Beaubourg.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3818, N'Pomme de Pain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3819, N'Boulangerie artisanale Zerzour.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3820, N'Shake it Easy.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3821, N'Cheezer.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3822, N'Nabab Kebab.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3823, N'Burger & Fries.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3824, N'Les Burgers de Papa.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3825, N'Mac Doner.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3826, N'Fermier Gourmet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3827, N'La cochonnaille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3828, N'Nos Grands-mères ont du Talent.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3829, N'Canard Street.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3830, N'Zoe Bouillon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3831, N'Kitchen Paris.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3832, N'Crêperie Galette Cafe.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3833, N'Bollynan.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3834, N'Aarapana restaurant.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3835, N'Safran.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3836, N'Eat & Cool.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3837, N'Taboulé Paris.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3838, N'Chez le Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3839, N'Le Cèdre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3840, N'Noura.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3841, N'Zaatar Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3842, N'Big Falafel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3843, N'Marché Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3844, N'King Falafel Palace.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3845, N'O Beyrouth.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3846, N'Shawarma Lovers.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3847, N'Topoly.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3848, N'Five Pizza Original.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3849, N'5PIZZ.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3850, N'Chez Alfredo.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3851, N'Mulberry Street.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3852, N'Pizza La Fayette.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3853, N'Pizza Rustica.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3854, N'César Montorgueil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3855, N'Amala.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3856, N'Falstaff.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3857, N'Palazzo di Pasta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3858, N'Pizza Presto.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3859, N'Chez Aldo.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3860, N'Del Arte.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3861, N'Italian Trattoria.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3862, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3863, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3864, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3865, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3866, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3867, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3868, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3869, N'Chirashi Hawaïen.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3870, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3871, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3872, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3873, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3874, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3875, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3876, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3877, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3878, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3879, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3880, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3881, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3882, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3883, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3884, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3885, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3886, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3887, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3888, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3889, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3890, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3891, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3892, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3893, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3894, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3895, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3896, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3897, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3898, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3899, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3900, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3901, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3902, N'Chirashi Hawaïen.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3903, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3904, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3905, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3906, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3907, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3908, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3909, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3910, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3911, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3912, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3913, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3914, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3915, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3916, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3917, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3918, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3919, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3920, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3921, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3922, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3923, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3924, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3925, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3926, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3927, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3928, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3929, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3930, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3931, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3932, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3933, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3934, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3935, N'Chirashi Hawaïen.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3936, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3937, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3938, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3939, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3940, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3941, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3942, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3943, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3944, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3945, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3946, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3947, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3948, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3949, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3950, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3951, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3952, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3953, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3954, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3955, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3956, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3957, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3958, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3959, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3960, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3961, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3962, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3963, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3964, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3965, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3966, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3967, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3968, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3969, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3970, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3971, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3972, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3973, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3974, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3975, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3976, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3977, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3978, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3979, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3980, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3981, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3982, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3983, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3984, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3985, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3986, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3987, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3988, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3989, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3990, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3991, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3992, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3993, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3994, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3995, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3996, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3997, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3998, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (3999, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4000, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4001, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4002, N'Tartelette poire amande.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4003, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4004, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4005, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4006, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4007, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4008, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4009, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4010, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4011, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4012, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4013, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4014, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4015, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4016, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4017, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4018, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4019, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4020, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4021, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4022, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4023, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4024, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4025, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4026, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4027, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4028, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4029, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4030, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4031, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4032, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4033, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4034, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4035, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4036, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4037, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4038, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4039, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4040, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4041, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4042, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4043, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4044, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4045, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4046, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4047, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4048, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4049, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4050, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4051, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4052, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4053, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4054, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4055, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4056, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4057, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4058, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4059, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4060, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4061, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4062, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4063, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4064, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4065, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4066, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4067, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4068, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4069, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4070, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4071, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4072, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4073, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4074, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4075, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4076, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4077, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4078, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4079, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4080, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4081, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4082, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4083, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4084, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4085, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4086, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4087, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4088, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4089, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4090, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4091, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4092, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4093, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4094, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4095, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4096, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4097, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4098, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4099, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4100, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4101, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4102, N'Éclair Praliné.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4103, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4104, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4105, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4106, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4107, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4108, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4109, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4110, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4111, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4112, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4113, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4114, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4115, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4116, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4117, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4118, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4119, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4120, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4121, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4122, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4123, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4124, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4125, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4126, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4127, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4128, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4129, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4130, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4131, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4132, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4133, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4134, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4135, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4136, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4137, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4138, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4139, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4140, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4141, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4142, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4143, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4144, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4145, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4146, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4147, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4148, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4149, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4150, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4151, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4152, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4153, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4154, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4155, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4156, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4157, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4158, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4159, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4160, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4161, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4162, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4163, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4164, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4165, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4166, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4167, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4168, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4169, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4170, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4171, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4172, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4173, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4174, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4175, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4176, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4177, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4178, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4179, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4180, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4181, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4182, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4183, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4184, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4185, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4186, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4187, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4188, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4189, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4190, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4191, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4192, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4193, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4194, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4195, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4196, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4197, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4198, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4199, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4200, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4201, N'Menu Poke bowl signature & boisson.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (4202, N'Menu Poke bowl signature, boisson & dessert.jpg')
GO
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Produit] ON 

INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3131, 556, 131, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3132, 556, 131, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3133, 556, 131, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3134, 556, 131, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3135, 556, 131, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3136, 556, 131, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3137, 556, 131, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3138, 556, 132, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3139, 556, 132, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3140, 556, 132, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3141, 556, 132, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3142, 556, 132, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3143, 556, 132, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3144, 556, 132, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3145, 556, 132, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3146, 556, 132, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3147, 556, 133, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3148, 556, 133, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3149, 556, 133, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3150, 556, 133, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3151, 556, 133, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3152, 556, 133, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3153, 556, 133, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3154, 556, 133, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3155, 556, 135, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3156, 556, 135, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3157, 556, 135, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3158, 556, 135, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3159, 556, 135, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3160, 556, 135, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3161, 556, 135, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3162, 556, 135, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3163, 556, 135, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3164, 557, 131, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3165, 557, 131, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3166, 557, 131, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3167, 557, 131, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3168, 557, 131, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3169, 557, 131, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3170, 557, 131, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3171, 557, 132, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3172, 557, 132, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3173, 557, 132, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3174, 557, 132, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3175, 557, 132, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3176, 557, 132, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3177, 557, 132, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3178, 557, 132, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3179, 557, 132, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3180, 557, 133, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3181, 557, 133, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3182, 557, 133, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3183, 557, 133, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3184, 557, 133, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3185, 557, 133, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3186, 557, 133, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3187, 557, 133, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3188, 557, 135, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3189, 557, 135, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3190, 557, 135, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3191, 557, 135, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3192, 557, 135, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3193, 557, 135, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3194, 557, 135, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3195, 557, 135, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3196, 557, 135, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3197, 558, 131, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3198, 558, 131, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3199, 558, 131, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3200, 558, 131, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3201, 558, 131, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3202, 558, 131, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3203, 558, 131, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3204, 558, 132, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3205, 558, 132, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3206, 558, 132, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3207, 558, 132, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3208, 558, 132, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3209, 558, 132, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3210, 558, 132, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3211, 558, 132, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3212, 558, 132, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3213, 558, 133, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3214, 558, 133, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3215, 558, 133, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3216, 558, 133, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3217, 558, 133, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3218, 558, 133, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3219, 558, 133, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3220, 558, 133, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3221, 558, 135, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3222, 558, 135, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3223, 558, 135, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3224, 558, 135, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3225, 558, 135, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3226, 558, 135, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3227, 558, 135, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3228, 558, 135, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3229, 558, 135, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 15)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3230, 559, 138, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3231, 559, 138, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3232, 559, 134, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3233, 559, 134, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3234, 559, 134, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3235, 559, 139, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3236, 559, 139, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3237, 559, 139, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3238, 559, 139, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3239, 559, 139, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3240, 559, 139, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3241, 559, 139, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3242, 559, 139, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3243, 559, 139, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3244, 559, 139, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3245, 559, 139, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3246, 559, 139, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3247, 559, 139, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3248, 559, 139, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3249, 559, 137, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3250, 559, 137, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3251, 559, 137, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3252, 559, 137, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3253, 559, 137, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3254, 559, 133, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3255, 559, 133, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3256, 559, 133, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3257, 559, 133, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3258, 559, 133, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3259, 559, 133, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3260, 559, 133, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3261, 559, 133, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3262, 559, 133, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3263, 559, 133, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3264, 559, 133, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3265, 559, 133, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3266, 559, 133, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3267, 559, 133, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3268, 559, 133, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3269, 559, 133, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3270, 559, 133, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3271, 559, 133, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3272, 559, 133, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3273, 559, 133, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3274, 559, 133, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3275, 559, 133, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3276, 559, 133, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3277, 559, 133, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3278, 560, 138, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3279, 560, 138, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3280, 560, 134, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3281, 560, 134, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3282, 560, 134, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3283, 560, 139, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3284, 560, 139, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3285, 560, 139, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3286, 560, 139, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3287, 560, 139, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3288, 560, 139, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3289, 560, 139, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3290, 560, 139, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3291, 560, 139, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3292, 560, 139, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3293, 560, 139, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3294, 560, 139, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3295, 560, 139, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3296, 560, 139, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3297, 560, 137, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3298, 560, 137, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3299, 560, 137, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3300, 560, 137, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3301, 560, 137, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3302, 560, 133, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3303, 560, 133, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3304, 560, 133, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3305, 560, 133, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3306, 560, 133, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3307, 560, 133, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3308, 560, 133, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3309, 560, 133, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3310, 560, 133, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3311, 560, 133, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3312, 560, 133, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3313, 560, 133, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3314, 560, 133, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3315, 560, 133, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3316, 560, 133, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3317, 560, 133, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3318, 560, 133, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3319, 560, 133, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3320, 560, 133, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3321, 560, 133, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3322, 560, 133, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3323, 560, 133, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3324, 560, 133, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3325, 560, 133, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3326, 561, 138, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3327, 561, 138, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3328, 561, 134, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3329, 561, 134, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 5)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3330, 561, 134, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3331, 561, 139, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3332, 561, 139, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3333, 561, 139, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3334, 561, 139, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3335, 561, 139, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3336, 561, 139, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3337, 561, 139, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3338, 561, 139, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3339, 561, 139, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3340, 561, 139, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3341, 561, 139, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3342, 561, 139, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3343, 561, 139, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3344, 561, 139, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3345, 561, 137, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3346, 561, 137, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3347, 561, 137, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3348, 561, 137, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3349, 561, 137, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3350, 561, 133, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3351, 561, 133, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3352, 561, 133, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3353, 561, 133, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3354, 561, 133, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3355, 561, 133, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3356, 561, 133, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3357, 561, 133, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3358, 561, 133, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3359, 561, 133, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3360, 561, 133, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3361, 561, 133, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3362, 561, 133, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3363, 561, 133, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3364, 561, 133, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3365, 561, 133, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3366, 561, 133, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3367, 561, 133, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3368, 561, 133, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3369, 561, 133, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3370, 561, 133, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3371, 561, 133, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3372, 561, 133, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3373, 561, 133, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3374, 562, 138, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3375, 562, 138, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3376, 562, 134, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3377, 562, 134, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3378, 562, 134, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3379, 562, 139, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3380, 562, 139, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3381, 562, 139, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3382, 562, 139, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3383, 562, 139, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3384, 562, 139, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3385, 562, 139, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3386, 562, 139, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3387, 562, 139, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3388, 562, 139, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3389, 562, 139, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3390, 562, 139, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3391, 562, 139, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3392, 562, 139, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3393, 562, 137, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3394, 562, 137, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3395, 562, 137, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3396, 562, 137, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3397, 562, 137, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3398, 562, 133, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3399, 562, 133, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3400, 562, 133, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3401, 562, 133, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3402, 562, 133, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3403, 562, 133, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3404, 562, 133, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3405, 562, 133, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3406, 562, 133, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3407, 562, 133, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3408, 562, 133, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3409, 562, 133, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3410, 562, 133, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3411, 562, 133, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3412, 562, 133, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3413, 562, 133, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3414, 562, 133, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3415, 562, 133, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3416, 562, 133, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3417, 562, 133, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3418, 562, 133, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3419, 562, 133, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3420, 562, 133, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3421, 562, 133, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3422, 563, 138, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3423, 563, 138, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3424, 563, 134, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3425, 563, 134, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3426, 563, 134, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3427, 563, 139, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3428, 563, 139, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3429, 563, 139, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 5)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3430, 563, 139, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3431, 563, 139, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3432, 563, 139, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3433, 563, 139, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3434, 563, 139, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3435, 563, 139, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3436, 563, 139, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3437, 563, 139, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3438, 563, 139, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3439, 563, 139, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3440, 563, 139, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3441, 563, 137, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3442, 563, 137, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3443, 563, 137, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3444, 563, 137, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3445, 563, 137, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3446, 563, 133, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3447, 563, 133, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3448, 563, 133, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3449, 563, 133, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3450, 563, 133, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3451, 563, 133, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3452, 563, 133, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3453, 563, 133, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3454, 563, 133, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3455, 563, 133, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3456, 563, 133, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3457, 563, 133, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3458, 563, 133, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3459, 563, 133, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3460, 563, 133, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3461, 563, 133, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3462, 563, 133, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3463, 563, 133, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3464, 563, 133, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3465, 563, 133, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3466, 563, 133, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3467, 563, 133, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3468, 563, 133, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (3469, 563, 133, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 30)
SET IDENTITY_INSERT [dbo].[Produit] OFF
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3131, 3862)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3132, 3863)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3133, 3864)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3134, 3865)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3135, 3866)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3136, 3867)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3137, 3868)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3138, 3869)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3139, 3870)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3140, 3871)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3141, 3872)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3142, 3873)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3143, 3874)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3144, 3875)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3145, 3876)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3146, 3877)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3147, 3878)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3148, 3879)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3149, 3880)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3150, 3881)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3151, 3882)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3152, 3883)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3153, 3884)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3154, 3885)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3155, 3886)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3156, 3887)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3157, 3888)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3158, 3889)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3159, 3890)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3160, 3891)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3161, 3892)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3162, 3893)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3163, 3894)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3164, 3895)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3165, 3896)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3166, 3897)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3167, 3898)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3168, 3899)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3169, 3900)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3170, 3901)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3171, 3902)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3172, 3903)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3173, 3904)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3174, 3905)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3175, 3906)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3176, 3907)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3177, 3908)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3178, 3909)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3179, 3910)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3180, 3911)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3181, 3912)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3182, 3913)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3183, 3914)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3184, 3915)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3185, 3916)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3186, 3917)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3187, 3918)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3188, 3919)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3189, 3920)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3190, 3921)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3191, 3922)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3192, 3923)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3193, 3924)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3194, 3925)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3195, 3926)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3196, 3927)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3197, 3928)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3198, 3929)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3199, 3930)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3200, 3931)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3201, 3932)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3202, 3933)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3203, 3934)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3204, 3935)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3205, 3936)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3206, 3937)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3207, 3938)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3208, 3939)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3209, 3940)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3210, 3941)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3211, 3942)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3212, 3943)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3213, 3944)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3214, 3945)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3215, 3946)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3216, 3947)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3217, 3948)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3218, 3949)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3219, 3950)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3220, 3951)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3221, 3952)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3222, 3953)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3223, 3954)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3224, 3955)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3225, 3956)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3226, 3957)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3227, 3958)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3228, 3959)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3229, 3960)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3230, 3961)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3231, 3962)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3232, 3963)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3233, 3964)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3234, 3965)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3235, 3966)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3236, 3967)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3237, 3968)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3238, 3969)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3239, 3970)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3240, 3971)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3241, 3972)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3242, 3973)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3243, 3974)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3244, 3975)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3245, 3976)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3246, 3977)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3247, 3978)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3248, 3979)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3249, 3980)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3250, 3981)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3251, 3982)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3252, 3983)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3253, 3984)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3254, 3985)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3255, 3986)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3256, 3987)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3257, 3988)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3258, 3989)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3259, 3990)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3260, 3991)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3261, 3992)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3262, 3993)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3263, 3994)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3264, 3995)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3265, 3996)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3266, 3997)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3267, 3998)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3268, 3999)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3269, 4000)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3270, 4001)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3271, 4002)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3272, 4003)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3273, 4004)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3274, 4005)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3275, 4006)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3276, 4007)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3277, 4008)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3278, 4009)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3279, 4010)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3280, 4011)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3281, 4012)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3282, 4013)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3283, 4014)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3284, 4015)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3285, 4016)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3286, 4017)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3287, 4018)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3288, 4019)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3289, 4020)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3290, 4021)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3291, 4022)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3292, 4023)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3293, 4024)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3294, 4025)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3295, 4026)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3296, 4027)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3297, 4028)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3298, 4029)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3299, 4030)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3300, 4031)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3301, 4032)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3302, 4033)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3303, 4034)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3304, 4035)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3305, 4036)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3306, 4037)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3307, 4038)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3308, 4039)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3309, 4040)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3310, 4041)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3311, 4042)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3312, 4043)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3313, 4044)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3314, 4045)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3315, 4046)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3316, 4047)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3317, 4048)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3318, 4049)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3319, 4050)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3320, 4051)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3321, 4052)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3322, 4053)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3323, 4054)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3324, 4055)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3325, 4056)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3326, 4057)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3327, 4058)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3328, 4059)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3329, 4060)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3330, 4061)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3331, 4062)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3332, 4063)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3333, 4064)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3334, 4065)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3335, 4066)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3336, 4067)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3337, 4068)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3338, 4069)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3339, 4070)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3340, 4071)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3341, 4072)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3342, 4073)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3343, 4074)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3344, 4075)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3345, 4076)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3346, 4077)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3347, 4078)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3348, 4079)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3349, 4080)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3350, 4081)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3351, 4082)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3352, 4083)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3353, 4084)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3354, 4085)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3355, 4086)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3356, 4087)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3357, 4088)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3358, 4089)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3359, 4090)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3360, 4091)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3361, 4092)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3362, 4093)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3363, 4094)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3364, 4095)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3365, 4096)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3366, 4097)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3367, 4098)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3368, 4099)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3369, 4100)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3370, 4101)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3371, 4102)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3372, 4103)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3373, 4104)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3374, 4105)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3375, 4106)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3376, 4107)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3377, 4108)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3378, 4109)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3379, 4110)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3380, 4111)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3381, 4112)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3382, 4113)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3383, 4114)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3384, 4115)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3385, 4116)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3386, 4117)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3387, 4118)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3388, 4119)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3389, 4120)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3390, 4121)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3391, 4122)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3392, 4123)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3393, 4124)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3394, 4125)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3395, 4126)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3396, 4127)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3397, 4128)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3398, 4129)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3399, 4130)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3400, 4131)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3401, 4132)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3402, 4133)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3403, 4134)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3404, 4135)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3405, 4136)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3406, 4137)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3407, 4138)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3408, 4139)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3409, 4140)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3410, 4141)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3411, 4142)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3412, 4143)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3413, 4144)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3414, 4145)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3415, 4146)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3416, 4147)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3417, 4148)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3418, 4149)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3419, 4150)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3420, 4151)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3421, 4152)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3422, 4153)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3423, 4154)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3424, 4155)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3425, 4156)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3426, 4157)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3427, 4158)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3428, 4159)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3429, 4160)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3430, 4161)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3431, 4162)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3432, 4163)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3433, 4164)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3434, 4165)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3435, 4166)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3436, 4167)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3437, 4168)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3438, 4169)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3439, 4170)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3440, 4171)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3441, 4172)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3442, 4173)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3443, 4174)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3444, 4175)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3445, 4176)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3446, 4177)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3447, 4178)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3448, 4179)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3449, 4180)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3450, 4181)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3451, 4182)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3452, 4183)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3453, 4184)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3454, 4185)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3455, 4186)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3456, 4187)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3457, 4188)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3458, 4189)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3459, 4190)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3460, 4191)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3461, 4192)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3462, 4193)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3463, 4194)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3464, 4195)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3465, 4196)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3466, 4197)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3467, 4198)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3468, 4199)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (3469, 4200)
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (556, N'Pokawa', N'pokawa', 225, N'Omnis quia aut in dolorum saepe. Est sunt sint alias excepturi. Eum nihil dicta. Molestiae labore dolores voluptate itaque ratione in excepturi.', CAST(7.00 AS Decimal(10, 2)), N'68 Boulevard de Rivoli', N'0154446055', N'0615467727', N'Gretchen.Barbier@hotmail.fr', N'03663', N'Cayenne', 345)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (557, N'Sushi Shop', N'sushi-shop', 225, N'Ea reprehenderit cupiditate enim eos quis. Similique cupiditate eum minus itaque sint sit. Veniam officiis non nostrum et beatae quas. Eaque sit voluptatem. Sequi et ut ea quos.', CAST(8.00 AS Decimal(10, 2)), N'8 Boulevard Dauphine', N'0171816973', N'0662944352', N'Kimberly.Mathieu7@hotmail.fr', N'90192', N'Vitry-sur-Seine', 346)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (558, N'SHAKA Poke', N'shaka-poke', 225, N'Corrupti non tempora dolorum magnam ut et est. Et ab totam quia. Beatae quia optio unde earum voluptatem nobis. Molestiae similique quia consequatur. Velit ut optio ducimus inventore asperiores sed blanditiis.', CAST(7.00 AS Decimal(10, 2)), N'2 Quai Lepic', N'0121435548', N'0663539476', N'Cory48@hotmail.fr', N'76542', N'Montauban', 347)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (559, N'La Mie Câline', N'la-mie-caline', 226, N'Occaecati ut distinctio repellendus. Quia nihil possimus adipisci non accusantium odit. Deserunt eos et nihil recusandae fugit qui. Odit voluptas nihil dolor quod sed sit quo et eaque. Molestias nihil ullam dolor earum.', CAST(9.00 AS Decimal(10, 2)), N'97 Passage des Panoramas', N'0154888692', N'0648708311', N'Alma.Carre@yahoo.fr', N'21556', N'Neuilly-sur-Seine', 348)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (560, N'Maison Kayser', N'maison-kayser', 226, N'Voluptas aut nihil magnam dolores officia culpa. Consequuntur omnis quos officia ut nihil velit rerum itaque. Soluta aliquam inventore voluptatem eaque qui laudantium fugiat. Debitis necessitatibus soluta aut nihil omnis omnis.', CAST(3.00 AS Decimal(10, 2)), N'3577 Boulevard Delesseux', N'0177791868', N'0649642171', N'Leslie_Giraud@hotmail.fr', N'94744', N'Saint-Denis', 349)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (561, N'Boulangerie Beaubourg', N'boulangerie-beaubourg', 226, N'Omnis nesciunt magni non et aut ut est. Qui itaque atque quis numquam magnam et earum eaque magnam. Totam tempora dolorum assumenda minus rerum.', CAST(15.00 AS Decimal(10, 2)), N'783 Voie Oberkampf', N'0144345068', N'0606119032', N'Joanne_Andre66@gmail.com', N'76093', N'Roubaix', 350)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (562, N'Pomme de Pain', N'pomme-de-pain', 226, N'Veritatis necessitatibus dicta aliquam cupiditate magnam facere. Ducimus voluptatem neque unde vero veritatis qui ea harum. Quia fugiat est mollitia. Ut ab tempore. Reprehenderit delectus nostrum quia quae autem voluptatem labore excepturi.', CAST(13.00 AS Decimal(10, 2)), N'078 Avenue du Chat-qui-Pêche', N'0111809302', N'0676194308', N'Jackie_Robin@gmail.com', N'37177', N'Perpignan', 351)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (563, N'Boulangerie artisanale Zerzour', N'boulangerie-artisanale-zerzour', 226, N'Reiciendis numquam incidunt optio illum repudiandae pariatur. Hic nisi eius aperiam rerum sunt et illo sequi soluta. Harum officiis dolores dolores doloremque non vero.', CAST(11.00 AS Decimal(10, 2)), N'0544 Allée du Faubourg-Saint-Denis', N'0102361956', N'0605019447', N'Sophia.Marchand@hotmail.fr', N'79934', N'Saint-Maur-des-Fossés', 352)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (564, N'Shake it Easy', N'shake-it-easy', 227, N'Vitae debitis et. Et voluptatem quibusdam dolorem rerum deserunt voluptatem nisi molestiae. Sequi fugit corporis. Quis et ad quia non occaecati ut. Eaque quia sunt consequatur. Atque deserunt suscipit officia ipsum similique fugiat animi consequatur.', CAST(4.00 AS Decimal(10, 2)), N'3515 Avenue Vaneau', N'0157314321', N'0648239876', N'Melba94@yahoo.fr', N'36659', N'Roubaix', 353)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (565, N'Cheezer', N'cheezer', 228, N'A labore veritatis quis quidem aut dolor explicabo id. Natus harum atque quaerat. Et libero numquam odio quae laboriosam a ullam sunt sint.', CAST(13.00 AS Decimal(10, 2)), N'1460 Passage Zadkine', N'0120363467', N'0633688174', N'Bernard73@gmail.com', N'72425', N'Versailles', 354)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (566, N'Nabab Kebab', N'nabab-kebab', 228, N'Alias sit aperiam voluptas occaecati omnis. Dolor reiciendis eligendi officiis molestiae consequatur impedit. Quo iste libero labore laborum.', CAST(12.00 AS Decimal(10, 2)), N'9 Allée des Rosiers', N'0172032525', N'0645243392', N'Lindsey.Louis@yahoo.fr', N'83787', N'Nancy', 355)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (567, N'Burger & Fries', N'burger-fries', 228, N'Earum molestiae ut nulla explicabo earum sit adipisci. Et nemo aut. Non molestias perspiciatis fugiat laborum sit et neque sed. Eveniet nesciunt ut fugit reiciendis quia dolorum eius. Nostrum officia reprehenderit quaerat qui iusto dolore praesentium voluptatem.', CAST(13.00 AS Decimal(10, 2)), N'0696 Quai Oberkampf', N'0178312615', N'0697675426', N'Irving_Pons94@gmail.com', N'62344', N'Orléans', 356)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (568, N'Les Burgers de Papa', N'les-burgers-de-papa', 228, N'Reprehenderit vel vel est nisi. Doloribus sed fugiat et ut facilis. Non deleniti laudantium in possimus quisquam velit non. Repudiandae esse ipsa sequi consequatur ullam repellendus. Ut qui explicabo qui ut.', CAST(11.00 AS Decimal(10, 2)), N'515 Quai Pastourelle', N'0145646806', N'0629617727', N'Dianne_Marchal51@yahoo.fr', N'83086', N'Drancy', 357)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (569, N'Mac Doner', N'mac-doner', 228, N'Veritatis blanditiis porro dolore eius nulla harum impedit. Magni quam qui accusamus corrupti nihil aut. Officia deleniti itaque natus voluptas. Earum aperiam veniam suscipit nihil sunt ut et quia.', CAST(11.00 AS Decimal(10, 2)), N'048 Rue Bonaparte', N'0119351962', N'0674801026', N'Lee41@hotmail.fr', N'34258', N'Sarcelles', 358)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (570, N'Fermier Gourmet', N'fermier-gourmet', 229, N'Autem ipsa dolores facere et autem quia illum omnis. Enim quod rem repudiandae rerum aut dolore ipsam deserunt. Quia cupiditate iste fugit sed expedita voluptate. Maxime possimus eos excepturi repellendus ad rerum.', CAST(11.00 AS Decimal(10, 2)), N'90 Passage d''Abbeville', N'0195337329', N'0663632004', N'Dale_Gerard77@gmail.com', N'12811', N'Toulouse', 359)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (571, N'La cochonnaille', N'la-cochonnaille', 229, N'Natus sit excepturi error voluptates error repellat. Consequatur eum ea vitae quae dicta repellat ea deleniti. Quia iusto commodi ut. Est nulla nostrum animi eos corrupti eveniet iusto cumque.', CAST(8.00 AS Decimal(10, 2)), N'903 Boulevard du Dahomey', N'0101932242', N'0666693273', N'Elena.Lucas73@gmail.com', N'71925', N'Saint-Nazaire', 360)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (572, N'Nos Grands-mères ont du Talent', N'nos-grands-meres-ont-du-talent', 229, N'Nemo aut iure consequatur eos quod cupiditate et ratione. Incidunt error eos rerum. Non aliquam nulla. Inventore veritatis consequatur id.', CAST(12.00 AS Decimal(10, 2)), N'6 Voie de Presbourg', N'0132935348', N'0679128877', N'Luke90@gmail.com', N'68588', N'Courbevoie', 361)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (573, N'Canard Street', N'canard-street', 229, N'Eos temporibus voluptatum eos. Voluptatem veritatis occaecati qui dicta. Dolores ut tenetur aut.', CAST(4.00 AS Decimal(10, 2)), N'7147 Passage Lepic', N'0112920486', N'0612920192', N'Jeffery51@gmail.com', N'42940', N'Neuilly-sur-Seine', 362)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (574, N'Zoe Bouillon', N'zoe-bouillon', 229, N'Quis facilis laboriosam ipsa inventore architecto eos voluptatem et. Ab unde quod repudiandae iure itaque maiores. Voluptatum qui aut.', CAST(13.00 AS Decimal(10, 2)), N'7918 Place Saint-Jacques', N'0186100774', N'0671435172', N'Clinton80@yahoo.fr', N'20152', N'Saint-Quentin', 363)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (575, N'Kitchen Paris', N'kitchen-paris', 229, N'Alias nemo alias ex repellat fugit quidem. Consequatur officia culpa omnis repellendus occaecati voluptas aut delectus sapiente. Ut sit ullam aliquid similique animi amet. Et accusamus ea doloribus mollitia commodi voluptates voluptas hic. Voluptate ab magnam dicta. Repudiandae aut in atque quae impedit eos ipsam est vel.', CAST(13.00 AS Decimal(10, 2)), N'7 Rue de la Bûcherie', N'0184794783', N'0670959481', N'Jonathan_Guillaume@yahoo.fr', N'70377', N'Boulogne-Billancourt', 364)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (576, N'Crêperie Galette Cafe', N'creperie-galette-cafe', 229, N'Eum aut et libero aliquid praesentium ut. Sit in ipsa ut ut error. Velit ad quis. Quae ullam quas laboriosam perferendis sunt.', CAST(10.00 AS Decimal(10, 2)), N'89 Place du Havre', N'0164684179', N'0613321618', N'Erick.Arnaud@gmail.com', N'95033', N'Fort-de-France', 365)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (577, N'Bollynan', N'bollynan', 230, N'Voluptatibus et nihil. Nesciunt et unde qui aut est. Molestias eos soluta laudantium deleniti modi eveniet modi. Consequuntur id molestiae aliquam a non et ut est.', CAST(14.00 AS Decimal(10, 2)), N'101 Boulevard Saint-Bernard', N'0169532274', N'0669586797', N'Ronald.Vidal88@yahoo.fr', N'88506', N'Villeurbanne', 366)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (578, N'Aarapana restaurant', N'aarapana-restaurant', 230, N'Quis architecto officiis neque sed quia quis nisi est. Voluptatibus dolores ipsam odit cumque sit. Incidunt tenetur ipsam voluptates sed et.', CAST(11.00 AS Decimal(10, 2)), N'3220 Impasse de la Chaussée-d''Antin', N'0158780569', N'0602862588', N'Leah_David@yahoo.fr', N'79130', N'Le Havre', 367)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (579, N'Safran', N'safran', 230, N'Harum ut perspiciatis eligendi. Architecto est beatae qui aut sunt temporibus. Impedit quisquam omnis ad non ut ipsa. Praesentium sit perferendis voluptatem. Saepe soluta est aut et pariatur omnis saepe.', CAST(10.00 AS Decimal(10, 2)), N'002 Passage de l''Abbaye', N'0188443632', N'0685664699', N'Neal.Guillot@gmail.com', N'10323', N'Aix-en-Provence', 368)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (580, N'Eat & Cool', N'eat-cool', 230, N'Aut fugit perferendis quo quia quia repellat in explicabo. Autem minus et assumenda debitis aut unde repellendus. Quisquam delectus iste optio et dolorem quod consequatur id. In aut sunt sed minima eligendi at beatae totam.', CAST(4.00 AS Decimal(10, 2)), N'4 Impasse Charlemagne', N'0164223738', N'0605538168', N'Janie.Renard@gmail.com', N'12848', N'Mérignac', 369)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (581, N'Taboulé Paris', N'taboule-paris', 231, N'Eos aut quis praesentium. Minima vitae distinctio dolore error id. Consequuntur quo officia. Quas delectus illum dolorem velit officia rerum iusto.', CAST(11.00 AS Decimal(10, 2)), N'121 Place Charlemagne', N'0169660902', N'0631301210', N'Leslie_Lecomte70@gmail.com', N'57414', N'Nîmes', 370)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (582, N'Chez le Libanais', N'chez-le-libanais', 231, N'Veniam quas tempore aut nostrum odio eligendi voluptatem laboriosam. Eum accusantium natus odio non qui pariatur. Et qui corporis accusamus. Laborum omnis qui dolor autem occaecati beatae incidunt saepe. Quidem dolorem accusantium ducimus nesciunt nostrum.', CAST(6.00 AS Decimal(10, 2)), N'8726 Quai des Saussaies', N'0106926081', N'0694421944', N'Heidi94@gmail.com', N'95777', N'Rennes', 371)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (583, N'Le Cèdre', N'le-cedre', 231, N'Sed doloremque aspernatur quia adipisci velit necessitatibus omnis. Voluptas omnis consequatur minus sed cupiditate necessitatibus natus. Ut voluptatem quisquam voluptatem est consequatur.', CAST(5.00 AS Decimal(10, 2)), N'06 Allée des Lombards', N'0175398583', N'0648328288', N'Brenda27@yahoo.fr', N'31406', N'Villeurbanne', 372)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (584, N'Noura', N'noura', 231, N'Non nostrum dolor ipsam officiis molestias et vero aut. Cum qui facere ipsum tenetur. Sit autem debitis qui consequatur vel expedita aut. Voluptatem mollitia ducimus. Quo numquam mollitia vitae ex quia molestiae sint quod.', CAST(4.00 AS Decimal(10, 2)), N'2 Impasse Pierre Charron', N'0198725928', N'0612615120', N'Carl52@gmail.com', N'00466', N'Roubaix', 373)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (585, N'Zaatar Libanais', N'zaatar-libanais', 231, N'Aut qui quos quisquam quis odio et. Aut blanditiis et id. Veritatis officia id rem ab quo aut.', CAST(6.00 AS Decimal(10, 2)), N'4216 Place du Faubourg-Saint-Denis', N'0129710830', N'0671232368', N'Cecilia_Menard@hotmail.fr', N'75493', N'Mulhouse', 374)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (586, N'Big Falafel', N'big-falafel', 231, N'Voluptatum ipsa aliquid. Doloribus et ut tempore maiores aspernatur. Fuga provident omnis quisquam quidem voluptas ullam iure. Pariatur rerum totam quia ex tempore ea. Molestiae qui ullam aperiam quasi et reiciendis facere. Delectus inventore ducimus sint sed sint est.', CAST(12.00 AS Decimal(10, 2)), N'32 Voie de Paris', N'0119181362', N'0632851034', N'Bradley_Perrot27@hotmail.fr', N'40328', N'Avignon', 375)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (587, N'Marché Libanais', N'marche-libanais', 231, N'Quia maxime sapiente architecto magni repudiandae nulla accusantium. Temporibus maxime non et tenetur ad. Est ut blanditiis et nisi soluta tenetur quaerat. Ad esse recusandae et. Et est consequatur. Omnis similique repellat.', CAST(3.00 AS Decimal(10, 2)), N'6 Passage de Richelieu', N'0171731126', N'0683484712', N'Shannon_Vasseur@hotmail.fr', N'08053', N'Beauvais', 376)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (588, N'King Falafel Palace', N'king-falafel-palace', 231, N'Doloribus sapiente qui nisi voluptatum. Voluptatum dolor quo impedit dolores consequuntur. Non itaque in provident iure eligendi aut. Et et quisquam illum rerum qui est voluptatibus.', CAST(12.00 AS Decimal(10, 2)), N'4 Avenue d''Alésia', N'0116552857', N'0631358075', N'Ken_Deschamps40@yahoo.fr', N'21868', N'La Seyne-sur-Mer', 377)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (589, N'O Beyrouth', N'o-beyrouth', 231, N'Est a cupiditate eos est ea iusto. Aut ipsa nemo officia odit. Et dolorum id. Minima fugit id quia minima. Quia alias aliquam quis dicta ut aperiam. Adipisci molestiae quasi tempora.', CAST(15.00 AS Decimal(10, 2)), N'5719 Passage de l''Abbaye', N'0188957059', N'0624411857', N'April56@gmail.com', N'94390', N'La Seyne-sur-Mer', 378)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (590, N'Shawarma Lovers', N'shawarma-lovers', 231, N'Dolor aliquid sint. Recusandae veritatis vel quo nemo tempore. Sed rerum quaerat voluptate nulla maxime pariatur. Natus consequuntur aliquam voluptatum quaerat.', CAST(12.00 AS Decimal(10, 2)), N'5728 Quai Zadkine', N'0113243541', N'0647164914', N'Barbara6@yahoo.fr', N'59917', N'Versailles', 379)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (591, N'Topoly', N'topoly', 231, N'Voluptatem nisi et consequatur delectus. Laudantium voluptates est excepturi vel cupiditate. Deleniti earum esse ea quis quas ut perferendis. Enim aut rem doloribus ab optio necessitatibus aliquam quas.', CAST(11.00 AS Decimal(10, 2)), N'5222 Avenue Monsieur-le-Prince', N'0178265437', N'0692809179', N'Juanita90@hotmail.fr', N'33231', N'Courbevoie', 380)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (592, N'Five Pizza Original', N'five-pizza-original', 232, N'Velit esse maiores. Culpa ab quod voluptate alias dolorum ducimus provident. Modi perferendis est nemo hic ipsa repellendus rerum temporibus. Fugit totam eligendi.', CAST(8.00 AS Decimal(10, 2)), N'4 Place de Rivoli', N'0175336416', N'0692329979', N'Laverne45@gmail.com', N'08961', N'Lorient', 381)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (593, N'5PIZZ', N'5pizz', 232, N'Ea consectetur dicta nobis eaque labore dolorem voluptatum doloremque. Eaque omnis et hic aut voluptatibus voluptatum laudantium alias. Sit ea incidunt repellendus minima id. Possimus ex fugiat.', CAST(3.00 AS Decimal(10, 2)), N'4971 Boulevard La Boétie', N'0136150845', N'0660640870', N'Philip18@hotmail.fr', N'91582', N'Cergy', 382)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (594, N'Chez Alfredo', N'chez-alfredo', 232, N'Inventore ipsum quia qui voluptatum rem rem. Dicta assumenda reprehenderit. Eum omnis autem eos quia consectetur nostrum ipsum aut. Eveniet facilis ut quo rerum soluta consequatur cum itaque. Quibusdam maiores error dignissimos omnis sed sed ut nemo. Voluptatum nemo consequuntur dolore enim necessitatibus.', CAST(14.00 AS Decimal(10, 2)), N'3591 Place Joubert', N'0130085722', N'0659657048', N'Billy.Denis@hotmail.fr', N'05475', N'Aubervilliers', 383)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (595, N'Mulberry Street', N'mulberry-street', 232, N'Et sit qui optio mollitia aut nisi. Quis sed sit. Qui sequi ad culpa occaecati necessitatibus. Totam delectus blanditiis corrupti dolor aut. Ut non saepe voluptatem occaecati et. Dolorem magnam ut saepe qui.', CAST(8.00 AS Decimal(10, 2)), N'2445 Voie du Dahomey', N'0163155089', N'0637820336', N'Michelle32@hotmail.fr', N'00957', N'Dunkerque14', 384)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (596, N'Pizza La Fayette', N'pizza-la-fayette', 232, N'Consequatur quos optio quaerat alias adipisci eaque eos quisquam. Consequuntur pariatur ad. Voluptate nostrum perferendis quas aut nostrum tenetur ut qui. Ut accusantium illum qui necessitatibus recusandae nihil laboriosam quisquam rerum.', CAST(4.00 AS Decimal(10, 2)), N'8094 Boulevard Pierre Charron', N'0125457580', N'0664554725', N'Abraham2@hotmail.fr', N'75959', N'Niort', 385)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (597, N'Pizza Rustica', N'pizza-rustica', 232, N'Error et alias vero accusantium quis nobis velit et. Ex praesentium doloribus voluptatem quidem qui. Dolores qui voluptatem voluptatibus aut dicta.', CAST(4.00 AS Decimal(10, 2)), N'4 Rue Saint-Bernard', N'0136459572', N'0635513023', N'Kimberly97@hotmail.fr', N'92606', N'Strasbourg', 386)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (598, N'César Montorgueil', N'cesar-montorgueil', 232, N'Tempora eius sunt delectus. Voluptatem occaecati quam. Qui ut non accusamus quis deleniti est voluptates ipsam modi. Sed dolorem repellat adipisci rerum totam dolorum. Qui provident officiis quis excepturi nobis ullam vero.', CAST(6.00 AS Decimal(10, 2)), N'0365 Passage Bonaparte', N'0101171135', N'0637440526', N'Claude.Laine@gmail.com', N'02126', N'Colombes', 387)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (599, N'Amala', N'amala', 232, N'Ex veritatis perspiciatis est. Et ad et et iure officiis vero. Sed placeat maiores excepturi sint est quis rerum assumenda quia. Nihil cum consectetur fuga commodi aut minima id nesciunt ex. Dolor explicabo dolores blanditiis distinctio quos nemo.', CAST(12.00 AS Decimal(10, 2)), N'571 Passage Pierre Charron', N'0149003782', N'0673225860', N'Kristy.Leroy@gmail.com', N'68957', N'Colombes', 388)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (600, N'Falstaff', N'falstaff', 232, N'Porro voluptate sequi fugiat. Facere inventore id illo quo rem perspiciatis minima laudantium. Dolorem alias tenetur occaecati amet. Nostrum modi velit vitae nobis cupiditate. Consectetur aut commodi aliquid dolores ratione quo nihil deleniti voluptatem.', CAST(3.00 AS Decimal(10, 2)), N'5 Boulevard Saint-Bernard', N'0138765029', N'0655445137', N'Sonya69@gmail.com', N'98083', N'Dunkerque14', 389)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (601, N'Palazzo di Pasta', N'palazzo-di-pasta', 232, N'Aut voluptatem numquam cumque impedit nulla expedita a ut. Totam aperiam qui ducimus non voluptatem cum voluptate. Officia enim optio alias quaerat. Natus pariatur neque consectetur dolor et. Consequatur voluptas occaecati facilis at consequatur mollitia.', CAST(9.00 AS Decimal(10, 2)), N'3748 Passage de l''Abbaye', N'0149202931', N'0678254941', N'Shawn.Remy@gmail.com', N'07330', N'Colombes', 390)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (602, N'Pizza Presto', N'pizza-presto', 232, N'Doloribus molestiae voluptates dolore veritatis qui. Iusto quibusdam rerum quod deserunt sapiente in doloribus consequatur. Ut eius rerum fugit animi. Reiciendis similique asperiores nulla enim quae. Enim magnam in recusandae et possimus sed. Accusamus voluptas impedit autem similique.', CAST(3.00 AS Decimal(10, 2)), N'388 Passage des Lombards', N'0155416435', N'0688234960', N'Darrin_Chevalier26@yahoo.fr', N'59158', N'Ivry-sur-Seine', 391)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (603, N'Chez Aldo', N'chez-aldo', 232, N'Voluptatum eligendi unde. Et voluptas illo at dicta nemo autem reiciendis hic. Molestiae error labore doloremque. Id veritatis molestiae quam veritatis dicta labore doloremque itaque.', CAST(10.00 AS Decimal(10, 2)), N'47 Voie Saint-Honoré', N'0100112192', N'0632225920', N'Jenny2@yahoo.fr', N'21923', N'Champigny-sur-Marne', 392)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (604, N'Del Arte', N'del-arte', 232, N'Illum voluptas minus veniam voluptas exercitationem exercitationem vero aliquam magni. Error sed et voluptatem necessitatibus beatae. Ut numquam non. Minima laudantium consequatur ut ut eius quaerat ab commodi voluptatem. Sit dolorem qui inventore vel possimus quo. Et quasi voluptate vel sint molestias ut.', CAST(7.00 AS Decimal(10, 2)), N'54 Impasse Saint-Denis', N'0164006085', N'0622470527', N'Arlene_Denis98@yahoo.fr', N'60083', N'Beauvais', 393)
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [IdUtilisateur]) VALUES (605, N'Italian Trattoria', N'italian-trattoria', 232, N'A voluptatibus et ab quo eaque. Rerum error neque cupiditate alias modi sit. Illum nisi voluptatem temporibus recusandae blanditiis optio sapiente sint enim. Sit voluptatem exercitationem deleniti nemo. Ullam sequi cum qui assumenda rerum accusamus repellendus fugit accusamus.', CAST(15.00 AS Decimal(10, 2)), N'1394 Allée Saint-Bernard', N'0180045821', N'0682602027', N'Saul.Laine52@hotmail.fr', N'95878', N'Calais', 394)
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (556, 3812)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (557, 3813)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (558, 3814)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (559, 3815)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (560, 3816)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (561, 3817)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (562, 3818)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (563, 3819)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (564, 3820)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (565, 3821)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (566, 3822)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (567, 3823)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (568, 3824)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (569, 3825)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (570, 3826)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (571, 3827)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (572, 3828)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (573, 3829)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (574, 3830)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (575, 3831)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (576, 3832)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (577, 3833)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (578, 3834)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (579, 3835)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (580, 3836)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (581, 3837)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (582, 3838)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (583, 3839)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (584, 3840)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (585, 3841)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (586, 3842)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (587, 3843)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (588, 3844)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (589, 3845)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (590, 3846)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (591, 3847)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (592, 3848)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (593, 3849)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (594, 3850)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (595, 3851)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (596, 3852)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (597, 3853)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (598, 3854)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (599, 3855)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (600, 3856)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (601, 3857)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (602, 3858)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (603, 3859)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (604, 3860)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (605, 3861)
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IdRole], [Nom]) VALUES (7, N'Utilisateur')
INSERT [dbo].[Role] ([IdRole], [Nom]) VALUES (8, N'Restaurateur')
INSERT [dbo].[Role] ([IdRole], [Nom]) VALUES (9, N'Admin')
SET IDENTITY_INSERT [dbo].[Role] OFF
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (293, 9)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (294, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (295, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (296, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (297, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (298, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (299, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (300, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (301, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (302, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (303, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (304, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (305, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (306, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (307, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (308, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (309, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (310, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (311, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (312, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (313, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (314, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (315, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (316, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (317, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (318, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (319, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (320, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (321, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (322, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (323, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (324, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (325, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (326, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (327, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (328, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (329, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (330, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (331, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (332, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (333, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (334, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (335, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (336, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (337, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (338, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (339, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (340, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (341, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (342, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (343, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (344, 7)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (345, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (346, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (347, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (348, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (349, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (350, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (351, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (352, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (353, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (354, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (355, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (356, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (357, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (358, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (359, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (360, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (361, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (362, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (363, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (364, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (365, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (366, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (367, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (368, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (369, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (370, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (371, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (372, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (373, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (374, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (375, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (376, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (377, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (378, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (379, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (380, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (381, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (382, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (383, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (384, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (385, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (386, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (387, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (388, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (389, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (390, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (391, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (392, 8)
GO
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (393, 8)
INSERT [dbo].[RoleUtilisateur] ([IdUtilisateur], [IdRole]) VALUES (394, 8)
INSERT [dbo].[SessionUtilisateur] ([IdSession], [DateSession]) VALUES (N'ib2p2xym4l5p2jxf41xrintp', CAST(N'2020-03-10T20:33:04.380' AS DateTime))
SET IDENTITY_INSERT [dbo].[TypeCuisine] ON 

INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (225, N'Asiatique', 3804)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (226, N'Boulangerie', 3805)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (227, N'Brasserie', 3806)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (228, N'Fastfood', 3807)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (229, N'Francaise', 3808)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (230, N'Indien', 3809)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (231, N'Libanais', 3810)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (232, N'Pizza', 3811)
SET IDENTITY_INSERT [dbo].[TypeCuisine] OFF
SET IDENTITY_INSERT [dbo].[TypeVersement] ON 

INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (2, N'Espèces', 1)
INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (3, N'Chèque restaurant', 1)
SET IDENTITY_INSERT [dbo].[TypeVersement] OFF
SET IDENTITY_INSERT [dbo].[Utilisateur] ON 

INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (293, N'TuTu', N'Toto', N'admin', N'ABFaPC105XSGsZ7tB7yGtAROWEm9eDh37NBFd/0Uk/M2FTkRUnofWsj142xLPN6NzA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (294, N'Kergall', N'Yoann', N'yoann', N'AEdst4lHa9BRbIGq0+oM1poQi9aXZf3XF4uPFoJDQ3ufT5CL1bCZ5mA1DCKHOTm3hg==', 1, CAST(500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (295, N'Perez', N'Regina', N'Regina35', N'AJzkiB9JrF6MjdoEjZHEsXNSgJc1CehFmXfnJUjKPYv9YaAb2jMvJAak/Z58B1Hruw==', 1, CAST(34.90 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (296, N'Guerin', N'Marguerite', N'Marguerite.Guerin9', N'AASHXJ1wgoscQ4oPvzfHC6WNgt+8ChqxKRhTWsqC0xJwPGl8pnUeMyCKTbQKeG6Kyg==', 1, CAST(57.90 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (297, N'Noel', N'Enrique', N'Enrique_Noel90', N'ACKfWuKPY/VscOYReS7ejxeKrNluDpzpP9xmxMZbmaOea8fIefysz/ZRqeYTPviC2w==', 1, CAST(20.82 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (298, N'Bernard', N'Hugh', N'Hugh.Bernard81', N'ABR0fCQk+9uCphATV+cCeFXQXkNkZFQhhWKCxoSK4SKIiVG+mY/DuYsaM13ZYz/v0w==', 1, CAST(29.86 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (299, N'Vincent', N'Owen', N'Owen29', N'AEqBrwbPb0nEpSeT0ZI/SLaucPaUCAle8Wge+IEUJ2mhISp3FIYqtC6PlvM0rqJUvw==', 1, CAST(20.45 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (300, N'Rolland', N'Mathew', N'Mathew.Rolland22', N'AH0Jeae5BsMfF0h5BwSoBi5pzp+wimheiZpK3s6LCOCeM4XFZhB6Zg6Ei8oI9kY26g==', 1, CAST(92.81 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (301, N'Guerin', N'Peter', N'Peter.Guerin99', N'AAv61Fjl6QilbeyqTfYg+hDUvy5s4xdfrOSim5kJy2cTUJkAOEq6FksMWT+84KE0tQ==', 1, CAST(84.88 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (302, N'Fleury', N'Maurice', N'Maurice_Fleury', N'AKAUseI/MZL2aiyU5zx9P+Z9lA3Yu6++sa4Nqs/MSf2kXZQEbM/K2xybhAwJ9H/zUQ==', 1, CAST(97.79 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (303, N'Guerin', N'Kelli', N'Kelli_Guerin', N'AJla5V6Nr/HTFX7bTQyKcp2CicABFgo8w5bYFxJnNq1xQHa/6TNAV6TBloflsEdpew==', 1, CAST(9.53 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (304, N'Menard', N'Misty', N'Misty.Menard', N'ANcmlLbVtCZltxZDT3D4W+IF1GegIkiaB3NaoELLqK7dXxUuWNJwaX8nNc2PP9V/vw==', 1, CAST(63.86 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (305, N'Jean', N'Roberta', N'Roberta85', N'AIv7OQj++hdRfmEfBtSJiZAvjYHtFq//dZJde7swEle2FuU7Fu5IcvByIc/MMnx5XA==', 1, CAST(2.10 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (306, N'Schmitt', N'June', N'June.Schmitt30', N'AHgL1qpzO5zeD5GzWk0DNHlzEj6yjPees7FmFq/WSgfVHSbg+aBrtnmmWDFMKKAdhg==', 1, CAST(53.18 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (307, N'Masson', N'Crystal', N'Crystal_Masson', N'AM4m5Dz7b2k74Go2Q+MrfhCrD3HcKGczgIMfI7gjHeGs8o9PSYOL/J9MxnevzWkcng==', 1, CAST(65.08 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (308, N'Sanchez', N'Marian', N'Marian.Sanchez', N'ANnDVcVwYWqSr6YHZZW5xaN1x4ciLYKGdikJzV/U/u963ieIUtdndmYdEz3G26TmOA==', 1, CAST(95.96 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (309, N'Roy', N'Reginald', N'Reginald_Roy65', N'AN9bCnaOTkcKkYqgFc9WxEhJ6y1Z3hL6g9i669tEEdeLdMZx3wdQkHoT6LVx6sUVMQ==', 1, CAST(68.39 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (310, N'Schneider', N'Patricia', N'Patricia_Schneider', N'AFHKHcD4CogTMdY/bYIh/7n9dcT5V/xh3NORb6lbLkMbIDR+r0BFKkCd2RT0AAc9Vw==', 1, CAST(19.75 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (311, N'Boyer', N'Lola', N'Lola_Boyer44', N'AFHH/vpQBCH5hZ0+urUk+ApDaLa/ft3Zs46VdDxmhES4th2cfer0mlrfCNI0s8nwHQ==', 1, CAST(21.50 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (312, N'Morin', N'Wanda', N'Wanda.Morin39', N'AB8va7xVrfNXHtpKbbgU2LhqxQne/QfClAG5V1oLW3/CVXsK/V68X/eO7ZO/mA86YA==', 1, CAST(18.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (313, N'Remy', N'Kelly', N'Kelly.Remy59', N'ANV0x5wWM15lRdQeslB7xOpaI8+OsF5sWoWcZy/wu3D0R/MNnA8SZUPClYlrQJR78w==', 1, CAST(82.80 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (314, N'Lecomte', N'Geraldine', N'Geraldine_Lecomte11', N'AGYJmUonXxqzt870g8zZV880+b175/0mFpFvJrsMqjqU/Rm7Uvgyd0Isy8w0JXbzXQ==', 1, CAST(86.64 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (315, N'Denis', N'Roberto', N'Roberto.Denis', N'APhBytbqb7t1knW1GdCFhpdWgm7+4aYqwsAHPTi4kvfBOePzKlGzuDUhDzhc9EcILQ==', 1, CAST(51.61 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (316, N'Guillaume', N'Marcos', N'Marcos_Guillaume23', N'AO2LamTw6bWWJIga6EaPmYctPyCek6Ch8WmdFbKtEqZNPUOomhgJeLHv37879i5EOA==', 1, CAST(70.28 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (317, N'Giraud', N'Dean', N'Dean.Giraud', N'APosCONIeW0BMQ0O/lrNvTOtVFjB4+59mHx0nCO6FPN9areD1Bufp5r70vGh6alULA==', 1, CAST(52.06 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (318, N'Henry', N'Renee', N'Renee22', N'AN40h+SoBFT1a1dVjRCZoDUxAVEINxqv/YDIFL9ecFUwZ3XEU+UG+ZWsKK3SsnRISg==', 1, CAST(71.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (319, N'Olivier', N'Miranda', N'Miranda_Olivier39', N'AAxhGzH275uHKXohZ0QUTud/hMlxV0nZwQvjkwNUOGnbnc0F6Q26IvgFbVOuWoUZpA==', 1, CAST(39.65 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (320, N'Leclerc', N'Lee', N'Lee.Leclerc99', N'AG6WTzhNmReTWC79+qnB6YbwtFVy5CFHkvEt6bTaujBCA5oDx9iNW1+tWouqJrssww==', 1, CAST(41.29 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (321, N'Guillaume', N'Emilio', N'Emilio_Guillaume17', N'AKnw6y1RDApasazY4BQ2+YG5JEXcVcyVsAsmSiQ5jxxPFmYvxpLtNHfijNnMSndKlA==', 1, CAST(43.45 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (322, N'Garnier', N'Laurence', N'Laurence.Garnier95', N'AI+2W0KlQOPzQvdqJrF3MZc4GbSNLm/IirD+WHuxSYJELpbZTLmV0jK69GTukfX60g==', 1, CAST(12.75 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (323, N'Thomas', N'Don', N'Don_Thomas96', N'AKRXlHnEBeypcqhvBAjaEj0fonsxMEfs+KQDWlI9Uw6CrAMQSaqowa1iDkIUN6ocog==', 1, CAST(64.87 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (324, N'Adam', N'Ricardo', N'Ricardo74', N'AH057uaJDHgPVBoyiy6LHdAu7f75rF7FTjrzr0EdWIVa/r+8e4uwvwhyXHXeL8/8OQ==', 1, CAST(51.21 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (325, N'Roux', N'Melba', N'Melba_Roux', N'ABTW5iLlFK8CjCFUahu55eTl10YEtuCcIzYaOvoayknu/rS6ZIQceqXXT2PXZDjIsg==', 1, CAST(86.79 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (326, N'Boyer', N'Shelia', N'Shelia.Boyer36', N'AJq4Xrw+zW1Y0unKThK1pvt6lRICqh+kOmbYEqydR1Gt+rmLOspfwv8AsCEIQTmt5w==', 1, CAST(11.35 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (327, N'David', N'Melanie', N'Melanie58', N'AJrHu8+laOElhwlsl0ObTBo1vuogpNNd48qTyUkGxbKLG30bsoGBhbDgfE1X2Z+TzQ==', 1, CAST(24.36 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (328, N'Rolland', N'Melba', N'Melba.Rolland', N'AJl6/mfblFGInPfH7T2eOv1NyhNS/pkW7JijEHFd+mYAxod4JCWYTk1mMXAVm0cGJg==', 1, CAST(98.87 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (329, N'Colin', N'Doyle', N'Doyle_Colin', N'APZTxJup+XVQr7yNzpId2jVBW/Rfq6ANGNxJ+xO2DaNeG+hSlf+vLp0MKs9DoyMxyA==', 1, CAST(53.05 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (330, N'Dupuy', N'Melba', N'Melba.Dupuy', N'AFFHXj32AkzhanfLrvlLhLwYgyGWGEj71DfeptyhkTOHw0l/WMOOB3Ygvd/xgiASpA==', 1, CAST(21.81 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (331, N'Lemaire', N'Henry', N'Henry69', N'AOITsXYT1mYRtrNFwB0iAcX+gKwmWdPmQBmG/SsbmiMbAIR3jkc0qYDsfb8d2/FUeQ==', 1, CAST(23.60 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (332, N'Martin', N'Stanley', N'Stanley_Martin', N'AI7sI2u6xj9DvUXjK8yydcKQQnAdMsjpmt1pgmBLrc6/5o7hDfGVxvtejCH3ptE2Ig==', 1, CAST(37.51 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (333, N'Charles', N'Alice', N'Alice.Charles58', N'AOc/U9higAElI0WRIXbZYTZMXfxxMtdx2OTslZQ0jnfYtKbnUPXrEcG83z7B1ELKbw==', 1, CAST(63.72 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (334, N'Schmitt', N'Viola', N'Viola_Schmitt97', N'ANkE0dczPwZN3fiiliZI2DGhMX6pEj8i2P36S+KhV0IlZ4nOLdxFPF7DLvmPLcd78A==', 1, CAST(82.77 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (335, N'Meyer', N'Bernard', N'Bernard.Meyer16', N'ALXzUUpuEl5epPO+yIUF6SEKf/995f73KzJKtEMpba0xBjuBclR/j6vSgF2k9AeSHQ==', 1, CAST(66.34 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (336, N'Lemaire', N'Clay', N'Clay4', N'AMsPPz/rPZjtJbykFw/xOgOIoITRRa0sUm+fdRHHQ2zsBxOhSwKsow6L8gqbdB1zdA==', 1, CAST(30.11 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (337, N'Caron', N'Constance', N'Constance21', N'AD1WDQeVU1yFX0KNL7ePP7YBXtCpOH0FVrbgvwaaYzY0q0eokeX0eXwMCTgZ09d2kw==', 1, CAST(94.46 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (338, N'Blanc', N'Terrell', N'Terrell12', N'AOSbMYZ2Ajm0oOOEA1jpe705J+yOUY+ZF0l9R0cR2HrbhdeVH7/3LxWd4KYip0aszg==', 1, CAST(41.35 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (339, N'Picard', N'Dewey', N'Dewey.Picard', N'AKHY4Fj5bzPMsnhvcPQEUsVWptR9hPIodK4drXzI+4HLvh8mA84qpWeN7hCzLxEiyA==', 1, CAST(95.05 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (340, N'Colin', N'Dora', N'Dora.Colin78', N'AFp3/S1jeNSb+1s5DkEIbrOPlmgk2wcxMTxEsZxBgsf4m7WPrL1/c1COyvSzMEDyuQ==', 1, CAST(44.65 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (341, N'Perrin', N'Jacob', N'Jacob.Perrin', N'AB/iNWxFaKo6f4m06HG1soYEirtGa49AzSPZ66w3J+E5FkSolP9eEADyDRSmTrZa6Q==', 1, CAST(72.31 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (342, N'Blanchard', N'Rose', N'Rose.Blanchard96', N'AFsVCES4M254/iVzeM17rrkUhDOePxB/luCIvabEoyzsrG3p4nhuJMelo+SFZqpU3w==', 1, CAST(6.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (343, N'Roussel', N'Catherine', N'Catherine.Roussel97', N'AI7UmLmtBZm6ErZj/jaJx1J5aPoyKAy7uYr724Ztc22ivqSKkVurRgjErO2mP+/8WQ==', 1, CAST(71.43 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (344, N'Bonnet', N'Jermaine', N'Jermaine.Bonnet0', N'AFDljbyqTsnsXY4/96lDe1CEZQYfngIJqnCBwOGlMlQi14JSxy9jqdd5emxRggx/sQ==', 1, CAST(15.39 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (345, N'Barbier', N'Gretchen', N'Gretchen.Barbier60', N'ABZTBcauOX7f9stBVsgGrZt74fQ76hyVFn2cEVJ4zEQnkyNBTUk5nrZuv6NT4P3bcg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (346, N'Mathieu', N'Kimberly', N'Kimberly.Mathieu', N'AHVlP8EG0JEAfd+4ht/Q1hznhFAl0cenyoS+o/ZNfitmCSbKjRLSlA0qkZ7rQiI9Jg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (347, N'Leclerc', N'Cory', N'Cory_Leclerc33', N'AIsYcfS9rL1KAK7IPZMG0fgcqpnkygxxE+whJSaU51Db5I7t4w81aS2seUEzf8qfIA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (348, N'Carre', N'Alma', N'Alma78', N'AGIcWYIrivBtuVEgNwhjPo1SbY5fbmQ86XOsZBA94Wkr1ZKc+pDrc/bKWQ8ndZgVsw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (349, N'Giraud', N'Leslie', N'Leslie.Giraud84', N'ALl9My98ctnCn2z+gBf52hh8t9NdN7EUYjU5zgB49wXhw6yYh4UnWjG5OxDcKse6WQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (350, N'Andre', N'Joanne', N'Joanne.Andre', N'AN3D3BACrvS0J+3UdYu+hM9BquOLZe67Z8xm2KqBJHbUnhOgFyUPh2t59zPucasX+A==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (351, N'Robin', N'Jackie', N'Jackie_Robin71', N'AJsEM4JoXGOycu/pPd+VOZ/7FU2MJ6okyg+a6Ol/l1SpZBipWa+y6gNMcpIjp45CeQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (352, N'Marchand', N'Sophia', N'Sophia_Marchand20', N'ANXZJ5dfhY56ZtmVDLosHEuDrhh/8hTfv879Cv1xeaxMO1lUru8GLtEO1tuoUTiyOA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (353, N'Vasseur', N'Melba', N'Melba2', N'AH9xdTxXtFyW1pc3xDFpZFnjqbKMfEqJngtl6XaAu4NMt9NuAIznQPrLorAQbwM6bQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (354, N'Charpentier', N'Bernard', N'Bernard62', N'ABfMlFJ7ZLEOGj8KK4XinG0tqRbZ6yQ91AdKfogGNL+dITDk34h2fJ32h/XySiDc5A==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (355, N'Louis', N'Lindsey', N'Lindsey71', N'AFY1+w7P+930MJwIxtFViw46UiKKHAGkrmMRRm37w4Eu8rcJ04leE7QeIs16HXVW1A==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (356, N'Pons', N'Irving', N'Irving54', N'AKpsfJ+x8Q1eaQt6dzaT5av4Yu9DpIPCDz6kxbezd4X8eEaiAnDFJDOXKKqh0kQH3Q==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (357, N'Marchal', N'Dianne', N'Dianne98', N'AOwbV/Eq49C+4zxPNOqAJQVZOeNDQ1YQQzZmxbqBOH4xsjDVR7mn6cOyAUfoIP8CbA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (358, N'Lefebvre', N'Lee', N'Lee.Lefebvre96', N'ABS4PZlGGS7vDTK8TzkT1aFLoG/hAMWawrrQZgLCQzntFIuYOGdUhiZf+rkdXkoKdw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (359, N'Gerard', N'Dale', N'Dale50', N'ALvt7qhg8hucLs4yxjUkhje5lBFG2XHgwj0ugkwqvs1V2Esx6kekD6WYkBoetgRpwg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (360, N'Lucas', N'Elena', N'Elena.Lucas1', N'AHISNOWrpIrrZmvQMAyi/CKFE3vUav/oycUsefj1kXZCmhTu5XSqvb3NNRE7JSePLw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (361, N'Rey', N'Luke', N'Luke_Rey19', N'AD5AyAtooEju8KN9pkzFljq8o/x/tNCxhnd4l72XPASw+pDQwnK4t5vtewD2SceDQg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (362, N'Fernandez', N'Jeffery', N'Jeffery28', N'APY3iJJbY90JQ8CW9F/MsM1DnX9OdBa0nKRWp9hdtAVKe3OOnYKOJ7U+/aq1ulD3qQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (363, N'Hubert', N'Clinton', N'Clinton91', N'ADokw/DBMsVRJsolHCFewc/P6GoSHHPxnNexZrjhPOQ0ptone/YDAYRV5LoVmBJVLw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (364, N'Guillaume', N'Jonathan', N'Jonathan50', N'ABzHLwbWpuo6tFjcpOWrxG1w2GjZmAMSV+Iu02mWK9cvxzFA2757014j2Z0rw6Qf4w==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (365, N'Arnaud', N'Erick', N'Erick.Arnaud81', N'AMwL3dPWghQAr+ZptLMX7SMkXfK0Kp05ZJEhCPUXNtBOACQrKVU+Hu6GOdcXg3cGaw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (366, N'Vidal', N'Ronald', N'Ronald_Vidal11', N'AJAr9JHcwFW3yWaDLlcagP3PxEnsKBuWDH2mg27VqwgYBgQLSd7Wd+vgnrnBqxMcbg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (367, N'David', N'Leah', N'Leah_David53', N'AIo6B0dMktem1nTrjvQblgBZgsL2kIlgeYjBq+PRROkr8i5M2MHjTNDZPhy5ZepzkA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (368, N'Guillot', N'Neal', N'Neal_Guillot', N'AFuBR3pZgLbufbHgqv8eOFTpE3W2AWaLQh/c9zKOsS4rPfcQhLLa9jovm37KcBcWOA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (369, N'Renard', N'Janie', N'Janie17', N'AE46C1/IwXpMzsoKzeHWVt0ytYpI23Z2dK3QNyW1zFpnIfiKiMbGp59Ih6rt4XqH1Q==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (370, N'Lecomte', N'Leslie', N'Leslie.Lecomte20', N'AHWTDpELqTI5DRjZRwKby50ACnGTkE65lFyWvlnA4sZEil/9IuWXHLxbnK1iTl0TgA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (371, N'Bertrand', N'Heidi', N'Heidi68', N'AOFgPpIAbTpXTJwttHh2gbqpBylfjqOoZpeYvp4UhbrLCd3213Ywm6HtdJDsaS16jQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (372, N'Robert', N'Brenda', N'Brenda.Robert31', N'AP7EqXO31v27fA6u2XKfTXndEqkjyLj/3e2m54RpxlC04ivYVrmkMW4dmAPDlZ2Kyg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (373, N'Leclercq', N'Carl', N'Carl_Leclercq', N'APW60wNXgtO/6RaeIT8mefNZ/OuNXe2dDqX6MRSMMZc3+Hsc0866PkVknXqGwy3ANQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (374, N'Menard', N'Cecilia', N'Cecilia72', N'APnO4XMUUUqxfkbGDO+UF2XeAYNnY3VYwKNpQSTc5Ur8O/W9RbelyG3anxgGfHs2jA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (375, N'Perrot', N'Bradley', N'Bradley.Perrot', N'AMuvUg0UkZFKKFgfz8hVUn+d+ixdJarrgQ81b82e93LglYTUn0hiSbLv8FJigOYy1Q==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (376, N'Vasseur', N'Shannon', N'Shannon_Vasseur55', N'AOinWs4tBidUytK2ZeFrKWTCNn8WdVKNoOxsnpWdhkO2+NOvZUtu/3JAGVQSQ6SG9A==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (377, N'Deschamps', N'Ken', N'Ken_Deschamps85', N'AAnTg+U3b6OOEO3eVpUHo5bCvI3R6NnoBRnXszTji00kRwpUYpoMvbD/ly9cS6AIUw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (378, N'Le roux', N'April', N'April.Leroux14', N'ALCbXstbSctkGg7k24nAgLAlQeHBYaIy7fpJPgHh5Kxw6PLurwhhLlUSYHJgUFV51w==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (379, N'Leroux', N'Barbara', N'Barbara.Leroux93', N'AHQyJUdEpaLTrhZfWQJJQvoIDwE2x8RA3pGo5ho3Z7fKli9YagN98SuicFnPoS1HqA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (380, N'Dubois', N'Juanita', N'Juanita.Dubois93', N'ACkY/eF1vKOc1vD64Rl/kBZejEEXQphqFqwfTBDoSVFVb7eZaQdXbLlOtfQTbCkpRA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (381, N'Renaud', N'Laverne', N'Laverne_Renaud', N'AF+QaV43n6ZNfG4CiRTupk9VKxNOPA5m8vA1j/aPYwiM4KolCeXEWSoh0Qtxa2Zfcg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (382, N'Muller', N'Philip', N'Philip.Muller14', N'ADemubfHJMNwKzRQPjdloQcdSZug9H9jtdMtxgfHp5/BNRvTr2HkwxWKhRtLa5e1iQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (383, N'Denis', N'Billy', N'Billy.Denis86', N'AMVjnZCV5ZLIpQ+dvNpIHRofkfpjYff9Q5oPIEDPontUf3uJQz4jhcCcNucP3bS3wA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (384, N'Vasseur', N'Michelle', N'Michelle.Vasseur35', N'AG/ahpTxMmgowhKmqbtt1FbkamWrH4vHOoUAQa2j0isDc2B/hS4NEUF6eMOoLAM4XA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (385, N'Schneider', N'Abraham', N'Abraham.Schneider91', N'AC+55Zh4n80EqnCncHWgTHDn7Hrw/juzpYR5b6ASlUgdi5QMDdpQ0xUXzZJ2x29IGw==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (386, N'Petit', N'Kimberly', N'Kimberly.Petit4', N'AJr5SmDgAaliQg7JIKmX3LJNBVhyCtd5EXNlLnDV5WVwD0RgwvXmTFtnNJMdaKGpcA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (387, N'Laine', N'Claude', N'Claude9', N'ANAKfaVIvQHFkIh3t3Y5dw1X1aJ2ze810S84WT8tmWtakRWGBSuxf5XBlRcyVXpTaA==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (388, N'Leroy', N'Kristy', N'Kristy37', N'AOQBw14YYF8FLnf2eFtJqjOUPoxB+sKMVfmeuymuMAZ9ftdSOglA7NfZDPHoCuEJlg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (389, N'Lacroix', N'Sonya', N'Sonya85', N'APXGdCw3Xce95zKYi2MKo0s7vi5ReZmXGH+RnvgC64xpExrMEMJzr7wM5SYulgwuTg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (390, N'Remy', N'Shawn', N'Shawn.Remy23', N'AGDEt1aZp4/C28Lq8UQ1TxRakywO7Fy91sGpe9QMHlAqvP3NOv5atExbJgiNGXBl3g==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (391, N'Chevalier', N'Darrin', N'Darrin99', N'AMfyk8Cr+m7Fd/sI0RUlX2Xsbg9hDui4Nfw5O0+CNv5efm5fXoBPVSo0S+XjUh2BiQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
GO
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (392, N'Joly', N'Jenny', N'Jenny63', N'AD7tj+KioJss7/PrqvJJKZa9wGq50XDC2PUXX2UOEsK7XpQL9dGUUOeUnZieZ8nhNg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (393, N'Denis', N'Arlene', N'Arlene_Denis15', N'ADrJJgQM+A1tJEdGB2w/qHhC3nhlPNqrPg3hP5KCNaO6Xp8kU65YwsbUAgyLKKlVTQ==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Login], [Password], [Statut], [Solde], [IdSession]) VALUES (394, N'Laine', N'Saul', N'Saul_Laine', N'AGWCsFaO2NbF+za5wFO+MEAadD7zLF0E3rejtUNTDHxtVSJMjPvWbN3oFQoWe5wSNg==', 1, CAST(0.00 AS Decimal(10, 2)), NULL)
SET IDENTITY_INSERT [dbo].[Utilisateur] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Utilisateur]    Script Date: 11/03/2020 00:14:45 ******/
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
ALTER TABLE [dbo].[RoleUtilisateur]  WITH CHECK ADD  CONSTRAINT [FK_RoleUtilisateur_Role] FOREIGN KEY([IdRole])
REFERENCES [dbo].[Role] ([IdRole])
GO
ALTER TABLE [dbo].[RoleUtilisateur] CHECK CONSTRAINT [FK_RoleUtilisateur_Role]
GO
ALTER TABLE [dbo].[RoleUtilisateur]  WITH CHECK ADD  CONSTRAINT [FK_RoleUtilisateur_Utilisateur] FOREIGN KEY([IdUtilisateur])
REFERENCES [dbo].[Utilisateur] ([IdUtilisateur])
GO
ALTER TABLE [dbo].[RoleUtilisateur] CHECK CONSTRAINT [FK_RoleUtilisateur_Utilisateur]
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
