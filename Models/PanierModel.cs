using System;
using System.Collections.Generic;
using System.Linq;

namespace AfpEat.Models
{
    public class PanierModel : List<ItemPanier>
    {
        public int IdRestaurant { get; set; }
        public int QuantiteTotale { get; private set; }
        public decimal Montant { get; set; }
        public string PrixFormat
        {
            get => string.Format(System.Globalization.CultureInfo.GetCultureInfo("fr-FR"), "{0:0.00}", Montant);
        }

        public int AddItem(ItemPanier item)
        {
            var itemPanier = this.FirstOrDefault(i => i.GetIdProduit() == item.GetIdProduit());
            int idItemPanier = 0;

            if (item is ProduitPanier || item is ProduitComposePanier)
            {
                idItemPanier = item.GetIdProduit();
            }
            else if (item is MenuPanier)
            {
                idItemPanier = item.GetIdMenu();
            }

            if (itemPanier != null)
            {
                itemPanier.Quantite += item.Quantite;
            }
            else
            {
                this.Add(item);
            }

            QuantiteTotale += item.Quantite;
            Montant += item.Quantite * item.Prix;

            return itemPanier == null ? 1 : itemPanier.Quantite;
        }

        public int RemoveItem(ItemPanier item)
        {
            var itemPanier = this.FirstOrDefault(i => i.GetIdProduit() == item.GetIdProduit());
            int idItemPanier = 0;

            if (item is ProduitPanier || item is ProduitComposePanier)
            {
                idItemPanier = item.GetIdProduit();
            }
            else if (item is MenuPanier)
            {
                idItemPanier = item.GetIdMenu();
            }

            if (itemPanier == null)
            {
                return 0;
            }
            else if (itemPanier.Quantite == 1)
            {
                itemPanier.Quantite--;
                this.Remove(itemPanier);
            }
            else
            {
                itemPanier.Quantite--;
            }

            QuantiteTotale--;
            Montant -= item.Prix;

            return itemPanier.Quantite;
        }

        public new void Clear()
        {
            base.Clear();
            IdRestaurant = 0;
            QuantiteTotale = 0;
            Montant = 0;
        }
    }
}