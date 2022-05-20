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
    public class AppPlatformsController : Controller
    {
        private appsuggestEntities db = new appsuggestEntities();

        // GET: AppPlatforms
        public async Task<ActionResult> Index()
        {
            return View(await db.AppPlatforms.ToListAsync());
        }

        // GET: AppPlatforms/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AppPlatform appPlatform = await db.AppPlatforms.FindAsync(id);
            if (appPlatform == null)
            {
                return HttpNotFound();
            }
            return View(appPlatform);
        }

        // GET: AppPlatforms/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: AppPlatforms/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name")] AppPlatform appPlatform)
        {
            if (ModelState.IsValid)
            {
                db.AppPlatforms.Add(appPlatform);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(appPlatform);
        }

        // GET: AppPlatforms/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AppPlatform appPlatform = await db.AppPlatforms.FindAsync(id);
            if (appPlatform == null)
            {
                return HttpNotFound();
            }
            return View(appPlatform);
        }

        // POST: AppPlatforms/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name")] AppPlatform appPlatform)
        {
            if (ModelState.IsValid)
            {
                db.Entry(appPlatform).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(appPlatform);
        }

        // GET: AppPlatforms/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AppPlatform appPlatform = await db.AppPlatforms.FindAsync(id);
            if (appPlatform == null)
            {
                return HttpNotFound();
            }
            return View(appPlatform);
        }

        // POST: AppPlatforms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            AppPlatform appPlatform = await db.AppPlatforms.FindAsync(id);
            db.AppPlatforms.Remove(appPlatform);
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
