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
    public class DepartamentosController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Departamentos
        public ActionResult Index()
        {
            var tbDepartamentos = db.tbDepartamentos.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1);
            return View(tbDepartamentos.ToList());
        }

        // GET: Departamentos/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbDepartamentos tbDepartamentos = db.tbDepartamentos.Find(id);
            if (tbDepartamentos == null)
            {
                return HttpNotFound();
            }
            return View(tbDepartamentos);
        }

        // GET: Departamentos/Create
        public ActionResult Create()
        {
            ViewBag.dep_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.dep_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            return View();
        }

        // POST: Departamentos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "dep_Id,dep_Nombre,dep_FechaCreacion,dep_UsuarioCreacion,dep_FechaModificacion,dep_UsuarioModificacion,dep_Estado")] tbDepartamentos tbDepartamentos)
        {
            if (ModelState.IsValid)
            {
                db.tbDepartamentos.Add(tbDepartamentos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.dep_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioCreacion);
            ViewBag.dep_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioModificacion);
            return View(tbDepartamentos);
        }

        // GET: Departamentos/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbDepartamentos tbDepartamentos = db.tbDepartamentos.Find(id);
            if (tbDepartamentos == null)
            {
                return HttpNotFound();
            }
            ViewBag.dep_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioCreacion);
            ViewBag.dep_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioModificacion);
            return View(tbDepartamentos);
        }

        // POST: Departamentos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "dep_Id,dep_Nombre,dep_FechaCreacion,dep_UsuarioCreacion,dep_FechaModificacion,dep_UsuarioModificacion,dep_Estado")] tbDepartamentos tbDepartamentos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbDepartamentos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.dep_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioCreacion);
            ViewBag.dep_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioModificacion);
            return View(tbDepartamentos);
        }

        // GET: Departamentos/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbDepartamentos tbDepartamentos = db.tbDepartamentos.Find(id);
            if (tbDepartamentos == null)
            {
                return HttpNotFound();
            }
            return View(tbDepartamentos);
        }

        // POST: Departamentos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            tbDepartamentos tbDepartamentos = db.tbDepartamentos.Find(id);
            db.tbDepartamentos.Remove(tbDepartamentos);
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
