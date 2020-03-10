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

            AfpEatEntities db = new AfpEatEntities();
            List<SessionUtilisateur> sessionUtilisateurs = db.SessionUtilisateurs.ToList();

            db.SessionUtilisateurs.RemoveRange(sessionUtilisateurs);
            db.SaveChanges();
        }

        protected void Application_End()
        {
        }

        protected void Application_AuthenticateRequest(Object sender, EventArgs e)
        {
            /*if (HttpContext.Current.User != null)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (HttpContext.Current.User.Identity is FormsIdentity)
                    {
                        FormsIdentity fid = (FormsIdentity)Context.User.Identity;
                        FormsAuthenticationTicket t = fid.Ticket;
                        string[] roles = t.UserData.Split(';');
                        Context.User = new GenericPrincipal(fid, roles);
                    }
                }
            }*/

            //if (HttpContext.Current.User?.Identity?.Name != null && HttpContext.Current.User?.Identity is FormsIdentity identity)
            //    return JsonConvert.DeserializeObject<LoggedInUser>(identity.Ticket.UserData);

            //return new LoggedInUser();
        }

        protected void Session_Start()
        {
            AfpEatEntities db = new AfpEatEntities();

            var sessionUtilisateur = db.SessionUtilisateurs.FirstOrDefault(s => s.IdSession == Session.SessionID);

            sessionUtilisateur = new SessionUtilisateur();
            sessionUtilisateur.IdSession = Session.SessionID;
            sessionUtilisateur.DateSession = DateTime.Now;

            db.SessionUtilisateurs.Add(sessionUtilisateur);
            db.SaveChanges();
        }

        protected void Session_End()
        {
            AfpEatEntities db = new AfpEatEntities();

            SessionUtilisateur sessionUtilisateur = db.SessionUtilisateurs.Find(Session.SessionID);
            db.SessionUtilisateurs.Remove(sessionUtilisateur);
            db.SaveChanges();

            Session["Utilisateur"] = null;
            FormsAuthentication.SignOut();
        }

        protected void Application_BeginRequest()
        {

        }
    }
}
