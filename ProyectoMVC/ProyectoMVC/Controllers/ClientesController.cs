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
    public class ClientesController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Clientes
        public ActionResult Index()
        {
            var tbClientes = db.tbClientes.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Where(x => x.cli_Estado);
            return View(tbClientes.ToList());
        }

        // GET: Clientes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbClientes tbClientes = db.tbClientes.Find(id);
            if (tbClientes == null)
            {
                return HttpNotFound();
            }
            return View(tbClientes);
        }

        // GET: Clientes/Create
        public ActionResult Create()
        {
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
            ViewBag.cli_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.cli_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            return View();
        }

        // POST: Clientes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cli_Id,cli_Nombre,cli_Apellido,cli_Telefono,cli_CorreoElectronico,cli_saldo,cli_LimiteCredito,cli_Descuento,cli_FechaCreacion,cli_UsuarioCreacion,cli_FechaModificacion,cli_UsuarioModificacion,cli_Estado")] tbClientes tbClientes)
        {
            if (ModelState.IsValid)
            {
                Session["UltimoCliente"] = tbClientes.cli_Id.ToString();
                db.UDP_tbClientes_Insert(tbClientes.cli_Nombre, tbClientes.cli_Apellido, tbClientes.cli_Telefono, tbClientes.cli_CorreoElectronico, tbClientes.cli_saldo, tbClientes.cli_LimiteCredito, tbClientes.cli_Descuento,1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cli_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbClientes.cli_UsuarioCreacion);
            ViewBag.cli_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbClientes.cli_UsuarioModificacion);
            return View(tbClientes);
        }


        public ActionResult Crea2(string cli_Nombre, string cli_Apellido, string cli_Telefono, string cli_CorreoElectronico, string cli_saldo, string cli_LimiteCredito, string cli_Descuento)
        {
             db.UDP_tbClientes_Insert(cli_Nombre, cli_Apellido, cli_Telefono, cli_CorreoElectronico, Convert.ToDecimal(cli_saldo), Convert.ToDecimal(cli_LimiteCredito), Convert.ToDecimal(cli_Descuento),  1);
            return View();
        }

        public ActionResult Crea2Dire(string dire_calle, string dire_comuna, string mun_Id)
        {
            var tbClientes = db.tbClientes.ToList();
            int valMax = tbClientes.Max(x => x.cli_Id);
            db.UDP_tbDirecciones_Insert(dire_calle,dire_comuna,mun_Id,valMax,1);
            Response.Redirect("/Clientes/Index");
             return RedirectToAction("Index", "Cargos");
        }

        public ActionResult AgregarDire(string cli_Id, string dire_calle, string dire_comuna, string mun_Id)
        {
            db.UDP_tbDirecciones_Insert(dire_calle, dire_comuna, mun_Id, Convert.ToInt32(cli_Id), 1);
            Response.Redirect("/Clientes/Index");
            return RedirectToAction("Index", "Cargos");
        }


        // GET: Clientes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbClientes tbClientes = db.tbClientes.Find(id);
            if (tbClientes == null)
            {
                return HttpNotFound();
            }
            ViewBag.cli_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbClientes.cli_UsuarioCreacion);
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
            ViewBag.cli_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbClientes.cli_UsuarioModificacion);
            return View(tbClientes);
        }

        // POST: Clientes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cli_Id,cli_Nombre,cli_Apellido,cli_Telefono,cli_CorreoElectronico,cli_saldo,cli_LimiteCredito,cli_Descuento,cli_FechaCreacion,cli_UsuarioCreacion,cli_FechaModificacion,cli_UsuarioModificacion,cli_Estado")] tbClientes tbClientes)
        {
            if (ModelState.IsValid)
            {
                db.UDP_tbClientes_Update(tbClientes.cli_Id, tbClientes.cli_Nombre, tbClientes.cli_Apellido,tbClientes.cli_Telefono,tbClientes.cli_CorreoElectronico,tbClientes.cli_saldo,tbClientes.cli_LimiteCredito,tbClientes.cli_Descuento,1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.cli_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbClientes.cli_UsuarioCreacion);
            ViewBag.cli_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbClientes.cli_UsuarioModificacion);
            return View(tbClientes);
        }

        // GET: Clientes/Delete/5

        public ActionResult Delete(int? id)
        {
            var tbClientes = db.tbClientes.Where(t => t.cli_Id == id).FirstOrDefault();
            return PartialView("_ModalesDireccionesView", tbClientes);
        }

        public ActionResult DeleteConfirm([Bind(Include = "cli_Id,cli_Nombre,cli_Apellido,cli_Telefono,cli_CorreoElectronico,cli_saldo,cli_LimiteCredito,cli_Descuento,cli_FechaCreacion,cli_UsuarioCreacion,cli_FechaModificacion,cli_UsuarioModificacion,cli_Estado")] tbClientes tbClientes)
        {
            db.UDP_tbClientes_Delete(tbClientes.cli_Id,1);
            db.SaveChanges();
            return RedirectToAction("Index", "Clientes");
        }


        ///

        public JsonResult CargarMunicipios(string dep_Id)
        {
            var ddlMuni = db.UDP_CargarMunicipios(dep_Id).ToList();
            return Json(ddlMuni, JsonRequestBehavior.AllowGet);
        }

        public JsonResult CargarDirecciones(int cli_Id)
        {
            var tbDirrecciones = db.UDP_CargarTablaDirecciones(cli_Id).ToList();
            return Json(tbDirrecciones, JsonRequestBehavior.AllowGet);
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
