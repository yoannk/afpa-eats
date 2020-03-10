using AfpEat.Utilities;
using Bogus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Helpers;
using System.Web.Mvc;

namespace AfpEat.Controllers
{
    public class DbSeedController : BaseController
    {
        private AfpEatEntities db = new AfpEatEntities();
        Faker faker = new Faker("fr");
        List<string> logs = new List<string>();

        // GET: DbSeed
        public ActionResult Index()
        {
            return View();
        }

        // POST: DbSeed
        [HttpPost]
        public ActionResult Index(FormCollection form)
        {
            ClearTables();

            CreateUtilisateurs(Convert.ToInt32(form["utilisateursQte"]));
            CreateTypeCuisinePhotos();
            CreateTypeCuisine();
            CreateCategorie();
            CreateRestaurants();
            CreateProduits();
            CreateMenus();

            return View(logs);
        }

        private void ClearTables()
        {
            db.Database.ExecuteSqlCommand("EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'");
            db.Database.ExecuteSqlCommand("DELETE FROM [Utilisateur]");
            db.Database.ExecuteSqlCommand("DELETE FROM [Restaurant]");
            db.Database.ExecuteSqlCommand("DELETE FROM [Produit]");
            db.Database.ExecuteSqlCommand("DELETE FROM [TypeCuisine]");
            db.Database.ExecuteSqlCommand("DELETE FROM [Categorie]");
            db.Database.ExecuteSqlCommand("DELETE FROM [Photo]");
            db.Database.ExecuteSqlCommand("DELETE FROM [Commande]");
            db.Database.ExecuteSqlCommand("DELETE FROM [CommandeProduit]");
            db.Database.ExecuteSqlCommand("DELETE FROM [RestaurantPhoto]");
            db.Database.ExecuteSqlCommand("DELETE FROM [ProduitPhoto]");
            db.Database.ExecuteSqlCommand("DELETE FROM [Menu]");
            db.Database.ExecuteSqlCommand("DELETE FROM [MenuCategorie]");
            db.Database.ExecuteSqlCommand("EXEC sp_msforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all'");
        }

        private void CreateUtilisateurs(int amount)
        {
            db.Utilisateurs.Add(new Utilisateur() { Nom = "Kergall", Prenom = "Yoann", Matricule = "yoann", Password = Crypto.HashPassword("123"), Statut = true, Solde = 50 });

            for (int i = 0; i < amount; i++)
            {
                Utilisateur utilisateur = new Utilisateur()
                {
                    Nom = faker.Name.LastName(),
                    Prenom = faker.Name.FirstName(),
                    Matricule = faker.Random.Replace("#####"),
                    Password = Crypto.HashPassword("123"),
                    Statut = true,
                    Solde = faker.Random.Decimal(0, 100)
                };

                db.Utilisateurs.Add(utilisateur);
                logs.Add($"Ajout utilisateur #{i} {utilisateur.Prenom} {utilisateur.Nom}");
            }

            db.SaveChanges();
        }

        private void CreateTypeCuisinePhotos()
        {
            db.Photos.Add(new Photo() { Nom = "asiatique.jpg", });
            db.Photos.Add(new Photo() { Nom = "boulangerie.jpg", });
            db.Photos.Add(new Photo() { Nom = "brasserie.jpg", });
            db.Photos.Add(new Photo() { Nom = "fastfood.jpg", });
            db.Photos.Add(new Photo() { Nom = "francaise.jpg", });
            db.Photos.Add(new Photo() { Nom = "indien.jpg", });
            db.Photos.Add(new Photo() { Nom = "libanais.jpg", });
            db.Photos.Add(new Photo() { Nom = "pizza.jpg", });
            logs.Add("Ajout de 7 photos de type de cuisine");

            db.SaveChanges();
        }

