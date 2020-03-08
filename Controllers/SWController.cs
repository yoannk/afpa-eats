using AfpEat.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace AfpEat.Controllers
{
    public class SWController : Controller
    {
        private AfpEatEntities db = new AfpEatEntities();

        [HttpPost]
        public JsonResult AddProduit(int idProduit, string idSession, int quantite = 1)
        {
            SessionUtilisateur sessionUtilisateur = db.SessionUtilisateurs.Find(Session.SessionID);

            if (sessionUtilisateur == null)
            {
                return Json("Session incorrecte", JsonRequestBehavior.AllowGet);
            }

            PanierModel panier = (PanierModel)HttpContext.Application[idSession] ?? new PanierModel();

            Produit produit = db.Produits.Find(idProduit);

            if (produit == null)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json($"Produit #{idProduit} non trouvé", JsonRequestBehavior.AllowGet);
            }

            if (produit.Quantite <= 0)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json($"Produit #{idProduit} indisponible", JsonRequestBehavior.AllowGet);
            }

            if (panier.IdRestaurant != 0 && panier.QuantiteTotale > 0 && panier.IdRestaurant != produit.IdRestaurant)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json("Impossible d'ajouter au panier un produit d'un autre restaurant", JsonRequestBehavior.AllowGet);
            }

            ProduitPanier produitPanier = CreateProduitPanier(produit, quantite);

            panier.IdRestaurant = produit.IdRestaurant;
            int quantiteProduit = panier.AddItem(produitPanier);
            HttpContext.Application[idSession] = panier;

            var data = new
            {
                quantiteProduit,
                quantiteTotale = panier.QuantiteTotale,
                prixTotal = panier.Montant,
                prixTotalFormat = string.Format(CultureInfo.GetCultureInfo("fr-FR"), "{0:0.00}", panier.Montant)
            };

            return Json(data, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult RemoveProduit(int idProduit, string idSession)
        {
            SessionUtilisateur sessionUtilisateur = db.SessionUtilisateurs.Find(Session.SessionID);

            if (sessionUtilisateur == null)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json("Session incorrecte", JsonRequestBehavior.AllowGet);
            }

            PanierModel panier = (PanierModel)HttpContext.Application[idSession] ?? new PanierModel();
            Produit produit = db.Produits.Find(idProduit);

            if (produit == null)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json($"Produit #{idProduit} non trouvé", JsonRequestBehavior.AllowGet);
            }

            ProduitPanier produitPanier = CreateProduitPanier(produit);

            int quantiteProduit = panier.RemoveItem(produitPanier);
            HttpContext.Application[idSession] = panier;

            var data = new
            {
                quantiteProduit,
                quantiteTotale = panier.QuantiteTotale,
                prixTotal = panier.Montant,
                prixTotalFormat = String.Format(CultureInfo.GetCultureInfo("fr-FR"), "{0:0.00}", panier.Montant)
            };

            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public JsonResult AddMenu(int idMenu, List<int> idProduits, string idSession)
        {
            SessionUtilisateur sessionUtilisateur = db.SessionUtilisateurs.Find(Session.SessionID);
            PanierModel panier = (PanierModel)HttpContext.Application[idSession] ?? new PanierModel();

            if (sessionUtilisateur == null)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json("Session incorrecte", JsonRequestBehavior.AllowGet);
            }

            Menu menu = db.Menus.Find(idMenu);

            if (menu == null)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json($"Menu #{idMenu} non trouvé", JsonRequestBehavior.AllowGet);
            }

            MenuPanier menuPanier = new MenuPanier();
            menuPanier.IdMenu = idMenu;
            menuPanier.Quantite = 1;
            menuPanier.IdRestaurant = menu.IdRestaurant;

            foreach (int idProduit in idProduits)
            {
                Produit produit = db.Produits.Find(idProduit);
                if (produit == null)
                {
                    Response.StatusCode = (int)HttpStatusCode.BadRequest;
                    return Json($"Produit #{idProduit} non trouvé", JsonRequestBehavior.AllowGet);
                }

                ProduitPanier produitPanier = CreateProduitPanier(produit);
                menuPanier.Produits.Add(produitPanier);
                menuPanier.Quantite++;

                panier.AddItem(menuPanier);
            }

            HttpContext.Application[idSession] = panier;

            var data = new
            {
                quantiteProduit = menuPanier.Quantite,
                quantiteTotale = panier.QuantiteTotale,
                prixTotal = panier.Montant,
                prixTotalFormat = string.Format(CultureInfo.GetCultureInfo("fr-FR"), "{0:0.00}", panier.Montant)
            };

            return Json(data, JsonRequestBehavior.AllowGet);
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
            PanierModel panier = (PanierModel)HttpContext.Application[idSession] ?? new PanierModel();

            Utilisateur utilisateur = db.Utilisateurs.FirstOrDefault(u => u.IdSession == idSession);

            if (utilisateur == null)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json("Utilisateur non trouvé.", JsonRequestBehavior.AllowGet);
            }

            if (panier.Count == 0)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json("Votre panier est vide.", JsonRequestBehavior.AllowGet);
            }

            if (panier.Montant > utilisateur.Solde || utilisateur.Solde <= 0)
            {
                Response.StatusCode = (int)HttpStatusCode.BadRequest;
                return Json("Votre solde est insuffisant.", JsonRequestBehavior.AllowGet);
            }


            foreach (ItemPanier itemPanier in panier)
            {

                /*if (itemPanier is ProduitPanier produitPanier)
                {
                    
                }*/
            }

            utilisateur.Solde -= panier.Montant;


            Commande commande = new Commande()
            {
                IdUtilisateur = utilisateur.IdUtilisateur,
                IdRestaurant = panier.IdRestaurant,
                Date = DateTime.Now,
                Prix = panier.Montant,
                IdEtatCommande = 1
            };

            foreach (ProduitPanier produitPanier in panier)
            {
                CommandeProduit commandeProduit = new CommandeProduit()
                {
                    IdCommande = commande.IdCommande,
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

                return Json("ok", JsonRequestBehavior.AllowGet);
            }

            Response.StatusCode = (int)HttpStatusCode.BadRequest;
            return Json("Erreur de connexion", JsonRequestBehavior.AllowGet);
        }

        private ProduitPanier CreateProduitPanier(Produit produit, int quantite = 1)
        {
            var produitPanier = new ProduitPanier()
            {
                IdProduit = produit.IdProduit,
                IdRestaurant = produit.IdRestaurant,
                Nom = produit.Nom,
                Description = produit.Description,
                Quantite = quantite,
                Prix = produit.Prix,
                Photo = produit.Photos.FirstOrDefault()?.Nom ?? "DefaultProduit.jpg"
            };

            return produitPanier;
        }
    }
}