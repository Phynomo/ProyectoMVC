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
    public class CategoriasController : Controller
    {
        private dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();

        // GET: Categorias
        public ActionResult Index()
        {
            var tbCategoria = db.tbCategoria.Include(t => t.tbUsuarios).Include(t => t.tbUsuarios1).Where(t => t.cat_Estado == true);
            return View(tbCategoria.ToList());
        }

        [HttpPost]
        public ActionResult Create(string txtCategoria)
        {


            if (txtCategoria != "")
            {
                db.UDP_tbCategorias_Insert(txtCategoria, 1);
                return RedirectToAction("Index", "Categorias");
            }
            else
            {
                Response.Write("<script>");
                Response.Write("console.log('Campos Vacios Mi Rey');");
                Response.Write("alert('no T-T');");
                Response.Write("</script>");
                return RedirectToAction("Index", "Categorias");
                Response.Write("<script>");
                Response.Write("console.log('Campos Vacios Mi Rey');");
                Response.Write("alert('no T-T');");
                Response.Write("</script>");

            }
            

            return View();
        }


        public ActionResult Edit(int id)
        {
            var tbCategoria = db.tbCategoria.Where(t => t.cat_Id == id).FirstOrDefault();
            return PartialView("_EditCategoriasView", tbCategoria);
        }

        [HttpPost]
        public ActionResult Edit([Bind(Include = "cat_Id,cat_Descripcion,cat_FechaCreacion,cat_UsuarioCreacion,cat_FechaModificacion,cat_UsuarioModificacion,cat_Estado")] tbCategoria tbCategoria)
        {



            if (ModelState.IsValid) { 
                db.UDP_tbCategorias_Update(tbCategoria.cat_Id, tbCategoria.cat_Descripcion, 1);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Categorias");
            }

                return PartialView("_EditCategoriasView", tbCategoria);

          
        }

        public ActionResult Delete(int id)
        {
            var tbCategoria = db.tbCategoria.Where(t => t.cat_Id == id).FirstOrDefault();
            return PartialView("_DeleteCategoriasView", tbCategoria);
        }

        public ActionResult DeleteConfirm([Bind(Include = "cat_Id,cat_Descripcion,cat_FechaCreacion,cat_UsuarioCreacion,cat_FechaModificacion,cat_UsuarioModificacion,cat_Estado")] tbCategoria tbCategoria)
        {
            db.UDP_tbCategorias_Delete(tbCategoria.cat_Id);
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
