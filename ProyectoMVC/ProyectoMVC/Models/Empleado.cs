using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{
    [MetadataType(typeof(tbEmpleadosMetaData))]

    public partial class tbEmpleados
    {
    }

    public class tbEmpleadosMetaData
    {
        [Display(Name = "ID")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int emp_Id { get; set; }
        [Display(Name = "Nombre")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string emp_Nombre { get; set; }
        [Display(Name = "Apellido")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string emp_Apellido { get; set; }
        [Display(Name = "Sexo")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string emp_Sexo { get; set; }
        [Display(Name = "Municipio")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string mun_Id { get; set; }
        [Display(Name = "Direccion Exacta")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string emp_DireccionExacta { get; set; }
        [Display(Name = "Estado Civil")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string estciv_Id { get; set; }
        [Display(Name = "Telefono")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string emp_Telefono { get; set; }
        [Display(Name = "Correo")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string emp_CorreoElectronico { get; set; }
        [Display(Name = "Fecha Nacimiento")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public System.DateTime emp_FechaNacimiento { get; set; }
        [Display(Name = "Fecha Contratacion")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public System.DateTime emp_FechaContratacion { get; set; }
        [Display(Name = "Cargo")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int car_Id { get; set; }
        [Display(Name = "Fecha Creacion")]
        public System.DateTime emp_FechaCreacion { get; set; }
        [Display(Name = "Usuario Creacion")]
        public int emp_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha Modificacion")]
        public Nullable<System.DateTime> emp_FechaModificacion { get; set; }
        [Display(Name = "Usuario Modificacion")]
        public Nullable<int> emp_UsuarioModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool emp_Estado { get; set; }
    }

}