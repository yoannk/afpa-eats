﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AfpEat.Models
{
    public class MenuPanier : ItemPanier
    {
        public int IdMenu { get; set; }
        public List<ProduitPanier> produits { get; set; }
    }
}