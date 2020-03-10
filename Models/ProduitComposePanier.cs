using System.Collections.Generic;

namespace AfpEat.Models
{
    public class ProduitComposePanier : ItemPanier
    {
        public int IdProduit { get; set; }
        public List<ProduitPanier> produits { get; set; }

        public override int GetIdProduit()
        {
            return IdProduit;
        }
    }
}