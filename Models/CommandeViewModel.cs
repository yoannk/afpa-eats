using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AfpEat.Models
{
    public class CommandeViewModel
    {
        public List<Produit> produitsDisponible { get; set; }
        public List<ProduitPanier> Panier { get; set; }
    }
}