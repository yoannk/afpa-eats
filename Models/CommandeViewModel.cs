using System.Collections.Generic;

namespace AfpEat.Models
{
    public class CommandeViewModel
    {
        public List<Produit> ProduitsDisponible { get; set; }
        public PanierModel Panier { get; set; }
    }
}