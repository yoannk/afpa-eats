using System.Collections.Generic;

namespace AfpEat.Models
{
    public class MenuPanier : ItemPanier
    {
        public int IdMenu { get; set; }
        public List<ProduitPanier> Produits { get; set; } = new List<ProduitPanier>();
    }
}