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
    public class EmpleadosController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Empleados
        public ActionResult Index()
        {
            var tbEmpleados = db.tbEmpleados.Include(t => t.tbCargos).Include(t => t.tbEstadosCiviles).Include(t => t.tbMunicipios).Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Where(x => x.emp_Estado == true);
            return View(tbEmpleados.ToList());
        }

        // GET: Empleados/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbEmpleados tbEmpleados = db.tbEmpleados.Find(id);
            if (tbEmpleados == null)
            {
                return HttpNotFound();
            }
            return View(tbEmpleados);
        }

        // GET: Empleados/Create
        public ActionResult Create()
        {
            ViewBag.car_Id = new SelectList(db.tbCargos, "car_Id", "car_Nombre");
            ViewBag.estciv_Id = new SelectList(db.tbEstadosCiviles, "estciv_Id", "estciv_Nombre");
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
            ViewBag.emp_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.emp_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            return View();
        }

        // POST: Empleados/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "emp_Id,emp_Nombre,emp_Apellido,emp_Sexo,mun_Id,emp_DireccionExacta,estciv_Id,emp_Telefono,emp_CorreoElectronico,emp_FechaNacimiento,emp_FechaContratacion,car_Id,emp_FechaCreacion,emp_UsuarioCreacion,emp_FechaModificacion,emp_UsuarioModificacion,emp_Estado")] tbEmpleados tbEmpleados)
        {
            if (ModelState.IsValid)
            {
                db.UDP_tbEmpleados_Insert(tbEmpleados.emp_Nombre, tbEmpleados.emp_Apellido, tbEmpleados.emp_Sexo,
                    tbEmpleados.mun_Id, tbEmpleados.emp_DireccionExacta, tbEmpleados.estciv_Id, tbEmpleados.emp_Telefono,
                    tbEmpleados.emp_CorreoElectronico, tbEmpleados.emp_FechaNacimiento.ToString(), tbEmpleados.emp_FechaContratacion.ToString(), tbEmpleados.car_Id.ToString(), 1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.car_Id = new SelectList(db.tbCargos, "car_Id", "car_Nombre", tbEmpleados.car_Id);
            ViewBag.estciv_Id = new SelectList(db.tbEstadosCiviles, "estciv_Id", "estciv_Nombre", tbEmpleados.estciv_Id);
            //ViewBag.dep_Id = new SelectList(db.tbMunicipios, "mun_Id", "mun_Nombre", tbEmpleados.mun_Id);
            ViewBag.emp_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbEmpleados.emp_UsuarioCreacion);
            ViewBag.emp_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbEmpleados.emp_UsuarioModificacion);
            return View(tbEmpleados);
        }

        // GET: Empleados/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbEmpleados tbEmpleados = db.tbEmpleados.Find(id);
            if (tbEmpleados == null)
            {
                return HttpNotFound();
            }
            ViewBag.car_Id = new SelectList(db.tbCargos, "car_Id", "car_Nombre", tbEmpleados.car_Id);
            ViewBag.estciv_Id = new SelectList(db.tbEstadosCiviles, "estciv_Id", "estciv_Nombre", tbEmpleados.estciv_Id);
            ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre");
            //ViewBag.dep_Id = new SelectList(db.tbDepartamentos, "dep_Id", "dep_Nombre", tbMunicipios.dep_Id);
            //ViewBag.mun_Id = new SelectList(db.tbMunicipios, "mun_Id", "mun_Nombre", tbEmpleados.mun_Id);
            ViewBag.emp_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbEmpleados.emp_UsuarioCreacion);
            ViewBag.emp_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbEmpleados.emp_UsuarioModificacion);
            return View(tbEmpleados);
        }

        // POST: Empleados/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "emp_Id,emp_Nombre,emp_Apellido,emp_Sexo,mun_Id,emp_DireccionExacta,estciv_Id,emp_Telefono,emp_CorreoElectronico,emp_FechaNacimiento,emp_FechaContratacion,car_Id,emp_FechaCreacion,emp_UsuarioCreacion,emp_FechaModificacion,emp_UsuarioModificacion,emp_Estado")] tbEmpleados tbEmpleados)
        {
            if (ModelState.IsValid)
            {
                db.UDP_tbEmpleados_Update(tbEmpleados.emp_Id, tbEmpleados.emp_Nombre, tbEmpleados.emp_Apellido, tbEmpleados.emp_Sexo, tbEmpleados.mun_Id, tbEmpleados.emp_DireccionExacta
                    , tbEmpleados.estciv_Id, tbEmpleados.emp_Telefono, tbEmpleados.emp_CorreoElectronico, tbEmpleados.emp_FechaNacimiento.ToString(), tbEmpleados.emp_FechaContratacion.ToString(),
                    tbEmpleados.car_Id.ToString(), 1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.car_Id = new SelectList(db.tbCargos, "car_Id", "car_Nombre", tbEmpleados.car_Id);
            ViewBag.estciv_Id = new SelectList(db.tbEstadosCiviles, "estciv_Id", "estciv_Nombre", tbEmpleados.estciv_Id);
            //ViewBag.mun_Id = new SelectList(db.tbMunicipios, "mun_Id", "mun_Nombre", tbEmpleados.mun_Id);
            ViewBag.emp_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbEmpleados.emp_UsuarioCreacion);
            ViewBag.emp_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbEmpleados.emp_UsuarioModificacion);
            return View(tbEmpleados);
        }

        // GET: Empleados/Delete/5
        public ActionResult Delete(int id)
        {
            db.UDP_tbEmpleados_Delete(id);
            return RedirectToAction("Index");
        }


        public ActionResult DeleteConfirm([Bind(Include = "cat_Id,cat_Descripcion,cat_FechaCreacion,cat_UsuarioCreacion,cat_FechaModificacion,cat_UsuarioModificacion,cat_Estado")] tbCategoria tbCategoria)
        {
            db.UDP_tbCategorias_Delete(tbCategoria.cat_Id);
            db.SaveChanges();
            return RedirectToAction("Index", "Categorias");
        }

        public JsonResult CargarMunicipios(string dep_Id)
        {
            var ddlMuni = db.UDP_CargarMunicipios(dep_Id).ToList();
            return Json(ddlMuni, JsonRequestBehavior.AllowGet);
        }

        public JsonResult CargarTodoMunicipio()
        {
            var tbMunicipios = db.UDP_CargarTodoMunicipio().ToList();
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
