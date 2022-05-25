using Appsuggest.Helpers;
using Appsuggest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Appsuggest.Controllers
{
    public class LoginController : Controller
    {
        const string UserId = "UserId";
        // GET: Login
        public ActionResult Login(string returnUrl = null)
        {
            if (Session["UserId"] != null)
                return RedirectToAction("Index", "Home");
            ViewBag.returnUrl = returnUrl;
            return View(new LoginModel());
        }
        [HttpPost]
        public ActionResult Login(LoginModel loginModel)
        {
            using (var context = new appsuggestEntities1())
            {
                var usr = context.Users.Where(u => u.Email == loginModel.Email).FirstOrDefault();
                if(usr == null ||  SecurePasswordHasher.Verify(loginModel.Password,usr.Password))
                {
                    ModelState.AddModelError(null, "E-posta yada şifre yanlıştır");
                    return View(loginModel);
                }
                Session["UserId"] = usr.Id.ToString();
                Session["UserName"] = usr.FirstName+" "+usr.LastName;
                Session["UserEmail"] = usr.Email;
                if (ViewBag.returnUrl != null)
                    return Redirect(ViewBag.returnUrl);
                if(usr.IsAdmin)
                    return RedirectToAction("Index","Dashboard");
                return RedirectToAction("Index", "Home");
            }
           
        } 
       // GET: Login
        public ActionResult Register(string returnUrl = null)
        {
            if (Session["UserId"] != null)
                return RedirectToAction("Index", "Home");
            ViewBag.returnUrl = returnUrl;
            return View(new RegisterModel());
        }
        [HttpPost]
        public ActionResult Register(RegisterModel registerModel)
        {
            using (var context = new appsuggestEntities1())
            {
                var usr = context.Users.Where(u => u.Email == registerModel.Email).FirstOrDefault();
                if(usr != null )
                {
                    ModelState.AddModelError("Email", "E-posta başka bir hesap tarafından kullanılmıştır");
                    return View(registerModel);
                }//todo continue here
                Session["UserId"] = usr.Id.ToString();
                Session["UserName"] = usr.FirstName+" "+usr.LastName;
                Session["UserEmail"] = usr.Email;
                if (ViewBag.returnUrl != null)
                    return Redirect(ViewBag.returnUrl);
                if(usr.IsAdmin)
                    return RedirectToAction("Index","Dashboard");
                return RedirectToAction("Index", "Home");
            }
           
        } 
       
    }
}