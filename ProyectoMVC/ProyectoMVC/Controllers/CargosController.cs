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
    public class CargosController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Cargos
        public ActionResult Index()
        {
            var tbCargos = db.tbCargos.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Where(t => t.car_Estado == true);
            return View(tbCargos.ToList());
        }

        // GET: Cargos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbCargos tbCargos = db.tbCargos.Find(id);
            if (tbCargos == null)
            {
                return HttpNotFound();
            }
            return View(tbCargos);
        }

        // GET: Cargos/Create

        [HttpPost]
        public ActionResult Create(string txtCargos)
        {


            if (txtCargos != "")
            {
                db.UDP_tbCargos_Insert(txtCargos, 1);
                return RedirectToAction("Index", "Cargos");
            }
            else
            {
                return RedirectToAction("Index", "Cargos");

            }

            return View();
        }


        // GET: Cargos/Edit/5


        public ActionResult Edit(int id)
        {
            var tbCargos = db.tbCargos.Where(t => t.car_Id == id).FirstOrDefault();
            return PartialView("_ModalesCargosView", tbCargos);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [HandleError]
        public ActionResult Editt([Bind(Include = "car_Id,car_Nombre,car_FechaCreacion,car_UsuarioCreacion,car_FechaModificacion,car_UsuarioModificacion,car_Estado")] tbCargos tbCargos)
        {
            db.UDP_tbCargo_Update(tbCargos.car_Id, tbCargos.car_Nombre, 1);
            db.SaveChanges();
            return RedirectToAction("Index", "Cargos");
        }

        // GET: Cargos/Delete/5
        public ActionResult Delete(int? id)
        {
            var tbCargos = db.tbCargos.Where(t => t.car_Id == id).FirstOrDefault();
            return PartialView("_ModalesCargosView", tbCargos);
        }

        public ActionResult DeleteConfirm([Bind(Include = "car_Id,car_Nombre,car_FechaCreacion,car_UsuarioCreacion,car_FechaModificacion,car_UsuarioModificacion,car_Estado")] tbCargos tbCargos)
        {
            db.UDP_tbCargo_Delete(tbCargos.car_Id);
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
