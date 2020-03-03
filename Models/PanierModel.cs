using System.Collections.Generic;
using System.Linq;

namespace AfpEat.Models
{
    public class PanierModel : List<ItemPanier>
    {
        public int QuantiteTotale { get; private set; }
        public decimal Montant { get; private set; }
        public string PrixFormat { get; private set; }

        public int AddItem(ItemPanier itemPanier)
        {
            var itemInPanier = this.FirstOrDefault(i => i.GetIdProduit() == itemPanier.GetIdProduit());

            if (itemInPanier != null)
            {
                itemInPanier.Quantite++;
            }
            else
            {
                this.Add(itemPanier);
            }

            QuantiteTotale++;
            Montant += itemPanier.Prix;
            PrixFormat = FormatPrix(Montant);

            return itemInPanier == null ? 1 : itemInPanier.Quantite;
        }

        public int RemoveItem(ItemPanier itemPanier)
        {
            var itemInPanier = this.FirstOrDefault(i => i.GetIdProduit() == itemPanier.GetIdProduit());

            if (itemInPanier == null)
            {
                return 0;
            }
            else if (itemInPanier.Quantite == 1)
            {
                itemInPanier.Quantite--;
                this.Remove(itemInPanier);
            }
            else
            {
                itemInPanier.Quantite--;
            }

            QuantiteTotale--;
            Montant -= itemPanier.Prix;
            PrixFormat = FormatPrix(Montant);

            return itemInPanier.Quantite;
        }

        private string FormatPrix(decimal prix)
        {
            return string.Format(System.Globalization.CultureInfo.GetCultureInfo("fr-FR"), "{0:0.00}", prix);
        }

    }
}