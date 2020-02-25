USE [master]
GO
/****** Object:  Database [AfpEat]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[Categorie]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[Commande]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[CommandeProduit]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[CommandeProduitMenu]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[EtatCommande]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[MenuCategorie]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[Operation]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[Photo]    Script Date: 25/02/2020 13:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[IdPhoto] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[IdPhoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produit]    Script Date: 25/02/2020 13:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produit](
	[IdProduit] [int] IDENTITY(1,1) NOT NULL,
	[IdRestaurant] [int] NOT NULL,
	[IdCategorie] [int] NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[Prix] [decimal](10, 2) NOT NULL,
	[Description] [varchar](800) NOT NULL,
	[Quantite] [int] NOT NULL,
 CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED 
(
	[IdProduit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProduitPhoto]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[Restaurant]    Script Date: 25/02/2020 13:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[IdRestaurant] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](100) NOT NULL,
	[IdTypeCuisine] [int] NOT NULL,
	[Description] [varchar](800) NOT NULL,
	[Budget] [decimal](10, 2) NOT NULL,
	[Adresse] [varchar](100) NOT NULL,
	[Telephone] [varchar](50) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CodePostal] [varchar](10) NOT NULL,
	[Ville] [varchar](100) NOT NULL,
	[Login] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[IdRestaurant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RestaurantPhoto]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[SessionUtilisateur]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[TypeCuisine]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[TypeVersement]    Script Date: 25/02/2020 13:55:58 ******/
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
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 25/02/2020 13:55:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[IdUtilisateur] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[Prenom] [varchar](50) NOT NULL,
	[Matricule] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
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

INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (22, N'Entrée', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (23, N'Plat', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (24, N'Dessert', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (25, N'Salade', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (26, N'Boisson', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (27, N'Pâtes', 1)
INSERT [dbo].[Categorie] ([IdCategorie], [Nom], [Statut]) VALUES (28, N'Panini', 1)
SET IDENTITY_INSERT [dbo].[Categorie] OFF
SET IDENTITY_INSERT [dbo].[EtatCommande] ON 

INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (1, N'En Attente')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (2, N'En cours de préparation')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (3, N'En cours de livraison')
INSERT [dbo].[EtatCommande] ([IdEtatCommande], [Nom]) VALUES (4, N'Livré')
SET IDENTITY_INSERT [dbo].[EtatCommande] OFF
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (114, N'asiatique.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (115, N'boulangerie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (116, N'brasserie.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (117, N'fastfood.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (118, N'francaise.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (119, N'indien.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (120, N'libanais.jpg')
INSERT [dbo].[Photo] ([IdPhoto], [Nom]) VALUES (121, N'pizza.jpg')
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Produit] ON 

INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (20, 29, 23, N'Harum molestiae quaerat beatae', CAST(2.10 AS Decimal(10, 2)), N'Eos nostrum quisquam numquam rem', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (21, 29, 24, N'Rem sunt eum quia dolorem molestias', CAST(7.40 AS Decimal(10, 2)), N'Repellat nemo impedit quaerat et nihil', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (22, 29, 26, N'Dolorem placeat', CAST(2.50 AS Decimal(10, 2)), N'Nulla quia adipisci asperiores qui', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (23, 26, 23, N'Officiis dolorem voluptatum et quos iste', CAST(5.50 AS Decimal(10, 2)), N'Eveniet aperiam sed', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (24, 29, 24, N'Ut qui', CAST(9.50 AS Decimal(10, 2)), N'Nulla rem dignissimos omnis quod sed', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (25, 27, 22, N'Molestiae quidem velit', CAST(8.90 AS Decimal(10, 2)), N'Quo sunt et quia reprehenderit quia incidunt', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (26, 27, 26, N'Explicabo architecto debitis dolores omnis', CAST(11.00 AS Decimal(10, 2)), N'Quod vel modi et', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (27, 29, 24, N'Ut ut non', CAST(10.80 AS Decimal(10, 2)), N'Suscipit corrupti nesciunt praesentium ut et', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (28, 28, 23, N'Qui quia voluptas numquam voluptatem', CAST(3.50 AS Decimal(10, 2)), N'Asperiores voluptate molestiae molestias blanditiis', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (29, 27, 24, N'Optio eum ratione eos', CAST(10.70 AS Decimal(10, 2)), N'Exercitationem ipsam consectetur', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (30, 30, 24, N'A dolorum', CAST(8.20 AS Decimal(10, 2)), N'Voluptas est aliquam est occaecati ex', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (31, 26, 23, N'Quae necessitatibus aut explicabo voluptas', CAST(2.50 AS Decimal(10, 2)), N'Odit omnis exercitationem eum et ea', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (32, 28, 22, N'Aliquam sint eum ducimus', CAST(4.70 AS Decimal(10, 2)), N'A fuga dolorum voluptatem nihil quia rem quasi nulla', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (33, 28, 23, N'Enim excepturi voluptatem ea', CAST(8.00 AS Decimal(10, 2)), N'Quasi reprehenderit fugit aut esse quis dolore dolores earum', 45)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (34, 26, 25, N'Quod quasi', CAST(10.30 AS Decimal(10, 2)), N'Ratione et temporibus recusandae beatae tempora', 25)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (35, 30, 27, N'Odit quo ut aut natus', CAST(3.40 AS Decimal(10, 2)), N'Ut et voluptas sint quia omnis praesentium', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (36, 28, 23, N'Et dolores quas aliquid iure ipsa', CAST(2.10 AS Decimal(10, 2)), N'Aut sint doloribus dolorem in ratione', 30)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (37, 29, 22, N'Ipsa quisquam provident quis voluptatum molestias', CAST(7.80 AS Decimal(10, 2)), N'Tenetur earum magni', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (38, 27, 25, N'Repellendus est nostrum dolores facere voluptas vero', CAST(2.90 AS Decimal(10, 2)), N'Minima cum et', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (39, 27, 24, N'Eaque voluptatem saepe corrupti non', CAST(4.00 AS Decimal(10, 2)), N'Voluptatem asperiores quo corporis sunt et voluptatem unde nam odio', 10)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (40, 29, 24, N'Id iure praesentium sit', CAST(7.60 AS Decimal(10, 2)), N'Aut quibusdam voluptatem autem qui qui', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (41, 26, 22, N'Veritatis qui error assumenda', CAST(4.40 AS Decimal(10, 2)), N'Eaque voluptatem assumenda doloremque', 40)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (42, 29, 22, N'Beatae totam hic dolore iusto non', CAST(5.90 AS Decimal(10, 2)), N'Ut quibusdam rerum modi minus', 15)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (43, 28, 25, N'Incidunt sed corporis vel minus tempora', CAST(7.90 AS Decimal(10, 2)), N'Totam aliquid iusto', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (44, 28, 26, N'Repellendus blanditiis exercitationem', CAST(5.10 AS Decimal(10, 2)), N'Fugit et dicta molestiae possimus omnis voluptas dolorem', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (45, 28, 26, N'Voluptatem quia natus adipisci impedit', CAST(5.80 AS Decimal(10, 2)), N'Et exercitationem sit ut in', 50)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (46, 30, 24, N'Nam iusto ad', CAST(2.40 AS Decimal(10, 2)), N'Officiis deserunt in qui', 20)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (47, 29, 23, N'Eum perferendis veritatis et', CAST(10.10 AS Decimal(10, 2)), N'Ad quasi dicta architecto', 0)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (48, 30, 22, N'Recusandae nobis molestias non', CAST(9.80 AS Decimal(10, 2)), N'Animi nesciunt laborum magni', 35)
INSERT [dbo].[Produit] ([IdProduit], [IdRestaurant], [IdCategorie], [Nom], [Prix], [Description], [Quantite]) VALUES (49, 28, 24, N'Voluptatibus quod sit aut dolorem dolor', CAST(6.20 AS Decimal(10, 2)), N'Et molestiae aspernatur quod', 0)
SET IDENTITY_INSERT [dbo].[Produit] OFF
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (26, N'Robert, Gautier and Bertrand', 124, N'Maiores ad dolores atque quo. Sit maxime asperiores non sapiente ea. Et sunt iusto sapiente numquam reprehenderit quia dolorem sit. Autem optio inventore rerum adipisci. Aperiam sequi voluptatibus sunt non sapiente repellendus sed. Repellat consequuntur temporibus ea perferendis quod perferendis numquam.', CAST(8.00 AS Decimal(10, 2)), N'9123 Place des Grands Augustins', N'0191548074', N'0689177410', N'Casey53@gmail.com', N'58900', N'Dunkerque14', N'Casey.Mercier', N'nju949GL0U')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (27, N'Dupont, Roux and Prevost', 123, N'Inventore et vel iusto culpa modi dolores. Non velit et. Vitae sed sed corporis eligendi saepe accusantium.', CAST(7.00 AS Decimal(10, 2)), N'616 Place Joubert', N'0181428615', N'0685542634', N'Tyrone.Leclercq@gmail.com', N'31419', N'Calais', N'Tyrone1', N'Yw4jP9Uofw')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (28, N'Picard, Sanchez and Meunier', 125, N'Expedita corporis veritatis quo. Repellat ex autem iste qui ex animi voluptas et nisi. Voluptates occaecati enim.', CAST(13.00 AS Decimal(10, 2)), N'87 Passage Dauphine', N'0124353861', N'0677311742', N'Vincent_Collet89@gmail.com', N'39051', N'Strasbourg', N'Vincent_Collet', N'OwfSSIwGv1')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (29, N'Gauthier - Marchand', 126, N'Optio ab nisi dolorem. Iusto autem est optio et quibusdam dignissimos. Ducimus nam aut consequatur. Et veritatis illum ut laudantium id nam aut itaque.', CAST(7.00 AS Decimal(10, 2)), N'8223 Rue des Francs-Bourgeois', N'0115752930', N'0637397725', N'Hilda83@gmail.com', N'10176', N'Limoges', N'Hilda35', N'ImKq9DAWfH')
INSERT [dbo].[Restaurant] ([IdRestaurant], [Nom], [IdTypeCuisine], [Description], [Budget], [Adresse], [Telephone], [Mobile], [Email], [CodePostal], [Ville], [Login], [Password]) VALUES (30, N'Caron, Bourgeois and Lemaire', 125, N'Officiis sit excepturi minima distinctio sequi veritatis inventore animi. Iste similique temporibus voluptates qui a soluta. Ab ipsam aut consectetur. Vel doloribus dolor soluta temporibus dicta sit natus voluptas ullam.', CAST(8.00 AS Decimal(10, 2)), N'79 Rue Bonaparte', N'0128651716', N'0647335396', N'Robert20@gmail.com', N'47211', N'Le Tampon', N'Robert46', N'w1QsFbMLWy')
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
INSERT [dbo].[SessionUtilisateur] ([IdSession], [DateSession]) VALUES (N'eywqoydz0hbx12qvnwzljzoo', CAST(N'2020-02-25T12:13:15.807' AS DateTime))
SET IDENTITY_INSERT [dbo].[TypeCuisine] ON 

INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (121, N'Asiatique', 114)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (122, N'Boulangerie', 115)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (123, N'Brasserie', 116)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (124, N'Fastfood', 117)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (125, N'Francaise', 118)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (126, N'Indien', 119)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (127, N'Libanais', 120)
INSERT [dbo].[TypeCuisine] ([IdTypeCuisine], [Nom], [IdPhoto]) VALUES (128, N'Pizza', 121)
SET IDENTITY_INSERT [dbo].[TypeCuisine] OFF
SET IDENTITY_INSERT [dbo].[TypeVersement] ON 

INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (2, N'Espèces', 1)
INSERT [dbo].[TypeVersement] ([IdTypeVersement], [Nom], [Statut]) VALUES (3, N'Chèque restaurant', 1)
SET IDENTITY_INSERT [dbo].[TypeVersement] OFF
SET IDENTITY_INSERT [dbo].[Utilisateur] ON 

INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (98, N'Kergall', N'Yoann', N'yoann', N'123', 1, CAST(50.00 AS Decimal(10, 2)), N'eywqoydz0hbx12qvnwzljzoo')
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (99, N'Brunet', N'Justine', N'88288', N'ZYFPdD76jt', 1, CAST(51.72 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (100, N'Charles', N'Mélissa', N'58539', N'hgdaJc2wZZ', 1, CAST(75.33 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (101, N'Julien', N'Julie', N'98462', N'J3mF9RbXp2', 1, CAST(2.37 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (102, N'Martin', N'Lisa', N'82563', N'bXDve5dMq0', 1, CAST(49.60 AS Decimal(10, 2)), NULL)
INSERT [dbo].[Utilisateur] ([IdUtilisateur], [Nom], [Prenom], [Matricule], [Password], [Statut], [Solde], [IdSession]) VALUES (103, N'Chevalier', N'Baptiste', N'94780', N'XsfETIHSsc', 1, CAST(37.72 AS Decimal(10, 2)), NULL)
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