        private void CreateTypeCuisine()
        {
            db.TypeCuisines.Add(new TypeCuisine() { Nom = "Asiatique", IdPhoto = db.Photos.Single(p => p.Nom == "asiatique.jpg").IdPhoto });
            db.TypeCuisines.Add(new TypeCuisine() { Nom = "Boulangerie", IdPhoto = db.Photos.Single(p => p.Nom == "boulangerie.jpg").IdPhoto });
            db.TypeCuisines.Add(new TypeCuisine() { Nom = "Brasserie", IdPhoto = db.Photos.Single(p => p.Nom == "brasserie.jpg").IdPhoto });
            db.TypeCuisines.Add(new TypeCuisine() { Nom = "Fastfood", IdPhoto = db.Photos.Single(p => p.Nom == "fastfood.jpg").IdPhoto });
            db.TypeCuisines.Add(new TypeCuisine() { Nom = "Francaise", IdPhoto = db.Photos.Single(p => p.Nom == "francaise.jpg").IdPhoto });
            db.TypeCuisines.Add(new TypeCuisine() { Nom = "Indien", IdPhoto = db.Photos.Single(p => p.Nom == "indien.jpg").IdPhoto });
            db.TypeCuisines.Add(new TypeCuisine() { Nom = "Libanais", IdPhoto = db.Photos.Single(p => p.Nom == "libanais.jpg").IdPhoto });
            db.TypeCuisines.Add(new TypeCuisine() { Nom = "Pizza", IdPhoto = db.Photos.Single(p => p.Nom == "pizza.jpg").IdPhoto });
            logs.Add("Ajout de 7 types de cuisine");

            db.SaveChanges();
        }

        private void CreateCategorie()
        {
            db.Categories.Add(new Categorie() { Nom = "Entrée", Statut = true });
            db.Categories.Add(new Categorie() { Nom = "Plat", Statut = true });
            db.Categories.Add(new Categorie() { Nom = "Dessert", Statut = true });
            db.Categories.Add(new Categorie() { Nom = "Salade", Statut = true });
            db.Categories.Add(new Categorie() { Nom = "Boisson", Statut = true });
            db.Categories.Add(new Categorie() { Nom = "Pâtes", Statut = true });
            db.Categories.Add(new Categorie() { Nom = "Panini", Statut = true });
            db.Categories.Add(new Categorie() { Nom = "Pizza", Statut = true });
            db.Categories.Add(new Categorie() { Nom = "Sandwich", Statut = true });
            logs.Add("Ajout de 7 catégories");

            db.SaveChanges();
        }

