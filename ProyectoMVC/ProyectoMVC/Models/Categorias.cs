using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{
    [MetadataType(typeof(tbCategoria))]

    public partial class tbCategoria
    {
        
    }

    public class tbCategoriaMetaData
    {
        [Display(Name = "Nombre de la categoria")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string cat_Descripcion { get; set; }
    }
}