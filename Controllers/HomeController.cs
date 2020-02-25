using AfpEat.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AfpEat.Controllers
{
    public class HomeController : Controller
    {
        private AfpEatEntities db = new AfpEatEntities();

        public ActionResult Index()
        {
            HomeViewModel homeViewModel = new HomeViewModel();

            homeViewModel.Restaurants = db.Restaurants.ToList();
            homeViewModel.TypeCuisines = db.TypeCuisines.ToList();

            return View(homeViewModel);
        }

        public ActionResult Panier()
        {
            List<ProduitPanier> panier = (List<ProduitPanier>)HttpContext.Application[Session.SessionID];

            return View(panier);
        }

        public ActionResult PanierAjax()
        {
            return View();
        }
    }
}