        private void CreateRestaurants()
        {
            CreateRestaurant("Asiatique", "Pokawa", "Pokawa.jpg");
            CreateRestaurant("Asiatique", "Sushi Shop", "Sushi Shop.jpg");
            CreateRestaurant("Asiatique", "SHAKA Poke", "SHAKA Poke.jpg");

            CreateRestaurant("Boulangerie", "La Mie Câline", "La Mie Caline.jpg");
            CreateRestaurant("Boulangerie", "Maison Kayser", "Maison Kayser.jpg");
            CreateRestaurant("Boulangerie", "Boulangerie Beaubourg", "Boulangerie Beaubourg.jpg");
            CreateRestaurant("Boulangerie", "Pomme de Pain", "Pomme de Pain.jpg");
            CreateRestaurant("Boulangerie", "Boulangerie artisanale Zerzour", "Boulangerie artisanale Zerzour.jpg");

            CreateRestaurant("Brasserie", "Shake it Easy", "Shake it Easy.jpg");

            CreateRestaurant("Fastfood", "Cheezer", "Cheezer.jpg");
            CreateRestaurant("Fastfood", "Nabab Kebab", "Nabab Kebab.jpg");
            CreateRestaurant("Fastfood", "Burger & Fries", "Burger & Fries.jpg");
            CreateRestaurant("Fastfood", "Les Burgers de Papa", "Les Burgers de Papa.jpg");
            CreateRestaurant("Fastfood", "Mac Doner", "Mac Doner.jpg");

            CreateRestaurant("Francaise", "Fermier Gourmet", "Fermier Gourmet.jpg");
            CreateRestaurant("Francaise", "La cochonnaille", "La cochonnaille.jpg");
            CreateRestaurant("Francaise", "Nos Grands-mères ont du Talent", "Nos Grands-mères ont du Talent.jpg");
            CreateRestaurant("Francaise", "Canard Street", "Canard Street.jpg");
            CreateRestaurant("Francaise", "Zoe Bouillon", "Zoe Bouillon.jpg");
            CreateRestaurant("Francaise", "Kitchen Paris", "Kitchen Paris.jpg");
            CreateRestaurant("Francaise", "Crêperie Galette Cafe", "Crêperie Galette Cafe.jpg");

            CreateRestaurant("Indien", "Bollynan", "Bollynan.jpg");
            CreateRestaurant("Indien", "Aarapana restaurant", "Aarapana restaurant.jpg");
            CreateRestaurant("Indien", "Safran", "Safran.jpg");
            CreateRestaurant("Indien", "Eat & Cool", "Eat & Cool.jpg");

            CreateRestaurant("Libanais", "Taboulé Paris", "Taboulé Paris.jpg");
            CreateRestaurant("Libanais", "Chez le Libanais", "Chez le Libanais.jpg");
            CreateRestaurant("Libanais", "Le Cèdre", "Le Cèdre.jpg");
            CreateRestaurant("Libanais", "Noura", "Noura.jpg");
            CreateRestaurant("Libanais", "Zaatar Libanais", "Zaatar Libanais.jpg");
            CreateRestaurant("Libanais", "Big Falafel", "Big Falafel.jpg");
            CreateRestaurant("Libanais", "Marché Libanais", "Marché Libanais.jpg");
            CreateRestaurant("Libanais", "King Falafel Palace", "King Falafel Palace.jpg");
            CreateRestaurant("Libanais", "O Beyrouth", "O Beyrouth.jpg");
            CreateRestaurant("Libanais", "Shawarma Lovers", "Shawarma Lovers.jpg");
            CreateRestaurant("Libanais", "Topoly", "Topoly.jpg");

            CreateRestaurant("Pizza", "Five Pizza Original", "Five Pizza Original.jpg");
            CreateRestaurant("Pizza", "5PIZZ", "5PIZZ.jpg");
            CreateRestaurant("Pizza", "Chez Alfredo", "Chez Alfredo.jpg");
            CreateRestaurant("Pizza", "Mulberry Street", "Mulberry Street.jpg");
            CreateRestaurant("Pizza", "Pizza La Fayette", "Pizza La Fayette.jpg");
            CreateRestaurant("Pizza", "Pizza Rustica", "Pizza Rustica.jpg");
            CreateRestaurant("Pizza", "César Montorgueil", "César Montorgueil.jpg");
            CreateRestaurant("Pizza", "Amala", "Amala.jpg");
            CreateRestaurant("Pizza", "Falstaff", "Falstaff.jpg");
            CreateRestaurant("Pizza", "Palazzo di Pasta", "Palazzo di Pasta.jpg");
            CreateRestaurant("Pizza", "Pizza Presto", "Pizza Presto.jpg");
            CreateRestaurant("Pizza", "Chez Aldo", "Chez Aldo.jpg");
            CreateRestaurant("Pizza", "Del Arte", "Del Arte.jpg");
            CreateRestaurant("Pizza", "Italian Trattoria", "Italian Trattoria.jpg");

            db.SaveChanges();
        }

        private Restaurant CreateRestaurant(string typeCuisine, string nom, string photo)
        {
            var idTypeCuisines = db.TypeCuisines.First(tc => tc.Nom == typeCuisine).IdTypeCuisine;
            var person = new Person("fr");

            var restaurant = new Restaurant()
            {
                Nom = nom,
                Slug = Helpers.GenerateSlug(nom),
                IdTypeCuisine = idTypeCuisines,
                Description = faker.Lorem.Paragraph(),
                Budget = faker.Random.Int(3, 15),
                Adresse = person.Address.Street,
                Telephone = faker.Random.Replace("01########"),
                Mobile = faker.Random.Replace("06########"),
                Email = person.Email,
                CodePostal = person.Address.ZipCode,
                Ville = person.Address.City,
                Login = person.UserName,
                Password = faker.Internet.Password()

            };

            restaurant.Photos.Add(new Photo() { Nom = photo });
            db.Restaurants.Add(restaurant);
            logs.Add("Ajout restaurant : " + restaurant.Nom);

            return restaurant;
        }

