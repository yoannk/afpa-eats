USE [master]
GO
/****** Object:  Database [AfpEat]    Script Date: 05/03/2020 17:13:14 ******/
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
/****** Object:  Table [dbo].[Categorie]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[Commande]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[CommandeProduit]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[CommandeProduitMenu]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[CommandeProduitProduit]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[EtatCommande]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[MenuCategorie]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[Operation]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[Photo]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[Produit]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[ProduitCompose]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[ProduitPhoto]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[Restaurant]    Script Date: 05/03/2020 17:13:15 ******/
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
	[Login] [varchar](100) NOT NULL,
	[Password] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[IdRestaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantPhoto]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[SessionUtilisateur]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[TypeCuisine]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[TypeVersement]    Script Date: 05/03/2020 17:13:15 ******/
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
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 05/03/2020 17:13:15 ******/
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
	[IdSession] [varchar](100) NULL,
 CONSTRAINT [PK_Utilisateur] PRIMARY KEY CLUSTERED 
(
	[IdUtilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorie] ON 

INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (86, N'Entrée', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (87, N'Plat', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (88, N'Dessert', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (89, N'Salade', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (90, N'Boisson', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (91, N'Pâtes', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (92, N'Panini', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (93, N'Pizza', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (94, N'Sandwich', 1)
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[EtatCommande] ON 

INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (1, N'En Attente')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (2, N'En cours de préparation')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (3, N'En cours de livraison')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (4, N'Livré')
SET IDENTITY_INSERT [dbo].[EtatCommande] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([IdMenu], [Nom], [Statut], [Prix], [IdRestaurant], [IdPhoto]) VALUES (1, N'Menu Poke bowl signature & boisson', 1, CAST(12.90 AS Decimal(10, 2)), 306, 2206)
INSERT [dbo].[Menu] ([IdMenu], [Nom], [Statut], [Prix], [IdRestaurant], [IdPhoto]) VALUES (2, N'Menu Poke bowl signature, boisson & dessert', 1, CAST(15.90 AS Decimal(10, 2)), 306, 2207)
SET IDENTITY_INSERT [dbo].[Menu] OFF
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (1, 87)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (1, 90)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (2, 87)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (2, 88)
INSERT [dbo].[MenuCategorie] ([IdMenu], [IdCategorie]) VALUES (2, 90)
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1809, N'asiatique.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1810, N'boulangerie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1811, N'brasserie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1812, N'fastfood.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1813, N'francaise.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1814, N'indien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1815, N'libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1816, N'pizza.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1817, N'Pokawa.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1818, N'Sushi Shop.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1819, N'SHAKA Poke.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1820, N'La Mie Caline.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1821, N'Maison Kayser.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1822, N'Boulangerie Beaubourg.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1823, N'Pomme de Pain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1824, N'Boulangerie artisanale Zerzour.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1825, N'Shake it Easy.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1826, N'Cheezer.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1827, N'Nabab Kebab.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1828, N'Burger & Fries.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1829, N'Les Burgers de Papa.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1830, N'Mac Doner.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1831, N'Fermier Gourmet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1832, N'La cochonnaille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1833, N'Nos Grands-mères ont du Talent.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1834, N'Canard Street.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1835, N'Zoe Bouillon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1836, N'Kitchen Paris.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1837, N'Crêperie Galette Cafe.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1838, N'Bollynan.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1839, N'Aarapana restaurant.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1840, N'Safran.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1841, N'Eat & Cool.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1842, N'Taboulé Paris.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1843, N'Chez le Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1844, N'Le Cèdre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1845, N'Noura.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1846, N'Zaatar Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1847, N'Big Falafel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1848, N'Marché Libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1849, N'King Falafel Palace.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1850, N'O Beyrouth.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1851, N'Shawarma Lovers.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1852, N'Topoly.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1853, N'Five Pizza Original.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1854, N'5PIZZ.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1855, N'Chez Alfredo.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1856, N'Mulberry Street.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1857, N'Pizza La Fayette.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1858, N'Pizza Rustica.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1859, N'César Montorgueil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1860, N'Amala.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1861, N'Falstaff.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1862, N'Palazzo di Pasta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1863, N'Pizza Presto.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1864, N'Chez Aldo.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1865, N'Del Arte.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1866, N'Italian Trattoria.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1867, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1868, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1869, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1870, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1871, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1872, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1873, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1874, N'Chirashi Hawaïen.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1875, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1876, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1877, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1878, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1879, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1880, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1881, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1882, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1883, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1884, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1885, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1886, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1887, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1888, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1889, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1890, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1891, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1892, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1893, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1894, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1895, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1896, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1897, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1898, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1899, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1900, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1901, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1902, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1903, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1904, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1905, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1906, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1907, N'Chirashi Hawaïen.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1908, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1909, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1910, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1911, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1912, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1913, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1914, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1915, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1916, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1917, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1918, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1919, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1920, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1921, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1922, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1923, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1924, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1925, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1926, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1927, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1928, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1929, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1930, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1931, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1932, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1933, N'Avocado toast.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1934, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1935, N'Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1936, N'Salmon Love Avocado.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1937, N'Salade d''algues wakamé.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1938, N'Salade d''edamame.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1939, N'Soupawa Maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1940, N'Chirashi Hawaïen.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1941, N'Poké Super Protéine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1942, N'Poké Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1943, N'Poké Thon Rouge.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1944, N'Poké Crevettes.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1945, N'Poké Daurade Royale.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1946, N'Poké Poulet rôti teriyaki.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1947, N'Poké Falafels Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1948, N'Poké Tofu fumé Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1949, N'Cheesecake.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1950, N'Fondant au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1951, N'Pudding Coco aux Perles de Chia Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1952, N'Le Granola Bowl Mangue Bio.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1953, N'Excellente mangue fraîchement coupée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1954, N'Ananas plein de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1955, N'Cookie BIO Chocolat au Lait.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1956, N'Cookie BIO Caramel d''Isigny au Sel de Guérande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1957, N'Lemonaid Bio Citron Vert.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1958, N'Lemonaid Bio Fruit de La Passion.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1959, N'Lemonaid Bio Orange Sanguine.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1960, N'Thé glacé Wandertea Ice Fruits.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1961, N'Citronnade maison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1962, N'Evian.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1963, N'San Pellegrino.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1964, N'Coca-Cola.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1965, N'Coca-Cola zéro sucre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1966, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1967, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1968, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1969, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1970, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1971, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1972, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1973, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1974, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1975, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1976, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1977, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1978, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1979, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1980, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1981, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1982, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1983, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1984, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1985, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1986, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1987, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1988, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1989, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1990, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1991, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1992, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1993, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1994, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1995, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1996, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1997, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1998, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (1999, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2000, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2001, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2002, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2003, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2004, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2005, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2006, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2007, N'Tartelette poire amande.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2008, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2009, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2010, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2011, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2012, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2013, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2014, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2015, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2016, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2017, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2018, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2019, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2020, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2021, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2022, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2023, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2024, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2025, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2026, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2027, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2028, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2029, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2030, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2031, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2032, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2033, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2034, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2035, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2036, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2037, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2038, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2039, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2040, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2041, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2042, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2043, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2044, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2045, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2046, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2047, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2048, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2049, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2050, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2051, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2052, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2053, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2054, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2055, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2056, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2057, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2058, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2059, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2060, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2061, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2062, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2063, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2064, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2065, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2066, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2067, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2068, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2069, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2070, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2071, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2072, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2073, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2074, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2075, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2076, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2077, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2078, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2079, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2080, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2081, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2082, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2083, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2084, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2085, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2086, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2087, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2088, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2089, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2090, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2091, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2092, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2093, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2094, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2095, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2096, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2097, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2098, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2099, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2100, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2101, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2102, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2103, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2104, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2105, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2106, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2107, N'Éclair Praliné.jpg')
GO
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2108, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2109, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2110, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2111, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2112, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2113, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2114, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2115, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2116, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2117, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2118, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2119, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2120, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2121, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2122, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2123, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2124, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2125, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2126, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2127, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2128, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2129, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2130, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2131, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2132, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2133, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2134, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2135, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2136, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2137, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2138, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2139, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2140, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2141, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2142, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2143, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2144, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2145, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2146, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2147, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2148, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2149, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2150, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2151, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2152, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2153, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2154, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2155, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2156, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2157, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2158, N'Pizza aux chèvres.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2159, N'Pizza lardons champignons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2160, N'Salade Chic Saumon.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2161, N'Salade jambon Serrano , rigatori et féta.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2162, N'Salade poulet , trio de carottes et oeuf poché.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2163, N'Graine de chic poulet et pesto rosso.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2164, N'Graine de chic Guacamole et Galettes de légumes de Soleil.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2165, N'Dolce vita.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2166, N'Coppa Tomme de Brebis.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2167, N'Sandwich jambon beurre.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2168, N'Sandwich jambon emmental.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2169, N'Sandwich poulet sauce moutarde.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2170, N'Sandwich rosette cornichons.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2171, N'Ciabatta poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2172, N'Sandwich jambon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2173, N'Sandwich poulet complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2174, N'Sandwich thon complet.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2175, N'Moelleux poulet curry.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2176, N'Moelleux barbecue cheddar.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2177, N'Panini poulet Barbecue.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2178, N'Panini Savoyard.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2179, N'Panini Mexicain.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2180, N'Panini Italien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2181, N'Panini 3 fromages.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2182, N'Cookie Nutella.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2183, N'Super cookie pépites chocolat noir.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2184, N'Super cookie chocolat blanc.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2185, N'Super cookie 3 chocolats.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2186, N'Muffin chocolat caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2187, N'Donuts Chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2188, N'Tartelette citron.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2189, N'Tartelette citron meringuée.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2190, N'Tartelette pomme.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2191, N'Gâteau basque.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2192, N'Flan nature.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2193, N'Éclair chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2194, N'Éclair café.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2195, N'Éclair Vanille.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2196, N'Cheese cake cookies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2197, N'Macaron caramel.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2198, N'Macaron chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2199, N'Tartelette poire amande.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2200, N'Brownies.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2201, N'Framboisier.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2202, N'Cheese cake Spéculoos.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2203, N'Éclair Praliné.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2204, N'Moelleux au chocolat.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2205, N'Cup de fruits de saison.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2206, N'Menu Poke bowl signature & boisson')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (2207, N'Menu Poke bowl signature, boisson & dessert')
GO
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Produit] ON 

INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1436, 306, 86, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1437, 306, 86, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1438, 306, 86, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1439, 306, 86, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1440, 306, 86, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1441, 306, 86, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1442, 306, 86, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1443, 306, 87, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1444, 306, 87, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1445, 306, 87, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1446, 306, 87, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1447, 306, 87, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1448, 306, 87, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1449, 306, 87, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1450, 306, 87, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1451, 306, 87, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1452, 306, 88, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1453, 306, 88, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1454, 306, 88, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1455, 306, 88, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1456, 306, 88, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1457, 306, 88, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1458, 306, 88, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1459, 306, 88, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1460, 306, 90, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1461, 306, 90, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1462, 306, 90, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1463, 306, 90, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1464, 306, 90, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1465, 306, 90, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1466, 306, 90, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1467, 306, 90, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1468, 306, 90, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1469, 307, 86, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1470, 307, 86, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1471, 307, 86, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1472, 307, 86, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1473, 307, 86, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1474, 307, 86, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1475, 307, 86, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1476, 307, 87, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1477, 307, 87, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1478, 307, 87, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1479, 307, 87, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1480, 307, 87, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1481, 307, 87, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1482, 307, 87, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1483, 307, 87, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1484, 307, 87, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1485, 307, 88, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1486, 307, 88, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1487, 307, 88, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1488, 307, 88, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1489, 307, 88, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1490, 307, 88, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1491, 307, 88, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1492, 307, 88, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1493, 307, 90, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1494, 307, 90, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1495, 307, 90, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1496, 307, 90, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1497, 307, 90, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1498, 307, 90, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1499, 307, 90, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1500, 307, 90, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1501, 307, 90, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1502, 308, 86, N'Avocado toast', CAST(7.90 AS Decimal(10, 2)), N'Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1503, 308, 86, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1504, 308, 86, N'Falafels Bio', CAST(5.90 AS Decimal(10, 2)), N'Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1505, 308, 86, N'Salmon Love Avocado', CAST(4.90 AS Decimal(10, 2)), N'Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1506, 308, 86, N'Salade d''algues wakamé', CAST(4.90 AS Decimal(10, 2)), N'Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d''hiver.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1507, 308, 86, N'Salade d''edamame', CAST(3.90 AS Decimal(10, 2)), N'Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1508, 308, 86, N'Soupawa Maison', CAST(4.90 AS Decimal(10, 2)), N'Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1509, 308, 87, N'Chirashi Hawaïen', CAST(12.90 AS Decimal(10, 2)), N'Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1510, 308, 87, N'Poké Super Protéine', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1511, 308, 87, N'Poké Saumon', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, saumon d''Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1512, 308, 87, N'Poké Thon Rouge', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1513, 308, 87, N'Poké Crevettes', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1514, 308, 87, N'Poké Daurade Royale', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1515, 308, 87, N'Poké Poulet rôti teriyaki', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1516, 308, 87, N'Poké Falafels Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1517, 308, 87, N'Poké Tofu fumé Bio', CAST(10.90 AS Decimal(10, 2)), N'Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1518, 308, 88, N'Cheesecake', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1519, 308, 88, N'Fondant au chocolat', CAST(4.90 AS Decimal(10, 2)), N'Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1520, 308, 88, N'Pudding Coco aux Perles de Chia Bio', CAST(4.90 AS Decimal(10, 2)), N'Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1521, 308, 88, N'Le Granola Bowl Mangue Bio', CAST(4.90 AS Decimal(10, 2)), N'Fromage blanc allégé, mangue fraiche et muesli énergétique.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1522, 308, 88, N'Excellente mangue fraîchement coupée', CAST(4.90 AS Decimal(10, 2)), N'Salade de mangue faite avec amour.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1523, 308, 88, N'Ananas plein de Soleil', CAST(3.90 AS Decimal(10, 2)), N'Salade d''ananas fraîchement coupés et gorgée de soleil !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1524, 308, 88, N'Cookie BIO Chocolat au Lait', CAST(3.50 AS Decimal(10, 2)), N'Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1525, 308, 88, N'Cookie BIO Caramel d''Isigny au Sel de Guérande', CAST(3.50 AS Decimal(10, 2)), N'Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1526, 308, 90, N'Lemonaid Bio Citron Vert', CAST(3.90 AS Decimal(10, 2)), N'Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1527, 308, 90, N'Lemonaid Bio Fruit de La Passion', CAST(3.90 AS Decimal(10, 2)), N'Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1528, 308, 90, N'Lemonaid Bio Orange Sanguine', CAST(3.90 AS Decimal(10, 2)), N'Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1529, 308, 90, N'Thé glacé Wandertea Ice Fruits', CAST(3.90 AS Decimal(10, 2)), N'Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1530, 308, 90, N'Citronnade maison', CAST(3.90 AS Decimal(10, 2)), N'Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1531, 308, 90, N'Evian', CAST(2.90 AS Decimal(10, 2)), N'On vous a déjà dit qu''il fallait boire 2 litres d''eau par jours ? (50 cl)', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1532, 308, 90, N'San Pellegrino', CAST(2.90 AS Decimal(10, 2)), N'Une eau gazeuse à boire tous les jours, par tous. (50 cl)', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1533, 308, 90, N'Coca-Cola', CAST(2.90 AS Decimal(10, 2)), N'Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1534, 308, 90, N'Coca-Cola zéro sucre', CAST(2.90 AS Decimal(10, 2)), N'Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)', 30)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1535, 309, 93, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1536, 309, 93, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1537, 309, 89, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1538, 309, 89, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1539, 309, 89, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1540, 309, 94, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1541, 309, 94, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1542, 309, 94, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1543, 309, 94, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1544, 309, 94, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1545, 309, 94, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1546, 309, 94, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1547, 309, 94, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1548, 309, 94, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1549, 309, 94, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1550, 309, 94, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1551, 309, 94, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1552, 309, 94, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1553, 309, 94, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1554, 309, 92, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1555, 309, 92, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1556, 309, 92, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1557, 309, 92, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1558, 309, 92, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1559, 309, 88, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1560, 309, 88, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1561, 309, 88, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1562, 309, 88, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1563, 309, 88, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1564, 309, 88, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1565, 309, 88, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1566, 309, 88, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1567, 309, 88, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1568, 309, 88, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1569, 309, 88, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1570, 309, 88, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1571, 309, 88, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1572, 309, 88, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1573, 309, 88, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1574, 309, 88, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1575, 309, 88, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1576, 309, 88, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1577, 309, 88, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1578, 309, 88, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1579, 309, 88, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1580, 309, 88, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1581, 309, 88, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1582, 309, 88, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1583, 310, 93, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1584, 310, 93, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1585, 310, 89, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1586, 310, 89, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1587, 310, 89, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1588, 310, 94, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1589, 310, 94, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1590, 310, 94, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1591, 310, 94, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1592, 310, 94, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1593, 310, 94, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1594, 310, 94, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1595, 310, 94, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1596, 310, 94, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1597, 310, 94, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1598, 310, 94, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1599, 310, 94, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1600, 310, 94, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1601, 310, 94, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1602, 310, 92, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1603, 310, 92, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1604, 310, 92, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1605, 310, 92, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1606, 310, 92, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1607, 310, 88, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1608, 310, 88, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1609, 310, 88, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1610, 310, 88, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1611, 310, 88, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1612, 310, 88, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1613, 310, 88, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1614, 310, 88, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1615, 310, 88, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1616, 310, 88, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1617, 310, 88, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1618, 310, 88, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1619, 310, 88, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1620, 310, 88, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1621, 310, 88, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1622, 310, 88, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1623, 310, 88, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1624, 310, 88, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1625, 310, 88, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1626, 310, 88, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1627, 310, 88, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1628, 310, 88, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1629, 310, 88, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1630, 310, 88, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1631, 311, 93, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1632, 311, 93, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1633, 311, 89, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1634, 311, 89, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 25)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1635, 311, 89, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1636, 311, 94, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1637, 311, 94, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1638, 311, 94, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1639, 311, 94, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1640, 311, 94, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1641, 311, 94, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1642, 311, 94, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1643, 311, 94, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1644, 311, 94, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1645, 311, 94, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1646, 311, 94, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1647, 311, 94, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1648, 311, 94, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1649, 311, 94, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1650, 311, 92, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1651, 311, 92, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1652, 311, 92, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1653, 311, 92, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1654, 311, 92, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1655, 311, 88, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1656, 311, 88, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1657, 311, 88, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1658, 311, 88, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1659, 311, 88, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1660, 311, 88, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1661, 311, 88, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1662, 311, 88, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1663, 311, 88, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1664, 311, 88, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1665, 311, 88, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1666, 311, 88, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1667, 311, 88, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1668, 311, 88, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1669, 311, 88, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1670, 311, 88, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1671, 311, 88, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1672, 311, 88, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1673, 311, 88, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1674, 311, 88, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1675, 311, 88, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1676, 311, 88, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1677, 311, 88, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1678, 311, 88, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1679, 312, 93, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1680, 312, 93, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1681, 312, 89, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1682, 312, 89, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1683, 312, 89, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1684, 312, 94, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1685, 312, 94, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1686, 312, 94, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1687, 312, 94, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1688, 312, 94, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1689, 312, 94, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1690, 312, 94, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1691, 312, 94, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1692, 312, 94, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1693, 312, 94, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1694, 312, 94, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1695, 312, 94, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1696, 312, 94, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1697, 312, 94, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1698, 312, 92, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1699, 312, 92, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1700, 312, 92, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1701, 312, 92, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1702, 312, 92, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1703, 312, 88, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1704, 312, 88, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1705, 312, 88, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1706, 312, 88, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1707, 312, 88, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1708, 312, 88, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1709, 312, 88, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1710, 312, 88, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1711, 312, 88, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1712, 312, 88, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1713, 312, 88, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1714, 312, 88, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1715, 312, 88, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1716, 312, 88, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1717, 312, 88, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1718, 312, 88, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1719, 312, 88, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1720, 312, 88, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1721, 312, 88, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1722, 312, 88, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1723, 312, 88, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1724, 312, 88, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1725, 312, 88, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1726, 312, 88, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1727, 313, 93, N'Pizza aux chèvres', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, mozzarella et chèvre.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1728, 313, 93, N'Pizza lardons champignons', CAST(5.20 AS Decimal(10, 2)), N'Coulis de tomate, lardons et champignons.', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1729, 313, 89, N'Salade Chic Saumon', CAST(8.70 AS Decimal(10, 2)), N'Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1730, 313, 89, N'Salade jambon Serrano , rigatori et féta', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1731, 313, 89, N'Salade poulet , trio de carottes et oeuf poché', CAST(8.70 AS Decimal(10, 2)), N'Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1732, 313, 94, N'Graine de chic poulet et pesto rosso', CAST(8.70 AS Decimal(10, 2)), N'pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1733, 313, 94, N'Graine de chic Guacamole et Galettes de légumes de Soleil', CAST(8.70 AS Decimal(10, 2)), N'Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1734, 313, 94, N'Dolce vita', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.', 25)
GO
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1735, 313, 94, N'Coppa Tomme de Brebis', CAST(8.70 AS Decimal(10, 2)), N'Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1736, 313, 94, N'Sandwich jambon beurre', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc et beurre léger.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1737, 313, 94, N'Sandwich jambon emmental', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, emmental et beurre léger.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1738, 313, 94, N'Sandwich poulet sauce moutarde', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l''ancienne et salade.', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1739, 313, 94, N'Sandwich rosette cornichons', CAST(5.05 AS Decimal(10, 2)), N'Déjeunette baguette, beurre léger, rosette et cornichons.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1740, 313, 94, N'Ciabatta poulet curry', CAST(5.05 AS Decimal(10, 2)), N'Pain ciabatta, émincés de poulet, tomate et sauce curry.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1741, 313, 94, N'Sandwich jambon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1742, 313, 94, N'Sandwich poulet complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1743, 313, 94, N'Sandwich thon complet', CAST(6.50 AS Decimal(10, 2)), N'Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1744, 313, 94, N'Moelleux poulet curry', CAST(6.30 AS Decimal(10, 2)), N'Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1745, 313, 94, N'Moelleux barbecue cheddar', CAST(6.30 AS Decimal(10, 2)), N'Une déjeunette pain de mie moelleuse garnie d''un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d''une sauce barbecue, le tout recouvert de cheddar.', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1746, 313, 92, N'Panini poulet Barbecue', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1747, 313, 92, N'Panini Savoyard', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, fromage à raclette et jambon blanc fumé.', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1748, 313, 92, N'Panini Mexicain', CAST(6.50 AS Decimal(10, 2)), N'Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1749, 313, 92, N'Panini Italien', CAST(6.50 AS Decimal(10, 2)), N'Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1750, 313, 92, N'Panini 3 fromages', CAST(6.50 AS Decimal(10, 2)), N'Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1751, 313, 88, N'Cookie Nutella', CAST(2.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1752, 313, 88, N'Super cookie pépites chocolat noir', CAST(2.80 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1753, 313, 88, N'Super cookie chocolat blanc', CAST(2.80 AS Decimal(10, 2)), N'', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1754, 313, 88, N'Super cookie 3 chocolats', CAST(2.80 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1755, 313, 88, N'Muffin chocolat caramel', CAST(3.00 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1756, 313, 88, N'Donuts Chocolat', CAST(2.30 AS Decimal(10, 2)), N'', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1757, 313, 88, N'Tartelette citron', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1758, 313, 88, N'Tartelette citron meringuée', CAST(3.70 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1759, 313, 88, N'Tartelette pomme', CAST(3.70 AS Decimal(10, 2)), N'', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1760, 313, 88, N'Gâteau basque', CAST(3.50 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1761, 313, 88, N'Flan nature', CAST(3.00 AS Decimal(10, 2)), N'', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1762, 313, 88, N'Éclair chocolat', CAST(3.40 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1763, 313, 88, N'Éclair café', CAST(3.40 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1764, 313, 88, N'Éclair Vanille', CAST(3.40 AS Decimal(10, 2)), N'', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1765, 313, 88, N'Cheese cake cookies', CAST(3.70 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1766, 313, 88, N'Macaron caramel', CAST(3.80 AS Decimal(10, 2)), N'', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1767, 313, 88, N'Macaron chocolat', CAST(3.80 AS Decimal(10, 2)), N'', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1768, 313, 88, N'Tartelette poire amande', CAST(3.70 AS Decimal(10, 2)), N'', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1769, 313, 88, N'Brownies', CAST(2.80 AS Decimal(10, 2)), N'', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1770, 313, 88, N'Framboisier', CAST(3.80 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1771, 313, 88, N'Cheese cake Spéculoos', CAST(3.70 AS Decimal(10, 2)), N'', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1772, 313, 88, N'Éclair Praliné', CAST(3.70 AS Decimal(10, 2)), N'Une pâte à choux garnie d''une onctueuse mousse pralinée, recouverte d''un glaçage et d''éclats de noisettes caramélisées.', 5)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1773, 313, 88, N'Moelleux au chocolat', CAST(3.40 AS Decimal(10, 2)), N'Un moelleux au chocolat composé d''oeufs, chocolat noir, beurre, sucre, farine, et c''est tout! A déguster chaud.', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (1774, 313, 88, N'Cup de fruits de saison', CAST(3.80 AS Decimal(10, 2)), N'Fruits selon la saison', 25)
SET IDENTITY_INSERT [dbo].[Produit] OFF
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1436, 1867)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1437, 1868)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1438, 1869)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1439, 1870)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1440, 1871)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1441, 1872)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1442, 1873)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1443, 1874)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1444, 1875)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1445, 1876)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1446, 1877)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1447, 1878)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1448, 1879)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1449, 1880)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1450, 1881)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1451, 1882)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1452, 1883)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1453, 1884)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1454, 1885)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1455, 1886)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1456, 1887)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1457, 1888)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1458, 1889)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1459, 1890)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1460, 1891)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1461, 1892)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1462, 1893)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1463, 1894)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1464, 1895)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1465, 1896)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1466, 1897)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1467, 1898)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1468, 1899)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1469, 1900)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1470, 1901)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1471, 1902)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1472, 1903)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1473, 1904)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1474, 1905)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1475, 1906)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1476, 1907)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1477, 1908)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1478, 1909)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1479, 1910)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1480, 1911)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1481, 1912)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1482, 1913)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1483, 1914)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1484, 1915)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1485, 1916)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1486, 1917)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1487, 1918)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1488, 1919)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1489, 1920)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1490, 1921)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1491, 1922)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1492, 1923)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1493, 1924)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1494, 1925)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1495, 1926)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1496, 1927)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1497, 1928)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1498, 1929)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1499, 1930)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1500, 1931)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1501, 1932)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1502, 1933)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1503, 1934)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1504, 1935)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1505, 1936)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1506, 1937)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1507, 1938)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1508, 1939)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1509, 1940)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1510, 1941)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1511, 1942)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1512, 1943)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1513, 1944)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1514, 1945)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1515, 1946)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1516, 1947)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1517, 1948)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1518, 1949)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1519, 1950)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1520, 1951)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1521, 1952)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1522, 1953)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1523, 1954)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1524, 1955)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1525, 1956)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1526, 1957)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1527, 1958)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1528, 1959)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1529, 1960)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1530, 1961)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1531, 1962)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1532, 1963)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1533, 1964)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1534, 1965)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1535, 1966)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1536, 1967)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1537, 1968)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1538, 1969)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1539, 1970)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1540, 1971)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1541, 1972)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1542, 1973)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1543, 1974)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1544, 1975)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1545, 1976)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1546, 1977)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1547, 1978)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1548, 1979)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1549, 1980)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1550, 1981)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1551, 1982)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1552, 1983)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1553, 1984)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1554, 1985)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1555, 1986)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1556, 1987)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1557, 1988)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1558, 1989)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1559, 1990)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1560, 1991)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1561, 1992)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1562, 1993)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1563, 1994)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1564, 1995)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1565, 1996)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1566, 1997)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1567, 1998)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1568, 1999)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1569, 2000)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1570, 2001)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1571, 2002)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1572, 2003)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1573, 2004)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1574, 2005)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1575, 2006)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1576, 2007)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1577, 2008)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1578, 2009)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1579, 2010)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1580, 2011)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1581, 2012)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1582, 2013)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1583, 2014)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1584, 2015)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1585, 2016)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1586, 2017)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1587, 2018)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1588, 2019)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1589, 2020)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1590, 2021)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1591, 2022)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1592, 2023)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1593, 2024)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1594, 2025)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1595, 2026)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1596, 2027)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1597, 2028)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1598, 2029)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1599, 2030)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1600, 2031)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1601, 2032)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1602, 2033)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1603, 2034)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1604, 2035)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1605, 2036)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1606, 2037)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1607, 2038)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1608, 2039)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1609, 2040)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1610, 2041)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1611, 2042)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1612, 2043)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1613, 2044)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1614, 2045)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1615, 2046)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1616, 2047)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1617, 2048)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1618, 2049)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1619, 2050)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1620, 2051)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1621, 2052)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1622, 2053)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1623, 2054)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1624, 2055)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1625, 2056)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1626, 2057)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1627, 2058)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1628, 2059)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1629, 2060)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1630, 2061)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1631, 2062)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1632, 2063)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1633, 2064)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1634, 2065)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1635, 2066)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1636, 2067)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1637, 2068)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1638, 2069)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1639, 2070)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1640, 2071)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1641, 2072)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1642, 2073)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1643, 2074)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1644, 2075)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1645, 2076)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1646, 2077)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1647, 2078)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1648, 2079)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1649, 2080)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1650, 2081)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1651, 2082)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1652, 2083)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1653, 2084)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1654, 2085)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1655, 2086)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1656, 2087)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1657, 2088)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1658, 2089)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1659, 2090)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1660, 2091)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1661, 2092)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1662, 2093)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1663, 2094)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1664, 2095)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1665, 2096)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1666, 2097)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1667, 2098)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1668, 2099)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1669, 2100)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1670, 2101)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1671, 2102)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1672, 2103)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1673, 2104)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1674, 2105)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1675, 2106)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1676, 2107)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1677, 2108)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1678, 2109)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1679, 2110)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1680, 2111)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1681, 2112)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1682, 2113)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1683, 2114)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1684, 2115)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1685, 2116)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1686, 2117)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1687, 2118)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1688, 2119)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1689, 2120)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1690, 2121)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1691, 2122)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1692, 2123)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1693, 2124)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1694, 2125)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1695, 2126)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1696, 2127)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1697, 2128)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1698, 2129)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1699, 2130)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1700, 2131)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1701, 2132)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1702, 2133)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1703, 2134)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1704, 2135)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1705, 2136)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1706, 2137)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1707, 2138)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1708, 2139)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1709, 2140)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1710, 2141)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1711, 2142)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1712, 2143)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1713, 2144)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1714, 2145)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1715, 2146)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1716, 2147)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1717, 2148)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1718, 2149)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1719, 2150)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1720, 2151)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1721, 2152)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1722, 2153)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1723, 2154)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1724, 2155)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1725, 2156)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1726, 2157)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1727, 2158)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1728, 2159)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1729, 2160)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1730, 2161)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1731, 2162)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1732, 2163)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1733, 2164)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1734, 2165)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1735, 2166)
GO
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1736, 2167)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1737, 2168)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1738, 2169)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1739, 2170)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1740, 2171)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1741, 2172)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1742, 2173)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1743, 2174)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1744, 2175)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1745, 2176)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1746, 2177)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1747, 2178)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1748, 2179)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1749, 2180)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1750, 2181)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1751, 2182)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1752, 2183)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1753, 2184)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1754, 2185)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1755, 2186)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1756, 2187)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1757, 2188)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1758, 2189)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1759, 2190)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1760, 2191)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1761, 2192)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1762, 2193)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1763, 2194)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1764, 2195)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1765, 2196)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1766, 2197)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1767, 2198)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1768, 2199)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1769, 2200)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1770, 2201)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1771, 2202)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1772, 2203)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1773, 2204)
INSERT [dbo].[ProduitPhoto] ([IdProduit], [IdPhoto]) VALUES (1774, 2205)
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (306, N'Pokawa', N'pokawa', 185, N'Sint necessitatibus deserunt dicta. Cumque dolores saepe. Nesciunt qui aut. Voluptatibus in dolorem.', CAST(3.00 AS Decimal(10, 2)), N'13 Impasse de Montmorency', N'0176227610', N'0661586640', N'Dianna_Brun@hotmail.fr', N'48182', N'Troyes', N'Dianna_Brun55', N'Unhj0plyVr')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (307, N'Sushi Shop', N'sushi-shop', 185, N'At odio aliquid in et dolores ut neque sed quaerat. Quisquam vero in consequatur impedit sint provident eaque repudiandae. Quod sit similique veritatis numquam odio qui. Incidunt fugiat quis et vitae recusandae aut totam sit.', CAST(15.00 AS Decimal(10, 2)), N'2 Voie des Saussaies', N'0113314421', N'0685977352', N'Allen.Roche@yahoo.fr', N'84766', N'Beauvais', N'Allen37', N'HjWSEtHUi7')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (308, N'SHAKA Poke', N'shaka-poke', 185, N'Voluptatum iste numquam modi facere porro nostrum enim mollitia. Enim impedit ex minus. Est ut sed perspiciatis. Nostrum est perferendis sit at et quas velit debitis. Ipsam dignissimos eum in consequatur consequuntur et tenetur. Enim id eius ut praesentium tempora et consequuntur.', CAST(10.00 AS Decimal(10, 2)), N'298 Impasse de Vaugirard', N'0147405257', N'0650312849', N'Mae.Jacquet@yahoo.fr', N'14905', N'Fort-de-France', N'Mae.Jacquet', N'unzezpNTzO')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (309, N'La Mie Câline', N'la-mie-caline', 186, N'Ab rerum velit est et. Aut voluptate asperiores est cupiditate ut hic. Doloribus quos non non dignissimos voluptas beatae iure recusandae. Eos et vitae maiores dolor. Maiores occaecati quod.', CAST(6.00 AS Decimal(10, 2)), N'314 Boulevard de la Chaussée-d''Antin', N'0122805316', N'0648803417', N'Jennifer86@hotmail.fr', N'76910', N'Perpignan', N'Jennifer26', N'77cTM5xRPh')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (310, N'Maison Kayser', N'maison-kayser', 186, N'Dolore fugiat itaque itaque dolores vitae itaque ea rerum quas. Molestiae tempore consequatur non sequi quia. Iusto dolor eum voluptates veritatis. Officiis illo aut. Maiores quas corporis sed quae accusantium dolor.', CAST(7.00 AS Decimal(10, 2)), N'528 Voie Molière', N'0127999372', N'0606186452', N'Tamara.Boyer39@yahoo.fr', N'70087', N'Dunkerque14', N'Tamara19', N'YJhx2CD3xs')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (311, N'Boulangerie Beaubourg', N'boulangerie-beaubourg', 186, N'Nisi minima occaecati qui in nobis nam velit. At accusamus quas quia ut ut quae itaque incidunt. Quam enim eligendi tempore in eveniet harum mollitia minima. A vero aut totam.', CAST(13.00 AS Decimal(10, 2)), N'75 Passage Saint-Jacques', N'0134032452', N'0630038807', N'Paula43@yahoo.fr', N'50811', N'Aulnay-sous-Bois', N'Paula.Jacquet42', N'Jw3qJYnyD1')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (312, N'Pomme de Pain', N'pomme-de-pain', 186, N'Consectetur impedit vel inventore accusamus. Odit nisi et eos sunt nobis. Assumenda a maiores unde doloribus ipsam ut hic at voluptas.', CAST(11.00 AS Decimal(10, 2)), N'8 Avenue de Presbourg', N'0100694802', N'0600930048', N'Jaime.Berger59@gmail.com', N'40323', N'Nancy', N'Jaime49', N'LLVg7u1L9J')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (313, N'Boulangerie artisanale Zerzour', N'boulangerie-artisanale-zerzour', 186, N'Quibusdam eveniet hic possimus et ullam. Ad rerum omnis sed temporibus corrupti ut quaerat. Adipisci quidem officia et. Voluptates recusandae saepe nam reiciendis.', CAST(4.00 AS Decimal(10, 2)), N'9714 Avenue du Chat-qui-Pêche', N'0111685984', N'0676656985', N'Kate.Renault83@hotmail.fr', N'43960', N'Limoges', N'Kate.Renault', N'hzeJc_Btn3')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (314, N'Shake it Easy', N'shake-it-easy', 187, N'Ratione doloremque aut. Velit eum nisi est ut maiores et atque nam. Saepe aliquid reiciendis perferendis cumque ex modi iusto at officia. Voluptatem labore quasi consequatur voluptatum ea in aut labore.', CAST(9.00 AS Decimal(10, 2)), N'5855 Quai Saint-Honoré', N'0140170055', N'0611866541', N'Denise.Martin56@yahoo.fr', N'99842', N'Colmar', N'Denise_Martin81', N'Wtc04wxW9N')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (315, N'Cheezer', N'cheezer', 188, N'Aut et quia sequi quia. Perspiciatis beatae perspiciatis sed. Excepturi quas minima voluptatum nulla minus dolorem. Provident voluptas ad nostrum laudantium. Ea sint magni sequi earum quo aperiam nemo iusto voluptate. Est hic tempora.', CAST(14.00 AS Decimal(10, 2)), N'2 Avenue Saint-Denis', N'0181705836', N'0633123407', N'Donna_Blanchard@yahoo.fr', N'15042', N'Roubaix', N'Donna.Blanchard', N'P0wGwYQ3sM')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (316, N'Nabab Kebab', N'nabab-kebab', 188, N'Voluptatibus illo consequatur harum. Amet necessitatibus ut dignissimos rerum corrupti est similique sapiente in. Sit id dicta provident ducimus non. Qui odio similique et qui. Ipsa ratione nemo fuga sed.', CAST(14.00 AS Decimal(10, 2)), N'2 Quai Molière', N'0113795988', N'0685046535', N'Lowell.Laine@gmail.com', N'33978', N'Ajaccio', N'Lowell_Laine', N'7gie2AgFf1')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (317, N'Burger & Fries', N'burger-fries', 188, N'Repellat tenetur sit sint qui. Enim nobis recusandae ut. In placeat cum laudantium maxime autem fuga corporis non. Cumque sit ut eligendi ea amet sunt. Occaecati iure quaerat nemo eos omnis sit et amet ut.', CAST(10.00 AS Decimal(10, 2)), N'6228 Allée de Nesle', N'0125493444', N'0662518762', N'Steven.Garcia54@yahoo.fr', N'13751', N'Aulnay-sous-Bois', N'Steven.Garcia', N'i5f5iGRYO2')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (318, N'Les Burgers de Papa', N'les-burgers-de-papa', 188, N'Tempora eveniet modi et consequatur. Corporis debitis ut beatae. Consequatur recusandae et error vel perspiciatis. Velit eveniet aut doloribus optio ad tempora fuga laborum minima. Nulla qui esse provident et quia qui voluptas. Sed et non excepturi quasi quisquam.', CAST(13.00 AS Decimal(10, 2)), N'97 Passage d''Argenteuil', N'0181817926', N'0695229475', N'Loren.Olivier@gmail.com', N'05053', N'Caen', N'Loren23', N'2AMOPfRcaw')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (319, N'Mac Doner', N'mac-doner', 188, N'Et dicta quibusdam molestias repellendus et veritatis. Voluptate minima est in qui blanditiis doloremque dolor occaecati quia. Nulla occaecati iure. Explicabo nobis magnam provident porro ut. Dolor labore in et rerum. Atque quaerat beatae esse odit at repudiandae quidem nulla eaque.', CAST(12.00 AS Decimal(10, 2)), N'185 Rue de la Huchette', N'0110051800', N'0646785237', N'Terry_Roy50@gmail.com', N'78218', N'Nanterre', N'Terry_Roy', N'OM0ima87af')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (320, N'Fermier Gourmet', N'fermier-gourmet', 189, N'Perspiciatis aut ut cum rerum rerum repellendus similique. Est dolorem molestias cum sed consequatur fugit exercitationem ut sit. Provident tempora veritatis animi blanditiis. Quaerat perferendis impedit temporibus ab. Et incidunt harum aliquid debitis quaerat. Similique in dignissimos rerum.', CAST(3.00 AS Decimal(10, 2)), N'9 Avenue Saint-Séverin', N'0178298125', N'0655139923', N'Nellie_Fleury@yahoo.fr', N'98410', N'Angers', N'Nellie64', N'hq1BJV6hpu')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (321, N'La cochonnaille', N'la-cochonnaille', 189, N'Cum natus et ad sit doloribus nobis. Illo veritatis quia maiores. In eveniet odio et libero. Corporis quasi incidunt. Provident vel vitae aut mollitia quaerat consectetur repellat molestias.', CAST(10.00 AS Decimal(10, 2)), N'2 Voie de Solférino', N'0151470265', N'0640413963', N'Michelle_Gerard@yahoo.fr', N'32526', N'Clichy', N'Michelle57', N'Ug13JIbuxq')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (322, N'Nos Grands-mères ont du Talent', N'nos-grands-meres-ont-du-talent', 189, N'Numquam quis ab est quidem facilis. Aliquam sunt pariatur velit neque. Dicta rerum asperiores non dicta eius nulla sed odit officia. Tempora qui molestias dolores magnam quas repudiandae dolorum sit.', CAST(13.00 AS Decimal(10, 2)), N'313 Passage Saint-Honoré', N'0111946350', N'0668263199', N'Nick.Roy@hotmail.fr', N'91298', N'Brest', N'Nick.Roy41', N'tW_Ib1O1lW')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (323, N'Canard Street', N'canard-street', 189, N'Enim cum aut est dolorum ut animi molestiae dolore. Et ipsa est natus maiores. Minus vero aut quibusdam aut voluptas.', CAST(9.00 AS Decimal(10, 2)), N'4 Boulevard Adolphe Mille', N'0112162341', N'0603343030', N'Violet46@hotmail.fr', N'09762', N'Villeurbanne', N'Violet95', N'J_TwV999gb')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (324, N'Zoe Bouillon', N'zoe-bouillon', 189, N'Doloribus et amet et culpa nemo sint enim ea officia. Dignissimos sed assumenda voluptatum minus. Similique molestiae maiores odio aut est aut. Sequi occaecati aut. Ullam iste quia qui sit ea consequatur aut omnis. Et quibusdam cum quis ut delectus nemo tempore et doloribus.', CAST(10.00 AS Decimal(10, 2)), N'0 Voie du Bac', N'0119294803', N'0684774000', N'Tracy_Fleury@yahoo.fr', N'65139', N'Montreuil', N'Tracy.Fleury', N'3BxoZU2hnC')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (325, N'Kitchen Paris', N'kitchen-paris', 189, N'Dolor ut quod aut est non dolores. Nisi ea quis sed laudantium qui debitis consequatur sunt. Consectetur necessitatibus nostrum et. Eos sequi voluptate eos dolor velit adipisci adipisci nobis aut. Qui facilis quis earum ut sapiente.', CAST(13.00 AS Decimal(10, 2)), N'326 Impasse de Presbourg', N'0110571306', N'0615296339', N'Latoya.Blanchard@gmail.com', N'98839', N'Calais', N'Latoya_Blanchard17', N'sq6kE3a6Iz')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (326, N'Crêperie Galette Cafe', N'creperie-galette-cafe', 189, N'Sapiente inventore mollitia quam nulla odit consequatur. Est reprehenderit neque. Voluptas similique dicta fugiat sit ducimus quaerat cumque. Repellendus quas quisquam et esse. Ipsum ex ut. Aut est ex autem et alias quisquam.', CAST(13.00 AS Decimal(10, 2)), N'03 Avenue du Bac', N'0137752647', N'0678887222', N'Patrick12@gmail.com', N'51647', N'Cergy', N'Patrick.Mercier8', N'0TriHo_qvF')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (327, N'Bollynan', N'bollynan', 190, N'Nisi voluptatem est sapiente commodi assumenda illum autem. Vel placeat reiciendis sint consectetur nobis quis voluptatem. Et placeat autem autem laborum. Laudantium ut veritatis quia soluta quia doloribus.', CAST(10.00 AS Decimal(10, 2)), N'9144 Avenue du Faubourg-Saint-Denis', N'0193177341', N'0659930561', N'Erik.Marchal22@hotmail.fr', N'33793', N'Paris', N'Erik66', N'FBgcOEbNQD')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (328, N'Aarapana restaurant', N'aarapana-restaurant', 190, N'Et in expedita modi quibusdam eos voluptates sint. Similique tempora similique aperiam nostrum quidem odio repudiandae soluta. Quas aliquid repellendus explicabo rerum architecto. Est alias voluptatem maiores facilis odio ab qui. Iusto at sed iure dolorum et in. Magni ipsum nisi quos neque.', CAST(15.00 AS Decimal(10, 2)), N'8 Allée Pastourelle', N'0111112363', N'0671129589', N'Edmond_Garnier5@yahoo.fr', N'41484', N'Villejuif', N'Edmond92', N'jPg3WcmXiI')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (329, N'Safran', N'safran', 190, N'Et non facere reprehenderit ut consequatur eaque. Soluta esse dolorum voluptatibus. At est repellendus. Quidem ea error explicabo.', CAST(10.00 AS Decimal(10, 2)), N'754 Voie Laffitte', N'0157902570', N'0678807255', N'Roxanne84@gmail.com', N'94989', N'Asnières-sur-Seine', N'Roxanne44', N'PvhbcVmOa0')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (330, N'Eat & Cool', N'eat-cool', 190, N'Rerum voluptas sunt iste necessitatibus sed vitae fugit. Praesentium sit beatae dignissimos voluptatum. Aperiam minus debitis. Fugit iure error perspiciatis officia laborum odio.', CAST(6.00 AS Decimal(10, 2)), N'38 Boulevard Saint-Bernard', N'0151709062', N'0663389941', N'Allen40@yahoo.fr', N'48719', N'Saint-Paul', N'Allen_Dubois', N'FW6d2DLD4O')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (331, N'Taboulé Paris', N'taboule-paris', 191, N'Magnam voluptate dolor reiciendis adipisci. Et enim esse voluptatem consequuntur fugiat quasi. Provident at eum maxime sit sint quo. Asperiores quod totam et necessitatibus iste cum recusandae.', CAST(14.00 AS Decimal(10, 2)), N'3947 Avenue de la Victoire', N'0133016154', N'0648602568', N'Arlene.Breton@yahoo.fr', N'56949', N'Dunkerque14', N'Arlene_Breton', N'LB49uXRGIP')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (332, N'Chez le Libanais', N'chez-le-libanais', 191, N'Ut dolorem in minus. Aspernatur natus assumenda libero rerum quibusdam. Et earum quia explicabo quibusdam ut deserunt eligendi.', CAST(7.00 AS Decimal(10, 2)), N'4346 Place Pastourelle', N'0179762097', N'0655346889', N'Cora.Garcia1@yahoo.fr', N'96180', N'Ajaccio', N'Cora.Garcia', N'1kWE8BChu_')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (333, N'Le Cèdre', N'le-cedre', 191, N'Nostrum velit quidem sed omnis labore rerum perspiciatis. Ipsum nemo aut ut non iste veniam enim. Iusto id a atque eos quam.', CAST(12.00 AS Decimal(10, 2)), N'339 Place du Havre', N'0172133045', N'0633458046', N'Armando16@hotmail.fr', N'97651', N'La Rochelle', N'Armando23', N'XKzhaYmPmd')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (334, N'Noura', N'noura', 191, N'Dicta error esse perspiciatis quibusdam consequuntur iure aut distinctio. Ad asperiores nobis non. Et vel sed ab et earum. Minus et minus ut quasi at.', CAST(4.00 AS Decimal(10, 2)), N'57 Avenue de Caumartin', N'0148927079', N'0656802179', N'Rhonda.Faure37@hotmail.fr', N'30494', N'Vitry-sur-Seine', N'Rhonda_Faure', N'c6VQb6Hoao')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (335, N'Zaatar Libanais', N'zaatar-libanais', 191, N'Quod temporibus error error velit ut sint illum nam. Veritatis et cum est neque facere quis suscipit quis. Libero nostrum accusantium impedit placeat. Est rerum eos quidem minima temporibus.', CAST(15.00 AS Decimal(10, 2)), N'8756 Boulevard de la Harpe', N'0116952353', N'0659123246', N'Nichole37@hotmail.fr', N'18548', N'Chambéry', N'Nichole53', N'5mJhqmh8X9')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (336, N'Big Falafel', N'big-falafel', 191, N'Sed et ut nostrum et deserunt. Explicabo molestias optio dignissimos odio et ullam quos consequatur non. Sed autem autem sit ea eum et.', CAST(14.00 AS Decimal(10, 2)), N'4 Voie de Provence', N'0190230023', N'0668963043', N'Willard73@gmail.com', N'98634', N'Les Abymes', N'Willard20', N'zqilcWNokZ')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (337, N'Marché Libanais', N'marche-libanais', 191, N'Fugit fugit distinctio aut. Iure enim asperiores cumque vel totam nemo. Adipisci sint sunt officia. Doloremque id recusandae corporis sit quisquam. Sit adipisci laborum est excepturi soluta quam voluptatibus similique. Ipsa fuga dolorem incidunt ab.', CAST(6.00 AS Decimal(10, 2)), N'5842 Allée Delesseux', N'0150880783', N'0603152287', N'Orlando_Guillot18@yahoo.fr', N'27465', N'Avignon', N'Orlando_Guillot', N'y62b1bZpLL')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (338, N'King Falafel Palace', N'king-falafel-palace', 191, N'Numquam repellendus dolores laboriosam quia. Dolorem commodi ut ipsa perferendis ea quia exercitationem aut. Tempore nisi consequatur provident. Delectus animi totam sit asperiores fugit mollitia qui consequatur expedita.', CAST(5.00 AS Decimal(10, 2)), N'8 Quai Dauphine', N'0186774549', N'0662904551', N'Vincent_Barre@gmail.com', N'85785', N'Niort', N'Vincent.Barre', N'RtKmSeA71d')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (339, N'O Beyrouth', N'o-beyrouth', 191, N'Tempore temporibus et est quibusdam perspiciatis magni voluptate quis. Omnis quaerat eveniet fuga. Autem dicta quam et quis quas perspiciatis sit rerum.', CAST(12.00 AS Decimal(10, 2)), N'1 Impasse de Presbourg', N'0129127294', N'0646450815', N'Penny_Sanchez@yahoo.fr', N'66669', N'Perpignan', N'Penny_Sanchez', N'XLHxI9PldK')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (340, N'Shawarma Lovers', N'shawarma-lovers', 191, N'Non mollitia voluptatem ipsa dolorem molestiae. Rerum enim rem sunt voluptatem. Excepturi praesentium et fugiat in quis. Totam quo ullam nulla quisquam. Voluptate autem ex placeat labore enim accusantium cum minima. Illum sequi reprehenderit qui numquam.', CAST(9.00 AS Decimal(10, 2)), N'2 Passage de l''Odéon', N'0170005776', N'0667659323', N'Christie_Leclerc@gmail.com', N'12554', N'Courbevoie', N'Christie_Leclerc', N'QWU68e6Hc3')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (341, N'Topoly', N'topoly', 191, N'Error rem magni. In consequuntur tempore maxime beatae possimus deserunt voluptatibus consequatur voluptatem. Velit officiis beatae quod architecto velit id consequatur. Harum voluptatem consequuntur nesciunt.', CAST(6.00 AS Decimal(10, 2)), N'1979 Boulevard Pierre Charron', N'0169474127', N'0632318327', N'Blanche45@hotmail.fr', N'38475', N'Bourges', N'Blanche_Morin', N'vbJmyAQKLo')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (342, N'Five Pizza Original', N'five-pizza-original', 192, N'Qui repellendus nulla officiis qui tempore corrupti aut veritatis autem. Enim nesciunt et consequatur aut voluptas et et velit et. Voluptatem eius voluptate dolores corporis quaerat doloribus. Ad voluptas quia non assumenda consequatur ut autem qui. Ut ut distinctio recusandae rem. Recusandae fuga hic voluptatibus et nam.', CAST(12.00 AS Decimal(10, 2)), N'709 Voie d''Orsel', N'0160266433', N'0628202160', N'Lee_Schmitt@yahoo.fr', N'65941', N'Saint-Maur-des-Fossés', N'Lee41', N'lIwU5Ry4fw')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (343, N'5PIZZ', N'5pizz', 192, N'Officia quaerat voluptatem dolorem praesentium eos. Illum magni ut ad tenetur accusantium repellendus rerum dolore. Corrupti quae ut illo optio fugit maiores impedit accusantium. Modi sunt saepe eum.', CAST(12.00 AS Decimal(10, 2)), N'71 Boulevard Saint-Dominique', N'0103955741', N'0663522448', N'Lee51@yahoo.fr', N'98342', N'Aulnay-sous-Bois', N'Lee96', N'sC_QItKIz7')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (344, N'Chez Alfredo', N'chez-alfredo', 192, N'Consequatur iure et. Omnis est suscipit omnis et et possimus non. Veritatis sit nam distinctio ullam animi non harum explicabo occaecati.', CAST(12.00 AS Decimal(10, 2)), N'3292 Allée du Havre', N'0113090066', N'0602936229', N'Felix.Caron5@gmail.com', N'80765', N'Levallois-Perret', N'Felix_Caron83', N'mTS6j7HU6b')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (345, N'Mulberry Street', N'mulberry-street', 192, N'Voluptas iste dolorem. Aperiam excepturi voluptas et voluptates sed. Facere fugit officiis. At voluptatem ut qui eius vel ut nihil ut.', CAST(9.00 AS Decimal(10, 2)), N'845 Place de l''Odéon', N'0171467909', N'0682300429', N'Brittany.Guillot70@yahoo.fr', N'44782', N'Rueil-Malmaison', N'Brittany.Guillot46', N'vJ7wCKaq2u')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (346, N'Pizza La Fayette', N'pizza-la-fayette', 192, N'Aut quia voluptates qui voluptas doloremque fugiat consequatur qui earum. Ab consequatur rerum harum asperiores quis qui sed quod ut. Consequuntur voluptas inventore perferendis atque explicabo sunt autem nihil quia. Dolores possimus enim voluptatem inventore voluptas. Expedita quia fugiat aut et.', CAST(5.00 AS Decimal(10, 2)), N'9092 Avenue des Francs-Bourgeois', N'0198264959', N'0671107357', N'Jorge76@gmail.com', N'86441', N'Clichy', N'Jorge13', N'IPUrsBomf4')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (347, N'Pizza Rustica', N'pizza-rustica', 192, N'Illo sed qui velit quo quo dolor. Repellat tempora iure vel officiis architecto dolor. Quos sint harum similique qui omnis ab aut.', CAST(6.00 AS Decimal(10, 2)), N'0886 Impasse La Boétie', N'0186164561', N'0637335126', N'Gloria_Leclerc@yahoo.fr', N'10004', N'Saint-Quentin', N'Gloria_Leclerc94', N'eR7eWPpOdy')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (348, N'César Montorgueil', N'cesar-montorgueil', 192, N'Et consequatur aut praesentium et sint modi. Culpa vitae delectus alias rem est. Totam quasi repellendus eos occaecati harum.', CAST(10.00 AS Decimal(10, 2)), N'6 Rue La Boétie', N'0102755068', N'0696073618', N'Kent.Collet28@hotmail.fr', N'20878', N'Saint-Maur-des-Fossés', N'Kent_Collet', N'LyQPA4Wlam')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (349, N'Amala', N'amala', 192, N'Repudiandae non excepturi quisquam autem occaecati perferendis fugit id. Ut eos veniam aperiam sapiente quia harum. Qui eveniet voluptatibus sequi aut quidem et commodi perspiciatis.', CAST(11.00 AS Decimal(10, 2)), N'7795 Voie du Chat-qui-Pêche', N'0141252676', N'0646018237', N'Alan_Vasseur69@hotmail.fr', N'38683', N'Bourges', N'Alan_Vasseur91', N'QLY4IWqhTs')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (350, N'Falstaff', N'falstaff', 192, N'Aspernatur reiciendis quia. Consequatur ut eaque illum veniam. Perspiciatis vitae in rerum aliquam exercitationem quis non. Qui sed magnam aperiam. Id eius architecto mollitia quisquam quia optio ratione hic. Libero aperiam id ipsam dolores explicabo fugit optio tempora alias.', CAST(13.00 AS Decimal(10, 2)), N'8 Boulevard des Lombards', N'0193905865', N'0655894674', N'Franklin.Guyot@yahoo.fr', N'55615', N'Levallois-Perret', N'Franklin_Guyot', N'IEZ44UowP4')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (351, N'Palazzo di Pasta', N'palazzo-di-pasta', 192, N'Minima expedita velit voluptatem modi et asperiores amet. Soluta pariatur nemo quod qui consequatur hic cum quasi. Voluptatem quod quidem non enim inventore. Dolores architecto dolorem recusandae beatae et saepe.', CAST(6.00 AS Decimal(10, 2)), N'89 Voie des Rosiers', N'0158564549', N'0656419591', N'Sharon25@hotmail.fr', N'77231', N'Lorient', N'Sharon.Picard', N'rnjubwBoY4')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (352, N'Pizza Presto', N'pizza-presto', 192, N'Et illo consectetur sit at. Dolor blanditiis iusto eius esse vero mollitia. Consequuntur dolorum adipisci repudiandae dolore. Itaque mollitia nostrum.', CAST(8.00 AS Decimal(10, 2)), N'574 Passage de Montmorency', N'0142372699', N'0668041692', N'Harvey_Morel@gmail.com', N'97829', N'Drancy', N'Harvey35', N'LJgtDtTXgR')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (353, N'Chez Aldo', N'chez-aldo', 192, N'Sunt consequatur tenetur amet ea dolores eum perferendis facilis. Sint facilis qui magni eum. Nesciunt illo ipsa debitis nam. Ratione et quo qui libero at distinctio aut deleniti. Aspernatur reprehenderit et provident deleniti nulla exercitationem. Rerum nemo dolores ab est commodi odio corrupti vel rerum.', CAST(9.00 AS Decimal(10, 2)), N'5 Rue d''Assas', N'0120117673', N'0658938895', N'Brad7@yahoo.fr', N'06373', N'Saint-Denis', N'Brad_Robert88', N'glhAQMD1L9')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (354, N'Del Arte', N'del-arte', 192, N'Eum culpa at. Et exercitationem culpa harum animi et voluptate. Sunt est commodi magnam tempora debitis est.', CAST(13.00 AS Decimal(10, 2)), N'1816 Avenue de l''Odéon', N'0144803764', N'0624611578', N'Dwight_Guyot75@hotmail.fr', N'42408', N'Antibes', N'Dwight4', N'cw_K1EjVBF')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [Slug], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (355, N'Italian Trattoria', N'italian-trattoria', 192, N'Officiis neque molestiae incidunt architecto esse laboriosam totam odio. Expedita aliquam doloremque fuga ratione sit non maxime. Corrupti reprehenderit et sunt ea alias doloribus rem. Molestiae doloribus enim velit recusandae dolore molestiae fugiat omnis.', CAST(4.00 AS Decimal(10, 2)), N'23 Rue d''Alésia', N'0164064112', N'0631144529', N'Wayne_Rey19@yahoo.fr', N'43783', N'Lille13', N'Wayne_Rey', N'J7XQ6yTJAK')
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (306, 1817)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (307, 1818)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (308, 1819)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (309, 1820)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (310, 1821)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (311, 1822)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (312, 1823)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (313, 1824)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (314, 1825)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (315, 1826)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (316, 1827)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (317, 1828)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (318, 1829)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (319, 1830)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (320, 1831)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (321, 1832)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (322, 1833)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (323, 1834)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (324, 1835)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (325, 1836)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (326, 1837)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (327, 1838)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (328, 1839)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (329, 1840)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (330, 1841)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (331, 1842)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (332, 1843)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (333, 1844)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (334, 1845)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (335, 1846)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (336, 1847)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (337, 1848)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (338, 1849)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (339, 1850)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (340, 1851)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (341, 1852)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (342, 1853)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (343, 1854)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (344, 1855)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (345, 1856)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (346, 1857)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (347, 1858)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (348, 1859)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (349, 1860)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (350, 1861)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (351, 1862)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (352, 1863)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (353, 1864)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (354, 1865)
INSERT [dbo].[RestaurantPhoto] ([IdRestaurant], [IdPhoto]) VALUES (355, 1866)
INSERT [dbo].[SessionUtilisateur] ([IdSession], [DateSession]) VALUES (N'eywqoydz0hbx12qvnwzljzoo', CAST(N'2020-03-05T17:06:48.687' AS DateTime))
SET IDENTITY_INSERT [dbo].[TypeCuisine] ON 

INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (185, N'Asiatique', 1809)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (186, N'Boulangerie', 1810)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (187, N'Brasserie', 1811)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (188, N'Fastfood', 1812)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (189, N'Francaise', 1813)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (190, N'Indien', 1814)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (191, N'Libanais', 1815)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (192, N'Pizza', 1816)
SET IDENTITY_INSERT [dbo].[TypeCuisine] OFF
SET IDENTITY_INSERT [dbo].[TypeVersement] ON 

INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (2, N'Espèces', 1)
INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (3, N'Chèque restaurant', 1)
SET IDENTITY_INSERT [dbo].[TypeVersement] OFF
SET IDENTITY_INSERT [dbo].[Utilisateur] ON 

INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (146, N'Kergall', N'Yoann', N'yoann', N'123', 1, CAST(50.00 AS Decimal(10, 2)), N'eywqoydz0hbx12qvnwzljzoo')
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (147, N'Gautier', N'Chloé', N'71738', N'aeUTqXaL8v', 1, CAST(14.73 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (148, N'Pons', N'Jade', N'38089', N'uzPEflkAmo', 1, CAST(65.06 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (149, N'Roger', N'Lina', N'66447', N'BsUedFunVd', 1, CAST(6.70 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (150, N'Petit', N'Antoine', N'70215', N'k71OMISTXS', 1, CAST(84.36 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (151, N'Aubry', N'Mohamed', N'82026', N'tQ6WBaxV43', 1, CAST(24.61 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (152, N'Dumont', N'Marie', N'83521', N'LR36JvNlYY', 1, CAST(54.69 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (153, N'Jacquet', N'Romain', N'23251', N'PcmH75A2vl', 1, CAST(39.56 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (154, N'Dupont', N'Mathis', N'19041', N'Yyhf6_d0HM', 1, CAST(24.89 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (155, N'Aubert', N'Maxime', N'59285', N'LNXifunL6m', 1, CAST(49.53 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (156, N'Bonnet', N'Alicia', N'68873', N'vwJD54l_gQ', 1, CAST(16.25 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (157, N'Simon', N'Julien', N'55556', N'zueNvw78d5', 1, CAST(8.56 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (158, N'Morel', N'Axel', N'36367', N'Nkv4A73p8X', 1, CAST(14.88 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (159, N'Dumont', N'Maxime', N'54562', N'xxovKy_Pcu', 1, CAST(1.41 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (160, N'Schmitt', N'Ethan', N'91817', N'7DYxDFHay4', 1, CAST(31.73 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (161, N'Moreau', N'Lucas', N'35019', N'IECyGqtJQx', 1, CAST(53.08 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (162, N'Muller', N'Ambre', N'10566', N'J8YjfBCp0k', 1, CAST(45.90 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (163, N'Dupont', N'Ines', N'09067', N'7obXaAA_re', 1, CAST(36.94 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (164, N'Girard', N'Arthur', N'91141', N'Ht6aWZbf3j', 1, CAST(32.40 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (165, N'Dumont', N'Axel', N'79665', N'3XJ2ufOUlm', 1, CAST(13.84 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (166, N'Roche', N'Tom', N'43417', N'_QWmyD7gP5', 1, CAST(75.64 AS Decimal(10, 2)), NULL)
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
