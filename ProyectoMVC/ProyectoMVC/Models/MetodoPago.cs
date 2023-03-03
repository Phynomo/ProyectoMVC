using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{

    [MetadataType(typeof(tbMetodoPagoMetaData))]
    public partial class tbMetodoPago
    {
    }

    public class tbMetodoPagoMetaData
    {

        [Display(Name = "ID")]
        public int metpago_Id { get; set; }
        [Display(Name = "Metodo de pago ")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string metpago_Descripcion { get; set; }
        [Display(Name = "Fecha Creacion ")]
        public System.DateTime metpago_FechaCreacion { get; set; }
        [Display(Name = "Usuario Creacion ")]
        public int metpago_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha Modificacion ")]
        public Nullable<System.DateTime> metpago_FechaModificacion { get; set; }
        [Display(Name = "Usuario Modificacion")]
        public Nullable<int> metpago_UsuarioModificacion { get; set; }
        [Display(Name = "Estado")]
        public bool metpago_Estado { get; set; }
    }

}