using AfpEat.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AfpEat.Controllers
{
    public class SecurityController : Controller
    {
        private AfpEatEntities db = new AfpEatEntities();

        // GET: Connexion
        public ActionResult Connexion()
        {
            return View();
        }

        // POST: Connexion
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Connexion([Bind(Include = "Login,Password")] ConnexionViewModel connexionViewModel)
        {
            string login = connexionViewModel.Login;
            string password = connexionViewModel.Password;

            if (!String.IsNullOrWhiteSpace(login) && !String.IsNullOrWhiteSpace(password))
            {
                Utilisateur utilisateur = db.Utilisateurs.FirstOrDefault(u => u.Matricule == login && u.Password == password);

                if (utilisateur != null)
                {
                    utilisateur.IdSession = Session.SessionID;
                    db.SaveChanges();

                    Session["Utilisateur"] = utilisateur;
                    return RedirectToAction("Index", "Home");
                }
            }

            return View(connexionViewModel);
        }

        // GET: Inscription
        public ActionResult Inscription()
        {
            return View();
        }

        // GET: Deconnexion
        public ActionResult Deconnexion()
        {
            Session["Utilisateur"] = null;

            return RedirectToAction("Index", "Home");
        }
    }
}