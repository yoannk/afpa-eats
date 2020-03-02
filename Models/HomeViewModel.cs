using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AfpEat.Models
{
    public class HomeViewModel
    {
        public List<Restaurant> Restaurants { get; set; }
        public List<TypeCuisine> TypeCuisines { get; set; }
        public int CurrentPage { get; set; }
        public int itemsPerPage = 10;
    }
}