//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProyectoMVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbEstadosCiviles
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbEstadosCiviles()
        {
            this.tbEmpleados = new HashSet<tbEmpleados>();
        }
    
        public string estciv_Id { get; set; }
        public string estciv_Nombre { get; set; }
        public System.DateTime estciv_FechaCreacion { get; set; }
        public int estciv_UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> estciv_FechaModificacion { get; set; }
        public Nullable<int> estciv_UsuarioModificacion { get; set; }
        public bool estciv_Estado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbEmpleados> tbEmpleados { get; set; }
        public virtual tbUsuarios tbUsuarios { get; set; }
        public virtual tbUsuarios tbUsuarios1 { get; set; }
    }
}
