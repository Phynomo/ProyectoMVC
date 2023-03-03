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
    public class MetodoPagoesController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: MetodoPagoes
        public ActionResult Index()
        {
            var tbMetodoPago = db.tbMetodoPago.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Where(t => t.metpago_Estado == true);
            return View(tbMetodoPago.ToList());
        }

        // GET: MetodoPagoes/Details/5
        public ActionResult Details(int? id)
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

        // GET: MetodoPagoes/Create
        

        [HttpPost]
        public ActionResult Create(string txtMetodopago)
        {

            try
            {
                if (txtMetodopago != "")
                {
                    db.UDP_tbMetodoPago_Insert(txtMetodopago, 1);
                    return RedirectToAction("Index", "MetodoPagoes");
                }

                return PartialView("_ModalesMetodosPagosView");
            }
            catch
            {
                return PartialView("_ModalesMetodosPagosView");
            }

            
        }

        // GET: MetodoPagoes/Edit/5
       
    

        public ActionResult Edit(int id)
        {
            var tbMetodoPago = db.tbMetodoPago.Where(t => t.metpago_Id == id).FirstOrDefault();
            return PartialView("_ModalesMetodosPagosView", tbMetodoPago);
        }

        [HttpPost]
        public ActionResult Editt([Bind(Include = "metpago_Id,metpago_Descripcion,metpago_FechaCreacion,metpago_UsuarioCreacion,metpago_FechaModificacion,metpago_UsuarioModificacion,metpago_Estado")] tbMetodoPago tbMetodoPago)
    {

            try
            {

                if (tbMetodoPago.metpago_Descripcion != "")
                {
                    db.UDP_tbMetodoPago_Update(tbMetodoPago.metpago_Id, tbMetodoPago.metpago_Descripcion, 1);
                    db.SaveChanges();
                    return RedirectToAction("Index", "MetodoPagoes");
                }

                return RedirectToAction("Index", "MetodoPagoes");
            }
            catch
            {

                return RedirectToAction("Index", "MetodoPagoes");
            }

        }


        // GET: MetodoPagoes/Delete/5
        public ActionResult Delete(int? id)
        {
            var tbMetodoPago = db.tbMetodoPago.Where(t => t.metpago_Id == id).FirstOrDefault();
            return PartialView("_ModalesMetodosPagosView", tbMetodoPago);
        }

        public ActionResult DeleteConfirm([Bind(Include = "metpago_Id,metpago_Descripcion,metpago_FechaCreacion,metpago_UsuarioCreacion,metpago_FechaModificacion,metpago_UsuarioModificacion,metpago_Estado")] tbMetodoPago tbMetodoPago)
        { //////////////////////
            db.UDP_tbMetodoPago_Delete(tbMetodoPago.metpago_Id,1);
            db.SaveChanges();
            return RedirectToAction("Index", "MetodoPagoes");
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
