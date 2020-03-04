using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AfpEat.Models
{
    public class RestaurantDetailViewModel
    {
        public Restaurant Restaurant { get; set; }
        public Dictionary<string, List<Produit>> Produits { get; set; }
        public PanierModel Panier { get; set; }
    }
}