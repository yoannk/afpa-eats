﻿namespace AfpEat.Models
{
    public abstract class ItemPanier
    {
        public int IdRestaurant { get; set; }
        public string Nom { get; set; }
        public string Description { get; set; }
        public string Photo { get; set; }
        public decimal Prix { get; set; }
        public int Quantite { get; set; }

        public virtual int GetIdProduit()
        {
            return 0;
        }

        public virtual int GetIdMenu()
        {
            return 0;
        }
    }
}