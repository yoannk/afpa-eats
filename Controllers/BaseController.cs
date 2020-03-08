using AfpEat.Utilities;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Gesprog.Controllers
{
    public class BaseController : Controller
    {
        public void AddFLash(FlashMessageType type, string message)
        {
            TempData["FlashMessage"] = new FlashMessage()
            {
                Type = type,
                Message = message
            };
        }

        public string Titleize(string nom)
        {
            return new CultureInfo("fr-FR", false).TextInfo.ToTitleCase(nom.ToLower());
        }
    }
}