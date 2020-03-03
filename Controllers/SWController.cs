﻿using AfpEat.Models;
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

            if (sessionUtilisateur == null)
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }

            PanierModel panier = (PanierModel)HttpContext.Application[idSession] ?? new PanierModel();
            // TODO check if produit exists and stock > 1
            Produit produit = db.Produits.Find(idProduit);

            var produitPanier = new ProduitPanier()
            {
                IdProduit = produit.IdProduit,
                IdRestaurant = produit.IdRestaurant,
                Nom = produit.Nom,
                Description = produit.Description,
                Quantite = 1,
                Prix = produit.Prix,
                Photo = produit.Photos.FirstOrDefault()?.Nom ?? "default.jpg"
            };

            int quantiteProduit = panier.AddItem(produitPanier);
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

        [HttpPost]
        public JsonResult RemoveProduit(int idProduit, string idSession)
        {
            SessionUtilisateur sessionUtilisateur = db.SessionUtilisateurs.Find(Session.SessionID);

            if (sessionUtilisateur == null)
            {
                return Json(0, JsonRequestBehavior.AllowGet);
            }

            PanierModel panier = (PanierModel)HttpContext.Application[idSession] ?? new PanierModel();
            Produit produit = db.Produits.Find(idProduit);

            var produitPanier = new ProduitPanier()
            {
                IdProduit = produit.IdProduit,
                IdRestaurant = produit.IdRestaurant,
                Nom = produit.Nom,
                Description = produit.Description,
                Quantite = 1,
                Prix = produit.Prix,
                Photo = produit.Photos.FirstOrDefault()?.Nom ?? "default.jpg"
            };

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