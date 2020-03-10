using System.Linq;
using System.Security.Principal;

namespace AfpEat.Models
{
    public class CustomIdentity : GenericIdentity
    {
        public CustomIdentity(Utilisateur utilisateur, string type) : base(utilisateur.Login, type)
        {
            IdUtilisateur = utilisateur.IdUtilisateur;
            Nom = utilisateur.Nom;
            Prenom = utilisateur.Prenom;
            Login = utilisateur.Login;
            Solde = utilisateur.Solde;
            Roles = utilisateur.Roles.Select(r => r.Nom).ToArray();
        }
        public int IdUtilisateur { get; private set; }
        public string Nom { get; private set; }
        public string Prenom { get; private set; }
        public string Login { get; private set; }
        public decimal Solde { get; private set; }
        public string[] Roles { get; private set; }
    }
}