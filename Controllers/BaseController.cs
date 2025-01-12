﻿using AfpEat.Utilities;
using System.Globalization;
using System.Web.Mvc;

namespace AfpEat.Controllers
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