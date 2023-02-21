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
    public class MunicipiosController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Municipios
        public ActionResult Index()
        {
            var tbMunicipios = db.tbMunicipios.Include(t => t.tbDepartamentos).Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1);
            return View(tbMunicipios.ToList());
        }

        // GET: Municipios/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbMunicipios tbMunicipios = db.tbMunicipios.Find(id);
            if (tbMunicipios == null)
            {
                return HttpNotFound();
            }
            return View(tbMunicipios);
        }

        // GET: Municipios/Create
        public ActionResult Create()
        {
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
            ViewBag.mun_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.mun_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            return View();
        }

        // POST: Municipios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "mun_Id,dep_Id,mun_Nombre,mun_FechaCreacion,mun_UsuarioCreacion,mun_FechaModificacion,mun_UsuarioModificacion,mun_Estado")] tbMunicipios tbMunicipios)
        {
            if (ModelState.IsValid)
            {
                db.tbMunicipios.Add(tbMunicipios);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre", tbMunicipios.dep_Id);
            ViewBag.mun_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbMunicipios.mun_UsuarioCreacion);
            ViewBag.mun_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbMunicipios.mun_UsuarioModificacion);
            return View(tbMunicipios);
        }

        // GET: Municipios/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbMunicipios tbMunicipios = db.tbMunicipios.Find(id);
            if (tbMunicipios == null)
            {
                return HttpNotFound();
            }
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre", tbMunicipios.dep_Id);
            ViewBag.mun_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbMunicipios.mun_UsuarioCreacion);
            ViewBag.mun_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbMunicipios.mun_UsuarioModificacion);
            return View(tbMunicipios);
        }

        // POST: Municipios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "mun_Id,dep_Id,mun_Nombre,mun_FechaCreacion,mun_UsuarioCreacion,mun_FechaModificacion,mun_UsuarioModificacion,mun_Estado")] tbMunicipios tbMunicipios)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbMunicipios).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre", tbMunicipios.dep_Id);
            ViewBag.mun_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbMunicipios.mun_UsuarioCreacion);
            ViewBag.mun_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbMunicipios.mun_UsuarioModificacion);
            return View(tbMunicipios);
        }

        // GET: Municipios/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbMunicipios tbMunicipios = db.tbMunicipios.Find(id);
            if (tbMunicipios == null)
            {
                return HttpNotFound();
            }
            return View(tbMunicipios);
        }

        // POST: Municipios/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            tbMunicipios tbMunicipios = db.tbMunicipios.Find(id);
            db.tbMunicipios.Remove(tbMunicipios);
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
