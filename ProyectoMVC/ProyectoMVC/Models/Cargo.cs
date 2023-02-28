using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{
    [MetadataType(typeof(tbCargosMetaData))]

    public partial class tbCargos
    {
    }

    public class tbCargosMetaData
    {

        [Display(Name = "Cargo id")]
        public int car_Id { get; set; }

        [Display(Name = "Nombre de cargo ")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string car_Nombre { get; set; }
        [Display(Name = "Usuario Creacion")]
        public int car_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha Modificacion ")]
        public Nullable<System.DateTime> car_FechaModificacion { get; set; }
        [Display(Name = "Usuario Modificacion ")]
        public Nullable<int> car_UsuarioModificacion { get; set; }
        [Display(Name = "Estado ")]
        public bool car_Estado { get; set; }
    }

}