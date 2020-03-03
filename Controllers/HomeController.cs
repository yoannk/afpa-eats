using AfpEat.Models;
using AfpEat.Utilities;
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

        public ActionResult Index(int page = 1)
        {
            HomeViewModel homeViewModel = new HomeViewModel();
            var restaurants = db.Restaurants.OrderBy(r => r.Budget);
            int pageSize = Constants.RestaurantsParPage;

            int totalPages = (int)Math.Ceiling(restaurants.Count() / (double)pageSize);


            if (page < 1)
            {
                page = 1;
            }

            if (page > totalPages)
            {
                page = totalPages;
            }


            homeViewModel.TypeCuisines = db.TypeCuisines.ToList();
            homeViewModel.PaginatedRestaurants = restaurants.Skip((page - 1) * pageSize).Take(pageSize).ToList();
            homeViewModel.PageIndex = page;
            homeViewModel.TotalPages = totalPages;


            return View(homeViewModel);
        }

        public ActionResult Panier()
        {
            PanierModel panier = (PanierModel)HttpContext.Application[Session.SessionID] ?? new PanierModel();

            return View(panier);
        }

        public ActionResult PanierAjax()
        {
            return View();
        }
    }
}