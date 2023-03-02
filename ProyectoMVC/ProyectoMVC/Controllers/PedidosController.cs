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
    public class PedidosController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Pedidos
        public ActionResult Index()
        {
            var tbPedidos = db.tbPedidos.Include(t => t.tbClientes).Include(t => t.tbDirecciones).Include(t => t.tbEmpleados).Include(t => t.tbMetodoPago).Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Where(t => t.ped_Estado == true);
            return View(tbPedidos.ToList());
        }

        // GET: Pedidos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbPedidos tbPedidos = db.tbPedidos.Find(id);
            if (tbPedidos == null)
            {
                return HttpNotFound();
            }
            return View(tbPedidos);
        }

        // GET: Pedidos/Create
        public ActionResult Create()
        {
            ViewBag.art_Id = new SelectList(db.tbArticulos, "art_Id", "art_Nombre");

            ViewBag.cli_Id = new SelectList(db.tbClientes, "cli_Id", "cli_Nombre");
            ViewBag.dire_id = new SelectList(db.tbDirecciones, "dire_ID", "dire_Calle");
            ViewBag.emp_id = new SelectList(db.tbEmpleados, "emp_Id", "emp_Nombre");
            ViewBag.metpago_Id = new SelectList(db.tbMetodoPago, "metpago_Id", "metpago_Descripcion");
            ViewBag.ped_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.ped_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            return View();
        }

        // POST: Pedidos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create(string cli_Id, string dire_id, string emp_id, string metpago_Id)
        {
            if (!String.IsNullOrEmpty(cli_Id) || !String.IsNullOrEmpty(dire_id) || !String.IsNullOrEmpty(emp_id) || !String.IsNullOrEmpty(metpago_Id))
            {

                db.UDP_tbPedidos_Insert(Convert.ToInt32(cli_Id), Convert.ToInt32(dire_id), Convert.ToInt32(emp_id), Convert.ToInt32(metpago_Id), 1);
                return View();
            }
            else
            {

            }

            return View();
        }

        // GET: Pedidos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbPedidos tbPedidos = db.tbPedidos.Find(id);
            if (tbPedidos == null)
            {
                return HttpNotFound();
            }

            ViewBag.art_Id = new SelectList(db.tbArticulos, "art_Id", "art_Nombre");
            ViewBag.cli_Id = new SelectList(db.tbClientes, "cli_Id", "cli_Nombre", tbPedidos.cli_Id);
            ViewBag.dire_id = new SelectList(db.tbDirecciones, "dire_ID", "dire_Calle", tbPedidos.dire_id);
            ViewBag.emp_id = new SelectList(db.tbEmpleados, "emp_Id", "emp_Nombre", tbPedidos.emp_id);
            ViewBag.metpago_Id = new SelectList(db.tbMetodoPago, "metpago_Id", "metpago_Descripcion", tbPedidos.metpago_Id);
            ViewBag.ped_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbPedidos.ped_UsuarioCreacion);
            ViewBag.ped_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbPedidos.ped_UsuarioModificacion);
            return View(tbPedidos);
        }

        // POST: Pedidos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Edit(string ped_id, string cli_Id, string dire_id, string emp_id, string metpago_Id)
        {
            if (!String.IsNullOrEmpty(ped_id) || !String.IsNullOrEmpty(cli_Id) || !String.IsNullOrEmpty(dire_id) || !String.IsNullOrEmpty(emp_id) || !String.IsNullOrEmpty(metpago_Id))
            {

                db.UDP_tbpedidos_Update(Convert.ToInt32(ped_id), Convert.ToInt32(cli_Id), Convert.ToInt32(dire_id), Convert.ToInt32(emp_id), Convert.ToInt32(metpago_Id), 1);
                return View();
            }
            else
            {

            }
            return View();

        }


        public ActionResult Delete(int id)
        {
            db.UDP_tbpedidos_Delete(id, 1);
            return RedirectToAction("Index");
        }

        // GET: Pedidos/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    tbPedidos tbPedidos = db.tbPedidos.Find(id);
        //    if (tbPedidos == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(tbPedidos);
        //}

        //// POST: Pedidos/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    tbPedidos tbPedidos = db.tbPedidos.Find(id);
        //    db.tbPedidos.Remove(tbPedidos);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        public ActionResult CreateDetalle(string cli_Id, string dire_id, string emp_id, string metpago_Id)
        {
            if (!String.IsNullOrEmpty(cli_Id) || !String.IsNullOrEmpty(dire_id) || !String.IsNullOrEmpty(emp_id) || !String.IsNullOrEmpty(metpago_Id))
            {

                db.UDP_tbPedidos_Insert(Convert.ToInt32(cli_Id), Convert.ToInt32(dire_id), Convert.ToInt32(emp_id), Convert.ToInt32(metpago_Id), 1);
                return View();
            }
            else
            {

            }

            return View();
        }

        public ActionResult CreateDetalles(string art_Id, string pede_Precio)
        {
            var tbpedidos = db.tbPedidos.ToList();
            int valMax = tbpedidos.Max(x => x.ped_Id);

            db.UDP_PedidoDetalle_Insert(valMax, int.Parse( art_Id), int.Parse(pede_Precio), 1);
            return View();
        }

        public ActionResult EditDetalles(string art_Id, string pede_Precio)
        {
            
            //db.UDP_PedidoDetalle_Update();
            //db.UDP_PedidoDetalle_Insert(valMax, int.Parse(art_Id), int.Parse(pede_Precio), 1);
            return View();
        }

        //Cargos Los Articulos
        public JsonResult CargarArticulos(int art_Id)
        {
            var articulo = db.UDP_tbArticulos_Return(art_Id).ToList();
            return Json(articulo, JsonRequestBehavior.AllowGet);
        }

        //public JsonResult CargarPedidoDetalles(int ped_Id)
        //{
        //    var tbPedidosDetalles = db.vw
        //    return Json(tbPedidosDetalles, JsonRequestBehavior.AllowGet);

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
