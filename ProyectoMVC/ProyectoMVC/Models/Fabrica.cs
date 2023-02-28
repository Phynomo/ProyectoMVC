using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{
    [MetadataType(typeof(tbFabricasMetadata))]


    public partial class tbFabricas
    {

    }

    public class tbFabricasMetadata
    {
        [Display(Name = "Nombre")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string fab_Nombre { get; set; }

        [Display(Name = "Municipios")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string mun_Id { get; set; }

        [Display(Name = "DireccionExacta")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string fab_DireccionExacta { get; set; }

        [Display(Name = "Telefono")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string fab_Telefono { get; set; }
    }


}