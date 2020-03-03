using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AfpEat.Models
{
    public class ProduitComposePanier : ItemPanier
    {
        public List<ProduitPanier> produits { get; set; }
    }
}