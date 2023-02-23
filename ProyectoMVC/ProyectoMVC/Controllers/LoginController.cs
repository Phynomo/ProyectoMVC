using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoMVC.Controllers
{
    public class LoginController : Controller
    {
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
                if(txtUsuario == "")
                {
                    ModelState.AddModelError("validarUsuario", "El campo usuario es necesario");
                }

                if(txtClave == "")
                {
                    ModelState.AddModelError("validarClave", "El campo contraseña es necesario");
                }

            }
            else
            {

                var login = dbo.UDP_Login(txtUsuario, txtClave).toList();

                if (login > 0)
                {
                    return RedirectToAction("pagina");
                }
                else
                {
                    ModelState.AddModelError("Validacion", "Usuario o contraseña incorrectos");
                }
            }

            return View();

        }


        public string pagina()
        {

            return "Aqui va una paguina principal mi rey";

        }




    }
}