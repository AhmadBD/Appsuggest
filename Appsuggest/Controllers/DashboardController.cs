using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Appsuggest.Controllers
{
    public class DashboardController : Controller
    {
        public ActionResult Index()
        {
            return RedirectToAction("Index","Apps");
        }

    }
}