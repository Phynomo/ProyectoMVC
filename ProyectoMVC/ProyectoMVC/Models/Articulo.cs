using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{

    [MetadataType(typeof(tbArticulosMetaData))]

    public partial class tbArticulos
    {
    }

    public class tbArticulosMetaData
    {
        [Display(Name = "Nombre")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string art_Nombre { get; set; }

        [Display(Name = "Precio")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public decimal art_Precio { get; set; }

        [Display(Name = "Categoria")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int cat_Id { get; set; }

        [Display(Name = "Cantidad de Articulos")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public int art_Stock { get; set; }

        [Display(Name = "Fabrica")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public Nullable<int> fab_id { get; set; }

    }

}