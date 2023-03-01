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
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
            var tbMunicipios = db.tbMunicipios.Include(t => t.tbDepartamentos).Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Where(t => t.mun_Estado == true );
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
        //public ActionResult Create()
        //{
        //    ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
        //    ViewBag.mun_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
        //    ViewBag.mun_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");

            

        //    return View();
        //}

        // POST: Municipios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
       
        public ActionResult Create(string txtIdM, string txtMunicipio, [Bind(Include = "mun_Id,dep_Id,mun_Nombre,mun_FechaCreacion,mun_UsuarioCreacion,mun_FechaModificacion,mun_UsuarioModificacion,mun_Estado")] tbMunicipios tbMunicipios)
        {
            if (ModelState.IsValid)
            {
                db.UDP_tbMunicipiosInsert(tbMunicipios.dep_Id, txtIdM, txtMunicipio, 1);
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
        public ActionResult Edit([Bind(Include = "mun_Id,dep_Id,mun_Nombre,mun_FechaCreacion,mun_UsuarioCreacion,mun_FechaModificacion,mun_UsuarioModificacion,mun_Estado")] tbMunicipios tbMunicipios)
        {
            if (ModelState.IsValid)
            {
                db.UDP_tbMunicipiosUpdate(tbMunicipios.mun_Id, tbMunicipios.dep_Id, tbMunicipios.mun_Nombre, 1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre", tbMunicipios.dep_Id);
            ViewBag.mun_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbMunicipios.mun_UsuarioCreacion);
            ViewBag.mun_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbMunicipios.mun_UsuarioModificacion);
            return View(tbMunicipios);
        }

        public ActionResult Delete(string id)
        {
            var tbMunicipios = db.tbMunicipios.Where(t => t.mun_Id == id).FirstOrDefault();
            return PartialView("_ModalesMunicipiosView", tbMunicipios);
        }

        public ActionResult DeleteConfirm([Bind(Include = "mun_Id,dep_Id,mun_Nombre,mun_FechaCreacion,mun_UsuarioCreacion,mun_FechaModificacion,mun_UsuarioModificacion,mun_Estado")] tbMunicipios tbMunicipios)
        {
            db.UDP_tbMunicipiosDelete(tbMunicipios.mun_Id);
            db.SaveChanges();
            return RedirectToAction("Index", "Categorias");
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
