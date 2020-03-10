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

            LoggedInUser loggedInUser = new LoggedInUser()
            {
                IdUtilisateur = utilisateur.IdUtilisateur,
                Nom = utilisateur.Nom,
                Prenom = utilisateur.Prenom,
                Login = utilisateur.Login,
                Role = utilisateur.Role.Nom
            };

            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1,                              	                            // version
                utilisateur.Login,       	  		                            // user name
                DateTime.Now,                   	                            // issue time
                DateTime.Now.AddMinutes(30),       	                            // expires soon
                false, 				            	                            // persist cookie
                JsonConvert.SerializeObject(loggedInUser ?? new LoggedInUser()) // data
            );

            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(ticket));
            Response.Cookies.Add(cookie);

            //FormsAuthentication.SetAuthCookie(utilisateur.IdUtilisateur.ToString(), false);

            if (!string.IsNullOrWhiteSpace(returnUrl) && Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }

            switch (utilisateur.Role.Nom)
            {
                case "Utilisateur":
                    return RedirectToAction("Index", "Home");
                case "Restaurateur":
                    return RedirectToAction("Index", "RestaurateurBackOffice");
                case "Admin":
                    return RedirectToAction("Index", "AdminBackOffice");
                default:
                    return RedirectToAction("Index", "Home");
            }
        }

        // GET: deconnexion
        [Route("~/deconnexion")]
        public ActionResult Deconnexion()
        {
            //Session["Utilisateur"] = null;
            FormsAuthentication.SignOut();

            return RedirectToAction("Index", "Home");
        }
    }
}