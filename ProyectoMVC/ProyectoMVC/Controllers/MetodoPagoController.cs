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
    public class MetodoPagoController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: MetodoPago
        public ActionResult Index()
        {
            var tbMetodoPago = db.tbMetodoPago.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Where(t => t.metpago_Estado == true);
            return View(tbMetodoPago.ToList());
        }

        // GET: MetodoPago/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbMetodoPago tbMetodoPago = db.tbMetodoPago.Find(id);
            if (tbMetodoPago == null)
            {
                return HttpNotFound();
            }
            return View(tbMetodoPago);
        }

        // GET: MetodoPago/Create
        
        [HttpPost]
        public ActionResult Create(string txtId, string txtDescripcion)
        {


            if (txtId != "" && txtDescripcion != "")
            {
                db.UDP_tbMetodoPago_Insert(txtId, txtDescripcion, 1);
                return RedirectToAction("Index", "MetodoPago");
            }
            else
            {
                return RedirectToAction("Index", "MetodoPago");

            }

            return View();
        }

        // GET: MetodoPago/Edit/5
        
        public ActionResult Edit(int id)
        {
            var tbMetodoPago = db.tbMetodoPago.Where(t => t.metpago_Id == id).FirstOrDefault();
            return PartialView("_ModalesMetodoPagoView", tbMetodoPago);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Editt([Bind(Include = "metpago_Id,metpago_Descripcion,metpago_FechaCreacion,metpago_UsuarioCreacion,metpago_FechaModificacion,metpago_UsuarioModificacion,metpago_Estado")] tbMetodoPago tbMetodoPago)
        {
            db.UDP_tbMetodoPago_Update(tbMetodoPago.metpago_Id, tbMetodoPago.metpago_Descripcion, 1)
            return RedirectToAction("Index", "MetodoPago");
        }


            db.SaveChanges();
            return RedirectToAction("Index", "MetodoPago");
        }


        // GET: MetodoPago/Delete/5
        
        public ActionResult Delete(string id)
        {
            var tbMetodoPago = db.tbMetodoPago.Where(t => t.metpago_Id == id).FirstOrDefault();
            return PartialView("_ModalesMetodoPagoView", tbMetodoPago);
        }

        public ActionResult DeleteConfirm([Bind(Include = "car_Id,car_Nombre,car_FechaCreacion,car_UsuarioCreacion,car_FechaModificacion,car_UsuarioModificacion,car_Estado")] tbCargos tbCargos)
        {
            //db.UDP_tbMetodoPago_Delete(tbMetodoPago.metpago_Id, 1);
            db.SaveChanges();

        // POST: MetodoPago/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            tbMetodoPago tbMetodoPago = db.tbMetodoPago.Find(id);
            db.tbMetodoPago.Remove(tbMetodoPago);
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
