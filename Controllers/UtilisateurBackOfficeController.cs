using AfpEat.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Security.Claims;
using System.Web.Mvc;

namespace AfpEat.Controllers
{
    public class UtilisateurBackOfficeController : Controller
    {
        private AfpEatEntities db = new AfpEatEntities();

        // GET: mes-commandes
        [Authorize(Roles = "Utilisateur")]
        [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
        [Route("~/mes-commandes", Name = "MesCommandes")]
        public ActionResult MesCommandes()
        {
            var identity = (CustomIdentity)User.Identity;
            int id = identity.Utilisateur.IdUtilisateur;

            List<Commande> commandes = db.Commandes.Include(c => c.CommandeProduits).Where(c => c.IdUtilisateur == id).ToList();

            return View(commandes);
        }
    }
}