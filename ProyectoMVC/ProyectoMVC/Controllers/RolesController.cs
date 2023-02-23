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
    public class RolesController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Roles
        public ActionResult Index()
        {
            var tbRoles = db.tbRoles.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1);
            return View(tbRoles.ToList());
        }

        // GET: Roles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbRoles tbRoles = db.tbRoles.Find(id);
            if (tbRoles == null)
            {
                return HttpNotFound();
            }
            return View(tbRoles);
        }

        // GET: Roles/Create
        public ActionResult Create()
        {
            ViewBag.rol_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.rol_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            return View();
        }

        // POST: Roles/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "rol_id,rol_Nombre,rol_UsuarioCreacion,rol_FechaCreacion,rol_UsuarioModificacion,rol_FechaModificacion,rol_Estado")] tbRoles tbRoles)
        {
            if (ModelState.IsValid)
            {
                db.tbRoles.Add(tbRoles);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.rol_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbRoles.rol_UsuarioCreacion);
            ViewBag.rol_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbRoles.rol_UsuarioModificacion);
            return View(tbRoles);
        }

        // GET: Roles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbRoles tbRoles = db.tbRoles.Find(id);
            if (tbRoles == null)
            {
                return HttpNotFound();
            }
            ViewBag.rol_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbRoles.rol_UsuarioCreacion);
            ViewBag.rol_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbRoles.rol_UsuarioModificacion);
            return View(tbRoles);
        }

        // POST: Roles/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "rol_id,rol_Nombre,rol_UsuarioCreacion,rol_FechaCreacion,rol_UsuarioModificacion,rol_FechaModificacion,rol_Estado")] tbRoles tbRoles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbRoles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.rol_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbRoles.rol_UsuarioCreacion);
            ViewBag.rol_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbRoles.rol_UsuarioModificacion);
            return View(tbRoles);
        }

        // GET: Roles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbRoles tbRoles = db.tbRoles.Find(id);
            if (tbRoles == null)
            {
                return HttpNotFound();
            }
            return View(tbRoles);
        }

        // POST: Roles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tbRoles tbRoles = db.tbRoles.Find(id);
            db.tbRoles.Remove(tbRoles);
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
