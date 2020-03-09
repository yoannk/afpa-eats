using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AfpEat;
using AfpEat.Models;

namespace AfpEat.Controllers
{
    public class RestaurantsController : BaseController
    {
        private AfpEatEntities db = new AfpEatEntities();

        // GET: Restaurants
        public ActionResult Index()
        {
            var restaurants = db.Restaurants.Include(r => r.TypeCuisine);
            return View(restaurants.ToList());
        }

        public ActionResult ParSpecialitee(int? idTypeCuisine)
        {
            if (idTypeCuisine == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            List<Restaurant> restaurants = db.Restaurants.Where(r => r.IdTypeCuisine == idTypeCuisine).ToList();
            ViewBag.specialitee = db.TypeCuisines.Find(idTypeCuisine).Nom;

            return View(restaurants);
        }

        // GET: Restaurants/Details/5
        [Route("~/restaurant/{id:int}/{slug?}", Name = "restaurantsDetails")]
        public ActionResult Details(int? id, string slug)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Restaurant restaurant = db.Restaurants.Find(id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }

            if (restaurant.Slug != slug)
            {
                return RedirectToRoute("restaurantsDetails", new { id = restaurant.IdRestaurant, slug = restaurant.Slug });
            }

            var panier = (PanierModel)HttpContext.Application[Session.SessionID] ?? new PanierModel();

            RestaurantDetailViewModel restaurantDetailViewModel = new RestaurantDetailViewModel();
            restaurantDetailViewModel.Restaurant = restaurant;
            restaurantDetailViewModel.Produits = restaurant.Produits.GroupBy(p => p.Categorie.Nom).ToDictionary(p => p.Key, p => p.ToList());
            restaurantDetailViewModel.Menus = restaurant.Menus.ToList();
            restaurantDetailViewModel.Panier = panier;
            restaurantDetailViewModel.UserCanOrder = true;

            if (panier.IdRestaurant != 0 && panier.QuantiteTotale > 0 && panier.IdRestaurant != id)
            {
                restaurantDetailViewModel.UserCanOrder = false;
            }

            return View(restaurantDetailViewModel);
        }

        // GET: Restaurants/Create
        public ActionResult Create()
        {
            ViewBag.IdTypeCuisine = new SelectList(db.TypeCuisines, "IdTypeCuisine", "Nom");
            return View();
        }

        // POST: Restaurants/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdRestaurant,Nom,IdTypeCuisine,Description,Budget,Adresse,Telephone,Mobile,Email,CodePostal,Ville,Login,Password")] Restaurant restaurant)
        {
            if (ModelState.IsValid)
            {
                db.Restaurants.Add(restaurant);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdTypeCuisine = new SelectList(db.TypeCuisines, "IdTypeCuisine", "Nom", restaurant.IdTypeCuisine);
            return View(restaurant);
        }

        // GET: Restaurants/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Restaurant restaurant = db.Restaurants.Find(id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdTypeCuisine = new SelectList(db.TypeCuisines, "IdTypeCuisine", "Nom", restaurant.IdTypeCuisine);
            return View(restaurant);
        }

        // POST: Restaurants/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdRestaurant,Nom,IdTypeCuisine,Description,Budget,Adresse,Telephone,Mobile,Email,CodePostal,Ville,Login,Password")] Restaurant restaurant)
        {
            if (ModelState.IsValid)
            {
                db.Entry(restaurant).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdTypeCuisine = new SelectList(db.TypeCuisines, "IdTypeCuisine", "Nom", restaurant.IdTypeCuisine);
            return View(restaurant);
        }

        // GET: Restaurants/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Restaurant restaurant = db.Restaurants.Find(id);
            if (restaurant == null)
            {
                return HttpNotFound();
            }
            return View(restaurant);
        }

        // POST: Restaurants/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Restaurant restaurant = db.Restaurants.Find(id);
            db.Restaurants.Remove(restaurant);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
