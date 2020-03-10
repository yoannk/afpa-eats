using AfpEat.Models;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
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
            var utilisateur = User;
            var identity = User.Identity;
            var isInRole = User.IsInRole("Utilisateur");

            //List<Commande> commandes = db.Commandes.Include(c => c.CommandeProduits).Where(c => c.IdUtilisateur == utilisateur.IdUtilisateur).ToList();
            var commandes = new List<Commande>();

            return View(commandes);
        }
    }
}