using ProyectoMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoMVC.Controllers
{
    public class LoginController : Controller
    {
        dbPedidosEncargosEntities db = new dbPedidosEncargosEntities();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(string txtUsuario, string txtClave)
        {
            if (txtUsuario == "" || txtClave == "")
            {
                if (txtUsuario == "")
                {
                    ModelState.AddModelError("validarUsuario", "El campo usuario es necesario");
                }

                if (txtClave == "")
                {
                    ModelState.AddModelError("validarClave", "El campo contraseña es necesario");
                }

            }
            else
            {
                var login = db.UDP_LoginDefinitivo100RealPAPA(txtUsuario.ToString(), txtClave.ToString()).ToList();


                if (login.Count() > 0)
                {

                    foreach (var item in login)
                    {
                        Session["Nombre"] = item.emp_Nombre.ToString();
                        Session["UsuarioId"] = item.usu_Id.ToString();
                        Session["rol"] = item.rol_Id.ToString();
                        Session["rolNombre"] = item.rol_Nombre.ToString();
                    }

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("Validacion", "Usuario o contraseña incorrectos");
                }
            }

            return View();

        }


        ///////////////////
        public ActionResult Recuperar(string txtRUsuario, string txtRClave)
        {
            if (txtRUsuario == "" || txtRClave == "")
            {
                if (txtRUsuario == "")
                {
                    ModelState.AddModelError("RvalidarUsuario", "El campo usuario es necesario");
                }

                if (txtRClave == "")
                {
                    ModelState.AddModelError("RvalidarClave", "El campo contraseña es necesario");
                }

            }
            else
            {

                db.UDP_RecuperarContrasenia(txtRUsuario.ToString(), txtRClave.ToString());

                return RedirectToAction("Index", "Login");
            }
            //    else
            //{
            //    ModelState.AddModelError("RValidacion", "Usuario o contraseña incorrectos");
            //}

            return PartialView("_loginModal");
        }


    }




}