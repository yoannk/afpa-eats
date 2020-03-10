using System.Collections.Generic;

namespace AfpEat.Models
{
    public class HomeViewModel
    {
        public List<Restaurant> PaginatedRestaurants { get; set; }
        public List<TypeCuisine> TypeCuisines { get; set; }
        public int PageIndex { get; set; }
        public int TotalPages { get; set; }

        public bool HasPrevious()
        {
            return PageIndex > 1;
        }

        public bool HasNext()
        {
            return PageIndex < TotalPages;
        }
    }
}