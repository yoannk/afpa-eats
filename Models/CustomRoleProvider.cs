using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace AfpEat.Models
{
    public class CustomRoleProvider : RoleProvider
    {
        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            using (var context = new AfpEatEntities())
            {
                return context.Roles.Select(r => r.Nom).ToArray();
            }
        }

        public override string[] GetRolesForUser(string username)
        {
            using (var context = new AfpEatEntities())
            {
                Utilisateur utilisateur = context.Utilisateurs.SingleOrDefault(u => u.Login == username);

                if (utilisateur == null)
                {
                    return new string[] { };
                }

                return utilisateur.Roles.Select(r => r.Nom).ToArray();
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            using (var context = new AfpEatEntities())
            {
                Utilisateur utilisateur = context.Utilisateurs.SingleOrDefault(u => u.Login == username);

                if (utilisateur == null)
                {
                    return false;
                }

                return utilisateur.Roles.Any(r => r.Nom == roleName);
            }
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}