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
    
    public partial class tbClientes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbClientes()
        {
            this.tbPedidos = new HashSet<tbPedidos>();
            this.tbDirecciones = new HashSet<tbDirecciones>();
        }
    
        public int cli_Id { get; set; }
        public string cli_Nombre { get; set; }
        public string cli_Apellido { get; set; }
        public string mun_Id { get; set; }
        public string cli_Telefono { get; set; }
        public string cli_CorreoElectronico { get; set; }
        public decimal cli_saldo { get; set; }
        public decimal cli_LimiteCredito { get; set; }
        public decimal cli_Descuento { get; set; }
        public System.DateTime cli_FechaCreacion { get; set; }
        public int cli_UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> cli_FechaModificacion { get; set; }
        public Nullable<int> cli_UsuarioModificacion { get; set; }
        public bool cli_Estado { get; set; }
    
        public virtual tbMunicipios tbMunicipios { get; set; }
        public virtual tbUsuarios tbUsuarios { get; set; }
        public virtual tbUsuarios tbUsuarios1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbPedidos> tbPedidos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbDirecciones> tbDirecciones { get; set; }
    }
}
