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
    public class ArticulosController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Articulos
        public ActionResult Index()
        {
            var tbArticulos = db.tbArticulos.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Include(t => t.tbCategoria).Include(t => t.tbFabricas).Where(t => t.art_Estado == true);
            return View(tbArticulos.ToList());
        }

        // GET: Articulos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbArticulos tbArticulos = db.tbArticulos.Find(id);
            if (tbArticulos == null)
            {
                return HttpNotFound();
            }
            return View(tbArticulos);
        }

        // GET: Articulos/Create
        public ActionResult Create()
        {
            ViewBag.art_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.art_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.cat_Id = new SelectList(db.tbCategoria, "cat_Id", "cat_Descripcion");
            ViewBag.fab_id = new SelectList(db.tbFabricas, "fab_id", "fab_Nombre");
            return View();
        }

        // POST: Articulos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "art_Id,art_Nombre,art_Precio,cat_Id,art_Stock,fab_id,art_FechaCreacion,art_UsuarioCreacion,art_FechaModificacion,art_UsuarioModificacion,art_Estado")] tbArticulos tbArticulos)
        {
            if (ModelState.IsValid)
            {
                db.UDP_tbArticulos_Insert(tbArticulos.art_Nombre, tbArticulos.art_Precio, tbArticulos.cat_Id, tbArticulos.art_Stock, tbArticulos.fab_id, 1);
                return RedirectToAction("Index");
            }

            ViewBag.art_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbArticulos.art_UsuarioCreacion);
            ViewBag.art_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbArticulos.art_UsuarioModificacion);
            ViewBag.cat_Id = new SelectList(db.tbCategoria, "cat_Id", "cat_Descripcion", tbArticulos.cat_Id);
            ViewBag.fab_id = new SelectList(db.tbFabricas, "fab_id", "fab_Nombre", tbArticulos.fab_id);
            return View(tbArticulos);
        }

        // GET: Articulos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbArticulos tbArticulos = db.tbArticulos.Find(id);
            if (tbArticulos == null)
            {
                return HttpNotFound();
            }
            ViewBag.art_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbArticulos.art_UsuarioCreacion);
            ViewBag.art_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbArticulos.art_UsuarioModificacion);
            ViewBag.cat_Id = new SelectList(db.tbCategoria, "cat_Id", "cat_Descripcion", tbArticulos.cat_Id);
            ViewBag.fab_id = new SelectList(db.tbFabricas, "fab_id", "fab_Nombre", tbArticulos.fab_id);
            return View(tbArticulos);
        }

        // POST: Articulos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "art_Id,art_Nombre,art_Precio,cat_Id,art_Stock,fab_id,art_FechaCreacion,art_UsuarioCreacion,art_FechaModificacion,art_UsuarioModificacion,art_Estado")] tbArticulos tbArticulos)
        {
            if (ModelState.IsValid)
            {

                db.UDP_tbArticulo_Update(tbArticulos.art_Id, tbArticulos.art_Nombre, tbArticulos.art_Precio, tbArticulos.cat_Id, tbArticulos.art_Stock, tbArticulos.fab_id, 1);

                return RedirectToAction("Index");
            }
            ViewBag.art_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbArticulos.art_UsuarioCreacion);
            ViewBag.art_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbArticulos.art_UsuarioModificacion);
            ViewBag.cat_Id = new SelectList(db.tbCategoria, "cat_Id", "cat_Descripcion", tbArticulos.cat_Id);
            ViewBag.fab_id = new SelectList(db.tbFabricas, "fab_id", "fab_Nombre", tbArticulos.fab_id);
            return View(tbArticulos);
        }

        public ActionResult Delete(int id)
        {
            db.UDP_tbArticulos_Delete(id,1);
            return RedirectToAction("Index");
        }


        // GET: Articulos/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    tbArticulos tbArticulos = db.tbArticulos.Find(id);
        //    if (tbArticulos == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(tbArticulos);
        //}

        //// POST: Articulos/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    tbArticulos tbArticulos = db.tbArticulos.Find(id);
        //    db.tbArticulos.Remove(tbArticulos);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
    //}

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
