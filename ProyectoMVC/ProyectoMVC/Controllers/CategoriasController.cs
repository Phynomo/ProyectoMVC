using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProyectoMVC.Models;

namespace ProyectoMVC.Controllers
{
    public class CategoriasController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Categorias
        public ActionResult Index()
        {
            var tbCategoria = db.tbCategoria.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1);
            return View(tbCategoria.ToList());
        }

        // GET: Categorias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbCategoria tbCategoria = db.tbCategoria.Find(id);
            if (tbCategoria == null)
            {
                return HttpNotFound();
            }
            return View(tbCategoria);
        }

        // GET: Categorias/Create
        public ActionResult Create()
        {
            ViewBag.cat_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.cat_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            return View();
        }

        // POST: Categorias/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cat_Id,cat_Descripcion,cat_FechaCreacion,cat_UsuarioCreacion,cat_FechaModificacion,cat_UsuarioModificacion,cat_Estado")] tbCategoria tbCategoria)
        {
            if (ModelState.IsValid)
            {
                db.tbCategoria.Add(tbCategoria);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cat_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbCategoria.cat_UsuarioCreacion);
            ViewBag.cat_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbCategoria.cat_UsuarioModificacion);
            return View(tbCategoria);
        }

        // GET: Categorias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbCategoria tbCategoria = db.tbCategoria.Find(id);
            if (tbCategoria == null)
            {
                return HttpNotFound();
            }
            ViewBag.cat_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbCategoria.cat_UsuarioCreacion);
            ViewBag.cat_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbCategoria.cat_UsuarioModificacion);
            return View(tbCategoria);
        }

        // POST: Categorias/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cat_Id,cat_Descripcion,cat_FechaCreacion,cat_UsuarioCreacion,cat_FechaModificacion,cat_UsuarioModificacion,cat_Estado")] tbCategoria tbCategoria)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbCategoria).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cat_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbCategoria.cat_UsuarioCreacion);
            ViewBag.cat_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbCategoria.cat_UsuarioModificacion);
            return View(tbCategoria);
        }

        // GET: Categorias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbCategoria tbCategoria = db.tbCategoria.Find(id);
            if (tbCategoria == null)
            {
                return HttpNotFound();
            }
            return View(tbCategoria);
        }

        // POST: Categorias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tbCategoria tbCategoria = db.tbCategoria.Find(id);
            db.tbCategoria.Remove(tbCategoria);
            db.SaveChanges();
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