        private void CreateProduits()
        {
            AddProduitsAsiatique("Pokawa", "Sushi Shop", "SHAKA Poke");
            AddProduitsBoulangerie("La Mie Câline", "Maison Kayser", "Boulangerie Beaubourg", "Pomme de Pain", "Boulangerie artisanale Zerzour");

            db.SaveChanges();
        }

        private void AddProduitsBoulangerie(params string[] restaurants)
        {
            foreach (var restaurant in restaurants)
            {
                CreateProduit(restaurant, "Pizza", "Pizza aux chèvres", "Coulis de tomate, mozzarella et chèvre.", 5.20m);
                CreateProduit(restaurant, "Pizza", "Pizza lardons champignons", "Coulis de tomate, lardons et champignons.", 5.20m);

                CreateProduit(restaurant, "Salade", "Salade Chic Saumon", "Salade composé et mâche , lentilles corail, chou rouge, saumon fumé ,radis.", 8.70m);
                CreateProduit(restaurant, "Salade", "Salade jambon Serrano , rigatori et féta", "Salade composée , mache , rigatori au deux poivrons , tomates cerise , jambon serrano , féta et ciboulette", 8.70m);
                CreateProduit(restaurant, "Salade", "Salade poulet , trio de carottes et oeuf poché", "Salade composée , mache , trio de carottes , tomate cerise , oeuf poché , medaillon de poulet roti , graine de courge", 8.70m);

                CreateProduit(restaurant, "Sandwich", "Graine de chic poulet et pesto rosso", "pain couronne et graines bio , poulet roti , pesto rosso , mozza , roquette", 8.70m);
                CreateProduit(restaurant, "Sandwich", "Graine de chic Guacamole et Galettes de légumes de Soleil", "Pain couronne et graines de pavot, galettes de légumes confits, guacamole, tomate cerise, pointe de verdure.", 8.70m);
                CreateProduit(restaurant, "Sandwich", "Dolce vita", "Déjeunette la mie câline, pesto vert, médaillons de poulet, tomates confite, pécorino et roquette.", 8.70m);
                CreateProduit(restaurant, "Sandwich", "Coppa Tomme de Brebis", "Déjeunette baguette la véritable, Tomme de Brebis, Coppa, beurre léger, pointe de verdure.", 8.70m);

                CreateProduit(restaurant, "Sandwich", "Sandwich jambon beurre", "Déjeunette baguette, jambon blanc et beurre léger.", 5.05m);
                CreateProduit(restaurant, "Sandwich", "Sandwich jambon emmental", "Déjeunette baguette, jambon blanc, emmental et beurre léger.", 5.05m);
                CreateProduit(restaurant, "Sandwich", "Sandwich poulet sauce moutarde", "Déjeunette baguette, émincés de poulet, sauce mayonnaise à la moutarde à l'ancienne et salade.", 5.05m);
                CreateProduit(restaurant, "Sandwich", "Sandwich rosette cornichons", "Déjeunette baguette, beurre léger, rosette et cornichons.", 5.05m);
                CreateProduit(restaurant, "Sandwich", "Ciabatta poulet curry", "Pain ciabatta, émincés de poulet, tomate et sauce curry.", 5.05m);
                CreateProduit(restaurant, "Sandwich", "Sandwich jambon complet", "Déjeunette baguette, jambon blanc, tomates, œuf, emmental, mayonnaise et salade.", 6.50m);
                CreateProduit(restaurant, "Sandwich", "Sandwich poulet complet", "Déjeunette baguette, émincés de poulet, tomates, œuf, emmental, mayonnaise et salade.", 6.50m);
                CreateProduit(restaurant, "Sandwich", "Sandwich thon complet", "Déjeunette baguette, thon, tomates, œuf, mayonnaise et salade.", 6.50m);
                CreateProduit(restaurant, "Sandwich", "Moelleux poulet curry", "Déjeunette moelleuse, émincés de poulet, poivrons, sauce curry, salade", 6.30m);
                CreateProduit(restaurant, "Sandwich", "Moelleux barbecue cheddar", "Une déjeunette pain de mie moelleuse garnie d'un effiloché de porc (viande de porc française marinée à la sauce barbecue, cuite à base température) et d'une sauce barbecue, le tout recouvert de cheddar.", 6.30m);

                CreateProduit(restaurant, "Panini", "Panini poulet Barbecue", "Pain nature, sauce barbecue, émincés de poulet, oignons et cheddar.", 6.50m);
                CreateProduit(restaurant, "Panini", "Panini Savoyard", "Pain nature, fromage à raclette et jambon blanc fumé.", 6.50m);
                CreateProduit(restaurant, "Panini", "Panini Mexicain", "Pain aux poivrons, sauce épicée mexicaine, poulet mariné, cheddar.", 6.50m);
                CreateProduit(restaurant, "Panini", "Panini Italien", "Pain aux herbes, sauce tomate, jambon blanc fumé, mozzarella, tomate.", 6.50m);
                CreateProduit(restaurant, "Panini", "Panini 3 fromages", "Pain nature, sauce fromage frais, mozzarella, cheddar et bleu.", 6.50m);

                CreateProduit(restaurant, "Dessert", "Cookie Nutella", "", 2.80m);
                CreateProduit(restaurant, "Dessert", "Super cookie pépites chocolat noir", "", 2.80m);
                CreateProduit(restaurant, "Dessert", "Super cookie chocolat blanc", "", 2.80m);
                CreateProduit(restaurant, "Dessert", "Super cookie 3 chocolats", "", 2.80m);
                CreateProduit(restaurant, "Dessert", "Muffin chocolat caramel", "", 3.00m);
                CreateProduit(restaurant, "Dessert", "Donuts Chocolat", "", 2.30m);
                CreateProduit(restaurant, "Dessert", "Tartelette citron", "", 3.70m);
                CreateProduit(restaurant, "Dessert", "Tartelette citron meringuée", "", 3.70m);
                CreateProduit(restaurant, "Dessert", "Tartelette pomme", "", 3.70m);
                CreateProduit(restaurant, "Dessert", "Gâteau basque", "", 3.50m);
                CreateProduit(restaurant, "Dessert", "Flan nature", "", 3.00m);
                CreateProduit(restaurant, "Dessert", "Éclair chocolat", "", 3.40m);
                CreateProduit(restaurant, "Dessert", "Éclair café", "", 3.40m);
                CreateProduit(restaurant, "Dessert", "Éclair Vanille", "", 3.40m);
                CreateProduit(restaurant, "Dessert", "Cheese cake cookies", "", 3.70m);
                CreateProduit(restaurant, "Dessert", "Macaron caramel", "", 3.80m);
                CreateProduit(restaurant, "Dessert", "Macaron chocolat", "", 3.80m);
                CreateProduit(restaurant, "Dessert", "Tartelette poire amande", "", 3.70m);
                CreateProduit(restaurant, "Dessert", "Brownies", "", 2.80m);
                CreateProduit(restaurant, "Dessert", "Framboisier", "", 3.80m);
                CreateProduit(restaurant, "Dessert", "Cheese cake Spéculoos", "", 3.70m);
                CreateProduit(restaurant, "Dessert", "Éclair Praliné", "Une pâte à choux garnie d'une onctueuse mousse pralinée, recouverte d'un glaçage et d'éclats de noisettes caramélisées.", 3.70m);
                CreateProduit(restaurant, "Dessert", "Moelleux au chocolat", "Un moelleux au chocolat composé d'oeufs, chocolat noir, beurre, sucre, farine, et c'est tout! A déguster chaud.", 3.40m);
                CreateProduit(restaurant, "Dessert", "Cup de fruits de saison", "Fruits selon la saison", 3.80m);
            }
        }

