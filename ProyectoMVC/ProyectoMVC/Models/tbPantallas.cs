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
    
    public partial class tbPantallas
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbPantallas()
        {
            this.tbRolesXPantalla = new HashSet<tbRolesXPantalla>();
        }
    
        public int pan_id { get; set; }
        public string pan_Nombre { get; set; }
        public int pan_UsuarioCreacion { get; set; }
        public System.DateTime pan_FechaCreacion { get; set; }
        public Nullable<int> pan_UsuarioModificacion { get; set; }
        public Nullable<System.DateTime> pan_FechaModificacion { get; set; }
        public bool pan_Estado { get; set; }
    
        public virtual tbUsuarios tbUsuarios { get; set; }
        public virtual tbUsuarios tbUsuarios1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbRolesXPantalla> tbRolesXPantalla { get; set; }
    }
}
