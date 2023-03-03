using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{
    [MetadataType(typeof(tbEstadosCivilesMetaData))]
    public partial class tbEstadosCiviles
    {
    }

    public class tbEstadosCivilesMetaData
    {

        [Display(Name = "ID")]
        public string estciv_Id { get; set; }
        [Display(Name = "Estado Civil ")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string estciv_Nombre { get; set; }
        [Display(Name = "Fecha Creacion")]
        public System.DateTime estciv_FechaCreacion { get; set; }
        [Display(Name = "Usuario Creacion ")]
        public int estciv_UsuarioCreacion { get; set; }
        [Display(Name = "Fecha Modificacion")]
        public Nullable<System.DateTime> estciv_FechaModificacion { get; set; }
        [Display(Name = "Usuario Modificacion ")]
        public Nullable<int> estciv_UsuarioModificacion { get; set; }
        [Display(Name = "Estado ")]
        public bool estciv_Estado { get; set; }
    }


}