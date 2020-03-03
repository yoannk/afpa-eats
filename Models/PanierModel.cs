using System;
using System.Collections.Generic;
using System.Linq;

namespace AfpEat.Models
{
    public class PanierModel : List<ItemPanier>
    {
        public int QuantiteTotale { get; private set; }
        public decimal Montant { get; private set; }
        public string PrixFormat { get; private set; }

        public int AddItem(ItemPanier item)
        {
            var itemPanier = this.FirstOrDefault(i => i.GetIdProduit() == item.GetIdProduit());
            int idItemPanier = 0;

            if (item is ProduitPanier || item is ProduitComposePanier)
            {
                idItemPanier = item.GetIdProduit();
            }
            else if(item is MenuPanier)
            {
                idItemPanier = item.GetIdMenu();
            }

            if (itemPanier != null)
            {
                itemPanier.Quantite++;
            }
            else
            {
                this.Add(item);
            }

            QuantiteTotale++;
            Montant += item.Prix;
            PrixFormat = FormatPrix(Montant);

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
            PrixFormat = FormatPrix(Montant);

            return itemPanier.Quantite;
        }

        private string FormatPrix(decimal prix)
        {
            return string.Format(System.Globalization.CultureInfo.GetCultureInfo("fr-FR"), "{0:0.00}", prix);
        }

    }
}