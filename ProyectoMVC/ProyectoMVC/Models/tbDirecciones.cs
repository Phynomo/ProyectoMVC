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
    
    public partial class tbDirecciones
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbDirecciones()
        {
            this.tbPedidos = new HashSet<tbPedidos>();
        }
    
        public int dire_ID { get; set; }
        public string mun_Id { get; set; }
        public string dire_Calle { get; set; }
        public string dire_Comuna { get; set; }
        public Nullable<int> cli_Id { get; set; }
        public System.DateTime dire_FechaCreacion { get; set; }
        public int dire_UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> dire_FechaModificacion { get; set; }
        public Nullable<int> dire_UsuarioModificacion { get; set; }
        public bool dire_Estado { get; set; }
    
        public virtual tbClientes tbClientes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbPedidos> tbPedidos { get; set; }
        public virtual tbMunicipios tbMunicipios { get; set; }
        public virtual tbUsuarios tbUsuarios { get; set; }
        public virtual tbUsuarios tbUsuarios1 { get; set; }
    }
}
