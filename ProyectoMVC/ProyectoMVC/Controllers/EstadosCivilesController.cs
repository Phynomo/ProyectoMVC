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
    public class EstadosCivilesController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: EstadosCiviles
        public ActionResult Index()
        {
            var tbEstadosCiviles = db.tbEstadosCiviles.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1);
            return View(tbEstadosCiviles.ToList());
        }

        // GET: EstadosCiviles/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbEstadosCiviles tbEstadosCiviles = db.tbEstadosCiviles.Find(id);
            if (tbEstadosCiviles == null)
            {
                return HttpNotFound();
            }
            return View(tbEstadosCiviles);
        }

        // GET: EstadosCiviles/Create
        [HttpPost]
        public ActionResult Create(string txtId, string txtDescripcion)
        {


            if (txtId != "" && txtDescripcion != "")
            {
                db.UDP_tbEstadoCivilesInsert(txtId, txtDescripcion,1);
                return RedirectToAction("Index", "EstadosCiviles");
            }

            return PartialView("_ModalsEstadosView");
        }

        // GET: EstadosCiviles/Edit/5
        public ActionResult Edit(string id)
        {
            var tbEstadosCiviles = db.tbEstadosCiviles.Where(t => t.estciv_Id == id).FirstOrDefault();
            return PartialView("_ModalsEstadosView", tbEstadosCiviles);
        }

        [HttpPost]
        public ActionResult Editt([Bind(Include = "estciv_Id,estciv_Nombre,estciv_FechaCreacion,estciv_UsuarioCreacion,estciv_FechaModificacion,estciv_UsuarioModificacion,estciv_Estado")] tbEstadosCiviles tbEstadosCiviles)
        {

            if (tbEstadosCiviles.estciv_Nombre != "")
            {
                //db.UDP_tbEstadoCivilesUpdate(tbEstadosCiviles.estciv_Id, tbEstadosCiviles.estciv_Nombre, 1);
                db.SaveChanges();
                return RedirectToAction("Index", "EstadosCiviles");
            }

            return RedirectToAction("Index", "EstadosCiviles");
        }


        
        // GET: EstadosCiviles/Delete/5
       
        
        public ActionResult Delete(string id)
        {
            var tbEstadosCiviles = db.tbEstadosCiviles.Where(t => t.estciv_Id == id).FirstOrDefault();
            return PartialView("_ModalsEstadosView", tbEstadosCiviles);
        }

        public ActionResult DeleteConfirm([Bind(Include = "estciv_Id,estciv_Nombre,estciv_FechaCreacion,estciv_UsuarioCreacion,estciv_FechaModificacion,estciv_UsuarioModificacion,estciv_Estado")] tbEstadosCiviles tbEstadosCiviles)
        {
            db.UDP_tbEstadoCivilesDelete(tbEstadosCiviles.estciv_Id);
            db.SaveChanges();
            return RedirectToAction("Index", "EstadosCiviles");
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
