using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{

    [MetadataType(typeof(tbClientesMetaData))]

    public partial class tbClientes
    {
    }

    public class tbClientesMetaData
    {
        [Display(Name = "Id")]
        public int cli_Id { get; set; }
        [Display(Name = "Nombres")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string cli_Nombre { get; set; }
        [Display(Name = "Apellidos")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string cli_Apellido { get; set; }
        [Display(Name = "Telefono")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string cli_Telefono { get; set; }
        [Display(Name = "Correo Electronico")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string cli_CorreoElectronico { get; set; }
        [Display(Name = "Saldo")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public decimal cli_saldo { get; set; }
        [Display(Name = "Limite crediticio")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public decimal cli_LimiteCredito { get; set; }
        [Display(Name = "Descuento")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public decimal cli_Descuento { get; set; }
        [Display(Name = "Estado")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public bool cli_Estado { get; set; }
    }
}