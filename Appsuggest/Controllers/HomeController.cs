using Appsuggest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Appsuggest.Controllers
{
    public class HomeController : Controller
    {
        private appsuggestEntities1 db = new appsuggestEntities1();

        public ActionResult Index(HomeSearchViewModel homeSearchViewModel = null)
        {
            IQueryable<App> apps = db.Apps;
            if (homeSearchViewModel != null)
            {
                apps = apps.Where(a => homeSearchViewModel.AppTypeId == null || a.AppTypeId == homeSearchViewModel.AppTypeId)
                    .Where(a => homeSearchViewModel.AppPlatformId == null || a.AppPlatformId == homeSearchViewModel.AppPlatformId)
                    .Where(a => homeSearchViewModel.ProviderId == null || a.ProviderId == homeSearchViewModel.ProviderId)
                    .Where(a => homeSearchViewModel.Search == null ||(
                    a.Name.Contains(homeSearchViewModel.Search) || 
                    a.Description.Contains(homeSearchViewModel.Search) || 
                    a.Tags.Contains(homeSearchViewModel.Search)));
            }
            else { homeSearchViewModel = new HomeSearchViewModel(); }
                homeSearchViewModel.Apps = apps.Take(12).ToList();
                homeSearchViewModel.AppPlatformList = GetAppPlatformList();
                homeSearchViewModel.AppTypeList = GetAppTypeList();
                homeSearchViewModel.ProviderList = GetProviderList();
            
            return View(homeSearchViewModel);
        }
        public List<SelectListItem> GetAppTypeList()
        {
            return db.AppTypes.Select(x =>
            new SelectListItem { Text = x.Name, Value = x.Id.ToString() }).ToList();
        } 
        public List<SelectListItem> GetAppPlatformList()
        {
            return db.AppPlatforms.Select(x =>
           new SelectListItem { Text = x.Name, Value = x.Id.ToString() }).ToList();
        }
        public List<SelectListItem> GetProviderList()
        {
            return db.Providers.Select(x =>
           new SelectListItem { Text = x.Name, Value = x.Id.ToString() }).ToList();
        }
       
        public JsonResult GetCityList(int id)
        {
            return Json(db.States.Find(id).Cities.Select(x =>
            new SelectListItem { Text = x.Name, Value = x.Id.ToString() }),
            JsonRequestBehavior.AllowGet);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}