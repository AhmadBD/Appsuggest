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
            if(!ModelState.IsValid)
                return View(loginModel);    
            using (var context = new appsuggestEntities1())
            {
                var usr = context.Users.Where(u => u.Email == loginModel.Email).FirstOrDefault();
                if(usr == null ||  !SecurePasswordHasher.Verify(loginModel.Password,usr.Password))
                {
                    ModelState.AddModelError("", "E-posta yada şifre yanlıştır");
                    return View(loginModel);
                }
                Session["UserId"] = usr.Id.ToString();
                Session["UserName"] = usr.FirstName+" "+usr.LastName;
                Session["UserEmail"] = usr.Email;
                Session["IsAdmin"] = usr.IsAdmin.ToString();
                if (ViewBag.returnUrl != null)
                    return Redirect(ViewBag.returnUrl);
                if(usr.IsAdmin)
                    return RedirectToAction("Index","Dashboard");
                return RedirectToAction("Index", "Home");
            }
           
        } 
       // GET: Logout
        public ActionResult Logout()
        {
            if (Session["UserId"] != null)
            {
                Session.Remove("UserId");
                Session.Remove("UserName");
                Session.Remove("UserEmail");
                Session.Remove("IsAdmin");
            }
            return RedirectToAction("Login");
        }
        
        public List<SelectListItem> GetStateList()
        {
            using (var context = new appsuggestEntities1())
            {
                return context.States.Select(x =>
                new SelectListItem { Text = x.Name, Value = x.Id.ToString() }).ToList();
            }
        }
        // GET: Register
        public ActionResult Register(string returnUrl = null)
        {
            if (Session["UserId"] != null)
                return RedirectToAction("Index", "Home");
            ViewBag.returnUrl = returnUrl;
            ViewBag.StateList = GetStateList();
            return View(new RegisterModel());
        }
        [HttpPost]
        public ActionResult Register(RegisterModel registerModel)
        {
            if (!ModelState.IsValid)
                return View(registerModel);
            using (var context = new appsuggestEntities1())
            {
                var usr = context.Users.Where(u => u.Email == registerModel.Email).FirstOrDefault();
                if(usr != null )
                {
                    ModelState.AddModelError("Email", "E-posta başka bir hesap tarafından kullanılmıştır");
                    return View(registerModel);
                }
                usr = new User()
                {
                    Email = registerModel.Email,
                    Password = SecurePasswordHasher.Hash(registerModel.Password),
                    FirstName = registerModel.FirstName,
                    LastName = registerModel.LastName,
                    Phone = registerModel.Phone,
                    CityId = registerModel.CityId,
                    IsAdmin = false
                };
                context.Users.Add(usr);
                context.SaveChanges();
                Session["UserId"] = usr.Id.ToString();
                Session["UserName"] = usr.FirstName+" "+usr.LastName;
                Session["UserEmail"] = usr.Email;
                Session["IsAdmin"] = usr.IsAdmin.ToString();
                if (ViewBag.returnUrl != null)
                    return Redirect(ViewBag.returnUrl);
                if(usr.IsAdmin)
                    return RedirectToAction("Index","Dashboard");
                return RedirectToAction("Index", "Home");
            }
           
        } 
       
    }
}