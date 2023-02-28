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
            var tbFabricas = db.tbFabricas.Include(t => t.tbMunicipios).Where(t => t.fab_Estado == true);
            return View(tbFabricas.ToList());
        }

        //Insert
        [HttpPost]
        public ActionResult Create(string txtFabrica, string txtDepartamento, string txtMunicipio, string txtDirecionExacta, string Telefono)
        {


            if (txtFabrica != "" || txtDepartamento != "" || txtMunicipio != "" || txtDirecionExacta != "" || Telefono != "" )
            {

                //db.UDP_tbFabrica_Insert(txtFabrica, txtDepartamento, txtMunicipio, txtDirecionExacta, Telefono, 1);
                return RedirectToAction("Index", "Fabrica");
            }
            else
            {
                return RedirectToAction("Index", "Fabrica");

            }

            return View();
        }

        //Update
        public ActionResult Edit(int id)
        {
            var tbFabricas = db.tbFabricas.Where(t => t.fab_id == id).FirstOrDefault();
            return PartialView("_ModalesCargosView", tbFabricas); //cambiar la vista
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Editt([Bind(Include = "fab_id,fab_Nombre,mun_Id,fab_DireccionExacta,fab_Telefono,fab_FechaCreacion,fab_UsuarioCreacion,fab_FechaModificacion,fab_UsuarioModificacion,fab_Estado")] tbFabricas tbFabricas)
        {

            //db.UDP_tbfabrica_Update(tbFabricas.fab_id, tbFabricas.fab_Nombre, tbFabricas.mun_Id, tbFabricas.fab_DireccionExacta, tbFabricas.fab_Telefono, 1);
            db.SaveChanges();
            return RedirectToAction("Index", "Cargos");
        }

        //Details
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
             tbFabricas tbFabricas =  db.tbFabricas.Find(id);
            if (tbFabricas == null)
            {
                return HttpNotFound();
            }
            return View(tbFabricas);
        }

        //Delete
        public ActionResult Delete(int? id)
        {
            var tbFabricas = db.tbFabricas.Where(t => t.fab_id == id).FirstOrDefault();
            return PartialView("_ModalesCargosView", tbFabricas); // cambiar la vista
        }

        public ActionResult DeleteConfirm([Bind(Include = "fab_id,fab_Nombre,mun_Id,fab_DireccionExacta,fab_Telefono,fab_FechaCreacion,fab_UsuarioCreacion,fab_FechaModificacion,fab_UsuarioModificacion,fab_Estado")] tbFabricas tbFabricas)
        {

            db.UDP_tbfabrica_Delete(tbFabricas.fab_id,1);
            db.SaveChanges();
            return RedirectToAction("Index", "Cargos");
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
