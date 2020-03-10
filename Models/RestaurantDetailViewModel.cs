using System.Collections.Generic;

namespace AfpEat.Models
{
    public class RestaurantDetailViewModel
    {
        public Restaurant Restaurant { get; set; }
        public Dictionary<string, List<Produit>> Produits { get; set; }
        public List<Menu> Menus { get; set; }
        public PanierModel Panier { get; set; }
        public bool UserCanOrder { get; set; }
    }
}