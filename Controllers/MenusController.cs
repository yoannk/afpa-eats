﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AfpEat;

namespace AfpEat.Controllers
{
    public class MenusController : Controller
    {
        private AfpEatEntities db = new AfpEatEntities();

        // GET: Menus
        public ActionResult Index()
        {
            var menus = db.Menus.Include(m => m.Restaurant);
            return View(menus.ToList());
        }

        // GET: Menus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            //Liste des produits du restaurant
            var produits = db.Produits.Where(p => p.IdRestaurant == menu.IdRestaurant).ToList();
            //Parcourir les categories du menu id
            foreach (var categorie in menu.Categories)
            {
                List<Produit> ProduitsCategorie = produits.Where(p => p.IdCategorie == categorie.IdCategorie).ToList();
                //Creation d'une DDL vide
                List<SelectListItem> items = new List<SelectListItem>();
                //Pour chaque produit, on ajoute un option dans la DDL
                foreach (Produit produit in ProduitsCategorie)
                {
                    items.Add(new SelectListItem { Text = produit.Nom, Value = produit.IdProduit.ToString() });
                }
                //
                ViewData["cat" + categorie.IdCategorie] = items;
            }

            return View(menu);
        }

        // GET: Menus/Create
        public ActionResult Create()
        {
            ViewBag.IdRestaurant = new SelectList(db.Restaurants, "IdRestaurant", "Nom");
            return View();
        }

        // POST: Menus/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdMenu,Nom,Statut,Prix,IdRestaurant")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                db.Menus.Add(menu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdRestaurant = new SelectList(db.Restaurants, "IdRestaurant", "Nom", menu.IdRestaurant);
            return View(menu);
        }

        // GET: Menus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdRestaurant = new SelectList(db.Restaurants, "IdRestaurant", "Nom", menu.IdRestaurant);
            return View(menu);
        }

        // POST: Menus/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdMenu,Nom,Statut,Prix,IdRestaurant")] Menu menu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(menu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdRestaurant = new SelectList(db.Restaurants, "IdRestaurant", "Nom", menu.IdRestaurant);
            return View(menu);
        }

        // GET: Menus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Menu menu = db.Menus.Find(id);
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(menu);
        }

        // POST: Menus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Menu menu = db.Menus.Find(id);
            db.Menus.Remove(menu);
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
