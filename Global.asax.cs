using AfpEat.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;

namespace AfpEat
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            /*AfpEatEntities db = new AfpEatEntities();
            List<SessionUtilisateur> sessionUtilisateurs = db.SessionUtilisateurs.ToList();

            db.SessionUtilisateurs.RemoveRange(sessionUtilisateurs);
            db.SaveChanges();*/
        }

        protected void Application_End()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
        }

        protected void Application_PostAuthenticateRequest(Object sender, EventArgs e)
        {
            if (FormsAuthentication.CookiesSupported == true)
            {
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {

                    string login = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;
                    string[] roles = {};

                    using (var db = new AfpEatEntities())
                    {
                        Utilisateur utilisateur = db.Utilisateurs.SingleOrDefault(u => u.Login == login);

                        roles = utilisateur.Roles.Select(r => r.Nom).ToArray();

                        CustomIdentity customIdentity = new CustomIdentity(utilisateur, "Forms");

                        HttpContext.Current.User = new GenericPrincipal(customIdentity, roles);
                    }
                }
            }
        }

        protected void Session_Start()
        {
            /*AfpEatEntities db = new AfpEatEntities();

            var sessionUtilisateur = db.SessionUtilisateurs.FirstOrDefault(s => s.IdSession == Session.SessionID);

            sessionUtilisateur = new SessionUtilisateur();
            sessionUtilisateur.IdSession = Session.SessionID;
            sessionUtilisateur.DateSession = DateTime.Now;

            db.SessionUtilisateurs.Add(sessionUtilisateur);
            db.SaveChanges();*/
        }

        protected void Session_End()
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            /*AfpEatEntities db = new AfpEatEntities();

            SessionUtilisateur sessionUtilisateur = db.SessionUtilisateurs.Find(Session.SessionID);
            db.SessionUtilisateurs.Remove(sessionUtilisateur);
            db.SaveChanges();

            Session["Utilisateur"] = null;
            FormsAuthentication.SignOut();*/
        }

        protected void Application_BeginRequest()
        {

        }
    }
}