        private void AddProduitsAsiatique(params string[] restaurants)
        {
            foreach (var restaurant in restaurants)
            {
                CreateProduit(restaurant, "Entrée", "Avocado toast", "Toast de pain grillé, avocat, grenades et graines bio et une pointe de sauce tropicale ! Que du BONHEUR", 7.90m);
                CreateProduit(restaurant, "Entrée", "Soupawa Maison", "Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !", 4.90m);
                CreateProduit(restaurant, "Entrée", "Falafels Bio", "Super falafels de pois chiche bio, vegan et sans gluten ! Pourquoi se priver ?", 5.90m);
                CreateProduit(restaurant, "Entrée", "Salmon Love Avocado", "Un demi avocat avec du saumon frais et parsemé de grenade. Il est accompagné de notre super sauce tropicale maison et une touche de graines de sésame.", 4.90m);
                CreateProduit(restaurant, "Entrée", "Salade d'algues wakamé", "Faites un plein de vitamines ! Le wakamé est un très bon allié pour booster votre système immunitaire pour ce début d'hiver.", 4.90m);
                CreateProduit(restaurant, "Entrée", "Salade d'edamame", "Fèves de soja fraîches aux bienfaits extraordinaires. Riche en protéine de qualité, en fibre et vitamines B.", 3.90m);
                CreateProduit(restaurant, "Entrée", "Soupawa Maison", "Carottes, lait de coco, oignons rouges, une pointe de citron vert et une légère touche de coriandre ! UN VRAI DÉLICE !", 4.90m);

                CreateProduit(restaurant, "Plat", "Chirashi Hawaïen", "Base au choix, saumon mariné, avocat, mangue fraiche, cébette thaï et graines de sésame.", 12.90m);
                CreateProduit(restaurant, "Plat", "Poké Super Protéine", "Base au choix, saumon + thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.", 10.90m);
                CreateProduit(restaurant, "Plat", "Poké Saumon", "Base au choix, saumon d'Ecosse, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.", 10.90m);
                CreateProduit(restaurant, "Plat", "Poké Thon Rouge", "Base au choix, thon rouge mariné, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.", 10.90m);
                CreateProduit(restaurant, "Plat", "Poké Crevettes", "Base au choix, crevette, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.", 10.90m);
                CreateProduit(restaurant, "Plat", "Poké Daurade Royale", "Base au choix, daurade royale, mangue ou ananas, avocat, radis, concombre, carotte, edamame, chou rouge et graines de sésame.", 10.90m);
                CreateProduit(restaurant, "Plat", "Poké Poulet rôti teriyaki", "Base au choix, poulet rôti mariné à la sauce teriyaki, fruit au choix, avocat, carotte, radis, concombre, edamame, chou rouge et graines de sésame.", 10.90m);
                CreateProduit(restaurant, "Plat", "Poké Falafels Bio", "Base au choix, falafels Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.", 10.90m);
                CreateProduit(restaurant, "Plat", "Poké Tofu fumé Bio", "Base au choix, tofu fumé Bio, mangue ou ananas, avocat, carotte, radis, concombre, edamame, chou rouge, graines de sésame.", 10.90m);

                CreateProduit(restaurant, "Dessert", "Cheesecake", "Cheesecake et son coulis de framboises. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.", 4.90m);
                CreateProduit(restaurant, "Dessert", "Fondant au chocolat", "Chocolate lovers… Ce fondant est fait pour vous ! Et je n’ai qu’une chose à vous dire : REGALEZ-VOUS bien !", 4.90m);
                CreateProduit(restaurant, "Dessert", "Pudding Coco aux Perles de Chia Bio", "Cheesecake et son coulis de framboises fraîches. Miam Miam, une touche onctueuse et sucrée pour finir en beauté.", 4.90m);
                CreateProduit(restaurant, "Dessert", "Le Granola Bowl Mangue Bio", "Fromage blanc allégé, mangue fraiche et muesli énergétique.", 4.90m);
                CreateProduit(restaurant, "Dessert", "Excellente mangue fraîchement coupée", "Salade de mangue faite avec amour.", 4.90m);
                CreateProduit(restaurant, "Dessert", "Ananas plein de Soleil", "Salade d'ananas fraîchement coupés et gorgée de soleil !", 3.90m);
                CreateProduit(restaurant, "Dessert", "Cookie BIO Chocolat au Lait", "Les pépites de chocolat au lait fondent délicieusement en bouche. Une valeur sûre !", 3.50m);
                CreateProduit(restaurant, "Dessert", "Cookie BIO Caramel d'Isigny au Sel de Guérande", "Un cookie à la fois craquant et fondant. Les pépites de caramel se mêlent au côté iodé du sel de Guérande... à se damner.", 3.50m);

                CreateProduit(restaurant, "Boisson", "Lemonaid Bio Citron Vert", "Un vrai soda BIO naturel et rafraichissant avec du citron vert et une pointe de sucre de canne ! Le rêve non ? (33cl)", 3.90m);
                CreateProduit(restaurant, "Boisson", "Lemonaid Bio Fruit de La Passion", "Étonnant, addictif et délicieux. Que du rêve dans cette boisson fruitée ! A déguster au bord de la piscine ou sur une plage... (33 cl)", 3.90m);
                CreateProduit(restaurant, "Boisson", "Lemonaid Bio Orange Sanguine", "Beaucoup d’orange sanguine accompagnée de pamplemousse, d’orange, de citron avec un soupçon de cerise pour sublimer le goût ! Vous n’en reviendrez pas ! (33 cl)", 3.90m);
                CreateProduit(restaurant, "Boisson", "Thé glacé Wandertea Ice Fruits", "Réveillez votre énergie naturelle et désaltérez-vous avec de délicieux thé glacé.", 3.90m);
                CreateProduit(restaurant, "Boisson", "Citronnade maison", "Découvrez notre super citronnade maison infusée à la menthe avec une pointe de gingembre. Pourquoi faire compliqué quand on peu faire bon ? (35 cl)", 3.90m);
                CreateProduit(restaurant, "Boisson", "Evian", "On vous a déjà dit qu'il fallait boire 2 litres d'eau par jours ? (50 cl)", 2.90m);
                CreateProduit(restaurant, "Boisson", "San Pellegrino", "Une eau gazeuse à boire tous les jours, par tous. (50 cl)", 2.90m);
                CreateProduit(restaurant, "Boisson", "Coca-Cola", "Notre ami américain, original et rafraichissant depuis 1886 ! (33 cl)", 2.90m);
                CreateProduit(restaurant, "Boisson", "Coca-Cola zéro sucre", "Une subtile combinaison d’ingrédients restituant le goût de Coca-Cola avec zéro sucres, de quoi vous faire plaisir sans vous priver... (33 cl)", 2.90m);

            }
        }

