namespace AfpEat.Models
{
    public class ProduitPanier : ItemPanier
    {
        public int IdProduit { get; set; }
        public override int GetIdProduit()
        {
            return IdProduit;
        }
    }
}