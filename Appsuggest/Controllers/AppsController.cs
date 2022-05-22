using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Appsuggest.Models;

namespace Appsuggest.Controllers
{
    public class AppsController : Controller
    {
        private appsuggestEntities db = new appsuggestEntities();

        // GET: Apps
        public async Task<ActionResult> Index()
        {
            var apps = db.Apps.Include(a => a.AppPlatform).Include(a => a.Image).Include(a => a.AppType).Include(a => a.Provider);
            return View(await apps.ToListAsync());
        }

        // GET: Apps/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            App app = await db.Apps.FindAsync(id);
            if (app == null)
            {
                return HttpNotFound();
            }
            return View(app);
        }

        // GET: Apps/Create
        public ActionResult Create()
        {
            ViewBag.AppPlatformId = new SelectList(db.AppPlatforms, "Id", "Name");
            ViewBag.CoverImageId = new SelectList(db.Images, "Id", "Link");
            ViewBag.AppTypeId = new SelectList(db.AppTypes, "Id", "Name");
            ViewBag.ProviderId = new SelectList(db.Providers, "Id", "Name");
            return View();
        }

        // POST: Apps/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name,Link,LogoLink,Description,CoverImageId,Tags,Version,CreationDateTime,UpdateDateTime,AppTypeId,ProviderId,AppPlatformId")] App app)
        {
            if (ModelState.IsValid)
            {
                db.Apps.Add(app);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.AppPlatformId = new SelectList(db.AppPlatforms, "Id", "Name", app.AppPlatformId);
            ViewBag.CoverImageId = new SelectList(db.Images, "Id", "Link", app.CoverImageId);
            ViewBag.AppTypeId = new SelectList(db.AppTypes, "Id", "Name", app.AppTypeId);
            ViewBag.ProviderId = new SelectList(db.Providers, "Id", "Name", app.ProviderId);
            return View(app);
        }

        // GET: Apps/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            App app = await db.Apps.FindAsync(id);
            if (app == null)
            {
                return HttpNotFound();
            }
            ViewBag.AppPlatformId = new SelectList(db.AppPlatforms, "Id", "Name", app.AppPlatformId);
            ViewBag.CoverImageId = new SelectList(db.Images, "Id", "Link", app.CoverImageId);
            ViewBag.AppTypeId = new SelectList(db.AppTypes, "Id", "Name", app.AppTypeId);
            ViewBag.ProviderId = new SelectList(db.Providers, "Id", "Name", app.ProviderId);
            return View(app);
        }

        // POST: Apps/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name,Link,LogoLink,Description,CoverImageId,Tags,Version,CreationDateTime,UpdateDateTime,AppTypeId,ProviderId,AppPlatformId")] App app)
        {
            if (ModelState.IsValid)
            {
                db.Entry(app).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.AppPlatformId = new SelectList(db.AppPlatforms, "Id", "Name", app.AppPlatformId);
            ViewBag.CoverImageId = new SelectList(db.Images, "Id", "Link", app.CoverImageId);
            ViewBag.AppTypeId = new SelectList(db.AppTypes, "Id", "Name", app.AppTypeId);
            ViewBag.ProviderId = new SelectList(db.Providers, "Id", "Name", app.ProviderId);
            return View(app);
        }

        // GET: Apps/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            App app = await db.Apps.FindAsync(id);
            if (app == null)
            {
                return HttpNotFound();
            }
            return View(app);
        }

        // POST: Apps/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            App app = await db.Apps.FindAsync(id);
            db.Apps.Remove(app);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
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
