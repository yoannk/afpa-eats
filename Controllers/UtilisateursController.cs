﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Security;
using AfpEat;
using AfpEat.Models;

namespace AfpEat.Controllers
{
    public class UtilisateursController : BaseController
    {
        private AfpEatEntities db = new AfpEatEntities();

        // GET: Utilisateurs
        public ActionResult Index()
        {
            return View(db.Utilisateurs.ToList());
        }

        // GET: Utilisateurs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Utilisateur utilisateur = db.Utilisateurs.Find(id);
            if (utilisateur == null)
            {
                return HttpNotFound();
            }
            return View(utilisateur);
        }

        // GET: Utilisateurs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Utilisateurs/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdUtilisateur,Nom,Prenom,Matricule,Password,Statut,Solde")] Utilisateur utilisateur)
        {
            if (ModelState.IsValid)
            {
                db.Utilisateurs.Add(utilisateur);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(utilisateur);
        }

        // GET: Utilisateurs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Utilisateur utilisateur = db.Utilisateurs.Find(id);
            if (utilisateur == null)
            {
                return HttpNotFound();
            }
            return View(utilisateur);
        }

        // POST: Utilisateurs/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdUtilisateur,Nom,Prenom,Matricule,Password,Statut,Solde")] Utilisateur utilisateur)
        {
            if (ModelState.IsValid)
            {
                db.Entry(utilisateur).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(utilisateur);
        }

        // GET: Utilisateurs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Utilisateur utilisateur = db.Utilisateurs.Find(id);
            if (utilisateur == null)
            {
                return HttpNotFound();
            }
            return View(utilisateur);
        }

        // POST: Utilisateurs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Utilisateur utilisateur = db.Utilisateurs.Find(id);
            db.Utilisateurs.Remove(utilisateur);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: connexion
        [Route("~/connexion")]
        public ActionResult Connexion()
        {
            return View(new ConnexionViewModel());
        }

        // POST: connexion
        [HttpPost]
        [Route("~/connexion")]
        [ValidateAntiForgeryToken]
        public ActionResult Connexion([Bind(Include = "Login,Password")] ConnexionViewModel connexionViewModel, string returnUrl)
        {
            string login = connexionViewModel.Login;
            string password = connexionViewModel.Password;

            if (string.IsNullOrWhiteSpace(login) || string.IsNullOrWhiteSpace(password))
            {
                connexionViewModel.ErrorMessage = "Veuillez saisir un matricule et un mot de passe";
                return View(connexionViewModel);
            }

            Utilisateur utilisateur = db.Utilisateurs.FirstOrDefault(u => u.Matricule == login);
            bool passwordValid = Crypto.VerifyHashedPassword(utilisateur.Password, password);

            if (utilisateur == null || !passwordValid)
            {
                connexionViewModel.ErrorMessage = "Mot de passe incorrect";
                return View(connexionViewModel);
            }


            utilisateur.IdSession = Session.SessionID;
            FormsAuthentication.SetAuthCookie(utilisateur.IdUtilisateur.ToString(), false);
            db.SaveChanges();

            Session["Utilisateur"] = utilisateur;

            PanierModel panier = (PanierModel)HttpContext.Application[Session.SessionID] ?? new PanierModel();

            if (!string.IsNullOrWhiteSpace(returnUrl) && Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        // GET: deconnexion
        [Route("~/deconnexion")]
        public ActionResult Deconnexion()
        {
            Session["Utilisateur"] = null;
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }

        // GET: mes-commandes
        [Authorize]
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        [Route("~/mes-commandes", Name = "MesCommandes")]
        public ActionResult MesCommandes()
        {
            Utilisateur utilisateur = (Utilisateur)Session["Utilisateur"];
            if (utilisateur == null)
            {
                return RedirectToAction("Connexion", "Utilisateurs");
            }

            List<Commande> commandes = db.Commandes.Where(c => c.IdUtilisateur == utilisateur.IdUtilisateur).ToList();

            return View(commandes);
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
