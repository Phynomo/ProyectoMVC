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
    public class PedidosDetallesController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: PedidosDetalles
        public ActionResult Index()
        {
            var tbPedidosDetalles = db.tbPedidosDetalles.Include(t => t.tbArticulos).Include(t => t.tbPedidos).Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1);
            return View(tbPedidosDetalles.ToList());
        }

        // GET: PedidosDetalles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbPedidosDetalles tbPedidosDetalles = db.tbPedidosDetalles.Find(id);
            if (tbPedidosDetalles == null)
            {
                return HttpNotFound();
            }
            return View(tbPedidosDetalles);
        }

        // GET: PedidosDetalles/Create
        public ActionResult Create()
        {
            ViewBag.art_Id = new SelectList(db.tbArticulos, "art_Id", "art_Nombre");
            ViewBag.ped_Id = new SelectList(db.tbPedidos, "ped_Id", "metpago_Id");
            ViewBag.pede_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            ViewBag.pede_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario");
            return View();
        }

        // POST: PedidosDetalles/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "pede_Id,ped_Id,art_Id,pede_Cantidad,pede_Precio,pede_FechaCreacion,pede_UsuarioCreacion,pede_FechaModificacion,pede_UsuarioModificacion,pede_Estado")] tbPedidosDetalles tbPedidosDetalles)
        {
            if (ModelState.IsValid)
            {
                db.tbPedidosDetalles.Add(tbPedidosDetalles);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.art_Id = new SelectList(db.tbArticulos, "art_Id", "art_Nombre", tbPedidosDetalles.art_Id);
            ViewBag.ped_Id = new SelectList(db.tbPedidos, "ped_Id", "metpago_Id", tbPedidosDetalles.ped_Id);
            ViewBag.pede_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbPedidosDetalles.pede_UsuarioCreacion);
            ViewBag.pede_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbPedidosDetalles.pede_UsuarioModificacion);
            return View(tbPedidosDetalles);
        }

        // GET: PedidosDetalles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbPedidosDetalles tbPedidosDetalles = db.tbPedidosDetalles.Find(id);
            if (tbPedidosDetalles == null)
            {
                return HttpNotFound();
            }
            ViewBag.art_Id = new SelectList(db.tbArticulos, "art_Id", "art_Nombre", tbPedidosDetalles.art_Id);
            ViewBag.ped_Id = new SelectList(db.tbPedidos, "ped_Id", "metpago_Id", tbPedidosDetalles.ped_Id);
            ViewBag.pede_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbPedidosDetalles.pede_UsuarioCreacion);
            ViewBag.pede_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbPedidosDetalles.pede_UsuarioModificacion);
            return View(tbPedidosDetalles);
        }

        // POST: PedidosDetalles/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "pede_Id,ped_Id,art_Id,pede_Cantidad,pede_Precio,pede_FechaCreacion,pede_UsuarioCreacion,pede_FechaModificacion,pede_UsuarioModificacion,pede_Estado")] tbPedidosDetalles tbPedidosDetalles)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbPedidosDetalles).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.art_Id = new SelectList(db.tbArticulos, "art_Id", "art_Nombre", tbPedidosDetalles.art_Id);
            ViewBag.ped_Id = new SelectList(db.tbPedidos, "ped_Id", "metpago_Id", tbPedidosDetalles.ped_Id);
            ViewBag.pede_UsuarioCreacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbPedidosDetalles.pede_UsuarioCreacion);
            ViewBag.pede_UsuarioModificacion = new SelectList(db.tbUsuarios, "usu_Id", "usu_Usuario", tbPedidosDetalles.pede_UsuarioModificacion);
            return View(tbPedidosDetalles);
        }

        // GET: PedidosDetalles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbPedidosDetalles tbPedidosDetalles = db.tbPedidosDetalles.Find(id);
            if (tbPedidosDetalles == null)
            {
                return HttpNotFound();
            }
            return View(tbPedidosDetalles);
        }

        // POST: PedidosDetalles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tbPedidosDetalles tbPedidosDetalles = db.tbPedidosDetalles.Find(id);
            db.tbPedidosDetalles.Remove(tbPedidosDetalles);
            db.SaveChanges();
            return RedirectToAction("Index");
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
