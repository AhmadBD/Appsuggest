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
    public class ReviewsController : Controller
    {
        private appsuggestEntities1 db = new appsuggestEntities1();

        // GET: Reviews
        public async Task<ActionResult> Index()
        {
            var reviews = db.Reviews.Include(r => r.App).Include(r => r.User);
            return View(await reviews.ToListAsync());
        }

        // GET: Reviews/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Review review = await db.Reviews.FindAsync(id);
            if (review == null)
            {
                return HttpNotFound();
            }
            return View(review);
        }

        // GET: Reviews/Create
        public ActionResult Create()
        {
            ViewBag.AppId = new SelectList(db.Apps, "Id", "Name");
            ViewBag.UserId = new SelectList(db.Users, "Id", "Email");
            return View();
        }

        // POST: Reviews/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "UserId,AppId,Rate,ReviewText,AppVersion,CreationDateTime,UpdateDateTime")] Review review)
        {
            if (ModelState.IsValid)
            {
                db.Reviews.Add(review);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.AppId = new SelectList(db.Apps, "Id", "Name", review.AppId);
            ViewBag.UserId = new SelectList(db.Users, "Id", "Email", review.UserId);
            return View(review);
        }

        // GET: Reviews/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Review review = await db.Reviews.FindAsync(id);
            if (review == null)
            {
                return HttpNotFound();
            }
            ViewBag.AppId = new SelectList(db.Apps, "Id", "Name", review.AppId);
            ViewBag.UserId = new SelectList(db.Users, "Id", "Email", review.UserId);
            return View(review);
        }

        // POST: Reviews/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "UserId,AppId,Rate,ReviewText,AppVersion,CreationDateTime,UpdateDateTime")] Review review)
        {
            if (ModelState.IsValid)
            {
                db.Entry(review).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.AppId = new SelectList(db.Apps, "Id", "Name", review.AppId);
            ViewBag.UserId = new SelectList(db.Users, "Id", "Email", review.UserId);
            return View(review);
        }

        // GET: Reviews/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Review review = await db.Reviews.FindAsync(id);
            if (review == null)
            {
                return HttpNotFound();
            }
            return View(review);
        }

        // POST: Reviews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Review review = await db.Reviews.FindAsync(id);
            db.Reviews.Remove(review);
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
