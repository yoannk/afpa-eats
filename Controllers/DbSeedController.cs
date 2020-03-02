using Bogus;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AfpEat.Controllers
{
    public class DbSeedController : Controller
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
            CreateRestaurants(Convert.ToInt32(form["restaurantsQte"]));
            CreateProduits(Convert.ToInt32(form["produitsQte"]));

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
            db.Database.ExecuteSqlCommand("EXEC sp_msforeachtable 'ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all'");
        }

        private void CreateUtilisateurs(int amount)
        {
            db.Utilisateurs.Add(new Utilisateur() { Nom = "Kergall", Prenom = "Yoann", Matricule = "yoann", Password = "123", Statut = true, Solde = 50 });

            for (int i = 0; i < amount; i++)
            {
                Utilisateur utilisateur = new Utilisateur()
                {
                    Nom = faker.Name.LastName(),
                    Prenom = faker.Name.FirstName(),
                    Matricule = faker.Random.Replace("#####"),
                    Password = faker.Internet.Password(),
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
            logs.Add("Ajout de 7 catégories");

            db.SaveChanges();
        }

        private void CreateRestaurants(int amount)
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

            CreateRestaurant("Fastfood", "KFC", "KFC.jpg");
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
            var person = new Bogus.Person("fr");

            var restaurant = new Restaurant()
            {
                Nom = nom,
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

        private void CreateProduits(int amount)
        {
            var idRestaurants = db.Restaurants.Select(r => r.IdRestaurant).ToList();
            var idCategories = db.Categories.Select(r => r.IdCategorie).ToList();

            for (int i = 0; i < amount; i++)
            {
                var produit = new Produit()
                {
                    IdRestaurant = faker.PickRandom(idRestaurants),
                    IdCategorie = faker.PickRandom(idCategories),
                    Nom = faker.Lorem.Sentence(2, 5).TrimEnd('.'),
                    Prix = decimal.Round(faker.Random.Decimal(2, 11), 1),
                    Description = faker.Lorem.Sentence().TrimEnd('.'),
                    Quantite = faker.Random.ArrayElement(new[] { 0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 })
                };

                db.Produits.Add(produit);
                logs.Add($"Ajout produit #{i} {produit.Nom} : {produit.Description} - {produit.Prix} €");
            }

            db.SaveChanges();
        }

    }
}