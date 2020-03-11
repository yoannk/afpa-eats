using AfpEat.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using System.Web.Security;

namespace AfpEat.Controllers
{
    public class SecurityController : Controller
    {
        private AfpEatEntities db = new AfpEatEntities();

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
                connexionViewModel.ErrorMessage = "Veuillez saisir un login et mot de passe";
                return View(connexionViewModel);
            }

            Utilisateur utilisateur = db.Utilisateurs.FirstOrDefault(u => u.Login == login);

            if (utilisateur == null || !Crypto.VerifyHashedPassword(utilisateur.Password, password))
            {
                connexionViewModel.ErrorMessage = "Identifiants incorrects";
                return View(connexionViewModel);
            }

            //utilisateur.IdSession = Session.SessionID;
            //db.SaveChanges();
            //Session["Utilisateur"] = utilisateur;

            // Efface panier si un autre utilisateur était connecté
            if (User.Identity.IsAuthenticated)
            {
                HttpContext.Application[Session.SessionID] = null;
            }


            FormsAuthentication.SetAuthCookie(utilisateur.Login, false);

            if (!string.IsNullOrWhiteSpace(returnUrl) && Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }


            foreach (var role in utilisateur.Roles)
            {
                if (role.Nom == "Admin") return RedirectToAction("Index", "AdminBackOffice");
                if (role.Nom == "Restaurateur") return RedirectToAction("Index", "RestaurateurBackOffice");
                if (role.Nom == "Utilisateur") return RedirectToAction("Index", "Home");
            }

            return RedirectToAction("Index", "Home");
        }

        // GET: deconnexion
        [Route("~/deconnexion")]
        public ActionResult Deconnexion()
        {
            HttpContext.Application[Session.SessionID] = null;
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }
    }
}