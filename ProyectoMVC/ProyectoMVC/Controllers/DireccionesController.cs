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
    public class DireccionesController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Direcciones
        public ActionResult Index()
        {
            var tbDirecciones = db.tbDirecciones.Include(t => t.tbClientes).Include(t => t.tbMunicipios).Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1);
            return View(tbDirecciones.ToList());
        }

        // GET: Direcciones/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbDirecciones tbDirecciones = db.tbDirecciones.Find(id);
            if (tbDirecciones == null)
            {
                return HttpNotFound();
            }
            return View(tbDirecciones);
        }

        // GET: Direcciones/Create
        public ActionResult Create()
        {
            ViewBag.cli_Id = new SelectList(db.tbClientes, "cli_Id", "cli_Nombre");
            ViewBag.mun_Id = new SelectList(db.tbMunicipios, "mun_Id", "mun_Nombre");
            ViewBag.dire_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.dire_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            return View();
        }

        // POST: Direcciones/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "dire_ID,mun_Id,dire_Calle,dire_Comuna,cli_Id,dire_FechaCreacion,dire_UsuarioCreacion,dire_FechaModificacion,dire_UsuarioModificacion,dire_Estado")] tbDirecciones tbDirecciones)
        {
            if (ModelState.IsValid)
            {
                db.tbDirecciones.Add(tbDirecciones);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.cli_Id = new SelectList(db.tbClientes, "cli_Id", "cli_Nombre", tbDirecciones.cli_Id);
            ViewBag.mun_Id = new SelectList(db.tbMunicipios, "mun_Id", "mun_Nombre", tbDirecciones.mun_Id);
            ViewBag.dire_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDirecciones.dire_UsuarioCreacion);
            ViewBag.dire_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDirecciones.dire_UsuarioModificacion);
            return View(tbDirecciones);
        }

        // GET: Direcciones/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbDirecciones tbDirecciones = db.tbDirecciones.Find(id);
            if (tbDirecciones == null)
            {
                return HttpNotFound();
            }
            ViewBag.cli_Id = new SelectList(db.tbClientes, "cli_Id", "cli_Nombre", tbDirecciones.cli_Id);
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
            ViewBag.dire_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDirecciones.dire_UsuarioCreacion);
            ViewBag.dire_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDirecciones.dire_UsuarioModificacion);
            return View(tbDirecciones);
        }

        // POST: Direcciones/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "dire_ID,mun_Id,dire_Calle,dire_Comuna,cli_Id,dire_FechaCreacion,dire_UsuarioCreacion,dire_FechaModificacion,dire_UsuarioModificacion,dire_Estado")] tbDirecciones tbDirecciones)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Entry(tbDirecciones).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                ViewBag.cli_Id = new SelectList(db.tbClientes, "cli_Id", "cli_Nombre", tbDirecciones.cli_Id);
                ViewBag.mun_Id = new SelectList(db.tbMunicipios, "mun_Id", "mun_Nombre", tbDirecciones.mun_Id);
                ViewBag.dire_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDirecciones.dire_UsuarioCreacion);
                ViewBag.dire_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDirecciones.dire_UsuarioModificacion);
                return View(tbDirecciones);
            }
            catch (Exception)
            {
                return View(tbDirecciones);
            }
            
        }

        // GET: Direcciones/Delete/5
        public ActionResult Delete(string id)
        {
            var arreglo = id.Replace("00011001001110102100101010011010101", ".").Split('.').ToArray();
            db.UDP_tbDirecciones_Delete(Convert.ToInt32(arreglo[0]));
            return RedirectToAction("Edit/"+ arreglo[1], "Clientes");
        }

        public JsonResult CargarDepartamentosEdit(int dire_ID)
        {
            var tbMunicipios = db.UDP_cargarMunicipioDeDirecciones(dire_ID).ToList();
            return Json(tbMunicipios, JsonRequestBehavior.AllowGet);
        }

        public JsonResult SelectedMunicipio(int dire_ID)
        {
            var tbMunicipios = db.UDP_cargarMunicipioDeDirecciones(dire_ID).ToList();
            return Json(tbMunicipios, JsonRequestBehavior.AllowGet);
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
