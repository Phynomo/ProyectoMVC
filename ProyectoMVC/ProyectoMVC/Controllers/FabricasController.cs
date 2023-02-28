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
    public class FabricasController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Fabricas
        public ActionResult Index()
        {
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
            var tbFabricas = db.tbFabricas.Include(t => t.tbMunicipios).Where(t => t.fab_Estado == true);
            return View(tbFabricas.ToList());
        }

        // GET: Fabricas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbFabricas tbFabricas = db.tbFabricas.Find(id);
            if (tbFabricas == null)
            {
                return HttpNotFound();
            }
            return View(tbFabricas);
        }

        // GET: Fabricas/Create
        public ActionResult Create()
        {
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");

            return View();
        }

        // POST: Fabricas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create([Bind(Include = "fab_id,fab_Nombre,mun_Id,fab_DireccionExacta,fab_Telefono,fab_FechaCreacion,fab_UsuarioCreacion,fab_FechaModificacion,fab_UsuarioModificacion,fab_Estado")] tbFabricas tbFabricas)
        {
            if (ModelState.IsValid)
            {
                db.UDP_tbFabrica_Insert(tbFabricas.fab_Nombre, tbFabricas.mun_Id, tbFabricas.fab_DireccionExacta, tbFabricas.fab_Telefono, 1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.mun_Id = new SelectList(db.tbMunicipios, "mun_Id", "dep_Id", tbFabricas.mun_Id);
            return View(tbFabricas);
        }

        // GET: Fabricas/Edit/5
        public ActionResult Edit(int? id)
        {
            tbMunicipios muni = new tbMunicipios();

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbFabricas tbFabricas = db.tbFabricas.Find(id);
            if (tbFabricas == null)
            {
                return HttpNotFound();
            }
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
            //ViewBag.mun_Id = new SelectList(db.tbMunicipios, "mun_Id", "dep_Id", tbFabricas.mun_Id);
            //ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre", muni.mun_Id);

            return View(tbFabricas);
        }

        // POST: Fabricas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit([Bind(Include = "fab_id,fab_Nombre,mun_Id,fab_DireccionExacta,fab_Telefono,fab_FechaCreacion,fab_UsuarioCreacion,fab_FechaModificacion,fab_UsuarioModificacion,fab_Estado")] tbFabricas tbFabricas)
        {
            if (ModelState.IsValid)
            {
                db.UDP_tbfabrica_Update(tbFabricas.fab_id, tbFabricas.fab_Nombre, tbFabricas.mun_Id, tbFabricas.fab_DireccionExacta, tbFabricas.fab_Telefono, 1);
                return RedirectToAction("Index",tbFabricas);
            }
            //ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");

            return View(tbFabricas);
        }

        // GET: Fabricas/Delete/5

        public ActionResult Delete(int id)
        {
            var tbfabricas = db.tbFabricas.Where(t => t.fab_id == id).FirstOrDefault();
            return PartialView("_DeleteFabricaView", tbfabricas);
        }

        [HttpPost]
        public ActionResult Delete([Bind(Include = "fab_id,fab_Nombre,mun_Id,fab_DireccionExacta,fab_Telefono,fab_FechaCreacion,fab_UsuarioCreacion,fab_FechaModificacion,fab_UsuarioModificacion,fab_Estado")] tbFabricas tbFabricas)
        {
            db.UDP_tbfabrica_Delete(tbFabricas.fab_id, 1);
            db.SaveChanges();
            return RedirectToAction("Index", "Fabricas");
        }






        public JsonResult CargarMunicipios(string dep_Id)
        {
            var ddlMuni = db.UDP_CargarMunicipios(dep_Id).ToList();
            return Json(ddlMuni, JsonRequestBehavior.AllowGet);
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
