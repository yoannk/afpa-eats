using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AfpEat.Models
{
    public class CommandeViewModel
    {
        public List<Produit> ProduitsDisponible { get; set; }
        public PanierModel Panier { get; set; }
    }
}