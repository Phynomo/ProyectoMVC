using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{

    [MetadataType(typeof(tbUsuariosMetaData))]

    public partial class tbUsuarios
    {

    }

    public class tbUsuariosMetaData
    {
        [Display(Name = "Usuario")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string usu_Usuario { get; set; }
        [Display(Name = "Contraseña")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string usu_Contrasenia { get; set; }
        [Display(Name = "Empleado")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int emp_Id { get; set; }
        [Display(Name = "Rol")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int rol_id { get; set; }

        [Display(Name = "Estado")]
        public bool usu_Estado { get; set; }

    }

}