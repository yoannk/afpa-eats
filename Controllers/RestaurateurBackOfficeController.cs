using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AfpEat.Controllers
{
    public class RestaurateurBackOfficeController : Controller
    {
        // GET: Restaurateur
        [Authorize(Roles = "Restaurateur")]
        public ActionResult Index()
        {
            return View();
        }


    }
}