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
    public class DepartamentosController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Departamentos
        public ActionResult Index()
        {
            var tbDepartamentos = db.tbDepartamentos.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Where(t => t.dep_Estado == true);
            return View(tbDepartamentos.ToList());
        }

        // GET: Departamentos/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbDepartamentos tbDepartamentos = db.tbDepartamentos.Find(id);
            if (tbDepartamentos == null)
            {
                return HttpNotFound();
            }
            return View(tbDepartamentos);
        }

        // GET: Departamentos/Create
        //public ActionResult Create()
        //{
        //    ViewBag.dep_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
        //    ViewBag.dep_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
        //    return View();
        //}

        // POST: Departamentos/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        public ActionResult Create(string txtIdDepartamento, string txtDepartamento)
        {
            try
            {
                if (!String.IsNullOrEmpty(txtIdDepartamento) && !String.IsNullOrEmpty(txtDepartamento))
                {
                    db.UDP_tbDepartamentos_Insert(txtIdDepartamento, txtDepartamento, 1);
                    return RedirectToAction("Index", "Departamentos");
                }
                else
                {
                    ModelState.AddModelError("CategoriaVacia", "El campo es vacio mi Rey ♛");
                }

            }
            catch (Exception)
            {

                return RedirectToAction("Index", "Departamentos");
            }




            return View();
        }

        // GET: Departamentos/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbDepartamentos tbDepartamentos = db.tbDepartamentos.Find(id);
            if (tbDepartamentos == null)
            {
                return HttpNotFound();
            }
            ViewBag.dep_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioCreacion);
            ViewBag.dep_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioModificacion);
            return View(tbDepartamentos);
        }

        // POST: Departamentos/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]

        public ActionResult Editt([Bind(Include = "dep_Id,dep_Nombre,dep_FechaCreacion,dep_UsuarioCreacion,dep_FechaModificacion,dep_UsuarioModificacion,dep_Estado")] tbDepartamentos tbDepartamentos)
        {
            try
            {
                if (!String.IsNullOrEmpty(tbDepartamentos.dep_Id) && !String.IsNullOrEmpty(tbDepartamentos.dep_Nombre))
                {
                    db.UDP_tbDepartamentos_Update(tbDepartamentos.dep_Id, tbDepartamentos.dep_Nombre, 1);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Departamentos");
                }
            }
            catch (Exception)
            {

                return RedirectToAction("Index", "Departamentos");
            }


            ViewBag.dep_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioCreacion);
            ViewBag.dep_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbDepartamentos.dep_UsuarioModificacion);
            return View(tbDepartamentos);
        }

        public ActionResult Delete(string id)
        {
            var tbDepartamentos = db.tbDepartamentos.Where(t => t.dep_Id == id).FirstOrDefault();
            return PartialView("_ModalesDepartamentosView", tbDepartamentos);
        }

        public ActionResult DeleteConfirm([Bind(Include = "dep_Id,dep_Nombre,dep_FechaCreacion,dep_UsuarioCreacion,dep_FechaModificacion,dep_UsuarioModificacion,dep_Estado")] tbDepartamentos tbDepartamentos)
        {
            db.UDP_tbDepartamentos_Delete(tbDepartamentos.dep_Id); 
            db.SaveChanges();
            return RedirectToAction("Index", "Departamentos");
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
