using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace AfpEat
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Connexion",
                url: "connexion",
                defaults: new { controller = "Security", action = "Connexion" }
            );

            routes.MapRoute(
                name: "Inscription",
                url: "inscription",
                defaults: new { controller = "Security", action = "Inscription" }
            );

            routes.MapRoute(
                name: "Deconnexion",
                url: "deconnexion",
                defaults: new { controller = "Security", action = "Deconnexion" }
            );

            routes.MapRoute(
                name: "DetailProduit",
                url: "produit/{nom}/{id}",
                defaults: new { controller = "Produits", action = "Details" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