        private Produit CreateProduit(string restaurant, string categorie, string nom, string description, decimal prix)
        {
            var idRestaurant = db.Restaurants.First(r => r.Nom == restaurant).IdRestaurant;
            var idCategorie = db.Categories.First(c => c.Nom == categorie).IdCategorie;

            var produit = new Produit()
            {
                IdRestaurant = idRestaurant,
                IdCategorie = idCategorie,
                Nom = nom,
                Prix = prix,
                Description = description,
                Quantite = faker.Random.ArrayElement(new[] { 0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 })
            };

            produit.Photos.Add(new Photo() { Nom = nom + ".jpg" });
            db.Produits.Add(produit);
            logs.Add($"Ajout produit : {produit.Nom} - {produit.Prix} €");

            return produit;
        }

        private void CreateMenus()
        {
            // Menus restaurant Pokawa

            var restoPokawa = db.Restaurants.First(r => r.Nom == "Pokawa");
            var catPlat = db.Categories.First(c => c.Nom == "Plat");
            var catEntree = db.Categories.First(c => c.Nom == "Entrée");
            var catDessert = db.Categories.First(c => c.Nom == "Dessert");
            var catBoisson = db.Categories.First(c => c.Nom == "Boisson");

            db.Menus.Add(new Menu()
            {
                Nom = "Menu Poke bowl signature & boisson",
                Restaurant = restoPokawa,
                Categories = new List<Categorie>() { catPlat, catBoisson },
                Photo = new Photo { Nom = "Menu Poke bowl signature & boisson.jpg" },
                Statut = true,
                Prix = 12.90m
            });

            db.Menus.Add(new Menu()
            {
                Nom = "Menu Poke bowl signature, boisson & dessert",
                Restaurant = restoPokawa,
                Categories = new List<Categorie>() { catPlat, catBoisson, catDessert },
                Photo = new Photo { Nom = "Menu Poke bowl signature, boisson & dessert.jpg" },
                Statut = true,
                Prix = 15.90m
            });

            db.SaveChanges();

        }


    }
}