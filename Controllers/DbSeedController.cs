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
            var idTypeCuisines = db.TypeCuisines.Select(tc => tc.IdTypeCuisine).ToList();

            for (int i = 0; i < amount; i++)
            {
                var person = new Bogus.Person("fr");

                var restaurant = new Restaurant()
                {
                    Nom = faker.Company.CompanyName(),
                    IdTypeCuisine = faker.PickRandom(idTypeCuisines),
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

                db.Restaurants.Add(restaurant);
                logs.Add($"Ajout restaurant #{i} {restaurant.Nom}");
            }

            db.SaveChanges();
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