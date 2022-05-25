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
    public class ConfigsController : Controller
    {
        private appsuggestEntities1 db = new appsuggestEntities1();

        // GET: Configs
        public async Task<ActionResult> Index()
        {
            return View(await db.Configs.ToListAsync());
        }

        // GET: Configs/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Config config = await db.Configs.FindAsync(id);
            if (config == null)
            {
                return HttpNotFound();
            }
            return View(config);
        }

        // GET: Configs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Configs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Name,Value")] Config config)
        {
            if (ModelState.IsValid)
            {
                db.Configs.Add(config);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(config);
        }

        // GET: Configs/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Config config = await db.Configs.FindAsync(id);
            if (config == null)
            {
                return HttpNotFound();
            }
            return View(config);
        }

        // POST: Configs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Name,Value")] Config config)
        {
            if (ModelState.IsValid)
            {
                db.Entry(config).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(config);
        }

        // GET: Configs/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Config config = await db.Configs.FindAsync(id);
            if (config == null)
            {
                return HttpNotFound();
            }
            return View(config);
        }

        // POST: Configs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            Config config = await db.Configs.FindAsync(id);
            db.Configs.Remove(config);
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
