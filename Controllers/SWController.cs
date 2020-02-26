using AfpEat.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace AfpEat.Controllers
{
    public class SWController : Controller
    {
        private AfpEatEntities db = new AfpEatEntities();

        [HttpPost]
        public JsonResult AddProduit(int idProduit, string idSession)
        {
            SessionUtilisateur sessionUtilisateur = db.SessionUtilisateurs.Find(Session.SessionID);
            int quantite = 0;
            decimal prixTotal = 0;
            string prixTotalFormat = "";

            List<ProduitPanier> panier = (List<ProduitPanier>)HttpContext.Application[idSession] ?? new List<ProduitPanier>();

            if (sessionUtilisateur != null)
            {
                Produit produit = db.Produits.First(p => p.IdProduit == idProduit);

                ProduitPanier produitPanier = new ProduitPanier()
                {
                    IdProduit = produit.IdProduit,
                    IdRestaurant = produit.IdRestaurant,
                    Nom = produit.Nom,
                    Description = produit.Description,
                    Quantite = produit.Quantite,
                    Prix = produit.Prix,
                    Photo = produit.Photos.FirstOrDefault()?.Nom ?? "default.jpg"
                };

                panier.Add(produitPanier);

                HttpContext.Application[idSession] = panier;
            }

            foreach (var item in panier)
            {
                quantite += item.Quantite;
                prixTotal += item.Prix * item.Quantite;
            }

            prixTotalFormat = String.Format(CultureInfo.GetCultureInfo("fr-FR"), "{0:0.00}", prixTotal);

            return Json(new { quantite, prixTotal, prixTotalFormat }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetProduits(string idSession)
        {
            SessionUtilisateur sessionUtilisateur = db.SessionUtilisateurs.Find(Session.SessionID);

            List<ProduitPanier> panier = (List<ProduitPanier>)HttpContext.Application[idSession] ?? new List<ProduitPanier>();

            if (sessionUtilisateur != null && panier.Count > 0)
            {
                return Json(panier, JsonRequestBehavior.AllowGet);
            }

            return Json(new EmptyResult(), JsonRequestBehavior.AllowGet);
        }

        public JsonResult SaveCommande(string idSession)
        {
            SessionUtilisateur sessionUtilisateur = db.SessionUtilisateurs.Find(Session.SessionID);
            List<ProduitPanier> panier = (List<ProduitPanier>)HttpContext.Application[idSession] ?? new List<ProduitPanier>();

            Utilisateur utilisateur = db.Utilisateurs.FirstOrDefault(u => u.IdSession == idSession);

            if (utilisateur == null)
            {
                return Json("Utilisateur non trouvé.", JsonRequestBehavior.AllowGet);
            }

            if (panier.Count == 0)
            {
                return Json("Votre panier est vide.", JsonRequestBehavior.AllowGet);
            }

            int idRestaurant = 0;
            decimal prixTotal = 0;

            foreach (ProduitPanier produitPanier in panier)
            {
                prixTotal += produitPanier.Prix * produitPanier.Quantite;
                idRestaurant = produitPanier.IdRestaurant;
            }

            if (prixTotal > utilisateur.Solde)
            {
                return Json("Votre solde est insuffisant.", JsonRequestBehavior.AllowGet);
            }

            utilisateur.Solde -= prixTotal;

            Commande commande = new Commande()
            {
                IdUtilisateur = utilisateur.IdUtilisateur,
                IdRestaurant = idRestaurant,
                Date = DateTime.Now,
                Prix = prixTotal,
                IdEtatCommande = 1
            };

            //db.Commandes.Add(commande);
            //db.SaveChanges();

            foreach (ProduitPanier produitPanier in panier)
            {
                CommandeProduit commandeProduit = new CommandeProduit()
                {
                    //IdCommande = commande.IdCommande,
                    IdProduit = produitPanier.IdProduit,
                    Prix = produitPanier.Prix,
                    Quantite = produitPanier.Quantite
                };

                commande.CommandeProduits.Add(commandeProduit);
            }

            db.Commandes.Add(commande);
            db.SaveChanges();


            return Json("Commande ajoutée avec succès", JsonRequestBehavior.AllowGet);
        }

        public JsonResult LoginUtilisateur(string idSession, string matricule, string password)
        {
            Utilisateur utilisateur = db.Utilisateurs.FirstOrDefault(u => u.Matricule == matricule && u.Password == password);

            if (utilisateur != null)
            {
                utilisateur.IdSession = idSession;
                db.SaveChanges();

                return Json(new { error = 1, message = "ok" }, JsonRequestBehavior.AllowGet);
            }

            return Json(new { error = 0, message = "Erreur de connexion" }, JsonRequestBehavior.AllowGet);
        }
    }
}