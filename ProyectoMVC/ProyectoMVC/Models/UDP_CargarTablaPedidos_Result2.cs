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
    
    public partial class UDP_CargarTablaPedidos_Result2
    {
        public int ped_Id { get; set; }
        public string art_Nombre { get; set; }
        public string pede_Cantidad { get; set; }
        public int cantidad { get; set; }
        public int pede_Id { get; set; }
        public decimal pede_Precio { get; set; }
        public System.DateTime pede_FechaCreacion { get; set; }
        public int pede_UsuarioCreacion { get; set; }
        public Nullable<System.DateTime> pede_FechaModificacion { get; set; }
        public int pede_UsuarioModificacion { get; set; }
        public bool pede_Estado { get; set; }
    }
}