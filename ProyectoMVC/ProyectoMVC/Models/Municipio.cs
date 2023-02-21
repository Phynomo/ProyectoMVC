using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoMVC.Models
{

    [MetadataType(typeof(tbMunicipiosMetaData))]

    public partial class tbMunicipios
    {

    }

    public class tbMunicipiosMetaData
    {
        
        [Display(Name = "Id Municipio")]
        public string mun_Id { get; set; }
        [Display(Name = "Departamento")]
        public string dep_Id { get; set; }
        
        
        [Display(Name = "Municipio Nombre 20")]
        [Required(ErrorMessage = "El campo {0} es necesario!")]
        public string mun_Nombre { get; set; }
    }
}