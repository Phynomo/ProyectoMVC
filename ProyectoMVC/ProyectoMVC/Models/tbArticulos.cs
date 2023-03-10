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
    
    public partial class tbArticulos
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbArticulos()
        {
            this.tbPedidosDetalles = new HashSet<tbPedidosDetalles>();
        }
    
        public int art_Id { get; set; }
        public string art_Nombre { get; set; }
        public decimal art_Precio { get; set; }
        public int cat_Id { get; set; }
        public int art_Stock { get; set; }
        public Nullable<int> fab_id { get; set; }
        public System.DateTime art_FechaCreacion { get; set; }
        public int art_UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> art_FechaModificacion { get; set; }
        public Nullable<int> art_UsuarioModificacion { get; set; }
        public bool art_Estado { get; set; }
    
        public virtual tbUsuarios tbUsuarios { get; set; }
        public virtual tbUsuarios tbUsuarios1 { get; set; }
        public virtual tbCategoria tbCategoria { get; set; }
        public virtual tbFabricas tbFabricas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbPedidosDetalles> tbPedidosDetalles { get; set; }
    }
}
