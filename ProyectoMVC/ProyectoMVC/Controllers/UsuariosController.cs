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
    public class UsuariosController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Usuarios
        public ActionResult Index()
        {
            var tbUsuarios = db.tbUsuarios.Include(t => t.tbEmpleados2).Include(t => t.tbUsuarios2).Include(t => t.tbUsuarios3).Include(t => t.tbRoles2);
            var vista = db.VW_UsuariosIndex.ToList();
            return View(vista);
        }

        // GET: Usuarios/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbUsuarios tbUsuarios = db.tbUsuarios.Find(id);
            if (tbUsuarios == null)
            {
                return HttpNotFound();
            }
            return View(tbUsuarios);
        }

        // GET: Usuarios/Create
        public ActionResult Create()
        {
            ViewBag.emp_Id = new SelectList(db.tbEmpleados, "emp_Id", "emp_Nombre");
            ViewBag.usu_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.usu_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.rol_id = new SelectList(db.tbRoles, "rol_id", "rol_Nombre");
            return View();
        }

        // POST: Usuarios/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "usu_Id,usu_Usuario,usu_Contrasenia,emp_Id,usu_UsuarioCreacion,usu_FechaCreacion,usu_UsuarioModificacion,usu_FechaModificacion,usu_Estado,rol_id")] tbUsuarios tbUsuarios)
        {
            if (ModelState.IsValid)
            {
                //db.tbUsuarios.Add(tbUsuarios);
                db.UDP_InsertarUsuario(tbUsuarios.usu_Usuario, tbUsuarios.usu_Contrasenia, tbUsuarios.emp_Id, tbUsuarios.rol_id, 1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.emp_Id = new SelectList(db.tbEmpleados, "emp_Id", "emp_Nombre", tbUsuarios.emp_Id);
            ViewBag.usu_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbUsuarios.usu_UsuarioCreacion);
            ViewBag.usu_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbUsuarios.usu_UsuarioModificacion);
            ViewBag.rol_id = new SelectList(db.tbRoles, "rol_id", "rol_Nombre", tbUsuarios.rol_id);
            return View(tbUsuarios);
        }

        // GET: Usuarios/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbUsuarios tbUsuarios = db.tbUsuarios.Find(id);
            if (tbUsuarios == null)
            {
                return HttpNotFound();
            }
            ViewBag.emp_Id = new SelectList(db.tbEmpleados, "emp_Id", "emp_Nombre", tbUsuarios.emp_Id);
            ViewBag.usu_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbUsuarios.usu_UsuarioCreacion);
            ViewBag.usu_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbUsuarios.usu_UsuarioModificacion);
            ViewBag.rol_id = new SelectList(db.tbRoles, "rol_id", "rol_Nombre", tbUsuarios.rol_id);
            return View(tbUsuarios);
        }

        // POST: Usuarios/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "usu_Id,usu_Usuario,usu_Contrasenia,emp_Id,usu_UsuarioCreacion,usu_FechaCreacion,usu_UsuarioModificacion,usu_FechaModificacion,usu_Estado,rol_id")] tbUsuarios tbUsuarios)
        {
            ModelState.Remove("usu_Usuario");
            ModelState.Remove("usu_Contrasenia");
            if (ModelState.IsValid)
            {
                //db.Entry(tbUsuarios).State = EntityState.Modified;
                db.UDP_EdicionUsuario(tbUsuarios.usu_Id,tbUsuarios.emp_Id,tbUsuarios.rol_id,1);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.emp_Id = new SelectList(db.tbEmpleados, "emp_Id", "emp_Nombre", tbUsuarios.emp_Id);
            ViewBag.usu_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbUsuarios.usu_UsuarioCreacion);
            ViewBag.usu_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbUsuarios.usu_UsuarioModificacion);
            ViewBag.rol_id = new SelectList(db.tbRoles, "rol_id", "rol_Nombre", tbUsuarios.rol_id);
            return View(tbUsuarios);
        }

        // GET: Usuarios/Delete/5


        public ActionResult Delete(int id)
        {
            db.UDP_BorrarUsuario(id);
            return RedirectToAction("Index");
        }




        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    tbUsuarios tbUsuarios = db.tbUsuarios.Find(id);
        //    if (tbUsuarios == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(tbUsuarios);
        //}

        //// POST: Usuarios/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    tbUsuarios tbUsuarios = db.tbUsuarios.Find(id);
        //    db.tbUsuarios.Remove(tbUsuarios);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
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
